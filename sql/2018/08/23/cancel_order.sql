/**开启定时任务**/
set global event_scheduler =1;
/**选择数据库**/
USE museum;
-- ----------------------------
-- EVENT  for event_schedule
-- ----------------------------
DROP EVENT IF EXISTS event_cancel_order;
CREATE EVENT event_cancel_order
ON SCHEDULE EVERY 5 MINUTE STARTS NOW()
ON COMPLETION PRESERVE 
DO
CALL procedure_cancel_order();

-- ----------------------------
-- PROCEDURE  for procedure_cancel_order
-- ----------------------------
/**
*存储过程cancel_order
*修改过期的未支付订单为已取消
*/
DROP PROCEDURE IF EXISTS procedure_cancel_order;
CREATE PROCEDURE procedure_cancel_order() 
BEGIN
	DECLARE t_error INTEGER;
	DECLARE coupon_count INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;
	START TRANSACTION;

		/**还原日程访问人数**/
		UPDATE yu_schedule a INNER JOIN yu_order b ON b.schedule_id = a.id SET a.visitor_count = (cast(a.visitor_count as signed) - cast(b.visitor_count AS signed)),a.child_count = (cast(a.child_count as signed) - cast(b.child_count AS signed)),a.update_time =UNIX_TIMESTAMP(NOW()) WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800); 
		
		/**查询过期的未支付订单是否有折扣码**/
		SELECT count(id) INTO coupon_count FROM yu_order WHERE `status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(create_time as signed)>1800) AND coupon_id <>0; 
		
		/**判断有折扣代码的订单是否存在,如果存在还原折扣信息**/
		IF coupon_count>0 THEN

			/**删除折扣使用记录**/
			DELETE a FROM yu_user_coupon a INNER JOIN yu_order b ON b.coupon_id = a.coupon_id AND b.id = a.order_id WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800) AND b.coupon_id <>0; 
			
			/**还原过期未支付订单折扣码使用状态**/
			UPDATE yu_coupon a INNER JOIN yu_order b ON b.coupon_id = a.id SET a.`status` = 0,a.update_time =UNIX_TIMESTAMP(NOW()) WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800) AND b.coupon_id <>0; 
			
			
		END IF;
		
		/**清除订单使用折扣码编号**/
		UPDATE yu_order SET coupon_id = 0,`status` = 3,update_time =UNIX_TIMESTAMP(NOW())  WHERE `status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(create_time as signed)>1800); 
		
		IF t_error = 1 THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
END
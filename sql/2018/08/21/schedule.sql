/**开启定时任务**/
set global event_scheduler =1;
/**选择数据库**/
USE museum;
-- ----------------------------
-- EVENT  for event_schedule
-- ----------------------------
DROP EVENT IF EXISTS event_schedule;
CREATE EVENT event_schedule
ON SCHEDULE EVERY 1 DAY STARTS DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 DAY), INTERVAL 0 HOUR)
ON COMPLETION PRESERVE 
DO
CALL procedure_schedule();

-- ----------------------------
-- PROCEDURE  for procedure_schedule
-- ----------------------------
/**
*存储过程procedure_schedule
*日程表自动添加今日起算31天内日程数据
*/
DROP PROCEDURE IF EXISTS procedure_schedule;
CREATE PROCEDURE procedure_schedule() 
BEGIN
	declare i int;
	declare datetime int;
	/*这种写法也可以：DECLARE done INT DEFAULT FALSE;*/
	DECLARE done int default 0;  /*用于判断是否结束循环*/
	/*用于存储结果集的记录*/
	DECLARE w CHAR(20); 
	/*用于记录公众假期记录数*/
	DECLARE holiday int; 
	/*用于记录公众假期类型编号*/
	DECLARE types_id int; 
	/*用于记录非公众假期日程类型编号*/
	DECLARE week_id int;
	/*用于记录日程表当前日期记录数*/
	DECLARE schedules int; 
	
	/* 查询公众假期 星期*/
	SELECT id into types_id FROM yu_schedule_type where locate('7',week)>0;
	
	/**从今天起算31天内日程更新 循环开始*/
	set i = 0;
	
	while i < 31 do
				start transaction;

				/**设置日程表当前日期时间默认值*/
				set schedules = 0;
				/**设置是否公众假期默认值*/
				set holiday = 0;
				/**当前循环日期时间戳*/
				set datetime = UNIX_TIMESTAMP(DATE_FORMAT(date_add(now(), interval i day),'%Y-%m-%d'));

				/**查询当前日期是否是公众假期**/
				SELECT count(id) into holiday FROM yu_holiday WHERE UNIX_TIMESTAMP(FROM_UNIXTIME(date,'%Y-%m-%d')) = datetime;
				/**查询当前日期日程是否已经存在*/
				SELECT count(id) into schedules from yu_schedule where UNIX_TIMESTAMP(FROM_UNIXTIME(date,'%Y-%m-%d')) = datetime;

				

				/**
				*判断当前日期是否是公众假期
				*如果是公众假期 week 7 日程导入公众假期日程locate(substr,str)
				*如果不是公众假期 循环遍历日程类型 周日是0 看是否存在 存在则到日对应日程 不存在则不导入
				*/
				IF (holiday>0)
				THEN

					/**如果当前日期记录不存在插入记录并更新*/
					IF (schedules = 0)
					THEN
						INSERT INTO yu_schedule (date,start_time,end_time,language,max_visitor,max_child,sort,create_time,update_time) SELECT datetime,start_time,end_time,language,max_visitor,max_child,0,UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')),UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')) FROM yu_schedule_config WHERE type_id =types_id;
					END IF;

				ELSE
					
					/**设置非公众假期日程类型编号默认值*/
					set week_id = 0;
					/**查询非公众假期日程类型编号**/
					SELECT id into week_id FROM yu_schedule_type where locate(FROM_UNIXTIME(datetime,'%w'),week)>0;

					/**判断当前日期是否设置了日程类型,如果存在日程类型根据日程类型更新数据*/
					IF (week_id>0)
					THEN
						
						/**如果当前日期记录不存在插入记录并更新,存在记录但是不全更新记录*/
						IF (schedules = 0)
						THEN
							INSERT INTO yu_schedule (date,start_time,end_time,language,max_visitor,max_child,sort,create_time,update_time) SELECT datetime,start_time,end_time,language,max_visitor,max_child,0,UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')),UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')) FROM yu_schedule_config WHERE type_id =week_id;
						END IF;

					END if;

				END if;

				commit;
	set i = i +1;
	end while;
	/**从今天起算31天内日程更新 循环结束*/
END
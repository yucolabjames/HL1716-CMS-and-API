<?php
namespace app\api\controller;
use think\Config;
use think\Input;
use think\Db;
use clt\Leftnav;
use think\Request;
use think\Controller;

class Common extends Controller{

    public function _initialize(){
        #图片访问域名
        $this->upload_host = $this->request->domain().'/public/';
        //获取json请求数据
       	$this->json_data = get_JsonData();
        //设置默认日期时间戳
        $this->unixtime = strtotime(date('1970-01-01')); 
    }

        /**
     * 更新未支付过期订单为已取消
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23T16:43:49+0800
     * @return     
     */
    protected function order_cancel(){

        //查询已过期未支付订单
        $where_expired['status'] = 0;
        $where_expired['create_time'] = array('elt',(time()-30*60));
        $orders = db('order')->where($where_expired)->select();

        if(count($orders)>0){
            //如果存在过期订单执行取消操作
            //开始更新订单预定时间事务
            Db::startTrans();
            try{
                
                //循环遍历过期未支付订单
                foreach ($orders as $key => $value) {
                    //订单原有日程订票数量还原
                    if(!empty($value['visitor_count'])){
                        Db::table('yu_schedule')->where('id',$value['schedule_id'])->setDec('visitor_count',$value['visitor_count']);
                    }
                    if(!empty($value['child_count'])){
                        Db::table('yu_schedule')->where('id',$value['schedule_id'])->setDec('child_count',$value['child_count']);
                    }

                    //还原优惠券
                    if(!empty($value['coupon_id'])){

                        //删除订单折扣券使用数据
                        $where_user['coupon_id'] = $value['coupon_id'];
                        $where_user['order_id'] = $value['order_id'];
                        Db::table('yu_user_coupon')->where($where_user)->delete();

                        //更新折扣券使用状态
                        $coupon_data['status'] = 0;
                        Db::table('yu_coupon')->where('id',$value['coupon_id'])->update($coupon_data);
                    }

                    //更新订单状态
                    $order_data['coupon_id'] = 0;
                    $order_data['status'] = 3;
                    Db::table('yu_order')->where('id',$value['id'])->update($order_data);
                }

                // 提交事务
                Db::commit();
                
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                log_result("30 minutes cancel order err:".$e->getMessage());
            } 
        }
       
    }

}
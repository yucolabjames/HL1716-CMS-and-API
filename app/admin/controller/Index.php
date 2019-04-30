<?php
// +----------------------------------------------------------------------
// | YUCOLAB [ HONG KONG MUSEUM ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 https://www.hl1716.yucolab.com All rights reserved.
// +----------------------------------------------------------------------
// | Base on ( ThinkPHP 5.0 http://thinkphp.cn)
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: gyj <375023402@qq.com>
// +----------------------------------------------------------------------
// | CreateTime: 2018-08-23 17:52:20
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
class Index extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23 17:52:32
     */
	public function __construct()
    {
        parent::__construct();

        //实例化订单数据库
        $this->dao       = db('order');
        //实例化日程数据库
        $this->dao_schedule       = db('schedule');

        //取消已过期未支付订单
        $this->order_cancel();


    }


    /**
     * 预定统计
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23 17:57:43
     * @return     
     */
    public function index(){

        //判断请求类型
        if($this->request->isPost()){
           
            
            $type = $_POST['type']?$_POST['type']:-1;
            //查询数据类型 -1 所有 1月统计查询 2日统计查询 3日程查询
            if(empty($type)){
                return api_arr(1,"Lack of parameters of type");
            }

            /**今日统计查询 开始**/
            if($type == -1){
                /**今日访客数、订单支付金额、订单折扣金额、订单数 查询 开始**/
                    //今日查询条件
                    $order_today['create_time'] = array(array('egt',strtotime(date('Y-m-d 00:00:00',time()))),array('elt',strtotime(date('Y-m-d 23:59:59',time()))));
                    $visitor_today['date'] = array(array('egt',strtotime(date('Y-m-d 00:00:00',time()))),array('elt',strtotime(date('Y-m-d 23:59:59',time()))));

                    

                    //今日访客数量
                    $statistics['visitor_today'] = $this->dao_schedule->where($visitor_today)->sum('visitor_count+child_count');

                    //今日订单实际支付总金额
                    $order_today['status'] = array(array('neq',0),array('neq',2));
                    $statistics['pay_total'] = $this->dao->where($order_today)->sum('pay');

                    //今日订单折扣总金额
                    $statistics['discount_total'] = $this->dao->where($order_today)->sum('discount');
                    unset($order_today['status']);

                    //今日订单总数
                    $statistics['order_count'] = $this->dao->where($order_today)->count();

                    unset($visitor_today,$order_today);
                /**今日访客数、订单支付金额、订单折扣金额、订单数 查询 开始**/

                /**查询今日起最近30天订票情况 开始**/
                    //查询今日起最近30内游客和管理员订票数
                    $where_future['a.date'] = array(array('egt',strtotime(date('Y-m-d'))),array('elt',strtotime(date('Y-m-d').'+30 day')));
                    $future = $this->dao_schedule->alias('a')
                                                    ->join('yu_order b','b.schedule_id = a.id','left')
                                                    ->group('a.date')
                                                    ->where($where_future)
                                                    ->field('a.date,sum(a.visitor_count+a.child_count) as visitor_count')
                                                    ->select();
                    $where_future['b.admin_id'] = array('neq',0);
                    $future_admin = $this->dao_schedule->alias('a')
                                                    ->join('yu_order b','b.schedule_id = a.id','left')
                                                    ->group('a.date')
                                                    ->where($where_future)
                                                    ->field('a.date,sum(a.visitor_count+a.child_count) as visitor_count')
                                                    ->select();
                    unset($where_future);
                    //循环遍历未来31天内预定数据,并进行整理
                    foreach ($future as $key => $value) {
                        $fut = $value;
                        $fut['date'] = date('m-d',$value['date']);
                        $fut['visitor_count'] = intval($value['visitor_count']);
                        $fut['admin_visitor_count'] = 0;
                        foreach ($future_admin as $k => $val) {
                           if($val['date'] == $value['date']){
                                $fut['admin_visitor_count'] = intval($val['visitor_count']);
                           }
                        }
                        $futures[] = $fut;
                        unset($fut);
                    }
                    $statistics['future'] = $futures;
                /**查询最近31天订票情况 结束**/


            }
            /**今日统计查询 结束**/


            /**月统计查询 开始**/
            if($type == -1 || $type == 1){
                //月查询起始时间
                $start_month = $_POST['start_month']?strtotime(date('Y-m-01 00:00:00',strtotime($_POST['start_month']))):strtotime(date('Y-m-d 00:00:00',strtotime('-1 year -1 month',time())));
                //月查询结束时间
                $end_month = $_POST['end_month']?strtotime(date('Y-m-d 23:59:00',strtotime($_POST['end_month']))):strtotime(date('Y-m-d 23:59:00',strtotime('-1 day',strtotime(date('Y-m-01',time())))));

                //订单时间查询
                if(!empty($_POST['start_month']) || !empty($_POST['end_month'])){
                    if(!empty($_POST['start_month']) && empty($_POST['end_month'])){
                       $where_year['b.date'] = array('egt',$start_month); 
                    }
                    if(empty($_POST['start_month']) && !empty($_POST['end_month'])){
                       $where_year['b.date'] = array('elt',$end_month);

                    }
                     if(!empty($_POST['start_month']) && !empty($_POST['end_month'])){
                       $where_year['b.date'] = array(array('egt',$start_month),array('elt',$end_month));
                    }
                }else{
                    $where_year['b.date'] = array(array('egt',$start_month),array('elt',$end_month));
                }
                /**条件查询组装 结束**/

                /**访客和独立访客统计查询 开始**/

                //访客总计查询
                $statistics['year_max'] = $this->dao->alias('a')
                                            ->join('yu_schedule b','a.schedule_id = b.id')
                                            ->where($where_year)
                                            ->sum('b.max_visitor');
                
                $statistics['year_visitor'] = $this->dao->alias('a')
                                            ->join('yu_schedule b','a.schedule_id = b.id')
                                            ->where($where_year)
                                            ->sum('b.visitor_count+b.child_count');


                //访客分月统计查询
                $month_visitor = $this->dao->alias('a')
                                            ->join('yu_schedule b','a.schedule_id = b.id')
                                            ->where($where_year)
                                            ->group('month')
                                            ->order('month asc')
                                            ->field("FROM_UNIXTIME(b.date,'%Y-%m') as month,sum(a.visitor_count+a.child_count) as count")
                                            ->select();

                //个人订单查询条件
                $where_year['a.is_group'] = 0;

                //个人独立访客分月统计查询
                $month_effective_personal = $this->dao->alias('a')
                                                        ->join('yu_schedule b','a.schedule_id = b.id')
                                                        ->where($where_year)
                                                        ->group('month')
                                                        ->order('month asc')
                                                        ->field("FROM_UNIXTIME(b.date,'%Y-%m') as month,sum(a.visitor_count+a.child_count) as count")
                                                        ->select();
                unset($where_year);
                
                //组装分月统计数组
                $month_arr = month_arr($start_month,$end_month);
                $month_statistics['month'] = $month_arr;
                foreach ($month_arr as $key => $value) {
                    $month_vis = 0;
                    $month_eff = 0;
                    foreach ($month_visitor as $k1 => $val1) {
                        if($value==$val1['month']){
                            $month_vis = $val1['count'];
                        }
                    }
                    foreach ($month_effective_personal as $k2 => $val2) {
                        if($value==$val2['month']){
                            $month_eff = $val2['count'];
                        }
                    }
                    $month_visitors[] = $month_vis;
                    $month_effective_personals[] = $month_eff;
                }
                $month_statistics['month_visitors'] = $month_visitors;
                $month_statistics['month_effective_personals'] = $month_effective_personals;
                $statistics['month_statistics'] = $month_statistics;
                /**访客和独立访客统计查询 结束**/

            }
            /**月统计查询 结束**/

            /**日统计查询 开始**/
            if($type == -1 || $type == 2){
                 //起始时间
                $start_time = $_POST['start_time']?strtotime($_POST['start_time']):strtotime(date('Y-m-d 00:00:00',time()));
                //结束时间
                $end_time = $_POST['end_time']?strtotime($_POST['end_time']):strtotime(date('Y-m-d 23:59:59',time()));
                
                //日程预定时间查询
                if(!empty($_POST['start_time']) || !empty($_POST['end_time'])){
                    if(!empty($_POST['start_time']) && empty($_POST['end_time'])){
                       $where_day['date'] = array('egt',strtotime($_POST['start_time'])); 
                    }
                    if(empty($_POST['start_time']) && !empty($_POST['end_time'])){
                       $where_day['date'] = array('elt',strtotime($_POST['end_time'])); 

                    }
                     if(!empty($_POST['start_time']) && !empty($_POST['end_time'])){
                       $where_day['date'] = array(array('egt',strtotime($_POST['start_time'])),array('elt',strtotime($_POST['end_time'])));
                    }
                }else{
                    $where_day['date'] = array(array('egt',$start_time),array('elt',$end_time));
                }

                //统计查询
                $statistics['max_visitor'] = $this->dao_schedule->where($where_day)->sum('max_visitor');
                $statistics['visitor_count'] = $this->dao_schedule->alias('a')
                                                ->join('yu_order b','b.schedule_id = a.id')
                                                ->where($where_day)->sum('b.visitor_count');
                $statistics['child_count'] = $this->dao_schedule->alias('a')
                                                ->join('yu_order b','b.schedule_id = a.id')
                                                ->where($where_day)->sum('b.child_count');
                //团购
                $where_day['b.is_group'] = array('neq',0);
                $statistics['group_visitor_count'] = $this->dao_schedule->alias('a')
                                                ->join('yu_order b','b.schedule_id = a.id')
                                                ->where($where_day)->sum('b.visitor_count+b.child_count');
                unset($where_day['b.is_group']);
                //管理员
                $where_day['b.admin_id'] = array('neq',0);
                $statistics['admin_visitor_count'] = $this->dao_schedule->alias('a')
                                                ->join('yu_order b','b.schedule_id = a.id')
                                                ->where($where_day)->sum('b.visitor_count+b.child_count');
                unset($where_day);
               
            }
            /**日统计查询 结束**/

            /**日程查询 开始**/
            if($type == -1 || $type == 3){
                //日程查询条件
                $schedule['date'] = $_POST['schedule_date']?array('eq',strtotime(date('Y-m-d',strtotime($_POST['schedule_date'])))):array('eq',strtotime(date('Y-m-d')));
                $schedule_list = $this->dao_schedule->where($schedule)->field('id,start_time,end_time,language,max_visitor,visitor_count,child_count,enable')->select();

                $statistics['schedule'] = $schedule_list;
                foreach ($schedule_list as $key => $value) {
                    $statistics['schedule'][$key]['start_time'] = date('H:i',$this->unixtime+$value['start_time']);
                    $statistics['schedule'][$key]['end_time'] = date('H:i',$this->unixtime+$value['end_time']);
                }
                unset($schedule);
            }
            /**日程查询 结束**/


            //返回数据
            return api_arr(0,'',$statistics);
        }
    }

}
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
// | CreateTime: 2018-08-22 15:07:28
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class Schedule extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:07:32
     */
	public function __construct()
    {
        parent::__construct();

        //实例化日程数据库
        $this->dao       = db('schedule');
        //实例化订单数据库
        $this->dao_order  = db('order');
        //取消已过期未支付订单
        $this->order_cancel();

    }

	/**
     * 分页获取日程列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:07:36
     * @return 
     */
    public function index(){

        //判断请求类型
        if($this->request->isPost()){
            $language = $this->language;

            //$where['language'] = $language;
            //日期
            $date = $_POST['date']?$_POST['date']:date('Y-m-d');
            
            if(!empty($date)){
                $where['date'] = strtotime(date('Y-m-d',strtotime($date)));
            }
            //分页查询日程列表
            $list = $this->dao
            ->where($where)
            ->order('sort asc,id asc')
            ->select();
            $data = $list;
            foreach($data as $key => $value) {
                $list[$key]['date'] = date('Y-m-d',$value['date']); 
                $list[$key]['start_time'] = date('H:i',$this->unixtime+$value['start_time']); 
                $list[$key]['end_time'] = date('H:i',$this->unixtime+$value['end_time']); 
            }
            
            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

    /**
     * 添加某一日日程
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-21T17:30:23+0800
     */
    public function add(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);

            //验证必填项
            $must_arr = ['date','start_time','end_time','language','max_visitor'];
            foreach ($must_arr as  $value) {
                if(empty($data[$value])){
                    return api_arr(1,"Lack of parameters of ".$value);
                }
            }

            //将日期转换为时间戳
            if(!empty($data['date'])){
                $data['date'] = strtotime(date('Y-m-d 00:00:00',strtotime($data['date'])));
            }

            //判断添加的日期是否合法
            if($data['date']<strtotime(date('Y-m-d 00:00:00').'+3 day') || $data['date']>strtotime(date('Y-m-d 00:00:00').'+30 day')){
                return api_arr(1,"invalid schedule");
            }

            //将开始时间和结束时间转换成时间戳
            if(!empty($data['start_time'])){
                $data['start_time'] = hour_time($data['start_time']);
            }
            if(!empty($data['end_time'])){
                $data['end_time'] = hour_time($data['end_time']);
            }

            //判断结束时间是否大于开始时间
            if($data['end_time']<$data['start_time']){
                return api_arr(1,"end_time must be greater than start_time");
            }

            $data['create_time'] = time();
            $data['update_time'] = time();
            $res = $this->dao->insert($data);
            if(!$res){
                return api_arr(1,"err！");
            }
           
           return api_arr(0,"success");
        }
    }

    /**
     * 更新某一日某一时间日程
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23 14:21:15
     * @return     
     */
    public function modify(){

        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            unset($data['id']);

            //验证必填项
            if(empty($_POST['id'])){
                return api_arr(1,"Lack of parameters of id");
            }

            //查询日程是否被预定
            $schedule_count = $this->dao_order->where('schedule_id',$_POST['id'])->count();
            if($schedule_count>0){
                return api_arr(1,"id ".$_POST['id']." has been used");
            }
            unset($data['date']);
            //将开始时间和结束时间转换成时间戳
            if(!empty($data['start_time'])){
                $data['start_time'] = hour_time($data['start_time']);
            }
            if(!empty($data['end_time'])){
                $data['end_time'] = hour_time($data['end_time']);
            }
            $data['update_time'] = time();
            $res = $this->dao->where('id',$_POST['id'])->update($data);
            if(!$res){
                return api_arr(1,"err！");
            }
           
           return api_arr(0,"success");
        }
    }

    /**
     * 批量更新某一日日程
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:07:41
     * @return     
     */
    public function modifys(){

        if($this->request->isPost()){
            $data = $this->json_data['data'];
            
            //验证必填项
            if(empty($data)){
                return api_arr(1,"Lack of parameters of data");
            }
            //批量更新数据
            foreach ($data as $key => $value) {
                $val = $value;
                unset($val['id']);

                //查询日程是否被预定
                $schedule_count = $this->dao_order->where('schedule_id',$value['id'])->count();
                if($schedule_count>0){
                    return api_arr(1,"id".$value['id']."has been used");
                }

                unset($val['date']);
                //将开始时间和结束时间转换成时间戳
                if(!empty($val['start_time'])){
                $val['start_time'] = hour_time($val['start_time']);
                }
                if(!empty($val['end_time'])){
                    $val['end_time'] = hour_time($val['end_time']);
                }

                $val['update_time'] = time();
                $res = $this->dao->where('id',$value['id'])->update($val);
                if(!$res){
                    return api_arr(1,"err！");
                }
            }
           
           return api_arr(0,"success");
        }
    }

    /**
     * 删除日程
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-11T11:02:40+0800
     * @return    
     */
    public function del(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            unset($data['id']);

            //验证必填项
            if(empty($_POST['id'])){
                return api_arr(1,"Lack of parameters of id");
            }

            //查询日程是否被预定
            $schedule_count = $this->dao_order->where('schedule_id',$_POST['id'])->count();
            if($schedule_count>0){
                return api_arr(1,"id".$_POST['id']."has been used");
            }

            $res = $this->dao->where('id',$_POST['id'])->delete();
            if(!$res){
                return api_arr(1,"err！");
            }
            return api_arr(0,"success");
        }

    }

}
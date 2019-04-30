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
// | CreateTime: 2018-08-22 15:13:21
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class UserCoupon extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:13:26
     */
	public function __construct()
    {
        parent::__construct();

        //实例化用户折扣券使用数据库
        $this->dao       = db('user_coupon');
        //实例化折扣券数据库
        $this->dao_coupon       = db('coupon');
        //实例化订单数据库
        $this->dao_order       = db('order');
        //取消已过期未支付订单
        $this->order_cancel();

    }

	/**
     * 分页获取用户折扣券使用列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:13:33
     * @return 
     */
    public function index(){
        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;

            //验证必选项
            if(empty($_POST['coupon_id'])){
                return api_arr(1,'Lack of parameters of coupon_id');
            }

            //条件查询
            $where['coupon_id'] = $_POST['coupon_id'];

            if(!empty($_POST['date'])){
                $where['b.date'] = strtotime(date('Y-m-d',strtotime($_POST['date'])));
            }
            if(!empty($_POST['start_time'])){
                $where['b.start_time'] = hour_time($_POST['start_time']);
            }
            if(!empty($_POST['end_time'])){
                $where['b.end_time'] = hour_time($_POST['end_time']);
            }
            if(!empty($_POST['keyword'])){
                $where['a.email|a.order_no'] = array('like','%'.$_POST['keyword'].'%');
            }
            //分页查询用户折扣券使用列表
            $list = $this->dao_order->alias('a')
            ->join('yu_schedule b','a.schedule_id = b.id')
            ->join('yu_coupon c','a.coupon_id = c.id')
            ->where($where)
            ->order('a.create_time desc')
            ->field('a.order_no,a.first_name,a.last_name,a.email,a.is_group,a.create_time,b.date,b.start_time,b.end_time,c.code,c.discount')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();
            $list['last_page']=$list['last_page']==0?1:$list['last_page'];
            $data = $list['data'];
            foreach ($data as $key => $value) {
                $list['data'][$key]['create_time'] = date('Y-m-d H:i:s',$value['create_time']);
                $list['data'][$key]['schedule_time'] = date('Y-m-d ',$value['date']).date('H:i',$this->unixtime+$value['start_time']).'-'.date('H:i',$this->unixtime+$value['end_time']);
            }
            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

}
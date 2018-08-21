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
// | CreateTime: 2018-08-20 15:27:03
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class Coupon extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 15:27:07
     */
	public function __construct()
    {
        parent::__construct();

        //实例化折扣券数据库
        $this->dao       = db('coupon');
        //实例化用户折扣券数据库
        $this->daouser       = db('user_coupon');

    }

	/**
     * 分页获取折扣券列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 15:27:10
     * @return 
     */
    public function index(){
        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;

            //分页查询折扣券列表
            $list = $this->dao
            ->where($where)
            ->order('id desc')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();
            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

    /**
     * 添加折扣券
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 15:27:14
     * @return
     */
    public function add(){

        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            //验证必填项
            if(empty($data['name'])){
                return api_arr(1,"Lack of parameters of name");
            }
            if(empty($data['discount'])){
                return api_arr(1,"Lack of parameters of discount");
            }
            if(empty($data['count'])){
                return api_arr(1,"Lack of parameters of count");
            }
            if(empty($data['start_time'])){
                return api_arr(1,"Lack of parameters of start_time");
            }
            if(empty($data['end_time'])){
                return api_arr(1,"Lack of parameters of end_time");
            }
            //开始时间不能大于结束时间
            if(strtotime($data['end_time'])<=strtotime($data['start_time'])){
                return api_arr(1,"the start time should not be longer than the end");
            }

            //数据组装
            
            //生成随机折扣码
            $data['code'] = $this->coupon_code();

            $data['start_time'] = strtotime($data['start_time']);
            $data['end_time'] = strtotime($data['end_time']);
            $data['create_time'] =  time();
            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->insertGetId($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Add coupon', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
        
    }

    /**
     * 编辑折扣券
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 15:46:22
     * @return     
     */
    public function modify(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            //验证必填项
            if(empty($data['id'])){
                return api_arr(1,"Lack of parameters of id");
            }

            //开始时间不能大于结束时间
            if((!empty($data['start_time']) || !empty($data['end_time'])) && strtotime($data['end_time'])<=strtotime($data['start_time'])){
                return api_arr(1,"the start time should not be longer than the end");
            }
            //数据组装
            if(!empty($data['start_time'])){
                $data['start_time'] = strtotime($data['start_time']);
            }
            if(!empty($data['end_time'])){
                $data['end_time'] = strtotime($data['end_time']);
            }
            //查询当前折扣券是否已投放使用,如果已经使用则不能修改
            $is_use = $this->daouser->where('coupon_id',$data['id'])->find();
            if($is_use){
                return api_arr(1,"can't be modify,because the coupon is be used");
            }
            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->update($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Modify coupon', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }

    /**
     * 生成随机折扣码
     * 
     * @param string $length 长度
     * @return string
     */
    private function coupon_code($length=10) {
       $pattern = '23456789abcdefghijklmnopqrstuvwxyz';  
        for($i=0;$i<$length;$i++)   
        {   
            $coupon_code .= $pattern{mt_rand(0,33)};//生成php随机数   
        }   
        //查询随机折扣码是否存在
        $is_coupon = $this->dao->where('code',$coupon_code)->find();
        if($is_coupon){
           return  $this->coupon_code();
        }
        return $coupon_code;   
    }

}
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
        //实例化订单数据库
        $this->daoorder     = db('order');

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

            if(!empty($_POST['create_time'])){
                $where['create_time'] = array(array('egt',strtotime($_POST['create_time'].' 00:00:00')),array('elt',strtotime($_POST['create_time'].' 23:59:59')));
            }
            //分页查询折扣券列表
            $list = $this->dao
            ->where($where)
            ->order('id desc')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();

            $list['last_page']=$list['last_page']==0?1:$list['last_page'];
            $data = $list['data'];

            foreach ($data as $key => $value) {

                //查询折扣码是否有使用记录
                $is_use = $this->daoorder->where('coupon_id',$value['id'])->count();
                $is_use = $is_use>0?1:0;
                $list['data'][$key]['is_use'] = $is_use;
                //时间格式化处理
                $list['data'][$key]['start_time'] = date('Y-m-d H:i:s',$value['start_time']);
                $list['data'][$key]['end_time'] = date('Y-m-d H:i:s',$value['end_time']);
                $list['data'][$key]['create_time'] = date('Y-m-d H:i:s',$value['create_time']);
            }
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
            $must_arr = ['name','discount','code','start_time','end_time'];
            foreach ($must_arr as  $value) {
                if(empty($data[$value])){
                    return api_arr(1,"Lack of parameters of ".$value);
                }
            }
            //开始时间不能大于结束时间
            if(strtotime($data['end_time'])<=strtotime($data['start_time'])){
                return api_arr(1,"the start time should not be longer than the end");
            }

            //判断折扣码是否符合规则
            if(!preg_match("/^([2-9a-zA-Z]){1,10}$/", $data['code'])){
                return api_arr(1,"invalid code");
            }
            //查询折扣码是否已存在
            $info = $this->dao->where('code',strtolower($data['code']))->find();
            if($info){
                return api_arr(1,'code has exits');
            }
            //生成折扣券数量 默认为1
            // $count = $data['count']?$data['count']:1;
            // unset($data['count']);
            //数据组装

            $data['start_time'] = strtotime($data['start_time']);
            $data['end_time'] = strtotime($data['end_time']);
            $data['create_time'] =  time();
            $data['update_time'] =  time();

            // for ($i=0; $i < $count; $i++) { 
            //     //生成随机折扣码
            //     $data['code'] = $this->coupon_code();
            //     //数据更新
            //     $res = $this->dao->insertGetId($data);
            //     if(!$res){
            //        return api_arr(1,"err！"); 
            //     }
            // }
            
            $res = $this->dao->insertGetId($data);
            if(!$res){
               return api_arr(1,"err！"); 
            }
            return api_arr(0,"success");

           
            
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
            unset($data['is_use']);
            unset($data['create_time']);
            //验证必填项
            if(empty($data['id'])){
                return api_arr(1,"Lack of parameters of id");
            }

            //开始时间不能大于结束时间
            if((!empty($data['start_time']) || !empty($data['end_time'])) && strtotime($data['end_time'])<=strtotime($data['start_time'])){
                return api_arr(1,"the start time should not be longer than the end");
            }
             //判断折扣码是否符合规则
            if(!empty($data['code']) && !preg_match("/^([2-9a-zA-Z]){1,10}$/", $data['code'])){
                return api_arr(1,"invalid code");
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

            //如果更新折扣码,查询折扣码是否已存在
            if(!empty($_POST['code'])){
                 $is_exit = $this->dao->where('code',strtolower($data['code']))->find();
                if($is_exit && $is_exit['id'] != $_POST['id']){
                    return api_arr(1,'code has exits');
                }
            }
           

            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->update($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                log_result('Modify coupon ID:'.$data['id']);
                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }

    /**
     * 折扣码删除
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-11T14:14:12+0800
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

            //查询当前折扣券是否已投放使用,如果已经使用则不能删除
            $is_use = $this->daouser->where('coupon_id',$data['id'])->find();
            if($is_use){
                return api_arr(1,"can't be modify,because the coupon is be used");
            }

            //数据删除
            $res = $this->dao->where('id',$_POST['id'])->delete();
            if(!$res){
                return api_arr(1,"err！");
            }
            return api_arr(0,"success");
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
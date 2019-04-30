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
// | CreateTime: 2018-08-27 18:07:49
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;
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

    }

	/**
     * 根据折扣代码获取折扣信息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-27 18:08:12
     * @return 
     */
    public function get(){
        //判断请求类型
        if($this->request->isPost()){
            if(empty($_POST['coupon_code'])){
                return api_arr(1,"Lack of parameters of coupon_code");
            }
            
            $where['code'] = strtolower($_POST['coupon_code']);
            //分页查询折扣券列表
            $list = $this->dao
            ->where($where)
            ->find();

            //判断是否有效折扣码
            if(!$list){
                return api_arr(1,"invalid coupon");
            }
            //判断折扣券是否在有效期内
            if($list['start_time']>time()){
                return api_arr(1,"coupon temporarily unable to use");
            }
            //判断折扣券是否过期
            if($list['end_time']<time()){
                return api_arr(1,"expired coupon");
            }
             //判断折扣券是启用
            if($list['enable']!=1){
                return api_arr(1,"enable coupon fail");
            }

            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

}
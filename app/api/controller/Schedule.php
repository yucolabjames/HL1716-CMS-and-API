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
// | CreateTime: 2018-08-22 15:07:54
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;
use think;
class Schedule extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:07:57
     */
	public function __construct()
    {
        parent::__construct();

        //实例化日程数据库
        $this->dao       = db('schedule');

    }

	/**
     * 分页获取日程列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22 15:08:01
     * @return 
     */
    public function index(){

        //判断请求类型
        if($this->request->isPost()){

            //日期
            $date = $_POST['date']?$_POST['date']:date('Y-m-d');
            $where['enable'] = 1;
            if(!empty($date)){
                $where['date'] = strtotime(date('Y-m-d',strtotime($date)));
            }
            //分页查询日程列表
            $list = $this->dao
            ->where($where)
            ->order('sort asc,id asc')
            ->select();
            //去除预定人数已满和预定剩余人数不满足的日程安排
            $data = [];
            foreach ($list as $key => $value) {

                if(($value['visitor_count']+$value['child_count']>($value['max_visitor']-1)) || ($value['max_visitor']-($value['visitor_count']+$value['child_count'])<$_POST['visitor_count'])){
                    
                }else{
                    $data[] = $value;
                }

            }

            //返回数据
            return api_arr(0,'',$data);
        }
        
    }

}
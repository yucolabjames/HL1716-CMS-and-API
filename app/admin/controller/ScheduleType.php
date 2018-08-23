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
// | CreateTime: 2018-08-20 16:39:42
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class ScheduleType extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 16:39:45
     */
	public function __construct()
    {
        parent::__construct();

        //实例化日程类型设置数据库
        $this->dao       = db('schedule_type');

    }

	/**
     * 分页获取日程类型设置列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 16:39:49
     * @return 
     */
    public function index(){
        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;

            //分页查询日程类型设置列表
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
     * 添加日程类型设置
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 16:39:53
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
            if(empty($data['week'])){
                return api_arr(1,"Lack of parameters of week");
            }
            $data['create_time'] =  time();
            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->insertGetId($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Add schedule_type', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
        
    }

    /**
     * 编辑日程类型设置
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 16:39:57
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

            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->update($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Modify schedule_type', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }


}
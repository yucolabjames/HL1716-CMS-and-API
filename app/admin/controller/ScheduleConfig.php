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
// | CreateTime: 2018-08-20 17:07:42
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class ScheduleConfig extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:00
     */
	public function __construct()
    {
        parent::__construct();

        //实例化日程设置数据库
        $this->dao       = db('schedule_config');
        //实例化日程设置类型数据库
        $this->dao_type       = db('schedule_type');

    }

	/**
     * 分页获取日程设置列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:07
     * @return 
     */
    public function index(){
        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;
            //类型
            $type_id = $this->request->param('type_id');
            if(!empty($type_id)){
                $where['a.type_id'] = $type_id;
            }
            //语言
            $language = $this->language;
            if(!empty($language)){
                $where['a.language'] = $language;
            }

            //分页查询日程设置列表
            $list = $this->dao->alias('a')
            ->join('yu_schedule_type b','a.type_id = b.id')
            ->join('yu_language c','a.language = c.id')
            ->where($where)
            ->order('sort asc,id desc')
            ->field('a.id,b.name as type_name,c.language,b.week,a.start_time,a.end_time,a.max_visitor,sort')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();
            $list['last_page']=$list['last_page']==0?1:$list['last_page'];
            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

   /**
     * 获取日程设置列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:07
     * @return 
     */
    public function lists(){
         //判断请求类型
        if($this->request->isPost()){
            $list = $this->dao_type->field('id,name')->order('id asc')->select();
            foreach ($list as $key => $value) {
                $data = $this->dao->where('type_id ='.$value['id'])->order('sort asc,id asc')->select();
                $sche = $data;
                foreach ($data as $k => $val) {
                   $sche[$k]['start_time'] = date('H:i',$this->unixtime+$val['start_time']); 
                   $sche[$k]['end_time'] = date('H:i',$this->unixtime+$val['end_time']); 
                }
                $schedule[] = $sche;
                unset($sche);
            }
            //返回数据
            return api_arr(0,'',$schedule);
        }
    }

    /**
     * 添加日程设置
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:36
     * @return
     */
    public function add(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            //验证必填项
            if(empty($data['type_id'])){
                return api_arr(1,"Lack of parameters of type_id");
            }
            if(empty($data['language'])){
                return api_arr(1,"Lack of parameters of language");
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
            $data['start_time'] = hour_time($data['start_time']);
            $data['end_time'] = hour_time($data['end_time']);
            $data['create_time'] =  time();
            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->insertGetId($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Add schedule_config', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
        
    }

    /**
     * 编辑日程设置
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:42
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
                $data['start_time'] = hour_time($data['start_time']);
            }
            if(!empty($data['end_time'])){
                $data['end_time'] = hour_time($data['end_time']);
            }
            $data['update_time'] =  time();
            //数据更新
            $res = $this->dao->where('id',$_POST['id'])->update($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Modify schedule_config', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }

    /**
     * 删除日程设置
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-12T15:15:31+0800
     * @return     
     */
    public function del(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            //验证必填项
            if(empty($data['id'])){
                return api_arr(1,"Lack of parameters of id");
            }
            $res = $this->dao->where('id',$_POST['id'])->delete();
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Delete schedule_config', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }
}
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
// | CreateTime: 2018-08-20 14:23:25
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class Manager extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 14:24:09
     */
	public function __construct()
    {
        parent::__construct();

        //实例化管理员数据库
        $this->dao       = db('administrator');

    }

	/**
     * 分页获取管理员列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 14:25:05
     * @return 
     */
    public function index(){

        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;

            //分页查询管理员列表
            $list = $this->dao->alias('a')
            ->join('yu_administrator b','a.creator = b.id')
            ->join('yu_administrator c','a.modifier = c.id ')
            ->where($where)
            ->order('a.id desc')
            ->field('a.id,a.username,a.full_name,a.enable,b.username as creator,a.createtime,c.username as modifier,a.modifytime,a.modifytip')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();
            $list['last_page']=$list['last_page']==0?1:$list['last_page'];
            //返回数据
            return api_arr(0,'',$list);
        }

    }

    /**
     * 管理员列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-05T09:46:23+0800
     * @return    
     */
    public function lists(){
        //判断请求类型
        if($this->request->isPost()){
             //分页查询管理员列表
            $list = $this->dao
            ->order('id desc')
            ->field('id,username')
            ->select();
            //返回数据
            return api_arr(0,'',$list);
        }
    }

    /**
     * 添加管理员
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 14:36:42
     * @return
     */
    public function add(){

        if($this->request->isPost()){
            //验证必填项
            if(empty($_POST['username'])){
                return api_arr(1,"Lack of parameters of username");
            }
            if(empty($_POST['password'])){
                return api_arr(1,"Lack of parameters of password");
            }
            //查询管理员是否存在
            $info = $this->dao->where('username',$_POST['username'])->find();
            if($info){
                return api_arr(1,"username has exists");
            }

            $data = $_POST;
            $data['password'] = md5(md5($data['password']));
            //默认新增数据
            $data['creator'] = $this->userId;
            $data['createtime'] = date('Y-m-d H:i:s');
            $data['modifier'] = $this->userId;
            $data['modifytime'] = date('Y-m-d H:i:s');
            $data['modifytip'] =  $this->request->ip();
            $data['salt'] = rand(1000,9999);
            unset($data['userid']);
            $res = $this->dao->insertGetId($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Add administrator', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
        
    }

    /**
     * 编辑管理员
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 14:42:18
     * @return     
     */
    public function modify(){
        if($this->request->isPost()){
            $intId = $_POST['id'];
            //判断是否选择
            if (!$intId) {
                return api_arr(1,"Please select the administrator that needs to be modified.");
            }
            //组合保存数据
            $data = $_POST;
            //验证密码是否为空
            if(empty($_POST['password'])){
                return api_arr(1,"Lack of parameters of password");
            }
            if(!empty($_POST['password'])){
                $data['password'] = md5(md5($data['password']));
            }
            unset($data['userid']);
            //默认更新数据
            $data['modifier'] = $this->userId;
            $data['modifytime'] = date('Y-m-d H:i:s');
            $data['modifytip'] =  $this->request->ip();
            $data['salt'] = rand(1000,9999);
            $res = $this->dao->where('id',$intId)->update($data);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
               $this->logs('Modify administrator', 'ID:'.$intId,2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
    }

}
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
// | CreateTime: 2018-08-15 10:32:27
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
class Opinion extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-16 18:16:16
     */
	public function __construct()
    {
        parent::__construct();

        //实例化意见数据库
        $this->dao       = db('opinion');

    }

	/**
     * 分页获取意见列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-16 18:16:37
     * @return 
     */
    public function index(){

        //获取语言类型
        $language = $this->language;
        
        //分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;

        //判断语言类型参数是否存在
        if(!empty($language)){
            $where['language'] = $language;
        }
        
        //关键词搜索 
        if(!empty($_POST['keyword'])){
            $where['name|email|tel|content'] = array('like','%'.$_POST['keyword'].'%');
        }
        //分页查询意见列表
        $list = $this->dao
        ->where($where)
        ->order('id desc')
        ->field('id,name,email,tel,content,language,ip,createtime')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        $list['last_page']=$list['last_page']==0?1:$list['last_page'];
    	//返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 意见详情
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-04T11:46:44+0800
     * @return     
     */
    public function get(){
         //判断请求类型
        if($this->request->isPost()){
             //验证必传字段
            if(empty($_POST['id'])){
                return api_arr(1,"Lack of parameters of id");
            }
            $where['id'] = $_POST['id'];
            $info = $this->dao->where($where)->find();
            //返回数据
             return api_arr(0,'',$info);
        }
    }

}
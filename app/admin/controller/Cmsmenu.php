<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief CMS菜单
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Cmsmenu extends Common
{
	protected $dao;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao = db('menu_cms');
    }

	#获取CMS菜单
    public function index(){
    	
    		#查询配置
	    	$menus = $this->getMenu($pid);
	    	#返回数据
	    	return api_arr(0,'',$menus);
    }

    #获取CMS菜单方法
    public function getMenu($pid) {
    	
    		#查询菜单
	    	$menuArray = $this->dao
	    	->where("`pid`='$pid'")
	    	->order('sort asc')
	    	->select();

	    	#默认字符串
	    	$arrId = '';
	    	if ($menuArray) {
	    		$arrChildId = '';
		    	foreach ($menuArray as $k => $v) {
		    		#构造是否有子节点
			    	$treeChild = $this->dao
			    	->where("`pid`='{$v['id']}'")
			    	->select();
					if ($treeChild) {
						$menuArray[$k]['child_menu'] = $treeChild;
					  	$jsonChild =  $this->getMenu($v['id']);
					  
					} else {
						$menuArray[$k]['child_menu'] = array();
					}
		        }
        	}

	    	#返回数据
	    	return $menuArray;
  }

  /**
   * 创建cms菜单
   * @author gyj <375023402@qq.com>
   * @createtime 2018-09-03T14:54:40+0800
   */
	public function add(){
	  	if($this->request->isPost()){
	  		$data = $_POST;
	  		unset($data['userid']);
	  		//验证必填项
	        $must_arr = ['name','action'];
	        foreach ($must_arr as  $value) {
	            if(empty($data[$value])){
	                return api_arr(1,"Lack of parameters of ".$value);
	            }
	        }

	        //查询父级是否存在
	        if(!empty($data['pid'])){
	        	$parent = $this->dao->where('id',$data['pid'])->find();
	        	if(!$parent){
	        		return api_arr(1,"parent isn't exists ");
	        	}
	        }

	        $res = $this->dao->insertGetId($data);
	        if(!$res){
	           return api_arr(1,"err！"); 
	        }
	       	return api_arr(0,"success");
	  	}
  	}

  /**
   * 编辑cms菜单
   * @author gyj <375023402@qq.com>
   * @createtime 2018-09-03T14:54:40+0800
   */
	public function modify(){
	  	if($this->request->isPost()){
	  		$data = $_POST;
	  		unset($data['userid']);
	  		//验证必填项
	  		if(empty($data['id'])){
	  			return api_arr(1,"Lack of parameters of id");
	  		}

	        //查询父级是否存在
	        if(!empty($data['pid'])){
	        	$parent = $this->dao->where('id',$data['pid'])->find();
	        	if(!$parent){
	        		return api_arr(1,"parent isn't exists ");
	        	}
	        }

	        $res = $this->dao->where('id',$data['id'])->update($data);
	        if(!$res){
	           return api_arr(1,"err！"); 
	        }
	       	return api_arr(0,"success");
	  	}
  	} 
}
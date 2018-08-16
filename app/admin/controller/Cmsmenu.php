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
    
}
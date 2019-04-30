<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 网页菜单
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Webmenu extends Common
{
	protected $dao,$dataArray;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('menu_front');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取网页菜单
    public function index(){
    	#获取语言
    	$language = $this->language;

    	#判断语言是否选择
    	if ($language) {
    		#查询网页菜单
	    	$configArray = $this->dao
	    	->where('language',$language)
	    	->order('sort asc')
	    	->select();

	    	#返回数据
	    	return api_arr(0,'',$configArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }

    #添加网页菜单
    public function add(){
    	#验证必填项
        $validate = Loader::validate('Webmenu');
        if ($validate->check($this->dataArray)) {

        	#查询菜单名称是否已存在
        	$isName = $this->dao
	    	->where('name',$this->dataArray['name'])
	    	->value('id');
	    	if ($isName) {
	    		return api_arr(1,'Menu name already exists');exit;
	    	}

	    	#组合写入数据
	    	$infoArray = array(
	    		#菜单名称
	    		'name'     => $this->dataArray['name'],
	    		#菜单动作
	    		'action'   => $this->dataArray['action'],
	    		#菜单语言
	    		'language' => $this->dataArray['language']
	    	);
	    	$res = $this->dao->insertGetId($infoArray);
	    	#判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Add a web menu', 'Menu ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
    	} else {
            return api_arr(1,$validate->getError());
        }
    }

    #修改网页菜单
    public function modify(){
    	#验证必填项
        $validate = Loader::validate('Webmenu');
        if ($validate->check($this->dataArray)) {

        	#查询菜单名称是否已存在
        	$isName = $this->dao
	    	->where("name=".$this->dataArray['name']." and id!=".$this->dataArray['id'])
	    	->value('id');
	    	if ($isName) {
	    		return api_arr(1,'Menu name already exists');exit;
	    	}

	    	#组合写入数据
	    	$infoArray = array(
	    		#菜单名称
	    		'name'     => $this->dataArray['name'],
	    		#菜单动作
	    		'action'   => $this->dataArray['action'],
	    		#菜单语言
	    		'language' => $this->dataArray['language']
	    	);
	    	$res = $this->dao
	    	->where('id',$this->dataArray['id'])
    		->data($infoArray)
    		->update()
	    	#判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Modify the web page menu', 'Menu ID:'.$this->dataArray['id'],2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
    	} else {
            return api_arr(1,$validate->getError());
        }
    }

    #修改网页菜单排序
    public function modifysort() {
        if ($this->dataArray['sort']) {

	    	#组合写入数据
	    	$infoArray = array(
	    		#菜单名称
	    		'sort'     => $this->dataArray['sort']
	    	);
	    	$res = $this->dao
	    	->where('id',$this->dataArray['id'])
    		->data($infoArray)
    		->update()
	    	#判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Modify page menu ordering', 'Menu ID:'.$this->dataArray['id'],2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
    	} else {
            return api_arr(1,'Please choose the sort');
        }
    }

    #删除网页菜单
    public function del() {
    	$intId = $this->request->param('id');
        if ($intId) {
        	#查询菜单名称
        	$nameStr = $this->dao->where('id',$intId)->value('name');
        	#删除菜单
	    	$res = $this->dao->where('id',$intId)->delete();
	    	#判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Delete menu', 'Menu name:'.$nameStr,2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
    	} else {
            return api_arr(1,'Please select the menu you want to delete');
        }
    }
}
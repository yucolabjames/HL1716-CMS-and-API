<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 网页语言
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Db;
use think\Request;
use think\Controller;

class Language extends Common
{
	#获取网页语言
    public function index(){
    	#查询语言
    	$languageArray = db('language')->field('id,name,language')->select();
    	#返回网页语言
    	return api_arr(0,'',$languageArray);
    }
}
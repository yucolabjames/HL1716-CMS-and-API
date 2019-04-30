<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 生物资源与农业信息
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Braa extends Common
{
	protected $dao,$dataArray;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('braa');
    }

	#获取生物资源与农业配置
    public function index(){
    	#获取语言
    	$language = $this->request->param('language')?$this->request->param('language'):config('language');

    	#判断语言是否选择
    	if ($language) {
    		#查询数据
	    	$configArray = $this->dao->alias('a')
	    	->join('yu_language b','b.id = a.language')
	    	->where('a.language',$language)
	    	->field('a.*,b.language as language_key')
	    	->find();

	    	#默认空数组
	    	$infoArray = array();
	    	#判断查询数据
	    	if ($configArray) {
		    	#组合返回数据
		    	$infoArray = array(
		    		#数据ID
		    		"id"             => $configArray['id'],
		    		#语言
		    		"language"       => $configArray['language_key'],
		    		#极端气候模块 
		    		'ext_climate'    => $configArray['ext_climate']?json_decode($configArray['ext_climate'],true):array(),
		    		#生物数目锐减模块
		    		'biologicals'    => $configArray['biologicals']?json_decode($configArray['biologicals'],true):array(),
		    		#生产危机模块
		    		'produce_crisis' => $configArray['produce_crisis']?json_decode($configArray['produce_crisis'],true):array(),
		    		#粮食供应模块
		    		'food_supply'    => $configArray['food_supply']?json_decode($configArray['food_supply'],true):array(),
		    		#有机农业模块 
		    		'organic_agri'   => $configArray['organic_agri']?json_decode($configArray['organic_agri'],true):array(),
                    #衣食住行模块
                    "cflr"           => $configArray['cflr']?json_decode($configArray['cflr'],true):array(),
		    		#当前图片域名
		    		'domain'         => $this->upload_host
		    	);
	    	}
	    	#返回数据
	    	return api_arr(0,'',$infoArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }

}
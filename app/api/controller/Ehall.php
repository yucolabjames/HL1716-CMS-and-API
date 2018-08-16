<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 展览馆配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Ehall extends Common
{
	protected $dao,$dataArray;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao = db('ehall');
    }

	#获取生物资源与农业配置
    public function index(){
    	#获取语言
    	$language = $this->request->param('language')?$this->request->param('language'):config('language');
    	
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
		    		"id"        => $configArray['id'],
		    		#语言
		    		"language"  => $configArray['language_key'],
		    		#可持续资源馆模块    
		    		'srp'       => $configArray['srp']?json_decode($configArray['srp'],true):array(),
		    		#成功著陸次数 
		    		'successes' => $configArray['successes'],
		    		#通過培訓人次 
		    		'trainings' => $configArray['trainings'],
		    		#图片模块1
		    		'images1'   => $configArray['images1']?json_decode($configArray['images1'],true):array(),
		    		#图片模块1 
		    		'images2'   => $configArray['images2']?json_decode($configArray['images2'],true):array(),
                    #图片模块1
                    "images3"   => $configArray['images3']?json_decode($configArray['images3'],true):array(),
                    #图片模块1
                    "images4"   => $configArray['images4']?json_decode($configArray['images4'],true):array(),
                    #图片模块1
                    "images5"   => $configArray['images5']?json_decode($configArray['images5'],true):array(),
		    		#当前图片域名
		    		'domain'    => $this->upload_host
		    	);
	    	}
	    	#返回数据
	    	return api_arr(0,'',$infoArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }
}
<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 展览馆配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
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
        $this->dao       = db('ehall');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取生物资源与农业配置
    public function index(){
    	#获取语言
    	$language = $this->language;

    	#判断语言是否选择
    	if ($language) {
    		#查询数据
	    	$configArray = $this->dao
	    	->where('language',$language)
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
		    		"language"  => $configArray['language'],
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
		    	);
	    	}
	    	#返回数据
	    	return api_arr(0,'',$infoArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }

    #保存生物资源与农业配置
    public function save(){
        $configArray = $this->dataArray;
    	#组合保存数据
        $infoArray = array(
            #语言
            "language"  => $configArray['language'],
            #可持续资源馆模块    
            'srp'       => $configArray['srp']?json_encode($configArray['srp']):array(),
            #成功著陸次数 
            'successes' => $configArray['successes']?$configArray['successes']:0,
            #通過培訓人次 
            'trainings' => $configArray['trainings']?$configArray['trainings']:0,
            #图片模块1
            'images1'   => $configArray['images1']?json_encode($configArray['images1']):array(),
            #图片模块1 
            'images2'   => $configArray['images2']?json_encode($configArray['images2']):array(),
            #图片模块1
            "images3"   => $configArray['images3']?json_encode($configArray['images3']):array(),
            #图片模块1
            "images4"   => $configArray['images4']?json_encode($configArray['images4']):array(),
            #图片模块1
            "images5"   => $configArray['images5']?json_encode($configArray['images5']):array(),
            #保存人
            'modifier'  => $this->userId,
            #保存时间
            'modifytime'=> date('Y-m-d H:i:s'),
            #保存ip
            'modifytip' => $this->request->ip()
        );

    	#查询该语言是否已配置
    	$configId = $this->dao
    	->where('language',$this->dataArray['language'])
    	->value('id');
    	if ($configId) {
    		#修改配置信息
    		$res = $this->dao
    		->where('id',$configId)
    		->data($infoArray)
    		->update();
    	} else {
    		$res = $this->dao->insert($infoArray);
    	}

    	#判断是否成功
        if ($res || $res === 0) {
            #添加日志
            $this->logs('Modify exhibition hall information', 'language:'.$this->dataArray['language'],2);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }
}
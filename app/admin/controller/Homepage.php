<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 主页配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Homepage extends Common
{
	protected $dao,$dataArray;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('home');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取主页配置
    public function index(){
    	#获取语言
    	$language = $this->request->param('language');

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
		    		"id"       => $configArray['id'],
		    		#语言
		    		"language" => $configArray['language'],
		    		#banner轮播模块
		    		'banner'   => $configArray['banner']?json_decode($configArray['banner'],true):array(),
		    		#可持续资源馆模块
		    		'srp'      => $configArray['srp']?json_decode($configArray['srp'],true):array(),
		    		#生物资源耗尽模块
		    		'ebr'      => $configArray['ebr']?json_decode($configArray['ebr'],true):array(),
		    		#预订模块背景图
		    		'backg'    => $configArray['backg'],
		    		#区域模块图片文字
		    		'zone'     => $configArray['zone']?json_decode($configArray['zone'],true):array(),
		    		#当前图片域名
		    		'domain'   => $this->upload_host
		    	);
	    	}
	    	#返回数据
	    	return api_arr(0,'',$infoArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }

    #保存主页配置
    public function save(){

    	#组合保存数据
    	$infoArray = array(
    		#语言
    		'language'   => $this->dataArray['language'],
    		#banner轮播模块
    		'banner'     => $this->dataArray['banner']?json_encode($this->dataArray['banner']):'[]',
    		#可持续资源馆模块
    		'srp'        => $this->dataArray['srp']?json_encode($this->dataArray['srp']):'[]',
    		#生物资源耗尽模块
    		'ebr'        => $this->dataArray['ebr']?json_encode($this->dataArray['ebr']):'[]',
    		#预订模块背景图
    		'backg'      => $this->dataArray['backg'],
    		#区域模块图片文字
    		'zone'       => $this->dataArray['zone']?json_encode($this->dataArray['zone']):'[]',
    		#保存人
            'modifier'   => $this->userId,
            #保存时间
            'modifytime' => date('Y-m-d H:i:s'),
            #保存ip
            'modifytip'  => $this->request->ip()
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
    		->update()
    	} else {
    		$res = $this->dao->insert($infoArray);
    	}

    	#判断是否成功
        if ($res || $res === 0) {
            #添加日志
            $this->logs('Modify home page information', 'language:'.$this->dataArray['language'],2);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }
}
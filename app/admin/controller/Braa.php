<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 生物资源与农业配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
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
		    		"id"             => $configArray['id'],
		    		#语言
		    		"language"       => $configArray['language'],
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

       if($this->request->isPost()){
            $configArray = $this->dataArray;
            unset($configArray['userid']);
            if(empty($configArray['language'])){
                return api_arr(1,'Lack of parameters of language'); 
            }
            #组合保存数据
            $infoArray = array(
                #语言
                "language"       => $configArray['language'],
                #极端气候模块 
                'ext_climate'    => $configArray['ext_climate']?json_encode($configArray['ext_climate']):'[]',
                #生物数目锐减模块
                'biologicals'    => $configArray['biologicals']?json_encode($configArray['biologicals']):'[]',
                #生产危机模块
                'produce_crisis' => $configArray['produce_crisis']?json_encode($configArray['produce_crisis']):'[]',
                #粮食供应模块
                'food_supply'    => $configArray['food_supply']?json_encode($configArray['food_supply']):'[]',
                #有机农业模块 
                'organic_agri'   => $configArray['organic_agri']?json_encode($configArray['organic_agri']):'[]',
                #衣食住行模块
                "cflr"           => $configArray['cflr']?json_encode($configArray['cflr']):'[]',
                #保存人
                'modifier'       => $this->userId,
                #保存时间
                'modifytime'     => date('Y-m-d H:i:s'),
                #保存ip
                'modifytip'      => $this->request->ip()
            );

            
            #查询该语言是否已配置
            $configId = $this->dao
            ->where('id',$configArray['id'])
            ->value('id');
            if ($configId) {
                #修改配置信息
                $res = $this->dao
                ->where('id',$configArray['id'])
                ->data($infoArray)
                ->update();
            } else {
                $res = $this->dao->insert($infoArray);
            }

            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Modifying biological resources and agricultural information', 'language:'.$this->dataArray['language'],2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
       }
      
    }
}
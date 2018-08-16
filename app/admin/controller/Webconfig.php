<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 网页配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Webconfig extends Common
{
	protected $dao,$dataArray;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('web_config');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取网页配置
    public function index(){
    	#获取语言
    	$language = $this->request->param('language');

    	#判断语言是否选择
    	if ($language) {
    		#查询配置
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
		    		"id"         => $configArray['id'],
		    		#网页名称
		    		'name'       => $configArray['name'],
		    		#SEO关键字
		    		'seokey'     => $configArray['seokey'],
		    		#网页logo
		    		'logo'       => $configArray['logo']?json_decode($configArray['logo'],true):array(),
		    		#网页背景图
		    		'backg'      => $configArray['backg'],
		    		#网页链接的信息
		    		'weblinks'   => $configArray['weblinks']?json_decode($configArray['weblinks'],true):array(),
		    		#关注我们的信息
		    		'attention'  => $configArray['attention']?json_decode($configArray['attention'],true):array(),
		    		#网页底部说明
		    		'bottomdesc' => $configArray['bottomdesc'],
		    		#当前图片域名
		    		'domain'     => $this->upload_host
		    	);
	    	}
	    	#返回数据
	    	return api_arr(0,'',$infoArray);
    	} else {
    		return api_arr(1,'Please select a language!');
    	}
    }

    #保存网页配置
    public function save(){
    	#验证必填项
        $validate = Loader::validate('Webconfig');
        if ($validate->check($this->dataArray)) {

        	#判断网页logo
        	if ($this->dataArray['logo']['img']) {
        		return api_arr(1,'Please upload the webpage logo!');exit;
        	}

        	#组合保存数据
	    	$infoArray = array(
	    		#配置语言
	    		'language'   => $this->dataArray['language'],
	    		#网页名称
	    		'name'       => $this->dataArray['name'],
	    		#SEO关键字
	    		'seokey'     => $this->dataArray['seokey'],
	    		#网页logo
	    		'logo'       => json_encode($this->dataArray['logo']),
	    		#网页背景图
	    		'backg'      => $this->dataArray['backg'],
	    		#网页链接的信息
	    		'weblinks'   => $this->dataArray['weblinks']?json_encode($this->dataArray['weblinks']):'[]',
	    		#关注我们的信息
	    		'attention'  => $this->dataArray['attention']?json_encode($this->dataArray['attention']):'[]',
	    		#网页底部说明
	    		'bottomdesc' => $this->dataArray['bottomdesc'],
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
                $this->logs('Modify web page configuration', 'language:'.$this->dataArray['language'],2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,$validate->getError());
        }
    	

    }
}
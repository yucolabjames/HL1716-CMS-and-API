<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 主页
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Config;

class Index extends Common{
    protected $dao;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('home');
    }
    
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
		    		"id"       => $configArray['id'],
		    		#语言
		    		"language" => $configArray['language_key'],
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

    /**
     * JETCO支付回调
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T15:46:21+0800
     */
    public function notify(){
    	$data = $this->request->param();
    	$notify_str = '';
    	foreach ($data as $key => $value) {
    		$notify_str.=$key."=".$value."<br/>";
    	}
    	log_result($notify_str,'jetco');
    	//验证支付状态 AP核准 RJ拒绝 CC取消 TO超时
    	if($data['status'] == 'AP'){
  				return 'success';
    	}else{
    		return 'fail';
    	}
    }
    
}
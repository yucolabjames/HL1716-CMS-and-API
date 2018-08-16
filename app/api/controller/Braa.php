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
    	$info = $this->dao->find(1);
    	$data['ext_climate'] = json_decode($info['ext_climate'],true);
        $data['ext_climate']['flood'] = "43";
    	$data['ext_climate']['storm'] = "28";
    	$data['ext_climate']['drougt'] = "5";
    	$data['ext_climate']['wildfire'] = "4";
        $data['ext_climate']['year'] = "20";
        $data['ext_climate']['tips'] = array("過去","年","全球錄得近<b>7,000</b>宗天災，","超過<b>9</b>成與氣候變化有關");
    	$data['ext_climate'] = json_encode($data['ext_climate']);

    	$cflr['title'] = "我們的生活模式環境承受到嗎 ？";
    	$cflr['child_title'] = array('衣','食','住','行');
        $cflr['background'] = "uploads/2018/08-15/aboutbg2.jpg";
    	$content1['summary'] = "看似空虛的衣櫃";
    	$content1['tips'] = array("香港人均擁有:","衣服之多","，然而有","是很少或","從未穿過的。","單在2015年， 香港紡織物棄置量高達<b>11</b>萬噸","即每<b>1</b>分鐘 就有","T-恤被遺棄","被丟棄的衣物加起來的","面積更足夠覆蓋:","<b>25000</b>個香港大球場");
    	$content1['num'] = array("94","15","1400");
    	$cflr['content1'] = $content1;

    	$content2['summary'] = "被寵壞的胃";
    	$content2['images'] = "uploads/2018/08-15/screen3.png";
    	$cflr['content2'] = $content2;

    	$content3['summary'] = "揮霍無度的蝸居";
    	$content3['tips'] = array('每年，全港扔掉超過<b>7</b>萬公噸廢電腦及電器產品。','部分被棄置的電腦及電器仍可正常運作或作二手用途，  卻被送到堆填區白白浪費？');
		$content3['images'] = "uploads/2018/08-15/screen4.png";		
    	$cflr['content3'] = $content3;

    	$content4['summary'] = "氣候暖化的核心外圍";
    	$content4['tips'] = array('運輸消耗大量能源，在2015年，就佔了全港三分之一的總能源消耗；','2015年運輸所排放的溫室氣體量高達<b>747</b>萬公噸二氧化碳當量','即<b>1255</b>個標準游泳池的容量 ，佔總排放量的<b>18</b>%');
		$content4['images'] = "uploads/2018/08-15/screen5.png";	
    	$cflr['content4'] = $content4;
    	$data['cflr'] = json_encode($cflr);
    	$result = $this->dao->where('id',1)->update($data);
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
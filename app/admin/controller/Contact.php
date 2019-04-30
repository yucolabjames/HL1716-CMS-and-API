<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 联络我们配置
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class Contact extends Common
{
	protected $dao,$dataArray,$daocont,$op;
	public function __construct()
    {
        parent::__construct();

        #实例化数据库
        $this->dao       = db('contact_config');
        #实例化内容数据库
        $this->daocont   = db('contact_content');
        #实例化意见数据库
        $this->op        = db('opinion');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取信息
    public function index(){
		#查询数据
    	$configArray = $this->dao->find();

        //添加查询语言类型
        $language = $this->language;
        if(!empty($language)){
            $where['a.language'] = $language;
        }
        #分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;
        #查询内容
        $infoArray = $this->daocont->alias('a')
        ->join('yu_contact_config c','a.contact_id = c.id')
        ->where($where)
        ->field('c.id,c.header,c.coordinate,c.tel,c.email,a.address,a.office_hours,a.header_title,a.header_content,a.language')
        ->find();
 
        #返回数据
        return api_arr(0,'',$infoArray);
    }



    #保存
    public function save(){


        if(empty($_POST)){
            return api_arr(1,"Please complete");exit;
        }
       
        //字段数据组合
        if($_POST['tel']){
            $data['tel'] = $_POST['tel'];
        }
         if($_POST['address']){
            $data['address'] = $_POST['address'];
        }
         if($_POST['office_hours']){
            $data['office_hours'] = $_POST['office_hours'];
        }
         if($_POST['language']){
            $data['language'] = $_POST['language'];
        }
        if($_POST['header_title']){
            $data['header_title'] = $_POST['header_title'];
        }
        if($_POST['header_content']){
            $data['header_content'] = $_POST['header_content'];
        }

        #查询该语言是否添加内容
        $Cid = $this->daocont->where('language',$_POST['language'])->value('id');
        //判断是否存在
        if ($Cid) {
            $this->daocont
            ->where('language',$_POST['language'])
            ->data($data)
            ->update();
        } else {
            $this->dao->insert($data);
        }

    	#组合保存数据
        $infoArray = array(
            #修改者
            'modifier'   => $this->userId,
            #修改时间
            'modifytime' => date('Y-m-d H:i:s'),
            #修改ip
            'modifytip'  => $this->request->ip()
        );

        if($_POST['header']){
            $infoArray['header'] = $_POST['header'];
        }
        if($_POST['tel']){
            $infoArray['tel'] = $_POST['tel'];
        }
        if($_POST['email']){
            $infoArray['email'] = $_POST['email'];
        }
        if($_POST['coordinate']){
            $infoArray['coordinate'] = $_POST['coordinate'];
        }

    	#查询是否已配置
    	$configId = $this->dao->value('id');
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
            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

}
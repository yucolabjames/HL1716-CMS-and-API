<?php
// +----------------------------------------------------------------------
// | YUCOLAB [ HONG KONG MUSEUM ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 https://www.hl1716.yucolab.com All rights reserved.
// +----------------------------------------------------------------------
// | Base on ( ThinkPHP 5.0 http://thinkphp.cn)
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: gyj <375023402@qq.com>
// +----------------------------------------------------------------------
// | CreateTime: 2018-08-15 11:06:43
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;

class Contact extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15 11:06:47
     */
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

	/**
     * 分页获取地图列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15 11:06:50
     * @return 
     */
    public function index(){

       #查询数据
        $configArray = $this->dao->find();
        //添加查询语言类型
        $language = $_POST['language']?$_POST['language']:config('language');
        if(!empty($language)){
            $where['a.language'] = $language;
        }
        #查询内容
        $contArray = $this->daocont->alias('a')
        ->join('yu_language b','b.id = a.language')
        ->where($where)
        ->field('a.address,a.office_hours,a.header_title,a.header_content,b.language')
        ->select();
        #默认空数组
        $infoArray = array();
        #判断查询数据
        if ($configArray) {
            #组合返回数据
            $infoArray = array(
                #数据ID
                "id"         => $configArray['id'],
                #header图
                "header"     => $configArray['header'],
                #地图坐标
                'coordinate' => $configArray['coordinate'],
                #电话    
                'tel'        => $configArray['tel'],
                #邮箱 
                'email'      => $configArray['email'],
                #文件
                'domain'     =>$this->upload_host,
                #内容
                'data'       => $contArray,
                
            );
        }
        #返回数据
        return api_arr(0,'',$infoArray);
    }

    /**
     * 添加意见
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T15:22:41+0800
     * @return     
     */
    public function opinion(){
        $data = $_POST;
        //姓名非空验证
        if(empty($data['name'])){
            return api_arr(1,"name is require");
        }
        //邮箱非空验证
        if(empty($data['email'])){
            return api_arr(1,"email is require");
        }
        //内容非空验证
        if(empty($data['content'])){
            return api_arr(1,"content is require");
        }
        //语言类型非空验证
        if(empty($data['language'])){
            return api_arr(1,"language is require");
        }
        if($this->request->isPost()){
            $result = $this->op->insert($data);

            if ($result) {
                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }

        }
    }

}
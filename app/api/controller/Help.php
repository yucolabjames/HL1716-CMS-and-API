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
// | CreateTime: 2018-08-15 10:32:27
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;

class Help extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:19:02+0800
     */
	public function __construct()
    {
        parent::__construct();

        //实例化帮助信息数据库
        $this->dao       = db('help');
        //获取传输json内容
        $this->dataArray = get_JsonData();

    }

	/**
     * 分页获取帮助信息列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:24:48+0800
     * @return 
     */
    public function index(){

    

        //获取语言类型是否存在,如果存在添加查询条件
        $language = $_POST['language']?$_POST['language']:config('language');
        if(!empty($language)){
            $where['a.language'] = $language;
        }

        //帮组信息编号是否存在,如果存在添加查询条件
        $id_str = $_POST['ids'];
        if(!empty($id_str)){
            $where['a.id'] = array('in',$id_str);
        }

        //帮助信息键key是否存在,如果存在添加查询条件
        $key_str = $_POST['keys'];
        if(!empty($key_str)){
            $where['a.key'] = array('in',$key_str);
        }

 
        //分页查询帮助信息列表
        $list = $this->dao->alias('a')
        ->join('yu_language b','b.id = a.language')
        ->where($where)
        ->order('a.id desc')
        ->field('a.id,a.name,a.key,a.txt,a.image,a.content,a.create_time,b.language')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();

        $data= $list['data'];
        foreach ($data as $key => $value) {
            $list['data'][$key]['content'] = json_decode($value['content'],true)?json_decode($value['content'],true):$value['content'];
        }
    	//返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 获取预约页面展览馆信息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-24T14:25:11+0800
     * @return    
     */
    public function zone(){
        $language = $_POST['language']?$_POST['language']:config('language');
        if(!empty($language)){
            $where['a.language'] = $language;
        }

        //数据读取
        $zone = db('home')->alias('a')
        ->join('yu_language b','b.id = a.language')
        ->where('a.language',$language)
        ->field('a.*,b.language as language_key')
        ->value('a.zone');

        $zone = $zone?json_decode($zone,true):array();
        return api_arr(0,'',$zone);
    }

}
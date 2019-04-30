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
namespace app\admin\controller;
use app\admin\controller\Common;
use think;
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

    }

	/**
     * 分页获取帮助信息列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:24:48+0800
     * @return 
     */
    public function index(){

        //获取语言类型
        $language = $this->language;

        //分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;

        //判断语言类型参数是否存在
        if(!empty($language)){
            $where['language'] = $language;
        }
        
         //帮助信息键key是否存在,如果存在添加查询条件
        $key_str = $_POST['keys'];
        if(!empty($key_str)){
            $where['key'] = array('in',$key_str);
        }
        //分页查询帮助信息列表
        $list = $this->dao
        ->where($where)
        ->order('id desc')
        ->field('id,name,key,txt,image,content,language,create_time')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();

        $list['last_page']=$list['last_page']==0?1:$list['last_page'];
        $data = $list['data'];
        foreach ($data as $key => $value) {
            $list['data'][$key]['content'] = json_decode($value['content'],true)?json_decode($value['content'],true):$value['content'];
        }
    	//返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 添加帮助信息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:29:27+0800
     * @return
     */
    public function add(){
        $infoArray = $this->json_data;
        //验证必填项
        if(empty($infoArray['name'])){
            return api_arr(1,"Lack of parameters of name");
        }
        if(empty($infoArray['key'])){
            return api_arr(1,"Lack of parameters of key");
        }
        if(empty($infoArray['language'])){
            return api_arr(1,"Lack of parameters of language");
        }
        unset($infoArray['userid']);
        if(!empty($infoArray['content'])){
            $infoArray['content'] = json_encode($infoArray['content']);
        }
        $infoArray['create_time'] = time();
        $res = $this->dao->insertGetId($infoArray);
        //判断是否成功
        if ($res || $res === 0) {
            //添加日志
            $this->logs('Add help', 'ID:'.$res,1);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

    /**
     * 编辑帮助信息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:38:34+0800
     * @return     
     */
    public function modify(){
        $infoArray = $this->json_data;

        $intId = $infoArray['id'];
        //判断是否选择
        if (!$intId) {
            return api_arr(1,"Please select the help that needs to be modified.");exit;
        }

        unset($infoArray['userid']);

        if(!empty($infoArray['content'])){
            $infoArray['content'] = json_encode($infoArray['content']);
        }
        $res = $this->dao->where('id',$intId)->data($infoArray)->update();
        //判断是否成功
        if ($res || $res === 0) {
            //添加日志
            $this->logs('Modify help', 'ID:'.$intId,2);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

   

    /**
     * 删除帮助信息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:41:28+0800
     * @return     
     */
    public function del() {
        $intId = $this->request->param('id');
        if ($intId) {
            //查询帮助信息名称
            $log_name = $this->dao->where('id',$intId)->value('name');
            #删除
            $res = $this->dao->where('id',$intId)->delete();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Delete help', $log_name,3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the help you need to delete.');
        }
    }

}
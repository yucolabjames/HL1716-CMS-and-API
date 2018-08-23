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
// | CreateTime: 2018-08-15 15:44:09
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class News extends Common
{
	protected $dao,$dataArray,$daoType,$daoTypename,$content;
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T15:46:21+0800
     */
	public function __construct()
    {
        parent::__construct();

        //实例化问答数据库
        $this->dao         = db('news');
        //实例化类型名称数据库
        $this->content     = db('news_content');
        //实例化类型数据库
        $this->daoType     = db('news_type');
        //实例化类型名称数据库
        $this->daoTypename = db('news_typename');
        //获取传输json内容
        $this->dataArray   = get_JsonData();
    }

	/**
     * 获取最新消息列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T15:46:36+0800
     * @return     
     */
    public function index(){
    	//获取类型
    	$typeid = $this->request->param('typeid');
        //获取语言类型
        $language = $this->request->param('language')?$this->request->param('language'):config('language');

        $info = $this->content->where('id',1)->find();
        $data = $info;
        $banner = array('title'=>'Make sure you’re ready for GDPR','date'=>'1518105600','image'=>'uploads/2018/08-15/relatedSample.jpg');
        $banners[] = $banner;
        $banners[] = $banner;
        $banners[] = $banner;
        $data['banner'] = json_encode($banners);
        $result = $this->content->update($data);

        //分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;
        //是否显示
        $where = 'a.isview = 1';
    	//判断类型是否选择
    	if ($typeid) {
            $where .= " and a.type_id='$typeid'";
        }
         $where_type = "";
        //判断语言类型是否存在
        if ($language) {
            $where .= " and b.language='$language' and c.language = '$language'";
            $where_type = " and b.id = ".$language;
        }

        //查询
        $list = $this->dao->alias('a')
        ->join('yu_news_content b','b.news_id = a.id')
        ->join('yu_news_typename c','c.type_id = a.type_id')
        ->where($where)
        ->order('id desc')
        ->field('a.id,a.isview,a.cover,a.header,a.type_id,a.sort,b.language,b.title,b.description,b.date,b.content,b.banner,c.name as type_name')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        
        foreach ($list['data'] as $k=>$v) {

            //查询内容
            $data['language'] = $v['language'];
            $data['title'] = $v['title'];
            $data['description'] = $v['description'];
            $data['date'] = $v['date'];
            $data['content'] = $v['content'];
            $data['banner'] = $v['banner'];
            $list['data'][$k]['data'] = $data;
            //滚动图
            $list['data'][$k]['banner'] = json_decode($v['banner'],true);

            $list['data'][$k]['data'][0]['banner'] = json_decode($v['banner'],true);
        }

        $list['domain'] = $this->upload_host;
    	//返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 获取某一条最新消息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-16T11:25:09+0800
     * @return     
     */
    public function get(){
        if($this->request->isPost()){
            $id = $_POST['id'];
            if(empty($id)){
               return api_arr(0,'','missing parameters of id'); 
            }
            $where['a.id'] = $id;
            //获取语言类型
            $language = $this->request->param('language')?$this->request->param('language'):config('language');
            //判断语言类型是否存在
            if ($language) {
                $where['b.language'] = $language;
                $where['c.language'] = $language;
            }

            $info = $this->dao->alias('a')
            ->join('yu_news_content b','b.news_id = a.id')
            ->join('yu_news_typename c','a.type_id = c.type_id')
            ->where($where)
            ->field('a.id,a.header ,b.description,b.content,b.banner,c.name as type_name')
            ->find();
            if($info){
                $info['banner'] = json_decode($info['banner'],true);
                return api_arr(0,'',$info); 
            }else{
                return api_arr(1,'not found'); 
            }
        }
    }


    /**
     * 获取类型
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T15:47:37+0800
     * @return     
     */
    public function typelist(){

        //获取查询条件 
        $language = $_POST['language']?$_POST['language']:config('language');
        if(!empty($language)){
            $where['b.language'] = $language;
        }

        $page_size = empty($_POST['pagesize'])?3:$_POST['pagesize'];

        //查询
        $configArray = db('news_type')->alias('a')
        ->join('yu_news_typename b','b.type_id = a.id')
        ->join('yu_language c','c.id = b.language')
        ->where($where)
        ->order('a.id desc')
        ->field('a.id,a.sort,b.name,c.language')
        ->limit($page_size)
        ->select();
        //返回数据
        return api_arr(0,'',$configArray);
    }

}
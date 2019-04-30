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
// | CreateTime: 2018-09-03 10:10:12
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;
use think;
class NewsComment extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-03 10:10:24
     */
	public function __construct()
    {
        parent::__construct();

        //实例化新闻评论数据库
        $this->dao       = db('news_comment');

    }

	/**
     * 分页获取新闻评论列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-03 10:11:00
     * @return 
     */
    public function index(){
        //判断请求类型
        if($this->request->isPost()){
            //分页
            $page   = $this->request->param('page')?$this->request->param('page'):1;

            $where['a.enable'] = 1;
            //新闻编号
            $news_id = $this->request->param('news_id');
            if(!empty($news_id)){
                $where['a.news_id'] = $news_id;
            }
            //获取语言类型
            $language = $this->request->param('language')?$this->request->param('language'):config('language');
            if(!empty($language)){
                $where['a.language'] = $language;
                $where['b.language'] = $language;
            }


            //分页查询新闻评论列表
            $list = $this->dao->alias('a')
            ->join('yu_news_content b','a.news_id = b.news_id')
            ->join('yu_language c','a.language = c.id')
            ->where($where)
            ->order('a.create_time desc')
            ->field('a.id,a.language,a.user_name,a.content,a.create_time,b.title,c.name as language')
            ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
            ->toArray();
            
            //返回数据
            return api_arr(0,'',$list);
        }
        
    }

    /**
     * 添加新闻评论
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 17:08:36
     * @return
     */
    public function add(){
        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);

            //验证必填项
            $must_arr = ['news_id','language','user_name','content'];
            foreach ($must_arr as  $value) {
                if(empty($data[$value])){
                    return api_arr(1,"Lack of parameters of ".$value);
                }
            }

            $data['create_time'] =  time();
            //数据更新
            $res = $this->dao->insertGetId($data);
            //判断是否成功
            if ($res || $res === 0) {

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
        
    }
}
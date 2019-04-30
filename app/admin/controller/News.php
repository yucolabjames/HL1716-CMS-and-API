<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 最新消息
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

class News extends Common
{
	protected $dao,$dataArray,$daoType,$daoTypename,$content;
	public function __construct()
    {
        parent::__construct();

        #实例化问答数据库
        $this->dao         = db('news');
        #实例化类型名称数据库
        $this->content     = db('news_content');
        #实例化类型数据库
        $this->daoType     = db('news_type');
        #实例化类型名称数据库
        $this->daoTypename = db('news_typename');
        #获取传输json内容
        $this->dataArray   = get_JsonData();
    }

	#获取最新消息列表
    public function index(){
    	#获取类型
    	$typeid = $this->request->param('typeid');
        #分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;
        //获取语言类型
        $language = $this->language;
        
    	//判断类型是否选择
        if ($typeid) {
            $where['a.type_id'] = $typeid;
        }
        //判断语言类型是否存在
        if ($language) {
           $where['b.language&c.language'] = $language;
        }

        //查询
        $list = $this->dao->alias('a')
        ->join('yu_news_content b','b.news_id = a.id')
        ->join('yu_news_typename c','c.type_id = a.type_id')
        ->where($where)
        ->order('a.id desc')
        ->field('a.id,a.isview,a.cover,a.header,a.type_id,a.sort,b.title,b.description,b.date,b.content,b.banner,c.name as type_name')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        $list['last_page']=$list['last_page']==0?1:$list['last_page'];
        $data = $list['data'];
        foreach ($data as $key => $value) {
            $list['data'][$key]['cover'] = $value['cover'];
            $list['data'][$key]['header'] = $value['header'];
            $banner = $value['banner']?json_decode($value['banner'],true):'';
            $list['data'][$key]['banner'] = $banner;
            if(!empty($banner)){
                foreach ($banner as $k => $val) {
                    $list['data'][$key]['banner'][$k]['image'] = $val['image'];
                }
            }
            //查询当前新闻评论数
            $comments = db('news_comment')->where('news_id',$value['id'])->count();
            $list['data'][$key]['comments'] = $comments;
            //$list['data']['date'] = date('Y-m-d H:i',$value['date']);
            
        }
    	#返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 获取某一条最新消息
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-16 15:58:56
     * @return     
     */
    public function get(){
        if($this->request->isPost()){
            $id = $_POST['id'];
            if(empty($id)){
               return api_arr(0,'','missing parameters of id'); 
            }

            $info = $this->dao->alias('a')
            ->join('yu_news_content b','b.news_id = a.id')
            ->where('a.id',$id)
            ->field('a.*,b.news_id,b.language as content_language,b.description,b.date,b.content,b.banner')
            ->find();
            if($info){
                $info['banner'] = json_decode($info['banner'],true);
                return api_arr(0,'',$info); 
            }else{
                return api_arr(1,'not found'); 
            }
        }
    }

    #添加最新消息
    public function add(){
        #验证必填项
        $validate = Loader::validate('News');
        if ($this->dataArray || empty($this->dataArray['data'])) {
            $ins_data = array();

            #循环赋值
            foreach($this->dataArray['data'] as $v){
                if ($validate->check($v)) {
                    $ins_data[] = array(
                        'language'    => $v['language'],
                        'title'       => $v['title'],
                        'description' => $v['description']?$v['description']:'',
                        'content'     => $v['content']?$v['content']:'',
                        'banner'     => $v['banner']?json_encode($v['banner']):'',
                        'date' =>time(),
                    );
                } else {
                    return api_arr(1,$validate->getError());exit;
                } 
            }

            #组合保存数据
            $infoArray = array(
                #类型id
                'type_id'   => $this->dataArray['type_id']?$this->dataArray['type_id']:0,
                #封面图
                'cover'     => $this->dataArray['cover']?$this->dataArray['cover']:'',
                #header图
                'header'    => $this->dataArray['header']?$this->dataArray['header']:'',
                #是否显示
                'isview'    => $this->dataArray['isview']?$this->dataArray['isview']:0,
                #创建者
                'creator'   => $this->userId,
                #ip
                'modifytip' => $this->request->ip()
            );

            //如果存在排序参数 更新数组添加排序字段
            if($this->dataArray['sort']){
                $infoArray['sort'] = $this->dataArray['sort'];   
            }

            $res = $this->dao->insertGetId($infoArray);
            #判断是否成功
            if ($res || $res === 0) {
                #添加内容
                foreach($ins_data as $k=>$v){
                    $ins_data[$k]['news_id'] = $res;
                }
                $this->content->insertAll($ins_data);

                #添加日志
                $this->logs('Add the latest news', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Parameter error');
        }
        
    }

    #修改最新消息
    public function modify(){
        $intId = $this->request->param('id');
        #验证必填项
        $validate = Loader::validate('News');
        if ($this->dataArray) {
            foreach($this->dataArray['data'] as $v){
                if ($validate->check($v)) {

                    $ins_data = $v;
                    if(!empty($v['banner'])){
                        $ins_data['banner'] = json_encode($v['banner']);
                    }
                    $ins_data['date'] = time();
                    $this->content
                    ->where("news_id='$intId' and language='{$v['language']}'")
                    ->data($ins_data)
                    ->update();

                } else {
                    return api_arr(1,$validate->getError());exit;
                } 
            }

            #组合保存数据
            $infoArray = array(
                #类型id
                'type_id'   => $this->dataArray['type_id']?$this->dataArray['type_id']:0,
                #封面图
                'cover'     => $this->dataArray['cover']?$this->dataArray['cover']:'',
                #header图
                'header'    => $this->dataArray['header']?$this->dataArray['header']:'',
                #创建者
                'modifier'   => $this->userId,
                #创建者
                'modifytime' => date('Y-m-d H:i:s'),
                #ip
                'modifytip'  => $this->request->ip()
            );

            //如果存在是否显示参数 更新数组添加是否显示字段
            if($this->dataArray['isview']){
                $infoArray['isview'] = $this->dataArray['isview'];   
            }

            //如果存在排序参数 更新数组添加排序字段
            if($this->dataArray['sort']){
                $infoArray['sort'] = $this->dataArray['sort'];   
            }

            $res = $this->dao->where('id',$intId)->data($infoArray)->update();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Modify the latest news', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Parameter error');
        }
        
    }

    #是否显示
    public function isview() {
        $intId = $this->request->param('id');
        $intType = $this->request->param('type');
        if ($intId && $intType) {
            $desc = $intType>0?'Modify the message status to display':'Modify the message status to block';
            #组合保存数据
            $infoArray = array(
                #是否显示
                'isview'     => $intType,
                #创建者
                'modifier'   => $this->userId,
                #创建者
                'modifytime' => date('Y-m-d H:i:s'),
                #ip
                'modifytip'  => $this->request->ip()
            );
            #删除
            $res = $this->dao->where('id',$intId)->data($infoArray)->update();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs($desc, 'ID:'.$intId,2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Parameter error');
        }
    }

    #删除消息
    public function del() {
        $intId = $this->request->param('id');
        if ($intId) {
            #查询名称
            $newsArray = $this->dao->where('id',$intId)->find();
            #删除
            $res = $this->dao->where('id',$intId)->delete();
            #判断是否成功
            if ($res || $res === 0) {
                #删除图片文件
                @unlink($newsArray['cover']);
                @unlink($newsArray['header']);

                #添加日志
                $this->logs('Delete the latest news', 'News ID:'.$intId,3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the message you want to delete');
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
        $language = $this->language;
        if(!empty($language)){
            $where['b.language'] = $language;
        }

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


    #添加类型
    public function addtype(){
        $name = $this->dataArray;
        //查询新闻分类数量,判断是否新闻类型已经大于3了
        $type_count = $this->daoType->count();
        if($type_count>2){
            return api_arr(1,"the maximum number of news type is 3");
        }
        #查询所有语言
        $languageArray = db('language')->field('id,language')->select();
        $ins_data = array();
        foreach ($languageArray as $v) {
            $strName = $name[$v['language']];
            #判断类型名称是否填写
            if (empty($strName)) {
                return api_arr(1,'Please fill in the full type name');exit;
            } else {
                #查询名称是否已存在
                $isName = $this->daoTypename->where('name',$strName)->value('id');
                if ($isName) {
                    return api_arr(1,'Name already exists');exit;
                }
                $ins_data[] = array(
                    'language' => $v['id'],
                    'name'     => $strName
                );
            }
        }

    	#组合写入数据
    	$infoArray = array(
            'creator'   => $this->userId,
            #修改ip
            'modifytip' => $this->request->ip()
    	);

        //如果存在排序参数 更新数组添加排序字段
        if($this->dataArray['sort']){
            $infoArray['sort'] = $this->dataArray['sort'];   
        }

    	$res = $this->daoType->insertGetId($infoArray);
    	#判断是否成功
        if ($res || $res === 0) {

            #插入类型名称
            foreach($ins_data as $k=>$v){
                $ins_data[$k]['type_id'] = $res;
            }
            $this->daoTypename->insertAll($ins_data);

            #添加日志
            $this->logs('Add the latest message type', 'Type ID:'.$res,1);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

    #修改类型
    public function modifytype(){

        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            unset($data['id']);

            //验证必填项
            if(empty($_POST['id'])){
                return api_arr(1,"Lack of parameters of id");
            }
            if(!empty($data['name']) && empty($_POST['language'])){
                return api_arr(1,"Lack of parameters of language");
            }

            //数据修改
            //修改类型名称
            if(!empty($data['name'])){
                $where_typename['type_id'] = $_POST['id'];
                $where_typename['language'] = $data['language'];
                $data_typename['name'] = $data['name'];
                $res = $this->daoTypename->where($where_typename)->update($data_typename);
                if(!$res){
                    return api_arr(1,"update type name fail");
                }
            }
            //修改类型排序
            if(!empty($data['sort'])){
                $where_type['id'] = $_POST['id'];
                $data_type['sort'] = $data['sort'];
                $data_type['modifier'] = $this->userId;
                $data_type['modifytime'] = time();
                $data_type['modifytip'] = $this->request->ip();
                $res = $this->daoType->where($where_type)->update($data_type);
                if(!$res){
                    return api_arr(1,"update type sort fail");
                }
            }
            return api_arr(0,'success');
        }
    }

    #删除类型
    public function deltype() {
        $intId = $this->request->param('id');
        if ($intId) {
            //查询该分类下是否有最新消息
            $news_count = $this->dao->where('type_id',$intId)->count();
            if($news_count>0){
                return api_arr(1,"this type has news,can't be delete");
            }
            #查询名称
            $nameStr = $this->daoTypename->where('type_id',$intId)->field('name')->select();
            #删除
            $res = $this->daoType->where('id',$intId)->delete();
            #判断是否成功
            if ($res || $res === 0) {
                #删除类型名称
                $this->daoTypename->where('type_id',$intId)->delete();
                #添加日志
                $this->logs('Delete the latest message type', 'Name:'.json_encode($nameStr),3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the type to delete');
        }
    }

}
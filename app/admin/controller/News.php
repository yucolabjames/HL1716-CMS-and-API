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

        $where = '1=1';
    	//判断类型是否选择
        if ($typeid) {
            $where .= " and type_id='$typeid'";
        }
         $where_type = "";
        //判断语言类型是否存在
        if ($language) {
            $where .= " and language='$language'";
            $where_type = " and b.id = ".$language;
        }

        //查询
        $list = $this->dao
        ->where($where)
        ->order('id desc')
        ->field('id,isview,cover,header,type_id,sort')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();

        foreach ($list['data'] as $k=>$v) {
            //查询类型名称
            $list['data'][$k]['type_name'] = $this->daoTypename->alias('a')
            ->join('yu_language b','b.id = a.language')
            ->where("a.type_id='{$v['type_id']}' ".$where_type)
            ->value('a.name');
            //查询内容
            $list['data'][$k]['data'] = $this->content
            ->where("news_id='{$v['id']}'")
            ->field('language,title,description,date,content,banner')
            ->select();
            $list['data'][$k]['data'][0]['banner'] = json_decode($list['data'][$k]['data'][0]['banner'],true);
        }

        $list['domain'] = $this->upload_host;
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
        if(IS_POST){
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
                        'description' => $v['description'],
                        'content'     => $v['content']
                    );
                } else {
                    return api_arr(1,$validate->getError());exit;
                } 
            }

            #组合保存数据
            $infoArray = array(
                #类型id
                'type_id'   => $this->dataArray['type_id'],
                #封面图
                'cover'     => $this->dataArray['cover'],
                #header图
                'header'    => $this->dataArray['header'],
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

                    #修改内容
                    $ins_data = array(
                        'title'       => $v['title'],
                        'description' => $v['description'],
                        'content'     => $v['content']
                    );
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
                'type_id'    => $this->dataArray['type_id'],
                #封面图
                'cover'      => $this->dataArray['cover'],
                #header图
                'header'     => $this->dataArray['header'],
                #创建者
                'modifier'   => $this->userId,
                #创建者
                'modifytime' => date('Y-m-d H:i:s'),
                #ip
                'modifytip'  => $this->request->ip()
            );

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
        $language = $_POST['language']?$_POST['language']:config('language');
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

        #查询所有语言
        $languageArray = db('language')->select();
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
                    'language' => $v['idate(format)'],
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
        $intId = $this->request->param('id');
        $name  = $this->dataArray;
        #验证类型id
        if(!$intId){
            return api_arr(1,'Please choose the type');exit;
        }

        #查询所有语言
        $languageArray = db('language')->field('language')->select();
        foreach ($languageArray as $v) {
            #类型名称
            $strName  = $name[$v['language']];
            #判断类型名称是否填写
            if (empty($strName)) {
                return api_arr(1,'Please fill in the full type name');exit;
            } else {
                #查询名称是否已存在
                $isName = $this->daoTypename->where("name='$strName' and type_id!='$intId'")->value('id');
                if ($isName) {
                    return api_arr(1,'Name already exists');exit;
                }
                #修改类型名称
                $ins_data = array('name'=>$strName);
                $this->daoTypename
                ->where("type_id='$intId' and language='{$v['language']}'")
                ->data($infoArray)
                ->update();
            }
        }

        #组合写入数据
        $infoArray = array(
            #创建者
            'modifier'   => $this->userId,
            #创建时间
            'modifytime' => date('Y-m-d H:i:s'),
            #修改ip
            'modifytip' => $this->request->ip()
        );

        //如果存在排序参数 更新数组添加排序字段
        if($this->dataArray['sort']){
            $infoArray['sort'] = $this->dataArray['sort'];   
        }

        $res = $this->daoType->where('id',$intId)->data($infoArray)->update();
        #判断是否成功
        if ($res || $res === 0) {
            #添加日志
            $this->logs('Modify the latest message type', 'Type ID:'.$res,2);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

    #删除类型
    public function deltype() {
        $intId = $this->request->param('id');
        if ($intId) {
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
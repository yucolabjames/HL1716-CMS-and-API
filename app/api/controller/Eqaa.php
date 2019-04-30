<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 专家问答
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\api\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;
use think\Lang;

class Eqaa extends Common
{
	protected $dao,$dataArray,$daoType,$daoTypename;
	public function __construct()
    {
        parent::__construct();

        #实例化问答数据库
        $this->dao       = db('eqaa');
        #实例化类型数据库
        $this->daoType   = db('eqaa_type');
        #实例化类型名称数据库
        $this->daoTypename = db('eqaa_typename');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取专家问答
    public function index(){
       // $lang = Lang::range('en-us');
       // Lang::load(APP_PATH.'api/index/lang/'.$lang.EXT,$lang);//加载当前语言包

    	#获取类型
    	$typeid = $this->request->param('typeid');

        //获取语言类型
        $language = $this->request->param('language')?$this->request->param('language'):config('language');

        //关键词搜索
        $keyword = $this->request->param('keyword')?$this->request->param('keyword'):'';

        #分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;
        //是否显示
        $where = ' 1=1 ';
        $where = 'isview = 1';
    	#判断类型是否选择
        if ($typeid) {
            $where .= " and type_id='$typeid'";
        }
        //判断语言类型是否存在
        if ($language) {
            $where .= " and language='$language'";
        }
        //判断关键词是否存在
        if(!empty($keyword)){
            $where .=" and (ask like '%".$keyword."%' or answer like '%".$keyword."%') ";
        }
        #查询专家问答
        $list = $this->dao
        ->where($where)
        ->order('sort asc,id desc')
        ->field('id,status,isview,type_id,ask,answer,language')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        
        foreach ($list['data'] as $k=>$v) {
            #查询类型名称
            $list['data'][$k]['type_name'] = $this->daoTypename->alias('a')
            ->join('yu_language b','b.id = a.language')
            ->where("a.type_id='{$v['type_id']}' and a.language = ".$v['language'])
            ->value('a.name');
        }
    	#返回数据
    	return api_arr(0,'',$list);
    }

    #获取专家问答类型
    public function typelist(){

        //获取语言类型
        $language = $this->request->param('language')?$this->request->param('language'):config('language');
         //判断语言类型是否存在
        if ($language) {
            $where['b.language'] = $language;
        }

        #查询
        $configArray = $this->daoType->alias('a')
        ->join('yu_eqaa_typename b','b.type_id = a.id')
        ->join('yu_language c','c.id = b.language')
        ->where($where)
        ->order('a.sort asc,a.id desc')
        ->field('a.id,b.name,c.language')
        ->select();

        #返回数据
        return api_arr(0,'',$configArray);
    }

    #提交专家问答
    public function add(){
        if($this->request->isPost()){
            //验证不为空字段
            //验证姓名不为空
            if(empty($_POST['name'])){
                return api_arr(1,"name is require");
            }
            //验证邮箱不为空
            if(empty($_POST['email'])){
                return api_arr(1,"email is require");
            }
            //验证问答类型不为空
            if(empty($_POST['type_id'])){
                return api_arr(1,"type_id is require");
            }
            //验证问答问题不为空
            if(empty($_POST['ask'])){
                return api_arr(1,"ask is require");
            }
            //验证问答类型不为空
            if(empty($_POST['language'])){
                return api_arr(1,"language is require");
            }

            #组合保存数据
            $infoArray = array(
                #设置为已解答
                'status'    => 0,
                #姓名
                'name'    => $_POST['name'],
                #邮件
                'email'    => $_POST['email'],
                #电话
                'tel'    => $_POST['tel'],
                #类型id
                'type_id'   => $_POST['type_id'],
                #问题
                'ask'       => $_POST['ask'],
                #ip
                'modifytip' => $this->request->ip(),
                #语言类型
                'language' =>$_POST['language'],

            );

            $res = $this->dao->insertGetId($infoArray);
            #判断是否成功
            if ($res || $res === 0) {
                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        }
       
    }

}
<?php
// +----------------------------------------------------------------------
// | Creation time 2018-08-10
// +----------------------------------------------------------------------
// | Brief 专家问答
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\Loader;

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
        #实例化语言类型数据库
        $this->daoLanguage = db('language');
        #获取传输json内容
        $this->dataArray = get_JsonData();
    }

	#获取专家问答
    public function index(){
    	#获取类型
    	$typeid = $this->request->param('typeid');

        //获取语言类型
        $language = $this->language;

        #分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;

    	#判断类型是否选择
        if ($typeid) {
            $where['type_id'] = $typeid;
        }
        //判断语言类型是否存在
        if ($language) {
            $where['language'] = $language;
        }

        if($this->request->param('status')!=-1){
            $where['status'] = $this->request->param('status');
        }

        #查询专家问答
        $list = $this->dao
        ->where($where)
        ->order('sort asc,id desc')
        ->field('id,status,isview,type_id,ask,answer,language,name,email,tel,createtime,modifytime')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        
        $list['last_page']=$list['last_page']==0?1:$list['last_page'];
        
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

    #添加专家问答
    public function add(){
        #验证必填项
        $validate = Loader::validate('Eqaa');
        if ($validate->check($this->dataArray)) {
            #组合保存数据
            $infoArray = array(
                #设置为已解答
                'status'    => 1,
                //设置为已显示
                'isview' =>1,
                #类型id
                'type_id'   => $this->dataArray['type_id'],
                #问题
                'ask'       => $this->dataArray['ask'],
                #答案
                'answer'    => $this->dataArray['answer'],
                #创建者
                'creator'   => $this->userId,
                #ip
                'modifytip' => $this->request->ip()
            );
             //如果存在排序参数 更新数组添加排序字段
            if($this->dataArray['sort']){
                $infoArray['sort'] = $this->dataArray['sort'];   
            }

            //如果存在语言类型编号 更新数组添加语言类型编号
            if($this->dataArray['language']){
                $infoArray['language'] = $this->dataArray['language'];   
            }

            $res = $this->dao->insertGetId($infoArray);
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Add expert question and answer', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,$validate->getError());
        }
    }

    #修改专家问答
    public function modify(){
        $this->dataArray = $_POST;
        $intId = $this->request->param('id');
        #验证必填项
        $validate = Loader::validate('Eqaa');
        if ($validate->check($this->dataArray)) {
            #判断是否选择
            if (!$intId) {
                return api_arr(1,"Please select the question and answer that needs to be modified.");exit;
            }

            #组合保存数据
            $infoArray = array(
                //已回答
                'status' =>1,
                //已显示
                'isview' =>1,
                #类型id
                'type_id'    => $this->dataArray['type_id'],
                #问题
                'ask'        => $this->dataArray['ask'],
                #答案
                'answer'     => $this->dataArray['answer'],
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

            //如果存在语言类型编号 更新数组添加语言类型编号
            if($this->dataArray['language']){
                $infoArray['language'] = $this->dataArray['language'];   
            }
            $res = $this->dao->where('id',$intId)->data($infoArray)->update();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Modify expert question and answer', 'ID:'.$intId,2);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,$validate->getError());
        }
    }

    #是否显示专家问答
    public function isview() {
        $intId = $this->request->param('id');
        $intType = $this->request->param('type');
        if ($intId && $intType) {
            $desc = $intType>0?'Show expert question and answer':'Shield expert question and answer';
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

    #删除专家问答
    public function del() {
        $intId = $this->request->param('id');
        if ($intId) {
            #查询问题
            $nameStr = $this->dao->where('id',$intId)->value('ask');
            #删除
            $res = $this->dao->where('id',$intId)->delete();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Delete expert question and answer', 'PProblem:'.$nameStr,3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the question and answer you need to delete.');
        }
    }

    #获取专家问答类型
    public function typelist(){

        #查询
        $where['b.language'] = $this->language;
        $configArray = $this->daoType->alias('a')
        ->join('yu_eqaa_typename b','a.id = b.type_id')
        ->where($where)
        ->order('a.id desc')
        ->field('a.id,a.sort,b.name')
        ->select();

        #返回数据
        return api_arr(0,'',$configArray);
    }

    #添加专家问答类型
    public function addtype(){
        $name = $this->dataArray;

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
            $this->logs('Add expert question and answer types', 'Type ID:'.$res,1);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
    }

    #修改专家问答类型
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

    #删除专家问答类型
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
                $this->logs('Delete expert question and answer type', 'Name:'.json_encode($nameStr),3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the type to delete');
        }
    }

}
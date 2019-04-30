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
namespace app\admin\controller;
use app\admin\controller\Common;

class Map extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15 11:06:47
     */
	public function __construct()
    {
        parent::__construct();

        //实例化地图数据库
        $this->dao       = db('map');

    }

	/**
     * 分页获取地图列表
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15 11:06:50
     * @return 
     */
    public function index(){

        //获取语言类型
        $language = $this->language;

        //分页
        $page   = $this->request->param('page')?$this->request->param('page'):1;

        //启用状态
        $where = 'enable = 1';

        //判断语言类型参数是否存在
        if(!empty($language)){
            $where.=" and language =".$language;
        }
        
        //分页查询地图列表
        $list = $this->dao
        ->where($where)
        ->order('id desc')
        ->field('id,longitude,latitude,address,business_time,tel,email')
        ->paginate(array('list_rows'=>config('list_rows'),'page'=>$page,'type'=>'Bootstrap'))
        ->toArray();
        $list['last_page']=$list['last_page']==0?1:$list['last_page'];
    	//返回数据
    	return api_arr(0,'',$list);
    }

    /**
     * 添加地图
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15 11:06:55
     * @return
     */
    public function add(){
        //验证必填项
        $validate = Loader::validate('Map');
        if ($validate->check($this->dataArray)) {
            //组合保存数据
            $infoArray = $this->dataArray;

            $res = $this->dao->insertGetId($infoArray);
            //判断是否成功
            if ($res || $res === 0) {
                //添加日志
                $this->logs('Add map', 'ID:'.$res,1);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,$validate->getError());
        }
    }

    /**
     * 编辑地图
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:38:34+0800
     * @return     
     */
    public function modify(){
        $intId = $this->request->param('id');
        //判断是否选择
        if (!$intId) {
            return api_arr(1,"Please select the map that needs to be modified.");exit;
        }

        //组合保存数据
        $infoArray = $this->dataArray;

        $res = $this->dao->where('id',$intId)->data($infoArray)->update();
        //判断是否成功
        if ($res || $res === 0) {
            //添加日志
            $this->logs('Modify map', 'ID:'.$intId,2);

            return api_arr(0,"success");
        } else {
            return api_arr(1,"err！");
        }
       
    }

   

    /**
     * 删除地图
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-15T10:41:28+0800
     * @return     
     */
    public function del() {
        $intId = $this->request->param('id');
        if ($intId) {
            //查询地图名称
            $log_name = $this->dao->where('id',$intId)->value('name');
            #删除
            $res = $this->dao->where('id',$intId)->delete();
            #判断是否成功
            if ($res || $res === 0) {
                #添加日志
                $this->logs('Delete map', $log_name,3);

                return api_arr(0,"success");
            } else {
                return api_arr(1,"err！");
            }
        } else {
            return api_arr(1,'Please select the map you need to delete.');
        }
    }

}
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
        $language = $this->request->param('language')?$this->request->param('language'):config('language');

        //记录数
        $page_size   = $this->request->param('pagesize')?$this->request->param('pagesize'):10;

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
        ->paginate($page_size)
        ->toArray();
    	//返回数据
    	return api_arr(0,'',$list);
    }

}
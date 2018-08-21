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
// | CreateTime: 2018-08-20 10:33:07
// +----------------------------------------------------------------------
namespace app\admin\controller;
use app\admin\controller\Common;

class Holiday extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 10:33:35
     */
	public function __construct()
    {
        parent::__construct();

        //实例化假期数据库
        $this->dao       = db('holiday');
        //实例化假期名称数据库
        $this->daoname   = db('holidayname');

    }

	/**
     * 获取某年当月假期
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 10:34:31
     * @return 
     */
    public function get(){

        if($this->request->isPost()){
             //获取语言类型
            $language = $_POST['language']?$_POST['language']:config('language');

            //年-月份 
            $month = $_POST['month'];

            //判断语言类型参数是否存在
            if(!empty($language)){
                $where['b.language'] = $language;
            }
            
            //判断年月日期是否存在
            if(!empty($month)){
                $where['a.date'] = array(array('egt',strtotime($month.'-01')),array('elt',strtotime($month."-01 +1 month -1 day")));
            }
            //分页查询假期列表
            $list = $this->dao->alias('a')
            ->join('yu_holidayname b','b.type_id = a.id')
            ->where($where)
            ->order('a.date asc')
            ->field('a.id,a.date,b.summary')
            ->select();
            if(!$list){
                return api_arr(1,'no data');
            }
            //返回数据
            return api_arr(0,'',$list);
        }
       
    }

    /**
     * 更新假期
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 11:24:39
     * @return
     */
    public function update(){
        if(!$this->request->isPost()){
            //获取公众假期最新数据
            $content1 = file_get_contents(config('holiday.en'));//英文
            $content2 = file_get_contents(config('holiday.sc'));//中文
            $content3 = file_get_contents(config('holiday.tc'));//繁体

            //将字符串切割成数组
            $content1_arr = explode('UID:', $content1);
            $content2_arr = explode('UID:', $content2);
            $content3_arr = explode('UID:', $content3);

            $holiday1['language'] = 1;
            $holiday2['language'] = 2;
            $holiday3['language'] = 3;
            //循环数组 截取日期和假期描述
            foreach ($content1_arr as $key => $value) {
                $val1 = explode('@1823.gov.hk', $content1_arr[$key]);

                if(checkDateIsValid($val1[0])){
                    $holiday1['date'] = strtotime($val1[0]);
                    $holiday1['summary'] =trim(explode('END:VEVENT',str_replace( 'SUMMARY:','',$val1[1]) )[0]);
                    $arr1[] = $holiday1;
                }
                $val2 = explode('@1823.gov.hk', $content2_arr[$key]);
                if(checkDateIsValid($val2[0])){
                    $holiday2['date'] = strtotime($val2[0]);
                    $holiday2['summary'] =trim(explode('END:VEVENT',str_replace( 'SUMMARY:','',$val2[1]) )[0]);
                    $arr2[] = $holiday2;
                }
                $val3 = explode('@1823.gov.hk', $content3_arr[$key]);
                if(checkDateIsValid($val3[0])){
                    $holiday3['date'] = strtotime($val3[0]);
                    $holiday3['summary'] =trim(explode('END:VEVENT',str_replace( 'SUMMARY:','',$val3[1]) )[0]);
                    $arr3[] = $holiday3;
                }
                
            }

            //去除数组变量
            unset($holiday1);
            unset($holiday2);
            unset($holiday3);

            //查询假期最新一条数据 获取日期
            $last = $this->dao->order('date desc')->value('date');
            //假期数组去除已生成数据
            foreach ($arr1 as $k => $val) {
                //判断数据库是否已存在 如果不存在插入数据
                if($val['date']>$last){
                    $data = $val;
                    try{
                        $type_id = $this->dao->strict(false)->insertGetId($data);
                        $arr1[$k]['type_id'] = $arr2[$k]['type_id'] = $arr3[$k]['type_id'] = $type_id;
                        $datas =  array($arr1[$k],$arr2[$k],$arr3[$k]);
                        $res = $this->daoname->strict(false)->insertAll($datas);
                        unset($data);
                        unset($datas);
                        if(!$res){
                            return api_arr(1,'fail');
                        }
                    } catch (\Exception $e) {
                        $this->ajaxException($e);
                    }
                }
            }
            return api_arr(0,'success'); 
            exit;

        }
    }
}
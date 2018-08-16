<?php
/* 
 * Copyright (C) 2018 All rights reserved.
 * @Version 1.0
 * @Remark 公共方法
 */
namespace app\admin\controller;
use think\Request;
use think\Db;
use think\Controller;
class Common extends Controller
{
    protected $userId,$ur,$upload_host;
    public function _initialize()
    {
        parent::_initialize();

        #图片访问域名
        $this->upload_host = $this->request->domain().'/yucolabcms/public/';

        #获取控制器
        $con=strtolower($this->request->controller());
        $act=strtolower($this->request->action());

        #记录放开的权限
        $allow=array('login-index','index-index');
        #排除登录操作
        if (!in_array($con."-".$act,$allow)) {

            #验证是否登录
            $user_id = encrypt($this->request->param('userid'),'D');
            if(!$user_id){
                echo json_encode(api_arr(1,'Login status is invalid, please log in again!'));exit;
            }

            #获取管理员信息
            $this->userId = $user_id;
            $this->ur     = Db::name('administrator')
            ->where('id',$this->userId)
            ->find();       
        }


    }

    /*
     * 操作日志
     * @param string $act 动作
     * @param string $desc 描述
    */
    public function logs($act, $desc, $type) {
        $log_arr = array(
            'type'     => $type,
            'userid'   => $this->userId,
            'ip'       => $this->request->ip(),
            'act'      => addslashes($act),
            'log_desc' => addslashes($desc)
        );
        Db::name('logs')->insert($log_arr);
    }
}

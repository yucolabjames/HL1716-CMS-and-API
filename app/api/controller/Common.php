<?php
namespace app\api\controller;
use think\Config;
use think\Input;
use think\Db;
use clt\Leftnav;
use think\Request;
use think\Controller;

class Common extends Controller{

    public function _initialize(){
        #图片访问域名
        $this->upload_host = $this->request->domain().'/yucolabcms/public/';
    }

}
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: gangh
// +----------------------------------------------------------------------
header("Access-Control-Allow-Origin: *");
// [ 应用入口文件 ]
header("Content-type:charset=utf-8");
// 定义应用目录
define('APP_PATH', __DIR__ . '/../app/');
// 加载框架引导文件
require __DIR__. '/../thinkphp/start.php';

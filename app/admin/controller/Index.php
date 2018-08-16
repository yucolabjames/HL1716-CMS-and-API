<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;

class Index extends Common
{
    public function index(){
    	$list_rows = 1;
    	$list = db('administrator')
    	->paginate(array('list_rows'=>config('list_rows'),'page'=>1,'type'=>'Bootstrap'))
        ->toArray();
print_r($list);
    }
}
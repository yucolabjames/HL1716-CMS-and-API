<?php
namespace app\admin\validate;

use think\Validate;

class Webmenu extends Validate{
    protected $rule = [
        'name'     => 'require',
        'action'   => 'require',
        'language' => 'require'
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'name.require'     => 'Please fill in the name of the menu',
	    'action.require'   => 'Please fill in the menu and visit',
	    'language.require' => 'Please fill in menu language.'
	];
}


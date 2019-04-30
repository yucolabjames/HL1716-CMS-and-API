<?php
namespace app\admin\validate;

use think\Validate;

class Help extends Validate{
    protected $rule = [
    	'name' => 'require',
    	'key' => 'require',
        'language' => 'require',
        
    ];
    // 验证规则默认提示信息
	protected $message = [
		'name.require' => 'Please fill in the name',
		'key.require' => 'Please fill in the key',
	    'language.require' => 'Please choose the language',
	];
}


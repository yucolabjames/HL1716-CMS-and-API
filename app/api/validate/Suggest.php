<?php
namespace app\api\validate;

use think\Validate;

class Suggest extends Validate{
    protected $rule = [
        'name' => 'require',
        'email'     => 'require',
        'language'     => 'require',

    ];
    // 验证规则默认提示信息
	protected $message = [
	    'name.require' => 'Please fill in the name',
	    'email.require'     => 'Please fill in the email',
	    'language.require'  => 'Please  choose the language'
	];
}


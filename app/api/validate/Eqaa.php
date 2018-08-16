<?php
namespace app\api\validate;

use think\Validate;

class Eqaa extends Validate{
    protected $rule = [
        'type_id' => 'require',
        'ask'     => 'require',
        'answer'  => 'require',
        'language'=> 'require',
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'type_id.require' => 'Please choose the type',
	    'ask.require'     => 'Please fill in the question',
	    'answer.require'  => 'Please fill in the answer'
        'language.require'  => 'Please fill in the language'
	];
}


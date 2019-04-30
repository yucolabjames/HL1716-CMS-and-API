<?php
namespace app\admin\validate;

use think\Validate;

class Eqaa extends Validate{
    protected $rule = [
        'type_id' => 'require',
        'ask'     => 'require',
        'answer'  => 'require'
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'type_id.require' => 'Please choose the type',
	    'ask.require'     => 'Please fill in the question',
	    'answer.require'  => 'Please fill in the answer'
	];
}


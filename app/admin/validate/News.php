<?php
namespace app\admin\validate;

use think\Validate;

class News extends Validate{
    protected $rule = [
        'language' => 'require',
        'title'    => 'require',
        'content'  => 'require',
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'language.require' => 'Please select a language',
	    'title.require'     => 'The title can not be blank',
	    'content.require'  => 'the content can not be blank'
	];
}


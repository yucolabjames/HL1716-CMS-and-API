<?php
namespace app\admin\validate;

use think\Validate;

class Webconfig extends Validate{
    protected $rule = [
        'name'       => 'require',
        'backg'      => 'require',
        'bottomdesc' => 'require',
        'language'   => 'require'
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'name.require'       => 'Page name cannot be empty',
	    'backg.require'      => 'Please upload the page background',
	    'bottomdesc.require' => 'Please enter the bottom page description',
        'language.require'   => 'Please select a language to save'
	];
}


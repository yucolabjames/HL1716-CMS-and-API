<?php
namespace app\admin\validate;

use think\Validate;

class Map extends Validate{
    protected $rule = [
        'longitude' => 'require',
        'latitude'     => 'require',
        'address'  => 'require',
        'business_time'  => 'require',
        'tel'  => 'require',
        'email'  => 'require',
        'language'  => 'require',
    ];
    // 验证规则默认提示信息
	protected $message = [
	    'longitude.require'     => 'Please fill in the longitude',
	    'latitude.require'  => 'Please fill in the latitude',
        'address.require'  => 'Please fill in the address',
        'business_time.require'  => 'Please fill in the business_time',
        'tel.require'  => 'Please fill in the tel',
        'email.require'  => 'Please fill in the email',
        'language.require' => 'Please choose the language',
	];
}


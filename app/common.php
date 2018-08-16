<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

use PHPMailer\phpmailer\PHPMailer;

// 应用公共文件
/**ajax请求返回函数
 * @param int $code 错误代码
 * @param string $msg 错误或成功消息
 * @param array $arr json资源
 * @return array 数组，tp5自动转换json
 */
error_reporting(E_ERROR | E_WARNING | E_PARSE);
function api_arr($code,$msg="",$arr=array()){
    header("Content-type: text/html; charset=utf-8");
    $return=array();
    $return['error_code']=$code;
    $return['msg']=$msg;
    $return['res']=$arr;
    return json_decode(json_encode($return),true);

}

/**获取json数据
 * @param $uid 用户主键id
 * @param $salt 用户盐值
 * @return string token字符串
 */
function get_JsonData(){
    $json = file_get_contents('php://input');
    if ($json) {
        $json = str_replace("'", '', $json);
        $json = json_decode($json,true);
    }
    return $json;
}

/**获取limit分页
 * @param $page 当前页数
 * @param $max 一页最大数
 */
function get_Limit($page,$max) {
    $page  = $page>0?$page:1;
    $limit = ($page-1)*$max.','.$max;
    return $limit;
}

/*加密方法
*$string    string 需加密、解密字符串
*$operation string E加密，D解密
*/
function encrypt($string,$operation){
    $key        = 'Bulc'.date('Y-m-d');
    $key        = md5($key); 
    $key_length = strlen($key);
    $string = $operation=='D'?base64_decode(str_replace('*','+',$string)):substr(md5($string.$key),0,8).$string;
    $string_length = strlen($string);
    $rndkey = $box = array(); 
    $result = ''; 
    for ($i=0;$i<=255;$i++) { 
        $rndkey[$i] = ord($key[$i%$key_length]); 
        $box[$i]    = $i; 
    }
    for ($j=$i=0;$i<256;$i++) { 
        $j       = ($j+$box[$i]+$rndkey[$i])%256; 
        $tmp     = $box[$i]; 
        $box[$i] = $box[$j]; 
        $box[$j] = $tmp; 
    } 
    for ($a=$j=$i=0;$i<$string_length;$i++) { 
        $a       = ($a+1)%256; 
        $j       = ($j+$box[$a])%256; 
        $tmp     = $box[$a]; 
        $box[$a] = $box[$j]; 
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256]));
    }
    if ($operation=='D') {
        if (substr($result,0,8)==substr(md5(substr($result,8).$key),0,8)) {
            return substr($result,8); 
        } else {
            return false;
        } 
    } else {
        return str_replace('+','*',str_replace('=','',base64_encode($result))); 
    } 
}

<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

use \PHPMailer\phpmailer;

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
    header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
    header("Access-Control-Allow-origin: *");
    header("Access-Control-Allow-Headers: X-Requested-With");
    header("Access-Control-Allow-Methods: POST,GET");
    $result=array();
    $result['error_code']=$code;
    $result['msg']=$msg;
    $result['res']=$arr;
    echo json_encode($result);
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
function encrypt($string,$operation,$key='yucolab'){
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

/**
 * 发送邮箱
 * @author gyj <375023402@qq.com>
 * @createtime 2018-08-20T10:09:07+0800
 * @param      $data 发送邮箱数据
 * @return     
 */
function send_email($data = []) {
  
  $mail = new PHPMailer; //实例化
  $mail->IsSMTP(); // 启用SMTP
  $mail->Host = config('email.host'); //SMTP服务器 以126邮箱为例子 
  $mail->Port = config('email.port');  //邮件发送端口
  $mail->SMTPAuth = config('email.smtp_auth');  //启用SMTP认证
  $mail->SMTPSecure = config('email.smtp_secure');   // 设置安全验证方式为ssl
  $mail->CharSet = config('email.charset'); //字符集
  $mail->Encoding = config('email.encoding'); //编码方式
  $mail->Username = config('email.user_name');  //你的邮箱 
  $mail->Password = config('email.pass_word');  //你的密码 
  $mail->Subject = config('email.subject'); //邮件标题  
  $mail->From = config('email.from');  //发件人地址（也就是你的邮箱）
  $mail->FromName = config('email.from_name');  //发件人姓名
  if($data && is_array($data)){
    foreach ($data as $k=>$v){
      $mail->AddAddress($v['user_email']); //添加收件人（地址，昵称）
      $mail->IsHTML(true); //支持html格式内容
      $mail->Body = $v['content']; //邮件主体内容
      //发送成功就删除
      if ($mail->Send()) {
        return  true;
      }else{
        log_result("Mailer Error: ".$mail->ErrorInfo);// 输出错误信息  
       // throw new \Exception("Mailer Error: ".$mail->ErrorInfo, 1); 
      }
    }
  }           
}

/**
 * 校验日期格式是否正确
 * @author gyj <375023402@qq.com>
 * @createtime 2018-08-27T15:06:51+0800
 * @param      string $date 日期
 * @param      string $formats 需要检验的格式数组
 * @return     boolean
 */
function checkDateIsValid($date, $formats = array("Y-m-d", "Y/m/d","Ymd")) {
    $unixTime = strtotime($date);
    if (!$unixTime) { //strtotime转换不对，日期格式显然不对。
        return false;
    }
    //校验日期的有效性，只要满足其中一个格式就OK
    foreach ($formats as $format) {
        if (date($format, $unixTime) == $date) {
            return true;
        }
    }

    return false;
}


/**
* 记录自定义日志
* @author gyj  <375023402@qq.com>
* @createtime 2018-08-24 14:12:01
* @param $msg 错误信息
* @param $type 写入类型 wechat aliyun
* @return [type] [description]
*/
if(!function_exists('log_result')){
  function log_result($msg='',$type='normal')
  {
    $dir = dirname(LOG_PATH)."/log/".$type."/";
    if(!is_dir($dir)){
        mkdir($dir,0777);
    }
    $dir .= date('Ym')."/";
    $file = $dir.date('d').".log";
    if(!is_dir($dir)){
        mkdir($dir,0777);
    }
    file_put_contents($file,date('Y-m-d H:i:s')."\r\n".$msg."\r\n---------------------------------------------------------------\r\n", FILE_APPEND);
  }
  
}


/**
 * 发送post请求
 * @author ganyuanjiang  <3164145970@qq.com>
 * @createtime 2017-07-26 14:06:04
 * @param string $url 请求地址
 * @param array $post_data post键值对数据
 * @return string
 */
if (!function_exists('https_request')) {
    
  function https_request($url,$data=null){
    header("Content-type: text/html; charset=utf-8");
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $tmpInfo = curl_exec($ch);
    if (curl_errno($ch)) {
      return curl_error($ch);
    }

    curl_close($ch);
    return $tmpInfo;

  }
}

/**
 * 将时分转换成秒数
 * @author gyj <375023402@qq.com>
 * @createtime 2018-08-29T10:15:58+0800
 * @param     
 * @return    秒数
 */
if (!function_exists('hour_time')) {

    function hour_time($unix){
        return strtotime(date('Y-m-d H:i',strtotime($unix)))-strtotime(date('Y-m-d 00:00',strtotime($unix)));
    }
}

/**
 * 获取两个时间戳之间的月份数组
 * @author gyj <375023402@qq.com>
 * @createtime 2018-08-29T10:15:58+0800
 * @param     
 * @return    秒数
 */
if (!function_exists('month_arr')) {

    function month_arr($start_time,$end_time){
        $monarr[] = date('Y-m',$start_time);  
        while( ($start_time = strtotime('+1 month', $start_time)) <= $end_time){  
              $monarr[] = date('Y-m',$start_time); // 取得递增月;   
        }  

        return $monarr;
    }
}
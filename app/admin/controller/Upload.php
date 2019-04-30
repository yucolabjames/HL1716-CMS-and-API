<?php
/**
 * Created by PhpStorm.
 * User: Shinelon
 * Date: 2017/9/22
 * Time: 16:30
 */
namespace app\admin\controller;
use app\common\controller\SliceUploadLib;
use think\Db;

class Upload extends Common{
    public function __construct()
    {
        parent::__construct();

        $this->sliceuploadlib = new SliceUploadLib();
    }

    #令牌保存目录，后面带 /线
    private $_tokenPath = './uploads/token/';

    #获取token
    public function getToken()
    {
        
        #获取json数据
        $data    = get_JsonData();
        
        #限制文件格式
        switch ($data['type']) {
            case 'image':
                $Eext = array('png','jpg','gif');
                break;
            case 'video':
                $Eext = array('mp4','avi');
                break;
            default:
                $Eext = array('mp4','avi','png','jpg','gif');
                break;
        }
        #配置上传
        $config = array(
            #令牌保存目录
            'tokenPath' => $this->_tokenPath,

             #上传文件保存目录，后面带 /线
            'fileDir' => 'uploads/',

             #文件名，空使用token
            'fileName' => '',

            #上传文件保存目录，后面带 /线
            'fileWebDir' => 'uploads/',

            #允许上传文件格式，空数组为所有文件格式
            'allowEextension' => $Eext
        );
        $this->sliceuploadlib->seting($config);

        #生成令牌
        $result = $this->sliceuploadlib->gettoken ( array (
            "size"        => $data['size'] ?  : 0,
            "name"        =>  $data['name'] ?  : "",
            "md5"         =>  $data['md5'] ?  : "",
            "networktype" =>  $data['networktype'] ? : "wifi"
        ) );
        if ($result['state']) {
            $fileInfo = $this->sliceuploadlib->getTokenInfo($result['data']['token']);
            if ($fileInfo) {
                return api_arr(0,'success',$result['data']);
            } else {
                #token保存错误删除token
                @unlink ( $this->_tokenPath . $result['data']['token'] . '.token' );
                return api_arr(1,'Token save error');
            }
        } else {
            return api_arr(1,$result['message']);
        }
       
    }
    
    #上传文件
    public function getUpload()
    {
        
        $strToken = $this->request->param('token');
        $config = array(
            'tokenPath' => $this->_tokenPath
        );
        $this->sliceuploadlib->seting($config);

        #获取令牌信息
        $fileInfo = $this->sliceuploadlib->getTokenInfo($strToken);

        #配置上传
        $config = array(
            #令牌保存目录
            'tokenPath' => $this->_tokenPath,

             #上传文件保存目录，后面带 /线
            'fileDir' => 'uploads/',

             #文件名，空使用token
            'fileName' => '',

            #上传文件保存目录，后面带 /线
            'fileWebDir' => 'uploads/',

            #允许上传文件格式，空数组为所有文件格式
            'allowEextension' => array()
        );

        $this->sliceuploadlib->seting($config);
        #上传文件
        $result = $this->sliceuploadlib->upload ( array (
            "token" => !empty ( $strToken ) ? $strToken : ""
        ) );
        if ($result['state']) {
            if ($result['data']['up_state'] == 'done') {
                #写入数据库
                $this->filesAdd($fileInfo);

                #组合返回数据
                return api_arr(0,'success',$result['data']);
            } else {
                return api_arr(0,'success',$result['data']);
            }
        } else {
            return api_arr(1,$result['message']);
        }
    }
    
    #上传文件保存数据库
    public function filesAdd($fileInfo) {
        $log_arr = array(
            'file_userid'=> $this->userId,
            'file_ip'    => $this->request->ip(),
            'file_local' => $fileInfo['filename']?$fileInfo['filename']:'',
            'file_save'  => $fileInfo['filePath'],
            'file_size'  => $fileInfo['size'],
            'file_title' => $fileInfo['name'],
            'file_ext'   => $fileInfo['fileext'],
            'create_time' => time(),
            'update_time' => time()
        );
        Db::name('files')->insert($log_arr);
    }

    /**
     * froala编辑器上传图片
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-19T18:45:28+0800
     * @return    
     */
    public function image(){

        try {

            $dir = "uploads/".date('Y')."/".date('md')."/editor/";
             // 允许上传的图片后缀
            $allowedExts = array("gif", "jpeg", "jpg", "png");
            $temp = explode(".", $_FILES["file"]["name"]);
            // echo $_FILES["file"]["size"];
            $extension = end($temp);     // 获取文件后缀名
            if ((($_FILES["file"]["type"] == "image/gif")
            || ($_FILES["file"]["type"] == "image/jpeg")
            || ($_FILES["file"]["type"] == "image/jpg")
            || ($_FILES["file"]["type"] == "image/pjpeg")
            || ($_FILES["file"]["type"] == "image/x-png")
            || ($_FILES["file"]["type"] == "image/png"))
            && ($_FILES["file"]["size"] < 2048000)   // 小于 2000 kb
            && in_array($extension, $allowedExts)) {
                if ($_FILES["file"]["error"] > 0) {
                    echo "错误：: " . $_FILES["file"]["error"] . "<br>";
                } else {
                    if (file_exists($dir.$_FILES["file"]["name"])) {
                        echo $_FILES["file"]["name"] . " 文件已经存在。 ";
                    } else {
                        if(!is_dir($dir)){
                            mkdir($dir,0777);
                        }
                        // 如果 upload 目录不存在该文件则将文件上传到 upload 目录下
                        move_uploaded_file($_FILES["file"]["tmp_name"], $dir . $_FILES["file"]["name"]);
                        $rand = mt_rand();
                        $time = time();
                        $filename = $rand."_".$time.".$extension";
                        rename($dir.$_FILES["file"]["name"], $dir.$filename);                    
                        $response = new \StdClass;
                        $response->link = $this->request->domain()."/public/".$dir.$filename;
                        echo stripslashes(json_encode($response));
                    }
                }
            } else {
                throw new \Exception("File does not meet the validation.");
            }
        } catch (Exception $e) {
           // Send error response.
           echo $e->getMessage();
           http_response_code(404);
        }

    }
}

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
        try {
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
                    $arr = array(
                        'error_code' => 0,
                        'msg'        => 'success',
                        'data'       => $result['data']
                    );
                    return $arr;
                } else {
                    #token保存错误删除token
                    @unlink ( $this->_tokenPath . $result['data']['token'] . '.token' );
                    return api_arr(1,'Token save error');
                }
            } else {
                return api_arr(1,$result['message']);
            }
        } catch (\Exception $e) {
            $this->ajaxException($e);
        }
    }
    
    #上传文件
    public function getUpload()
    {
        try {
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
                    $arr = array(
                        'error_code' => 0,
                        'msg'        => 'success',
                        'data'       => $result['data']
                    );
                    return $arr;
                } else {
                    $arr = array(
                        'error_code' => 0,
                        'msg'        => 'success',
                        'data'       => $result['data']
                    );
                    return $arr;
                }
            } else {
                return api_arr(1,$result['message']);
            }
        } catch (\Exception $e) {
            $this->ajaxException($e);
        }
    }
    
    #上传文件保存数据库
    public function filesAdd($fileInfo) {
        $log_arr = array(
            'file_userid'=> $this->userId,
            'file_ip'    => $this->request->ip(),
            'file_local' => $fileInfo['filename'],
            'file_save'  => $fileInfo['filePath'],
            'file_size'  => $fileInfo['size'],
            'file_title' => $fileInfo['name'],
            'file_ext'   => $fileInfo['fileext']
        );
        Db::name('files')->insert($log_arr);
    }
}

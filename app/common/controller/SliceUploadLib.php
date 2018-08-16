<?php
namespace app\common\controller;

/**
 * 分片上传类
 */
class SliceUploadLib  {
	/**
	 * 设置路径时考虑到分布式布署时token共享，也可以改造成redis的。
	 * 文件共享目录采用挂载式。
	 */
	private $_tokenPath = "./uploads/tokens/"; // 令牌保存目录，后面带 /线
	private $_fileDir = 'uploads/files/'; // 上传文件保存目录，后面带 /线
	private $_fileWebDir = 'uploads/files/'; // 上传文件保存目录，后面带 /线
    private $_imageType;
    private $_videoType ;
	private $_allowEextension = array();
	private $_slice_size_array = array (
			"wifi" => 1024000,   //wifi 1048576 下每次上传 1M
			"4g" => 512000,   //4G 下每次上传 500K
			"3g" => 102400,   //3g 下每次上传 100K
			"2g" => 10240,   //2g 下每次上传 10K
	);

    const IMG_MAX_SIZE = 8120;  //图片上传大小限制 单位kb
    const AUDIO_MAX_SIZE = 12400;  //音频上传大小限制 单位kb
    const OTHER_MAX_SIZE = 51200;  //音频上传大小限制 单位kb

    const IMG_EXT = 'jpg,jpeg,gif,bmp,png';  //允许上传的图片格式
    const AUDIO_EXT = 'mp3,wav';  //允许上传的音频格式
    const OTHER_EXT = 'doc,docx,xls,xlsx';

    const OTHER_TYPE = 3;
    const AUDIO_TYPE = 2;
    const IMAGE_TYPE = 1;


    public function __construct()
    {
        $this->_imageType = explode(',', self::IMG_EXT) ? : array();
        $this->_videoType = explode(',', self::AUDIO_EXT) ? : array();
        $this->_otherType = explode(',', self::OTHER_EXT) ? : array();
        $this->_allowEextension = array_merge($this->_imageType, $this->_videoType, $this->_otherType);
    }

    /**
	 * 设置
	 */
	public function seting($array = array()) {
		if (!empty ( $array ['tokenPath'] )) {
			$this->_tokenPath = $array ['tokenPath'];
		}
		if (!empty ( $array ['fileDir'] )) {
			$this->_fileDir = $array ['fileDir'];
		}
		if (!empty ( $array ['allowEextension'] )) {
			$this->_allowEextension = $array ['allowEextension'];
		}
		
		if (empty ( $array ['fileWebDir'] )) {
			$basedir = preg_replace('/\/+/', '/', str_replace('\\', '/', __DIR__)) ;
			$this->_fileWebDir = str_replace( $basedir , "", preg_replace('/\/+/', '/', str_replace('\\', '/', $this->_fileDir))) ;
		}
		else{
			$this->_fileWebDir = $array ['fileWebDir'];
		}
	}

	/**
	 * 获取令牌
	 */
	public function gettoken(Array $array) {
		$file = array ();
		if (empty ( $array ['name'] ) || empty ( $array ['size'] ) || empty ( $array ['md5'] )) {
			return $this->error ( "数据不完整！" );
		}
		
		$file ['name'] = $array ['name']; // 上传文件名称
		$file ['size'] = $array ['size']; // 上传文件总大小
		$file ['md5']  = $array ['md5']; // 文件的md5值

		if(!empty($this->_slice_size_array[ $array['networktype'] ] ) ){
			$slice_size = $this->_slice_size_array[ $array['networktype'] ]; 
		}
		else{
			$slice_size = $this->_slice_size_array['wifi']; // 控制上传的大小1M 默认
		}
		
		$file ['token'] = md5 ( json_encode ( $file ['md5'] . $file ['size']  . microtime(true)) . 'slice_upload' );

		if (! preg_match ( "/^([a-f0-9]{32})$/i", $file ['md5'] )) {
			return $this->error ( "md5不正确！" );
		}

		$pathInfo = pathinfo ( $file ['name'] );
        $pathInfo ['extension'] = strtolower($pathInfo ['extension']);
		if (! $pathInfo || empty ( $pathInfo ['extension'] ) || ! in_array ( $pathInfo ['extension'], $this->_allowEextension )) {
			return $this->error ( "文件类型不在允许之列！" );
		}
		if(in_array($pathInfo ['extension'], $this->_imageType)){
            $fileDirType = 'image';
            $fileTypeInt = self::IMAGE_TYPE;
            //判断大小
            if($file ['size'] > self::IMG_MAX_SIZE * 1024){
                return $this->error ( "图片上传大小限制". (floor(self::IMG_MAX_SIZE / 1024)) ."M！" );
            }
        }elseif (in_array($pathInfo ['extension'], $this->_videoType)){
            $fileDirType = 'audio';
            $fileTypeInt = self::AUDIO_TYPE;
            if($file ['size'] > self::AUDIO_MAX_SIZE * 1024){
                return $this->error ( "音频上传大小限制".(floor(self::AUDIO_MAX_SIZE /1024))."M！" );
            }
        }else{
            $fileDirType = 'other';
            $fileTypeInt = self::OTHER_TYPE;
            if($file ['size'] > self::OTHER_MAX_SIZE * 1024){
                return $this->error ( "文件上传大小限制".(floor(self::OTHER_MAX_SIZE /1024))."M！" );
            }
        }

		// 判断是否存在该令牌信息
		if (! is_file( $this->_tokenPath . $file ['token'] . '.token' )) {
			$file ['uped_size'] = 0; // 已上传文件大小
			
			$path = $this->_fileDir . date ( 'Y' ) . '/' . date ( 'md' );
			// 生成文件保存子目录
			if (! is_dir ( $path )) {
				if(!mkdir ( $path, 0755, true )){
                    return $this->error ( "目录创建失败" , 119);
                };
			}
            if (! is_dir ( $this->_tokenPath )) {
                if(!mkdir ( $this->_tokenPath, 0755, true )){
                    return $this->error ( "目录创建失败" , 124);
                }
            }
			// 上传文件保存目录
			$file ['filePath'] = $path  . '/' . $file ['token'] . '.' . $pathInfo ['extension'];
			$file ['fileWebPath'] = $this->_fileWebDir .  date ( 'Y' ) . '/' . date ( 'md' ) . '/' . $file ['token'] . '.' . $pathInfo ['extension'];
            $file ['filetype'] = $fileTypeInt;
            $file ['fileext']  = $pathInfo ['extension'];
            $file ['modified'] = time (); // 上传文件的修改日期
            $file ['fiflename'] = $file ['token'] . '.' . $pathInfo ['extension'];
			// 清除之前的未上传完的文件
			@unlink ( $this->_tokenPath . $file ['token'] . '.slice_upload' );
			// 保存令牌信息
			$this->setTokenInfo ( $file ['token'], $file );
		} else {
			$file = $this->getTokenInfo ( $file ['token'] );
			if (! $file) {
				$this->error ( "token异常！" );
			}
		}
		
		$result = array (
				"token" => $file ['token'],
				"uped_size" => $file ['uped_size'],
				"slice_size" => $slice_size,
				"success" => true 
		);
		
		return $this->format ( $result );
	}
	
	/**
	 * 上传接口
	 */
	public function upload(Array $array) {
		$token = !empty ( $array ['token'] ) ? $array ['token'] : "";
		$fileInfo = $this->getTokenInfo ( $token );
		if (! $fileInfo || empty ( $fileInfo ['size'] )) {
			// 此处是否清理掉token
			return $this->error ( "token异常！" );
		}
		$result = array ();
		$result ['up_state'] = 'uploading';
		$result ['file_url'] = '';

		if ($fileInfo ['size'] > $fileInfo ['uped_size']) {
			// 取得上传内容
			$data = file_get_contents ( 'php://input', 'r' );
			if (! empty ( $data )) {
				// 上传内容写入目标文件
				$fp = fopen ( $fileInfo ['filePath'] . ".slice_upload", 'a' );
				flock ( $fp, LOCK_EX );
				fwrite ( $fp, $data );
				flock ( $fp, LOCK_UN );
				fclose ( $fp );
				// 累积增加已上传文件大小
				$fileInfo ['uped_size'] += strlen ( $data );
				
				if ($fileInfo ['size'] > $fileInfo ['uped_size']) {
					$this->setTokenInfo ( $token, $fileInfo );
				} else {
					// 上传完成后删除令牌信息
					$result ['up_state'] = 'done';
					$md5str = md5_file($fileInfo ['filePath'] . ".slice_upload" );
					if($fileInfo['md5']!=$md5str){
						return $this->error ( "md5检验失败！已经上传文件MD5: ".$md5str." , 未上传文件MD5: ".$fileInfo['md5'] );
					}
					@rename ( $fileInfo ['filePath'] . ".slice_upload", $fileInfo ['filePath'] );
                    @unlink ( $this->_tokenPath . $token . '.token' );
					$result ['file_url'] = $fileInfo ['fileWebPath'];
                    $result ['filepath'] = strstr($fileInfo ['filePath'], '/Upload/');
                    $result ['filetype'] = $fileInfo ['filetype'];

                    //音频长度
                    $result ['audio_time'] = 0;
                    if($fileInfo['filetype'] == self::AUDIO_TYPE){
                        include_once APP_PATH . "Common/Library/Util/getid3/getid3.php";
                        $getID3 = new \getID3(); //实例化类
                        $ThisFileInfo = $getID3->analyze(dirname(APP_PATH) . '/' . $fileInfo ['filePath']);//分析文件
                        $result ['audio_time'] = empty($ThisFileInfo['playtime_seconds']) ? 0 : ceil($ThisFileInfo['playtime_seconds']);
                    }
                    //end

				}
			} else {
				return $this->error ( "数据流异常！" );
			}
		}
		$result ['uped_size'] = $fileInfo ['uped_size'];
		return $this->format ( $result );
	}
	
	/**
	 * 生成令牌信息，可改造为redis的
	 */
	protected function setTokenInfo($token, $data) {
		file_put_contents ( $this->_tokenPath . $token . '.token', json_encode ( $data, JSON_UNESCAPED_UNICODE ) );
	}
	
	/**
	 * 获取令牌信息，可改造为redis的
	 */
	public function getTokenInfo($token) {
		if (! $token) {
			return false;
		}
		$file = $this->_tokenPath . $token . '.token';
		if (is_file( $file )) {
			return json_decode ( file_get_contents ( $file ), true );
		}
		return false;
	}
	
	/**
	 * 输出错误信息
	 */
	protected function error($text, $type = "system_error", $code = 10000) {
		/**
		 * $code =0 表示成功
		 */
		// @header('Content-type: application/json; charset=utf-8');
		$data = array ();
		$data ['type'] = $type;
		$data ['message'] = $text;
		return $this->format ( $data, 0, array (), $code );
	}
	
	/**
	 * 格式化数据
	 */
	protected function format($data, $result = 1, $pagebar = array(), $code = 0) {
		/*
		 * 输出Json数据
		 * $result = 0 失败,1成功，2需要登录.
		 * 兼容新版本 $code =0 表示成功
		 */
		$array = array ();
		if (! is_array ( $data )) {
			$data = array ();
		}
		$array ['state'] = $code != 0 ? false : true;
		$array ['code'] = $code;
		$array ['result'] = $result; // 兼容老版本
		$array ['message'] = !empty ( $data ['message'] ) ? $data ['message'] : ''; // 将旧版本中的message复制到根
		$array ['data'] = $data;
		if (is_array ( $pagebar ) && count ( $pagebar ) > 0) {
			$array ['pagebar'] = $pagebar;
		}
		return $array;
	}
	public function output($array = array()) {
		@header ( 'Content-type: application/json; charset=utf-8' );
		echo json_encode ( $array, JSON_UNESCAPED_UNICODE );
		exit ();
	}
}//endclass
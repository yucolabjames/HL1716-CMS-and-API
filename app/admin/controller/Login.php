<?php
namespace app\admin\controller;
use think\Controller;

class Login extends Common
{
    public function index(){
        $username = $this->request->param('username');
        $password = $this->request->param('password');

        #判断参数是否存在
        if ($username && $password) {
            $where['username'] = $username;
            $where['enable'] = 1;
            #验证登录信息
            $user=db('administrator')->where($where)->find();
            if($user){
                #验证密码是否正确
                if($user['password'] == md5(md5($password))){

                    #记录登录日志
                    $this->userId = $user['id'];
                    $this->logs('Log in to CMS', 'Administrator ID:'.$this->userId, 0);

                    #组合返回数据
                    return api_arr(0,'login successful!',
                        array(
                            #用户名
                            "username" => $username,
                            #ID进行加密返回
                            "userid"  => encrypt($user['id'],'E')
                        )
                    );

                } else {
                    return api_arr(1,'wrong password!');
                }
            } else {
                return api_arr(1,'Username does not exist!');
            }
        } else {
            return api_arr(1,'Username and password cannot be empty!');
        }
    }
}
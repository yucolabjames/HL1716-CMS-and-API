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

                    $userid = encrypt($this->userId,'E');

                    //更新管理员salt
                    $data['salt'] = $userid;
                    $res = db('administrator')->where('id',$this->userId)->update($data);

                    #组合返回数据
                    return api_arr(0,'login successful!',
                        array(
                            #用户名
                            "username" => $username,
                            #ID进行加密返回
                            "userid"  => $userid
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

    /**
     * 管理员退出管理系统
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-09T15:18:43+0800
     * @return     
     */
    public function out(){
        //判断请求类型
        if($this->request->isPost()){
            $userid = $this->request->param('userid');
            if(empty($userid)){
                return api_arr(1,"Lack of parameters of userid");
            }
             $user_id = encrypt($userid,'D');
             //清空管理员登录信息
             $data['salt'] = '';
             $res = db('administrator')->where('id',$user_id)->update($data);
             if(!$res){
                return api_arr(1,'err!');
             }
             return api_arr(0,'success');
             

        }
    }

}
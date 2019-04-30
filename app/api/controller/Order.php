<?php
// +----------------------------------------------------------------------
// | YUCOLAB [ HONG KONG MUSEUM ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 https://www.hl1716.yucolab.com All rights reserved.
// +----------------------------------------------------------------------
// | Base on ( ThinkPHP 5.0 http://thinkphp.cn)
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: gyj <375023402@qq.com>
// +----------------------------------------------------------------------
// | CreateTime: 2018-08-22 16:57:54
// +----------------------------------------------------------------------
// | UpdateTime: 2018-08-23 13:13:54
// +----------------------------------------------------------------------
namespace app\api\controller;
use app\api\controller\Common;
use app\api\controller\Paypal;
use think\db;
class Order extends Common
{
    /**
     * 初始化构造器
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-20 15:27:07
     */
	public function __construct()
    {
        parent::__construct();

        //实例化订单数据库
        $this->dao       = db('order');
        //实例化折扣券数据库
        $this->dao_coupon  = db('coupon');
        //实例日程数据库
        $this->dao_schedule  = db('schedule');
        //实例化paypal支付数据库
        $this->dao_paypal = db('paypal');

        //取消已过期未支付订单
        $this->order_cancel();


    }

    /**
     * 根据订单号、邮箱地址获取订单详情
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-27 15:56:47
     * @return 
     */
    public function get(){
        //判断请求类型
        if($this->request->isPost()){

            //查询条件判断
            if(empty($_POST['order_no'])){
                return api_arr(1,"Lack of parameters of order_no");
            }
            // if(empty($_POST['email'])){
            //     return api_arr(1,"Lack of parameters of email");
            // }

            $where['a.order_no'] = $_POST['order_no'];
            if(!empty($_POST['email'])){
                $where['a.email'] = $_POST['email'];
                $where['a.status'] = 1;
            }
            //查询订单详情
            $list = $this->dao->alias('a')
            ->join('yu_schedule b','a.schedule_id = b.id')
            ->where($where)
            ->field('a.id,a.first_name,a.last_name,a.title,a.phone,a.email,a.order_no,a.total,a.pay,a.visitor_count,a.child_count,a.group_name,a.is_group,b.date,b.start_time,b.end_time,b.language')
            ->find();

            //判断订单信息是否存在
            if(!$list){
                return api_arr(1,"no data");
            }

            //预定时间渲染
            $list['name'] = $list['last_name'] . $list['first_name'];
            $list['schedule_time'] = date('Y-m-d ',$list['date']).date('H:i',$this->unixtime+$list['start_time']).'-'.date('H:i',$this->unixtime+$list['end_time']);
            //返回数据
            return api_arr(0,'',$list);
        }
    }
    /**
     * 用户添加订单
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23 11:58:52
     * @return
     */
    public function add(){

        if($this->request->isPost()){
            $data = $_POST;
            unset($data['userid']);
            unset($data['schedule_date']);
            //验证必填项
            $must_arr = ['title','first_name','last_name','phone','email','total','schedule_id','grade'];
            foreach ($must_arr as  $value) {
                if(empty($data[$value])){
                    return api_arr(1,"Lack of parameters of ".$value);
                }
            }

            //验证邮箱格式是否正确
            if(!preg_match("/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/",$data['email'])){
                return api_arr(1,"invalid email");
            }

            //验证订单总金额 和支付金额是否大于等于0
            if($data['total']<0 || $data['pay']<0){
                return api_arr(1,"total or pay must be greater than or equal to 0.");
            }

            //判断订票数量是否为0
            if(empty($data['visitor_count']) && empty($data['child_count'])){
                return api_arr(1,"Lack of parameters of order count");
            }
            //判断是否是团体,如果是判断团体信息
            if(!empty($data['is_group'])){
                if(empty($data['group_name'])){
                    return api_arr(1,"Lack of parameters of group_name");
                }
                if(empty($data['group_type'])){
                    return api_arr(1,"Lack of parameters of group_type");
                }
                if(empty($data['is_receive'])){
                    return api_arr(1,"Lack of parameters of is_receive");
                }
            }
            //判断非团体票 是否符合订票数量
            // if(empty($data['is_group']) && ($data['visitor_count']+$data['child_count']>1)){
            //     return api_arr(1,"too big to order count");
            // }

            //初始化支付金额
            $data['pay'] = $_POST['total']; 

            //判断是否可用折扣券,如果有查询填充折扣信息
            if(!empty($data['coupon_code'])){
                $data['coupon_code'] = strtolower($data['coupon_code']);
                $coupon = $this->dao_coupon->where('code',$data['coupon_code'])->find();
                if(!$coupon || $coupon['enable']!=1){
                    return api_arr(1,"invalid coupon");
                }
                //判断折扣券是否被使用过
                // if($coupon['status']!=0){
                //    return api_arr(1,"coupon has been used");
                // }
                //判断折扣券是否在有效期内
                if($coupon['start_time']>time()){
                    return api_arr(1,"coupon temporarily unable to use");
                }
                //判断折扣券是否过期
                if($coupon['end_time']<time()){
                    return api_arr(1,"expired coupon");
                }

                //填充折扣信息
                $data['coupon_id'] = $coupon['id'];
                $data['discount'] = $coupon['discount'];
                $data['pay'] = $data['total'] -  $coupon['discount'];
                
            }

            //判断支付金额是否正确
            if($data['pay']!=$_POST['pay']){
                return api_arr(1,"wrong pay");
            }
            
            //如果订单金额为0,默认订单已支付
            if($data['pay'] == 0){  
                $data['status'] = 1;
            }
            //判断支付金额是否有误
            // if($data['pay']!=$_POST['pay']){
            //     return api_arr(1,"invalid pay");
            // }

            //去除coupon_code 字段
            if(isset($data['coupon_code'])){
                unset($data['coupon_code']);
            }
            //判断当前预定时间日程是否可预定
            //查询当前预定日程信息
            $where_schedule['id'] = $data['schedule_id'];
            $where_schedule['enable'] = 1;
            $schedule = $this->dao_schedule->where($where_schedule)->find();
            if(!$schedule){
                return api_arr(1,"invalid schedule");
            }

            //判断预定日程是否在可预订范围内
            if($schedule['date']<strtotime(date('Y-m-d 00:00:00').'+3 day')){
                return api_arr(1,"Not within the intended range of schedule");
            }

            //判断是否超出最大订票数
            $data['visitor_count'] = $_POST['visitor_count']?$_POST['visitor_count']:0;
            $data['child_count'] = $_POST['child_count']?$_POST['child_count']:0;

            if(($data['visitor_count'] + $data['child_count'] +$schedule['visitor_count'])>$schedule['max_visitor']){
                return api_arr(1,"Not enough of visitor_count");
            }


            //生成订单号
            $data['order_no'] = $this->order_no();

            $data['create_time'] =  time();
            $data['update_time'] =  time();

            //开始生成订单事务
            Db::startTrans();
            try{
                //生成订单
                $order_id = Db::table('yu_order')->insertGetId($data);
                if(empty($order_id)){
                    throw new \Exception("order add fail");
                }

                //更新日程信息,成人订票数量和儿童订票数量
                if(!empty($data['visitor_count'])){
                    $res = Db::table('yu_schedule')->where('id',$data['schedule_id'])->setInc('visitor_count',$data['visitor_count']);
                    if(!$res){
                        throw new \Exception("schedule update visitor_count fail");
                    }
                }
                if(!empty($data['child_count'])){
                    $res = Db::table('yu_schedule')->where('id',$data['schedule_id'])->setInc('child_count',$data['child_count']);
                    if(!$res){
                        throw new \Exception("schedule update child_count fail");
                    }
                }
                //如果使用了折扣券 更新折扣相关信息
                if(!empty($data['coupon_id'])){
                    //用户折扣使用数据组装
                    $use_data['coupon_id'] = $data['coupon_id'];
                    $use_data['order_id'] = $order_id;
                    $use_data['create_time'] = time();
                    //生成用户折扣使用记录
                    $coupon_result = Db::table('yu_user_coupon')->insert($use_data);

                    if(!$coupon_result){
                        throw new \Exception("user_coupon add fail");
                    }

                    //更新折扣券使用状态
                    // $coupon_data['status'] = 1;
                    // $res = Db::table('yu_coupon')->where('id',$data['coupon_id'])->update($coupon_data);

                    // if(!$res){
                    //     throw new \Exception("schedule update coupon status fail");
                    // }
                }
                // 提交事务
                Db::commit();  
                
                //如果为已支付订单,发送邮件通知用户
                if(!empty($data['email']) && $data['status'] == 1){
                    //查询订单信息
                    $order_info = $this->dao->alias('a')
                        ->join('yu_schedule b','a.schedule_id = b.id')
                        ->where('a.order_no',$data['order_no'])
                        ->field('a.order_no,a.status,a.pay,a.email,a.group_name,a.first_name,a.last_name,b.date,b.start_time,b.end_time,a.visitor_count,a.child_count')
                        ->find(); 
                    $email_content = "敬啟者:<br/>閣下已成功預約可持續資源館 (S Gallery)的參觀，請核對預約參觀資料:<br/><br/>預約參考編號: ".$order_info['order_no']."<br/>參觀日期及時段: ".date('Y-m-d',$order_info['date']).",時段:".date('H:i',$this->unixtime+$order_info['start_time'])."-".date('H:i',$this->unixtime+$order_info['end_time'])."<br/>參觀人數 成人: ".$order_info['visitor_count']."      學生: ".$order_info['child_count']."<br/><br/>團體名稱: ".$order_info['group_name']."<br/>團體聯絡人: ".$order_info['first_name'].$order_info['last_name']."<br/> 登記電郵: ".$order_info['email']."<br/>已支付費用: HK$".$order_info['pay']."<br/>收據參考編號: 无<br/><br/>請細閱附件的參觀須知。<br/>如有任何問題，歡迎致電 3411 2375或電郵至 iba@hkbu.edu.hk 與我們聯絡。<br/>多謝閣下對可持續資源館的支持!<br/><br/>可持續資源館<br/>生物資源及農業研究所 謹啟<br/><br/>Dear Sir/ Madam,<br/><br/>Your application of the S Gallery visit has been successful, please verify the following information:<br/><br/>Application Ref No: ".$order_info['order_no']."<br/>Visiting date and time:".date('Y-m-d',$order_info['date']).",time:".date('H:i',$this->unixtime+$order_info['start_time'])."-".date('H:i',$this->unixtime+$order_info['end_time'])."<br/>No of visitors:   ".$order_info['visitor_count']." adult ".$order_info['child_count']." students<br/><br/>Group name:".$order_info['group_name']."<br/>Contact person:".$order_info['first_name'].$order_info['last_name']."<br/>Registered email:".$order_info['email']."<br/>Paid fee:HK$".$order_info['pay']."<br/>Receipt Ref No:无<br/><br/> Please read the Guidelines to visitors for further information.<br/>Should you require further assistance, please contact our staff at 3411 2375 or email at iba@hkbu.edu.hk.<br/><br/>Thank you for your support on the S Gallery!<br/><br/>Sustainability Gallery<br/>Institute of Bioresource and Agriculture";

                    send_email([['user_email'=>$order_info['email'],'content'=>$email_content]]);
                    // if(!$mail_res){
                    //     log_result('notify mail send result:'.($mail_res?'yes':'no'));
                    //     return  false;
                    // }
                    return api_arr(0,"success",config('paypal.success_url')."?order_no=".$data['order_no']);
                   // $this->redirect(config('paypal.success_url'));
                }else{
                    //paypal支付
                    $paypal = new Paypal();
                    $paypal->pay($data['order_no'],$data['pay']);
                    
                }
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                log_result("订单支付:".$e->getMessage());
                return api_arr(1,$e->getMessage());
            }
        }
        
    }

    /**
     * 取消预约
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-27T16:20:34+0800
     * @return     
     */
    public function cancel(){
        if($this->request->isPost()){
            $data = $_POST;
            //验证必填项
            if(empty($data['order_no'])){
                return api_arr(1,"Lack of parameters of order_no");
            }

            //查询已支付订单信息
            $where_order['order_no'] = $data['order_no'];
            $where_order['status'] = 0;
            $info = $this->dao->where($where_order)->find();
            if(!$info){
                return api_arr(1,"no data");
            }

            //查询原有日程
            $old_schedule = $this->dao_schedule->where('id',$info['schedule_id'])->find();

            //开始取消订单预定事务
            Db::startTrans();
            try{

                //查询原有日程是否还原数据有误
                if($old_schedule['visitor_count']<$info['visitor_count'] || $old_schedule['child_count']<$info['child_count']){
                    throw new \Exception("schedule count Can not be negative,fail schedule_id:".$old_schedule['id']);
                }

                //订单原有日程订票数量还原
                if(!empty($info['visitor_count'])){
                    $res = Db::table('yu_schedule')->where('id',$info['schedule_id'])->setDec('visitor_count',$info['visitor_count']);
                    if(!$res){
                        throw new \Exception("schedule return fail");
                    }
                }
                if(!empty($info['child_count'])){
                    $res = Db::table('yu_schedule')->where('id',$info['schedule_id'])->setDec('child_count',$info['child_count']);
                    if(!$res){
                        throw new \Exception("schedule return fail");
                    }
                }


                //取消订单预定日程
                $datas['status'] = 3;
                Db::table('yu_order')->where('id',$info['id'])->update($datas);

                // 提交事务
                Db::commit();  
                return api_arr(0,"success");

            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return api_arr(1,$e->getMessage());
            }


        }
    }
    /**
     * 订单预定时间修改
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-23 11:58:03
     * @return     
     */
    public function modify(){
        if($this->request->isPost()){
            $data = $_POST;
            //验证必填项
            if(empty($data['order_no'])){
                return api_arr(1,"Lack of parameters of order_no");
            }
            if(empty($data['schedule_id'])){
                return api_arr(1,"Lack of parameters of schedule_id");
            }

            //查询已支付订单信息
            $where_order['order_no'] = $data['order_no'];
            $where_order['status'] = 1;
            $info = $this->dao->where($where_order)->find();
            if(!$info){
                return api_arr(1,"no data");
            }

            //判断是否和原有日程相同
            if($info['schedule_id'] == $data['schedule_id']){
                return api_arr(1,"schedule Not the same");
            }

            //查询原有日程
            $old_schedule = $this->dao_schedule->where('id',$info['schedule_id'])->find();
            //判断当前预定时间日程是否可预定
            //查询当前预定日程信息
            $where_schedule['id'] = $data['schedule_id'];
            $where_schedule['enable'] = 1;
            $schedule = $this->dao_schedule->where($where_schedule)->find();
            if(!$schedule){
                return api_arr(1,"invalid schedule");
            }

            //判断预定日程是否在可预订范围内
            if($schedule['date']<strtotime(date('Y-m-d 00:00:00').'+3 day')){
                return api_arr(1,"Not within the intended range of schedule");
            }
            
            //判断是否超出最大订票数
            $data['visitor_count'] = $info['visitor_count']?$info['visitor_count']:0;
            $data['child_count'] = $info['child_count']?$info['child_count']:0;

            if(($data['visitor_count'] + $data['child_count'] +$schedule['visitor_count'])>$schedule['max_visitor']){
                return api_arr(1,"Not enough of visitor_count");
            }

            //开始更新订单预定时间事务
            Db::startTrans();
            try{

                //查询原有日程是否还原数据有误
                if($old_schedule['visitor_count']<$info['visitor_count'] || $old_schedule['child_count']<$info['child_count']){
                    throw new \Exception("schedule count Can not be negative,fail schedule_id:".$old_schedule['id']);
                }

                //订单原有日程订票数量还原
                if(!empty($info['visitor_count'])){
                    Db::table('yu_schedule')->where('id',$info['schedule_id'])->setDec('visitor_count',$info['visitor_count']);
                }
                if(!empty($info['child_count'])){
                    Db::table('yu_schedule')->where('id',$info['schedule_id'])->setDec('child_count',$info['child_count']);
                }

                //更新订单预定日程
                unset($data['id']);
                Db::table('yu_order')->where('id',$info['id'])->update($data);

                //更新日程信息,成人订票数量和儿童订票数量
                if(!empty($info['visitor_count'])){
                    Db::table('yu_schedule')->where('id',$data['schedule_id'])->setInc('visitor_count',$info['visitor_count']);
                }
                if(!empty($info['child_count'])){
                    Db::table('yu_schedule')->where('id',$data['schedule_id'])->setInc('child_count',$info['child_count']);
                }

                // 提交事务
                Db::commit();

                //发送邮件通知用户
                if(!empty($info['email'])){
                    $email_content = "敬啟者:<br/><br/>閣下已成功修改預約參觀可持續資源館 (S Gallery) 的資料。請核對已修改的內容:<br/><br/>團體名稱: ".$info['group_name']."<br/><br/>原本預約資料<br/>參觀日期及時段: ".date('Y-m-d',$old_schedule['date']).",时间:".date('H:i',$this->unixtime+$old_schedule['start_time'])."-".date('H:i',$this->unixtime+$old_schedule['end_time'])."<br/>參觀人數 成人: ".$info['visitor_count']."     學生: ".$info['child_count']."<br/><br/>更新預約資料<br/>參觀日期及時段: ".date('Y-m-d',$schedule['date']).",时间:".date('H:i',$this->unixtime+$schedule['start_time'])."-".date('H:i',$this->unixtime+$schedule['end_time'])."<br/>參觀人數 成人: ".$info['visitor_count']."     學生: ".$info['child_count']."<br/><br/>如有任何問題，歡迎致電 3411 2375 或電郵至 iba@hkbu.edu.hk 與我們聯絡。<br/>多謝閣下對可持續資源館的支持!<br/><br/>可持續資源館<br/>生物資源及農業研究所 謹啟<br/><br/><br/>Dear Sir/Madam,<br/><br/>Your request of revising the application information of the S Gallery visit has been successful. Please find the revised information as below:<br/><br/>Group Name:".$info['group_name']."<br/><br/>Original information<br/>Visiting date and time: ".date('Y-m-d',$old_schedule['date']).",time:".date('H:i',$this->unixtime+$old_schedule['start_time'])."-".date('H:i',$this->unixtime+$old_schedule['end_time'])."<br/>No. of visitors: ".$info['visitor_count']." adult ".$info['child_count']." students<br/><br/>Revised information:<br/>Visiting date and time: ".date('Y-m-d',$schedule['date']).",time:".date('H:i',$this->unixtime+$schedule['start_time'])."-".date('H:i',$this->unixtime+$schedule['end_time'])."<br/>No. of visitors: ".$info['visitor_count']." adult ".$info['child_count']." students<br/><br/>Should you require further assistance, please contact our staff at 3411 2375 or email at iba@hkbu.edu.hk.<br/><br/>Thank you for your support on the S Gallery!<br/><br/>Sustainability Gallery<br/>Institute of Bioresource and Agriculture";

                    send_email([['user_email'=>$info['email'],'content'=>$email_content]]);
                    // if(!$mail_res){
                    //     throw new \Exception('user modify mail send result:'.($mail_res?'yes':'no'));
                    // }
                }  
                return api_arr(0,"success");

            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return api_arr(1,$e->getMessage());
            }

            
        }
    }
  
    /**
     * 订单支付信息修改
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-28T14:34:21+0800
     * @return    
     */
    public function pay($data){

        try{   
            //获取订单号
            $order_no = $data['invoice'];
            if(empty($order_no)){
                log_result('Payment callback:Update order payment information failed-Lack of parameters order_no','paypal');
                return false;
            }
            $where_order['a.order_no'] = $order_no;
            $where_order['a.status'] = 0;
            //查询订单信息
            $order_info = $this->dao->alias('a')
                        ->join('yu_schedule b','a.schedule_id = b.id')
                        ->where($where_order)
                        ->field('a.order_no,a.status,a.pay,a.email,a.group_name,a.first_name,a.last_name,b.date,b.start_time,b.end_time,a.visitor_count,a.child_count')
                        ->find(); 

            if(empty($order_info)){
                log_result('Payment callback:Update order payment information failed-order no data','paypal');
                return false;
            }

            if($order_info['status']!=0){
                log_result('Payment callback:Update order payment information failed-order invalid status data','paypal');
                return false;
            }
           
            // 更改订单支付状态 
            $order_data['status'] = 1;
            $order_data['update_time'] = time();
            $order_result = $this->dao->where('order_no',$order_no)->update($order_data);
            if(!$order_result){
                log_result('Payment callback:Update order payment information failed-update fail','paypal');
                return false;
            }

             //发送邮件通知用户
            if(!empty($order_info['email'])){
                $email_content = "敬啟者:<br/>閣下已成功預約可持續資源館 (S Gallery)的參觀，請核對預約參觀資料:<br/><br/>預約參考編號: ".$order_info['order_no']."<br/>參觀日期及時段: ".date('Y-m-d',$order_info['date']).",時段:".date('H:i',$this->unixtime+$order_info['start_time'])."-".date('H:i',$this->unixtime+$order_info['end_time'])."<br/>參觀人數 成人: ".$order_info['visitor_count']."      學生: ".$order_info['child_count']."<br/><br/>團體名稱: ".$order_info['group_name']."<br/>團體聯絡人: ".$order_info['first_name'].$order_info['last_name']."<br/> 登記電郵: ".$order_info['email']."<br/>已支付費用: HK$".$order_info['pay']."<br/>收據參考編號: ".$data['txn_id']."<br/><br/>請細閱附件的參觀須知。<br/>如有任何問題，歡迎致電 3411 2375或電郵至 iba@hkbu.edu.hk 與我們聯絡。<br/>多謝閣下對可持續資源館的支持!<br/><br/>可持續資源館<br/>生物資源及農業研究所 謹啟<br/><br/>Dear Sir/ Madam,<br/><br/>Your application of the S Gallery visit has been successful, please verify the following information:<br/><br/>Application Ref No: ".$order_info['order_no']."<br/>Visiting date and time:".date('Y-m-d',$order_info['date']).",time:".date('H:i',$this->unixtime+$order_info['start_time'])."-".date('H:i',$this->unixtime+$order_info['end_time'])."<br/>No of visitors:   ".$order_info['visitor_count']." adult ".$order_info['child_count']." students<br/><br/>Group name:".$order_info['group_name']."<br/>Contact person:".$order_info['first_name'].$order_info['last_name']."<br/>Registered email:".$order_info['email']."<br/>Paid fee:HK$".$order_info['pay']."<br/>Receipt Ref No:".$data['txn_id']."<br/><br/> Please read the Guidelines to visitors for further information.<br/>Should you require further assistance, please contact our staff at 3411 2375 or email at iba@hkbu.edu.hk.<br/><br/>Thank you for your support on the S Gallery!<br/><br/>Sustainability Gallery<br/>Institute of Bioresource and Agriculture";

                send_email([['user_email'=>$order_info['email'],'content'=>$email_content]]);
                // if(!$mail_res){
                //     log_result('notify mail send result:'.($mail_res?'yes':'no'));
                //     return  false;
                // }
            }
            //记录支付回调成功信息
            log_result("paypal notify: success",'paypal');
            return true;

        } catch (\Exception $e) {
            log_result("update_order:".$e->getMessage());
        } 
    }

    /**
     * 生成订单号
     * @author gyj <375023402@qq.com>
     * @createtime 2018-08-22T17:35:04+0800
     * @return     string
     */
    private function order_no(){
        //当前时间字符
        $time_no = date('YmdHis');
        //查询当前时间是否有订单
        $where['order_no'] = array('like','%'.$time_no.'%');
        $last_no = $this->dao->where($where)->order('order_no desc')->value('order_no');
        //判断当前时间是否有订单,如果有根据当前订单号加1生成订单号,没有生成当前时间第一个订单
        $order_no = $time_no.'000001';
        if($last_no){
            $last_num = intval(substr($last_no,15,20));
            $last_num++;
            if(strlen($last_num)<6){
                $last_num = str_pad($last_num,6,"0",STR_PAD_LEFT);
            }
            $order_no = $time_no.$last_num;
        }
        return $order_no;

    }


}
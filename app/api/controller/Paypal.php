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
// | CreateTime: 2018-09-13 15:34:49
// +----------------------------------------------------------------------
namespace app\api\controller;
require '../extend/PayPal/autoload.php';
use app\api\controller\Common;
use app\api\controller\Order;
use think\db;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Api\ExecutePayment;
use PayPal\Api\PaymentExecution;


class Paypal extends Common {

    /**
     * 初始化
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-13T15:38:07+0800
     * @return     
     */
    public function _initialize(){
       
        // Autoload SDK package for composer based installations
        $this->apiContext = new \PayPal\Rest\ApiContext(
          new \PayPal\Auth\OAuthTokenCredential(
            config('paypal.cilent_id'),
            config('paypal.secret')
          )
        );
    }

    /**
     * 创建paypal支付订单
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-13T15:43:35+0800
     * @return     
     */
    public function pay($order_no='',$pay=0){
        //parameters validate
        if (empty($order_no) || empty($pay)) {
          return api_arr(1,"Lack of parameters of order_no or pay");
        }

        //find order info
        $where_order['status'] = 0;
        $where_order['order_no'] = $order_no;
        $order_info = db('order')->where($where_order)->find();
        //order validate
        if(!$order_no || $order_info['pay']!=$pay){
          return api_arr(1,"illegal request");
        }


        // Create new payer and method
        $payer = new Payer();
        $payer->setPaymentMethod("paypal");

        // Set redirect URLs
        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl(config('paypal.return_domain').config('paypal.return')."?order_no=".$order_no)
          ->setCancelUrl(config('paypal.return_domain').config('paypal.cancel_return')."?order_no=".$order_no);

        // Set payment amount
        $amount = new Amount();
        $amount->setCurrency(config('paypal.currency_code'))
          ->setTotal($pay);

        // Set transaction object
        $transaction = new Transaction();
        $transaction->setAmount($amount)
          ->setDescription("order_no:".$order_no.",total:".$pay)
          ->setInvoiceNumber($order_no);

        // Create the full payment object
        $payment = new Payment();
        $payment->setIntent('sale')
          ->setPayer($payer)
          ->setRedirectUrls($redirectUrls)
          ->setTransactions(array($transaction));

        // Create payment with valid API context
        try {
            $payment->create($this->apiContext);

            // Get PayPal redirect URL and redirect the customer
             $approvalUrl = $payment->getApprovalLink();

          // Redirect the customer to $approvalUrl
        } catch (PayPal\Exception\PayPalConnectionException $ex) {
          log_result($ex->getMessage(),"paypal");
          $this->error($ex->getMessage());
        } catch (Exception $ex) {
          log_result($ex->getMessage(),"paypal");
          $this->error($ex->getMessage());
        }
        return api_arr(0,"success",$approvalUrl);
    }

    /**
     * 支付提交
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-13T15:44:15+0800
     * @return     
     */
    public function execute(){
        $order_no = $_GET['order_no'];
        // Get payment object by passing paymentId
        $paymentId = $_GET['paymentId'];
        $payment = Payment::get($paymentId, $this->apiContext);
        $payerId = $_GET['PayerID'];

        // Execute payment with payer ID
        $execution = new PaymentExecution();
        $execution->setPayerId($payerId);

        try {
          // Execute payment
          $result = $payment->execute($execution, $this->apiContext);
        } catch (PayPal\Exception\PayPalConnectionException $ex) {
          log_result($ex->getMessage(),"paypal");
          $this->error($ex->getMessage());
        } catch (Exception $ex) {
          log_result($ex->getMessage(),"paypal");
          $this->error($ex->getMessage());
        }

        //success url
        $success_url =config('paypal.url_domain').config('paypal.success_url')."?order_no=".$order_no;

        //find order
        $where_order['order_no'] = $order_no;
        $order_info = db('order')->where($where_order)->find();

        //check admin or visitor
        if($order_info && $order_info['admin_id']>0){
          $success_url =config('paypal.url_domain').config('paypal.admin_success')."?id=".$order_info['id']."&type_id=".$order_info['is_group'];
        }

        //success page 
        $this->redirect($success_url);
    }

    /**
     * 取消支付
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-13T16:00:31+0800
     * @return     
     */
    public function cancel(){
        $order_no = $_GET['order_no'];

        //cancel url
        $cancel_url =config('paypal.url_domain').config('paypal.cancel_url')."?order_no=".$order_no;

        //find order
        $where_order['order_no'] = $order_no;
        $order_info = db('order')->where($where_order)->find();

        //check admin or visitor
        if($order_info && $order_info['admin_id']>0){
          $cancel_url =config('paypal.url_domain').config('paypal.admin_cancel')."?id=".$order_info['id']."&type_id=".$order_info['is_group'];
        }

        //cancel page 
        $this->redirect($cancel_url);
    }

    /**
     * 回调函数
     * @author gyj <375023402@qq.com>
     * @createtime 2018-09-14T16:38:20+0800
     * @return   
     */
    public function notify(){
      
        if(!$this->request->isPost()) die();

        //获取回调结果
        $json_data = get_JsonData();

        if(!empty($json_data)){
            log_result("paypal notify info:\r\n".json_encode($json_data),"paypal");
        }

        //组装支付回调信息
        $data['invoice'] = $json_data['resource']['invoice_number'];
        $data['txn_id'] = $json_data['id'];
        $data['total'] = $json_data['resource']['amount']['total'];
        $data['status'] = $json_data['status']?$json_data['status']:'';
        $data['state'] = $json_data['resource']['state'];
        $data['result'] = json_encode($json_data);
        $data['create_time'] = time();

        try {
          //查询订单信息
          $where_order['status'] = 0;
          $where_order['order_no'] = $data['invoice'];
          $order_info = db('order')->where($where_order)->find();
          if(!$order_info){
            throw new \Exception("no pay order not find,order_no:".$data['invoice']." ");
          }
          if($order_info['pay'] != $data['total']){
            $is_eq = ($order_info['pay'] == $data['total'])?"yes":"no";
            throw new \Exception("order pay neq paypal total:order_info=".$order_info['pay']."&paypal total=".$data['total']."&result=".$is_eq);
          }
          
          //数据库记录支付回调信息
          $res = db('paypal')->insert($data);
          if(!$res){
            throw new \Exception("Payment callback:Update paypal payment information failed-update fail");
          }
          //判断支付结果,如果支付完成 修改订单状态
          if($json_data['resource']['state'] == 'completed'){
              //订单状态修改
              $order = new Order();
              $order->pay($data);
          }

        } catch (\Exception $e) {
          //记录错误日志
          log_result("paypal notify fail:".$e->getMessage(),"paypal");
          return "fail";
        }
        return "success";
    }

} 

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : museum

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-24 15:49:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yu_paypal
-- ----------------------------
DROP TABLE IF EXISTS `yu_paypal`;
CREATE TABLE `yu_paypal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `cmd` char(20) NOT NULL DEFAULT '' COMMENT '购物车系统',
  `business` char(100) NOT NULL DEFAULT '' COMMENT 'paypal账号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '支付商品信息',
  `amount` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单支付金额',
  `currency_code` char(10) NOT NULL DEFAULT '' COMMENT '货币类型',
  `return` varchar(255) NOT NULL DEFAULT '' COMMENT '支付成功跳转页面',
  `invoice` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `charset` char(10) NOT NULL DEFAULT '' COMMENT '编码',
  `no_shipping` char(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `no_note` char(5) NOT NULL DEFAULT '',
  `cancel_return` varchar(255) NOT NULL DEFAULT '' COMMENT '订单取消支付跳转链接',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '支付回调',
  `rm` char(5) NOT NULL DEFAULT '',
  `payment_status` char(100) NOT NULL DEFAULT '' COMMENT '支付状态',
  `receiver_email` char(100) NOT NULL DEFAULT '' COMMENT '收款账号',
  `mc_gross` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '返回状态值',
  `mc_currency` char(20) NOT NULL DEFAULT '' COMMENT '返回货币类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='paypal支付表';

-- ----------------------------
-- Records of yu_paypal
-- ----------------------------

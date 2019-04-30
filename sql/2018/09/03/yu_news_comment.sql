/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : museum

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-03 11:02:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yu_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `yu_news_comment`;
CREATE TABLE `yu_news_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `news_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新闻编号',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `user_name` char(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text NOT NULL COMMENT '内容',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发布状态 0否 1是',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of yu_news_comment
-- ----------------------------
INSERT INTO `yu_news_comment` VALUES ('1', '1', '1', 'test', 'testsafasdfasdf ', '0', '0', '0');
INSERT INTO `yu_news_comment` VALUES ('2', '1', '2', 'zhangsan', 'testaa', '0', '1535942510', '1535942510');
INSERT INTO `yu_news_comment` VALUES ('3', '1', '1', 'zhangsan', 'testaa', '0', '1535942726', '1535942726');
INSERT INTO `yu_news_comment` VALUES ('4', '1', '1', 'zhangsan', 'testaa', '0', '1535942730', '1535942730');
INSERT INTO `yu_news_comment` VALUES ('5', '2', '2', 'zhangsan', 'testaa', '0', '1535943249', '1535943249');

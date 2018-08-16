/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : museum

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-16 20:00:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yu_administrator
-- ----------------------------
DROP TABLE IF EXISTS `yu_administrator`;
CREATE TABLE `yu_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `full_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(50) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of yu_administrator
-- ----------------------------
INSERT INTO `yu_administrator` VALUES ('1', 'admin', '314a83af865fe4dce89d24780f35f6a3', 'admin', null, '2018-08-07 10:44:36', null, null, null);
INSERT INTO `yu_administrator` VALUES ('2', 'admin1', '314a83af865fe4dce89d24780f35f6a3', 'admin', null, '2018-08-07 10:44:36', null, null, null);

-- ----------------------------
-- Table structure for yu_braa
-- ----------------------------
DROP TABLE IF EXISTS `yu_braa`;
CREATE TABLE `yu_braa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `ext_climate` text COMMENT '极端气候模块',
  `biologicals` text COMMENT '生物数目锐减模块',
  `produce_crisis` text COMMENT '生产危机模块',
  `food_supply` text COMMENT '粮食供应模块',
  `organic_agri` text COMMENT '有机农业模块',
  `cflr` text COMMENT '衣食住行模块',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='生物资源与农业信息';

-- ----------------------------
-- Records of yu_braa
-- ----------------------------
INSERT INTO `yu_braa` VALUES ('1', '3', '{\"Landslide\":\"5\",\"Earthquake\":\"8\",\"Extreme_Temperature\":\"6\",\"Volcanic_Activity\":\"2\",\"images\":\"uploads\\/2018\\/08-15\\/info.jpg\",\"temperature\":\"0.94\",\"storm\":\"28\",\"drougt\":\"5\",\"wildfire\":\"4\",\"flood\":\"43\",\"year\":\"20\",\"tips\":[\"\\u904e\\u53bb\",\"\\u5e74\",\"\\u5168\\u7403\\u9304\\u5f97\\u8fd1<b>7,000<\\/b>\\u5b97\\u5929\\u707d\\uff0c\",\"\\u8d85\\u904e<b>9<\\/b>\\u6210\\u8207\\u6c23\\u5019\\u8b8a\\u5316\\u6709\\u95dc\"]}', '{\"summary\":\"\\u6ec5\\u7d55\\u662f\\u9032\\u5316\\u904e\\u7a0b\\u7684\\u4e00\\u500b\\u81ea\\u7136\\u90e8\\u5206\\uff0c\\u4f46\\u4eba\\u985e\\u904e\\u5ea6\\u4f7f\\u7528\\u751f\\u7269\\u8cc7\\u6e90\\uff0c\\r\\n\\u751f\\u614b\\u8db3\\u8de1\\u73fe\\u6642\\u5df2\\u8d85\\u904e\\u4e86\\u5730\\u7403\\u53ef\\u518d\\u751f\\u80fd\\u529b\\u768460%\\uff0c\\u5c0e\\u81f4\\u73fe\\u6642\\u6bcf\\u5c0f\\u6642\\u5c31\\u67091\\u500b\\u7269\\u7a2e\\u6ec5\\u7d55\\uff0c\\u518d\\u904e100\\u5e74\\u5730\\u7403\\u5c07\\u55aa\\u593175%\\u7684\\u7269\\u7a2e\\uff01\",\"year\":\"1970 \\u5e74 > 2012\\u5e74\",\"land\":\"38\",\"Freshwater_organisms\":\"81\",\"Marine_organism\":\"6\"}', '{\"percent\":\"17\",\"content1\":\"\\u9810\\u8a08\\u6d77\\u5e73\\u9762\\u4e0a\\u5347\\u5c07\\u6df9\\u6c92\\u5b5f\\u52a0\\u62c9\",\"content2\":\"\\u7684\\u571f\\u5730\\uff0c\",\"content3\":\"\\u6467\\u6bc0\\u80a5\\u6c83\\u8fb2\\u5730\"}', '{\"summary\":\"\\u8d85\\u904e9\\u6210\\u98df\\u7269\\u70ba\\u9032\\u53e3\\u98df\\u54c1\\uff0c\\u7ce7\\u98df\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc1\\u6210\\u3002\\r\\n\\u852c\\u83dc\\u672c\\u5730\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc2%\\u3002\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/meat.png\",\"intro\":\"\\u672c\\u6e2f<b>94%<\\/b>\\u7684\\u65b0\\u9bae\\u8c6c\\u8089\\u3001<b>100%<\\/b> \\u7684\\u65b0\\u9bae\\u725b\\u8089\"},\"content2\":{\"image\":\"uploads\\/2018\\t\\/08-15\\/vegetable.png\",\"intro\":\"<b>92%<\\/b>\\u7684\\u852c\\u83dc\\u53ca <b>66%<\\/b>\\u7684\\u96de\\u86cb\\uf92d\\u81ea\\u5167\\u5730\\u3002\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/fruit.png\",\"intro\":\"\\u81f3\\u65bc\\u65b0\\u9bae\\u6c34\\u679c\\uff0c\\u672c\\u6e2f\\u7684\\u4e3b\\u8981\\u9032\\u53e3\\uf92d\\u6e90\\u70ba\\u7f8e\\u570b\\r\\n\\u3001\\u5167\\u5730\\u3001\\u83f2\\uf9d8\\u8cd3\\u53ca\\u6cf0\\u570b\\u3002\"}}', '{\"summary\":\"<b>2000<\\/b>\\u5e74\\u81f3\\u4eca\\u6709\\u6a5f\\u8fb2\\u696d\\u76db\\u884c\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/item1.png\",\"title\":\"\\u4f54\\u5730\\u9762\\u7a4d\",\"intro\":\"9.5\"},\"content2\":{\"image\":\"uploads\\/2018\\/08-15\\/item2.png\",\"title\":\"\\u6709\\u6a5f\\u8fb2\\u5834\",\"summary\":\"\\u53c3\\u8207\\u300c\\u6709\\u6a5f\\u8015\\u4f5c\\u652f\\u63f4\\u670d\\u52d9\\u300d\\u7684\\u83dc\\u5834\",\"intro\":\"299\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/item3.png\",\"title\":\"\\u6709\\u6a5f\\u8a8d\\u8b49\\u8fb2\\u5834\",\"intro\":\"153\"},\"title\":\"\\u5be6\\u8e10\\u6709\\u6a5f\\u8fb2\\u696d\\uff0c\\u8f49\\u5371\\u70ba\\u6a5f\\uff01\"}', '{\"title\":\"\\u6211\\u5011\\u7684\\u751f\\u6d3b\\u6a21\\u5f0f\\u74b0\\u5883\\u627f\\u53d7\\u5230\\u55ce \\uff1f\",\"child_title\":[\"\\u8863\",\"\\u98df\",\"\\u4f4f\",\"\\u884c\"],\"background\":\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"content1\":{\"summary\":\"\\u770b\\u4f3c\\u7a7a\\u865b\\u7684\\u8863\\u6ac3\",\"tips\":[\"\\u9999\\u6e2f\\u4eba\\u5747\\u64c1\\u6709:\",\"\\u8863\\u670d\\u4e4b\\u591a\",\"\\uff0c\\u7136\\u800c\\u6709\",\"\\u662f\\u5f88\\u5c11\\u6216\",\"\\u5f9e\\u672a\\u7a7f\\u904e\\u7684\\u3002\",\"\\u55ae\\u57282015\\u5e74\\uff0c \\u9999\\u6e2f\\u7d21\\u7e54\\u7269\\u68c4\\u7f6e\\u91cf\\u9ad8\\u9054<b>11<\\/b>\\u842c\\u5678\",\"\\u5373\\u6bcf<b>1<\\/b>\\u5206\\u9418 \\u5c31\\u6709\",\"T-\\u6064\\u88ab\\u907a\\u68c4\",\"\\u88ab\\u4e1f\\u68c4\\u7684\\u8863\\u7269\\u52a0\\u8d77\\u4f86\\u7684\",\"\\u9762\\u7a4d\\u66f4\\u8db3\\u5920\\u8986\\u84cb:\",\"<b>25000<\\/b>\\u500b\\u9999\\u6e2f\\u5927\\u7403\\u5834\"],\"num\":[\"94\",\"15\",\"1400\"]},\"content2\":{\"summary\":\"\\u88ab\\u5bf5\\u58de\\u7684\\u80c3\",\"images\":\"uploads\\/2018\\/08-15\\/screen3.png\"},\"content3\":{\"summary\":\"\\u63ee\\u970d\\u7121\\u5ea6\\u7684\\u8778\\u5c45\",\"tips\":[\"\\u6bcf\\u5e74\\uff0c\\u5168\\u6e2f\\u6254\\u6389\\u8d85\\u904e<b>7<\\/b>\\u842c\\u516c\\u5678\\u5ee2\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u7522\\u54c1\\u3002\",\"\\u90e8\\u5206\\u88ab\\u68c4\\u7f6e\\u7684\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u4ecd\\u53ef\\u6b63\\u5e38\\u904b\\u4f5c\\u6216\\u4f5c\\u4e8c\\u624b\\u7528\\u9014\\uff0c  \\u537b\\u88ab\\u9001\\u5230\\u5806\\u586b\\u5340\\u767d\\u767d\\u6d6a\\u8cbb\\uff1f\"],\"images\":\"uploads\\/2018\\/08-15\\/screen4.png\"},\"content4\":{\"summary\":\"\\u6c23\\u5019\\u6696\\u5316\\u7684\\u6838\\u5fc3\\u5916\\u570d\",\"tips\":[\"\\u904b\\u8f38\\u6d88\\u8017\\u5927\\u91cf\\u80fd\\u6e90\\uff0c\\u57282015\\u5e74\\uff0c\\u5c31\\u4f54\\u4e86\\u5168\\u6e2f\\u4e09\\u5206\\u4e4b\\u4e00\\u7684\\u7e3d\\u80fd\\u6e90\\u6d88\\u8017\\uff1b\",\"2015\\u5e74\\u904b\\u8f38\\u6240\\u6392\\u653e\\u7684\\u6eab\\u5ba4\\u6c23\\u9ad4\\u91cf\\u9ad8\\u9054<b>747<\\/b>\\u842c\\u516c\\u5678\\u4e8c\\u6c27\\u5316\\u78b3\\u7576\\u91cf\",\"\\u5373<b>1255<\\/b>\\u500b\\u6a19\\u6e96\\u6e38\\u6cf3\\u6c60\\u7684\\u5bb9\\u91cf \\uff0c\\u4f54\\u7e3d\\u6392\\u653e\\u91cf\\u7684<b>18<\\/b>%\"],\"images\":\"uploads\\/2018\\/08-15\\/screen5.png\"}}', '1', '2018-08-16 09:47:22', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_contact_config
-- ----------------------------
DROP TABLE IF EXISTS `yu_contact_config`;
CREATE TABLE `yu_contact_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` text COMMENT '联络我们header大图',
  `header_title` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图片顶部标题',
  `header_content` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '头部图片上显示的文字',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '背景',
  `email` varchar(100) DEFAULT NULL COMMENT '地址邮箱',
  `tel` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '电话',
  `coordinate` varchar(100) DEFAULT NULL COMMENT '坐标',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(30) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='联络我们配置表';

-- ----------------------------
-- Records of yu_contact_config
-- ----------------------------
INSERT INTO `yu_contact_config` VALUES ('1', 'uploads/2018/08-15/contactBg.jpg', '聯絡我們', '化主詩物趣足沒車心臺我大苦理體實', '', 'hkorc@hkbu.edu.hk', '(852) 34112384', '22.336098,114.182748', '1', '2018-08-16 18:13:58', '192.168.0.146');

-- ----------------------------
-- Table structure for yu_contact_content
-- ----------------------------
DROP TABLE IF EXISTS `yu_contact_content`;
CREATE TABLE `yu_contact_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '联系配置表编号',
  `tel` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `office_hours` varchar(255) DEFAULT NULL COMMENT '办公时间	',
  `language` tinyint(1) NOT NULL DEFAULT '1' COMMENT '语言类型',
  `header_title` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图片顶部标题',
  `header_content` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '头部图片上显示的文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='联络我们内容表';

-- ----------------------------
-- Records of yu_contact_content
-- ----------------------------
INSERT INTO `yu_contact_content` VALUES ('1', '1', '(852) 34112384', '香港九龍塘香港浸會大學善衡校園呂明才中心5樓505室', '星期一至五上午九時至下午一時;\r\n下午二時至下午五時半\r\n周六、周日及公眾假期休息', '3', '聯絡我們', '化主詩物趣足沒車心臺我大苦理體實');

-- ----------------------------
-- Table structure for yu_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yu_coupon`;
CREATE TABLE `yu_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '折扣代码',
  `discount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣金额',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣码发放总数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态  0 未使用 1已使用 2已失效',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣表';

-- ----------------------------
-- Records of yu_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for yu_ehall
-- ----------------------------
DROP TABLE IF EXISTS `yu_ehall`;
CREATE TABLE `yu_ehall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `srp` text COMMENT '可持续资源馆模块',
  `successes` int(11) DEFAULT NULL COMMENT '成功著陸次数',
  `trainings` int(11) DEFAULT NULL COMMENT '通過培訓人次',
  `images1` text COMMENT '图片区域1',
  `images2` text COMMENT '图片区域2',
  `images3` text COMMENT '图片区域3',
  `images4` text COMMENT '图片区域4',
  `images5` text COMMENT '图片区域5',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='展览馆信息';

-- ----------------------------
-- Records of yu_ehall
-- ----------------------------
INSERT INTO `yu_ehall` VALUES ('1', '3', '{\"title\":\"\\u53ef\\u6301\\u7e8c\\u8cc7\\u6e90\\u8218\",\"summary\":\"2100 \\u5e74\\u56e0\\u5730\\u7403\\u74b0\\u5883\\u60e1\\u52a3,\\u4eba\\u985e\\u903c\\u4e8e\\u7121\\u5948\\u96e2\\u958b\\u4e86\\u5730\\u7403,\\u65bc\\u4e00\\u500b\\u6f02\\u6d6e\\u65bc\\u592a\\u7a7a\\u7684\\u6bcd\\u8266\\u300c\\u8afe\\u4e9e\\u865f\\u300d\\u4e0a \\u751f\\u6d3b\\u3002\\u4f46\\u300c\\u8afe\\u4e9e\\u865f\\u300d\\u7684\\u8cc7\\u6e90\\u5c07\\u5728 100 \\u5e74\\u9593\\u8017\\u76e1,\\u4eba\\u985e\\u5fc5\\u9808\\u8981\\u5728\\u6642\\u9593\\u8017\\u76e1\\u524d\\u56de\\u6b78\\u5730\\u7403,\\u5c0b\\u627e\\u7e7c \\u7e8c\\u5b58\\u6d3b\\u7684\\u6a5f\\u6703\\u30022200 \\u5e74,30 \\u4f4d\\u7b2c\\u4e00\\u6279\\u592a\\u7a7a\\u4eba\\u6210\\u529f\\u65bc\\u5357\\u6975\\u6d32\\u8457\\u9678,\\u5efa\\u7acb\\u8d77\\u5730\\u7403\\u65b0\\u7d00\\u5143\\u7684\\u7b2c\\u4e00\\u500b \\u6751\\u843d,\\u4e4b\\u5f8c\\u4eba\\u985e\\u5b8c\\u6210\\u4e86 107 \\u6b21\\u300c\\u5730\\u7403\\u56de\\u6b78\\u4efb\\u52d9\\u300d\\u3002\\r\\n\\r\\n\\u4eca\\u5929-\\u5373 2300 \\u5e74 11 \\u6708 11 \\u65e5,\\u5373\\u5c07\\u662f\\u4f60\\u548c\\u5176\\u4ed6 30 \\u4f4d\\u592a\\u7a7a\\u4eba\\u96a8\\u5373\\u5c55\\u958b\\u7da0\\u8272\\u7684\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u8a13\\u7df4, \\u4e26\\u63a5\\u53d7\\u6700\\u7d42\\u8003\\u6838\\u7684\\u91cd\\u8981\\u6642\\u523b,\\u901a\\u904e\\u6e2c\\u8a66\\u624d\\u80fd\\u767b\\u4e0a\\u56de\\u6b78\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4e4b\\u65c5......\"}', '100', '100', '{\"title\":\"\\u7a7f\\u68ad\\u6642\\u7a7a\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5c07\\u767b\\u4e0a\\u8d85\\u5149\\u901f\\u98db\\u8239,\\u7a7f\\u8d8a\\u6642\\u7a7a\\u96a7\\u9053\\u91cd\\u8fd4 21 \\u4e16\\u7d00,\\u4ee5 180 \\u309a\\u5168\\u666f\\u7192\\u5e55\\u914d\\u5408\\u56db\\u65b9\\u516b\\u9762\\u7684 4D\\u7279\\u6280\\u4e0a\\u6f14\\u6975\\u5177\\u8996\\u807d\\u9707\\u64bc\\u7684\\u300c2100 \\u672b\\u65e5\\u4e4b\\u5883\\u300d,\\u8b93\\u60a8\\u89aa\\u6b77 21 \\u4e16\\u7d00\\u672b,\\u9ad4\\u9a57\\u8d85\\u8f09\\u7684\\u5730\\u7403\\u6158\\u906d\\u4eba\\u985e\\u7834\\u58de\\u7684\\u672b\\u65e5\\u4e4b\\u5883\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg1.jpg\"}', '{\"title\":\"\\u63a2\\u7d22\\u8cc7\\u6e90\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u91cd\\u8fd4\\u592a\\u7a7a\\u7ad9\\uff0c\\u6b63\\u5f0f\\u958b\\u59cb\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u8a13\\u7df4\\u3002\\u5f9e\\u672a\\u8e0f\\u8db3\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4eba\\u5c07\\u5728\\u6b64\\u5340\\u4ee5\\u9ad4\\u9a57\\u0041\\u0052\\u64f4\\u589e\\u5be6\\u5883\\u6280\\u8853\\u8a8d\\u8b58\\u5730\\u7403\\u7269\\u7a2e\\u53ca\\u751f\\u7269\\u8cc7\\u6e90\\uff0c\\u4e86\\u89e3\\u4eba\\u985e\\u6d3b\\u52d5\\u5c0d\\u751f\\u614b\\u74b0\\u5883\\u548c\\u7269\\u7a2e\\u9020\\u6210\\u7684\\u91cd\\u5927\\u5a01\\u8105\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '{\"title\":\"\\u300c\\u300c\\u6709\\u6a5f\\u8fb2\\u8015\\u4efb\\u52d9\\u7ad9\\u300d\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5728\\u5145\\u6eff\\u751f\\u6a5f\\u7684\\u6709\\u6a5f\\u8fb2\\u7530\\u81ea\\u7531\\u7a7f\\u68ad\\uff0c\\u7d30\\u807d\\u8fb2\\u592b\\u5206\\u4eab\\u6709\\u6a5f\\u8fb2\\u8015\\u5c0f\\u6545\\u4e8b\\uff0c\\u900f\\u904e\\u975e\\u51e1\\u7684\\u591a\\u5a92\\u9ad4\\u6280\\u8853\\u5b8c\\u6210\\u8fb2\\u8015\\u4efb\\u52d9\\uff0c\\u8a8d\\u8b58\\u5c0a\\u91cd\\u5927\\u81ea\\u7136\\u7684\\u795e\\u79d8\\u6cd5\\u5247\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '{\"title\":\"\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\",\"summary\":\"\\u8d70\\u9032\\u9ad8\\u7aef\\u7684\\u8cfc\\u7269\\u4e2d\\u5fc3\\uff0c\\u63a5\\u53d7\\u5145\\u6eff\\u6311\\u6230\\u7684\\u53ef\\u6301\\u7e8c\\u6d88\\u8cbb\\u8a13\\u7df4\\uff0c\\u8a8d\\u8b58\\u73fe\\u4ee3\\u6d88\\u8cbb\\u6a21\\u5f0f\\uff0c\\u900f\\u904e\\u0056\\u0052\\u9ad4\\u9a57\\u91cd\\u65b0\\u5be9\\u8996\\u65e5\\u5e38\\u751f\\u6d3b\\u7fd2\\u6163\\uff0c\\u4e86\\u89e3\\u80cc\\u5f8c\\u7684\\u751f\\u614b\\u4ee3\\u50f9\\uff0c\\u5b78\\u6703\\u505a\\u500b\\u7cbe\\u660e\\u74b0\\u4fdd\\u7684\\u6d88\\u8cbb\\u8005\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '{\"title\":\"\\u5de5\\u4f5c\\u574a\",\"summary\":\"\\u900f\\u904e\\u5c0f\\u5be6\\u9a57\\u3001\\u624b\\u4f5c\\u548c\\u7a2e\\u690d\\u5de5\\u4f5c\\u574a\\u7b49\\uff0c\\u8b93\\u592a\\u7a7a\\u4eba\\u4e00\\u5c55\\u8eab\\u624b\\u89aa\\u8eab\\u5be6\\u8e10\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u6a21\\u5f0f\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '1', '2018-08-16 10:33:57', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_eqaa
-- ----------------------------
DROP TABLE IF EXISTS `yu_eqaa`;
CREATE TABLE `yu_eqaa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '0' COMMENT '1已解答',
  `isview` int(11) NOT NULL DEFAULT '0' COMMENT '1显示',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `ask` varchar(255) DEFAULT NULL COMMENT '问',
  `answer` varchar(255) DEFAULT NULL COMMENT '答',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型 language表id 默认为1',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序,越小越靠前',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答';

-- ----------------------------
-- Records of yu_eqaa
-- ----------------------------
INSERT INTO `yu_eqaa` VALUES ('1', '1', '1', '1', '幹嘛', '134564@qq.com', '023 975313', '這要幹嘛的', '之今息運，的鄉社自時死不理現老它笑也：記元有響間謝本約的視的相在城特。導果生人友老汽，東消思像能受神？', '3', '0', '1', '2018-08-15 16:44:44', '1', '2018-08-15 16:44:48', '127.0.0.1');
INSERT INTO `yu_eqaa` VALUES ('2', '0', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', null, '1', '0', null, '2018-08-15 17:15:22', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('3', '0', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', null, '1', '0', null, '2018-08-15 17:15:37', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('4', '0', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', null, '1', '0', null, '2018-08-15 17:15:52', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('5', '0', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', null, '2', '0', null, '2018-08-15 17:15:59', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('6', '0', '0', '1', 'test', 'test@test.com', '0238888888', 'testask', null, '2', '0', null, '2018-08-15 17:28:23', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('7', '0', '0', '2', 'test', 'we@email.com', '13985424551', '测试意见', null, '2', '0', null, '2018-08-16 09:35:30', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('8', '0', '0', '3', 'test', 'test@pal.com', '13584684551', 'dwqdwqdwqd', null, '2', '0', null, '2018-08-16 09:36:12', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('9', '0', '0', '3', 'dwqd', 'dwqdwqd', 'dqwdqd', 'qwdwqdqd', null, '2', '0', null, '2018-08-16 09:58:56', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('10', '0', '0', '2', 'qwdqd', 'wqdqwd', 'qdwqdwq', 'dwqdqwd', null, '3', '0', null, '2018-08-16 18:03:20', null, null, '192.168.0.124');

-- ----------------------------
-- Table structure for yu_eqaa_type
-- ----------------------------
DROP TABLE IF EXISTS `yu_eqaa_type`;
CREATE TABLE `yu_eqaa_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序,越小越靠前',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答类别';

-- ----------------------------
-- Records of yu_eqaa_type
-- ----------------------------
INSERT INTO `yu_eqaa_type` VALUES ('1', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');
INSERT INTO `yu_eqaa_type` VALUES ('2', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');
INSERT INTO `yu_eqaa_type` VALUES ('3', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_eqaa_typename
-- ----------------------------
DROP TABLE IF EXISTS `yu_eqaa_typename`;
CREATE TABLE `yu_eqaa_typename` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答类型名称';

-- ----------------------------
-- Records of yu_eqaa_typename
-- ----------------------------
INSERT INTO `yu_eqaa_typename` VALUES ('1', '3', '超載的地球', '1');
INSERT INTO `yu_eqaa_typename` VALUES ('2', '3', '2050面臨', '2');
INSERT INTO `yu_eqaa_typename` VALUES ('3', '3', '我們的生活模式', '3');
INSERT INTO `yu_eqaa_typename` VALUES ('4', '2', '超载的地球', '1');
INSERT INTO `yu_eqaa_typename` VALUES ('5', '2', '2050面临', '2');
INSERT INTO `yu_eqaa_typename` VALUES ('6', '2', '我们的生活', '3');

-- ----------------------------
-- Table structure for yu_help
-- ----------------------------
DROP TABLE IF EXISTS `yu_help`;
CREATE TABLE `yu_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '帮助信息名称',
  `key` char(20) NOT NULL DEFAULT '' COMMENT '键',
  `txt` varchar(255) NOT NULL DEFAULT '' COMMENT '文本内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `content` text NOT NULL COMMENT '具体内容',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '语言类型编号 语言表编号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='帮助信息表';

-- ----------------------------
-- Records of yu_help
-- ----------------------------
INSERT INTO `yu_help` VALUES ('1', '预约参观顶部头图和文字', 'appointment_header', '預 約 參 觀', 'uploads/2018/08-15/banner.jpg', '遞交', '3', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('2', '预约参观顶部头图和文字', 'appointment_header', '预 约 参 观', 'uploads/2018/08-15/banner.jpg', '递交', '2', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('3', 'Make an appointment to visit the top header and te', 'appointment_header', ' Appointment visit', 'uploads/2018/08-15/banner.jpg', 'submit', '1', '1534329991', '0');

-- ----------------------------
-- Table structure for yu_home
-- ----------------------------
DROP TABLE IF EXISTS `yu_home`;
CREATE TABLE `yu_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `banner` text COMMENT 'banner轮播模块',
  `srp` text COMMENT '可持续资源馆模块',
  `ebr` text COMMENT '生物资源耗尽模块',
  `backg` varchar(100) DEFAULT NULL COMMENT '预订模块背景图',
  `zone` text COMMENT '区域模块图片文字',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主页信息';

-- ----------------------------
-- Records of yu_home
-- ----------------------------
INSERT INTO `yu_home` VALUES ('1', '3', '\r\n[{\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}]', '[{\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"穿梭时空\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"探索资源\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"「有机农耕任务站」\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"可持续生活\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"工作坊\"\r\n}]', '{\r\n	\"number\": \"2030\",\r\n	\"text\": \"人类将需要2 个地球的资源!\"\r\n}', 'uploads/2018/08-13/banner2.jpg', '{\r\n	\"reception\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"reception\"\r\n	},\r\n	\"workshop\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"workshop\"\r\n	},\r\n	\"zone1\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone1\"\r\n	},\r\n	\"zone2\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone2\"\r\n	},\r\n	\"zone3\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone3\"\r\n	},\r\n	\"zone4\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone4\"\r\n	}\r\n}', '1', null, '127.0.0.1');
INSERT INTO `yu_home` VALUES ('2', '3', '\r\n[{\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}]', '[{\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"穿梭时空\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"探索资源\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"「有机农耕任务站」\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"可持续生活\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"工作坊\"\r\n}]', '{\r\n	\"number\": \"2030\",\r\n	\"text\": \"人类将需要2 个地球的资源!\"\r\n}', 'uploads/2018/08-13/banner2.jpg', '{\r\n	\"reception\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"reception\"\r\n	},\r\n	\"workshop\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"workshop\"\r\n	},\r\n	\"zone1\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone1\"\r\n	},\r\n	\"zone2\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone2\"\r\n	},\r\n	\"zone3\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone3\"\r\n	},\r\n	\"zone4\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone4\"\r\n	}\r\n}', '1', '0000-00-00 00:00:00', '127.0.0.1');
INSERT INTO `yu_home` VALUES ('3', '3', '\r\n[{\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/banner1.jpg\",\r\n	\"text\": \"<div class=\'pos-text\'> <div class = \'container text-center\'><h6> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\'> 非凡感官体验带您穿越时空,</font></font> <br class = \'hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 体验地球危机,反思当代生活模式。 </font><font style=\'vertical-align: inherit;\'>2</font> </font></h6 ><div class = \'caption hidden-xs\'> <font style = \'vertical-align: inherit;\' > <font style = \'vertical-align: inherit;\' > 香港首个以「 生物资源与农业」 为主题的体验学习馆 </font></font> </div> </div> </div>\"\r\n}]', '[{\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"穿梭时空\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"探索资源\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"「有机农耕任务站」\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"可持续生活\"\r\n}, {\r\n	\"img\": \"uploads/2018/08-13/hall.jpg\",\r\n	\"text\": \"工作坊\"\r\n}]', '{\r\n	\"number\": \"2030\",\r\n	\"text\": \"人类将需要2 个地球的资源!\"\r\n}', 'uploads/2018/08-13/banner2.jpg', '{\r\n	\"reception\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"reception\"\r\n	},\r\n	\"workshop\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"workshop\"\r\n	},\r\n	\"zone1\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone1\"\r\n	},\r\n	\"zone2\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone2\"\r\n	},\r\n	\"zone3\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone3\"\r\n	},\r\n	\"zone4\": {\r\n		\"img\": \"uploads/2018/08-13/caseFloor.png\",\r\n		\"text\": \"zone4\"\r\n	}\r\n}', '1', '0000-00-00 00:00:00', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_language
-- ----------------------------
DROP TABLE IF EXISTS `yu_language`;
CREATE TABLE `yu_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `language` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '语言',
  `creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='语言表';

-- ----------------------------
-- Records of yu_language
-- ----------------------------
INSERT INTO `yu_language` VALUES ('1', 'English', 'ENG', '2018-08-06 17:18:14');
INSERT INTO `yu_language` VALUES ('2', '简体中文', 'CHS', '2018-08-06 17:18:14');
INSERT INTO `yu_language` VALUES ('3', '繁體中文', 'CHT', '2018-08-06 17:18:22');

-- ----------------------------
-- Table structure for yu_logs
-- ----------------------------
DROP TABLE IF EXISTS `yu_logs`;
CREATE TABLE `yu_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0登录，1添加，2修改，3删除',
  `userid` int(11) DEFAULT NULL COMMENT '操作人',
  `ip` varchar(100) DEFAULT NULL COMMENT '操作ip',
  `act` varchar(255) DEFAULT NULL COMMENT '动作',
  `log_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `creattime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表';

-- ----------------------------
-- Records of yu_logs
-- ----------------------------
INSERT INTO `yu_logs` VALUES ('1', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:27:25');
INSERT INTO `yu_logs` VALUES ('2', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:01');
INSERT INTO `yu_logs` VALUES ('3', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:02');
INSERT INTO `yu_logs` VALUES ('4', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:02');
INSERT INTO `yu_logs` VALUES ('5', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:03');
INSERT INTO `yu_logs` VALUES ('6', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:03');
INSERT INTO `yu_logs` VALUES ('7', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:03');
INSERT INTO `yu_logs` VALUES ('8', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:03');
INSERT INTO `yu_logs` VALUES ('9', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:04');
INSERT INTO `yu_logs` VALUES ('10', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-14 16:28:04');
INSERT INTO `yu_logs` VALUES ('11', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:27:04');
INSERT INTO `yu_logs` VALUES ('12', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:28:43');
INSERT INTO `yu_logs` VALUES ('13', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:29:05');
INSERT INTO `yu_logs` VALUES ('14', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:29:27');
INSERT INTO `yu_logs` VALUES ('15', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:29:49');
INSERT INTO `yu_logs` VALUES ('16', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:31:57');
INSERT INTO `yu_logs` VALUES ('17', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:35:17');
INSERT INTO `yu_logs` VALUES ('18', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:35:58');
INSERT INTO `yu_logs` VALUES ('19', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:42:08');
INSERT INTO `yu_logs` VALUES ('20', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:44:56');
INSERT INTO `yu_logs` VALUES ('21', '0', '1', '192.168.0.124', 'Log in to CMS', 'Administrator ID:1', '2018-08-15 11:48:03');
INSERT INTO `yu_logs` VALUES ('22', '0', '1', '192.168.0.146', 'Log in to CMS', 'Administrator ID:1', '2018-08-16 11:50:23');
INSERT INTO `yu_logs` VALUES ('23', '2', '1', '192.168.0.146', 'Modify contact us', 'Modify contact us', '2018-08-16 18:13:58');
INSERT INTO `yu_logs` VALUES ('24', '1', '1', '192.168.0.146', 'Add help', 'ID:3', '2018-08-16 18:36:24');

-- ----------------------------
-- Table structure for yu_map
-- ----------------------------
DROP TABLE IF EXISTS `yu_map`;
CREATE TABLE `yu_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `longitude` char(15) NOT NULL DEFAULT '' COMMENT '经度 谷歌地图',
  `latitude` char(15) NOT NULL DEFAULT '' COMMENT '纬度 谷歌地图',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '位置',
  `business_time` text NOT NULL COMMENT '开放时间',
  `tel` char(20) NOT NULL DEFAULT '' COMMENT '电话',
  `email` char(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型 language表id 默认为1',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态 0否 1是',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='谷歌地图坐标定位';

-- ----------------------------
-- Records of yu_map
-- ----------------------------
INSERT INTO `yu_map` VALUES ('1', '22.336098', '114.182748', '香港九龍塘香港浸會大學', '星 期 一 至 日 \r\n上 午 1 0 時 至 下 午 7 時', '(852) 34112384', ' hkorc@hkbu.edu.hk', '3', '1', '0', '0');
INSERT INTO `yu_map` VALUES ('2', '22.336098', '114.182748', '香港九龙塘香港浸会大学', '星 期 一 至 日 \r\n上 午 1 0 时 至 下 午 7 时', '(852) 34112384', ' hkorc@hkbu.edu.hk', '2', '1', '0', '0');

-- ----------------------------
-- Table structure for yu_menu_cms
-- ----------------------------
DROP TABLE IF EXISTS `yu_menu_cms`;
CREATE TABLE `yu_menu_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL COMMENT '上级菜单id',
  `action` varchar(100) DEFAULT NULL COMMENT '行动',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='cms菜单表';

-- ----------------------------
-- Records of yu_menu_cms
-- ----------------------------
INSERT INTO `yu_menu_cms` VALUES ('1', 'menu1', '0', '', '0');
INSERT INTO `yu_menu_cms` VALUES ('2', 'menu2', '0', null, '0');
INSERT INTO `yu_menu_cms` VALUES ('3', 'menu3', '1', 'help/index', '0');
INSERT INTO `yu_menu_cms` VALUES ('4', 'menu4', '2', 'map/index', '0');
INSERT INTO `yu_menu_cms` VALUES ('5', 'menu5', '2', 'coupon/index', '0');

-- ----------------------------
-- Table structure for yu_menu_front
-- ----------------------------
DROP TABLE IF EXISTS `yu_menu_front`;
CREATE TABLE `yu_menu_front` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `action` varchar(255) DEFAULT NULL COMMENT '行动',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='网页菜单（未使用）';

-- ----------------------------
-- Records of yu_menu_front
-- ----------------------------
INSERT INTO `yu_menu_front` VALUES ('1', '生物資源與農業', null, '0', '0');
INSERT INTO `yu_menu_front` VALUES ('2', '展覽館', null, '0', '1');
INSERT INTO `yu_menu_front` VALUES ('3', '問問專家', null, '0', '2');
INSERT INTO `yu_menu_front` VALUES ('4', '最新消息', null, '0', '3');
INSERT INTO `yu_menu_front` VALUES ('5', '會員專區', null, '0', '4');
INSERT INTO `yu_menu_front` VALUES ('6', '聯絡我們', null, '0', '5');
INSERT INTO `yu_menu_front` VALUES ('7', '生物资源与农业', null, '0', '0');
INSERT INTO `yu_menu_front` VALUES ('8', '展览馆', null, '0', '1');
INSERT INTO `yu_menu_front` VALUES ('9', '问问专家', null, '0', '2');
INSERT INTO `yu_menu_front` VALUES ('10', '最新消息', null, '0', '3');
INSERT INTO `yu_menu_front` VALUES ('11', '会员专区', null, '0', '4');
INSERT INTO `yu_menu_front` VALUES ('12', '联络我们', null, '0', '5');
INSERT INTO `yu_menu_front` VALUES ('13', 'Biological resources and agriculture', null, '0', '0');
INSERT INTO `yu_menu_front` VALUES ('14', 'Exhibition hall', null, '0', '1');
INSERT INTO `yu_menu_front` VALUES ('15', 'Ask an expert', null, '0', '2');
INSERT INTO `yu_menu_front` VALUES ('16', 'latest news', null, '0', '3');
INSERT INTO `yu_menu_front` VALUES ('17', 'Members Only', null, '0', '4');
INSERT INTO `yu_menu_front` VALUES ('18', 'contact us', null, '0', '5');

-- ----------------------------
-- Table structure for yu_news
-- ----------------------------
DROP TABLE IF EXISTS `yu_news`;
CREATE TABLE `yu_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isview` int(11) NOT NULL DEFAULT '0' COMMENT '1显示',
  `type_id` int(11) DEFAULT NULL COMMENT '类别id',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图',
  `header` varchar(255) DEFAULT NULL COMMENT 'header图',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序,越小越靠前',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息列表';

-- ----------------------------
-- Records of yu_news
-- ----------------------------
INSERT INTO `yu_news` VALUES ('1', '1', '1', 'uploads/2018/08-15/news-sample.jpg', 'uploads/2018/08-15/news-sample.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('2', '1', '1', 'uploads/2018/08-15/news-sample2.jpg', 'uploads/2018/08-15/news-sample2.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('3', '1', '1', 'uploads/2018/08-15/news-sample3.jpg', 'uploads/2018/08-15/news-sample3.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('4', '1', '1', 'uploads/2018/08-15/news-sample4.jpg', 'uploads/2018/08-15/news-sample4.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('5', '1', '1', 'uploads/2018/08-15/news-sample5.jpg', 'uploads/2018/08-15/news-sample5.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_news_content
-- ----------------------------
DROP TABLE IF EXISTS `yu_news_content`;
CREATE TABLE `yu_news_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL COMMENT '消息id',
  `language` varchar(100) DEFAULT NULL COMMENT '语言',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` text COMMENT '描述',
  `date` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `content` text COMMENT '内容',
  `banner` text CHARACTER SET utf8 NOT NULL COMMENT '底部滚动图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息内容表';

-- ----------------------------
-- Records of yu_news_content
-- ----------------------------
INSERT INTO `yu_news_content` VALUES ('1', '1', 'ENG', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('2', '2', 'ENG', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('3', '3', 'ENG', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('4', '4', 'ENG', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('5', '5', 'ENG', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');

-- ----------------------------
-- Table structure for yu_news_type
-- ----------------------------
DROP TABLE IF EXISTS `yu_news_type`;
CREATE TABLE `yu_news_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序,越小越靠前',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息类别';

-- ----------------------------
-- Records of yu_news_type
-- ----------------------------
INSERT INTO `yu_news_type` VALUES ('1', '0', '1', '2018-08-15 15:48:43', '1', '2018-08-15 15:48:51', '127.0.0.1');
INSERT INTO `yu_news_type` VALUES ('2', '0', '1', '2018-08-15 15:50:34', '1', '2018-08-15 15:50:31', '127.0.0.1');
INSERT INTO `yu_news_type` VALUES ('3', '0', '1', '2018-08-15 15:50:52', '1', '2018-08-15 15:50:34', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_news_typename
-- ----------------------------
DROP TABLE IF EXISTS `yu_news_typename`;
CREATE TABLE `yu_news_typename` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息类型名称';

-- ----------------------------
-- Records of yu_news_typename
-- ----------------------------
INSERT INTO `yu_news_typename` VALUES ('1', '1', 'workshop', '1');
INSERT INTO `yu_news_typename` VALUES ('2', '1', 'media', '2');
INSERT INTO `yu_news_typename` VALUES ('3', '1', 'press', '3');

-- ----------------------------
-- Table structure for yu_opinion
-- ----------------------------
DROP TABLE IF EXISTS `yu_opinion`;
CREATE TABLE `yu_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL COMMENT '姓名',
  `email` char(20) DEFAULT NULL COMMENT '电子邮箱',
  `tel` char(20) DEFAULT NULL COMMENT '电话',
  `content` text COMMENT '内容',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `ip` char(20) NOT NULL DEFAULT '' COMMENT '提交ip',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='意见表';

-- ----------------------------
-- Records of yu_opinion
-- ----------------------------
INSERT INTO `yu_opinion` VALUES ('1', '0', '3546', null, null, '1', '', '2018-08-15 15:26:55');
INSERT INTO `yu_opinion` VALUES ('2', '0', '3546', null, null, '1', '', '2018-08-15 15:31:57');
INSERT INTO `yu_opinion` VALUES ('3', '0', '3546@qq.com', null, null, '1', '', '2018-08-15 15:35:13');
INSERT INTO `yu_opinion` VALUES ('4', '0', '3546@qq.com', null, 'test', '1', '', '2018-08-15 15:38:24');

-- ----------------------------
-- Table structure for yu_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yu_user_coupon`;
CREATE TABLE `yu_user_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣券编号',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单的编号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户折扣使用记录表';

-- ----------------------------
-- Records of yu_user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for yu_web_config
-- ----------------------------
DROP TABLE IF EXISTS `yu_web_config`;
CREATE TABLE `yu_web_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言',
  `name` varchar(100) DEFAULT NULL COMMENT '网页名称',
  `seokey` varchar(255) DEFAULT NULL COMMENT 'SEO关键字',
  `logo` text COMMENT '网页logo',
  `backg` varchar(255) DEFAULT NULL COMMENT '网页背景图',
  `weblinks` text COMMENT '网页链接',
  `attention` text COMMENT '关注我们信息',
  `bottomdesc` text COMMENT '网页底部说明',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(100) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='网页配置(未使用)';

-- ----------------------------
-- Records of yu_web_config
-- ----------------------------

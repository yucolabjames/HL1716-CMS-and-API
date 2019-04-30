/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : yucolab

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-25 09:16:00
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
  `salt` char(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '秘钥 盐值',
  `full_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态 1已启用 0未启用',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` int(11) DEFAULT NULL COMMENT '修改者',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifytip` varchar(50) DEFAULT NULL COMMENT '修改ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of yu_administrator
-- ----------------------------
INSERT INTO `yu_administrator` VALUES ('1', 'admin', '314a83af865fe4dce89d24780f35f6a3', 'jaIJFOpsGBfZ', 'admin', '1', '1', '2018-08-07 10:44:36', '1', '2018-08-20 14:24:24', '127.0.0.1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='生物资源与农业信息';

-- ----------------------------
-- Records of yu_braa
-- ----------------------------
INSERT INTO `yu_braa` VALUES ('1', '1', '{\"Landslide\":\"13\",\"Earthquake\":\"13\",\"Extreme_Temperature\":\"13\",\"Volcanic_Activity\":\"13\",\"images\":\"uploads\\/2018\\/08-15\\/info.jpg\",\"temperature\":\"0.5\",\"storm\":\"2333\",\"drougt\":\"13\",\"wildfire\":\"13\",\"flood\":\"13\",\"year\":\"20\",\"tips\":[\"\\u904e\\u53bb\",\"\\u5e74\",\"\\u5168\\u7403\\u9304\\u5f97\\u8fd1<b>7,000<\\/b>\\u5b97\\u5929\\u707d\\uff0c\",\"\\u8d85\\u904e<b>9<\\/b>\\u6210\\u8207\\u6c23\\u5019\\u8b8a\\u5316\\u6709\\u95dc\"]}', '{\"summary\":\"\\u6ec5\\u7d55\\u662f\\u9032\\u5316\\u904e\\u7a0b\\u7684\\u4e00\\u500b\\u81ea\\u7136\\u90e8\\u5206\\uff0c\\u4f46\\u4eba\\u985e\\u904e\\u5ea6\\u4f7f\\u7528\\u751f\\u7269\\u8cc7\\u6e90\\uff0c\\n\\u751f\\u614b\\u8db3\\u8de1\\u73fe\\u6642\\u5df2\\u8d85\\u904e\\u4e86\\u5730\\u7403\\u53ef\\u518d\\u751f\\u80fd\\u529b\\u768460%\\uff0c\\u5c0e\\u81f4\\u73fe\\u6642\\u6bcf\\u5c0f\\u6642\\u5c31\\u67091\\u500b\\u7269\\u7a2e\\u6ec5\\u7d55\\uff0c\\u518d\\u904e100\\u5e74\\u5730\\u7403\\u5c07\\u55aa\\u593175%\\u7684\\u7269\\u7a2e\\uff01\\n123456\\n<stonge>Test<\\/stonge>\",\"year\":\"1970 \\u5e74 > 2012\\u5e74\",\"land\":\"40\",\"Freshwater_organisms\":\"80\",\"Marine_organism\":\"10\"}', '{\"percent\":\"171\",\"content1\":\"\\u9810\\u8a08\\u6d77\\u5e73\\u9762\\u4e0a\\u5347\\u5c07\\u6df9\\u6c92\\u5b5f\\u52a0\\u62c9\",\"content2\":\"\\u7684\\u571f\\u5730\\uff0c\\u6467\\u6bc0\\u80a5\\u6c83\\u8fb2\\u5730\",\"content3\":\"\"}', '{\"summary\":\"\\u8d85\\u904e9\\u6210\\u98df\\u7269\\u70ba\\u9032\\u53e3\\u98df\\u54c1\\uff0c\\u7ce7\\u98df\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc1\\u6210\\u3002\\r\\n\\u852c\\u83dc\\u672c\\u5730\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc2%\\u3002\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/meat.png\",\"intro\":\"\\u672c\\u6e2f<b>94%<\\/b>\\u7684\\u65b0\\u9bae\\u8c6c\\u8089\\u3001<b>100%<\\/b> \\u7684\\u65b0\\u9bae\\u725b\\u8089\"},\"content2\":{\"image\":\"uploads\\/2018\\t\\/08-15\\/vegetable.png\",\"intro\":\"<b>92%<\\/b>\\u7684\\u852c\\u83dc\\u53ca <b>66%<\\/b>\\u7684\\u96de\\u86cb\\uf92d\\u81ea\\u5167\\u5730\\u3002\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/fruit.png\",\"intro\":\"\\u81f3\\u65bc\\u65b0\\u9bae\\u6c34\\u679c\\uff0c\\u672c\\u6e2f\\u7684\\u4e3b\\u8981\\u9032\\u53e3\\uf92d\\u6e90\\u70ba\\u7f8e\\u570b\\u3001<b>\\u5167\\u5730<\\/b>\\u3001\\u83f2\\uf9d8\\u8cd3\\u53ca\\u6cf0\\u570b\\u3002\"}}', '{\"summary\":\"<b>2000<\\/b>\\u5e74\\u81f3\\u4eca\\u6709\\u6a5f\\u8fb2\\u696d\\u76db\\u884c\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/item1.png\",\"title\":\"\\u4f54\\u5730\\u9762\\u7a4d\",\"intro\":\"10\"},\"content2\":{\"image\":\"uploads\\/2018\\/08-15\\/item2.png\",\"title\":\"\\u6709\\u6a5f\\u8fb2\\u5834\",\"summary\":\"\\u53c3\\u8207\\u300c\\u6709\\u6a5f\\u8015\\u4f5c\\u652f\\u63f4\\u670d\\u52d9\\u300d\\u7684\\u83dc\\u5834\",\"intro\":\"300\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/item3.png\",\"title\":\"\\u6709\\u6a5f\\u8a8d\\u8b49\\u8fb2\\u5834\",\"intro\":\"150\"},\"title\":\"\\u5be6\\u8e10\\u6709\\u6a5f\\u8fb2\\u696d\\uff0c\\u8f49\\u5371\\u70ba\\u6a5f\\uff01\"}', '{\"title\":\"\\u6211\\u5011\\u7684\\u751f\\u6d3b\\u6a21\\u5f0f\\u74b0\\u5883\\u627f\\u53d7\\u5230\\u55ce \\uff1f\",\"child_title\":[\"\\u8863\",\"\\u98df\",\"\\u4f4f\",\"\\u884c\"],\"content1\":{\"summary\":\"\\u770b\\u4f3c\\u7a7a\\u865b\\u7684\\u8863\\u6ac3\",\"tips\":[\"\\u9999\\u6e2f\\u4eba\\u5747\\u64c1\\u6709:\",\"\\u8863\\u670d\\u4e4b\\u591a\",\"\\uff0c\\u7136\\u800c\\u6709\",\"\\u662f\\u5f88\\u5c11\\u6216\",\"\\u5f9e\\u672a\\u7a7f\\u904e\\u7684\\u3002\",\"\\u55ae\\u57282015\\u5e74\\uff0c \\u9999\\u6e2f\\u7d21\\u7e54\\u7269\\u68c4\\u7f6e\\u91cf\\u9ad8\\u9054<b>11<\\/b>\\u842c\\u5678\",\"\\u5373\\u6bcf<b>1<\\/b>\\u5206\\u9418 \\u5c31\\u6709\",\"T-\\u6064\\u88ab\\u907a\\u68c4\",\"\\u88ab\\u4e1f\\u68c4\\u7684\\u8863\\u7269\\u52a0\\u8d77\\u4f86\\u7684\",\"\\u9762\\u7a4d\\u66f4\\u8db3\\u5920\\u8986\\u84cb:\",\"<b>25000<\\/b>\\u500b\\u9999\\u6e2f\\u5927\\u7403\\u5834\"],\"num\":[\"94\",\"15\",\"1400\"]},\"content2\":{\"summary\":\"\\u88ab\\u5bf5\\u58de\\u7684\\u80c3\",\"images\":\"uploads\\/2018\\/08-15\\/screen3.png\"},\"content3\":{\"summary\":\"\\u63ee\\u970d\\u7121\\u5ea6\\u7684\\u8778\\u5c45\",\"tips\":[\"\\u6bcf\\u5e74\\uff0c\\u5168\\u6e2f\\u6254\\u6389\\u8d85\\u904e<b>7<\\/b>\\u842c\\u516c\\u5678\\u5ee2\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u7522\\u54c1\\u3002\",\"\\u90e8\\u5206\\u88ab\\u68c4\\u7f6e\\u7684\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u4ecd\\u53ef\\u6b63\\u5e38\\u904b\\u4f5c\\u6216\\u4f5c\\u4e8c\\u624b\\u7528\\u9014\\uff0c  \\u537b\\u88ab\\u9001\\u5230\\u5806\\u586b\\u5340\\u767d\\u767d\\u6d6a\\u8cbb\\uff1f\"],\"images\":\"uploads\\/2018\\/08-15\\/screen4.png\"},\"content4\":{\"summary\":\"\\u6c23\\u5019\\u6696\\u5316\\u7684\\u6838\\u5fc3\\u5916\\u570d\",\"tips\":[\"\\u904b\\u8f38\\u6d88\\u8017\\u5927\\u91cf\\u80fd\\u6e90\\uff0c\\u57282015\\u5e74\\uff0c\\u5c31\\u4f54\\u4e86\\u5168\\u6e2f\\u4e09\\u5206\\u4e4b\\u4e00\\u7684\\u7e3d\\u80fd\\u6e90\\u6d88\\u8017\\uff1b\",\"2015\\u5e74\\u904b\\u8f38\\u6240\\u6392\\u653e\\u7684\\u6eab\\u5ba4\\u6c23\\u9ad4\\u91cf\\u9ad8\\u9054<b>747<\\/b>\\u842c\\u516c\\u5678\\u4e8c\\u6c27\\u5316\\u78b3\\u7576\\u91cf\",\"\\u5373<b>1255<\\/b>\\u500b\\u6a19\\u6e96\\u6e38\\u6cf3\\u6c60\\u7684\\u5bb9\\u91cf \\uff0c\\u4f54\\u7e3d\\u6392\\u653e\\u91cf\\u7684<b>18<\\/b>%\"],\"images\":\"uploads\\/2018\\/08-15\\/screen5.png\"},\"backgrounds\":[\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\"]}', '1', '2018-09-20 17:33:35', '125.84.90.184');
INSERT INTO `yu_braa` VALUES ('2', '2', '{\"Landslide\":\"151\",\"Earthquake\":\"151\",\"Extreme_Temperature\":\"151\",\"Volcanic_Activity\":\"151\",\"images\":\"uploads\\/2018\\/08-15\\/info.jpg\",\"temperature\":\"0.94\",\"storm\":\"151\",\"drougt\":\"151\",\"wildfire\":\"151\",\"flood\":\"151\",\"year\":\"20\",\"tips\":[\"\\u8fc7\\u53bb\",\"\\u5e74\",\"\\u5168\\u7403\\u5f55\\u5f97\\u8fd1<b>7,000<\\/b>\\u5b97\\u5929\\u707e\\uff0c\",\"\\u8d85\\u8fc7<b>9<\\/b>\\u6210\\u4e0e\\u6c14\\u5019\\u53d8\\u5316\\u6709\\u5173\"]}', '{\"summary\":\"\\u706d\\u7edd\\u662f\\u8fdb\\u5316\\u8fc7\\u7a0b\\u7684\\u4e00\\u4e2a\\u81ea\\u7136\\u90e8\\u5206\\uff0c\\u4f46\\u4eba\\u7c7b\\u8fc7\\u5ea6\\u4f7f\\u7528\\u751f\\u7269\\u8d44\\u6e90\\uff0c\\\\r\\\\n\\u751f\\u6001\\u8db3\\u8ff9\\u73b0\\u65f6\\u5df2\\u8d85\\u8fc7\\u4e86\\u5730\\u7403\\u53ef\\u518d\\u751f\\u80fd\\u529b\\u768460%\\uff0c\\u5bfc\\u81f4\\u73b0\\u65f6\\u6bcf\\u5c0f\\u65f6\\u5c31\\u67091\\u4e2a\\u7269\\u79cd\\u706d\\u7edd\\uff0c\\u518d\\u8fc7100\\u5e74\\u5730\\u7403\\u5c06\\u4e27\\u593175%\\u7684\\u7269\\u79cd\",\"year\":\"1970 \\u5e74 > 2012\\u5e74\",\"land\":\"38\",\"Freshwater_organisms\":\"81\",\"Marine_organism\":\"6\"}', '{\"percent\":\"17\",\"content1\":\"\\u9884\\u8ba1\\u6d77\\u5e73\\u9762\\u4e0a\\u5347\\u5c06\\u6df9\\u6ca1\\u5b5f\\u52a0\\u62c9\\u56fd\",\"content2\":\"\\u7684\\u571f\\u5730\",\"content3\":\"\\u6467\\u6bc1\\u80a5\\u6c83\\u519c\\u5730\"}', '{\"summary\":\"\\u8d85\\u8fc79\\u6210\\u98df\\u7269\\u4e3a\\u8fdb\\u53e3\\u98df\\u54c1\\uff0c\\u7cae\\u98df\\u81ea\\u7ed9\\u7387\\u4f4e\\u4e8e1\\u6210\\u3002\\\\r\\\\n\\u852c\\u83dc\\u672c\\u5730\\u81ea\\u7ed9\\u7387\\u4f4e\\u4e8e2%\\u3002\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/meat.png\",\"intro\":\"\\u672c\\u6e2f<b>94%<\\/b>\\u7684\\u65b0\\u9c9c\\u732a\\u8089\\u3001<b>100%<\\/b>\\u7684\\u65b0\\u9c9c\\u725b\\u80891\"},\"content2\":{\"image\":\"uploads\\/2018\\t\\/08-15\\/vegetable.png\",\"intro\":\"<b>92%<\\/b>\\u7684\\u852c\\u83dc\\u53ca<b>66%<\\/b>\\u7684\\u9e21\\u86cb\\uf92d\\u81ea\\u5185\\u5730\\u3002\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/fruit.png\",\"intro\":\"\\u81f3\\u4e8e\\u65b0\\u9c9c\\u6c34\\u679c\\uff0c\\u672c\\u6e2f\\u7684\\u4e3b\\u8981\\u8fdb\\u53e3\\uf92d\\u6e90\\u4e3a\\u7f8e\\u56fd\\\\r\\\\n\\u3001\\u5185\\u5730\\u3001\\u83f2\\uf9d8\\u5bbe\\u53ca\\u6cf0\\u56fd\\u3002\"}}', '{\"summary\":\"<b>2000<\\/b>\\u5e74\\u81f3\\u4eca\\u6709\\u673a\\u519c\\u4e1a\\u76db\\u884c\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/item1.png\",\"title\":\"\\u5360\\u5730\\u9762\\u79ef\",\"intro\":\"9.5\"},\"content2\":{\"image\":\"uploads\\/2018\\/08-15\\/item2.png\",\"title\":\"\\u6709\\u673a\\u519c\\u573a\",\"summary\":\"\\u53c2\\u4e0e\\u300c\\u6709\\u673a\\u8015\\u4f5c\\u652f\\u6301\\u670d\\u52a1\\u300d\\u7684\\u83dc\\u573a\",\"intro\":\"299\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/item3.png\",\"title\":\"\\u6709\\u673a\\u8ba4\\u8bc1\\u519c\\u573a\",\"intro\":\"153\"},\"title\":\"\\u5b9e\\u8df5\\u6709\\u673a\\u519c\\u4e1a\\uff0c\\u8f6c\\u5371\\u4e3a\\u673a\\uff01\"}', '{\"title\":\"\\u6211\\u5011\\u7684\\u751f\\u6d3b\\u6a21\\u5f0f\\u74b0\\u5883\\u627f\\u53d7\\u5230\\u55ce \\uff1f\",\"child_title\":[\"\\u8863\",\"\\u98df\",\"\\u4f4f\",\"\\u884c\"],\"content1\":{\"summary\":\"\\u770b\\u4f3c\\u7a7a\\u865b\\u7684\\u8863\\u6ac3\",\"tips\":[\"\\u9999\\u6e2f\\u4eba\\u5747\\u64c1\\u6709:\",\"\\u8863\\u670d\\u4e4b\\u591a\",\"\\uff0c\\u7136\\u800c\\u6709\",\"\\u662f\\u5f88\\u5c11\\u6216\",\"\\u5f9e\\u672a\\u7a7f\\u904e\\u7684\\u3002\",\"\\u55ae\\u57282015\\u5e74\\uff0c \\u9999\\u6e2f\\u7d21\\u7e54\\u7269\\u68c4\\u7f6e\\u91cf\\u9ad8\\u9054<b>11<\\/b>\\u842c\\u5678\",\"\\u5373\\u6bcf<b>1<\\/b>\\u5206\\u9418 \\u5c31\\u6709\",\"T-\\u6064\\u88ab\\u907a\\u68c4\",\"\\u88ab\\u4e1f\\u68c4\\u7684\\u8863\\u7269\\u52a0\\u8d77\\u4f86\\u7684\",\"\\u9762\\u7a4d\\u66f4\\u8db3\\u5920\\u8986\\u84cb:\",\"<b>25000<\\/b>\\u500b\\u9999\\u6e2f\\u5927\\u7403\\u5834\"],\"num\":[\"94\",\"15\",\"1400\"]},\"content2\":{\"summary\":\"\\u88ab\\u5bf5\\u58de\\u7684\\u80c3\",\"images\":\"uploads\\/2018\\/08-15\\/screen3.png\"},\"content3\":{\"summary\":\"\\u63ee\\u970d\\u7121\\u5ea6\\u7684\\u8778\\u5c45\",\"tips\":[\"\\u6bcf\\u5e74\\uff0c\\u5168\\u6e2f\\u6254\\u6389\\u8d85\\u904e<b>7<\\/b>\\u842c\\u516c\\u5678\\u5ee2\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u7522\\u54c1\\u3002\",\"\\u90e8\\u5206\\u88ab\\u68c4\\u7f6e\\u7684\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u4ecd\\u53ef\\u6b63\\u5e38\\u904b\\u4f5c\\u6216\\u4f5c\\u4e8c\\u624b\\u7528\\u9014\\uff0c  \\u537b\\u88ab\\u9001\\u5230\\u5806\\u586b\\u5340\\u767d\\u767d\\u6d6a\\u8cbb\\uff1f\"],\"images\":\"uploads\\/2018\\/08-15\\/screen4.png\"},\"content4\":{\"summary\":\"\\u6c23\\u5019\\u6696\\u5316\\u7684\\u6838\\u5fc3\\u5916\\u570d\",\"tips\":[\"\\u904b\\u8f38\\u6d88\\u8017\\u5927\\u91cf\\u80fd\\u6e90\\uff0c\\u57282015\\u5e74\\uff0c\\u5c31\\u4f54\\u4e86\\u5168\\u6e2f\\u4e09\\u5206\\u4e4b\\u4e00\\u7684\\u7e3d\\u80fd\\u6e90\\u6d88\\u8017\\uff1b\",\"2015\\u5e74\\u904b\\u8f38\\u6240\\u6392\\u653e\\u7684\\u6eab\\u5ba4\\u6c23\\u9ad4\\u91cf\\u9ad8\\u9054<b>747<\\/b>\\u842c\\u516c\\u5678\\u4e8c\\u6c27\\u5316\\u78b3\\u7576\\u91cf\",\"\\u5373<b>1255<\\/b>\\u500b\\u6a19\\u6e96\\u6e38\\u6cf3\\u6c60\\u7684\\u5bb9\\u91cf \\uff0c\\u4f54\\u7e3d\\u6392\\u653e\\u91cf\\u7684<b>18<\\/b>%\"],\"images\":\"uploads\\/2018\\/08-15\\/screen5.png\"},\"backgrounds\":[\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\"]}', '1', '2018-09-20 14:28:13', '125.84.90.184');
INSERT INTO `yu_braa` VALUES ('3', '3', '{\"Landslide\":\"13\",\"Earthquake\":\"13\",\"Extreme_Temperature\":\"13\",\"Volcanic_Activity\":\"13\",\"images\":\"uploads\\/2018\\/08-15\\/info.jpg\",\"temperature\":\"0.94\",\"storm\":\"13\",\"drougt\":\"13\",\"wildfire\":\"13\",\"flood\":\"13\",\"year\":\"20\",\"tips\":[\"\\u904e\\u53bb\",\"\\u5e74\",\"\\u5168\\u7403\\u9304\\u5f97\\u8fd1<b>7,000<\\/b>\\u5b97\\u5929\\u707d\\uff0c\",\"\\u8d85\\u904e<b>9<\\/b>\\u6210\\u8207\\u6c23\\u5019\\u8b8a\\u5316\\u6709\\u95dc\"]}', '{\"summary\":\"\\u6ec5\\u7d55\\u662f\\u9032\\u5316\\u904e\\u7a0b\\u7684\\u4e00\\u500b\\u81ea\\u7136\\u90e8\\u5206\\uff0c\\u4f46\\u4eba\\u985e\\u904e\\u5ea6\\u4f7f\\u7528\\u751f\\u7269\\u8cc7\\u6e90\\uff0c\\r\\n\\u751f\\u614b\\u8db3\\u8de1\\u73fe\\u6642\\u5df2\\u8d85\\u904e\\u4e86\\u5730\\u7403\\u53ef\\u518d\\u751f\\u80fd\\u529b\\u768460%\\uff0c\\u5c0e\\u81f4\\u73fe\\u6642\\u6bcf\\u5c0f\\u6642\\u5c31\\u67091\\u500b\\u7269\\u7a2e\\u6ec5\\u7d55\\uff0c\\u518d\\u904e100\\u5e74\\u5730\\u7403\\u5c07\\u55aa\\u593175%\\u7684\\u7269\\u7a2e\\uff01\",\"year\":\"1970 \\u5e74 > 2012\\u5e74\",\"land\":\"38\",\"Freshwater_organisms\":\"81\",\"Marine_organism\":\"6\"}', '{\"percent\":\"17\",\"content1\":\"\\u9810\\u8a08\\u6d77\\u5e73\\u9762\\u4e0a\\u5347\\u5c07\\u6df9\\u6c92\\u5b5f\\u52a0\\u62c9\",\"content2\":\"\\u7684\\u571f\\u5730\\uff0c\",\"content3\":\"\\u6467\\u6bc0\\u80a5\\u6c83\\u8fb2\\u5730\"}', '{\"summary\":\"\\u8d85\\u904e9\\u6210\\u98df\\u7269\\u70ba\\u9032\\u53e3\\u98df\\u54c1\\uff0c\\u7ce7\\u98df\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc1\\u6210\\u3002\\r\\n\\u852c\\u83dc\\u672c\\u5730\\u81ea\\u7d66\\u7387\\u4f4e\\u65bc2%\\u3002\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/meat.png\",\"intro\":\"\\u672c\\u6e2f<b>94%<\\/b>\\u7684\\u65b0\\u9bae\\u8c6c\\u8089\\u3001<b>100%<\\/b> \\u7684\\u65b0\\u9bae\\u725b\\u8089\"},\"content2\":{\"image\":\"uploads\\/2018\\t\\/08-15\\/vegetable.png\",\"intro\":\"<b>92%<\\/b>\\u7684\\u852c\\u83dc\\u53ca <b>66%<\\/b>\\u7684\\u96de\\u86cb\\uf92d\\u81ea\\u5167\\u5730\\u3002\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/fruit.png\",\"intro\":\"\\u81f3\\u65bc\\u65b0\\u9bae\\u6c34\\u679c\\uff0c\\u672c\\u6e2f\\u7684\\u4e3b\\u8981\\u9032\\u53e3\\uf92d\\u6e90\\u70ba\\u7f8e\\u570b\\r\\n\\u3001\\u5167\\u5730\\u3001\\u83f2\\uf9d8\\u8cd3\\u53ca\\u6cf0\\u570b\\u3002\"}}', '{\"summary\":\"<b>2000<\\/b>\\u5e74\\u81f3\\u4eca\\u6709\\u6a5f\\u8fb2\\u696d\\u76db\\u884c\",\"content1\":{\"image\":\"uploads\\/2018\\/08-15\\/item1.png\",\"title\":\"\\u4f54\\u5730\\u9762\\u7a4d\",\"intro\":\"9.5\"},\"content2\":{\"image\":\"uploads\\/2018\\/08-15\\/item2.png\",\"title\":\"\\u6709\\u6a5f\\u8fb2\\u5834\",\"summary\":\"\\u53c3\\u8207\\u300c\\u6709\\u6a5f\\u8015\\u4f5c\\u652f\\u63f4\\u670d\\u52d9\\u300d\\u7684\\u83dc\\u5834\",\"intro\":\"299\"},\"content3\":{\"image\":\"uploads\\/2018\\/08-15\\/item3.png\",\"title\":\"\\u6709\\u6a5f\\u8a8d\\u8b49\\u8fb2\\u5834\",\"intro\":\"153\"},\"title\":\"\\u5be6\\u8e10\\u6709\\u6a5f\\u8fb2\\u696d\\uff0c\\u8f49\\u5371\\u70ba\\u6a5f\\uff01\"}', '{\"title\":\"\\u6211\\u5011\\u7684\\u751f\\u6d3b\\u6a21\\u5f0f\\u74b0\\u5883\\u627f\\u53d7\\u5230\\u55ce \\uff1f\",\"child_title\":[\"\\u8863\",\"\\u98df\",\"\\u4f4f\",\"\\u884c\"],\"content1\":{\"summary\":\"\\u770b\\u4f3c\\u7a7a\\u865b\\u7684\\u8863\\u6ac3\",\"tips\":[\"\\u9999\\u6e2f\\u4eba\\u5747\\u64c1\\u6709:\",\"\\u8863\\u670d\\u4e4b\\u591a\",\"\\uff0c\\u7136\\u800c\\u6709\",\"\\u662f\\u5f88\\u5c11\\u6216\",\"\\u5f9e\\u672a\\u7a7f\\u904e\\u7684\\u3002\",\"\\u55ae\\u57282015\\u5e74\\uff0c \\u9999\\u6e2f\\u7d21\\u7e54\\u7269\\u68c4\\u7f6e\\u91cf\\u9ad8\\u9054<b>11<\\/b>\\u842c\\u5678\",\"\\u5373\\u6bcf<b>1<\\/b>\\u5206\\u9418 \\u5c31\\u6709\",\"T-\\u6064\\u88ab\\u907a\\u68c4\",\"\\u88ab\\u4e1f\\u68c4\\u7684\\u8863\\u7269\\u52a0\\u8d77\\u4f86\\u7684\",\"\\u9762\\u7a4d\\u66f4\\u8db3\\u5920\\u8986\\u84cb:\",\"<b>25000<\\/b>\\u500b\\u9999\\u6e2f\\u5927\\u7403\\u5834\"],\"num\":[\"94\",\"15\",\"1400\"]},\"content2\":{\"summary\":\"\\u88ab\\u5bf5\\u58de\\u7684\\u80c3\",\"images\":\"uploads\\/2018\\/08-15\\/screen3.png\"},\"content3\":{\"summary\":\"\\u63ee\\u970d\\u7121\\u5ea6\\u7684\\u8778\\u5c45\",\"tips\":[\"\\u6bcf\\u5e74\\uff0c\\u5168\\u6e2f\\u6254\\u6389\\u8d85\\u904e<b>7<\\/b>\\u842c\\u516c\\u5678\\u5ee2\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u7522\\u54c1\\u3002\",\"\\u90e8\\u5206\\u88ab\\u68c4\\u7f6e\\u7684\\u96fb\\u8166\\u53ca\\u96fb\\u5668\\u4ecd\\u53ef\\u6b63\\u5e38\\u904b\\u4f5c\\u6216\\u4f5c\\u4e8c\\u624b\\u7528\\u9014\\uff0c  \\u537b\\u88ab\\u9001\\u5230\\u5806\\u586b\\u5340\\u767d\\u767d\\u6d6a\\u8cbb\\uff1f\"],\"images\":\"uploads\\/2018\\/08-15\\/screen4.png\"},\"content4\":{\"summary\":\"\\u6c23\\u5019\\u6696\\u5316\\u7684\\u6838\\u5fc3\\u5916\\u570d\",\"tips\":[\"\\u904b\\u8f38\\u6d88\\u8017\\u5927\\u91cf\\u80fd\\u6e90\\uff0c\\u57282015\\u5e74\\uff0c\\u5c31\\u4f54\\u4e86\\u5168\\u6e2f\\u4e09\\u5206\\u4e4b\\u4e00\\u7684\\u7e3d\\u80fd\\u6e90\\u6d88\\u8017\\uff1b\",\"2015\\u5e74\\u904b\\u8f38\\u6240\\u6392\\u653e\\u7684\\u6eab\\u5ba4\\u6c23\\u9ad4\\u91cf\\u9ad8\\u9054<b>747<\\/b>\\u842c\\u516c\\u5678\\u4e8c\\u6c27\\u5316\\u78b3\\u7576\\u91cf\",\"\\u5373<b>1255<\\/b>\\u500b\\u6a19\\u6e96\\u6e38\\u6cf3\\u6c60\\u7684\\u5bb9\\u91cf \\uff0c\\u4f54\\u7e3d\\u6392\\u653e\\u91cf\\u7684<b>18<\\/b>%\"],\"images\":\"uploads\\/2018\\/08-15\\/screen5.png\"},\"backgrounds\":[\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\",\"uploads\\/2018\\/08-15\\/aboutbg2.jpg\"]}', '1', '2018-09-20 17:34:02', '125.84.90.184');

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
INSERT INTO `yu_contact_config` VALUES ('1', 'uploads/2018/0911/06eace6c36b1fca0f6bcb9fa00c249ef.jpg', '聯絡我們', '化主詩物趣足沒車心臺我大苦理體實', '', '3123@qq.com', '(852) 3411238412', '22.336098,114.182748', '1', '2018-09-13 16:33:45', '192.168.0.116');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='联络我们内容表';

-- ----------------------------
-- Records of yu_contact_content
-- ----------------------------
INSERT INTO `yu_contact_content` VALUES ('1', '1', '(852) 3411238412', 'Room 505, 5 Lv Mingcai house, Hong Kong Baptist University, Kowloon Tong, Hong Kong Baptist University, Kowloon Tong.', 'Monday to five a.m. to nine p.m.\n\nFrom two p.m. to five thirty p.m.\n\nRest on Saturday, Sunday and public holidays', '1', 'Contact us', 'zhe shi yingwen ');
INSERT INTO `yu_contact_content` VALUES ('2', '1', '(852) 3411238412', '香港九龙塘香港浸会大学善衡校园吕明才中心5楼505室', '星期一至五上午九时至下午一时; 下午二時时下午五时半', '2', '联络我们', '联络我们联络我们');
INSERT INTO `yu_contact_content` VALUES ('3', '1', '(852) 3411238412', '香港九龍塘香港浸會大學善衡校園呂明才中心5樓505室', '星期一至五上午九時至下午一時; 下午二時至下午五時半 周六、周日及公眾假期休息', '3', '聯絡我們', '化主詩物趣足沒車心臺我大苦理體實');

-- ----------------------------
-- Table structure for yu_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yu_coupon`;
CREATE TABLE `yu_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `code` char(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '折扣代码',
  `discount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣金额',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启用状态 0否 1是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0未使用 1已使用 2已过期',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣表';

-- ----------------------------
-- Records of yu_coupon
-- ----------------------------
INSERT INTO `yu_coupon` VALUES ('1', 'James September Test', 'jamestest', '350', '1536508800', '1537804800', '1', '0', '2018', '1536715836');
INSERT INTO `yu_coupon` VALUES ('2', '去掉', 'ABCD2346', '123', '1537517015', '1538064000', '1', '0', '1970', '1537517310');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='展览馆信息';

-- ----------------------------
-- Records of yu_ehall
-- ----------------------------
INSERT INTO `yu_ehall` VALUES ('1', '1', '{\"title\":\"Sustainable resources\",\"summary\":\"<b> 2100 <\\/b> year because of the bad environment of the earth, human beings were forced to leave the earth and live on the Mothership Noah floating in space. But Noah\'s resources will be exhausted in <b> 100 <\\/b> years. Mankind must return to the earth before time runs out and look for opportunities to survive. The first astronauts landed on Antarctica in 2200 <\\/b> years and established the first village of the new era of the earth. After that, mankind completed the <b> 107 <\\/b> Earth Return Mission. <br\\/> Today - i.e. <b> 2300 <\\/b> year <b> 11 <\\/b> month <b> 11 <\\/b> day, is about to be an important moment for you and the other <b> 30 <\\/b> astronauts to begin green sustainable life training, and to undergo final assessment before they can pass the test and embark on a space trip back to Earth...\"}', '99', '100', '{\"image\":\"uploads\\/2018\\/08-15\\/hall_bg1.jpg\",\"title\":\"Shuttle time and space\",\"summary\":\"Astronauts will embark on superluminal spacecraft, cross the space-time tunnel and return to the 21st century. With a 180_panoramic screen and four-dimensional stunts, you will experience the end of the 21st century when the overloaded earth suffers human destruction.\"}', '{\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\",\"title\":\"Exploration of resources1\",\"summary\":\"The astronauts returned to the space station and began training for sustainable life. Astronauts who have never set foot on Earth will experience AR augmented reality technology in this area to understand the Earths species and biological resources, and to understand the major threats to the ecological environment and species caused by human activities.\"}', '{\"title\":\"Organic farming task station\",\"summary\":\"Astronauts shuttle freely through the vibrant organic farmland, listen to farmers share organic farming stories, complete farming tasks through extraordinary multimedia technology, and understand the mysterious laws of respect for nature.\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg3.jpg\"}', '{\"image\":\"uploads\\/2018\\/08-15\\/hall_bg4.jpg\",\"title\":\"Sustainable life3\",\"summary\":\"Walk into high-end shopping malls, receive challenging sustainable consumption training, understand modern consumption patterns, re-examine daily habits through the VR experience, understand the ecological costs behind, learn to be a smart and environmentally friendly consumer.\"}', '{\"title\":\"Workshops\",\"summary\":\"Through small experiments, hand-made and planting workshops, the astronauts will be able to put their hands on Sustainable lifestyles.\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg5.jpg\"}', '1', '2018-09-13 15:58:40', '192.168.0.116');
INSERT INTO `yu_ehall` VALUES ('2', '2', '{\"title\":\"\\u53ef\\u6301\\u7eed\\u8d44\\u6e90\\u9986\",\"summary\":\"\\u003c\\u0062\\u003e\\u0032\\u0031\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u5e74\\u56e0\\u5730\\u7403\\u73af\\u5883\\u6076\\u52a3\\uff0c\\u4eba\\u7c7b\\u903c\\u4e8e\\u65e0\\u5948\\u79bb\\u5f00\\u4e86\\u5730\\u7403\\uff0c\\u4e8e\\u4e00\\u4e2a\\u6f02\\u6d6e\\u4e8e\\u592a\\u7a7a\\u7684\\u6bcd\\u8230\\u300c\\u8bfa\\u4e9a\\u53f7\\u300d\\u4e0a\\u751f\\u6d3b\\u3002\\u4f46\\u300c\\u8bfa\\u4e9a\\u53f7\\u300d\\u7684\\u8d44\\u6e90\\u5c06\\u5728\\u003c\\u0062\\u003e\\u0031\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u5e74\\u95f4\\u8017\\u5c3d\\uff0c\\u4eba\\u7c7b\\u5fc5\\u987b\\u8981\\u5728\\u65f6\\u95f4\\u8017\\u5c3d\\u524d\\u56de\\u5f52\\u5730\\u7403\\uff0c\\u5bfb\\u627e\\u7ee7\\u7eed\\u5b58\\u6d3b\\u7684\\u673a\\u4f1a\\u3002\\u003c\\u0062\\u003e\\u0032\\u0032\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u5e74\\uff0c\\u003c\\u0062\\u003e\\u0033\\u0030\\u003c\\u002f\\u0062\\u003e\\u4f4d\\u7b2c\\u4e00\\u6279\\u592a\\u7a7a\\u4eba\\u6210\\u529f\\u4e8e\\u5357\\u6781\\u6d32\\u7740\\u9646\\uff0c\\u5efa\\u7acb\\u8d77\\u5730\\u7403\\u65b0\\u7eaa\\u5143\\u7684\\u7b2c\\u4e00\\u4e2a\\u6751\\u843d\\uff0c\\u4e4b\\u540e\\u4eba\\u7c7b\\u5b8c\\u6210\\u4e86\\u003c\\u0062\\u003e\\u0031\\u0030\\u0037\\u003c\\u002f\\u0062\\u003e\\u6b21\\u300c\\u5730\\u7403\\u56de\\u5f52\\u4efb\\u52a1\\u300d\\u3002\\u003c\\u0062\\u0072\\u002f\\u003e\\u4eca\\u5929\\u002d\\u5373\\u003c\\u0062\\u003e\\u0032\\u0033\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u5e74\\u003c\\u0062\\u003e\\u0031\\u0031\\u003c\\u002f\\u0062\\u003e\\u6708\\u003c\\u0062\\u003e\\u0031\\u0031\\u003c\\u002f\\u0062\\u003e\\u65e5\\uff0c\\u5373\\u5c06\\u662f\\u4f60\\u548c\\u5176\\u4ed6\\u003c\\u0062\\u003e\\u0033\\u0030\\u003c\\u002f\\u0062\\u003e\\u4f4d\\u592a\\u7a7a\\u4eba\\u968f\\u5373\\u5c55\\u5f00\\u7eff\\u8272\\u7684\\u53ef\\u6301\\u7eed\\u751f\\u6d3b\\u8bad\\u7ec3\\uff0c\\u5e76\\u63a5\\u53d7\\u6700\\u7ec8\\u8003\\u6838\\u7684\\u91cd\\u8981\\u65f6\\u523b\\uff0c\\u901a\\u8fc7\\u6d4b\\u8bd5\\u624d\\u80fd\\u767b\\u4e0a\\u56de\\u5f52\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4e4b\\u65c5\\u2026\\u2026\"}', '100', '100', '{\"title\":\"\\u7a7f\\u68ad\\u65f6\\u7a7a\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5c06\\u767b\\u4e0a\\u8d85\\u5149\\u901f\\u98de\\u8239\\uff0c\\u7a7f\\u8d8a\\u65f6\\u7a7a\\u96a7\\u9053\\u91cd\\u8fd4\\u0032\\u0031\\u4e16\\u7eaa\\uff0c\\u4ee5\\u0031\\u0038\\u0030\\u309a\\u5168\\u666f\\u8367\\u5e55\\u914d\\u5408\\u56db\\u65b9\\u516b\\u9762\\u7684\\u0034\\u0044\\u7279\\u6280\\u4e0a\\u6f14\\u6781\\u5177\\u89c6\\u542c\\u9707\\u64bc\\u7684\\u300c\\u0032\\u0031\\u0030\\u0030\\u672b\\u65e5\\u4e4b\\u5883\\u300d\\uff0c\\u8ba9\\u60a8\\u4eb2\\u5386\\u0032\\u0031\\u4e16\\u7eaa\\u672b\\uff0c\\u4f53\\u9a8c\\u8fc7\\u8f7d\\u7684\\u5730\\u7403\\u60e8\\u906d\\u4eba\\u7c7b\\u7834\\u574f\\u7684\\u672b\\u65e5\\u4e4b\\u5883\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg1.jpg\"}', '{\"title\":\"\\u63a2\\u7d22\\u8d44\\u6e90\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u91cd\\u8fd4\\u7a7a\\u95f4\\u7ad9\\uff0c\\u6b63\\u5f0f\\u5f00\\u59cb\\u53ef\\u6301\\u7eed\\u751f\\u6d3b\\u8bad\\u7ec3\\u3002\\u4ece\\u672a\\u8e0f\\u8db3\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4eba\\u5c06\\u5728\\u6b64\\u533a\\u4ee5\\u4f53\\u9a8c\\u0041\\u0052\\u6269\\u589e\\u5b9e\\u5883\\u6280\\u672f\\u8ba4\\u8bc6\\u5730\\u7403\\u7269\\u79cd\\u53ca\\u751f\\u7269\\u8d44\\u6e90\\uff0c\\u4e86\\u89e3\\u4eba\\u7c7b\\u6d3b\\u52a8\\u5bf9\\u751f\\u6001\\u73af\\u5883\\u548c\\u7269\\u79cd\\u9020\\u6210\\u7684\\u91cd\\u5927\\u5a01\\u80c1\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '{\"title\":\"\\u300c\\u6709\\u673a\\u519c\\u8015\\u4efb\\u52a1\\u7ad9\\u300d\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5728\\u5145\\u6ee1\\u751f\\u673a\\u7684\\u6709\\u673a\\u519c\\u7530\\u81ea\\u7531\\u7a7f\\u68ad\\uff0c\\u7ec6\\u542c\\u519c\\u592b\\u5206\\u4eab\\u6709\\u673a\\u519c\\u8015\\u5c0f\\u6545\\u4e8b\\uff0c\\u900f\\u8fc7\\u975e\\u51e1\\u7684\\u591a\\u5a92\\u4f53\\u6280\\u672f\\u5b8c\\u6210\\u519c\\u8015\\u4efb\\u52a1\\uff0c\\u8ba4\\u8bc6\\u5c0a\\u91cd\\u5927\\u81ea\\u7136\\u7684\\u795e\\u79d8\\u6cd5\\u5219\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg3.jpg\"}', '{\"title\":\"\\u53ef\\u6301\\u7eed\\u751f\\u6d3b\",\"summary\":\"\\u8d70\\u8fdb\\u9ad8\\u7aef\\u7684\\u8d2d\\u7269\\u4e2d\\u5fc3\\uff0c\\u63a5\\u53d7\\u5145\\u6ee1\\u6311\\u6218\\u7684\\u53ef\\u6301\\u7eed\\u6d88\\u8d39\\u8bad\\u7ec3\\uff0c\\u8ba4\\u8bc6\\u73b0\\u4ee3\\u6d88\\u8d39\\u6a21\\u5f0f\\uff0c\\u900f\\u8fc7\\u0056\\u0052\\u4f53\\u9a8c\\u91cd\\u65b0\\u5ba1\\u89c6\\u65e5\\u5e38\\u751f\\u6d3b\\u4e60\\u60ef\\uff0c\\u4e86\\u89e3\\u80cc\\u540e\\u7684\\u751f\\u6001\\u4ee3\\u4ef7\\uff0c\\u5b66\\u4f1a\\u505a\\u4e2a\\u7cbe\\u660e\\u73af\\u4fdd\\u7684\\u6d88\\u8d39\\u8005\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg4.jpg\"}', '{\"title\":\"\\u5de5\\u4f5c\\u574a\",\"summary\":\"\\u900f\\u8fc7\\u5c0f\\u5b9e\\u9a8c\\u3001\\u624b\\u4f5c\\u548c\\u79cd\\u690d\\u5de5\\u4f5c\\u574a\\u7b49\\uff0c\\u8ba9\\u592a\\u7a7a\\u4eba\\u4e00\\u5c55\\u8eab\\u624b\\u4eb2\\u8eab\\u5b9e\\u8df5\\u53ef\\u6301\\u7eed\\u751f\\u6d3b\\u6a21\\u5f0f\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg5.jpg\"}', '1', '2018-08-16 10:33:57', '127.0.0.1');
INSERT INTO `yu_ehall` VALUES ('3', '3', '{\"title\":\"\\u53ef\\u6301\\u7e8c\\u8cc7\\u6e90\\u8218\",\"summary\":\"\\u003c\\u0062\\u003e\\u0032\\u0031\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u5e74\\u56e0\\u5730\\u7403\\u74b0\\u5883\\u60e1\\u52a3\\u002c\\u4eba\\u985e\\u903c\\u4e8e\\u7121\\u5948\\u96e2\\u958b\\u4e86\\u5730\\u7403\\u002c\\u65bc\\u4e00\\u500b\\u6f02\\u6d6e\\u65bc\\u592a\\u7a7a\\u7684\\u6bcd\\u8266\\u300c\\u8afe\\u4e9e\\u865f\\u300d\\u4e0a\\u0020\\u751f\\u6d3b\\u3002\\u4f46\\u300c\\u8afe\\u4e9e\\u865f\\u300d\\u7684\\u8cc7\\u6e90\\u5c07\\u5728\\u0020\\u003c\\u0062\\u003e\\u0031\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u5e74\\u9593\\u8017\\u76e1\\u002c\\u4eba\\u985e\\u5fc5\\u9808\\u8981\\u5728\\u6642\\u9593\\u8017\\u76e1\\u524d\\u56de\\u6b78\\u5730\\u7403\\u002c\\u5c0b\\u627e\\u7e7c\\u0020\\u7e8c\\u5b58\\u6d3b\\u7684\\u6a5f\\u6703\\u3002\\u003c\\u0062\\u003e\\u0032\\u0032\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u5e74\\u002c\\u003c\\u0062\\u003e\\u0033\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u4f4d\\u7b2c\\u4e00\\u6279\\u592a\\u7a7a\\u4eba\\u6210\\u529f\\u65bc\\u5357\\u6975\\u6d32\\u8457\\u9678\\u002c\\u5efa\\u7acb\\u8d77\\u5730\\u7403\\u65b0\\u7d00\\u5143\\u7684\\u7b2c\\u4e00\\u500b\\u0020\\u6751\\u843d\\u002c\\u4e4b\\u5f8c\\u4eba\\u985e\\u5b8c\\u6210\\u4e86\\u0020\\u003c\\u0062\\u003e\\u0031\\u0030\\u0037\\u003c\\u002f\\u0062\\u003e\\u0020\\u6b21\\u300c\\u5730\\u7403\\u56de\\u6b78\\u4efb\\u52d9\\u300d\\u3002\\u003c\\u0062\\u0072\\u002f\\u003e\\u4eca\\u5929\\u002d\\u5373\\u0020\\u003c\\u0062\\u003e\\u0032\\u0033\\u0030\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u5e74\\u0020\\u003c\\u0062\\u003e\\u0031\\u0031\\u003c\\u002f\\u0062\\u003e\\u0020\\u6708\\u0020\\u003c\\u0062\\u003e\\u0031\\u0031\\u003c\\u002f\\u0062\\u003e\\u0020\\u65e5\\u002c\\u5373\\u5c07\\u662f\\u4f60\\u548c\\u5176\\u4ed6\\u0020\\u003c\\u0062\\u003e\\u0033\\u0030\\u003c\\u002f\\u0062\\u003e\\u0020\\u4f4d\\u592a\\u7a7a\\u4eba\\u96a8\\u5373\\u5c55\\u958b\\u7da0\\u8272\\u7684\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u8a13\\u7df4\\u002c\\u0020\\u4e26\\u63a5\\u53d7\\u6700\\u7d42\\u8003\\u6838\\u7684\\u91cd\\u8981\\u6642\\u523b\\u002c\\u901a\\u904e\\u6e2c\\u8a66\\u624d\\u80fd\\u767b\\u4e0a\\u56de\\u6b78\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4e4b\\u65c5\\u002e\\u002e\\u002e\\u002e\\u002e\\u002e\"}', '100', '100', '{\"title\":\"\\u7a7f\\u68ad\\u6642\\u7a7a\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5c07\\u767b\\u4e0a\\u8d85\\u5149\\u901f\\u98db\\u8239,\\u7a7f\\u8d8a\\u6642\\u7a7a\\u96a7\\u9053\\u91cd\\u8fd4 21 \\u4e16\\u7d00,\\u4ee5 180 \\u309a\\u5168\\u666f\\u7192\\u5e55\\u914d\\u5408\\u56db\\u65b9\\u516b\\u9762\\u7684 4D\\u7279\\u6280\\u4e0a\\u6f14\\u6975\\u5177\\u8996\\u807d\\u9707\\u64bc\\u7684\\u300c2100 \\u672b\\u65e5\\u4e4b\\u5883\\u300d,\\u8b93\\u60a8\\u89aa\\u6b77 21 \\u4e16\\u7d00\\u672b,\\u9ad4\\u9a57\\u8d85\\u8f09\\u7684\\u5730\\u7403\\u6158\\u906d\\u4eba\\u985e\\u7834\\u58de\\u7684\\u672b\\u65e5\\u4e4b\\u5883\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg1.jpg\"}', '{\"title\":\"\\u63a2\\u7d22\\u8cc7\\u6e90\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u91cd\\u8fd4\\u592a\\u7a7a\\u7ad9\\uff0c\\u6b63\\u5f0f\\u958b\\u59cb\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u8a13\\u7df4\\u3002\\u5f9e\\u672a\\u8e0f\\u8db3\\u5730\\u7403\\u7684\\u592a\\u7a7a\\u4eba\\u5c07\\u5728\\u6b64\\u5340\\u4ee5\\u9ad4\\u9a57\\u0041\\u0052\\u64f4\\u589e\\u5be6\\u5883\\u6280\\u8853\\u8a8d\\u8b58\\u5730\\u7403\\u7269\\u7a2e\\u53ca\\u751f\\u7269\\u8cc7\\u6e90\\uff0c\\u4e86\\u89e3\\u4eba\\u985e\\u6d3b\\u52d5\\u5c0d\\u751f\\u614b\\u74b0\\u5883\\u548c\\u7269\\u7a2e\\u9020\\u6210\\u7684\\u91cd\\u5927\\u5a01\\u8105\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg2.jpg\"}', '{\"title\":\"\\u300c\\u6709\\u6a5f\\u8fb2\\u8015\\u4efb\\u52d9\\u7ad9\\u300d\",\"summary\":\"\\u592a\\u7a7a\\u4eba\\u5728\\u5145\\u6eff\\u751f\\u6a5f\\u7684\\u6709\\u6a5f\\u8fb2\\u7530\\u81ea\\u7531\\u7a7f\\u68ad\\uff0c\\u7d30\\u807d\\u8fb2\\u592b\\u5206\\u4eab\\u6709\\u6a5f\\u8fb2\\u8015\\u5c0f\\u6545\\u4e8b\\uff0c\\u900f\\u904e\\u975e\\u51e1\\u7684\\u591a\\u5a92\\u9ad4\\u6280\\u8853\\u5b8c\\u6210\\u8fb2\\u8015\\u4efb\\u52d9\\uff0c\\u8a8d\\u8b58\\u5c0a\\u91cd\\u5927\\u81ea\\u7136\\u7684\\u795e\\u79d8\\u6cd5\\u5247\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg3.jpg\"}', '{\"title\":\"\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\",\"summary\":\"\\u8d70\\u9032\\u9ad8\\u7aef\\u7684\\u8cfc\\u7269\\u4e2d\\u5fc3\\uff0c\\u63a5\\u53d7\\u5145\\u6eff\\u6311\\u6230\\u7684\\u53ef\\u6301\\u7e8c\\u6d88\\u8cbb\\u8a13\\u7df4\\uff0c\\u8a8d\\u8b58\\u73fe\\u4ee3\\u6d88\\u8cbb\\u6a21\\u5f0f\\uff0c\\u900f\\u904e\\u0056\\u0052\\u9ad4\\u9a57\\u91cd\\u65b0\\u5be9\\u8996\\u65e5\\u5e38\\u751f\\u6d3b\\u7fd2\\u6163\\uff0c\\u4e86\\u89e3\\u80cc\\u5f8c\\u7684\\u751f\\u614b\\u4ee3\\u50f9\\uff0c\\u5b78\\u6703\\u505a\\u500b\\u7cbe\\u660e\\u74b0\\u4fdd\\u7684\\u6d88\\u8cbb\\u8005\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg4.jpg\"}', '{\"title\":\"\\u5de5\\u4f5c\\u574a\",\"summary\":\"\\u900f\\u904e\\u5c0f\\u5be6\\u9a57\\u3001\\u624b\\u4f5c\\u548c\\u7a2e\\u690d\\u5de5\\u4f5c\\u574a\\u7b49\\uff0c\\u8b93\\u592a\\u7a7a\\u4eba\\u4e00\\u5c55\\u8eab\\u624b\\u89aa\\u8eab\\u5be6\\u8e10\\u53ef\\u6301\\u7e8c\\u751f\\u6d3b\\u6a21\\u5f0f\\u3002\",\"image\":\"uploads\\/2018\\/08-15\\/hall_bg5.jpg\"}', '1', '2018-08-16 10:33:57', '127.0.0.1');

-- ----------------------------
-- Table structure for yu_eqaa
-- ----------------------------
DROP TABLE IF EXISTS `yu_eqaa`;
CREATE TABLE `yu_eqaa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '0' COMMENT '1已解答',
  `isview` int(11) NOT NULL DEFAULT '0' COMMENT '1显示',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(255) DEFAULT NULL COMMENT '电话',
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答';

-- ----------------------------
-- Records of yu_eqaa
-- ----------------------------
INSERT INTO `yu_eqaa` VALUES ('1', '1', '1', '1', '幹嘛', '134564@qq.com', '023 975313', '這要幹嘛的', '之今息運，的鄉社自時死不理現老它笑也：記元有響間謝本約的視的相在城特。導果生人友老汽，東消思像能受神？', '3', '0', '1', '2018-08-15 16:44:44', '1', '2018-08-15 16:44:48', '127.0.0.1');
INSERT INTO `yu_eqaa` VALUES ('2', '1', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', '1231', '1', '0', null, '2018-08-15 17:15:22', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('3', '1', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', '2312', '1', '0', null, '2018-08-15 17:15:37', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('4', '0', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', '', '1', '0', null, '2018-08-15 17:15:52', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('5', '1', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', '23sdfas', '2', '0', null, '2018-08-15 17:15:59', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('6', '1', '1', '1', 'test', 'test@test.com', '0238888888', 'testask', 'asdferw', '2', '0', null, '2018-08-15 17:28:23', null, null, '192.168.0.146');
INSERT INTO `yu_eqaa` VALUES ('7', '1', '1', '2', 'test', 'we@email.com', '13985424551', '测试意见', 'hdfgh', '2', '0', null, '2018-08-16 09:35:30', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('8', '1', '1', '3', 'test', 'test@pal.com', '13584684551', 'dwqdwqdwqd', 'asdf', '2', '0', null, '2018-08-16 09:36:12', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('9', '1', '1', '3', 'dwqd', 'dwqdwqd', 'dqwdqd', 'qwdwqdqd', 'cbvzxc', '2', '0', null, '2018-08-16 09:58:56', null, null, '192.168.0.108');
INSERT INTO `yu_eqaa` VALUES ('10', '1', '1', '2', 'qwdqd', 'wqdqwd', 'qdwqdwq', 'dwqdqwd', 'fghdfg', '3', '0', null, '2018-08-16 18:03:20', null, null, '192.168.0.124');
INSERT INTO `yu_eqaa` VALUES ('11', '1', '1', '3', '123', '123', '123', '123', 'gfhdg', '3', '0', null, '2018-08-17 15:14:06', null, null, '127.0.0.1');
INSERT INTO `yu_eqaa` VALUES ('12', '0', '1', '3', 'test', 'test', 'test', 'test', '', '3', '0', null, '2018-08-17 15:33:46', null, null, '127.0.0.1');
INSERT INTO `yu_eqaa` VALUES ('13', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqdd', '1', '0', '1', '2018-09-10 16:41:09', null, null, '192.168.0.103');
INSERT INTO `yu_eqaa` VALUES ('14', '1', '0', '1', null, null, null, 'testask', '2312dwqqqqqq', '1', '0', '1', '2018-09-10 16:41:14', null, null, '192.168.0.103');
INSERT INTO `yu_eqaa` VALUES ('15', '1', '0', '1', null, null, null, 'testask', '2312dwqqqqqqdwqqqqq', '1', '0', '1', '2018-09-10 16:41:22', null, null, '192.168.0.103');
INSERT INTO `yu_eqaa` VALUES ('16', '1', '0', '1', null, null, null, 'testask', 'dqwdqqqqqqqqqqqqqqqqqqqqqqq', '1', '0', '1', '2018-09-12 17:00:36', null, null, '192.168.0.116');
INSERT INTO `yu_eqaa` VALUES ('17', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqddwqqdwqdwqdqwdd', '1', '0', '1', '2018-09-12 17:01:52', null, null, '192.168.0.116');
INSERT INTO `yu_eqaa` VALUES ('18', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqddwqqdwqdwqdqwdddwqd', '1', '0', '1', '2018-09-12 17:13:51', null, null, '192.168.0.116');
INSERT INTO `yu_eqaa` VALUES ('19', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqddwqqdwqdwqdqwdddwqd', '1', '0', '1', '2018-09-13 16:10:22', null, null, '192.168.0.116');
INSERT INTO `yu_eqaa` VALUES ('20', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqddwqqdwqdwqdqwdddwqd2', '1', '0', '1', '2018-09-13 16:10:25', null, null, '192.168.0.116');
INSERT INTO `yu_eqaa` VALUES ('21', '1', '0', '1', null, null, null, 'testask', 'dqwwqqqqqqqqqqqqqqqqqqqqqqqqqdddwqdwqqdwqdwqdqwdddwqd2', '1', '0', '1', '2018-09-13 18:10:30', null, null, '192.168.0.116');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答类别';

-- ----------------------------
-- Records of yu_eqaa_type
-- ----------------------------
INSERT INTO `yu_eqaa_type` VALUES ('1', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');
INSERT INTO `yu_eqaa_type` VALUES ('2', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');
INSERT INTO `yu_eqaa_type` VALUES ('3', '0', '1', '2018-08-15 16:31:57', '1', '2018-08-15 16:32:00', '127.0.0.1');
INSERT INTO `yu_eqaa_type` VALUES ('4', '1', '1', '2018-09-10 16:41:35', null, null, '192.168.0.103');
INSERT INTO `yu_eqaa_type` VALUES ('5', '1', '1', '2018-09-10 16:41:53', '1', '0000-00-00 00:00:00', '192.168.0.116');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='专家问答类型名称';

-- ----------------------------
-- Records of yu_eqaa_typename
-- ----------------------------
INSERT INTO `yu_eqaa_typename` VALUES ('1', '3', '超載的地球', '1');
INSERT INTO `yu_eqaa_typename` VALUES ('2', '3', '2050面臨', '2');
INSERT INTO `yu_eqaa_typename` VALUES ('3', '3', '我們的生活模式', '3');
INSERT INTO `yu_eqaa_typename` VALUES ('4', '2', '超载的地球', '1');
INSERT INTO `yu_eqaa_typename` VALUES ('5', '2', '2050面临', '2');
INSERT INTO `yu_eqaa_typename` VALUES ('6', '2', '我们的生活', '3');
INSERT INTO `yu_eqaa_typename` VALUES ('7', '1', 'Overloaded earth', '1');
INSERT INTO `yu_eqaa_typename` VALUES ('8', '1', '2050 face', '2');
INSERT INTO `yu_eqaa_typename` VALUES ('9', '1', 'Our life', '3');
INSERT INTO `yu_eqaa_typename` VALUES ('10', '1', 'dwq', '4');
INSERT INTO `yu_eqaa_typename` VALUES ('11', '2', 'dqw', '4');
INSERT INTO `yu_eqaa_typename` VALUES ('12', '3', 'qdw', '4');
INSERT INTO `yu_eqaa_typename` VALUES ('13', '1', '英文', '5');
INSERT INTO `yu_eqaa_typename` VALUES ('14', '2', '简体', '5');
INSERT INTO `yu_eqaa_typename` VALUES ('15', '3', '繁体', '5');

-- ----------------------------
-- Table structure for yu_files
-- ----------------------------
DROP TABLE IF EXISTS `yu_files`;
CREATE TABLE `yu_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `file_userid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员编号',
  `file_ip` char(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `file_local` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_save` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_title` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_ext` char(20) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of yu_files
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='帮助信息表';

-- ----------------------------
-- Records of yu_help
-- ----------------------------
INSERT INTO `yu_help` VALUES ('1', '預約參觀底部圖和文字', 'appointment_header', '預 約 參 觀', 'uploads/2018/08-15/banner.jpg', '\"\\u9012\\u4ea4\"', '3', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('2', '预约参观顶部头图和文字', 'appointment_header', '预 约 参 观', 'uploads/2018/08-15/banner.jpg', '递交', '2', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('3', 'Make an appointment to visit the top header and te', 'appointment_header', 'Booking Visitor2', 'uploads/2018/0911/9aa8cc59513019d2c7c27996b30f3bcd.jpg', '\"submit\"', '1', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('4', 'Make an appointment to visit the bottom map and te', 'appointment_footer', '1', '', '[{\"image\":\"uploads\\/2018\\/08-27\\/gallery01.jpg\",\"text\":\"4D cinema\",\"txt\":\"4D cinema1234\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery02.jpg\",\"text\":\"Biological resources area\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery03.jpg\",\"text\":\"Organic agriculture exhibition area\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery04.jpg\",\"text\":\"Organic agriculture exhibition area\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery05.jpg\",\"text\":\"Workshops\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery06.jpg\",\"text\":\"A nearby restaurant\"}]', '1', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('5', '预约参观底部图和文字', 'appointment_footer', '1', '', '[{\"image\":\"uploads\\/2018\\/08-27\\/gallery01.jpg\",\"text\":\"4D \\u5f71\\u9662\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery02.jpg\",\"text\":\"\\u751f\\u7269\\u8d44\\u6e90\\u533a\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery03.jpg\",\"text\":\"\\u6709\\u673a\\u519c\\u4e1a\\u5c55\\u533a\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery04.jpg\",\"text\":\"\\u6709\\u673a\\u519c\\u4e1a\\u5c55\\u533a\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery05.jpg\",\"text\":\"\\u5de5\\u4f5c\\u574a\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery06.jpg\",\"text\":\"\\u9644\\u8fd1\\u9910\\u5385\"}]', '2', '1534329991', '1534329991');
INSERT INTO `yu_help` VALUES ('6', '預約參觀底部圖和文字', 'appointment_footer', '1', '', '[{\"image\":\"uploads\\/2018\\/08-27\\/gallery01.jpg\",\"text\":\"4D \\u5f71\\u9662\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery02.jpg\",\"text\":\"\\u751f\\u7269\\u8cc7\\u6e90\\u5340\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery03.jpg\",\"text\":\"\\u6709\\u6a5f\\u8fb2\\u696d\\u5c55\\u5340\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery04.jpg\",\"text\":\"\\u6709\\u6a5f\\u8fb2\\u696d\\u5c55\\u5340\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery05.jpg\",\"text\":\"\\u5de5\\u4f5c\\u574a\"},{\"image\":\"uploads\\/2018\\/08-27\\/gallery06.jpg\",\"text\":\"\\u9644\\u8fd1\\u9910\\u5ef3\"}]', '3', '1534329991', '1534329991');

-- ----------------------------
-- Table structure for yu_holiday
-- ----------------------------
DROP TABLE IF EXISTS `yu_holiday`;
CREATE TABLE `yu_holiday` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '假期时间戳',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='香港公共假期表\r\n';

-- ----------------------------
-- Records of yu_holiday
-- ----------------------------
INSERT INTO `yu_holiday` VALUES ('1', '1483286400');
INSERT INTO `yu_holiday` VALUES ('2', '1485532800');
INSERT INTO `yu_holiday` VALUES ('3', '1485705600');
INSERT INTO `yu_holiday` VALUES ('4', '1485792000');
INSERT INTO `yu_holiday` VALUES ('5', '1491235200');
INSERT INTO `yu_holiday` VALUES ('6', '1492099200');
INSERT INTO `yu_holiday` VALUES ('7', '1492185600');
INSERT INTO `yu_holiday` VALUES ('8', '1492358400');
INSERT INTO `yu_holiday` VALUES ('9', '1493568000');
INSERT INTO `yu_holiday` VALUES ('10', '1493740800');
INSERT INTO `yu_holiday` VALUES ('11', '1496073600');
INSERT INTO `yu_holiday` VALUES ('12', '1498838400');
INSERT INTO `yu_holiday` VALUES ('13', '1506873600');
INSERT INTO `yu_holiday` VALUES ('14', '1507132800');
INSERT INTO `yu_holiday` VALUES ('15', '1509120000');
INSERT INTO `yu_holiday` VALUES ('16', '1514131200');
INSERT INTO `yu_holiday` VALUES ('17', '1514217600');
INSERT INTO `yu_holiday` VALUES ('18', '1514736000');
INSERT INTO `yu_holiday` VALUES ('19', '1518710400');
INSERT INTO `yu_holiday` VALUES ('20', '1518796800');
INSERT INTO `yu_holiday` VALUES ('21', '1518969600');
INSERT INTO `yu_holiday` VALUES ('22', '1522339200');
INSERT INTO `yu_holiday` VALUES ('23', '1522425600');
INSERT INTO `yu_holiday` VALUES ('24', '1522598400');
INSERT INTO `yu_holiday` VALUES ('25', '1522857600');
INSERT INTO `yu_holiday` VALUES ('26', '1525104000');
INSERT INTO `yu_holiday` VALUES ('27', '1526918400');
INSERT INTO `yu_holiday` VALUES ('28', '1529251200');
INSERT INTO `yu_holiday` VALUES ('29', '1530460800');
INSERT INTO `yu_holiday` VALUES ('30', '1537804800');
INSERT INTO `yu_holiday` VALUES ('31', '1538323200');
INSERT INTO `yu_holiday` VALUES ('32', '1539705600');
INSERT INTO `yu_holiday` VALUES ('33', '1545667200');
INSERT INTO `yu_holiday` VALUES ('34', '1545753600');
INSERT INTO `yu_holiday` VALUES ('35', '1546272000');
INSERT INTO `yu_holiday` VALUES ('36', '1549296000');
INSERT INTO `yu_holiday` VALUES ('37', '1549382400');
INSERT INTO `yu_holiday` VALUES ('38', '1549468800');
INSERT INTO `yu_holiday` VALUES ('39', '1554393600');
INSERT INTO `yu_holiday` VALUES ('40', '1555603200');
INSERT INTO `yu_holiday` VALUES ('41', '1555689600');
INSERT INTO `yu_holiday` VALUES ('42', '1555862400');
INSERT INTO `yu_holiday` VALUES ('43', '1556640000');
INSERT INTO `yu_holiday` VALUES ('44', '1557676800');
INSERT INTO `yu_holiday` VALUES ('45', '1559836800');
INSERT INTO `yu_holiday` VALUES ('46', '1561910400');
INSERT INTO `yu_holiday` VALUES ('47', '1568390400');
INSERT INTO `yu_holiday` VALUES ('48', '1569859200');
INSERT INTO `yu_holiday` VALUES ('49', '1570377600');
INSERT INTO `yu_holiday` VALUES ('50', '1577203200');
INSERT INTO `yu_holiday` VALUES ('51', '1577289600');

-- ----------------------------
-- Table structure for yu_holidayname
-- ----------------------------
DROP TABLE IF EXISTS `yu_holidayname`;
CREATE TABLE `yu_holidayname` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公共假期表编号',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `summary` char(50) NOT NULL DEFAULT '' COMMENT '假期名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='香港公共假期表描述\r\n';

-- ----------------------------
-- Records of yu_holidayname
-- ----------------------------
INSERT INTO `yu_holidayname` VALUES ('1', '1', '1', 'The day following the first day of January');
INSERT INTO `yu_holidayname` VALUES ('2', '1', '2', '一月一日翌日');
INSERT INTO `yu_holidayname` VALUES ('3', '1', '3', '一月一日翌日');
INSERT INTO `yu_holidayname` VALUES ('4', '2', '1', 'Lunar New Year’s Day');
INSERT INTO `yu_holidayname` VALUES ('5', '2', '2', '农历年初一');
INSERT INTO `yu_holidayname` VALUES ('6', '2', '3', '農曆年初一');
INSERT INTO `yu_holidayname` VALUES ('7', '3', '1', 'The third day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('8', '3', '2', '农历年初三');
INSERT INTO `yu_holidayname` VALUES ('9', '3', '3', '農曆年初三');
INSERT INTO `yu_holidayname` VALUES ('10', '4', '1', 'The fourth day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('11', '4', '2', '农历年初四');
INSERT INTO `yu_holidayname` VALUES ('12', '4', '3', '農曆年初四');
INSERT INTO `yu_holidayname` VALUES ('13', '5', '1', 'Ching Ming Festival');
INSERT INTO `yu_holidayname` VALUES ('14', '5', '2', '清明节');
INSERT INTO `yu_holidayname` VALUES ('15', '5', '3', '清明節');
INSERT INTO `yu_holidayname` VALUES ('16', '6', '1', 'Good Friday');
INSERT INTO `yu_holidayname` VALUES ('17', '6', '2', '耶稣受难节');
INSERT INTO `yu_holidayname` VALUES ('18', '6', '3', '耶穌受難節');
INSERT INTO `yu_holidayname` VALUES ('19', '7', '1', 'The day following Good Friday');
INSERT INTO `yu_holidayname` VALUES ('20', '7', '2', '耶稣受难节翌日');
INSERT INTO `yu_holidayname` VALUES ('21', '7', '3', '耶穌受難節翌日');
INSERT INTO `yu_holidayname` VALUES ('22', '8', '1', 'Easter Monday');
INSERT INTO `yu_holidayname` VALUES ('23', '8', '2', '复活节星期一');
INSERT INTO `yu_holidayname` VALUES ('24', '8', '3', '復活節星期一');
INSERT INTO `yu_holidayname` VALUES ('25', '9', '1', 'Labour Day');
INSERT INTO `yu_holidayname` VALUES ('26', '9', '2', '劳动节');
INSERT INTO `yu_holidayname` VALUES ('27', '9', '3', '勞動節');
INSERT INTO `yu_holidayname` VALUES ('28', '10', '1', 'The Birthday of the Buddha');
INSERT INTO `yu_holidayname` VALUES ('29', '10', '2', '佛诞');
INSERT INTO `yu_holidayname` VALUES ('30', '10', '3', '佛誕');
INSERT INTO `yu_holidayname` VALUES ('31', '11', '1', 'Tuen Ng Festival');
INSERT INTO `yu_holidayname` VALUES ('32', '11', '2', '端午节');
INSERT INTO `yu_holidayname` VALUES ('33', '11', '3', '端午節');
INSERT INTO `yu_holidayname` VALUES ('34', '12', '1', 'Hong Kong Special Administrative Region Establishm');
INSERT INTO `yu_holidayname` VALUES ('35', '12', '2', '香港特别行政区成立纪念日');
INSERT INTO `yu_holidayname` VALUES ('36', '12', '3', '香港特別行政區成立紀念日');
INSERT INTO `yu_holidayname` VALUES ('37', '13', '1', 'The day following National Day');
INSERT INTO `yu_holidayname` VALUES ('38', '13', '2', '国庆日翌日');
INSERT INTO `yu_holidayname` VALUES ('39', '13', '3', '國慶日翌日');
INSERT INTO `yu_holidayname` VALUES ('40', '14', '1', 'The day following the Chinese Mid-Autumn Festival');
INSERT INTO `yu_holidayname` VALUES ('41', '14', '2', '中秋节翌日');
INSERT INTO `yu_holidayname` VALUES ('42', '14', '3', '中秋節翌日');
INSERT INTO `yu_holidayname` VALUES ('43', '15', '1', 'Chung Yeung Festival');
INSERT INTO `yu_holidayname` VALUES ('44', '15', '2', '重阳节');
INSERT INTO `yu_holidayname` VALUES ('45', '15', '3', '重陽節');
INSERT INTO `yu_holidayname` VALUES ('46', '16', '1', 'Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('47', '16', '2', '圣诞节');
INSERT INTO `yu_holidayname` VALUES ('48', '16', '3', '聖誕節');
INSERT INTO `yu_holidayname` VALUES ('49', '17', '1', 'The first weekday after Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('50', '17', '2', '圣诞节后第一个周日');
INSERT INTO `yu_holidayname` VALUES ('51', '17', '3', '聖誕節後第一個周日');
INSERT INTO `yu_holidayname` VALUES ('52', '18', '1', 'The first day of January');
INSERT INTO `yu_holidayname` VALUES ('53', '18', '2', '一月一日');
INSERT INTO `yu_holidayname` VALUES ('54', '18', '3', '一月一日');
INSERT INTO `yu_holidayname` VALUES ('55', '19', '1', 'Lunar New Year’s Day');
INSERT INTO `yu_holidayname` VALUES ('56', '19', '2', '农历年初一');
INSERT INTO `yu_holidayname` VALUES ('57', '19', '3', '農曆年初一');
INSERT INTO `yu_holidayname` VALUES ('58', '20', '1', 'The second day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('59', '20', '2', '农历年初二');
INSERT INTO `yu_holidayname` VALUES ('60', '20', '3', '農曆年初二');
INSERT INTO `yu_holidayname` VALUES ('61', '21', '1', 'The fourth day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('62', '21', '2', '农历年初四');
INSERT INTO `yu_holidayname` VALUES ('63', '21', '3', '農曆年初四');
INSERT INTO `yu_holidayname` VALUES ('64', '22', '1', 'Good Friday');
INSERT INTO `yu_holidayname` VALUES ('65', '22', '2', '耶稣受难节');
INSERT INTO `yu_holidayname` VALUES ('66', '22', '3', '耶穌受難節');
INSERT INTO `yu_holidayname` VALUES ('67', '23', '1', 'The day following Good Friday');
INSERT INTO `yu_holidayname` VALUES ('68', '23', '2', '耶稣受难节翌日');
INSERT INTO `yu_holidayname` VALUES ('69', '23', '3', '耶穌受難節翌日');
INSERT INTO `yu_holidayname` VALUES ('70', '24', '1', 'Easter Monday');
INSERT INTO `yu_holidayname` VALUES ('71', '24', '2', '复活节星期一');
INSERT INTO `yu_holidayname` VALUES ('72', '24', '3', '復活節星期一');
INSERT INTO `yu_holidayname` VALUES ('73', '25', '1', 'Ching Ming Festival');
INSERT INTO `yu_holidayname` VALUES ('74', '25', '2', '清明节');
INSERT INTO `yu_holidayname` VALUES ('75', '25', '3', '清明節');
INSERT INTO `yu_holidayname` VALUES ('76', '26', '1', 'Labour Day');
INSERT INTO `yu_holidayname` VALUES ('77', '26', '2', '劳动节');
INSERT INTO `yu_holidayname` VALUES ('78', '26', '3', '勞動節');
INSERT INTO `yu_holidayname` VALUES ('79', '27', '1', 'The Birthday of the Buddha');
INSERT INTO `yu_holidayname` VALUES ('80', '27', '2', '佛诞');
INSERT INTO `yu_holidayname` VALUES ('81', '27', '3', '佛誕');
INSERT INTO `yu_holidayname` VALUES ('82', '28', '1', 'Tuen Ng Festival');
INSERT INTO `yu_holidayname` VALUES ('83', '28', '2', '端午节');
INSERT INTO `yu_holidayname` VALUES ('84', '28', '3', '端午節');
INSERT INTO `yu_holidayname` VALUES ('85', '29', '1', 'The day following Hong Kong Special Administrative');
INSERT INTO `yu_holidayname` VALUES ('86', '29', '2', '香港特别行政区成立纪念日翌日');
INSERT INTO `yu_holidayname` VALUES ('87', '29', '3', '香港特別行政區成立紀念日翌日');
INSERT INTO `yu_holidayname` VALUES ('88', '30', '1', 'The day following the Chinese Mid-Autumn Festival');
INSERT INTO `yu_holidayname` VALUES ('89', '30', '2', '中秋节翌日');
INSERT INTO `yu_holidayname` VALUES ('90', '30', '3', '中秋節翌日');
INSERT INTO `yu_holidayname` VALUES ('91', '31', '1', 'National Day');
INSERT INTO `yu_holidayname` VALUES ('92', '31', '2', '国庆日');
INSERT INTO `yu_holidayname` VALUES ('93', '31', '3', '國慶日');
INSERT INTO `yu_holidayname` VALUES ('94', '32', '1', 'Chung Yeung Festival');
INSERT INTO `yu_holidayname` VALUES ('95', '32', '2', '重阳节');
INSERT INTO `yu_holidayname` VALUES ('96', '32', '3', '重陽節');
INSERT INTO `yu_holidayname` VALUES ('97', '33', '1', 'Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('98', '33', '2', '圣诞节');
INSERT INTO `yu_holidayname` VALUES ('99', '33', '3', '聖誕節');
INSERT INTO `yu_holidayname` VALUES ('100', '34', '1', 'The first weekday after Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('101', '34', '2', '圣诞节后第一个周日');
INSERT INTO `yu_holidayname` VALUES ('102', '34', '3', '聖誕節後第一個周日');
INSERT INTO `yu_holidayname` VALUES ('103', '35', '1', 'The first day of January');
INSERT INTO `yu_holidayname` VALUES ('104', '35', '2', '一月一日');
INSERT INTO `yu_holidayname` VALUES ('105', '35', '3', '一月一日');
INSERT INTO `yu_holidayname` VALUES ('106', '36', '1', 'Lunar New Year’s Day');
INSERT INTO `yu_holidayname` VALUES ('107', '36', '2', '农历年初一');
INSERT INTO `yu_holidayname` VALUES ('108', '36', '3', '農曆年初一');
INSERT INTO `yu_holidayname` VALUES ('109', '37', '1', 'The second day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('110', '37', '2', '农历年初二');
INSERT INTO `yu_holidayname` VALUES ('111', '37', '3', '農曆年初二');
INSERT INTO `yu_holidayname` VALUES ('112', '38', '1', 'The third day of Lunar New Year');
INSERT INTO `yu_holidayname` VALUES ('113', '38', '2', '农历年初三');
INSERT INTO `yu_holidayname` VALUES ('114', '38', '3', '農曆年初三');
INSERT INTO `yu_holidayname` VALUES ('115', '39', '1', 'Ching Ming Festival');
INSERT INTO `yu_holidayname` VALUES ('116', '39', '2', '清明节');
INSERT INTO `yu_holidayname` VALUES ('117', '39', '3', '清明節');
INSERT INTO `yu_holidayname` VALUES ('118', '40', '1', 'Good Friday');
INSERT INTO `yu_holidayname` VALUES ('119', '40', '2', '耶稣受难节');
INSERT INTO `yu_holidayname` VALUES ('120', '40', '3', '耶穌受難節');
INSERT INTO `yu_holidayname` VALUES ('121', '41', '1', 'The day following Good Friday');
INSERT INTO `yu_holidayname` VALUES ('122', '41', '2', '耶稣受难节翌日');
INSERT INTO `yu_holidayname` VALUES ('123', '41', '3', '耶穌受難節翌日');
INSERT INTO `yu_holidayname` VALUES ('124', '42', '1', 'Easter Monday');
INSERT INTO `yu_holidayname` VALUES ('125', '42', '2', '复活节星期一');
INSERT INTO `yu_holidayname` VALUES ('126', '42', '3', '復活節星期一');
INSERT INTO `yu_holidayname` VALUES ('127', '43', '1', 'Labour Day');
INSERT INTO `yu_holidayname` VALUES ('128', '43', '2', '劳动节');
INSERT INTO `yu_holidayname` VALUES ('129', '43', '3', '勞動節');
INSERT INTO `yu_holidayname` VALUES ('130', '44', '1', 'The day following the Birthday of the Buddha');
INSERT INTO `yu_holidayname` VALUES ('131', '44', '2', '佛诞翌日');
INSERT INTO `yu_holidayname` VALUES ('132', '44', '3', '佛誕翌日');
INSERT INTO `yu_holidayname` VALUES ('133', '45', '1', 'Tuen Ng Festival');
INSERT INTO `yu_holidayname` VALUES ('134', '45', '2', '端午节');
INSERT INTO `yu_holidayname` VALUES ('135', '45', '3', '端午節');
INSERT INTO `yu_holidayname` VALUES ('136', '46', '1', 'Hong Kong Special Administrative Region Establishm');
INSERT INTO `yu_holidayname` VALUES ('137', '46', '2', '香港特别行政区成立纪念日');
INSERT INTO `yu_holidayname` VALUES ('138', '46', '3', '香港特別行政區成立紀念日');
INSERT INTO `yu_holidayname` VALUES ('139', '47', '1', 'The day following the Chinese Mid-Autumn Festival');
INSERT INTO `yu_holidayname` VALUES ('140', '47', '2', '中秋节翌日');
INSERT INTO `yu_holidayname` VALUES ('141', '47', '3', '中秋節翌日');
INSERT INTO `yu_holidayname` VALUES ('142', '48', '1', 'National Day');
INSERT INTO `yu_holidayname` VALUES ('143', '48', '2', '国庆日');
INSERT INTO `yu_holidayname` VALUES ('144', '48', '3', '國慶日');
INSERT INTO `yu_holidayname` VALUES ('145', '49', '1', 'Chung Yeung Festival');
INSERT INTO `yu_holidayname` VALUES ('146', '49', '2', '重阳节');
INSERT INTO `yu_holidayname` VALUES ('147', '49', '3', '重陽節');
INSERT INTO `yu_holidayname` VALUES ('148', '50', '1', 'Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('149', '50', '2', '圣诞节');
INSERT INTO `yu_holidayname` VALUES ('150', '50', '3', '聖誕節');
INSERT INTO `yu_holidayname` VALUES ('151', '51', '1', 'The first weekday after Christmas Day');
INSERT INTO `yu_holidayname` VALUES ('152', '51', '2', '圣诞节后第一个周日');
INSERT INTO `yu_holidayname` VALUES ('153', '51', '3', '聖誕節後第一個周日');

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
INSERT INTO `yu_home` VALUES ('1', '1', '[{\"img\":\"uploads\\/2018\\/0919\\/23734818c4c07cf98ad9269731e074bd.jpg\",\"text1\":\"\\u975e\\u51e1\\u611f\\u5b98\\u9ad4\\u9a57\\u5e36\\u60a8\\u7a7f\\u8d8a\\u6642\\u7a7a\\uff0c\",\"text2\":\"\\u9ad4\\u9a57\\u5730\\u7403\\u5371\\u6a5f\\uff0c\\u53cd\\u601d\\u7576\\u4ee3\\u751f\\u6d3b\\u6a21\\u5f0f\\u3002\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u9ad4\\u9a57\\u5b78\\u7fd2\\u9928\",\"index\":0},{\"img\":\"uploads\\/2018\\/08-13\\/banner3.png\",\"text1\":\"\\u903c\\u771f\\u7684\\u62ef\\u6551\\u904e\\u7a0b,\",\"text2\":\"\\u8b93\\u4f60\\u9ad4\\u9a57\\u6d88\\u5931\\u52d5\\u7269\\u771f\\u5be6\\u7684\\u751f\\u6d3b\\u60c5\\u5883\\uff0c\\u53cd\\u601d\\u751f\\u6d3b\\u7fd2\\u6163\\u3002\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u9ad4\\u9a57\\u5b78\\u7fd2\\u9928\"}]', '[{\"img\":\"uploads\\/2018\\/08-13\\/hall_1.png\",\"text\":\"\\u7a7f\\u68ad\\u6642\\u7a7a\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_2.png\",\"text\":\"\\u63a2\\u7d22\\u8cc7\\u6e90\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_3.png\",\"text\":\"\\u300c\\u6709\\u6a5f\\u8fb2\\u8015\\u4efb\\u52d9\\u7ad9\\u300d\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_4.png\",\"text\":\"\\u6c38\\u7e8c\\u751f\\u6d3b\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_5.png\",\"text\":\"\\u5de5\\u4f5c\\u574a\"}]', '{\"number\":\"2030\",\"text\":\"\\u4eba\\u7c7b\\u5c06\\u9700\\u89812 \\u4e2a\\u5730\\u7403\\u7684\\u8d44\\u6e90!\"}', 'uploads/2018/0911/2e13b1872e7b94b7e40fbec1292cacd6.jpg', '{\"zone1\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_1.jpg\",\"text\":\"\\u85cf\\u54c1\\u7ba1\\u7406\\u5340\"},\"zone2\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_2.jpg\",\"text\":\"\\u591a\\u529f\\u80fd\\u5ef3\"},\"zone3\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_3.jpg\",\"text\":\"\\u9673\\u5217\\u5c55\\u89bd\\u5340\"},\"zone4\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_4.jpg\",\"text\":\"\\u79d1\\u666e\\u6559\\u80b2\\u8207\\u516c\\u5171\\u670d\\u52d9\\u5340\"},\"reception\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_5.jpg\",\"text\":\"\\u63a5\\u5f85\"},\"workshop\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_6.jpg\",\"text\":\"\\u8eca\\u9593\"}}', '1', '2018-09-19 17:05:07', '192.168.0.116');
INSERT INTO `yu_home` VALUES ('2', '2', '[{\"img\":\"uploads\\/2018\\/08-13\\/banner1.jpg\",\"text1\":\"\\u975e\\u51e1\\u611f\\u5b98\\u4f53\\u9a8c\\u5e26\\u60a8\\u7a7f\\u8d8a\\u65f6\\u7a7a\\uff0c\",\"text2\":\"\\u9ad4\\u9a57\\u5730\\u7403\\u5371\\u6a5f\\uff0c\\u53cd\\u601d\\u7576\\u4ee3\\u751f\\u6d3b\\u6a21\\u5f0f\\u3002\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u4f53\\u9a8c\\u5b66\\u4e60\\u9986\",\"index\":0},{\"img\":\"uploads\\/2018\\/08-13\\/banner3.png\",\"text1\":\"\\u903c\\u771f\\u7684\\u62ef\\u6551\\u904e\\u7a0b,\",\"text2\":\"\\u8b93\\u4f60\\u9ad4\\u9a57\\u6d88\\u5931\\u52d5\\u7269\\u771f\\u5be6\\u7684\\u751f\\u6d3b\\u60c5\\u5883\\uff0c\\u53cd\\u601d\\u751f\\u6d3b\\u7fd2\\u6163\\u3002\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u9ad4\\u9a57\\u5b78\\u7fd2\\u9928\"}]', '[{\"img\":\"uploads\\/2018\\/0908\\/768446c07b12a94c5183fd6adc6f668a.jpg\",\"text\":\"\\u8fd9\\u91cc\\u662f\\u7b80\\u4f53\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_2.png\",\"text\":\"Exploration of resources\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_3.png\",\"text\":\"\\u300cOrganic farming task station\\u300d\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_4.png\",\"text\":\"Sustainable life\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_5.png\",\"text\":\"Workshops\"}]', '{\"number\":\"2030\",\"text\":\"\\u4eba\\u7c7b\\u5c06\\u9700\\u89812 \\u4e2a\\u5730\\u7403\\u7684\\u8d44\\u6e90!\"}', 'uploads/2018/08-13/banner2.jpg', '{\"zone1\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_1.jpg\",\"text\":\"Collection management area\"},\"zone2\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_2.jpg\",\"text\":\"Multifunction Room\"},\"zone3\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_3.jpg\",\"text\":\"Exhibition and exhibition area\"},\"zone4\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_4.jpg\",\"text\":\"Popular science education and public service area\"},\"reception\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_5.jpg\",\"text\":\"reception\"},\"workshop\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_6.jpg\",\"text\":\"workshop\"}}', '1', '2018-09-19 16:23:35', '192.168.0.116');
INSERT INTO `yu_home` VALUES ('3', '3', '[{\"img\":\"uploads\\/2018\\/08-13\\/banner1.jpg\",\"text1\":\"\\u975e\\u51e1\\u611f\\u5b98\\u9ad4\\u9a57\\u5e36\\u60a8\\u7a7f\\u8d8a\\u6642\\u7a7a\\uff0c\",\"text2\":\"\\u9ad4\\u9a57\\u5730\\u7403\\u5371\\u6a5f\\uff0c\\u53cd\\u601d\\u7576\\u4ee3\\u751f\\u6d3b\\u6a21\\u5f0f\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u9ad4\\u9a57\\u5b78\\u7fd2\\u9928123\",\"index\":0},{\"img\":\"uploads\\/2018\\/08-13\\/banner3.png\",\"text1\":\"\\u903c\\u771f\\u7684\\u62ef\\u6551\\u904e\\u7a0b,\",\"text2\":\"\\u8b93\\u4f60\\u9ad4\\u9a57\\u6d88\\u5931\\u52d5\\u7269\\u771f\\u5be6\\u7684\\u751f\\u6d3b\\u60c5\\u5883\\uff0c\\u53cd\\u601d\\u751f\\u6d3b\\u7fd2\\u6163\\u3002\",\"text3\":\"\\u9999\\u6e2f\\u9996\\u500b\\u4ee5\\u300c\\u751f\\u7269\\u8cc7\\u6e90\\u8207\\u8fb2\\u696d\\u300d\\u70ba\\u4e3b\\u984c\\u7684\\u9ad4\\u9a57\\u5b78\\u7fd2\\u9928\"}]', '[{\"img\":\"uploads\\/2018\\/08-13\\/hall_1.png\",\"text\":\"\\u7a7f\\u68ad\\u6642\\u7a7a\\u7e41\\u4f53\\u4e2d\\u6587\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_2.png\",\"text\":\"\\u63a2\\u7d22\\u8cc7\\u6e90\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_3.png\",\"text\":\"\\u300c\\u6709\\u6a5f\\u8fb2\\u8015\\u4efb\\u52d9\\u7ad9\\u300d\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_4.png\",\"text\":\"\\u6c38\\u7e8c\\u751f\\u6d3b\"},{\"img\":\"uploads\\/2018\\/08-13\\/hall_5.png\",\"text\":\"\\u5de5\\u4f5c\\u574a\"}]', '{\"number\":\"2030\",\"text\":\"\\u4eba\\u7c7b\\u5c06\\u9700\\u89812 \\u4e2a\\u5730\\u7403\\u7684\\u8d44\\u6e90!\"}', 'uploads/2018/0911/2e13b1872e7b94b7e40fbec1292cacd6.jpg', '{\"zone1\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_1.jpg\",\"text\":\"\\u85cf\\u54c1\\u7ba1\\u7406\\u5340\"},\"zone2\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_2.jpg\",\"text\":\"\\u591a\\u529f\\u80fd\\u5ef3\"},\"zone3\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_3.jpg\",\"text\":\"\\u9673\\u5217\\u5c55\\u89bd\\u5340\"},\"zone4\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_4.jpg\",\"text\":\"\\u79d1\\u666e\\u6559\\u80b2\\u8207\\u516c\\u5171\\u670d\\u52d9\\u5340\"},\"reception\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_5.jpg\",\"text\":\"\\u63a5\\u5f85\"},\"workshop\":{\"img\":\"uploads\\/2018\\/08-13\\/zone_6.jpg\",\"text\":\"\\u8eca\\u9593\"}}', '1', '2018-09-19 17:05:24', '192.168.0.116');

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
INSERT INTO `yu_language` VALUES ('1', 'Eng', 'ENG', '2018-08-06 17:18:14');
INSERT INTO `yu_language` VALUES ('2', '简', 'CHS', '2018-08-06 17:18:14');
INSERT INTO `yu_language` VALUES ('3', '繁', 'CHT', '2018-08-06 17:18:22');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志表';

-- ----------------------------
-- Records of yu_logs
-- ----------------------------

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
INSERT INTO `yu_map` VALUES ('1', '22.336098', '114.182748', '香港九龍塘香港浸會大學', '星 期 一 至 日 \r\n上 午 1 0 時 至 下 午 7 時', '(852) 34112384', ' hkorc@hkbu.edu.hk', '3', '1', '0', '1534841391');
INSERT INTO `yu_map` VALUES ('2', '22.336098', '114.182748', '香港九龙塘香港浸会大学', '星 期 一 至 日 \r\n上 午 1 0 时 至 下 午 7 时', '(852) 34112384', ' hkorc@hkbu.edu.hk', '2', '1', '0', '1534841391');

-- ----------------------------
-- Table structure for yu_menu_cms
-- ----------------------------
DROP TABLE IF EXISTS `yu_menu_cms`;
CREATE TABLE `yu_menu_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息列表';

-- ----------------------------
-- Records of yu_news
-- ----------------------------
INSERT INTO `yu_news` VALUES ('1', '1', '1', 'uploads/2018/08-15/news-sample.jpg', 'uploads/2018/08-15/news-sample.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('2', '1', '1', 'uploads/2018/08-15/news-sample2.jpg', 'uploads/2018/08-15/news-sample2.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('3', '1', '1', 'uploads/2018/08-15/news-sample3.jpg', 'uploads/2018/08-15/news-sample3.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('4', '1', '1', 'uploads/2018/08-15/news-sample4.jpg', 'uploads/2018/08-15/news-sample4.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('5', '1', '1', 'uploads/2018/08-15/news-sample5.jpg', 'uploads/2018/08-15/news-sample5.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('6', '1', '2', 'uploads/2018/08-15/news-sample6.jpg', 'uploads/2018/08-15/news-header6.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('7', '1', '3', 'uploads/2018/08-15/news-sample6.jpg', 'uploads/2018/08-15/news-header6.jpg', '0', '1', '1', '2018-08-15 17:31:45', '1', '2018-08-15 17:31:48', '127.0.0.1');
INSERT INTO `yu_news` VALUES ('13', '1', '6', 'uploads/2018/08-15/news-sample6.jpg', '', '1', '1', '1', '2018-09-12 15:58:40', '2', '2018-09-21 18:14:14', '127.0.0.1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of yu_news_comment
-- ----------------------------
INSERT INTO `yu_news_comment` VALUES ('1', '6', '3', 'yang', '534456541dfsgsdfgewrt', '1', '1536916436', '0');

-- ----------------------------
-- Table structure for yu_news_content
-- ----------------------------
DROP TABLE IF EXISTS `yu_news_content`;
CREATE TABLE `yu_news_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL COMMENT '消息id',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` text COMMENT '描述',
  `date` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `content` text COMMENT '内容',
  `banner` text CHARACTER SET utf8 NOT NULL COMMENT '底部滚动图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息内容表';

-- ----------------------------
-- Records of yu_news_content
-- ----------------------------
INSERT INTO `yu_news_content` VALUES ('1', '1', '1', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('2', '2', '1', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('3', '3', '1', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('4', '4', '1', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('5', '5', '1', 'WORKSHOP', 'Make sure you’re ready for GDPR', '1518105600', '\r\n    <div class=\"date\">DECEMBER 7, 2017</div>\r\n      <h1 class=\"sessionTitle\">The Wow Company <br>– Evolving an Established Brand</h1>\r\n      <div class=\"paragh\"><p>Mi-kaisha, a proud Dharumbal Murri performer and songwriter, is among 20 Indigenous scholars at the independent, secular, coeducational and bilingual school based in Ultimo, near the University of Sydney, UTS and Notre Dame.</p>\r\n\r\n      <p>“Mi-kaisha is an outstanding young woman whose leadership qualities and awe-inspiring talents are appreciated by all at our school and in the wider community,” said IGS Principal Shauna Colnan. “I am excited to see Mi-kaisha make her mark on our school as Head Girl 2018.”</p>\r\n\r\n      <p>Mi-kaisha made headlines in 2016 opening NAIDOC Week celebrations in Hyde Park, Sydney. Mi-kaisha, who has been at IGS since Kindergarten, performed one of her own compositions, Tell me why, about breaking down stereotypes, during IGS Speech Night celebrations at the State Theatre, just before her appointment was announced.</p>\r\n\r\n      <p>Mi-kaisha, 17, will lead the school student body with IGS 2018 Head Boy Lukian Adams. The audience of parents, students and staff erupted into cheers at the announcement of both student leaders.</p>\r\n    </div>', '[{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Make sure you\\u2019re ready for GDPR\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('6', '1', '2', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一个既定品牌的演变</h1>\r\n      <div class=\"paragh\"><p>米凯莎，一个自豪的Dharumbal Murri表演者和作曲家，是20个土著学者在独立，世俗，男女同校，双语学校的基础上，在悉尼大学，UTS和圣母院附近的最后一个。</p>\r\n\r\n      <p>“米凯莎是一位杰出的年轻女性，她的领导才能和令人敬畏的才华受到了我们学校和广大社区的赞赏。“我很高兴看到米凯莎在我们学校当头号女孩2018。”</p>\r\n\r\n      <p>米凯莎在2016悉尼海德公园举行的NIDOC周庆祝活动上登上了头条。米凯莎，自从幼儿园毕业后就一直在IGS上表演她自己的作品，告诉我为什么，在她宣布约会之前，在国家剧院的IGS演讲夜庆祝活动中打破了刻板印象。</p>\r\n\r\n      <p>17岁的米凯莎将与IGS 2018校长Boy Lukian Adams领导学校的学生团体。家长、学生和工作人员在两位学生领袖的宣布下爆发了喝彩声。</p>\r\n    </div>', '    [{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('7', '2', '2', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一个既定品牌的演变</h1>\r\n      <div class=\"paragh\"><p>米凯莎，一个自豪的Dharumbal Murri表演者和作曲家，是20个土著学者在独立，世俗，男女同校，双语学校的基础上，在悉尼大学，UTS和圣母院附近的最后一个。</p>\r\n\r\n      <p>“米凯莎是一位杰出的年轻女性，她的领导才能和令人敬畏的才华受到了我们学校和广大社区的赞赏。“我很高兴看到米凯莎在我们学校当头号女孩2018。”</p>\r\n\r\n      <p>米凯莎在2016悉尼海德公园举行的NIDOC周庆祝活动上登上了头条。米凯莎，自从幼儿园毕业后就一直在IGS上表演她自己的作品，告诉我为什么，在她宣布约会之前，在国家剧院的IGS演讲夜庆祝活动中打破了刻板印象。</p>\r\n\r\n      <p>17岁的米凯莎将与IGS 2018校长Boy Lukian Adams领导学校的学生团体。家长、学生和工作人员在两位学生领袖的宣布下爆发了喝彩声。</p>\r\n    </div>', '    [{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('8', '3', '2', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一个既定品牌的演变</h1>\r\n      <div class=\"paragh\"><p>米凯莎，一个自豪的Dharumbal Murri表演者和作曲家，是20个土著学者在独立，世俗，男女同校，双语学校的基础上，在悉尼大学，UTS和圣母院附近的最后一个。</p>\r\n\r\n      <p>“米凯莎是一位杰出的年轻女性，她的领导才能和令人敬畏的才华受到了我们学校和广大社区的赞赏。“我很高兴看到米凯莎在我们学校当头号女孩2018。”</p>\r\n\r\n      <p>米凯莎在2016悉尼海德公园举行的NIDOC周庆祝活动上登上了头条。米凯莎，自从幼儿园毕业后就一直在IGS上表演她自己的作品，告诉我为什么，在她宣布约会之前，在国家剧院的IGS演讲夜庆祝活动中打破了刻板印象。</p>\r\n\r\n      <p>17岁的米凯莎将与IGS 2018校长Boy Lukian Adams领导学校的学生团体。家长、学生和工作人员在两位学生领袖的宣布下爆发了喝彩声。</p>\r\n    </div>', '    [{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('9', '4', '2', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一个既定品牌的演变</h1>\r\n      <div class=\"paragh\"><p>米凯莎，一个自豪的Dharumbal Murri表演者和作曲家，是20个土著学者在独立，世俗，男女同校，双语学校的基础上，在悉尼大学，UTS和圣母院附近的最后一个。</p>\r\n\r\n      <p>“米凯莎是一位杰出的年轻女性，她的领导才能和令人敬畏的才华受到了我们学校和广大社区的赞赏。“我很高兴看到米凯莎在我们学校当头号女孩2018。”</p>\r\n\r\n      <p>米凯莎在2016悉尼海德公园举行的NIDOC周庆祝活动上登上了头条。米凯莎，自从幼儿园毕业后就一直在IGS上表演她自己的作品，告诉我为什么，在她宣布约会之前，在国家剧院的IGS演讲夜庆祝活动中打破了刻板印象。</p>\r\n\r\n      <p>17岁的米凯莎将与IGS 2018校长Boy Lukian Adams领导学校的学生团体。家长、学生和工作人员在两位学生领袖的宣布下爆发了喝彩声。</p>\r\n    </div>', '    [{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('10', '5', '2', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一个既定品牌的演变</h1>\r\n      <div class=\"paragh\"><p>米凯莎，一个自豪的Dharumbal Murri表演者和作曲家，是20个土著学者在独立，世俗，男女同校，双语学校的基础上，在悉尼大学，UTS和圣母院附近的最后一个。</p>\r\n\r\n      <p>“米凯莎是一位杰出的年轻女性，她的领导才能和令人敬畏的才华受到了我们学校和广大社区的赞赏。“我很高兴看到米凯莎在我们学校当头号女孩2018。”</p>\r\n\r\n      <p>米凯莎在2016悉尼海德公园举行的NIDOC周庆祝活动上登上了头条。米凯莎，自从幼儿园毕业后就一直在IGS上表演她自己的作品，告诉我为什么，在她宣布约会之前，在国家剧院的IGS演讲夜庆祝活动中打破了刻板印象。</p>\r\n\r\n      <p>17岁的米凯莎将与IGS 2018校长Boy Lukian Adams领导学校的学生团体。家长、学生和工作人员在两位学生领袖的宣布下爆发了喝彩声。</p>\r\n    </div>', '    [{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"确保你已经准备好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('11', '1', '3', 'WORKSHOP', '确保你已经准备好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一個既定品牌的演變</h1>\r\n      <div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p>\r\n\r\n      <p>“米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。“我很高興看到米凱莎在我們學校當頭號女孩2018。”</p>\r\n\r\n      <p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p>\r\n\r\n      <p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p>\r\n    </div>', '[{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('12', '2', '3', 'WORKSHOP', '確保你已經準備好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一個既定品牌的演變</h1>\r\n      <div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p>\r\n\r\n      <p>“米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。“我很高興看到米凱莎在我們學校當頭號女孩2018。”</p>\r\n\r\n      <p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p>\r\n\r\n      <p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p>\r\n    </div>', '[{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('13', '3', '3', 'WORKSHOP', '確保你已經準備好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一個既定品牌的演變</h1>\r\n      <div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p>\r\n\r\n      <p>“米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。“我很高興看到米凱莎在我們學校當頭號女孩2018。”</p>\r\n\r\n      <p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p>\r\n\r\n      <p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p>\r\n    </div>', '[{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('14', '4', '3', 'WORKSHOP', '確保你已經準備好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一個既定品牌的演變</h1>\r\n      <div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p>\r\n\r\n      <p>“米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。“我很高興看到米凱莎在我們學校當頭號女孩2018。”</p>\r\n\r\n      <p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p>\r\n\r\n      <p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p>\r\n    </div>', '[{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('15', '5', '3', 'WORKSHOP', '確保你已經準備好了GDPR', '1518105600', '\r\n    <div class=\"date\">2017年12月7日</div>\r\n      <h1 class=\"sessionTitle\">WOW公司<br>——一個既定品牌的演變</h1>\r\n      <div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p>\r\n\r\n      <p>“米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。“我很高興看到米凱莎在我們學校當頭號女孩2018。”</p>\r\n\r\n      <p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p>\r\n\r\n      <p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p>\r\n    </div>', '[{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"確保你已經準備好了GDPR\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('16', '6', '1', 'MEDIA', 'Hong Kong Baptist University', '1518105600', '<p><b>Hong Kong Baptist University</b> (HKBU) (<a href=\"https://en.wikipedia.org/wiki/Traditional_Chinese_characters\" title=\"Traditional Chinese characters\">Chinese</a>: <span lang=\"zh-Hant\">香港浸會大學</span>) is a publicly funded tertiary institution with a <a href=\"/wiki/Christian_ethics\" title=\"Christian ethics\">Christian education</a> heritage. It was established as <b>Hong Kong Baptist College</b> with the support of American Baptists, who provided both operating and construction funds and personnel to the school in its early years. It became a public college in 1983.\r\n</p>\r\n<p>It became Hong Kong Baptist University in 1994 during the presidency of Dr. <a href=\"/wiki/Daniel_Tse\" title=\"Daniel Tse\">Daniel Tse</a> Chi-wai, <a href=\"/wiki/Legum_Doctor\" title=\"Legum Doctor\">LLD</a>, <a href=\"/wiki/Gold_Bauhinia_Star\" title=\"Gold Bauhinia Star\">GBS</a>, <a href=\"/wiki/Order_of_the_British_Empire\" title=\"Order of the British Empire\">CBE</a>, <a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"Justice of the Peace\">JP</a>, who succeeded the Founding President, Dr. Lam Chi-fung,<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\">[1]</a></sup> as the second president of the University in 1971. After 30 years of services to the University, Dr. Daniel Tse Chi-wai retired in 2001 and Prof. <a href=\"/wiki/Ng_Ching-fai\" title=\"Ng Ching-fai\">Ng Ching-fai</a>, GBS, was appointed as the third president of the University. In 2010, Prof. Albert Chan Sun-chi assumed office as the fourth president of HKBU.\r\n</p>\r\n<p>HKBU has five main campuses: Ho Sin Hang Campus (1966), Shaw Campus (1995), Baptist University Road Campus (1998), <a href=\"/wiki/RAF_Kai_Tak\" title=\"RAF Kai Tak\">Kai Tak Campus</a> (2005), and Shek Mun Campus (2006) for the College of International Education and the Hong Kong Baptist University Affiliated School Wong Kam Fai Secondary and Primary School. The first three campuses are located in the urban heart of <a href=\"/wiki/Kowloon_Tong\" title=\"Kowloon Tong\">Kowloon Tong</a>, while the Kai Tak Campus is located on <a href=\"/wiki/Kwun_Tong_Road\" title=\"Kwun Tong Road\">Kwun Tong Road</a> and the Shek Mun Campus in <a href=\"/wiki/Sha_Tin\" title=\"Sha Tin\">Sha Tin</a>.\r\n</p>\r\n<p>In 2005, the University established the Beijing Normal University – Hong Kong Baptist University United International College (UIC) in Zhuhai, China. The college was the first tertiary education institution founded through collaboration between a Mainland university and a Hong Kong university. \r\n</p>', '[{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('17', '6', '2', 'MEDIA', '香港浸会大学', '1518105600', '<p><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（浸大）（</font></font><a href=\"/wiki/Traditional_Chinese_characters\" title=\"繁体中文\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">中国</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">：</font></font><span lang=\"zh-Hant\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学</font></font></span><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">）是一个政府资助的高等教育院校与</font></font><a href=\"/wiki/Christian_ethics\" title=\"基督教伦理\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">基督教教育</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">传统。</font><font style=\"vertical-align: inherit;\">它是</font><font style=\"vertical-align: inherit;\">在美国浸信会的支持下</font><font style=\"vertical-align: inherit;\">成立的</font></font><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会学院</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，美国浸信会早年为学校提供经营和建设资金和人员。</font><font style=\"vertical-align: inherit;\">它于1983年成为一所公立大学。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">它于1994年在</font></font><a href=\"/wiki/Daniel_Tse\" title=\"谢霆锋\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Daniel Tse</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Chi-wai </font><font style=\"vertical-align: inherit;\">博士</font><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Legum_Doctor\" title=\"Legum医生\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">LLD</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Gold_Bauhinia_Star\" title=\"金紫荆星\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">GBS</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Order_of_the_British_Empire\" title=\"大英帝国的秩序\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">CBE</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"和平的正义\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">JP</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">担任总统期间成为香港浸会大学</font><font style=\"vertical-align: inherit;\">，后者接替了创始会长林志峰博士</font></font><sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">[1]</font></font></a></sup><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">担任第二任会长。大学于1971年为大学服务30年后，谢志伟博士于2001年退休</font><font style=\"vertical-align: inherit;\">，GBS </font></font><a href=\"/wiki/Ng_Ching-fai\" title=\"吴清辉\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">的吴清辉</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">教授</font><font style=\"vertical-align: inherit;\">被任命为该大学的第三任校长。</font><font style=\"vertical-align: inherit;\">2010年，Albert Chan Sun-chi教授担任香港浸会大学第四任校长。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学有五个主要校区：何仙坑校区（1966），邵氏校区（1995），浸会大学路校园（1998），</font></font><a href=\"/wiki/RAF_Kai_Tak\" title=\"皇家空军启德\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">启德校区</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（2005）及石门校区（20&#8203;&#8203;06），为国际教育学院及香港浸会大学附属学校黄锦辉中小学。</font><font style=\"vertical-align: inherit;\">前三个校区位于</font></font><a href=\"/wiki/Kowloon_Tong\" title=\"九龙塘\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">九龙塘的</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">市中心</font><font style=\"vertical-align: inherit;\">，而启德校区则位于</font></font><a href=\"/wiki/Kwun_Tong_Road\" title=\"观塘道\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">观塘道</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">及</font></font><a href=\"/wiki/Sha_Tin\" title=\"沙田\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">沙田</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">石门校区</font><font style=\"vertical-align: inherit;\">。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">2005年，大学在中国珠海成立了北京师范大学 - 香港浸会大学联合国际学院（UIC）。</font><font style=\"vertical-align: inherit;\">该学院是第一所通过内地大学和香港大学合作建立的高等教育机构。 \r\n</font></font></p>', '[{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('18', '6', '3', 'MEDIA', '香港浸會大學', '1518105600', '<p><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（浸大）（</font></font><a href=\"/wiki/Traditional_Chinese_characters\" title=\"繁体中文\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">中國</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">：</font></font><span lang=\"zh-Hant\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學</font></font></span><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">）是一個政府資助的高等教育院校與</font></font><a href=\"/wiki/Christian_ethics\" title=\"基督教倫理\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">基督教教育</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">传统。</font><font style=\"vertical-align: inherit;\">它是</font><font style=\"vertical-align: inherit;\">在美國浸信會的支持下</font><font style=\"vertical-align: inherit;\">成立的</font></font><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸會學院</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸會學院，美國浸信會早年為學校提供經營和建設資金和人員。</font><font style=\"vertical-align: inherit;\">它於1983年成為一所公立大學。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">它于1994年在</font></font><a href=\"/wiki/Daniel_Tse\" title=\"謝霆鋒\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Daniel Tse</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Chi-wai </font><font style=\"vertical-align: inherit;\">博士</font><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Legum_Doctor\" title=\"Legum醫生\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">LLD</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Gold_Bauhinia_Star\" title=\"金紫荆星\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">GBS</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Order_of_the_British_Empire\" title=\"大英帝國的秩序\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">CBE</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"和平的正义\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">JP</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">擔任總統期間成為香港浸浸會大學</font><font style=\"vertical-align: inherit;\">，後者接替了創始會長林志峰博士</font></font><sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">[1]</font></font></a></sup><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">擔任第二任會長。大學於1971年為大學服務30年後，謝志偉博士於2001年退休</font><font style=\"vertical-align: inherit;\">，GBS </font></font><a href=\"/wiki/Ng_Ching-fai\" title=\"吳清輝\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">的吴清辉</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">教授</font><font style=\"vertical-align: inherit;\">被任命為該大學的第三任校長。</font><font style=\"vertical-align: inherit;\">2010年，Albert Chan Sun-chi教授擔任香港浸浸會大學第四任校長。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學有五個主要校區：何仙坑校區（1966），邵氏校區（1995），浸浸會大學路校園（1998），</font></font><a href=\"/wiki/RAF_Kai_Tak\" title=\"皇家空軍啟德\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">啟德校區</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（2005）及石门校区（20&#8203;&#8203;06），為國際教育學院及香港浸浸會大學附屬學校黃錦輝中小學。</font><font style=\"vertical-align: inherit;\">前三個校區位於</font></font><a href=\"/wiki/Kowloon_Tong\" title=\"九龍塘\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">九龍塘的</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">市中心</font><font style=\"vertical-align: inherit;\">，而啟德校區則位於</font></font><a href=\"/wiki/Kwun_Tong_Road\" title=\"觀塘道\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">觀塘道</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">及</font></font><a href=\"/wiki/Sha_Tin\" title=\"沙田\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">沙田</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">石门校区</font><font style=\"vertical-align: inherit;\">。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">2005年，大學在中國珠海成立了北京師範大學-香港浸浸會大學聯合國際學院（UIC）。</font><font style=\"vertical-align: inherit;\">該學院是第一所通過內地大學和香港大學合作建立的高等教育機构。 \r\n</font></font></p>', '[{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('19', '7', '1', 'PRESS', 'Hong Kong Baptist University', '1518105600', '<p><b>Hong Kong Baptist University</b> (HKBU) (<a href=\"https://en.wikipedia.org/wiki/Traditional_Chinese_characters\" title=\"Traditional Chinese characters\">Chinese</a>: <span lang=\"zh-Hant\">香港浸會大學</span>) is a publicly funded tertiary institution with a <a href=\"/wiki/Christian_ethics\" title=\"Christian ethics\">Christian education</a> heritage. It was established as <b>Hong Kong Baptist College</b> with the support of American Baptists, who provided both operating and construction funds and personnel to the school in its early years. It became a public college in 1983.\r\n</p>\r\n<p>It became Hong Kong Baptist University in 1994 during the presidency of Dr. <a href=\"/wiki/Daniel_Tse\" title=\"Daniel Tse\">Daniel Tse</a> Chi-wai, <a href=\"/wiki/Legum_Doctor\" title=\"Legum Doctor\">LLD</a>, <a href=\"/wiki/Gold_Bauhinia_Star\" title=\"Gold Bauhinia Star\">GBS</a>, <a href=\"/wiki/Order_of_the_British_Empire\" title=\"Order of the British Empire\">CBE</a>, <a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"Justice of the Peace\">JP</a>, who succeeded the Founding President, Dr. Lam Chi-fung,<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\">[1]</a></sup> as the second president of the University in 1971. After 30 years of services to the University, Dr. Daniel Tse Chi-wai retired in 2001 and Prof. <a href=\"/wiki/Ng_Ching-fai\" title=\"Ng Ching-fai\">Ng Ching-fai</a>, GBS, was appointed as the third president of the University. In 2010, Prof. Albert Chan Sun-chi assumed office as the fourth president of HKBU.\r\n</p>\r\n<p>HKBU has five main campuses: Ho Sin Hang Campus (1966), Shaw Campus (1995), Baptist University Road Campus (1998), <a href=\"/wiki/RAF_Kai_Tak\" title=\"RAF Kai Tak\">Kai Tak Campus</a> (2005), and Shek Mun Campus (2006) for the College of International Education and the Hong Kong Baptist University Affiliated School Wong Kam Fai Secondary and Primary School. The first three campuses are located in the urban heart of <a href=\"/wiki/Kowloon_Tong\" title=\"Kowloon Tong\">Kowloon Tong</a>, while the Kai Tak Campus is located on <a href=\"/wiki/Kwun_Tong_Road\" title=\"Kwun Tong Road\">Kwun Tong Road</a> and the Shek Mun Campus in <a href=\"/wiki/Sha_Tin\" title=\"Sha Tin\">Sha Tin</a>.\r\n</p>\r\n<p>In 2005, the University established the Beijing Normal University – Hong Kong Baptist University United International College (UIC) in Zhuhai, China. The college was the first tertiary education institution founded through collaboration between a Mainland university and a Hong Kong university. \r\n</p>', '[{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"},{\"title\":\"Hong Kong Baptist University\",\"date\":\"1518105600\",\"image\":\"uploads\\/2018\\/08-15\\/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('20', '7', '2', 'PRESS', '香港浸会大学', '1518105600', '<p><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（浸大）（</font></font><a href=\"/wiki/Traditional_Chinese_characters\" title=\"繁体中文\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">中国</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">：</font></font><span lang=\"zh-Hant\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学</font></font></span><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">）是一个政府资助的高等教育院校与</font></font><a href=\"/wiki/Christian_ethics\" title=\"基督教伦理\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">基督教教育</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">传统。</font><font style=\"vertical-align: inherit;\">它是</font><font style=\"vertical-align: inherit;\">在美国浸信会的支持下</font><font style=\"vertical-align: inherit;\">成立的</font></font><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会学院</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，美国浸信会早年为学校提供经营和建设资金和人员。</font><font style=\"vertical-align: inherit;\">它于1983年成为一所公立大学。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">它于1994年在</font></font><a href=\"/wiki/Daniel_Tse\" title=\"谢霆锋\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Daniel Tse</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Chi-wai </font><font style=\"vertical-align: inherit;\">博士</font><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Legum_Doctor\" title=\"Legum医生\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">LLD</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Gold_Bauhinia_Star\" title=\"金紫荆星\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">GBS</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Order_of_the_British_Empire\" title=\"大英帝国的秩序\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">CBE</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"和平的正义\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">JP</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">担任总统期间成为香港浸会大学</font><font style=\"vertical-align: inherit;\">，后者接替了创始会长林志峰博士</font></font><sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">[1]</font></font></a></sup><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">担任第二任会长。大学于1971年为大学服务30年后，谢志伟博士于2001年退休</font><font style=\"vertical-align: inherit;\">，GBS </font></font><a href=\"/wiki/Ng_Ching-fai\" title=\"吴清辉\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">的吴清辉</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">教授</font><font style=\"vertical-align: inherit;\">被任命为该大学的第三任校长。</font><font style=\"vertical-align: inherit;\">2010年，Albert Chan Sun-chi教授担任香港浸会大学第四任校长。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸会大学有五个主要校区：何仙坑校区（1966），邵氏校区（1995），浸会大学路校园（1998），</font></font><a href=\"/wiki/RAF_Kai_Tak\" title=\"皇家空军启德\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">启德校区</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（2005）及石门校区（20&#8203;&#8203;06），为国际教育学院及香港浸会大学附属学校黄锦辉中小学。</font><font style=\"vertical-align: inherit;\">前三个校区位于</font></font><a href=\"/wiki/Kowloon_Tong\" title=\"九龙塘\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">九龙塘的</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">市中心</font><font style=\"vertical-align: inherit;\">，而启德校区则位于</font></font><a href=\"/wiki/Kwun_Tong_Road\" title=\"观塘道\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">观塘道</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">及</font></font><a href=\"/wiki/Sha_Tin\" title=\"沙田\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">沙田</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">石门校区</font><font style=\"vertical-align: inherit;\">。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">2005年，大学在中国珠海成立了北京师范大学 - 香港浸会大学联合国际学院（UIC）。</font><font style=\"vertical-align: inherit;\">该学院是第一所通过内地大学和香港大学合作建立的高等教育机构。 \r\n</font></font></p>', '[{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸会大学\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('21', '7', '3', 'PRESS', '香港浸會大學', '1518105600', '<p><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（浸大）（</font></font><a href=\"/wiki/Traditional_Chinese_characters\" title=\"繁体中文\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">中國</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">：</font></font><span lang=\"zh-Hant\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學</font></font></span><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">）是一個政府資助的高等教育院校與</font></font><a href=\"/wiki/Christian_ethics\" title=\"基督教倫理\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">基督教教育</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">传统。</font><font style=\"vertical-align: inherit;\">它是</font><font style=\"vertical-align: inherit;\">在美國浸信會的支持下</font><font style=\"vertical-align: inherit;\">成立的</font></font><b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸會學院</font></font></b><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸會學院，美國浸信會早年為學校提供經營和建設資金和人員。</font><font style=\"vertical-align: inherit;\">它於1983年成為一所公立大學。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">它于1994年在</font></font><a href=\"/wiki/Daniel_Tse\" title=\"謝霆鋒\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Daniel Tse</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Chi-wai </font><font style=\"vertical-align: inherit;\">博士</font><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Legum_Doctor\" title=\"Legum醫生\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">LLD</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Gold_Bauhinia_Star\" title=\"金紫荆星\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">GBS</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Order_of_the_British_Empire\" title=\"大英帝國的秩序\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">CBE</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">，</font></font><a href=\"/wiki/Justice_of_the_Peace\" class=\"mw-redirect\" title=\"和平的正义\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">JP</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">擔任總統期間成為香港浸浸會大學</font><font style=\"vertical-align: inherit;\">，後者接替了創始會長林志峰博士</font></font><sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">[1]</font></font></a></sup><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">擔任第二任會長。大學於1971年為大學服務30年後，謝志偉博士於2001年退休</font><font style=\"vertical-align: inherit;\">，GBS </font></font><a href=\"/wiki/Ng_Ching-fai\" title=\"吳清輝\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">的吴清辉</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">教授</font><font style=\"vertical-align: inherit;\">被任命為該大學的第三任校長。</font><font style=\"vertical-align: inherit;\">2010年，Albert Chan Sun-chi教授擔任香港浸浸會大學第四任校長。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">香港浸浸會大學有五個主要校區：何仙坑校區（1966），邵氏校區（1995），浸浸會大學路校園（1998），</font></font><a href=\"/wiki/RAF_Kai_Tak\" title=\"皇家空軍啟德\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">啟德校區</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">（2005）及石门校区（20&#8203;&#8203;06），為國際教育學院及香港浸浸會大學附屬學校黃錦輝中小學。</font><font style=\"vertical-align: inherit;\">前三個校區位於</font></font><a href=\"/wiki/Kowloon_Tong\" title=\"九龍塘\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">九龍塘的</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">市中心</font><font style=\"vertical-align: inherit;\">，而啟德校區則位於</font></font><a href=\"/wiki/Kwun_Tong_Road\" title=\"觀塘道\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">觀塘道</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">及</font></font><a href=\"/wiki/Sha_Tin\" title=\"沙田\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">沙田</font></font></a><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">石门校区</font><font style=\"vertical-align: inherit;\">。\r\n</font></font></p>\r\n<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">2005年，大學在中國珠海成立了北京師範大學-香港浸浸會大學聯合國際學院（UIC）。</font><font style=\"vertical-align: inherit;\">該學院是第一所通過內地大學和香港大學合作建立的高等教育機构。 \r\n</font></font></p>', '[{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"},{\"title\":\"香港浸會大學\",\"date\":\"1518105600\",\"image\":\"uploads/2018/08-15/relatedSample.jpg\"}]');
INSERT INTO `yu_news_content` VALUES ('22', '8', '1', '大青蛙多', '123123', '1518105600', '<p>123123</p>', '');
INSERT INTO `yu_news_content` VALUES ('23', '9', '1', 'second', 'dwqdwqdqwdq', '1536827377', '<p>这是内容</p>', '');
INSERT INTO `yu_news_content` VALUES ('24', '10', '1', '123', '123', '1518105600', '<p>123123313213213</p>', '');
INSERT INTO `yu_news_content` VALUES ('25', '11', '1', 'title', 'miaosu', '1518105600', '<p>这是内容</p>', '');
INSERT INTO `yu_news_content` VALUES ('26', '11', '2', '标题', '描素', '1518105600', '<p>这是内容</p>', '');
INSERT INTO `yu_news_content` VALUES ('27', '11', '3', '标题繁', '描述繁', '1518105600', '<p>这是内容</p>', '');
INSERT INTO `yu_news_content` VALUES ('28', '12', '1', 'dqw', 'dwq', '1537415325', '<p>dwqdwqdwqdqd Update<img src=\"http://192.168.0.146/yucolab.cq.com/public/uploads/2018/0920/editor/1559179091_1537415320.jpg\" style=\"width: 471px;\" class=\"fr-fic fr-dib\"></p>', '');
INSERT INTO `yu_news_content` VALUES ('29', '12', '2', 'dqw', 'dwq', '1518105600', '<p>dwqdwqdwqdqd</p>', '');
INSERT INTO `yu_news_content` VALUES ('30', '12', '3', 'dwqd', 'qwd', '1518105600', '<p>dwqdwqdwqdqd</p>', '');
INSERT INTO `yu_news_content` VALUES ('31', '13', '1', 'lr简体2', 'lr简体2', '1537414378', '<div class=\"date\"><img src=\"http://47.75.35.19/public/uploads/2018/0920/editor/916758660_1537414333.jpg\" style=\"width: 831px;\" class=\"fr-fic fr-dib\"></div><div class=\"date\">2017年12月7日</div><h1 class=\"sessionTitle\">WOW公司<br>&mdash;&mdash;一個既定品牌的演變</h1><div class=\"paragh\"><p>米凱莎，一個自豪的Dharumbal Murri表演者和作曲家，是20個土著學者在獨立，世俗，男女同校，雙語學校的基礎上，在悉尼大學，UTS和聖母院附近的最後一個。</p><p>&ldquo;米凱莎是一比特傑出的年輕女性，她的領導才能和令人敬畏的才華受到了我們學校和廣大社區的讚賞。&ldquo;我很高興看到米凱莎在我們學校當頭號女孩2018。&rdquo;</p><p>米凱莎在2016雪梨海德公園舉行的NIDOC周慶祝活動上登上了頭條。米凱莎，自從幼儿園畢業後就一直在IGS上表演她自己的作品，告訴我為什麼，在她宣佈約會之前，在國家劇院的IGS演講夜慶祝活動中打破了刻板印象。</p><p>17歲的米凱莎將與IGS 2018校長Boy Lukian Adams領導學校的學生團體。家長、學生和工作人員在兩位學生領袖的宣佈下爆發了喝彩聲。</p></div>', '');
INSERT INTO `yu_news_content` VALUES ('32', '13', '2', '测试标题简体', '测试描述繁体', '1536739120', '<p>简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体简体</p>', '');
INSERT INTO `yu_news_content` VALUES ('33', '13', '3', 'PRESS修改', '香港浸會大學修改', '1537524854', '<p><br></p><p><strong>香港浸浸會大學</strong>（浸大）（<a href=\"/wiki/Traditional_Chinese_characters\" title=\"繁体中文\">中國</a>：<span lang=\"zh-Hant\">香港浸浸會大學</span>）是一個政府資助的高等教育院校與<a href=\"/wiki/Christian_ethics\" title=\"基督教倫理\">基督教教育</a>传统。它是在美國浸信會的支持下成立的<strong>香港浸會學院</strong>香港浸會學院，美國浸信會早年為學校提供經營和建設資金和人員。它於1983年成為一所公立大學。</p><p>它于1994年在<a href=\"/wiki/Daniel_Tse\" title=\"謝霆鋒\">Daniel Tse</a> Chi-wai 博士，<a href=\"/wiki/Legum_Doctor\" title=\"Legum醫生\">LLD</a>，<a href=\"/wiki/Gold_Bauhinia_Star\" title=\"金紫荆星\">GBS</a>，<a href=\"/wiki/Order_of_the_British_Empire\" title=\"大英帝國的秩序\">CBE</a>，<a class=\"mw-redirect\" href=\"/wiki/Justice_of_the_Peace\" title=\"和平的正义\">JP</a>擔任總統期間成為香港浸浸會大學，後者接替了創始會長林志峰博士<sup class=\"reference\" id=\"cite_ref-1\"><a href=\"#cite_note-1\">[1]</a></sup>擔任第二任會長。大學於1971年為大學服務30年後，謝志偉博士於2001年退休，GBS <a href=\"/wiki/Ng_Ching-fai\" title=\"吳清輝\">的吴清辉</a>教授被任命為該大學的第三任校長。2010年，Albert Chan Sun-chi教授擔任香港浸浸會大學第四任校長。</p><p>香港浸浸會大學有五個主要校區：何仙坑校區（1966），邵氏校區（1995），浸浸會大學路校園（1998），<a href=\"/wiki/RAF_Kai_Tak\" title=\"皇家空軍啟德\">啟德校區</a>（2005）及石门校区（2006），為國際教育學院及香港浸浸會大學附屬學校黃錦輝中小學。前三個校區位於<a href=\"/wiki/Kowloon_Tong\" title=\"九龍塘\">九龍塘的</a>市中心，而啟德校區則位於<a href=\"/wiki/Kwun_Tong_Road\" title=\"觀塘道\">觀塘道</a>及<a href=\"/wiki/Sha_Tin\" title=\"沙田\">沙田</a>石门校区。</p><p>2005年，大學在中國珠海成立了北京師範大學-香港浸浸會大學聯合國際學院（UIC）。該學院是第一所通過內地大學和香港大學合作建立的高等教育機构。</p><p><br></p><p>文字更新</p><p><img src=\"data:image/jpeg;base64,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', '');

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
INSERT INTO `yu_news_type` VALUES ('1', '1', '1', '2018-08-15 15:48:43', '2', '0000-00-00 00:00:00', '192.168.0.146');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='最新消息类型名称';

-- ----------------------------
-- Records of yu_news_typename
-- ----------------------------
INSERT INTO `yu_news_typename` VALUES ('1', '1', 'workshop', '1');
INSERT INTO `yu_news_typename` VALUES ('2', '1', 'media', '2');
INSERT INTO `yu_news_typename` VALUES ('3', '1', 'press', '3');
INSERT INTO `yu_news_typename` VALUES ('4', '2', '车间', '1');
INSERT INTO `yu_news_typename` VALUES ('5', '2', '媒体', '2');
INSERT INTO `yu_news_typename` VALUES ('6', '2', '按', '3');
INSERT INTO `yu_news_typename` VALUES ('7', '3', '車間', '1');
INSERT INTO `yu_news_typename` VALUES ('8', '3', '媒體', '2');
INSERT INTO `yu_news_typename` VALUES ('9', '3', '按', '3');

-- ----------------------------
-- Table structure for yu_opinion
-- ----------------------------
DROP TABLE IF EXISTS `yu_opinion`;
CREATE TABLE `yu_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '姓名',
  `email` char(20) DEFAULT NULL COMMENT '电子邮箱',
  `tel` char(20) DEFAULT NULL COMMENT '电话',
  `content` text COMMENT '内容',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `ip` char(20) NOT NULL DEFAULT '' COMMENT '提交ip',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='意见表';

-- ----------------------------
-- Records of yu_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for yu_order
-- ----------------------------
DROP TABLE IF EXISTS `yu_order`;
CREATE TABLE `yu_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣券编号 如果为0则未使用折扣券',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员编号 用于管理员订票',
  `schedule_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '预定日程编号',
  `order_no` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `total` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价',
  `discount` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '折扣金额',
  `pay` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `title` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '称谓 1先生 2女生 3小姐',
  `first_name` char(50) NOT NULL DEFAULT '' COMMENT '名',
  `last_name` char(50) NOT NULL DEFAULT '' COMMENT '姓',
  `phone` char(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` char(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `group_name` char(100) NOT NULL DEFAULT '' COMMENT '团体名称 团体类型必填',
  `visitor_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订票数量成人',
  `child_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订票数量儿童',
  `grade` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '年级 1 P1 2 P2 3 P3',
  `group_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '团体类别 1慈善团体 2社福机构 3注册社团 4注册公司 5学校及大专院校 6政府决策局/部门及公营机构 7其它团体',
  `is_receive` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否用当前邮箱接收所有启动码 0否 1是',
  `is_group` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否团体 0否 1是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已完成 3已取消 4已退款',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `creator` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人编号',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `modifier` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定票订单表';

-- ----------------------------
-- Records of yu_order
-- ----------------------------

-- ----------------------------
-- Table structure for yu_paypal
-- ----------------------------
DROP TABLE IF EXISTS `yu_paypal`;
CREATE TABLE `yu_paypal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `invoice` char(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `txn_id` char(100) NOT NULL DEFAULT '' COMMENT '回调编号',
  `total` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `status` char(50) NOT NULL DEFAULT '' COMMENT '请求状态',
  `state` char(50) NOT NULL DEFAULT '' COMMENT '支付状态',
  `result` text NOT NULL COMMENT '回调结果',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='paypal回调结果';

-- ----------------------------
-- Records of yu_paypal
-- ----------------------------

-- ----------------------------
-- Table structure for yu_schedule
-- ----------------------------
DROP TABLE IF EXISTS `yu_schedule`;
CREATE TABLE `yu_schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日程日期',
  `start_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间 时分',
  `end_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型 语言表编号',
  `max_visitor` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最大访问人数',
  `visitor_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当前成人订票数量',
  `max_child` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最大访问儿童数量',
  `child_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当前儿童订票数量',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态 0否 1是',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程表';

-- ----------------------------
-- Records of yu_schedule
-- ----------------------------
INSERT INTO `yu_schedule` VALUES ('1', '1537804800', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('2', '1537804800', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('3', '1537804800', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('4', '1537804800', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('8', '1537891200', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('9', '1537891200', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('10', '1537891200', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('11', '1537891200', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('12', '1537891200', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('13', '1537891200', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('15', '1537977600', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('16', '1537977600', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('17', '1537977600', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('18', '1537977600', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('19', '1537977600', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('20', '1537977600', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('22', '1538064000', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('23', '1538064000', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('24', '1538064000', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('25', '1538064000', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('26', '1538064000', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('27', '1538064000', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('29', '1538150400', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('30', '1538150400', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('31', '1538150400', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('32', '1538150400', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('36', '1538323200', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('37', '1538323200', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('38', '1538323200', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('39', '1538323200', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('43', '1538409600', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('44', '1538409600', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('45', '1538409600', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('46', '1538409600', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('47', '1538409600', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('48', '1538409600', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('50', '1538496000', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('51', '1538496000', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('52', '1538496000', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('53', '1538496000', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('54', '1538496000', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('55', '1538496000', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('57', '1538582400', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('58', '1538582400', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('59', '1538582400', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('60', '1538582400', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('61', '1538582400', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('62', '1538582400', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('64', '1538668800', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('65', '1538668800', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('66', '1538668800', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('67', '1538668800', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('68', '1538668800', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('69', '1538668800', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('71', '1538755200', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('72', '1538755200', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('73', '1538755200', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('74', '1538755200', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('78', '1539014400', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('79', '1539014400', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('80', '1539014400', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('81', '1539014400', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('82', '1539014400', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('83', '1539014400', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('85', '1539100800', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('86', '1539100800', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('87', '1539100800', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('88', '1539100800', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('89', '1539100800', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('90', '1539100800', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('92', '1539187200', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('93', '1539187200', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('94', '1539187200', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('95', '1539187200', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('96', '1539187200', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('97', '1539187200', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('99', '1539273600', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('100', '1539273600', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('101', '1539273600', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('102', '1539273600', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('103', '1539273600', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('104', '1539273600', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('106', '1539360000', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('107', '1539360000', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('108', '1539360000', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('109', '1539360000', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('113', '1539619200', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('114', '1539619200', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('115', '1539619200', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('116', '1539619200', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('117', '1539619200', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('118', '1539619200', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('120', '1539705600', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('121', '1539705600', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('122', '1539705600', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('123', '1539705600', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('127', '1539792000', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('128', '1539792000', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('129', '1539792000', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('130', '1539792000', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('131', '1539792000', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('132', '1539792000', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('134', '1539878400', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('135', '1539878400', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('136', '1539878400', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('137', '1539878400', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('138', '1539878400', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('139', '1539878400', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('141', '1539964800', '3600', '61140', '3', '10', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('142', '1539964800', '8400', '10800', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('143', '1539964800', '11400', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('144', '1539964800', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('148', '1540224000', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('149', '1540224000', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('150', '1540224000', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('151', '1540224000', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('152', '1540224000', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('153', '1540224000', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('155', '1540310400', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('156', '1540310400', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('157', '1540310400', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('158', '1540310400', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('159', '1540310400', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('160', '1540310400', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('162', '1540396800', '12000', '18000', '3', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('163', '1540396800', '11400', '18000', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('164', '1540396800', '18000', '21600', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('165', '1540396800', '28800', '30800', '2', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('166', '1540396800', '25200', '28800', '1', '30', '0', '10', '0', '0', '1', '1537804800', '1537804800');
INSERT INTO `yu_schedule` VALUES ('167', '1540396800', '28800', '30800', '1', '20', '0', '10', '0', '0', '1', '1537804800', '1537804800');

-- ----------------------------
-- Table structure for yu_schedule_config
-- ----------------------------
DROP TABLE IF EXISTS `yu_schedule_config`;
CREATE TABLE `yu_schedule_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日程类型编号',
  `language` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '语言类型',
  `start_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间 时分',
  `end_time` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `max_visitor` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最大访问人数',
  `max_child` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最大访问儿童数量',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程设置表';

-- ----------------------------
-- Records of yu_schedule_config
-- ----------------------------
INSERT INTO `yu_schedule_config` VALUES ('2', '1', '3', '12000', '18000', '30', '10', '0', '1534823126', '1536830486');
INSERT INTO `yu_schedule_config` VALUES ('3', '1', '2', '11400', '18000', '30', '10', '0', '1534823462', '1536218595');
INSERT INTO `yu_schedule_config` VALUES ('4', '1', '2', '18000', '21600', '30', '10', '0', '1534823483', '1534823483');
INSERT INTO `yu_schedule_config` VALUES ('5', '1', '2', '28800', '30800', '30', '10', '0', '1534823499', '1536218288');
INSERT INTO `yu_schedule_config` VALUES ('6', '1', '1', '25200', '28800', '30', '10', '0', '1534823515', '1534823515');
INSERT INTO `yu_schedule_config` VALUES ('7', '1', '1', '28800', '30800', '20', '10', '0', '1534823531', '1534823531');
INSERT INTO `yu_schedule_config` VALUES ('8', '2', '3', '3600', '61140', '10', '10', '0', '1534822276', '1536644743');
INSERT INTO `yu_schedule_config` VALUES ('9', '2', '3', '8400', '10800', '30', '10', '0', '1534823126', '1534823426');
INSERT INTO `yu_schedule_config` VALUES ('10', '2', '3', '11400', '18000', '30', '10', '0', '1534823462', '1534823462');
INSERT INTO `yu_schedule_config` VALUES ('12', '2', '1', '28800', '30800', '20', '10', '0', '1534823531', '1534823531');

-- ----------------------------
-- Table structure for yu_schedule_type
-- ----------------------------
DROP TABLE IF EXISTS `yu_schedule_type`;
CREATE TABLE `yu_schedule_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `name` char(50) NOT NULL DEFAULT '' COMMENT '开放时间模块名称',
  `week` char(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '星期 0-6 0为周日 json 数组 公众假期为7',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用 0否 1是',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='日程类型设置表';

-- ----------------------------
-- Records of yu_schedule_type
-- ----------------------------
INSERT INTO `yu_schedule_type` VALUES ('1', '周二－周五', '2,3,4,5', '1', '1534755504', '1534755907');
INSERT INTO `yu_schedule_type` VALUES ('2', '周六 公共假期', '7,6', '1', '1534755925', '1534755925');

-- ----------------------------
-- Table structure for yu_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yu_user_coupon`;
CREATE TABLE `yu_user_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户表编号 用于账户激活后折扣券归属',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣券编号',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单的编号',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户折扣使用记录表';

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

-- ----------------------------
-- Procedure structure for procedure_cancel_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_cancel_order`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_cancel_order`()
BEGIN
	DECLARE t_error INTEGER;
	DECLARE coupon_count INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;
	START TRANSACTION;

		/**还原日程访问人数**/
		UPDATE yu_schedule a INNER JOIN yu_order b ON b.schedule_id = a.id SET a.visitor_count = (cast(a.visitor_count as signed) - cast(b.visitor_count AS signed)),a.child_count = (cast(a.child_count as signed) - cast(b.child_count AS signed)),a.update_time =UNIX_TIMESTAMP(NOW()) WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800); 
		
		/**查询过期的未支付订单是否有折扣码**/
		SELECT count(id) INTO coupon_count FROM yu_order WHERE `status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(create_time as signed)>1800) AND coupon_id <>0; 
		
		/**判断有折扣代码的订单是否存在,如果存在还原折扣信息**/
		IF coupon_count>0 THEN

			/**删除折扣使用记录**/
			DELETE a FROM yu_user_coupon a INNER JOIN yu_order b ON b.coupon_id = a.coupon_id AND b.id = a.order_id WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800) AND b.coupon_id <>0; 
			
			/**还原过期未支付订单折扣码使用状态**/
			UPDATE yu_coupon a INNER JOIN yu_order b ON b.coupon_id = a.id SET a.`status` = 0,a.update_time =UNIX_TIMESTAMP(NOW()) WHERE b.`status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(b.create_time as signed)>1800) AND b.coupon_id <>0; 
			
			
		END IF;
		
		/**清除订单使用折扣码编号**/
		UPDATE yu_order SET coupon_id = 0,`status` = 3,update_time =UNIX_TIMESTAMP(NOW())  WHERE `status` = 0 AND (cast(UNIX_TIMESTAMP(NOW()) as signed)-cast(create_time as signed)>1800); 
		
		IF t_error = 1 THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procedure_schedule
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedure_schedule`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_schedule`()
BEGIN
	declare i int;
	declare datetime int;
	/*这种写法也可以：DECLARE done INT DEFAULT FALSE;*/
	DECLARE done int default 0;  /*用于判断是否结束循环*/
	/*用于存储结果集的记录*/
	DECLARE w CHAR(20); 
	/*用于记录公众假期记录数*/
	DECLARE holiday int; 
	/*用于记录公众假期类型编号*/
	DECLARE types_id int; 
	/*用于记录非公众假期日程类型编号*/
	DECLARE week_id int;
	/*用于记录日程表当前日期记录数*/
	DECLARE schedules int; 
	
	/* 查询公众假期 星期*/
	SELECT id into types_id FROM yu_schedule_type where locate('7',week)>0;
	
	/**从今天起算31天内日程更新 循环开始*/
	set i = 0;
	
	while i < 31 do
				start transaction;

				/**设置日程表当前日期时间默认值*/
				set schedules = 0;
				/**设置是否公众假期默认值*/
				set holiday = 0;
				/**当前循环日期时间戳*/
				set datetime = UNIX_TIMESTAMP(DATE_FORMAT(date_add(now(), interval i day),'%Y-%m-%d'));

				/**查询当前日期是否是公众假期**/
				SELECT count(id) into holiday FROM yu_holiday WHERE UNIX_TIMESTAMP(FROM_UNIXTIME(date,'%Y-%m-%d')) = datetime;
				/**查询当前日期日程是否已经存在*/
				SELECT count(id) into schedules from yu_schedule where UNIX_TIMESTAMP(FROM_UNIXTIME(date,'%Y-%m-%d')) = datetime;

				

				/**
				*判断当前日期是否是公众假期
				*如果是公众假期 week 7 日程导入公众假期日程locate(substr,str)
				*如果不是公众假期 循环遍历日程类型 周日是0 看是否存在 存在则到日对应日程 不存在则不导入
				*/
				IF (holiday>0)
				THEN

					/**如果当前日期记录不存在插入记录并更新*/
					IF (schedules = 0)
					THEN
						INSERT INTO yu_schedule (date,start_time,end_time,language,max_visitor,max_child,sort,create_time,update_time) SELECT datetime,start_time,end_time,language,max_visitor,max_child,0,UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')),UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')) FROM yu_schedule_config WHERE type_id =types_id;
					END IF;

				ELSE
					
					/**设置非公众假期日程类型编号默认值*/
					set week_id = 0;
					/**查询非公众假期日程类型编号**/
					SELECT id into week_id FROM yu_schedule_type where locate(FROM_UNIXTIME(datetime,'%w'),week)>0;

					/**判断当前日期是否设置了日程类型,如果存在日程类型根据日程类型更新数据*/
					IF (week_id>0)
					THEN
						
						/**如果当前日期记录不存在插入记录并更新,存在记录但是不全更新记录*/
						IF (schedules = 0)
						THEN
							INSERT INTO yu_schedule (date,start_time,end_time,language,max_visitor,max_child,sort,create_time,update_time) SELECT datetime,start_time,end_time,language,max_visitor,max_child,0,UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')),UNIX_TIMESTAMP(DATE_FORMAT(now(),'%Y-%m-%d')) FROM yu_schedule_config WHERE type_id =week_id;
						END IF;

					END if;

				END if;

				commit;
	set i = i +1;
	end while;
	/**从今天起算31天内日程更新 循环结束*/
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_cancel_order
-- ----------------------------
DROP EVENT IF EXISTS `event_cancel_order`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_cancel_order` ON SCHEDULE EVERY 5 MINUTE STARTS '2018-08-29 18:37:21' ON COMPLETION PRESERVE ENABLE DO CALL procedure_cancel_order()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_schedule
-- ----------------------------
DROP EVENT IF EXISTS `event_schedule`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_schedule` ON SCHEDULE EVERY 1 DAY STARTS '2018-08-24 00:00:00' ON COMPLETION PRESERVE ENABLE DO CALL procedure_schedule()
;;
DELIMITER ;

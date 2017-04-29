/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : 127.0.0.1:3306
Source Database       : uf

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2017-04-29 16:11:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uf_entry
-- ----------------------------
DROP TABLE IF EXISTS `uf_entry`;
CREATE TABLE `uf_entry` (
  `en_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_type` int(11) NOT NULL,
  `en_redundancy` varchar(100) DEFAULT NULL,
  `en_name` varchar(255) NOT NULL,
  PRIMARY KEY (`en_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uf_entry
-- ----------------------------
INSERT INTO `uf_entry` VALUES ('12', '0', null, '会员会费收入的70%');
INSERT INTO `uf_entry` VALUES ('13', '0', null, '校工会拨付的各项活动和奖励经费');
INSERT INTO `uf_entry` VALUES ('14', '0', null, '校工会拨付的各项补助经费');
INSERT INTO `uf_entry` VALUES ('15', '1', null, '开展的教职工教育活动');
INSERT INTO `uf_entry` VALUES ('16', '1', null, '开展的教职工文艺、体育和女工活动');
INSERT INTO `uf_entry` VALUES ('17', '1', null, '开展的宣传活动');
INSERT INTO `uf_entry` VALUES ('18', '1', null, '慰问困难教职工');
INSERT INTO `uf_entry` VALUES ('19', '1', null, '看望患病住院教职工');
INSERT INTO `uf_entry` VALUES ('20', '1', null, '撒旦法撒');
INSERT INTO `uf_entry` VALUES ('21', '1', null, '说的分手的');

-- ----------------------------
-- Table structure for uf_expenditurerecord
-- ----------------------------
DROP TABLE IF EXISTS `uf_expenditurerecord`;
CREATE TABLE `uf_expenditurerecord` (
  `er_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `er_date` date DEFAULT NULL,
  `er_entry_id` int(11) DEFAULT NULL,
  `er_money` double(11,2) DEFAULT '0.00',
  `er_user_id` int(11) DEFAULT NULL,
  `er_accour_repour` varchar(100) DEFAULT NULL,
  `er_redundancy` varchar(100) DEFAULT NULL,
  `er_union_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`er_id`),
  KEY `fk_expenditure_union` (`er_union_id`),
  KEY `fk_expenditurerecord_entry` (`er_entry_id`),
  KEY `fk_expenditurerecord_user` (`er_user_id`),
  CONSTRAINT `fk_expenditurerecord_entry` FOREIGN KEY (`er_entry_id`) REFERENCES `uf_entry` (`en_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_expenditurerecord_user` FOREIGN KEY (`er_user_id`) REFERENCES `uf_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_expenditure_union` FOREIGN KEY (`er_union_id`) REFERENCES `uf_union` (`un_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uf_expenditurerecord
-- ----------------------------
INSERT INTO `uf_expenditurerecord` VALUES ('1', '2017-02-20', '15', '200.00', '33', '刘亦菲', '', '10');
INSERT INTO `uf_expenditurerecord` VALUES ('2', '2017-02-20', '15', '100.00', '33', '刘亦菲', '', '10');
INSERT INTO `uf_expenditurerecord` VALUES ('3', '2017-02-20', '15', '100.00', '33', '刘亦菲', '', '18');
INSERT INTO `uf_expenditurerecord` VALUES ('4', '2017-02-20', '15', '50.00', '33', '刘亦菲', '', '18');

-- ----------------------------
-- Table structure for uf_incomerecord
-- ----------------------------
DROP TABLE IF EXISTS `uf_incomerecord`;
CREATE TABLE `uf_incomerecord` (
  `ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `ir_date` date DEFAULT NULL,
  `ir_entry_id` int(11) DEFAULT NULL,
  `ir_money` double(11,2) DEFAULT '0.00',
  `ir_user_id` int(11) DEFAULT NULL,
  `ir_redundancy` varchar(100) DEFAULT NULL,
  `ir_union_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ir_id`),
  KEY `fk_incomerecord_union` (`ir_union_id`),
  KEY `fk_incomerecord_entry` (`ir_entry_id`),
  KEY `fk_incomerecord_user` (`ir_user_id`),
  CONSTRAINT `fk_incomerecord_entry` FOREIGN KEY (`ir_entry_id`) REFERENCES `uf_entry` (`en_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_incomerecord_union` FOREIGN KEY (`ir_union_id`) REFERENCES `uf_union` (`un_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_incomerecord_user` FOREIGN KEY (`ir_user_id`) REFERENCES `uf_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uf_incomerecord
-- ----------------------------
INSERT INTO `uf_incomerecord` VALUES ('1', '2017-02-20', '12', '3000.00', '32', '会费', '10');
INSERT INTO `uf_incomerecord` VALUES ('2', '2017-02-20', '12', '5000.00', '32', '', '3');
INSERT INTO `uf_incomerecord` VALUES ('3', '2017-02-20', '14', '2000.00', '32', '', '8');
INSERT INTO `uf_incomerecord` VALUES ('4', '2017-02-20', '12', '50000.00', '32', '', '21');
INSERT INTO `uf_incomerecord` VALUES ('5', '2017-02-20', '12', '300.00', '32', '', '4');
INSERT INTO `uf_incomerecord` VALUES ('6', '2017-02-20', '12', '5000.00', '32', '会费', '9');
INSERT INTO `uf_incomerecord` VALUES ('7', '2017-02-20', '13', '1000.00', '32', '', '11');
INSERT INTO `uf_incomerecord` VALUES ('8', '2017-02-20', '12', '3000.00', '32', '', '14');
INSERT INTO `uf_incomerecord` VALUES ('9', '2017-02-20', '12', '3000.00', '32', '', '29');
INSERT INTO `uf_incomerecord` VALUES ('10', '2017-02-20', '12', '4000.00', '32', '', '12');
INSERT INTO `uf_incomerecord` VALUES ('11', '2017-02-20', '12', '5000.00', '32', '', '3');
INSERT INTO `uf_incomerecord` VALUES ('12', '2017-02-20', '12', '500.00', '32', '会费', '10');
INSERT INTO `uf_incomerecord` VALUES ('13', '2017-02-23', '13', '3000.00', '32', '', '18');
INSERT INTO `uf_incomerecord` VALUES ('14', '2017-02-23', '13', '200.00', '32', '', '18');
INSERT INTO `uf_incomerecord` VALUES ('15', '2017-02-23', '12', '100.00', '32', '', '18');

-- ----------------------------
-- Table structure for uf_union
-- ----------------------------
DROP TABLE IF EXISTS `uf_union`;
CREATE TABLE `uf_union` (
  `un_id` int(11) NOT NULL AUTO_INCREMENT,
  `un_name` varchar(100) NOT NULL,
  `un_redundancy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`un_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uf_union
-- ----------------------------
INSERT INTO `uf_union` VALUES ('3', '生科院分工会', null);
INSERT INTO `uf_union` VALUES ('4', '经管学院分工会', null);
INSERT INTO `uf_union` VALUES ('5', '机电学院分工会', null);
INSERT INTO `uf_union` VALUES ('6', '食品学院分工会', null);
INSERT INTO `uf_union` VALUES ('7', '动科学院分工会', null);
INSERT INTO `uf_union` VALUES ('8', '园林学院分工会', null);
INSERT INTO `uf_union` VALUES ('9', '资环学院分工会', null);
INSERT INTO `uf_union` VALUES ('10', '信工学院分工会', null);
INSERT INTO `uf_union` VALUES ('11', '化工学院分工会', null);
INSERT INTO `uf_union` VALUES ('12', '文法学院分工会', null);
INSERT INTO `uf_union` VALUES ('13', '教育学院分工会', null);
INSERT INTO `uf_union` VALUES ('14', '艺术学院分工会', null);
INSERT INTO `uf_union` VALUES ('15', '服装学院分工会', null);
INSERT INTO `uf_union` VALUES ('16', '数学学院分工会', null);
INSERT INTO `uf_union` VALUES ('17', '外语学院分工会', null);
INSERT INTO `uf_union` VALUES ('18', '体育学院分工会', null);
INSERT INTO `uf_union` VALUES ('19', '马列学院分工会', null);
INSERT INTO `uf_union` VALUES ('20', '高职学院分工会', null);
INSERT INTO `uf_union` VALUES ('21', '新科学院分工会', null);
INSERT INTO `uf_union` VALUES ('22', '机关一分工会', null);
INSERT INTO `uf_union` VALUES ('23', '机关二分工会', null);
INSERT INTO `uf_union` VALUES ('24', '机关三分工会', null);
INSERT INTO `uf_union` VALUES ('25', '机关四分工会', null);
INSERT INTO `uf_union` VALUES ('26', '机关五分工会', null);
INSERT INTO `uf_union` VALUES ('27', '离退处分工会', null);
INSERT INTO `uf_union` VALUES ('28', '图书馆分工会', null);
INSERT INTO `uf_union` VALUES ('29', '校医院分工会', null);

-- ----------------------------
-- Table structure for uf_user
-- ----------------------------
DROP TABLE IF EXISTS `uf_user`;
CREATE TABLE `uf_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` varchar(100) NOT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_phonenumber` varchar(100) DEFAULT NULL,
  `user_union_id` int(11) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_redundancy` varchar(100) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_union` (`user_union_id`),
  CONSTRAINT `fk_user_union` FOREIGN KEY (`user_union_id`) REFERENCES `uf_union` (`un_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uf_user
-- ----------------------------
INSERT INTO `uf_user` VALUES ('4', 'huyanzi', '123', '13403738778', '3', '3', null, '虎燕子');
INSERT INTO `uf_user` VALUES ('5', 'zhanghuihui', '123', '13673730491', '4', '3', null, '张慧辉');
INSERT INTO `uf_user` VALUES ('6', 'liyin', '123', '13803734534', '5', '3', null, '李印');
INSERT INTO `uf_user` VALUES ('7', 'fanyuefeng', '123', '13837392479', '6', '3', null, '樊跃峰');
INSERT INTO `uf_user` VALUES ('8', 'liuhong', '123', '15036614917', '7', '3', null, '刘宏');
INSERT INTO `uf_user` VALUES ('9', 'chensongling', '123', '13837398719', '8', '3', null, '陈松玲');
INSERT INTO `uf_user` VALUES ('10', 'lijunmin', '123', '13598651296', '9', '3', null, '李军民');
INSERT INTO `uf_user` VALUES ('11', 'liukeping', '123', '13937380668', '10', '3', null, '刘克平');
INSERT INTO `uf_user` VALUES ('12', 'guochaojie', '123', '13523844441', '11', '3', null, '郭超杰');
INSERT INTO `uf_user` VALUES ('13', 'lixiaoqiong', '123', '13781968232', '12', '3', null, '李小琼');
INSERT INTO `uf_user` VALUES ('14', 'zhuhong', '123', '13569859486', '13', '3', null, '朱宏');
INSERT INTO `uf_user` VALUES ('15', 'xuxiaoyu', '123', '15937322664', '14', '3', null, '徐小玉');
INSERT INTO `uf_user` VALUES ('16', 'dengpeiqi', '123', '13937322431', '15', '3', null, '邓沛栖');
INSERT INTO `uf_user` VALUES ('17', 'hufuguang', '123', '13503448904', '16', '3', null, '胡付广');
INSERT INTO `uf_user` VALUES ('18', 'wangxiujin', '123', '13837311569', '17', '3', null, '王秀金');
INSERT INTO `uf_user` VALUES ('19', 'duxingan', '123', '13462224369', '18', '3', null, '杜兴安');
INSERT INTO `uf_user` VALUES ('20', 'sunxiying', '123', '13462286415', '19', '3', null, '孙喜英');
INSERT INTO `uf_user` VALUES ('21', 'dingfuhu', '123', '', '20', '3', null, '丁福虎');
INSERT INTO `uf_user` VALUES ('22', 'xiongrenjie', '123', '', '21', '3', null, '熊仁杰');
INSERT INTO `uf_user` VALUES ('23', 'xuwu', '123', '', '22', '3', null, '徐武');
INSERT INTO `uf_user` VALUES ('24', 'qianguo', '123', '', '23', '3', null, '齐安国');
INSERT INTO `uf_user` VALUES ('25', 'sunjuwen', '123', '', '24', '3', null, '孙居文');
INSERT INTO `uf_user` VALUES ('26', 'dengtianfu', '123', '', '25', '3', null, '邓天福');
INSERT INTO `uf_user` VALUES ('27', 'wangluwei', '123', '', '26', '3', null, '王鲁伟');
INSERT INTO `uf_user` VALUES ('28', 'magenxi', '123', '', '27', '3', null, '马根喜');
INSERT INTO `uf_user` VALUES ('29', 'dijiufeng', '123', '', '28', '3', null, '狄九凤');
INSERT INTO `uf_user` VALUES ('30', 'panxiaodeng', '123', '', '29', '3', null, '潘小郑');
INSERT INTO `uf_user` VALUES ('31', 'niuweipeng', '123', null, null, '2', null, null);
INSERT INTO `uf_user` VALUES ('32', 'liuyang', '123', null, null, '1', null, '刘阳');
INSERT INTO `uf_user` VALUES ('33', 'zhaoshuo', '123', null, null, '2', null, null);

-- ----------------------------
-- View structure for shouru
-- ----------------------------
DROP VIEW IF EXISTS `shouru`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `shouru` AS select uf_union.un_id,uf_union.un_name as unname1,SUM(uf_incomerecord.ir_money) as shouru1
from uf_union left join uf_incomerecord on uf_union.un_id = uf_incomerecord.ir_union_id
group by uf_union.un_name ;

-- ----------------------------
-- View structure for zhichu
-- ----------------------------
DROP VIEW IF EXISTS `zhichu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `zhichu` AS select uf_union.un_id,uf_union.un_name as unname2,SUM(uf_expenditurerecord.er_money) as zhichu1
from uf_union LEFT JOIN uf_expenditurerecord on uf_union.un_id = uf_expenditurerecord.er_union_id
group by uf_union.un_name ;

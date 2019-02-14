/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-02-14 18:09:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `pub_date` date NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `articletype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '21', '123', '2017-11-06', '1', '1');
INSERT INTO `t_article` VALUES ('2', '2323', '213', '2017-11-06', '12', '123');
INSERT INTO `t_article` VALUES ('3', '123', 'null', '2017-11-06', '3', '1');
INSERT INTO `t_article` VALUES ('4', '123', 'null', '2017-11-06', '3', '1');
INSERT INTO `t_article` VALUES ('5', '12333', '123', '2017-11-06', '3', '1');
INSERT INTO `t_article` VALUES ('6', '1231331', '12122444', '2017-11-06', '3', '1');

-- ----------------------------
-- Table structure for t_articletype
-- ----------------------------
DROP TABLE IF EXISTS `t_articletype`;
CREATE TABLE `t_articletype` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_articletype
-- ----------------------------
INSERT INTO `t_articletype` VALUES ('1', 'mybolg');
INSERT INTO `t_articletype` VALUES ('2', 'blog');

-- ----------------------------
-- Table structure for t_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `url` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_picture
-- ----------------------------

-- ----------------------------
-- Table structure for t_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `time` date DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('4', '123', '2017-11-06', '1');
INSERT INTO `t_reply` VALUES ('5', '123', '2017-11-06', '1');
INSERT INTO `t_reply` VALUES ('6', '12', '2017-11-06', '1');
INSERT INTO `t_reply` VALUES ('7', '123123123', '2017-11-06', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123456', '1234567890', null, null, null);
INSERT INTO `t_user` VALUES ('2', '123', '123', '123', '123', '123', null);
INSERT INTO `t_user` VALUES ('3', '122', '123', '123', '123', '123', null);

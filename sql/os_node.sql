/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : os_node

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 04/12/2018 12:16:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for l_code_import_file_info
-- ----------------------------
DROP TABLE IF EXISTS `l_code_import_file_info`;
CREATE TABLE `l_code_import_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传的文件名',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件存放路径',
  `upload_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传的订单',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `code_count` bigint(255) DEFAULT NULL COMMENT '溯源码个数',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码文件上传记录';

-- ----------------------------
-- Records of l_code_import_file_info
-- ----------------------------
BEGIN;
INSERT INTO `l_code_import_file_info` VALUES (1, 'importReadme.txt', 'upload/1648d277889645b8a677295eec3d469bimportReadme.txt', '20181126151415', 2, 6, 1, '2018-11-26 15:14:15', '2018-11-26 15:14:15');
INSERT INTO `l_code_import_file_info` VALUES (2, '20181126.txt', 'upload/e7f39124dfe24c14bffb97368e0431a320181126.txt', '20181126152516', 2, 6, 2, '2018-11-26 15:25:16', '2018-11-26 15:25:16');
INSERT INTO `l_code_import_file_info` VALUES (3, 'importReadme.txt', 'upload/45b04e0ed74a43679ee0f8e660613c39importReadme.txt', '20181126154253', 2, 6, 3, '2018-11-26 15:42:53', '2018-11-26 15:42:53');
INSERT INTO `l_code_import_file_info` VALUES (4, 'importReadme.txt', 'upload/5bcc871b0c684403bde797cc6ba78d51importReadme.txt', '20181126154430', 2, 6, 2, '2018-11-26 15:44:31', '2018-11-26 15:44:31');
INSERT INTO `l_code_import_file_info` VALUES (5, 'qdasdasd.txt', 'upload/d5b3dcbf9ece4661856ce47d7a1234aeqdasdasd.txt', '20181203203507', 1, 20, 4, '2018-12-03 20:35:07', '2018-12-03 20:35:07');
INSERT INTO `l_code_import_file_info` VALUES (6, 'qdasdasd.txt', 'upload/163c92adc32445e1b868f13725bad003qdasdasd.txt', '20181203204304', 1, 10, 1, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `l_code_import_file_info` VALUES (7, 'qdasdasd.txt', 'upload/2294d18aebb84e27aa2e99d7d073926fqdasdasd.txt', '20181203204520', 1, 10, 5, '2018-12-03 20:45:20', '2018-12-03 20:45:20');
INSERT INTO `l_code_import_file_info` VALUES (8, '狗年内外.txt', 'upload/93f78d98c3ca404a90c8b493be36dacf狗年内外.txt', '20181203221735', 2, 4, 6, '2018-12-03 22:17:35', '2018-12-03 22:17:35');
INSERT INTO `l_code_import_file_info` VALUES (9, '狗年内外.txt', 'upload/be6a0221c25848e6b51197467359ff05狗年内外.txt', '20181203221743', 2, 4, 6, '2018-12-03 22:17:43', '2018-12-03 22:17:43');
INSERT INTO `l_code_import_file_info` VALUES (10, '狗年内外.txt', 'upload/332a0c91c1824e0e9dc2b9e960c4e7fb狗年内外.txt', '20181203222736', 2, 4, 6, '2018-12-03 22:27:36', '2018-12-03 22:27:36');
INSERT INTO `l_code_import_file_info` VALUES (11, '狗年外箱子.txt', 'upload/49fe722549d44b90a2367127410c3e80狗年外箱子.txt', '20181203223048', 2, 4, 7, '2018-12-03 22:30:48', '2018-12-03 22:30:48');
COMMIT;

-- ----------------------------
-- Table structure for l_ser_warehouse_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `l_ser_warehouse_goods_info`;
CREATE TABLE `l_ser_warehouse_goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_type` int(255) DEFAULT NULL COMMENT '入库来源（0：生产入库，1：换货入库，2：退货入库，3：换仓入库）',
  `warehouse_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `box_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '箱码',
  `warehouse_in_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入库单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `warehouse_in_time` datetime DEFAULT NULL COMMENT '入库时间',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `l_ser_warehouse_goods_info_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `t_ser_warehouse_info` (`id`),
  CONSTRAINT `l_ser_warehouse_goods_info_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_ser_goods_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品入库记录日志';

-- ----------------------------
-- Records of l_ser_warehouse_goods_info
-- ----------------------------
BEGIN;
INSERT INTO `l_ser_warehouse_goods_info` VALUES (3, 0, 1, NULL, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', '20181203223747', 3, '2018-12-03 22:37:47', 'biezhu', '2018-12-03 22:37:47', '2018-12-03 22:37:47');
COMMIT;

-- ----------------------------
-- Table structure for l_ser_warehouse_goods_out_info
-- ----------------------------
DROP TABLE IF EXISTS `l_ser_warehouse_goods_out_info`;
CREATE TABLE `l_ser_warehouse_goods_out_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '销售订单',
  `warehouse_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `box_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '箱码',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `goods_out_time` datetime DEFAULT NULL COMMENT '出库时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品出库记录日志';

-- ----------------------------
-- Records of l_ser_warehouse_goods_out_info
-- ----------------------------
BEGIN;
INSERT INTO `l_ser_warehouse_goods_out_info` VALUES (3, 20181203223116, 1, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', NULL, NULL, 3, '2018-12-03 22:41:21', '2018-12-03 22:41:21', '2018-12-03 22:41:21');
COMMIT;

-- ----------------------------
-- Table structure for t_member_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_info`;
CREATE TABLE `t_member_info` (
  `open_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `member_type_id` bigint(20) DEFAULT NULL COMMENT '会员类型',
  `ali_pay_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付id',
  `subscribe` int(11) NOT NULL COMMENT '是否订阅微信号',
  `nick_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '昵称',
  `sex` int(11) NOT NULL COMMENT '性别',
  `city` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市',
  `country` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '国家',
  `province` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '省份',
  `language` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言',
  `head_img_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `subscribe_time` datetime NOT NULL COMMENT '关注时间',
  `union_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信唯一编码',
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `group_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分组id',
  `tagid_list` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签id',
  `wechat_app_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应微信数据id',
  `member_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员姓名',
  `member_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员手机号',
  `member_account` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员登录账号',
  `member_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `user_id` bigint(20) DEFAULT NULL,
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`open_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员数据';

-- ----------------------------
-- Records of t_member_info
-- ----------------------------
BEGIN;
INSERT INTO `t_member_info` VALUES ('oM4Zm0gqYxSUZgoasecfK3bhRa9k', NULL, NULL, 1, '无影指', 1, '广州', '中国', '广东', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/BMbYiaoDB8zfbJIOmYHXFiaBib86k2qDsrAw3wvC5WUoefxtkgqR2vibuIf15JBseyNNBUPvJaFVyWWQY0px2AIXAn6aNFkRLIyU/132', '1970-01-19 03:35:35', NULL, '', '100', '[100]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_member_info` VALUES ('oM4Zm0ujjmCiVt5xAXuyp5CNiCeU', NULL, NULL, 1, '杨改革', 1, '广州', '中国', '广东', 'zh_CN', 'http://thirdwx.qlogo.cn/mmopen/stxP5pvPW6Qu7icmH7ibKTFuNLYLxiago5POziaW5OV4NPzI6fbNaz0oJfib1u4hnTsslKfib7CSeMdvNLW2Jo2xARt5evEmKc0Pic0/132', '1970-01-19 01:51:37', NULL, '宁阳|杨改革', '100', '[100]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_member_point_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_member_point_rule`;
CREATE TABLE `t_member_point_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '积分类型',
  `rule_value` int(11) DEFAULT NULL COMMENT '积分分值',
  `user_id` bigint(20) DEFAULT NULL,
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员积分规则';

-- ----------------------------
-- Records of t_member_point_rule
-- ----------------------------
BEGIN;
INSERT INTO `t_member_point_rule` VALUES (1, '一阶段', 10, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 14:11:58', '2018-12-03 10:16:45');
INSERT INTO `t_member_point_rule` VALUES (2, '二阶段', 21, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 14:12:06', '2018-12-03 10:16:45');
COMMIT;

-- ----------------------------
-- Table structure for t_member_scanning
-- ----------------------------
DROP TABLE IF EXISTS `t_member_scanning`;
CREATE TABLE `t_member_scanning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信openid',
  `pr_code` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内码',
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员扫码记录';

-- ----------------------------
-- Records of t_member_scanning
-- ----------------------------
BEGIN;
INSERT INTO `t_member_scanning` VALUES (1, '', 'http://www.headingtech.com/center/tz/6/8c8b21ede0d543bb88f0cf68f1cc19c5/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 21:08:28', NULL);
INSERT INTO `t_member_scanning` VALUES (2, 'oM4Zm0ujjmCiVt5xAXuyp5CNiCeU', 'http://www.headingtech.com/center/tz/6/8c8b21ede0d543bb88f0cf68f1cc19c5/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 21:48:26', NULL);
INSERT INTO `t_member_scanning` VALUES (3, '', '', NULL, NULL, NULL, NULL, '61.129.6.145', NULL, NULL, NULL, '2018-12-03 22:02:10', NULL);
INSERT INTO `t_member_scanning` VALUES (4, '', 'http://www.headingtech.com/center/tz/6/54d859c3e9a54bd5a1d0ef8bfd4b3631/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 22:15:36', NULL);
INSERT INTO `t_member_scanning` VALUES (5, 'oM4Zm0ujjmCiVt5xAXuyp5CNiCeU', 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 22:47:06', NULL);
INSERT INTO `t_member_scanning` VALUES (6, 'oM4Zm0gqYxSUZgoasecfK3bhRa9k', 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 22:47:06', NULL);
INSERT INTO `t_member_scanning` VALUES (7, '', 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 22:57:49', NULL);
INSERT INTO `t_member_scanning` VALUES (8, '', '', NULL, NULL, NULL, NULL, '61.151.178.197', NULL, NULL, NULL, '2018-12-03 22:59:28', NULL);
INSERT INTO `t_member_scanning` VALUES (9, 'oM4Zm0gqYxSUZgoasecfK3bhRa9k', 'http://www.headingtech.com/center/tz/6/5c2eb70380d74ad8a363f51a452e8b58/12', NULL, NULL, NULL, NULL, '219.137.141.5', NULL, NULL, NULL, '2018-12-03 22:59:53', NULL);
INSERT INTO `t_member_scanning` VALUES (10, '', '', NULL, NULL, NULL, NULL, '61.129.6.251', NULL, NULL, NULL, '2018-12-03 23:00:55', NULL);
INSERT INTO `t_member_scanning` VALUES (11, 'oM4Zm0gqYxSUZgoasecfK3bhRa9k', 'http://www.headingtech.com/center/tz/6/5c2eb70380d74ad8a363f51a452e8b58/12', NULL, NULL, NULL, NULL, '112.96.109.41', NULL, NULL, NULL, '2018-12-03 23:03:58', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_member_type_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_type_info`;
CREATE TABLE `t_member_type_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员类型名称',
  `type_rule_id` bigint(255) DEFAULT NULL COMMENT '升级规则',
  `type_quanty` int(255) DEFAULT NULL COMMENT '升级数据量',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `idata1` int(255) DEFAULT NULL,
  `idata2` int(255) DEFAULT NULL,
  `idata3` int(255) DEFAULT NULL,
  `idata4` int(255) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员类型';

-- ----------------------------
-- Records of t_member_type_info
-- ----------------------------
BEGIN;
INSERT INTO `t_member_type_info` VALUES (1, '普通会员', 1, 10, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 14:27:33', '2018-12-03 10:17:42');
INSERT INTO `t_member_type_info` VALUES (2, '普通二段会员', 2, 21, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 14:27:50', '2018-12-03 10:17:42');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_apply_code_201811
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_apply_code_201811`;
CREATE TABLE `t_ser_apply_code_201811` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `center_id` bigint(20) DEFAULT NULL COMMENT '中心id',
  `code_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码内容',
  `code_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码订单号',
  `code_position` bigint(255) DEFAULT NULL COMMENT '溯源码位置',
  `code_position_type` bigint(255) DEFAULT NULL COMMENT '溯源码位置类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码';

-- ----------------------------
-- Records of t_ser_apply_code_201811
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_apply_code_201811` VALUES (77, 62, 'http://9suyuan.com/6/cQzbhFFg52/11', '20181125123952', 0, 0, '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_201811` VALUES (78, 63, 'http://9suyuan.com/6/KS8yKSI7Xy/11', '20181125123952', 0, 0, '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_201811` VALUES (79, 64, 'http://9suyuan.com/6/ougZHZFwrn/11', '20181125123952', 0, 0, '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_201811` VALUES (80, 65, 'http://9suyuan.com/6/KPkDQFhR6v/11', '20181125123952', 0, 0, '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_201811` VALUES (81, 66, 'http://9suyuan.com/6/WY9BKhTUre/11', '20181125123952', 0, 0, '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_201811` VALUES (82, 67, 'http://9suyuan.com/6/p2Vp4UeRMYlx/11', '20181125124200', 2, 2, '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_201811` VALUES (83, 68, 'http://9suyuan.com/6/aksCLdcAsghf/11', '20181125124200', 2, 2, '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_201811` VALUES (84, 69, 'http://9suyuan.com/6/HOcFZwe5VPfp/11', '20181125124200', 2, 2, '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_201811` VALUES (85, 70, 'http://9suyuan.com/6/1H7n9Ypxgb7h/11', '20181125124200', 2, 2, '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_201811` VALUES (86, 71, 'http://9suyuan.com/6/hr7lqVkC1yBP/11', '20181125124200', 2, 2, '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_201811` VALUES (87, 72, 'http://9suyuan.com/6/Ngc3CZbe7L/11', '20181125124500', 1, 1, '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_201811` VALUES (88, 73, 'http://9suyuan.com/6/yR4kMMaSU0/11', '20181125124500', 1, 1, '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_201811` VALUES (89, 74, 'http://9suyuan.com/6/5XKBhLNQ7X/11', '20181125124500', 1, 1, '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_201811` VALUES (90, 75, 'http://9suyuan.com/6/pzTuoHh9od/11', '20181125124500', 1, 1, '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_201811` VALUES (91, 76, 'http://9suyuan.com/6/fNtEDOXM9V/11', '20181125124500', 1, 1, '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_201811` VALUES (92, 77, 'http://9suyuan.com/6/Qpqbiep5xCJ8/11', '20181125125209', 2, 4, '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_201811` VALUES (93, 78, 'http://9suyuan.com/6/PosaqtmVu8WC/11', '20181125125209', 2, 4, '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_201811` VALUES (94, 79, 'http://9suyuan.com/6/wT7PxlpLeUEB/11', '20181125125209', 2, 4, '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_201811` VALUES (95, 80, 'http://9suyuan.com/6/aUuRBHcgfmON/11', '20181125125209', 2, 4, '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_201811` VALUES (96, 81, 'http://9suyuan.com/6/IYxSaKgzxrDo/11', '20181125125209', 2, 4, '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_201811` VALUES (97, 82, 'http://9suyuan.com/6/C7lQnKEEvt/11', '20181126150453', 1, 1, '2018-11-26 15:06:11', '2018-11-26 15:06:11');
INSERT INTO `t_ser_apply_code_201811` VALUES (98, 83, 'http://9suyuan.com/6/yHtxbXxVfb/11', '20181126150453', 1, 1, '2018-11-26 15:06:11', '2018-11-26 15:06:11');
INSERT INTO `t_ser_apply_code_201811` VALUES (99, 84, 'http://9suyuan.com/6/CbRxMRoXQf/11', '20181126150453', 1, 1, '2018-11-26 15:06:11', '2018-11-26 15:06:11');
INSERT INTO `t_ser_apply_code_201811` VALUES (100, 85, 'http://9suyuan.com/6/bHVx0aqq77zd/11', '20181126150503', 2, 2, '2018-11-26 15:06:12', '2018-11-26 15:06:12');
INSERT INTO `t_ser_apply_code_201811` VALUES (101, 86, 'http://9suyuan.com/6/0Vk83Mk4Pv0p/11', '20181126150503', 2, 2, '2018-11-26 15:06:12', '2018-11-26 15:06:12');
INSERT INTO `t_ser_apply_code_201811` VALUES (102, 87, 'http://9suyuan.com/6/G8FdIJif8Ir8/11', '20181126150503', 2, 2, '2018-11-26 15:06:12', '2018-11-26 15:06:12');
INSERT INTO `t_ser_apply_code_201811` VALUES (103, 88, 'http://9suyuan.com/6/pjOAcTroOdS0/11', '20181126150515', 2, 3, '2018-11-26 15:06:13', '2018-11-26 15:06:13');
INSERT INTO `t_ser_apply_code_201811` VALUES (104, 89, 'http://9suyuan.com/6/9npncXhqfNyq/11', '20181126150515', 2, 3, '2018-11-26 15:06:13', '2018-11-26 15:06:13');
INSERT INTO `t_ser_apply_code_201811` VALUES (105, 90, 'http://9suyuan.com/6/9UdjpEnb5q90/11', '20181126150515', 2, 3, '2018-11-26 15:06:13', '2018-11-26 15:06:13');
INSERT INTO `t_ser_apply_code_201811` VALUES (106, 91, 'http://9suyuan.com/6/E8eUbVrgUb98/11', '20181126150538', 2, 4, '2018-11-26 15:06:14', '2018-11-26 15:06:14');
INSERT INTO `t_ser_apply_code_201811` VALUES (107, 92, 'http://9suyuan.com/6/s2ONd1ppxJqq/11', '20181126150538', 2, 4, '2018-11-26 15:06:14', '2018-11-26 15:06:14');
INSERT INTO `t_ser_apply_code_201811` VALUES (108, 93, 'http://9suyuan.com/6/EF8SgfrlvE5Z/11', '20181126150538', 2, 4, '2018-11-26 15:06:14', '2018-11-26 15:06:14');
INSERT INTO `t_ser_apply_code_201811` VALUES (109, 94, '9000001005795865', '20181126150555', 2, 5, '2018-11-26 15:06:15', '2018-11-26 15:06:15');
INSERT INTO `t_ser_apply_code_201811` VALUES (110, 95, '8000001631823255', '20181126150555', 2, 5, '2018-11-26 15:06:15', '2018-11-26 15:06:15');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_apply_code_201812
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_apply_code_201812`;
CREATE TABLE `t_ser_apply_code_201812` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `center_id` bigint(20) DEFAULT NULL COMMENT '中心id',
  `code_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码内容',
  `code_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码订单号',
  `code_position` bigint(255) DEFAULT NULL COMMENT '溯源码位置',
  `code_position_type` bigint(255) DEFAULT NULL COMMENT '溯源码位置类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3339 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码';

-- ----------------------------
-- Records of t_ser_apply_code_201812
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_apply_code_201812` VALUES (1, 1, 'http://www.headingtech.com/center/tz/6/8c8b21ede0d543bb88f0cf68f1cc19c5/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (2, 2, 'http://www.headingtech.com/center/tz/6/54d859c3e9a54bd5a1d0ef8bfd4b3631/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (3, 3, 'http://www.headingtech.com/center/tz/6/7a3de5b3363d4bed923784d69763963a/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (4, 4, 'http://www.headingtech.com/center/tz/6/c362d7c12cde462993bc7a4854fa95fb/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (5, 5, 'http://www.headingtech.com/center/tz/6/e12469cd6513442bb508e7a0bdd54ab1/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (6, 6, 'http://www.headingtech.com/center/tz/6/a2730f844ad345619917489301ce0431/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (7, 7, 'http://www.headingtech.com/center/tz/6/19e96f9dd82e49679e52f460795496e7/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (8, 8, 'http://www.headingtech.com/center/tz/6/69f51e017eac42b5aa3cf406f9c619b2/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (9, 9, 'http://www.headingtech.com/center/tz/6/7b81e7ff253d4c61aa50d738fc023ce0/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (10, 10, 'http://www.headingtech.com/center/tz/6/dc0f04dbf8b44df49b3a1dfa416dde11/12', '20181203200926', 1, 1, '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_201812` VALUES (11, 11, '1000000307457854', '20181203201045', 2, 5, '2018-12-03 20:11:02', '2018-12-03 20:11:02');
INSERT INTO `t_ser_apply_code_201812` VALUES (12, 12, '9000001742167745', '20181203201045', 2, 5, '2018-12-03 20:11:02', '2018-12-03 20:11:02');
INSERT INTO `t_ser_apply_code_201812` VALUES (13, 13, '5000001021912623', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (14, 14, '1000001304004464', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (15, 15, '8000001304023820', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (16, 16, '9000000157718241', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (17, 17, '9000001596776001', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (18, 18, '9000001361134812', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (19, 19, '9000000674567823', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (20, 20, '6000000760631232', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (21, 21, '4000000383299155', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (22, 22, '7000000629607784', '20181203201031', 2, 5, '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_201812` VALUES (23, 23, 'http://www.headingtech.com/center/tz/6/c29407124f574fa7b421f7a02f2dca32/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (24, 24, 'http://www.headingtech.com/center/tz/6/5a72ecede4b5490abf7ae1c9e8d92354/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (25, 25, 'http://www.headingtech.com/center/tz/6/c2d90c3bfe1643ee86ee063d73a2c0bf/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (26, 26, 'http://www.headingtech.com/center/tz/6/21af5541779c453f8282f94ecc3c66e6/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (27, 27, 'http://www.headingtech.com/center/tz/6/b15c6ef47dfb4312b53f214a5db090ac/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (28, 28, 'http://www.headingtech.com/center/tz/6/7fe1deeb486047b6b2b00a847f5aadcb/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (29, 29, 'http://www.headingtech.com/center/tz/6/4c8b1842cbae49efb49bcef2fb93442b/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (30, 30, 'http://www.headingtech.com/center/tz/6/624c5e7fc1114cd1953ab488643c30cd/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (31, 31, 'http://www.headingtech.com/center/tz/6/1a8744ea293348008db3d376a8f917ab/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (32, 32, 'http://www.headingtech.com/center/tz/6/b71c75b0b42141ad9d13136ac052ade8/12', '20181203204105', 2, 2, '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_201812` VALUES (33, 33, 'http://www.headingtech.com/center/tz/6/46c22156dc534224bb5fac4ecb7e01bf/12', '20181203220327', 2, 2, '2018-12-03 22:04:19', '2018-12-03 22:04:19');
INSERT INTO `t_ser_apply_code_201812` VALUES (34, 34, 'http://www.headingtech.com/center/tz/6/0339d5d2704b44c1a3c2a8fe6a8db47a/12', '20181203220327', 2, 2, '2018-12-03 22:04:19', '2018-12-03 22:04:19');
INSERT INTO `t_ser_apply_code_201812` VALUES (35, 35, 'http://www.headingtech.com/center/tz/6/5c2eb70380d74ad8a363f51a452e8b58/12', '20181203220319', 1, 1, '2018-12-03 22:04:20', '2018-12-03 22:04:20');
INSERT INTO `t_ser_apply_code_201812` VALUES (36, 36, 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', '20181203220319', 1, 1, '2018-12-03 22:04:20', '2018-12-03 22:04:20');
INSERT INTO `t_ser_apply_code_201812` VALUES (37, 37, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', '20181203222845', 2, 5, '2018-12-03 22:28:55', '2018-12-03 22:28:55');
INSERT INTO `t_ser_apply_code_201812` VALUES (38, 38, 'http://www.headingtech.com/center/tz/6/2da172b6c3bc468b8346f1d45bc5515b/12', '20181203222845', 2, 5, '2018-12-03 22:28:55', '2018-12-03 22:28:55');
INSERT INTO `t_ser_apply_code_201812` VALUES (39, 39, '6000001227383389', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (40, 40, '2000001757765814', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (41, 41, '4000000882545762', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (42, 42, '7000000123180934', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (43, 43, '7000000354892716', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (44, 44, '3000001146415599', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (45, 45, '6000001837811763', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (46, 46, '5000001151538818', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (47, 47, '3000001936942502', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (48, 48, '4000001904947487', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (49, 49, '5000000872539981', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (50, 50, '9000001409038133', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (51, 51, '6000001824942233', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (52, 52, '3000001619861927', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (53, 53, '1000001503723898', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (54, 54, '4000001435335812', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (55, 55, '9000001025137862', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (56, 56, '3000001098379149', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (57, 57, '4000001234575287', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (58, 58, '4000001359532248', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (59, 59, '8000000841804097', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (60, 60, '2000000397061990', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (61, 61, '2000000736309459', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (62, 62, '7000001925537257', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (63, 63, '2000001741869179', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (64, 64, '5000002001918915', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (65, 65, '8000001641649846', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (66, 66, '4000000663180915', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (67, 67, '6000000532324135', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (68, 68, '5000000346980598', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (69, 69, '3000000095035425', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (70, 70, '4000000266036161', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (71, 71, '6000002112769748', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (72, 72, '6000002040357645', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (73, 73, '7000001563839500', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (74, 74, '1000000430812684', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (75, 75, '2000001335505708', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (76, 76, '6000001402003741', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (77, 77, '1000000029135120', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (78, 78, '3000001505411355', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (79, 79, '5000001667243292', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (80, 80, '5000000883896961', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (81, 81, '7000002044340721', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (82, 82, '8000001568827936', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (83, 83, '2000000728973811', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (84, 84, '8000002106367368', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (85, 85, '3000000278107224', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (86, 86, '9000000226396963', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (87, 87, '8000000545685221', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (88, 88, '5000001417678156', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (89, 89, '4000001022965500', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (90, 90, '4000001539710996', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (91, 91, '4000001877928204', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (92, 92, '2000000588219532', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (93, 93, '3000002046335028', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (94, 94, '7000001615046410', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (95, 95, '3000000107390941', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (96, 96, '4000001984551657', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (97, 97, '2000000408616757', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (98, 98, '2000000166913498', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (99, 99, '3000001845993263', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (100, 100, '3000000108932043', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (101, 101, '6000001071936376', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (102, 102, '4000000635394285', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (103, 103, '9000000780912595', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (104, 104, '7000001292423990', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (105, 105, '9000001215075398', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (106, 106, '2000000287047674', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (107, 107, '5000001698360292', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (108, 108, '5000000058289155', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (109, 109, '1000001713681970', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (110, 110, '6000000127568539', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (111, 111, '6000000867099898', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (112, 112, '9000000567890457', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (113, 113, '9000000761056183', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (114, 114, '6000000312521473', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (115, 115, '9000001357875772', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (116, 116, '6000000523416802', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (117, 117, '1000001961026549', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (118, 118, '5000001437433166', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (119, 119, '5000000595784965', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (120, 120, '4000000002569974', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (121, 121, '9000002022438711', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (122, 122, '3000000291160585', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (123, 123, '9000000075646034', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (124, 124, '3000002019331502', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (125, 125, '6000000413448417', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (126, 126, '6000001621890130', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (127, 127, '4000000499465837', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (128, 128, '8000000017042958', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (129, 129, '7000000709281337', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (130, 130, '7000001862641295', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (131, 131, '4000000833543798', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (132, 132, '6000000294201937', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (133, 133, '1000000602102386', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (134, 134, '7000000798778951', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (135, 135, '5000001878906549', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (136, 136, '3000000438221688', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (137, 137, '2000002079106944', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (138, 138, '1000000222264805', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (139, 139, '8000001939274662', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (140, 140, '1000002069626742', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (141, 141, '8000001729132227', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (142, 142, '2000001837142555', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (143, 143, '1000001990730366', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (144, 144, '4000002064629461', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (145, 145, '7000001417478086', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (146, 146, '9000000988322027', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (147, 147, '1000000001638290', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (148, 148, '3000000081114456', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (149, 149, '6000001289965404', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (150, 150, '6000000434466177', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (151, 151, '1000001993167504', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (152, 152, '5000002034275869', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (153, 153, '6000000774740715', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (154, 154, '5000001224921846', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (155, 155, '1000001756643998', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (156, 156, '1000000002026553', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (157, 157, '4000000990256331', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (158, 158, '6000001238604284', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (159, 159, '8000000184800412', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (160, 160, '4000001288487111', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (161, 161, '3000000738207650', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (162, 162, '9000000293029101', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (163, 163, '5000001113775678', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (164, 164, '8000001699193093', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (165, 165, '1000000783375945', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (166, 166, '7000001169204370', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (167, 167, '3000000924353455', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (168, 168, '4000001436480162', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (169, 169, '5000000090176136', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (170, 170, '3000000276515133', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (171, 171, '4000000157751267', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (172, 172, '6000002068531484', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (173, 173, '6000000001095757', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (174, 174, '9000000203662391', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (175, 175, '6000001868928693', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (176, 176, '4000001512459468', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (177, 177, '1000001294931098', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (178, 178, '7000002048612521', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (179, 179, '4000002034084746', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (180, 180, '7000001460766926', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (181, 181, '4000001027770858', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (182, 182, '8000000174778130', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (183, 183, '2000001645748381', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (184, 184, '4000001908693359', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (185, 185, '5000000386353498', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (186, 186, '1000000959303785', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (187, 187, '6000000764919479', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (188, 188, '4000000237130897', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (189, 189, '9000000591869504', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (190, 190, '2000000774379443', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (191, 191, '7000001443551397', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (192, 192, '2000000636643673', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (193, 193, '9000001155763988', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (194, 194, '8000001894428477', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (195, 195, '2000000846068010', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (196, 196, '6000002010359727', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (197, 197, '2000002039101049', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (198, 198, '6000001793946310', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (199, 199, '2000002013927132', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (200, 200, '6000001417777636', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (201, 201, '1000000009073647', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (202, 202, '7000001470870497', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (203, 203, '4000001707973294', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (204, 204, '5000000200945960', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (205, 205, '2000000959702432', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (206, 206, '9000001368974561', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (207, 207, '9000001576598542', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (208, 208, '9000000895659378', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (209, 209, '3000000851159600', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (210, 210, '3000000875468279', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (211, 211, '9000000963092079', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (212, 212, '5000001493691671', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (213, 213, '6000001894343923', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (214, 214, '4000000836991742', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (215, 215, '5000001576328730', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (216, 216, '4000000916642443', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (217, 217, '9000000408440092', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (218, 218, '1000000294037020', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (219, 219, '1000001975269242', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (220, 220, '6000002098423297', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (221, 221, '6000002042962482', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (222, 222, '8000001122050628', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (223, 223, '8000000818324166', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (224, 224, '9000001311844494', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (225, 225, '6000001281997569', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (226, 226, '5000000499104467', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (227, 227, '3000001479792327', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (228, 228, '4000001738266878', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (229, 229, '8000001220716473', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (230, 230, '4000001380854682', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (231, 231, '7000001198516828', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (232, 232, '2000000950331297', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (233, 233, '8000000945722967', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (234, 234, '8000000682414430', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (235, 235, '1000000447899768', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (236, 236, '2000000611255124', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (237, 237, '3000001393419211', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (238, 238, '2000001255832351', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (239, 239, '3000000907238945', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (240, 240, '3000002072518315', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (241, 241, '6000001296648974', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (242, 242, '1000001510141282', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (243, 243, '4000001212748043', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (244, 244, '7000001119302464', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (245, 245, '5000001037121535', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (246, 246, '8000000628891164', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (247, 247, '4000000019878726', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (248, 248, '5000002111824521', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (249, 249, '7000001842187864', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (250, 250, '5000001757753065', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (251, 251, '7000000089367665', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (252, 252, '5000001842646827', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (253, 253, '2000000783766772', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (254, 254, '9000000439914666', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (255, 255, '1000000035577763', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (256, 256, '5000000277146055', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (257, 257, '9000000505728471', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (258, 258, '9000000398798037', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (259, 259, '7000000319276678', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (260, 260, '2000001885013416', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (261, 261, '9000001606388826', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (262, 262, '3000001277231940', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (263, 263, '6000001617936963', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (264, 264, '2000000898677539', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (265, 265, '8000001078003689', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (266, 266, '4000001130310697', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (267, 267, '1000001728921773', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (268, 268, '7000001452797194', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (269, 269, '4000000522546510', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (270, 270, '9000001207831207', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (271, 271, '6000000092650216', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (272, 272, '3000000236716832', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (273, 273, '6000002136960010', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (274, 274, '1000000776762133', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (275, 275, '9000000635073206', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (276, 276, '4000000960418862', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (277, 277, '9000000410608519', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (278, 278, '2000001527529079', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (279, 279, '1000000570485286', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (280, 280, '5000000539892795', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (281, 281, '3000001197754612', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (282, 282, '4000001994407361', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (283, 283, '4000000394939962', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (284, 284, '8000000943347871', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (285, 285, '8000001049325923', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (286, 286, '4000001825100328', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (287, 287, '5000001860386770', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (288, 288, '5000001739303400', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (289, 289, '4000001125661908', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (290, 290, '4000000706877005', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (291, 291, '9000000262587537', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (292, 292, '5000000750062347', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (293, 293, '1000002047210810', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (294, 294, '9000001440110743', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (295, 295, '5000000301938603', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (296, 296, '3000000347936590', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (297, 297, '3000000437948538', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (298, 298, '6000002110948381', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (299, 299, '5000001075206698', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (300, 300, '9000001474444716', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (301, 301, '5000000992804622', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (302, 302, '7000000915763337', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (303, 303, '9000000220682668', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (304, 304, '4000001927514837', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (305, 305, '1000000380840449', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (306, 306, '5000000795270835', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (307, 307, '5000000735134692', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (308, 308, '4000000949247251', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (309, 309, '2000002078598897', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (310, 310, '5000001736637390', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (311, 311, '8000000901756790', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (312, 312, '5000002011612764', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (313, 313, '6000001175848864', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (314, 314, '7000000199714536', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (315, 315, '5000000409922261', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (316, 316, '1000000317521831', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (317, 317, '7000000983632886', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (318, 318, '9000001549115255', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (319, 319, '7000000954169023', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (320, 320, '5000000250054498', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (321, 321, '3000000771813798', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (322, 322, '5000001779259079', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (323, 323, '8000001310523371', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (324, 324, '9000000310594913', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (325, 325, '4000001573956019', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (326, 326, '7000001664684830', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (327, 327, '1000000839601486', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (328, 328, '6000000922449588', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (329, 329, '1000000252921913', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (330, 330, '3000001068219124', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (331, 331, '8000000543709772', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (332, 332, '9000001443720770', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (333, 333, '6000000503826785', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (334, 334, '6000002061407437', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (335, 335, '7000000068087302', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (336, 336, '8000001487765209', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (337, 337, '9000001931849241', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (338, 338, '2000001125227622', '20181203230144', 2, 5, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (339, 339, 'http://www.headingtech.com/center/tz/6/e36e01b866fe40809bf72df1a8e554fc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (340, 340, 'http://www.headingtech.com/center/tz/6/4f522287c7094eb38705afac9bde6edd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (341, 341, 'http://www.headingtech.com/center/tz/6/e75fc3f5ed3a4700b090c4e5b734bb6a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (342, 342, 'http://www.headingtech.com/center/tz/6/26924ce27c0147e0837b0871dce1b384/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (343, 343, 'http://www.headingtech.com/center/tz/6/7420f13e4da240d9b1868f17e1f1e2f2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (344, 344, 'http://www.headingtech.com/center/tz/6/d3707dac49e241e2a122975dd3a9ffc5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (345, 345, 'http://www.headingtech.com/center/tz/6/23bf45531a0f4a93b38ea3f077edfcf5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (346, 346, 'http://www.headingtech.com/center/tz/6/d26423c6514e419f81c801235cd834b0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (347, 347, 'http://www.headingtech.com/center/tz/6/7aa9c72beeb74ef9b956ce6be9a532f7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (348, 348, 'http://www.headingtech.com/center/tz/6/8a3d266974e7468285372d71bf8f9c3e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (349, 349, 'http://www.headingtech.com/center/tz/6/3f62ea5a24d848b0ba07f3077c5b8c4f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (350, 350, 'http://www.headingtech.com/center/tz/6/074e1889fe3a4cafa6aab4483c6fbaf1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (351, 351, 'http://www.headingtech.com/center/tz/6/8e5ca27b6757440c995f81818b746889/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (352, 352, 'http://www.headingtech.com/center/tz/6/a2c965053ec44bfd9925a7e759bb4570/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (353, 353, 'http://www.headingtech.com/center/tz/6/ebf735c1bcb34d53a12cc5ed39c3c138/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (354, 354, 'http://www.headingtech.com/center/tz/6/643197dfecb44d8fbfbdb4dbc9601457/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (355, 355, 'http://www.headingtech.com/center/tz/6/0ebac60404ac4845948dca3b09890855/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (356, 356, 'http://www.headingtech.com/center/tz/6/6a3ef403876249a299c8c90aaa7628e5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (357, 357, 'http://www.headingtech.com/center/tz/6/a8ae1d2fbda24381b1a6cfc12136171c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (358, 358, 'http://www.headingtech.com/center/tz/6/2dcb0b5554ea4cee925f21d00a67c21c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (359, 359, 'http://www.headingtech.com/center/tz/6/7e7002dbeb83492780c5fb8c907e6f35/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (360, 360, 'http://www.headingtech.com/center/tz/6/d5f58ee54ef143f99fa6615d7ee9c6da/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (361, 361, 'http://www.headingtech.com/center/tz/6/a58a7bc241524fe98de7cea10f1ba2b4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (362, 362, 'http://www.headingtech.com/center/tz/6/094bc66966354487a1275f31d0388e44/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (363, 363, 'http://www.headingtech.com/center/tz/6/59c6cf77272741258201daa5b9cbe3f0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (364, 364, 'http://www.headingtech.com/center/tz/6/1672d3cc6a3a432e8d9a4eb0b2a9ec3a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (365, 365, 'http://www.headingtech.com/center/tz/6/45fadcc4949d4e718675db95e53a605b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (366, 366, 'http://www.headingtech.com/center/tz/6/573bfd96fd0f47219fc1d7bf3daabcc0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (367, 367, 'http://www.headingtech.com/center/tz/6/a17adb1f8eeb46d08c60423ea0c9f382/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (368, 368, 'http://www.headingtech.com/center/tz/6/f8062b3f451a4a37a2a86995495ba311/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (369, 369, 'http://www.headingtech.com/center/tz/6/097265375be543c1b7b8775e56256b51/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (370, 370, 'http://www.headingtech.com/center/tz/6/2edf887422f4455eaa0eff6c70343009/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (371, 371, 'http://www.headingtech.com/center/tz/6/a8fb6ab5f0d14fab90794e2c981d8480/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (372, 372, 'http://www.headingtech.com/center/tz/6/d241e2e547bc49439ef8d7f0e394da44/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (373, 373, 'http://www.headingtech.com/center/tz/6/a91181a51bfa43a39fa0c822a473400f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (374, 374, 'http://www.headingtech.com/center/tz/6/d5ebdbac36f54e408bf90ab965bab616/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (375, 375, 'http://www.headingtech.com/center/tz/6/2787da8f2cf048b0b96c2b7c9e9ec7d4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (376, 376, 'http://www.headingtech.com/center/tz/6/394fa5a221a04d0f85dbdf56fee8c4be/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (377, 377, 'http://www.headingtech.com/center/tz/6/036569f14c2c4f27b378d6c0c26683eb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (378, 378, 'http://www.headingtech.com/center/tz/6/d0adde055ceb440781e36403bc1e2b04/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (379, 379, 'http://www.headingtech.com/center/tz/6/4aedc6aa583c4af68fdc744bfb713a70/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (380, 380, 'http://www.headingtech.com/center/tz/6/a78607a9d1584cc6869b29e3a30bf00a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (381, 381, 'http://www.headingtech.com/center/tz/6/aa41a686f31743e4b35d3553e97b7773/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (382, 382, 'http://www.headingtech.com/center/tz/6/c666e4d8b16a4c67baddd18e6aa18d3b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (383, 383, 'http://www.headingtech.com/center/tz/6/cd857878a76545b18196e6b669a269e3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (384, 384, 'http://www.headingtech.com/center/tz/6/46686250b7dd4fd9948ba58a81667ee9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (385, 385, 'http://www.headingtech.com/center/tz/6/9000a7ac30a14f65a23f39be7c6636d0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (386, 386, 'http://www.headingtech.com/center/tz/6/b66b89c2993742e1b6a133efafaed3f5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (387, 387, 'http://www.headingtech.com/center/tz/6/7afd9efb47724764b4d9232aebe25314/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (388, 388, 'http://www.headingtech.com/center/tz/6/e0c087e0fb3e4c87a2f1a2d5d24f6f4a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (389, 389, 'http://www.headingtech.com/center/tz/6/53459dfb259f42a8905eebaddcbadeb5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (390, 390, 'http://www.headingtech.com/center/tz/6/e364f1fdd494476c8064507bb2e76d7c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (391, 391, 'http://www.headingtech.com/center/tz/6/bcb632b9131f46e982aac213966bbf53/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (392, 392, 'http://www.headingtech.com/center/tz/6/2a7c314484a640bb998a1dda3b7f4869/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (393, 393, 'http://www.headingtech.com/center/tz/6/295986df9dbb45269993d656542bb317/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (394, 394, 'http://www.headingtech.com/center/tz/6/e86051437ec2416aa59c0b70effef736/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (395, 395, 'http://www.headingtech.com/center/tz/6/06cd78b129534f37b77d6ceccc1552b3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (396, 396, 'http://www.headingtech.com/center/tz/6/6c6caaa937b943328c6e84e43c3af563/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (397, 397, 'http://www.headingtech.com/center/tz/6/dbcab4d0c11d4b48b231fdca678b4b96/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (398, 398, 'http://www.headingtech.com/center/tz/6/80ee5dd3e3a64029a0405e595e04eb26/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (399, 399, 'http://www.headingtech.com/center/tz/6/dc6f4e1eda8a46a4a8e3e54d19d34cce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (400, 400, 'http://www.headingtech.com/center/tz/6/6edf5fa6e22445f7a182e65d2f102328/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (401, 401, 'http://www.headingtech.com/center/tz/6/26081bfcb8eb493ca8f0983ff75545cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (402, 402, 'http://www.headingtech.com/center/tz/6/83e891eb950749cca85fa9ac7a541011/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (403, 403, 'http://www.headingtech.com/center/tz/6/89d7fa0123ef47bbb192c9c4834ebecd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (404, 404, 'http://www.headingtech.com/center/tz/6/ac58dffcf54544a2bb0f08c0093c4383/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (405, 405, 'http://www.headingtech.com/center/tz/6/9c3dcac11b5c40eba4337598b690e54e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (406, 406, 'http://www.headingtech.com/center/tz/6/9731495a62a14c3394081796a127ab86/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (407, 407, 'http://www.headingtech.com/center/tz/6/e8ac30f50fa2441882f15e8694f8c979/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (408, 408, 'http://www.headingtech.com/center/tz/6/8c8674c715574b56b8e9f4a2fe1e5e55/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (409, 409, 'http://www.headingtech.com/center/tz/6/c601d555daf648d18e8b55e8f4637456/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (410, 410, 'http://www.headingtech.com/center/tz/6/223e50ee16e34c8b81684b7713123aa9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (411, 411, 'http://www.headingtech.com/center/tz/6/5584f366dd714911b9b873a0a68afb24/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (412, 412, 'http://www.headingtech.com/center/tz/6/62fc0d2ad06d4beba741b2e3018c2934/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (413, 413, 'http://www.headingtech.com/center/tz/6/bf23e0788c7f4edcac1ed2bdc58e7901/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (414, 414, 'http://www.headingtech.com/center/tz/6/5da21612016c4710b46ff4a514f9894c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (415, 415, 'http://www.headingtech.com/center/tz/6/0413c59126b0487a88f08dda825988ba/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (416, 416, 'http://www.headingtech.com/center/tz/6/2f1e509f903d4d8582f7ba23a78db661/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (417, 417, 'http://www.headingtech.com/center/tz/6/fe9108388e11465fb3365955b03e9884/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (418, 418, 'http://www.headingtech.com/center/tz/6/3e36015e78ca493b967a1bac5a7167a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (419, 419, 'http://www.headingtech.com/center/tz/6/0208af94ba9f484b8e1d044035c9772b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (420, 420, 'http://www.headingtech.com/center/tz/6/bcfabbf4d9124789a9bc3025402b1ddc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (421, 421, 'http://www.headingtech.com/center/tz/6/6fc22d2d1af041409a69cc8f291b094c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (422, 422, 'http://www.headingtech.com/center/tz/6/64fac676d0df4dbcbc5f3bfb411f7466/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (423, 423, 'http://www.headingtech.com/center/tz/6/43505665fbf646db83ddea1e962099f5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (424, 424, 'http://www.headingtech.com/center/tz/6/6dfce0b0cde541a78a85663019697dce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (425, 425, 'http://www.headingtech.com/center/tz/6/a00d19d18ae24b28ab15ff913e242362/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (426, 426, 'http://www.headingtech.com/center/tz/6/f2b7204e4b35419b9c1aed2ff640d3b1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (427, 427, 'http://www.headingtech.com/center/tz/6/f2e57bb85941486aac18ab403a27d598/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (428, 428, 'http://www.headingtech.com/center/tz/6/ba2cb7dd0c4a46e0bbd17fd4508fe752/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (429, 429, 'http://www.headingtech.com/center/tz/6/2da57a3893a74cce86ab0069e73862e7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (430, 430, 'http://www.headingtech.com/center/tz/6/9120b1c9d4ff496ab9e8c62d6c184457/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (431, 431, 'http://www.headingtech.com/center/tz/6/179bb3161dba40c2bd437aee5434da0d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (432, 432, 'http://www.headingtech.com/center/tz/6/2f34daf7ed2c45b2a26717261da5db53/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (433, 433, 'http://www.headingtech.com/center/tz/6/801a62aae0d24e48b4ac5598f42a68ef/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (434, 434, 'http://www.headingtech.com/center/tz/6/3fc164025cac4e3c807ff2ba818050dc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (435, 435, 'http://www.headingtech.com/center/tz/6/f9757e81dc84424b8472eb531c29d0f1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (436, 436, 'http://www.headingtech.com/center/tz/6/d9fcfabf87b548d3b0f437be2fa2d7b4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (437, 437, 'http://www.headingtech.com/center/tz/6/147f6e884ce74a2daaec3b4e30197a70/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (438, 438, 'http://www.headingtech.com/center/tz/6/4b22102ecdd94b38807828243a956153/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (439, 439, 'http://www.headingtech.com/center/tz/6/a448b4e95b21428baa47cac73d107f1b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (440, 440, 'http://www.headingtech.com/center/tz/6/e5c88d03e7754f57a7862897f352a042/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (441, 441, 'http://www.headingtech.com/center/tz/6/cb5bd9f4ec7a45f5a6d7b7d09cda3144/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (442, 442, 'http://www.headingtech.com/center/tz/6/e5e04b8f3fc14e8bbf2b5d42a1319b3a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (443, 443, 'http://www.headingtech.com/center/tz/6/103dab9755684fe99ea2041ab230b2b7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (444, 444, 'http://www.headingtech.com/center/tz/6/59a3eb98b91c4d42a6e7ccf1249839ea/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (445, 445, 'http://www.headingtech.com/center/tz/6/f2bdbc05dca94803a0ca5b70d214055b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (446, 446, 'http://www.headingtech.com/center/tz/6/70d4923e15504f97b9738378e94168a9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (447, 447, 'http://www.headingtech.com/center/tz/6/0a0514f13f21418784bee0670fcce9cc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (448, 448, 'http://www.headingtech.com/center/tz/6/b5d3a7aaa500454186e6b334cbc2d314/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (449, 449, 'http://www.headingtech.com/center/tz/6/5476950d1f6749ba9936f382723c4060/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (450, 450, 'http://www.headingtech.com/center/tz/6/38efff58531b4c7eb5d1b3c5f927a3ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (451, 451, 'http://www.headingtech.com/center/tz/6/9b4ca291a1e94d85bf0d017df062f0c3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (452, 452, 'http://www.headingtech.com/center/tz/6/b1abf686f3c04e0cad93ae25f5928be5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (453, 453, 'http://www.headingtech.com/center/tz/6/e7bba246f5fc452c8133d26a9519fc9b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (454, 454, 'http://www.headingtech.com/center/tz/6/c5adf96654734ddba72b457210b92830/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (455, 455, 'http://www.headingtech.com/center/tz/6/ea2db9cf5880463d81cee913853571e8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (456, 456, 'http://www.headingtech.com/center/tz/6/b090f34c73b94c649531967c248b2527/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (457, 457, 'http://www.headingtech.com/center/tz/6/8470f4b2354a4bdf896d86e33af83fcd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (458, 458, 'http://www.headingtech.com/center/tz/6/c402494f7d0b4ee8adc929c7ce8f70f6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (459, 459, 'http://www.headingtech.com/center/tz/6/b7b899923caa4398844bcb7da53d82a1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (460, 460, 'http://www.headingtech.com/center/tz/6/96a429fc79314f749452cc49f67b708b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (461, 461, 'http://www.headingtech.com/center/tz/6/5edb12c40fd94ff2a52b9ac9dfaf8033/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (462, 462, 'http://www.headingtech.com/center/tz/6/3accfeeb15ee4cd6b275dd48585e8859/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (463, 463, 'http://www.headingtech.com/center/tz/6/30b3e609feac41988cb86bb538ba2b95/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (464, 464, 'http://www.headingtech.com/center/tz/6/9d33fb2e6306411eabd5e53148e54b79/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (465, 465, 'http://www.headingtech.com/center/tz/6/b35a03fb36474c0585f4f86da518bce0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (466, 466, 'http://www.headingtech.com/center/tz/6/cb399d7c68364ea8a3238aa2b24e1b84/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (467, 467, 'http://www.headingtech.com/center/tz/6/7f8da165223b4490815939fe4c36a328/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (468, 468, 'http://www.headingtech.com/center/tz/6/8a25415bfc7a4b1082d21068873af893/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (469, 469, 'http://www.headingtech.com/center/tz/6/e6d8613e11bd4fe59f46899e10038774/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (470, 470, 'http://www.headingtech.com/center/tz/6/47d73ef143714a08b78f313a5bfeb7d9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (471, 471, 'http://www.headingtech.com/center/tz/6/5bd2406cfffc43e8979b8cccd41404ae/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (472, 472, 'http://www.headingtech.com/center/tz/6/5126e96d6dac4e919cdeed0ae96c7750/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (473, 473, 'http://www.headingtech.com/center/tz/6/63468682c87e4a83abde8cea5d4db403/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (474, 474, 'http://www.headingtech.com/center/tz/6/6bc4f29988ad4484a65cfa30b5f0e405/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (475, 475, 'http://www.headingtech.com/center/tz/6/750fdbf74a2448b2b2e0f942eb48d8b9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (476, 476, 'http://www.headingtech.com/center/tz/6/8042b9e2507d49ef9a5fdf3ac0ae2a86/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (477, 477, 'http://www.headingtech.com/center/tz/6/bbe7182dc18445d68b4dd8d276a18c0a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (478, 478, 'http://www.headingtech.com/center/tz/6/69ccc00e0a9d46cdba35a201b9cba84e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (479, 479, 'http://www.headingtech.com/center/tz/6/f75880f9e86b431d823ea720973b31ab/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (480, 480, 'http://www.headingtech.com/center/tz/6/f5da8edd2c034f4f9bbad824164e874f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (481, 481, 'http://www.headingtech.com/center/tz/6/30a27e71961c4d9b8a14ddf316ee22a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (482, 482, 'http://www.headingtech.com/center/tz/6/f395f50d8c60465ea2b25cc19afb389a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (483, 483, 'http://www.headingtech.com/center/tz/6/8ccc0464f10b4157ac06d839ff7f2bab/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (484, 484, 'http://www.headingtech.com/center/tz/6/852db8d4b297473ca7b93e09f63a5c84/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (485, 485, 'http://www.headingtech.com/center/tz/6/49aa727fac4a434d8cb9af48b659a39d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (486, 486, 'http://www.headingtech.com/center/tz/6/5e0f19d72df2484590ea3ead19077519/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (487, 487, 'http://www.headingtech.com/center/tz/6/a0793ce3455e43908d7943e651d2ad4a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (488, 488, 'http://www.headingtech.com/center/tz/6/1dfe0903c0ea4a669092a20ea332abdf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (489, 489, 'http://www.headingtech.com/center/tz/6/267cd2773daf4832aebd9c35725f1963/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (490, 490, 'http://www.headingtech.com/center/tz/6/9ab7a5f97ea24a5fa9228da30c7e9971/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (491, 491, 'http://www.headingtech.com/center/tz/6/0c7dc78d81a743adb961af2f4c094c09/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (492, 492, 'http://www.headingtech.com/center/tz/6/982af56923d3430382e7de2b774457d9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (493, 493, 'http://www.headingtech.com/center/tz/6/c5147618c5b642b8aac4903dd7c8fde5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (494, 494, 'http://www.headingtech.com/center/tz/6/c73258616fba418e9a365e7ba3bd0b40/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (495, 495, 'http://www.headingtech.com/center/tz/6/59226c411df64b579781c139bdeba5bd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (496, 496, 'http://www.headingtech.com/center/tz/6/8e71e470c02949e4ba32367b6ca1d471/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (497, 497, 'http://www.headingtech.com/center/tz/6/999babe76db44312bfeb78575bf62ce8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (498, 498, 'http://www.headingtech.com/center/tz/6/0551a975b0c142938daa1bdfa253c349/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (499, 499, 'http://www.headingtech.com/center/tz/6/1bc0a3c1dd3644aaac7df3c5c5cb9382/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (500, 500, 'http://www.headingtech.com/center/tz/6/dc40513d9685419db1869f67c351795e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (501, 501, 'http://www.headingtech.com/center/tz/6/7bdd60c246aa47b8a805817723054853/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (502, 502, 'http://www.headingtech.com/center/tz/6/5a7433f5cddb45ff9d7c0b1a9d40742f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (503, 503, 'http://www.headingtech.com/center/tz/6/ead5bb81cd8c43b1b18612421d248867/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (504, 504, 'http://www.headingtech.com/center/tz/6/84560befdbfa4432b560eaeb9a9ec7cb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (505, 505, 'http://www.headingtech.com/center/tz/6/3a12de38967942e1a5bb3d563922a6f1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (506, 506, 'http://www.headingtech.com/center/tz/6/4e4e1be0b8f4476bb73b85c73bf14132/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (507, 507, 'http://www.headingtech.com/center/tz/6/ba9a9afe9c3f49089d625346278350e9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (508, 508, 'http://www.headingtech.com/center/tz/6/ac20769e941e40988ebbff753e8ef76c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (509, 509, 'http://www.headingtech.com/center/tz/6/5f916a16931f4cc68fc8526802541d3c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (510, 510, 'http://www.headingtech.com/center/tz/6/a7823371b8914fb8996f6c2c49b7d930/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (511, 511, 'http://www.headingtech.com/center/tz/6/0f92669dc577460c8a4930b1e8f56049/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (512, 512, 'http://www.headingtech.com/center/tz/6/e6281cc339394b88aea749bce6510385/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (513, 513, 'http://www.headingtech.com/center/tz/6/8f272c5550fc4fe79ad2013e5e8217bf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (514, 514, 'http://www.headingtech.com/center/tz/6/176ad2b686cf4726b02bc53ed9e4d865/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (515, 515, 'http://www.headingtech.com/center/tz/6/55c479a8a7fd4e36b40039ac16fde3bb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (516, 516, 'http://www.headingtech.com/center/tz/6/ca316c5cdbaf4369a8dc03e48d24f8bc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (517, 517, 'http://www.headingtech.com/center/tz/6/a576ae3712f649b1a1f24b6604cd39c3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (518, 518, 'http://www.headingtech.com/center/tz/6/c5f31dcd2d524a0f92b208803f30c67a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (519, 519, 'http://www.headingtech.com/center/tz/6/7953afd331e04667a5143dc194f0c2e6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (520, 520, 'http://www.headingtech.com/center/tz/6/8b3864e4c7684b29b58aa88c53a98575/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (521, 521, 'http://www.headingtech.com/center/tz/6/6cdcc48ee11b450b9d4ee1427bba44aa/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (522, 522, 'http://www.headingtech.com/center/tz/6/cfd833e77319436bad6cba3a19b60ff4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (523, 523, 'http://www.headingtech.com/center/tz/6/2ff2e95182de4ddb907d21eb67b39ff9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (524, 524, 'http://www.headingtech.com/center/tz/6/d2abe452d88d41f8b71ef1115e36e9cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (525, 525, 'http://www.headingtech.com/center/tz/6/6d4c9d2ae95a4812b3dcfe20be2a9d97/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (526, 526, 'http://www.headingtech.com/center/tz/6/e7d821c13d1a4daeb39289a4e7d731fd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (527, 527, 'http://www.headingtech.com/center/tz/6/730b6ad14e8548a8a5945bfad6660792/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (528, 528, 'http://www.headingtech.com/center/tz/6/8c47a724569843bd98d15c1a64a0cc79/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (529, 529, 'http://www.headingtech.com/center/tz/6/e3167ef6b7304cef82efad9911f5766f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (530, 530, 'http://www.headingtech.com/center/tz/6/3e64946a6fb4409a81c646b25814c513/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (531, 531, 'http://www.headingtech.com/center/tz/6/072315f2b67147139e88ffaee4f8bd06/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (532, 532, 'http://www.headingtech.com/center/tz/6/fa95cf16658f4d0590ed57127548f550/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (533, 533, 'http://www.headingtech.com/center/tz/6/1853d53ddf9944ccbed025e8457be079/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (534, 534, 'http://www.headingtech.com/center/tz/6/aab79029e28347fb95fc22baa6e29103/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (535, 535, 'http://www.headingtech.com/center/tz/6/9ad6355aa25041a99b0d42f8972012a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (536, 536, 'http://www.headingtech.com/center/tz/6/df716dda4871409e8884eaf7ae7ac9c5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (537, 537, 'http://www.headingtech.com/center/tz/6/24cc2fb0dbab43b9aed83cbc34e5a000/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (538, 538, 'http://www.headingtech.com/center/tz/6/5507abccdd5c4af091c40b3bca5635fc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (539, 539, 'http://www.headingtech.com/center/tz/6/d153b54cb8bd4fa8aad7940c2d98bb2c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (540, 540, 'http://www.headingtech.com/center/tz/6/bb8bea4fad694c7e9cd81e0055c9d355/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (541, 541, 'http://www.headingtech.com/center/tz/6/ed169f574fd44727ad809369d90f1be8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (542, 542, 'http://www.headingtech.com/center/tz/6/b9b5700631c347038ce2c4c71742b1d4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (543, 543, 'http://www.headingtech.com/center/tz/6/f7218ae29ee340e39f048d283e14f32e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (544, 544, 'http://www.headingtech.com/center/tz/6/e0faba610a48405d83822b81d3efc39b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (545, 545, 'http://www.headingtech.com/center/tz/6/d11b5649b87b45f4959f8132cfd8bdfa/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (546, 546, 'http://www.headingtech.com/center/tz/6/4ad272ebb52d4254becf809af1307655/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (547, 547, 'http://www.headingtech.com/center/tz/6/9da56d2144534a67af3263fa6d0caa5c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (548, 548, 'http://www.headingtech.com/center/tz/6/5118711ece95440a88dd88860a4a218c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (549, 549, 'http://www.headingtech.com/center/tz/6/5eade079e30c49f0b769054ac952622a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (550, 550, 'http://www.headingtech.com/center/tz/6/c2a0e91fd4704c608f4592f54ca52e02/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (551, 551, 'http://www.headingtech.com/center/tz/6/9e2a454a7b244637a021d46e8a2ef7fe/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (552, 552, 'http://www.headingtech.com/center/tz/6/198e560890cb41828bed800f9bdac975/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (553, 553, 'http://www.headingtech.com/center/tz/6/a49d29a77063418d8d229b910a61f916/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (554, 554, 'http://www.headingtech.com/center/tz/6/38dfa7414bd841109d4e5ff4900d7591/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (555, 555, 'http://www.headingtech.com/center/tz/6/84fc023fee3a492eac7eeaddd054def8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (556, 556, 'http://www.headingtech.com/center/tz/6/693e302e8613485abf6a871f2e4ba7ac/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (557, 557, 'http://www.headingtech.com/center/tz/6/3ba6a0eb805b40f1b03ab74ace5a8293/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (558, 558, 'http://www.headingtech.com/center/tz/6/f587cf484753403b89db876d33888e8e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (559, 559, 'http://www.headingtech.com/center/tz/6/6cd22f882ac64b7cbd08e450d1696eb6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (560, 560, 'http://www.headingtech.com/center/tz/6/53df92753fb44d64a9ccc797c6bb0004/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (561, 561, 'http://www.headingtech.com/center/tz/6/8923849da0634210acfd509d32d623d2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (562, 562, 'http://www.headingtech.com/center/tz/6/8ddf64cb8fae4aad8463b12339573165/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (563, 563, 'http://www.headingtech.com/center/tz/6/8a46ff29ce6c45cabec473fab6b4419f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (564, 564, 'http://www.headingtech.com/center/tz/6/4e9d4ec674024727b7113c5ef5fde78e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (565, 565, 'http://www.headingtech.com/center/tz/6/0af70e6bbeb04c63b59f8ef79731feeb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (566, 566, 'http://www.headingtech.com/center/tz/6/1867fb90e210405680cd33d09ad9b356/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (567, 567, 'http://www.headingtech.com/center/tz/6/e7eede8e1d234f068d0eaa18848c6b7f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (568, 568, 'http://www.headingtech.com/center/tz/6/83a55d5f0a9747acb4cb16fd51d7389b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (569, 569, 'http://www.headingtech.com/center/tz/6/e6ec582d3cd44434b6e346d4fd20a0ce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (570, 570, 'http://www.headingtech.com/center/tz/6/1021798d7a8646bb991bd959b730acef/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (571, 571, 'http://www.headingtech.com/center/tz/6/70a8043562bf449597b9dc5d570ad161/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (572, 572, 'http://www.headingtech.com/center/tz/6/bdc9429d80674f54b4fbad8d508fb622/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (573, 573, 'http://www.headingtech.com/center/tz/6/5dae2d4e634c4af2a838ea725dd685f7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (574, 574, 'http://www.headingtech.com/center/tz/6/acb5e4f14bc24bf5bf2e51f8560264f2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (575, 575, 'http://www.headingtech.com/center/tz/6/a7eb230dec9f434bbf9b208bdf9de1b4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (576, 576, 'http://www.headingtech.com/center/tz/6/51975a7493b741cfa2a988594846013f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (577, 577, 'http://www.headingtech.com/center/tz/6/659f9b7dc7464aa3a7d6a9ca3da90bbc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (578, 578, 'http://www.headingtech.com/center/tz/6/be4d4594bcfa41419a03181833494df4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (579, 579, 'http://www.headingtech.com/center/tz/6/d9d084d1443e409db1fdb99ca8ec8def/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (580, 580, 'http://www.headingtech.com/center/tz/6/c090765ed3464b698c952fe0c82090c2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (581, 581, 'http://www.headingtech.com/center/tz/6/1114d347366747779bd5b0d941f96dad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (582, 582, 'http://www.headingtech.com/center/tz/6/07b3b43c02bf4f2b9636e6283d53f5a9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (583, 583, 'http://www.headingtech.com/center/tz/6/89cc6d49624e4a3baffd7afdc1e13ecd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (584, 584, 'http://www.headingtech.com/center/tz/6/7bb7e8e65295473ba96a881f749b110b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (585, 585, 'http://www.headingtech.com/center/tz/6/5dd97239edd94cbfb5119e439fbae45c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (586, 586, 'http://www.headingtech.com/center/tz/6/754416412bdf41dd95e96d6414b91a1b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (587, 587, 'http://www.headingtech.com/center/tz/6/1ba6e20f0e824719b00d2e779420faf1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (588, 588, 'http://www.headingtech.com/center/tz/6/448aa34466a7435c83f7ed41d87fa992/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (589, 589, 'http://www.headingtech.com/center/tz/6/6bf1dadfd8624e959347827eb1aec167/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (590, 590, 'http://www.headingtech.com/center/tz/6/6e080db8b3c84394b466802f2be051fd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (591, 591, 'http://www.headingtech.com/center/tz/6/b0d030263e6d4202bd71bac5b1fc1517/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (592, 592, 'http://www.headingtech.com/center/tz/6/94af0f66259b45038b15dc7aee976932/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (593, 593, 'http://www.headingtech.com/center/tz/6/99d54d531d9943e39bc2df76ec1558c2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (594, 594, 'http://www.headingtech.com/center/tz/6/b108748d372f4267ae0eb3bcdcf221fc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (595, 595, 'http://www.headingtech.com/center/tz/6/5cab5e4c968f4bbaa505819ff34dc850/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (596, 596, 'http://www.headingtech.com/center/tz/6/0c75b1c861cc4cf3ad7fb099b51cfcc8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (597, 597, 'http://www.headingtech.com/center/tz/6/255292f0f27d43cb89a01f7d905c41f8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (598, 598, 'http://www.headingtech.com/center/tz/6/1c609f1ab0384638abbb5f91ac9e6c3a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (599, 599, 'http://www.headingtech.com/center/tz/6/bbd286678ae84a108437dcb66cf5ada5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (600, 600, 'http://www.headingtech.com/center/tz/6/44a294ac87ad451c891d14843844f79a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (601, 601, 'http://www.headingtech.com/center/tz/6/2c98fed163cf477c8a710a958794cf32/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (602, 602, 'http://www.headingtech.com/center/tz/6/e1e86fef6cf54a59896f57aeb175248b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (603, 603, 'http://www.headingtech.com/center/tz/6/0a690eb11d3348b09ba13e054b552f58/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (604, 604, 'http://www.headingtech.com/center/tz/6/c2e9879145e640f395e6a7ab5226f220/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (605, 605, 'http://www.headingtech.com/center/tz/6/7089ba3d20e544d890e68dbfe3602cc6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (606, 606, 'http://www.headingtech.com/center/tz/6/3e9ff4a82fe14e04ab3dfaff1148bd7e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (607, 607, 'http://www.headingtech.com/center/tz/6/c0282790988f41658f35c83be5fe18df/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (608, 608, 'http://www.headingtech.com/center/tz/6/40541800486441769b0f7908450401c3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (609, 609, 'http://www.headingtech.com/center/tz/6/eefe7ab54a144dd6a4b7cc2d8e1a3ff8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (610, 610, 'http://www.headingtech.com/center/tz/6/5f193146d366472fafea74d5ebc90985/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (611, 611, 'http://www.headingtech.com/center/tz/6/30a4e3c395034cf299ad10c4d525dea4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (612, 612, 'http://www.headingtech.com/center/tz/6/cb901c8cd0464d19adf56e0fdffc0aad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (613, 613, 'http://www.headingtech.com/center/tz/6/2c3332631ef54c5c98f28618dbcb123f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (614, 614, 'http://www.headingtech.com/center/tz/6/3f06af77fa7c4f41a9cf0621531748ce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (615, 615, 'http://www.headingtech.com/center/tz/6/246fc28f986a496fb1b7926355060d9e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (616, 616, 'http://www.headingtech.com/center/tz/6/2e27bbe87ff34d63bbdfdd5ce08f67ac/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (617, 617, 'http://www.headingtech.com/center/tz/6/a00950b48e3b424da5ab907d7713bed3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (618, 618, 'http://www.headingtech.com/center/tz/6/420ca680a7b74676809aa57aeacdf96b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (619, 619, 'http://www.headingtech.com/center/tz/6/94e2713db0c1492ba8cf82a10ffa039f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (620, 620, 'http://www.headingtech.com/center/tz/6/2ab547dcceae49b6a5ae3aa5f93cad01/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (621, 621, 'http://www.headingtech.com/center/tz/6/dbe2818c0a3a45899aa7660307501513/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (622, 622, 'http://www.headingtech.com/center/tz/6/cf07db0bfc914d4ebb1c5f2f9b6c2cc5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (623, 623, 'http://www.headingtech.com/center/tz/6/edb9e28f37de4845ad5b5e0ff6bf5e06/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (624, 624, 'http://www.headingtech.com/center/tz/6/78628788f77c4d1bab9d6297da31784e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (625, 625, 'http://www.headingtech.com/center/tz/6/e8d552ee56934c9abe87326c8f041345/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (626, 626, 'http://www.headingtech.com/center/tz/6/9c98387fee5a4f81a0fe03f3ee1f0b0f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (627, 627, 'http://www.headingtech.com/center/tz/6/d5ee718d072b4ebfbaacbb73d0434a00/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (628, 628, 'http://www.headingtech.com/center/tz/6/0ed12f8da9cd4f4dbe5e54fe44d96a94/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (629, 629, 'http://www.headingtech.com/center/tz/6/4f36a9afb6884291998ea1dc05ccd756/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (630, 630, 'http://www.headingtech.com/center/tz/6/d479d7e319df4e1f8636427bb11f9c52/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (631, 631, 'http://www.headingtech.com/center/tz/6/dc08bd7655c8465abc2df64fef2f940f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (632, 632, 'http://www.headingtech.com/center/tz/6/11c2677e39544a22b5cb9377ef472cf0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (633, 633, 'http://www.headingtech.com/center/tz/6/b5062de91e494c4b92b5d61f68e9509b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (634, 634, 'http://www.headingtech.com/center/tz/6/e40e5886939d434abbf10715f0c0729a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (635, 635, 'http://www.headingtech.com/center/tz/6/6347cac414c646288e24a1721f56c14a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (636, 636, 'http://www.headingtech.com/center/tz/6/8bb970b4bb1f4638824bb0d7b70d1ef8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (637, 637, 'http://www.headingtech.com/center/tz/6/736fa222a4424c1d8a6adf52d63fb683/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (638, 638, 'http://www.headingtech.com/center/tz/6/5bd936d5f0b14b2a9ecd4314d108a5be/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (639, 639, 'http://www.headingtech.com/center/tz/6/d57e404016314375b96e21d5412395f1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (640, 640, 'http://www.headingtech.com/center/tz/6/96d2b98c5c804feb878c3014e05dcbf0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (641, 641, 'http://www.headingtech.com/center/tz/6/b4483b58106b4f09bab1dd9f742c4a2c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (642, 642, 'http://www.headingtech.com/center/tz/6/47db718377d346079447df2fd527b962/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (643, 643, 'http://www.headingtech.com/center/tz/6/b6bc2cd2475a454cbb2b0de3ac45c47f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (644, 644, 'http://www.headingtech.com/center/tz/6/1c2543d752b14db6a24678ad23876641/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (645, 645, 'http://www.headingtech.com/center/tz/6/3fb88edd095641b78db3f1746f861b0b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (646, 646, 'http://www.headingtech.com/center/tz/6/81d7e7215c9e4ceaa673d3c8784a7e68/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (647, 647, 'http://www.headingtech.com/center/tz/6/a86d5d008a0d40c1852b6c03de3edc31/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (648, 648, 'http://www.headingtech.com/center/tz/6/540720fb4508461980098864c5483f2e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (649, 649, 'http://www.headingtech.com/center/tz/6/5650f5aa391843e08a6e1134392fbe8f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (650, 650, 'http://www.headingtech.com/center/tz/6/b504f9bc82474e5294d47745ce28c9cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (651, 651, 'http://www.headingtech.com/center/tz/6/caeccdf3c3cd4d7096ba8509e7da62cd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (652, 652, 'http://www.headingtech.com/center/tz/6/9655c7bcb2024944aeeaf220b715e3a3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (653, 653, 'http://www.headingtech.com/center/tz/6/4a1ce635356f48f3a10d863355126012/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (654, 654, 'http://www.headingtech.com/center/tz/6/9e5955b34709498b842e77f3032cff2b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (655, 655, 'http://www.headingtech.com/center/tz/6/90fe69c71edd492e8a185d5bc578c045/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (656, 656, 'http://www.headingtech.com/center/tz/6/6bf5242b792d4b1bb707df951a7c0053/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (657, 657, 'http://www.headingtech.com/center/tz/6/8775f33579c9411ca11d07d4373e776c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (658, 658, 'http://www.headingtech.com/center/tz/6/cc0c609c16e944d6843f7857af82492f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (659, 659, 'http://www.headingtech.com/center/tz/6/0abc8cca7846466289b0436a4c03d47d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (660, 660, 'http://www.headingtech.com/center/tz/6/0cec0c1ebc45479d9ad1ae293bce21d8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (661, 661, 'http://www.headingtech.com/center/tz/6/22dbb2d643e140f4b5483fe6c31d98da/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (662, 662, 'http://www.headingtech.com/center/tz/6/7febb38dec614f9a9713b9f69233cdba/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (663, 663, 'http://www.headingtech.com/center/tz/6/22f972eb58bc4d0caf24d94e46c1c713/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (664, 664, 'http://www.headingtech.com/center/tz/6/465e4913da944c91a01b3ee64a727e13/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (665, 665, 'http://www.headingtech.com/center/tz/6/dd1f3c10159649e7b3eba4c462bc11c4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (666, 666, 'http://www.headingtech.com/center/tz/6/09b0d49eb8c74b1e9112faaf56746942/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (667, 667, 'http://www.headingtech.com/center/tz/6/f7d49521a3d2423cbdb0f9871718dd78/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (668, 668, 'http://www.headingtech.com/center/tz/6/fcd48172ad8c4bbbae450ff8f42538ce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (669, 669, 'http://www.headingtech.com/center/tz/6/a0528ad8a0b849b7b6e464b33ef4eb10/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (670, 670, 'http://www.headingtech.com/center/tz/6/55ed41b6c1b84f4e994507a4c99fb268/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (671, 671, 'http://www.headingtech.com/center/tz/6/54dddea948ac44789aebf4485be373d9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (672, 672, 'http://www.headingtech.com/center/tz/6/a49acdf8d37f4cdbbc43df7e0faf772b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (673, 673, 'http://www.headingtech.com/center/tz/6/045cc4e3fc844dbf9390c88f1828b97c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (674, 674, 'http://www.headingtech.com/center/tz/6/35bbc67827b04f78950c98063b011817/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (675, 675, 'http://www.headingtech.com/center/tz/6/99335725a0c3423ea8861ad688f15de0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (676, 676, 'http://www.headingtech.com/center/tz/6/e92c9255a83643eeb959e53dc31c6e79/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (677, 677, 'http://www.headingtech.com/center/tz/6/5aa7a8e05e9a459ba0812bdffa305e71/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (678, 678, 'http://www.headingtech.com/center/tz/6/3b23868ad7174a678b70c3ec2fffacb2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (679, 679, 'http://www.headingtech.com/center/tz/6/8275e6f1861641a899bf0a493ddf3593/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (680, 680, 'http://www.headingtech.com/center/tz/6/57c5ddce58e343569b0822b64b7e1683/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (681, 681, 'http://www.headingtech.com/center/tz/6/f1b2546e4279475fbb6af480ce3349ca/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (682, 682, 'http://www.headingtech.com/center/tz/6/5a0faabc4d6d45c59093f05f3584a2e1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (683, 683, 'http://www.headingtech.com/center/tz/6/6e68f57739484b7d82342afb760bfb53/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (684, 684, 'http://www.headingtech.com/center/tz/6/3ced3bfba13f4ec4a4c985135be779de/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (685, 685, 'http://www.headingtech.com/center/tz/6/5cd5b81510cd4fcc9227abeb3eba67c4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (686, 686, 'http://www.headingtech.com/center/tz/6/9195a777bb9841f099e6e84a41b87a03/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (687, 687, 'http://www.headingtech.com/center/tz/6/a50c78eaf5d5433eb616ca33c5a14784/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (688, 688, 'http://www.headingtech.com/center/tz/6/0bda554d09934affad13ec5337d785d0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (689, 689, 'http://www.headingtech.com/center/tz/6/12837262d93a46a49dbdbe8683355465/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (690, 690, 'http://www.headingtech.com/center/tz/6/b6bc048007224cdea15863da013eb246/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (691, 691, 'http://www.headingtech.com/center/tz/6/40a6af0da5f644aa98b7c9b3fcb6f96c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (692, 692, 'http://www.headingtech.com/center/tz/6/c1219ae26fae46d7823c0350275a53bc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (693, 693, 'http://www.headingtech.com/center/tz/6/f65be1117ef945aebc1381e2c0d837e9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (694, 694, 'http://www.headingtech.com/center/tz/6/bb5cb4f688f14a6e9731c44fcd87a167/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (695, 695, 'http://www.headingtech.com/center/tz/6/72db78b2535b482f9018dac0d14c31ac/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (696, 696, 'http://www.headingtech.com/center/tz/6/f8d6981129014e1e8226bb9f0ac44cfd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (697, 697, 'http://www.headingtech.com/center/tz/6/3680e74a4a6e4ce2baf40db08ae69f24/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (698, 698, 'http://www.headingtech.com/center/tz/6/a416b4a2c9ac4b4db17dd942424df351/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (699, 699, 'http://www.headingtech.com/center/tz/6/97b1738c67474411a74597c2ac16f64b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (700, 700, 'http://www.headingtech.com/center/tz/6/adcfe29d286044f7afb45d167765a2e9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (701, 701, 'http://www.headingtech.com/center/tz/6/70021ab3898c4acea7a715114a8945b5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (702, 702, 'http://www.headingtech.com/center/tz/6/311022d8ebd74539825ff0f4296b0933/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (703, 703, 'http://www.headingtech.com/center/tz/6/a70e6dfd8d8041eba9c260c6b11c1a6f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (704, 704, 'http://www.headingtech.com/center/tz/6/2c1c00f0c2e04a1eb7c308eab89812d8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (705, 705, 'http://www.headingtech.com/center/tz/6/a9383549067a499181b1b884d2e05d20/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (706, 706, 'http://www.headingtech.com/center/tz/6/70dd69ee36c64cae84711dfdeda6b198/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (707, 707, 'http://www.headingtech.com/center/tz/6/b9d3b4541b9e4850b5fe53d8e2303d26/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (708, 708, 'http://www.headingtech.com/center/tz/6/44f31d4dce6d4ebc8543c6ba672eb33c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (709, 709, 'http://www.headingtech.com/center/tz/6/4f46f9efcbf24eae908f0ce51961c3e0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (710, 710, 'http://www.headingtech.com/center/tz/6/33538cf5b2174587b39cfbd7ba8242b8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (711, 711, 'http://www.headingtech.com/center/tz/6/3dd82ea0318442ff96e693a0024f6865/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (712, 712, 'http://www.headingtech.com/center/tz/6/21206794908c4b34a701769d8e60e116/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (713, 713, 'http://www.headingtech.com/center/tz/6/c067377290b4456ca4cca2fed73d44cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (714, 714, 'http://www.headingtech.com/center/tz/6/c420487ef92747aea0a1a11c5f2c1695/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (715, 715, 'http://www.headingtech.com/center/tz/6/cc7e778071f74e3f8050df449967e134/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (716, 716, 'http://www.headingtech.com/center/tz/6/0f15394525bf4fc0b242016d5e4d23f5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (717, 717, 'http://www.headingtech.com/center/tz/6/82c2d9b68eaa47a2b16d1fd1eb6691e7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (718, 718, 'http://www.headingtech.com/center/tz/6/372e77e55ff94ff78865d17cf07ed0fd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (719, 719, 'http://www.headingtech.com/center/tz/6/3e07c34cf794400889e450afc7e200b1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (720, 720, 'http://www.headingtech.com/center/tz/6/a6c73eb167474330a93ce7db108bf0ec/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (721, 721, 'http://www.headingtech.com/center/tz/6/ba81826f18f041378b66df33b86e4d35/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (722, 722, 'http://www.headingtech.com/center/tz/6/9f959b6d3c7a4d56bc16cf5de9701536/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (723, 723, 'http://www.headingtech.com/center/tz/6/95f00882fffc4e39862f9761e6d8d4d8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (724, 724, 'http://www.headingtech.com/center/tz/6/af77c25b31614b66a7745c0f28f2ac62/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (725, 725, 'http://www.headingtech.com/center/tz/6/507ca1345cd340b2a189612da49370d7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (726, 726, 'http://www.headingtech.com/center/tz/6/e42b2b83179943639183446983bfb89e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (727, 727, 'http://www.headingtech.com/center/tz/6/f54e952c6aaf41e79a03ff3e24a097f2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (728, 728, 'http://www.headingtech.com/center/tz/6/bd1e2542710140269b928aeca50a8f43/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (729, 729, 'http://www.headingtech.com/center/tz/6/00b559ba345d4c3c933856d56027aa00/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (730, 730, 'http://www.headingtech.com/center/tz/6/fb4d4ead96e047d6a81eadb7e7c71346/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (731, 731, 'http://www.headingtech.com/center/tz/6/8b22a733c65640f28c08ee5085b76b9a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (732, 732, 'http://www.headingtech.com/center/tz/6/5acc2195e09042a1bd86c88b1266a470/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (733, 733, 'http://www.headingtech.com/center/tz/6/3d03f468dec746ccb61aebfc241789f1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (734, 734, 'http://www.headingtech.com/center/tz/6/acb57a6c9f084b5c9539f15e7265060d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (735, 735, 'http://www.headingtech.com/center/tz/6/cc2e22a5cc2243fdb1a71ddd6f5f030d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (736, 736, 'http://www.headingtech.com/center/tz/6/d01f041d33fc4582bef6608a5e55e381/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (737, 737, 'http://www.headingtech.com/center/tz/6/62b9167033784130aa0678812b01d4d1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (738, 738, 'http://www.headingtech.com/center/tz/6/db01d9f4af984e1493db62859720c3ac/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (739, 739, 'http://www.headingtech.com/center/tz/6/0474e806b2c54c4c9856598808003dd3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (740, 740, 'http://www.headingtech.com/center/tz/6/1122627a4e6c4578a9bf24d0b9e5cb09/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (741, 741, 'http://www.headingtech.com/center/tz/6/9db87de46f7045b3919f3a1d67955735/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (742, 742, 'http://www.headingtech.com/center/tz/6/898c302824b64c6882642a42ce962fa3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (743, 743, 'http://www.headingtech.com/center/tz/6/7b2ec5d7a41c4dfc93bcfb4e8dd76425/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (744, 744, 'http://www.headingtech.com/center/tz/6/35a750e087924149b90d398ff1504aa1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (745, 745, 'http://www.headingtech.com/center/tz/6/3797699e989341f4a33b17541f587a4f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (746, 746, 'http://www.headingtech.com/center/tz/6/fa4d172e46384aeea881b56fac74e03a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (747, 747, 'http://www.headingtech.com/center/tz/6/3035bdbc72c34e358582bdb1d19db0a0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (748, 748, 'http://www.headingtech.com/center/tz/6/6747f1c658a14f879bef5e479eb244e8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (749, 749, 'http://www.headingtech.com/center/tz/6/f7e8e0d9be464cbb9e073b6d4f1359c1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (750, 750, 'http://www.headingtech.com/center/tz/6/58d30873dd094ef0aa424c977d9ed110/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (751, 751, 'http://www.headingtech.com/center/tz/6/29b9d019e53149b091ec95c977ade2f0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (752, 752, 'http://www.headingtech.com/center/tz/6/b99b512d352845d5a3ac8bf4012b6fa3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (753, 753, 'http://www.headingtech.com/center/tz/6/b6292e2beadf46e4b91f5b89e21b891b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (754, 754, 'http://www.headingtech.com/center/tz/6/986182674dc3436d934021f865d4ab17/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (755, 755, 'http://www.headingtech.com/center/tz/6/73628ecc496943a1b4feb57c8414ff92/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (756, 756, 'http://www.headingtech.com/center/tz/6/958b13052da54cbb882b195bb52764ff/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (757, 757, 'http://www.headingtech.com/center/tz/6/93f9a045bb15429183267dfdc31da031/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (758, 758, 'http://www.headingtech.com/center/tz/6/496cab8917cc4b52866b4ea3e1dda2a8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (759, 759, 'http://www.headingtech.com/center/tz/6/fd525825ca0c40fd81099d0310033481/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (760, 760, 'http://www.headingtech.com/center/tz/6/67f68592d8134ef4918ff810be25edef/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (761, 761, 'http://www.headingtech.com/center/tz/6/ba9fb0173d5844e3824640ac137d34c7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (762, 762, 'http://www.headingtech.com/center/tz/6/f09b7816d00646e1b422d5ebc1b39d79/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (763, 763, 'http://www.headingtech.com/center/tz/6/8a1949a05a9b4ba4a893c2235ea05240/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (764, 764, 'http://www.headingtech.com/center/tz/6/98cc4d3068814a0f9f6f2c0b3c56c759/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (765, 765, 'http://www.headingtech.com/center/tz/6/c21b0cbe456645faabc3caf9175c5e21/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (766, 766, 'http://www.headingtech.com/center/tz/6/5986413e4a5947ccbe4059cf4cf4ff01/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (767, 767, 'http://www.headingtech.com/center/tz/6/2aba592818c74558a0ea45cbfa9f7d64/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (768, 768, 'http://www.headingtech.com/center/tz/6/91c894c33a874395b0229d00be5738ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (769, 769, 'http://www.headingtech.com/center/tz/6/dab6eb643c7449b5a018df9df77a567f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (770, 770, 'http://www.headingtech.com/center/tz/6/0b198ddba4de4177891425328e599e5f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (771, 771, 'http://www.headingtech.com/center/tz/6/2538ef7a2ee140078d42e4daf9bc3808/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (772, 772, 'http://www.headingtech.com/center/tz/6/e4b2236a422c49fda392511fb8d0a455/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (773, 773, 'http://www.headingtech.com/center/tz/6/162b749917534fed8a2b309231f79841/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (774, 774, 'http://www.headingtech.com/center/tz/6/e3ddd2a7b3474cf4a88bcb3c0d440d14/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (775, 775, 'http://www.headingtech.com/center/tz/6/f87e4230d944426b9ce4daaba643b12e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (776, 776, 'http://www.headingtech.com/center/tz/6/5ddf6aab413342a7b528fd9984a4169a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (777, 777, 'http://www.headingtech.com/center/tz/6/3a56ead6983947ca82427d2d170091ff/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (778, 778, 'http://www.headingtech.com/center/tz/6/d3959e2632c140878f6414cbcf60fd3f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (779, 779, 'http://www.headingtech.com/center/tz/6/e94ecddd97d3437fbbb099ad71dcb427/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (780, 780, 'http://www.headingtech.com/center/tz/6/08010c6509b84b378a83817210e326d9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (781, 781, 'http://www.headingtech.com/center/tz/6/228dd60c6fa849338ece322f81e7efca/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (782, 782, 'http://www.headingtech.com/center/tz/6/3a053e949fce468690f4cbef1372c0a3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (783, 783, 'http://www.headingtech.com/center/tz/6/7c05ee715d714fd29df5257f789eac44/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (784, 784, 'http://www.headingtech.com/center/tz/6/51d351f9c90d4c9690786c67b5f83d3d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (785, 785, 'http://www.headingtech.com/center/tz/6/2a6e1261a94f4352a4a7c4cccdac9efe/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (786, 786, 'http://www.headingtech.com/center/tz/6/7c99626686554e05ad310db93efe4c33/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (787, 787, 'http://www.headingtech.com/center/tz/6/b8e92fbb58124bbeaadec17e25e3645e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (788, 788, 'http://www.headingtech.com/center/tz/6/36096bb66c9546a2b273ec8159280f77/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (789, 789, 'http://www.headingtech.com/center/tz/6/25eee3fd442b4f829844f64b44cd443d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (790, 790, 'http://www.headingtech.com/center/tz/6/2006095004af47e7b63d5574721a443a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (791, 791, 'http://www.headingtech.com/center/tz/6/e6f52abc09b84309ad59bab63562d69c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (792, 792, 'http://www.headingtech.com/center/tz/6/a638f77582f746589a38a967046baeb9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (793, 793, 'http://www.headingtech.com/center/tz/6/61b3967aa6524688bee75a67e327eb1b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (794, 794, 'http://www.headingtech.com/center/tz/6/a87f02b6c28d4d97bd91633f849e88e1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (795, 795, 'http://www.headingtech.com/center/tz/6/8a0ab69a89294a989a38da13d2e20bf7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (796, 796, 'http://www.headingtech.com/center/tz/6/d91982da297b4008bad4616e32e17d8f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (797, 797, 'http://www.headingtech.com/center/tz/6/6788de1f1169445eaab2aa447efa5bf5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (798, 798, 'http://www.headingtech.com/center/tz/6/848f257b3546439f945e0c7078d8e46e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (799, 799, 'http://www.headingtech.com/center/tz/6/2efa79c04d354033befb751c696df06e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (800, 800, 'http://www.headingtech.com/center/tz/6/980bbb9c1c9b4655af2c613563c8052d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (801, 801, 'http://www.headingtech.com/center/tz/6/2629b583e7184c6f962acbf7fd8db44f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (802, 802, 'http://www.headingtech.com/center/tz/6/05632c8843104c19904a4a0a9e4feb35/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (803, 803, 'http://www.headingtech.com/center/tz/6/0ce09b425ea040eaa993f30067570d51/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (804, 804, 'http://www.headingtech.com/center/tz/6/c3d25ff158d14e84b7def0099c588355/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (805, 805, 'http://www.headingtech.com/center/tz/6/c7ea296b2d83476a9646079388997355/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (806, 806, 'http://www.headingtech.com/center/tz/6/20b2fe248ca447e5be3cf2c77bcba3d4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (807, 807, 'http://www.headingtech.com/center/tz/6/01c502980b374eec9b999a6eba154ac9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (808, 808, 'http://www.headingtech.com/center/tz/6/639a6be101714e6fbc86c21ed9726318/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (809, 809, 'http://www.headingtech.com/center/tz/6/81d34517213146f08947858018402a2c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (810, 810, 'http://www.headingtech.com/center/tz/6/549150c8bf9e4a3d97b2a0a691008ab1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (811, 811, 'http://www.headingtech.com/center/tz/6/64166b4652b8491d98d176f4ffa5060b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (812, 812, 'http://www.headingtech.com/center/tz/6/c3249062261f49688d37748e90759abc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (813, 813, 'http://www.headingtech.com/center/tz/6/442ea949df9a4c40a9204f24ee61edfe/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (814, 814, 'http://www.headingtech.com/center/tz/6/ef51c08fc5674867a9c16833fbfd837e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (815, 815, 'http://www.headingtech.com/center/tz/6/d933c7f1a24a4912b93c7025e9b5423d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (816, 816, 'http://www.headingtech.com/center/tz/6/6752d79193594a8bb89d65e15bf1fe69/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (817, 817, 'http://www.headingtech.com/center/tz/6/e1adb79a8223463eb52985ca89104df5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (818, 818, 'http://www.headingtech.com/center/tz/6/c885f0d974d243e68900b16e5cd25002/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (819, 819, 'http://www.headingtech.com/center/tz/6/17f997a52c6b4d658931e4dd3f86274d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (820, 820, 'http://www.headingtech.com/center/tz/6/db912badebe74521bf1337b87f91002b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (821, 821, 'http://www.headingtech.com/center/tz/6/e44ed5d0ea364a11a4ed85af574db4d2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (822, 822, 'http://www.headingtech.com/center/tz/6/f081372d79624a379e3aafc43e766c8d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (823, 823, 'http://www.headingtech.com/center/tz/6/a3dfee30b37d42f9b603823154560306/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (824, 824, 'http://www.headingtech.com/center/tz/6/2d8083af65104ce1857931e61adb8e05/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (825, 825, 'http://www.headingtech.com/center/tz/6/5a5615477c8f49e29669ed6846636796/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (826, 826, 'http://www.headingtech.com/center/tz/6/59b84073b86a4170b2b2e99911c1b5f4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (827, 827, 'http://www.headingtech.com/center/tz/6/f1b5d2b141fa459db19fae9a24394f01/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (828, 828, 'http://www.headingtech.com/center/tz/6/dd19459969b24c95b4987692c43f4eb0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (829, 829, 'http://www.headingtech.com/center/tz/6/b4de36eb7c114d30a8ca901057bda998/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (830, 830, 'http://www.headingtech.com/center/tz/6/02abf3ff9edd44839a494a8162c93ee9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (831, 831, 'http://www.headingtech.com/center/tz/6/bf2c73073f2544a6a14479bbbae2684a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (832, 832, 'http://www.headingtech.com/center/tz/6/aa3a406478c0416c94c4783486c91bf9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (833, 833, 'http://www.headingtech.com/center/tz/6/ed05a235ce9048ea829726ea01081d29/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (834, 834, 'http://www.headingtech.com/center/tz/6/4abc7dc7567146c998da125b9760ca24/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (835, 835, 'http://www.headingtech.com/center/tz/6/dae7a15e75a74156ae311176a1af07e9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (836, 836, 'http://www.headingtech.com/center/tz/6/ab466be14db14f6bbc3cf861cfea57e4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (837, 837, 'http://www.headingtech.com/center/tz/6/92be3db24d8646faab8533acdd16ad8d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (838, 838, 'http://www.headingtech.com/center/tz/6/2f31ceeae4b7445c9eb8d0f5ececf3f1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (839, 839, 'http://www.headingtech.com/center/tz/6/623821f2932442d2a4699f9e204ead2d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (840, 840, 'http://www.headingtech.com/center/tz/6/ec850b523ea84c78bb593164da9470a2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (841, 841, 'http://www.headingtech.com/center/tz/6/1c5a70b896884130ab771a7c9fc1408b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (842, 842, 'http://www.headingtech.com/center/tz/6/af14ac7301ce4e05abfef7585b925672/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (843, 843, 'http://www.headingtech.com/center/tz/6/c9d038689ab14cfa9a53c0836bdca116/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (844, 844, 'http://www.headingtech.com/center/tz/6/a10b7795d41940a28f0a8517730f6c8b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (845, 845, 'http://www.headingtech.com/center/tz/6/dbd00fd7f1c74da38adaf77565676700/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (846, 846, 'http://www.headingtech.com/center/tz/6/0fb169e73d0a4f84badd66737ebd4a9b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (847, 847, 'http://www.headingtech.com/center/tz/6/8d42c5b8ccc64d6580c17d5e80c98c46/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (848, 848, 'http://www.headingtech.com/center/tz/6/5c0340d9bc2e43bbb213ca7a319360ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (849, 849, 'http://www.headingtech.com/center/tz/6/80e37f316bb941789050f8fdde5f58b0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (850, 850, 'http://www.headingtech.com/center/tz/6/67ad56a4e5c44e3083eea356f3c496d3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (851, 851, 'http://www.headingtech.com/center/tz/6/bce8c01486874f50a400ced67211fc6a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (852, 852, 'http://www.headingtech.com/center/tz/6/f1efa0cf05e243c7ab33f27c4b38c141/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (853, 853, 'http://www.headingtech.com/center/tz/6/91ccfd0b70f74ad1b65529dcd55a1aee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (854, 854, 'http://www.headingtech.com/center/tz/6/90b8f75764864052bfee890328c7fcf4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (855, 855, 'http://www.headingtech.com/center/tz/6/e12d173544e8455ca1668a8a01aaf6e3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (856, 856, 'http://www.headingtech.com/center/tz/6/e6b40cbea0ce4acabddc102898627721/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (857, 857, 'http://www.headingtech.com/center/tz/6/86d7bd022336494294049766d9463d75/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (858, 858, 'http://www.headingtech.com/center/tz/6/99ebf61b4f9745be855319a521c146af/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (859, 859, 'http://www.headingtech.com/center/tz/6/4cd2bc07aeb9476cbe569b8ad85acbdb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (860, 860, 'http://www.headingtech.com/center/tz/6/3d0a9410da3349009444390a2e9df8d2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (861, 861, 'http://www.headingtech.com/center/tz/6/b1b733952afe4350b708d38756fa8e6b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (862, 862, 'http://www.headingtech.com/center/tz/6/f8fa87287483434badba9c981756e439/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (863, 863, 'http://www.headingtech.com/center/tz/6/07f5822fd3b347c09ec6f7ddf6178a40/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (864, 864, 'http://www.headingtech.com/center/tz/6/e0640d9166c146109d5dd201ff4da096/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (865, 865, 'http://www.headingtech.com/center/tz/6/91a8b4208acb4704bae1bbeced953d8f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (866, 866, 'http://www.headingtech.com/center/tz/6/21a240d08f654f34b0b5f8e0877459c4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (867, 867, 'http://www.headingtech.com/center/tz/6/57009ec4a2654c5b999c8621c3af65e4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (868, 868, 'http://www.headingtech.com/center/tz/6/dbb1dafb95ad42038ccf7817215288e6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (869, 869, 'http://www.headingtech.com/center/tz/6/20fa1625c88b4585a7e6da3cbe60e84a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (870, 870, 'http://www.headingtech.com/center/tz/6/ed5d5a2dcd7a4569addf2b5164a92257/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (871, 871, 'http://www.headingtech.com/center/tz/6/b49cf973a52849b784cdf73ae7ec0bff/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (872, 872, 'http://www.headingtech.com/center/tz/6/75da935d7aca41a7a94a2a128c400e0c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (873, 873, 'http://www.headingtech.com/center/tz/6/4ecaf68af8434f798f8b5ef4d130675b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (874, 874, 'http://www.headingtech.com/center/tz/6/54eca093d8464245aa878afd8e526afb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (875, 875, 'http://www.headingtech.com/center/tz/6/060893a3205f48b2ad2ee0261f9c175b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (876, 876, 'http://www.headingtech.com/center/tz/6/202b017d15ef4bbbb83d6be76f0bd704/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (877, 877, 'http://www.headingtech.com/center/tz/6/27d453336c0a47c5b350d77ba24ec6c5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (878, 878, 'http://www.headingtech.com/center/tz/6/94be17f4ce10412794e8ec9dcb4d14ad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (879, 879, 'http://www.headingtech.com/center/tz/6/1f077bc2bf194286ab9590f223597b34/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (880, 880, 'http://www.headingtech.com/center/tz/6/8b1565416c104938a43a1626195eb0f4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (881, 881, 'http://www.headingtech.com/center/tz/6/e71c611aa5df4e6eb2ef59335a1f84b0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (882, 882, 'http://www.headingtech.com/center/tz/6/b35bc441d607426289e4e5adf47fd35c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (883, 883, 'http://www.headingtech.com/center/tz/6/9698f945b15348fb93f061f9611fbec9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (884, 884, 'http://www.headingtech.com/center/tz/6/598de434fa294b518ada8a48e16841ab/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (885, 885, 'http://www.headingtech.com/center/tz/6/90ac151266344b119cd7f9d567e277ca/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (886, 886, 'http://www.headingtech.com/center/tz/6/d9fc509bfc2e4e66b9ea632e3fa4e551/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (887, 887, 'http://www.headingtech.com/center/tz/6/596e704435db41c78ad8c40c981a351f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (888, 888, 'http://www.headingtech.com/center/tz/6/ae6fdb3cac87424b87e16686e72fe21d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (889, 889, 'http://www.headingtech.com/center/tz/6/d09b364fee1f44adbf4c7b0437ce6270/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (890, 890, 'http://www.headingtech.com/center/tz/6/92c0f7fa31f041c69ba78e2c5e8d3d59/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (891, 891, 'http://www.headingtech.com/center/tz/6/d35a9de3dd9e4b0997793f4a11560b92/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (892, 892, 'http://www.headingtech.com/center/tz/6/f44f76488ab149cb88f3f7272f382941/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (893, 893, 'http://www.headingtech.com/center/tz/6/1ef3b2608a6740409aad1a2086b15947/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (894, 894, 'http://www.headingtech.com/center/tz/6/41d0857237ba4a96864ec630bc48ed2b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (895, 895, 'http://www.headingtech.com/center/tz/6/c22ff4f28e88409484f5c749d273195b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (896, 896, 'http://www.headingtech.com/center/tz/6/7eeaab2b12a74ead8a6d665a3e556420/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (897, 897, 'http://www.headingtech.com/center/tz/6/a1a8599cbc724966aa52a45e004b6103/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (898, 898, 'http://www.headingtech.com/center/tz/6/fa1048bdcb514e5d8e7a2cf79be6832c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (899, 899, 'http://www.headingtech.com/center/tz/6/ed50372d67fe45939848516ace84aca0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (900, 900, 'http://www.headingtech.com/center/tz/6/4b5eddbd37bf4590a202ada81292ffe9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (901, 901, 'http://www.headingtech.com/center/tz/6/904a9ab8f3474a9c94855d0b987085db/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (902, 902, 'http://www.headingtech.com/center/tz/6/ed495c088afa466daf6c2a49110e9b7e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (903, 903, 'http://www.headingtech.com/center/tz/6/957e47b75a3e4a538cb53114406b7a41/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (904, 904, 'http://www.headingtech.com/center/tz/6/366f98dac6cd4e159fe5185a21d02d25/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (905, 905, 'http://www.headingtech.com/center/tz/6/950c8ed21312426494e6578df718d950/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (906, 906, 'http://www.headingtech.com/center/tz/6/4b1eaf54cb4e4caba6b92b5766c709c8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (907, 907, 'http://www.headingtech.com/center/tz/6/3c80b6dd5dcd471ab5e70516d61b634a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (908, 908, 'http://www.headingtech.com/center/tz/6/57a22f70967848ce8c879dba0bfd2b2d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (909, 909, 'http://www.headingtech.com/center/tz/6/fc0c8ca004614407addf36e8876e075b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (910, 910, 'http://www.headingtech.com/center/tz/6/f2a816dc8698400ea7ed7e6d92b23f96/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (911, 911, 'http://www.headingtech.com/center/tz/6/ac227421f96247db8210ef1ac0b23336/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (912, 912, 'http://www.headingtech.com/center/tz/6/1b4b04c6f9054f6b9203b818818d834f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (913, 913, 'http://www.headingtech.com/center/tz/6/4ea5fac7e01943e688fe62884a44842d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (914, 914, 'http://www.headingtech.com/center/tz/6/0f727b0c82b84deb88bc75d925d3be20/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (915, 915, 'http://www.headingtech.com/center/tz/6/4f141ebcce8246d3aa07ae0032cdeaa1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (916, 916, 'http://www.headingtech.com/center/tz/6/e86e0b6953d54cfd90f789d52e6d5e01/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (917, 917, 'http://www.headingtech.com/center/tz/6/1d48439ad5b1495dbf95fc18f912bb79/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (918, 918, 'http://www.headingtech.com/center/tz/6/b4855faad31d42b683626232164fc894/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (919, 919, 'http://www.headingtech.com/center/tz/6/671f6e622a75416a8c49a3ab9345cdf6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (920, 920, 'http://www.headingtech.com/center/tz/6/e5bb2cd636a3406991707a7b68d2b65f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (921, 921, 'http://www.headingtech.com/center/tz/6/a5944a0691ab4f678131911102e95de2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (922, 922, 'http://www.headingtech.com/center/tz/6/2098efe347f74b91afa3d3b824464700/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (923, 923, 'http://www.headingtech.com/center/tz/6/c6d5c08a97fe4d398ecbf371c10f0672/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (924, 924, 'http://www.headingtech.com/center/tz/6/a36034523d3f45bcb98ef75a3916176f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (925, 925, 'http://www.headingtech.com/center/tz/6/9ddf56b6c118432383f8930032a924b5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (926, 926, 'http://www.headingtech.com/center/tz/6/73fd0d3d509d494399001983389b3bfa/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (927, 927, 'http://www.headingtech.com/center/tz/6/6f016ec0ac234441b46cc6c5861f0a9c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (928, 928, 'http://www.headingtech.com/center/tz/6/497bfc57f3f6446cafd6812307515923/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (929, 929, 'http://www.headingtech.com/center/tz/6/d2a84b94e6394a439e23c331fc9de323/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (930, 930, 'http://www.headingtech.com/center/tz/6/1daf7ae6cdd04faa803bd424e5c9e089/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (931, 931, 'http://www.headingtech.com/center/tz/6/4a16a19582a64d2b84489b5ab4430ef8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (932, 932, 'http://www.headingtech.com/center/tz/6/3b3af1318d6e47ed9c5ace271ebfb6ea/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (933, 933, 'http://www.headingtech.com/center/tz/6/1ca5d825e2b24c7bb12306427eeac405/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (934, 934, 'http://www.headingtech.com/center/tz/6/0a7677b1b1c44366a036934ba26199e8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (935, 935, 'http://www.headingtech.com/center/tz/6/7dbd0834b4054acdbd5205d6677f5bea/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (936, 936, 'http://www.headingtech.com/center/tz/6/32bb43eef9234fc6a630205a0fd34c3f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (937, 937, 'http://www.headingtech.com/center/tz/6/36dfb85d14dc4dcea922efdb04faca21/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (938, 938, 'http://www.headingtech.com/center/tz/6/511575086b1f437eae1ef29e32ffe0a7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (939, 939, 'http://www.headingtech.com/center/tz/6/51950c748ffb468abd175e153ddb060d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (940, 940, 'http://www.headingtech.com/center/tz/6/487abd4021884cb08d13663c552f4bb9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (941, 941, 'http://www.headingtech.com/center/tz/6/852e99ad6b554bff8f6a5baa54673d9e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (942, 942, 'http://www.headingtech.com/center/tz/6/978a261b370e4629b422a279bd4c34f3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (943, 943, 'http://www.headingtech.com/center/tz/6/2efcb34800874d6d9cdce90598bc65b5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (944, 944, 'http://www.headingtech.com/center/tz/6/12fc29a6a79d4486815d6ab061bb3fcf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (945, 945, 'http://www.headingtech.com/center/tz/6/4e991af4fcd0407897a0f80c4d47ffc7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (946, 946, 'http://www.headingtech.com/center/tz/6/72b10315b8fb41d7b8bb77e3c3954942/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (947, 947, 'http://www.headingtech.com/center/tz/6/1df7e00076ff49eea3ecd0940f994a34/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (948, 948, 'http://www.headingtech.com/center/tz/6/5c783289591347f3ab935d42e013703a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (949, 949, 'http://www.headingtech.com/center/tz/6/fb79cd67c0ea4252a52496c33b194a8e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (950, 950, 'http://www.headingtech.com/center/tz/6/fdadc548cad5438492edaa803ae0bcb3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (951, 951, 'http://www.headingtech.com/center/tz/6/0adbed5cf40f4eefa974f837052ed7d0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (952, 952, 'http://www.headingtech.com/center/tz/6/a46194550f7046f887df9c6ebe8d9477/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (953, 953, 'http://www.headingtech.com/center/tz/6/0e983b4800ba4db3947883460114169d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (954, 954, 'http://www.headingtech.com/center/tz/6/b7a6340d674147eb91cf96340a0fbe43/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (955, 955, 'http://www.headingtech.com/center/tz/6/7e6865be343b4099a2d1b2e3f19d4eb3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (956, 956, 'http://www.headingtech.com/center/tz/6/7645f551de5a4cc5b110bc9e288f9637/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (957, 957, 'http://www.headingtech.com/center/tz/6/146fe7d3b3184e6fa3c4760d2ef7fa33/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (958, 958, 'http://www.headingtech.com/center/tz/6/2b79d0784b8c45bb8b38ae7c718ab443/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (959, 959, 'http://www.headingtech.com/center/tz/6/6a1aa4988ead4df68bbe27de2feb13c7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (960, 960, 'http://www.headingtech.com/center/tz/6/2a99295614a64d67bb6eb5aab62b4dff/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (961, 961, 'http://www.headingtech.com/center/tz/6/2e2516e50cde4800a855c846ebba8491/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (962, 962, 'http://www.headingtech.com/center/tz/6/5f2f24479db24c9e90a2867264e4e965/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (963, 963, 'http://www.headingtech.com/center/tz/6/b1eb03f3fd3e441ea9712396cab50539/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (964, 964, 'http://www.headingtech.com/center/tz/6/638cc059e0054e1585526b4ec829f133/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (965, 965, 'http://www.headingtech.com/center/tz/6/27a964019007475989f8ce7914e6e634/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (966, 966, 'http://www.headingtech.com/center/tz/6/6bfbd86c89634217ab700b6cd716ed39/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (967, 967, 'http://www.headingtech.com/center/tz/6/4b1868ccca8d4a09be515f2eae342bd5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (968, 968, 'http://www.headingtech.com/center/tz/6/9a6b409b35df44a3b82184db71628940/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (969, 969, 'http://www.headingtech.com/center/tz/6/4236c7a25f634910a5568440f6513a86/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (970, 970, 'http://www.headingtech.com/center/tz/6/46dd0fe72b17497aa8a6f6e3645b4080/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (971, 971, 'http://www.headingtech.com/center/tz/6/1b789655217948a990e0ea4c755925a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (972, 972, 'http://www.headingtech.com/center/tz/6/8a0ff3ed9754419ead4c401aeaab3bd5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (973, 973, 'http://www.headingtech.com/center/tz/6/6e220975115343d08da936b2a57dd516/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (974, 974, 'http://www.headingtech.com/center/tz/6/16c50f39caf446e2a3a510036d8fe483/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (975, 975, 'http://www.headingtech.com/center/tz/6/ed58a219cab346b295a51b9cb8447f2a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (976, 976, 'http://www.headingtech.com/center/tz/6/fde02596980948c386842bfe8590fa6c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (977, 977, 'http://www.headingtech.com/center/tz/6/f9ea5755fff347cc8412f02bfe792288/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (978, 978, 'http://www.headingtech.com/center/tz/6/1bd7ee24197a4d26a2cfd2f92b8db733/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (979, 979, 'http://www.headingtech.com/center/tz/6/381de4c149c7440b8493403ccb2ec8d5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (980, 980, 'http://www.headingtech.com/center/tz/6/0afd880b09934262bfe3602a649c1cde/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (981, 981, 'http://www.headingtech.com/center/tz/6/a54c4e6a1ddf40de83066d6fff7d4513/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (982, 982, 'http://www.headingtech.com/center/tz/6/11b8a76aefe54ccea1c46cb1c0dae1bb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (983, 983, 'http://www.headingtech.com/center/tz/6/ac50d0c6c1744451be3d19dac47349cd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (984, 984, 'http://www.headingtech.com/center/tz/6/662c599734704132a0508a4bd7fd4f44/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (985, 985, 'http://www.headingtech.com/center/tz/6/76623ab3ae8243ab968d0c394b969ae9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (986, 986, 'http://www.headingtech.com/center/tz/6/6de88de4ea344e45a74836c2328c9133/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (987, 987, 'http://www.headingtech.com/center/tz/6/e5185c1e988e4219993467bfe9bc14b6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (988, 988, 'http://www.headingtech.com/center/tz/6/1dbdaf36c7f84935a61ffd85b549a56d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (989, 989, 'http://www.headingtech.com/center/tz/6/a9e2bf231a244cde858d91efb729f030/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (990, 990, 'http://www.headingtech.com/center/tz/6/8703c1cebf2141adb3a3c7c766956e57/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (991, 991, 'http://www.headingtech.com/center/tz/6/dd8994a77fab4838ac1fcfd3d592a120/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (992, 992, 'http://www.headingtech.com/center/tz/6/f2aee87817714661a14c941722fcec06/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (993, 993, 'http://www.headingtech.com/center/tz/6/b943feceb5084319ba8a5cda990c200f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (994, 994, 'http://www.headingtech.com/center/tz/6/1c577af2693345f8a6b0373f7eec8161/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (995, 995, 'http://www.headingtech.com/center/tz/6/e1a71875d0d54b34ba6dbc991ac9465b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (996, 996, 'http://www.headingtech.com/center/tz/6/04726e9969044d66b8b005a77f042219/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (997, 997, 'http://www.headingtech.com/center/tz/6/803aebb38ade4289818fa0d1ebb25a13/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (998, 998, 'http://www.headingtech.com/center/tz/6/55d621673d4645f4a242efdcbc40d73c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (999, 999, 'http://www.headingtech.com/center/tz/6/14ffa208715a4c9789d3ccaf0804edf2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1000, 1000, 'http://www.headingtech.com/center/tz/6/9b2873ee36b54c679597fd5842ae22a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1001, 1001, 'http://www.headingtech.com/center/tz/6/4900d2836f0c4bb1a3f6edb7c8573590/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1002, 1002, 'http://www.headingtech.com/center/tz/6/300ddfd5389443619ca1fa2316cbbe61/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1003, 1003, 'http://www.headingtech.com/center/tz/6/9084a6d6c5014680a6ea773722077d0b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1004, 1004, 'http://www.headingtech.com/center/tz/6/0373234e2d704f4288b71ccc86ffb01f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1005, 1005, 'http://www.headingtech.com/center/tz/6/c6b196d92c3d466e8cad22734ae16de9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1006, 1006, 'http://www.headingtech.com/center/tz/6/8d666712e3af4e2e8aab0c669510b6cc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1007, 1007, 'http://www.headingtech.com/center/tz/6/44c047fdd4b141b88cfecf5598083dae/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1008, 1008, 'http://www.headingtech.com/center/tz/6/be6f3084bfc94460bca1e91d046b62c4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1009, 1009, 'http://www.headingtech.com/center/tz/6/f11c8fb802424bddb725250986747d75/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1010, 1010, 'http://www.headingtech.com/center/tz/6/e43f6460fe844f6ea352579d5471fe07/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1011, 1011, 'http://www.headingtech.com/center/tz/6/3fdddbb1e8ae493d8ce175d1a6095f49/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1012, 1012, 'http://www.headingtech.com/center/tz/6/2d85342ed28448fc99625c6515376563/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1013, 1013, 'http://www.headingtech.com/center/tz/6/90907f7d19da4d4aa005d96f60a4b6a9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1014, 1014, 'http://www.headingtech.com/center/tz/6/24ccd5da033a470c9f9bfa2e5691bc84/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1015, 1015, 'http://www.headingtech.com/center/tz/6/3eba4b9ff8bd40b8a1b83d8ae37ee2f5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1016, 1016, 'http://www.headingtech.com/center/tz/6/73df09f398424f7daa0c6b8dc90b6beb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1017, 1017, 'http://www.headingtech.com/center/tz/6/8357ce33438c42718f659e30c5051655/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1018, 1018, 'http://www.headingtech.com/center/tz/6/6834f0d4d68b46d9b842e0c62cbcc46d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1019, 1019, 'http://www.headingtech.com/center/tz/6/b1aaef05305b404aa777612ea2708a90/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1020, 1020, 'http://www.headingtech.com/center/tz/6/9cf32da399b448278c5a2bcf22c0305e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1021, 1021, 'http://www.headingtech.com/center/tz/6/ca6a1eeae63040f390328685bbd639d7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1022, 1022, 'http://www.headingtech.com/center/tz/6/c3b31df71ec040f28694e28fd83cd6a2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1023, 1023, 'http://www.headingtech.com/center/tz/6/2ec45513b083400e80cecacc46c15151/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1024, 1024, 'http://www.headingtech.com/center/tz/6/a230a6b6e8a34f0bbb014b98cc312671/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1025, 1025, 'http://www.headingtech.com/center/tz/6/3e5ac72b23eb451da33b97b66007f29d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1026, 1026, 'http://www.headingtech.com/center/tz/6/4f6101ed0e7744299d9b3cde9352923d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1027, 1027, 'http://www.headingtech.com/center/tz/6/7bbb09a0bf0946a58d13d3488ced693a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1028, 1028, 'http://www.headingtech.com/center/tz/6/7407645166ac490d88873c0f977ea106/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1029, 1029, 'http://www.headingtech.com/center/tz/6/a39c06162e274cc2a6c36d0332824652/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1030, 1030, 'http://www.headingtech.com/center/tz/6/dde1b23bd0ee4f7596b4d9ce35398c64/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1031, 1031, 'http://www.headingtech.com/center/tz/6/57b668e9355e4739882d46ff7fafe5e6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1032, 1032, 'http://www.headingtech.com/center/tz/6/6a912bf2ae6540a5afb6928ba61b9706/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1033, 1033, 'http://www.headingtech.com/center/tz/6/a8305b7b096541daa32d817893bccdb7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1034, 1034, 'http://www.headingtech.com/center/tz/6/7f80835a58b44375be05731ce8d5bf8b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1035, 1035, 'http://www.headingtech.com/center/tz/6/e15fa1980dfc466dae75f48ec6ac352b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1036, 1036, 'http://www.headingtech.com/center/tz/6/3955fee08d1c4814b5e9dd915918960f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1037, 1037, 'http://www.headingtech.com/center/tz/6/8b1b55075c7a4a809fe146e6ba66f245/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1038, 1038, 'http://www.headingtech.com/center/tz/6/6e78b0e7c2194d74bc42959108ae3a83/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1039, 1039, 'http://www.headingtech.com/center/tz/6/535a437238e44ccd97f8443c0242abb0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1040, 1040, 'http://www.headingtech.com/center/tz/6/7fc0f04a078040319a8c83d5001def93/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1041, 1041, 'http://www.headingtech.com/center/tz/6/412fa47ce6a74752ae9ad07989f56c62/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1042, 1042, 'http://www.headingtech.com/center/tz/6/ae191eeb818d46d7839088031b481694/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1043, 1043, 'http://www.headingtech.com/center/tz/6/9111eb51f9444e83a71a8523ee2f097e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1044, 1044, 'http://www.headingtech.com/center/tz/6/6241997cce2449ba9a9c7c8fdb30608e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1045, 1045, 'http://www.headingtech.com/center/tz/6/42993accc86f4e80ab08dd256c4d716c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1046, 1046, 'http://www.headingtech.com/center/tz/6/51356e4b8d1c4b35869cf42ba4fab399/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1047, 1047, 'http://www.headingtech.com/center/tz/6/a44875ca24604a4e86ca8c948f33df9f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1048, 1048, 'http://www.headingtech.com/center/tz/6/f1884fa288924f81b0e387493f8c3106/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1049, 1049, 'http://www.headingtech.com/center/tz/6/bc1717247c4544798571902cd0ccb605/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1050, 1050, 'http://www.headingtech.com/center/tz/6/5ed33d79622440609163c1bfec87fe30/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1051, 1051, 'http://www.headingtech.com/center/tz/6/6d5414ab741f4b0e90306326143c8ae6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1052, 1052, 'http://www.headingtech.com/center/tz/6/20969da13c194898981bb0e2d17bbe24/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1053, 1053, 'http://www.headingtech.com/center/tz/6/040d26f919344eb0a50b21d08e402ae4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1054, 1054, 'http://www.headingtech.com/center/tz/6/71251a5a259c4a4e8266323c4f819bed/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1055, 1055, 'http://www.headingtech.com/center/tz/6/feebd1240b8e4cd7809544cd9bd7a21f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1056, 1056, 'http://www.headingtech.com/center/tz/6/51b622cf0ef4451cbef79ef028b92b70/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1057, 1057, 'http://www.headingtech.com/center/tz/6/cadca16e953a499fb945a8d21e8a7995/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1058, 1058, 'http://www.headingtech.com/center/tz/6/e63d0cf858d8490e9f20f1dd8c350801/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1059, 1059, 'http://www.headingtech.com/center/tz/6/4f09ce62fdaa43caba79d3bf1b5655ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1060, 1060, 'http://www.headingtech.com/center/tz/6/da18a72efc644b2695d36eb4f407eba1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1061, 1061, 'http://www.headingtech.com/center/tz/6/d6743171e0674108a25231b64953d905/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1062, 1062, 'http://www.headingtech.com/center/tz/6/64d5feaf444f42d19b9d2a59d893c893/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1063, 1063, 'http://www.headingtech.com/center/tz/6/8ce8f8bf5ae64fe1a07cb7b4b222b791/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1064, 1064, 'http://www.headingtech.com/center/tz/6/f31ccf32d08845acb77e0005d2d62faa/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1065, 1065, 'http://www.headingtech.com/center/tz/6/9b1ed2a811514911858b215cfe2a4d87/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1066, 1066, 'http://www.headingtech.com/center/tz/6/4c3e5acd9e5e4d2e9c227a1d1607fb4e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1067, 1067, 'http://www.headingtech.com/center/tz/6/4a565ec2c3ec438597fc66fd5d42115d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1068, 1068, 'http://www.headingtech.com/center/tz/6/7fdf4e2b475147c5949977564a5d51c9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1069, 1069, 'http://www.headingtech.com/center/tz/6/205a13401c34445e9250235c08420757/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1070, 1070, 'http://www.headingtech.com/center/tz/6/d8c3478225c5405994dfc73b7a9abd93/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1071, 1071, 'http://www.headingtech.com/center/tz/6/6eb3b10c1ca5496cac3885d49fcefd0c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1072, 1072, 'http://www.headingtech.com/center/tz/6/cd8917c612654b1382ec3fed3c5ea75c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1073, 1073, 'http://www.headingtech.com/center/tz/6/420a1fb682d84f8dbf64fed13297f9e5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1074, 1074, 'http://www.headingtech.com/center/tz/6/179044f519f147ae8f0303adc4509767/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1075, 1075, 'http://www.headingtech.com/center/tz/6/e2489af3983b475ab530679d8214fcca/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1076, 1076, 'http://www.headingtech.com/center/tz/6/20b16466e51143b994701fe7bbd12b61/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1077, 1077, 'http://www.headingtech.com/center/tz/6/f5177c94f41744fbb1fd5d4b5f930ab4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1078, 1078, 'http://www.headingtech.com/center/tz/6/ce32ad1a0bbe43d8bf7c7a3a51ebed8d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1079, 1079, 'http://www.headingtech.com/center/tz/6/c6bccc3a1b744f12ba0ff857085c4043/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1080, 1080, 'http://www.headingtech.com/center/tz/6/4e84591a03df4b81b4b07b0410111375/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1081, 1081, 'http://www.headingtech.com/center/tz/6/4a9bd46143844824a16e88ee0c6da64d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1082, 1082, 'http://www.headingtech.com/center/tz/6/301352bde75f4730bd069f49741e1d6f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1083, 1083, 'http://www.headingtech.com/center/tz/6/f6c2fa8c31954ea0b245aadadb8075fc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1084, 1084, 'http://www.headingtech.com/center/tz/6/0357eb71a6bd45028ee87c83cd20b519/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1085, 1085, 'http://www.headingtech.com/center/tz/6/5c216cca28844a7bb9f94d44203c957a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1086, 1086, 'http://www.headingtech.com/center/tz/6/825e794394e24623a951cad131a72f88/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1087, 1087, 'http://www.headingtech.com/center/tz/6/becd81bb576d4cdf89478f5608240a22/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1088, 1088, 'http://www.headingtech.com/center/tz/6/8a0a01ce74674400afdef30295ab85fd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1089, 1089, 'http://www.headingtech.com/center/tz/6/4dc67929fdf547119e167f175a23d9b6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1090, 1090, 'http://www.headingtech.com/center/tz/6/077106eb7c384241b220357c72c2eaad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1091, 1091, 'http://www.headingtech.com/center/tz/6/b4b76e3c23264b8aa55876c47a3693b0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1092, 1092, 'http://www.headingtech.com/center/tz/6/ebf958f023774c47ad12065acfd50b93/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1093, 1093, 'http://www.headingtech.com/center/tz/6/3f580058600748ebb151ab1ce4c7f7c5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1094, 1094, 'http://www.headingtech.com/center/tz/6/f56a0702508144e494327e74ef8b2e96/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1095, 1095, 'http://www.headingtech.com/center/tz/6/e0bf9f28b2cb4d7792139a7ba69568b9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1096, 1096, 'http://www.headingtech.com/center/tz/6/94dd58c4ab4a4ce7938d357ca28f00d9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1097, 1097, 'http://www.headingtech.com/center/tz/6/6692afcc39c04638813428e6e35761b7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1098, 1098, 'http://www.headingtech.com/center/tz/6/c92e862fe8dc4aa089f9a8ce5fffecc5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1099, 1099, 'http://www.headingtech.com/center/tz/6/d2110bed4492406ba49f9deea0f2e303/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1100, 1100, 'http://www.headingtech.com/center/tz/6/5c8937b032194dd6bf05718c2a378f37/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1101, 1101, 'http://www.headingtech.com/center/tz/6/c1cdba9b30b34dd0bb859ad4f4f9fee0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1102, 1102, 'http://www.headingtech.com/center/tz/6/0980f5bba8e542779d3e8270145c98ca/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1103, 1103, 'http://www.headingtech.com/center/tz/6/634d29d3b89c4f13b8d5df5d6153f062/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1104, 1104, 'http://www.headingtech.com/center/tz/6/85497f3dae7f40a5b5a9d58b9bb73ae4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1105, 1105, 'http://www.headingtech.com/center/tz/6/07879c0d005245068aba8396abae58a6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1106, 1106, 'http://www.headingtech.com/center/tz/6/e531bc4894af454a9d2f7d1d5119a8e2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1107, 1107, 'http://www.headingtech.com/center/tz/6/1ba893418fa54cca867f635489beaed3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1108, 1108, 'http://www.headingtech.com/center/tz/6/50677b1e1c5b4d55b669976c1c99f2ad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1109, 1109, 'http://www.headingtech.com/center/tz/6/bdad0ddde1404d33b4a3e833ad673fde/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1110, 1110, 'http://www.headingtech.com/center/tz/6/b884adb9a30e46debec167af78e6577d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1111, 1111, 'http://www.headingtech.com/center/tz/6/0605220d184745ed9906063a90d5cbc2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1112, 1112, 'http://www.headingtech.com/center/tz/6/816fb13d3fe74cd399fedb70dfe890b5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1113, 1113, 'http://www.headingtech.com/center/tz/6/dbfedf0bf63e408ca3afbf9634230e2d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1114, 1114, 'http://www.headingtech.com/center/tz/6/b0c4efd3d21447c58cf46fbe74fd09af/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1115, 1115, 'http://www.headingtech.com/center/tz/6/046161b7e9f64b1cb651c6c8bba0d374/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1116, 1116, 'http://www.headingtech.com/center/tz/6/1832fffa4c764d7b87ab2b775bc9f3cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1117, 1117, 'http://www.headingtech.com/center/tz/6/97ad38561efd41fb895bd15a5c7acc76/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1118, 1118, 'http://www.headingtech.com/center/tz/6/ee953e311b1645319cc339b9a5cda014/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1119, 1119, 'http://www.headingtech.com/center/tz/6/1fa33b85fd11403b84b1bf06f3526c9b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1120, 1120, 'http://www.headingtech.com/center/tz/6/c0849cd3fd264c22a23f5dfb0bd4bf47/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1121, 1121, 'http://www.headingtech.com/center/tz/6/420b2590353043c7a31ad166264a34e8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1122, 1122, 'http://www.headingtech.com/center/tz/6/1a9f35fe4d37430a93120548a4a86fb6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1123, 1123, 'http://www.headingtech.com/center/tz/6/f59006974d75485e87c270c02f30d3e3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1124, 1124, 'http://www.headingtech.com/center/tz/6/add03baefdfc4cbe98683fce7e26a33d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1125, 1125, 'http://www.headingtech.com/center/tz/6/2bfab25bba47430a92b3050c13936762/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1126, 1126, 'http://www.headingtech.com/center/tz/6/a3004d5f4c7e4bb6934fc94e5bd341ba/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1127, 1127, 'http://www.headingtech.com/center/tz/6/d64966caa5ca477aab304e6a07523135/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1128, 1128, 'http://www.headingtech.com/center/tz/6/253b271f1eee4cca8a64c877a52fcac8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1129, 1129, 'http://www.headingtech.com/center/tz/6/b8043a82d1694e1295a25a7ae9d56816/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1130, 1130, 'http://www.headingtech.com/center/tz/6/43138b2ffc214c13a45f91fb211ec6c2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1131, 1131, 'http://www.headingtech.com/center/tz/6/c80c29dc744e40ba91f749a5b1d5e2a8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1132, 1132, 'http://www.headingtech.com/center/tz/6/6604ea7874fe4f68b23ab56eb93005f0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1133, 1133, 'http://www.headingtech.com/center/tz/6/08cff1c5f518410b8de1b9a3070f5888/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1134, 1134, 'http://www.headingtech.com/center/tz/6/527b8add3e4a4f56857b9ff4979b040a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1135, 1135, 'http://www.headingtech.com/center/tz/6/8216ba422ad4416ab49fde7c4a4e2202/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1136, 1136, 'http://www.headingtech.com/center/tz/6/86e98a34f591412f95cfc71f9d5d4ba3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1137, 1137, 'http://www.headingtech.com/center/tz/6/2f4261018a064d2c9422e5b49e9c6912/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1138, 1138, 'http://www.headingtech.com/center/tz/6/68709c5141fd40c0a6455db4999dab2b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1139, 1139, 'http://www.headingtech.com/center/tz/6/6d1acf8bf79a4acf810a6ef847d86fd2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1140, 1140, 'http://www.headingtech.com/center/tz/6/450af1d6f9fd495484a7c40356cfe274/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1141, 1141, 'http://www.headingtech.com/center/tz/6/427a44d8596547efa5e59bb93e5fce7d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1142, 1142, 'http://www.headingtech.com/center/tz/6/70c0f4e0fc6c44f18b9ba7c9f8b0ee72/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1143, 1143, 'http://www.headingtech.com/center/tz/6/aa6d71c11d6d4b049000468cb063da4c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1144, 1144, 'http://www.headingtech.com/center/tz/6/9a1c053083c44ed09be93cf4762e4179/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1145, 1145, 'http://www.headingtech.com/center/tz/6/b2151904f6a84a0589d9a2cafa5eb672/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1146, 1146, 'http://www.headingtech.com/center/tz/6/dc8e84a12a6048d0b897fae51a362eab/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1147, 1147, 'http://www.headingtech.com/center/tz/6/a5e531c8e280478188290a15c303b833/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1148, 1148, 'http://www.headingtech.com/center/tz/6/8f0a6da505c540a3a00a18692651bf4c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1149, 1149, 'http://www.headingtech.com/center/tz/6/d77b17dca31e4d2fa53fd815f38fc9c9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1150, 1150, 'http://www.headingtech.com/center/tz/6/99e54d014f4e4613b4ad1f207b355252/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1151, 1151, 'http://www.headingtech.com/center/tz/6/0eebff08c2e1413189486a423c233964/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1152, 1152, 'http://www.headingtech.com/center/tz/6/5ff86e5d14ff49b59837a9c9eac77828/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1153, 1153, 'http://www.headingtech.com/center/tz/6/7187deacacd7426688a399526338f633/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1154, 1154, 'http://www.headingtech.com/center/tz/6/8deb5f30f4564495b19f98bd56ddabe3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1155, 1155, 'http://www.headingtech.com/center/tz/6/0e885da10ed646f3b2e4184796aec799/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1156, 1156, 'http://www.headingtech.com/center/tz/6/eda86f13ebc34a958daedc704fc369e1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1157, 1157, 'http://www.headingtech.com/center/tz/6/c682567a28a74543898cc3960b0d40f7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1158, 1158, 'http://www.headingtech.com/center/tz/6/2899da0083184f4f9b06680a1d3c0ecf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1159, 1159, 'http://www.headingtech.com/center/tz/6/970e9a35c8c14a62b26c4224f5366e05/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1160, 1160, 'http://www.headingtech.com/center/tz/6/a58565afb963456e9c5946975802b9be/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1161, 1161, 'http://www.headingtech.com/center/tz/6/6147bf3455ae4c8ab0174552bf8ff133/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1162, 1162, 'http://www.headingtech.com/center/tz/6/b7fd68defa804f6eb879689f06502565/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1163, 1163, 'http://www.headingtech.com/center/tz/6/9f7ab057ab414023bcba91d0c736cafa/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1164, 1164, 'http://www.headingtech.com/center/tz/6/18ff7d63c28e416f9e28a7ad41dced04/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1165, 1165, 'http://www.headingtech.com/center/tz/6/590b0982fc7542f492bc2a2ea437b59f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1166, 1166, 'http://www.headingtech.com/center/tz/6/4eadff25d3464d7c88e6c0c74856165c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1167, 1167, 'http://www.headingtech.com/center/tz/6/86411bb752744726bb61bfd0dda825ad/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1168, 1168, 'http://www.headingtech.com/center/tz/6/ff310adce252439eb46f51eba9fab268/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1169, 1169, 'http://www.headingtech.com/center/tz/6/ddb9d7453b1e4c238f12981053f79cee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1170, 1170, 'http://www.headingtech.com/center/tz/6/12eb97721a68480bb2cbbba98a7a6de4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1171, 1171, 'http://www.headingtech.com/center/tz/6/3aa820dafb5e42bab590ecbf5b463de6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1172, 1172, 'http://www.headingtech.com/center/tz/6/b260081e175941c885103e3d8e393d54/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1173, 1173, 'http://www.headingtech.com/center/tz/6/93db77a0031f447e86a2ce58a51ba658/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1174, 1174, 'http://www.headingtech.com/center/tz/6/47e5d8c924a340bebcea82d6b3ec8230/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1175, 1175, 'http://www.headingtech.com/center/tz/6/b0cac904971e44d79730c15ec8c657d2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1176, 1176, 'http://www.headingtech.com/center/tz/6/2854b9d8cd054fea8511a828a9d50187/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1177, 1177, 'http://www.headingtech.com/center/tz/6/42a2a7794aa549758f0d87ccb73ddf61/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1178, 1178, 'http://www.headingtech.com/center/tz/6/fe468843316248a0800d113ac8d44a2a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1179, 1179, 'http://www.headingtech.com/center/tz/6/f6be9a5993804b459d4dfb1f51e9881b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1180, 1180, 'http://www.headingtech.com/center/tz/6/fa4a11362beb436aada28a65516e9b69/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1181, 1181, 'http://www.headingtech.com/center/tz/6/63924344a6404b5781cc021169017949/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1182, 1182, 'http://www.headingtech.com/center/tz/6/8317fc7ed4b74c338407279718d95725/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1183, 1183, 'http://www.headingtech.com/center/tz/6/cea2f8678dab4ec7ab2e1230e7d89425/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1184, 1184, 'http://www.headingtech.com/center/tz/6/af44ef328e60491aaa25bf69358e5929/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1185, 1185, 'http://www.headingtech.com/center/tz/6/0f49cf0c1b8444f09ec32d1f1599a143/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1186, 1186, 'http://www.headingtech.com/center/tz/6/0656737ec9374bed9994a6de7e46e4e7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1187, 1187, 'http://www.headingtech.com/center/tz/6/7e5f6afd50fd481bacc38ba17ec89fb5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1188, 1188, 'http://www.headingtech.com/center/tz/6/9025055f032f46718e33c536ccc7326b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1189, 1189, 'http://www.headingtech.com/center/tz/6/cf40dbd7ac97425fbcd7d6b461baa0ae/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1190, 1190, 'http://www.headingtech.com/center/tz/6/a7c09d7452e44f2681058fbf5ba2a51d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1191, 1191, 'http://www.headingtech.com/center/tz/6/c2653d75ae164db88848108f95bab6f0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1192, 1192, 'http://www.headingtech.com/center/tz/6/88c8ccf8aa5c4c419a41d29ebb8fd9d6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1193, 1193, 'http://www.headingtech.com/center/tz/6/fea8f4a67c55444491d68b9b6ced77cc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1194, 1194, 'http://www.headingtech.com/center/tz/6/95a9e21103f544a588a4ee5def918b1f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1195, 1195, 'http://www.headingtech.com/center/tz/6/3633a6134cb342b1a305aedd374f906d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1196, 1196, 'http://www.headingtech.com/center/tz/6/6cd126173a4848e49447ffd01cb24d72/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1197, 1197, 'http://www.headingtech.com/center/tz/6/558a791ad20946adb84075c00599cf89/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1198, 1198, 'http://www.headingtech.com/center/tz/6/35b53635f492454c9810f8b4b89da5ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1199, 1199, 'http://www.headingtech.com/center/tz/6/48749f0d2ae04c1790e04c84b3ffb6b2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1200, 1200, 'http://www.headingtech.com/center/tz/6/c7f1fabdb5034e08adda15e00383c5d7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1201, 1201, 'http://www.headingtech.com/center/tz/6/3d1d627775e04b0fb85425d549366a92/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1202, 1202, 'http://www.headingtech.com/center/tz/6/3ab2a04775ab4647bb38f8eff3db9ea9/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1203, 1203, 'http://www.headingtech.com/center/tz/6/f7d34b3a2e6b4d098d67bacdded0b3b8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1204, 1204, 'http://www.headingtech.com/center/tz/6/773cbbe14e4c4a0d9557cb784fadebef/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1205, 1205, 'http://www.headingtech.com/center/tz/6/d0025d4306a34b55bc8bacc2c40e6591/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1206, 1206, 'http://www.headingtech.com/center/tz/6/a585ff4b26824cbd91a8383568856d60/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1207, 1207, 'http://www.headingtech.com/center/tz/6/3bad3b20a5b34a9dbe64a0b3aabcae24/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1208, 1208, 'http://www.headingtech.com/center/tz/6/e0b1fb2382dc4eb3847972db3a0e383e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1209, 1209, 'http://www.headingtech.com/center/tz/6/3a29419794ab4a60b294b3dba8c05b85/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1210, 1210, 'http://www.headingtech.com/center/tz/6/f49379c27e014fd3ab98b4a9c05a7e0c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1211, 1211, 'http://www.headingtech.com/center/tz/6/610455417acd4e559ebec5e8acea8897/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1212, 1212, 'http://www.headingtech.com/center/tz/6/5ffe7bd096f946d0bf0b459760327715/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1213, 1213, 'http://www.headingtech.com/center/tz/6/a65ccc66882048e1a66bc866c4fcdd52/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1214, 1214, 'http://www.headingtech.com/center/tz/6/df6b0a83951f4b879d633542dbab0ce2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1215, 1215, 'http://www.headingtech.com/center/tz/6/cae75037afe944b89df43c688772a97b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1216, 1216, 'http://www.headingtech.com/center/tz/6/bef23eb727584ced830e89ab4c0b90f4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1217, 1217, 'http://www.headingtech.com/center/tz/6/7e19e2f8a4154dd39478ab68ed8f5f8d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1218, 1218, 'http://www.headingtech.com/center/tz/6/e2965ffd07494688b038a53ec74f0459/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1219, 1219, 'http://www.headingtech.com/center/tz/6/ecfa8fceacb14bafbf96076abd6e1a07/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1220, 1220, 'http://www.headingtech.com/center/tz/6/6b57db98fcee464fb0abbcd626761402/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1221, 1221, 'http://www.headingtech.com/center/tz/6/543e22c9fd104f89899316ca159f1261/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1222, 1222, 'http://www.headingtech.com/center/tz/6/f089e0bbb6114b598202abd144d800d4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1223, 1223, 'http://www.headingtech.com/center/tz/6/6d5a0306f1354d63a7a183eb65998173/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1224, 1224, 'http://www.headingtech.com/center/tz/6/2cfd8f326efc4b79acdc1954b2d71510/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1225, 1225, 'http://www.headingtech.com/center/tz/6/f5e3fd11134142ddbf95f149267d0f08/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1226, 1226, 'http://www.headingtech.com/center/tz/6/2d07f13cb01042b79ddfdaf1f3fc821c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1227, 1227, 'http://www.headingtech.com/center/tz/6/da84f91d0b9b473eb1002fe2e968875e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1228, 1228, 'http://www.headingtech.com/center/tz/6/37c96f9feee042a491fed8d8a97cbc5b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1229, 1229, 'http://www.headingtech.com/center/tz/6/e457943bbf6b44019ac45eff22171823/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1230, 1230, 'http://www.headingtech.com/center/tz/6/172758ece20541aba019347a33cc7a7e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1231, 1231, 'http://www.headingtech.com/center/tz/6/be194d5ffabe41868cbb1d7a6f80ca1f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1232, 1232, 'http://www.headingtech.com/center/tz/6/529b9f300c9d4261b25fc5a24abbe6a0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1233, 1233, 'http://www.headingtech.com/center/tz/6/dc213292794442a0b139f7c4a6c9738f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1234, 1234, 'http://www.headingtech.com/center/tz/6/5af6afa5b0a24498a1a735d9cc22984a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1235, 1235, 'http://www.headingtech.com/center/tz/6/0f9358c611c74fa5be3e432ae0c1f41c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1236, 1236, 'http://www.headingtech.com/center/tz/6/3098a126b2bb4606ba332769a72a5dfb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1237, 1237, 'http://www.headingtech.com/center/tz/6/39a7b90dc49544dbb5e9b7dbd4eb083c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1238, 1238, 'http://www.headingtech.com/center/tz/6/f207d0cf89cf45e485d78b8cb521686c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1239, 1239, 'http://www.headingtech.com/center/tz/6/c7f2eba501144558ad8bff94f62c92be/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1240, 1240, 'http://www.headingtech.com/center/tz/6/b9389caeff9c48ceacefb5763155e41b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1241, 1241, 'http://www.headingtech.com/center/tz/6/6929952535734bdb93ab1eb5573e5330/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1242, 1242, 'http://www.headingtech.com/center/tz/6/296e2e7d092048aba6f054a622771f52/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1243, 1243, 'http://www.headingtech.com/center/tz/6/794b6e0cc79f48018d96f59d652ea26f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1244, 1244, 'http://www.headingtech.com/center/tz/6/a6df2f781e0740e3a48e519306e53c9b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1245, 1245, 'http://www.headingtech.com/center/tz/6/d4805e96313e4f98b7b52c979676f83a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1246, 1246, 'http://www.headingtech.com/center/tz/6/8fb4a44c60b64c388e5c7541f38649d7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1247, 1247, 'http://www.headingtech.com/center/tz/6/f6f93dfca36346ff94f99f636ed57cd5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1248, 1248, 'http://www.headingtech.com/center/tz/6/43a37cc9fff04f369c6ac1feea1ff390/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1249, 1249, 'http://www.headingtech.com/center/tz/6/209fe3131b0444a2848bdb4e63b72d6e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1250, 1250, 'http://www.headingtech.com/center/tz/6/9e81c2dcaa254c4fb575694bf41d1770/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1251, 1251, 'http://www.headingtech.com/center/tz/6/f2d73cf54cdd4c98a06065092349bb44/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1252, 1252, 'http://www.headingtech.com/center/tz/6/2e83114e8dab4e88b3d140f6a97169d5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1253, 1253, 'http://www.headingtech.com/center/tz/6/be2d89da705a4a19aa7ec8d02016ac95/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1254, 1254, 'http://www.headingtech.com/center/tz/6/308550ea76ba467192d7af63942314d3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1255, 1255, 'http://www.headingtech.com/center/tz/6/8425877ce73340e5880178f0c946df38/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1256, 1256, 'http://www.headingtech.com/center/tz/6/3b41302ae8734401b413c6a1c30697b6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1257, 1257, 'http://www.headingtech.com/center/tz/6/5700ab8dd3c34709befcd162b82d05f0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1258, 1258, 'http://www.headingtech.com/center/tz/6/fc29fbb0d25b4ca0a3eedf5122e32b89/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1259, 1259, 'http://www.headingtech.com/center/tz/6/4747cea56f094e42b9c3260615d5f3a5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1260, 1260, 'http://www.headingtech.com/center/tz/6/b96f539094a444bab3338a0f29452732/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1261, 1261, 'http://www.headingtech.com/center/tz/6/0bd3ad4bd5e9426f99602feace72f49f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1262, 1262, 'http://www.headingtech.com/center/tz/6/9a458ed6e6dc4509b6f04f22368e9a8e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1263, 1263, 'http://www.headingtech.com/center/tz/6/2bc15aac18cb4566a14613c00c51b7a2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1264, 1264, 'http://www.headingtech.com/center/tz/6/4b7b8467ede64f178008f8daf99012bf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1265, 1265, 'http://www.headingtech.com/center/tz/6/9e296e9906ba4668b74a0fe7090dfb42/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1266, 1266, 'http://www.headingtech.com/center/tz/6/eeb0f4f24f3244739b966456014e308d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1267, 1267, 'http://www.headingtech.com/center/tz/6/c92a99ebc0ec4a5d905ad2846f87d36c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1268, 1268, 'http://www.headingtech.com/center/tz/6/3140e85b79ae42dd8061b22a1ae1a1cf/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1269, 1269, 'http://www.headingtech.com/center/tz/6/2444e38353354b058e2ab0afcd6e2edc/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1270, 1270, 'http://www.headingtech.com/center/tz/6/55e1a669515449b4b241196d48c7f33a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1271, 1271, 'http://www.headingtech.com/center/tz/6/bfef95d4174e4befa3a79afc5fa3ff8a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1272, 1272, 'http://www.headingtech.com/center/tz/6/a04de05a813e4f58bcf1af4c588e3d14/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1273, 1273, 'http://www.headingtech.com/center/tz/6/78ddf2e66c3544bd91665e97ea1dc93c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1274, 1274, 'http://www.headingtech.com/center/tz/6/88fbced4853e484e850d0966c58ef46b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1275, 1275, 'http://www.headingtech.com/center/tz/6/77831d5603ee4d539c59607874f23ce0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1276, 1276, 'http://www.headingtech.com/center/tz/6/4897bced4ace486dbcfc9916c281be5e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1277, 1277, 'http://www.headingtech.com/center/tz/6/7880250683af42bb859fd0f53c16b1af/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1278, 1278, 'http://www.headingtech.com/center/tz/6/9836c242287a4b16b376499931a65529/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1279, 1279, 'http://www.headingtech.com/center/tz/6/28204a79bc5948758ace50e4f0ecc1f4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1280, 1280, 'http://www.headingtech.com/center/tz/6/c39a846037dd4979a5a2c0b6f02a8987/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1281, 1281, 'http://www.headingtech.com/center/tz/6/eb7fdbe4e06243ab9c9c1c2bd6b38474/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1282, 1282, 'http://www.headingtech.com/center/tz/6/7b9e40c7f1774b51ba4d3b468d227d19/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1283, 1283, 'http://www.headingtech.com/center/tz/6/7b62ba2e7b054f78bc8fb4a94457c879/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1284, 1284, 'http://www.headingtech.com/center/tz/6/2b89ee0ab6f84e8ab009ad3c39b322fb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1285, 1285, 'http://www.headingtech.com/center/tz/6/87a22275a5d54fc59da4e5acb296462e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1286, 1286, 'http://www.headingtech.com/center/tz/6/44e17b7ce9f24e85b133798a036fd93f/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1287, 1287, 'http://www.headingtech.com/center/tz/6/75f69aeaa1814bd681f6a9815517a6c1/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1288, 1288, 'http://www.headingtech.com/center/tz/6/49793787a4cb4990b9317886811830e5/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1289, 1289, 'http://www.headingtech.com/center/tz/6/4ed284dfbade40589fb2acc8365b718b/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1290, 1290, 'http://www.headingtech.com/center/tz/6/5b7debbde4414153957e48d94bead7e4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1291, 1291, 'http://www.headingtech.com/center/tz/6/91d2d448905349f9be40e63dba384f1d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1292, 1292, 'http://www.headingtech.com/center/tz/6/beaee3121fab4c9c9047e3991b4d6036/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1293, 1293, 'http://www.headingtech.com/center/tz/6/a01098a98ac6424a8d46b59c718d37f6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1294, 1294, 'http://www.headingtech.com/center/tz/6/3a756c7056bd4dbcbd59ae16bb664607/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1295, 1295, 'http://www.headingtech.com/center/tz/6/5129d2554a93470986cb62387cc80238/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1296, 1296, 'http://www.headingtech.com/center/tz/6/ef9ef1ee668545fb8870d0cab3958a97/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1297, 1297, 'http://www.headingtech.com/center/tz/6/2e7d0f3fa9e646d6a15eb13a4db1efbb/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1298, 1298, 'http://www.headingtech.com/center/tz/6/594ca5238e044503ba070fa3a26f594e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1299, 1299, 'http://www.headingtech.com/center/tz/6/c035b55e2cbb424fb7e3990368213a98/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1300, 1300, 'http://www.headingtech.com/center/tz/6/68b4b970a60c4ec599100a809b232bcd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1301, 1301, 'http://www.headingtech.com/center/tz/6/dd3306fc56ce4ff78f87d70e10882a51/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1302, 1302, 'http://www.headingtech.com/center/tz/6/a08518a8d49f44beb57a6a7c70b71c73/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1303, 1303, 'http://www.headingtech.com/center/tz/6/1543cece6e4243ad8428a593b6c2da3e/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1304, 1304, 'http://www.headingtech.com/center/tz/6/217c51bde17942bb9f9900b9c48e3b6a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1305, 1305, 'http://www.headingtech.com/center/tz/6/7ab4a22d759540ef86dfafcaa1461dff/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1306, 1306, 'http://www.headingtech.com/center/tz/6/d9b6e5ea478b48fd8338c502b2dc5932/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1307, 1307, 'http://www.headingtech.com/center/tz/6/243034d205e74200ad59ef6c6e350c82/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1308, 1308, 'http://www.headingtech.com/center/tz/6/736dd899385f4582af83c557dfee2068/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1309, 1309, 'http://www.headingtech.com/center/tz/6/2f2d89c51dbe44f8aee53eca7ce6425a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1310, 1310, 'http://www.headingtech.com/center/tz/6/6d894802fd174597b8301a5f8574d58a/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1311, 1311, 'http://www.headingtech.com/center/tz/6/78761101f31141638c8c4f6b02c93f60/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1312, 1312, 'http://www.headingtech.com/center/tz/6/7459b37f45474f32b61da355fae052d7/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1313, 1313, 'http://www.headingtech.com/center/tz/6/5be4edfe93e545cf911c567ed1ab0e09/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1314, 1314, 'http://www.headingtech.com/center/tz/6/e8fcdec858b8473f8bd8076ce9a8eeba/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1315, 1315, 'http://www.headingtech.com/center/tz/6/5f623f9f30c14a5a85a9786523743cb3/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1316, 1316, 'http://www.headingtech.com/center/tz/6/c01b563755f849708017d918300381fd/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1317, 1317, 'http://www.headingtech.com/center/tz/6/09feb402fecb45fb95f9fdac2c1237e0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1318, 1318, 'http://www.headingtech.com/center/tz/6/4a8ab4e066bb4841943db439837a4bd8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1319, 1319, 'http://www.headingtech.com/center/tz/6/2ec9e5767f0b46f49fe8564ab8d1717d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1320, 1320, 'http://www.headingtech.com/center/tz/6/a4945fc3c240486599758d6d4057b2ee/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1321, 1321, 'http://www.headingtech.com/center/tz/6/cd63376fab5a424eb5671e67ee53adf0/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1322, 1322, 'http://www.headingtech.com/center/tz/6/0d77767debfe4954b8cc5e3690ce20e2/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1323, 1323, 'http://www.headingtech.com/center/tz/6/2dff7d25677d468b9d66cd1ac41a7068/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1324, 1324, 'http://www.headingtech.com/center/tz/6/14aa6792b6e84cafba1e19a6a31cb976/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1325, 1325, 'http://www.headingtech.com/center/tz/6/2dd3bdd858d24245b5eb2e499fd10085/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1326, 1326, 'http://www.headingtech.com/center/tz/6/17ddff60222a406f90ed6abacd022798/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1327, 1327, 'http://www.headingtech.com/center/tz/6/5520707b32cf4a229a2d74272e358d4c/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1328, 1328, 'http://www.headingtech.com/center/tz/6/7b33c9b5bfc44f86b24612b92931c2b8/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1329, 1329, 'http://www.headingtech.com/center/tz/6/179232a5646549c99991774fd8194ec4/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1330, 1330, 'http://www.headingtech.com/center/tz/6/ce3158bff03343caa7e77becbed9d1ce/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1331, 1331, 'http://www.headingtech.com/center/tz/6/9a02500b6149469db11cf20892626dd6/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1332, 1332, 'http://www.headingtech.com/center/tz/6/c2c471fd625c4d41b67a22a8211da143/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1333, 1333, 'http://www.headingtech.com/center/tz/6/33298ed668d5499f9dc4e1485d1e6157/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1334, 1334, 'http://www.headingtech.com/center/tz/6/b437b427ebfd4ed4a275d31caa2e489d/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1335, 1335, 'http://www.headingtech.com/center/tz/6/b2ba7fceca0e4acea39283a20dca3432/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1336, 1336, 'http://www.headingtech.com/center/tz/6/8ae741a7740746ceb3dce251e3f66720/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1337, 1337, 'http://www.headingtech.com/center/tz/6/09784022afde4b1286e588b8f7f25c67/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1338, 1338, 'http://www.headingtech.com/center/tz/6/f4bcb81708b942c6a6959c8bd703f339/12', '20181203230128', 2, 4, '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_201812` VALUES (1339, 1339, 'http://www.headingtech.com/center/tz/6/0afd980f8ba94b75b63a6abb3288a605/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1340, 1340, 'http://www.headingtech.com/center/tz/6/4cb8ceeb2bcf4a32b76416af969469bd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1341, 1341, 'http://www.headingtech.com/center/tz/6/f5a836af7ba5452fa9113ce75ae6145a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1342, 1342, 'http://www.headingtech.com/center/tz/6/c642b974ac8644aea2568e77c1732430/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1343, 1343, 'http://www.headingtech.com/center/tz/6/2dce1a9108c44c6abf0b107deb924a6d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1344, 1344, 'http://www.headingtech.com/center/tz/6/b9f0d3f3542048218224f7677d977b7c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1345, 1345, 'http://www.headingtech.com/center/tz/6/dee04d06ee0c45bbbdb8768f8094afb9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1346, 1346, 'http://www.headingtech.com/center/tz/6/d50941360b4440d59aa70f19d2d4ad64/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1347, 1347, 'http://www.headingtech.com/center/tz/6/00852b9f4f2b41e483149eed1eed7305/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1348, 1348, 'http://www.headingtech.com/center/tz/6/5aced466992e483a99cf43e49950e42f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1349, 1349, 'http://www.headingtech.com/center/tz/6/72b144e505274c3ca5a25401574a44e6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1350, 1350, 'http://www.headingtech.com/center/tz/6/f3b392f2dcb5481caa00c5c1bf4caf3a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1351, 1351, 'http://www.headingtech.com/center/tz/6/52f66df10e934a96a385ee088f3ed809/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1352, 1352, 'http://www.headingtech.com/center/tz/6/f60c44055c3341768adde1e9a5e275cd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1353, 1353, 'http://www.headingtech.com/center/tz/6/2fde124620a14542af5a6b5f044e1e1b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1354, 1354, 'http://www.headingtech.com/center/tz/6/c397da6eeb1a4f898eaf5fdde66ebd91/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1355, 1355, 'http://www.headingtech.com/center/tz/6/38aba2ca2fcc48868ca64fc9bede6d81/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1356, 1356, 'http://www.headingtech.com/center/tz/6/d9d9a251fd4441168da744da31686cc3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1357, 1357, 'http://www.headingtech.com/center/tz/6/564b05810acf4798a05a1fda7e593038/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1358, 1358, 'http://www.headingtech.com/center/tz/6/9f57790f4863492e9c641018e94afaf7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1359, 1359, 'http://www.headingtech.com/center/tz/6/06a6467187d2420a96d0305f0f201180/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1360, 1360, 'http://www.headingtech.com/center/tz/6/e90817e064e5443db17d2760f202cea6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1361, 1361, 'http://www.headingtech.com/center/tz/6/af79b81623f4465f83197cf5cc0b0bac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1362, 1362, 'http://www.headingtech.com/center/tz/6/92ac4ced33d4414588d78be9c5cef5d5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1363, 1363, 'http://www.headingtech.com/center/tz/6/e6da471905b7467894cfd157aa3f4b3c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1364, 1364, 'http://www.headingtech.com/center/tz/6/925e732fffb147d2a135ce7ae9c8fd38/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1365, 1365, 'http://www.headingtech.com/center/tz/6/93f2652df0b344ae9b13d57f2750f09b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1366, 1366, 'http://www.headingtech.com/center/tz/6/6a3b42057e2c423c9320c9d054c1a74a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1367, 1367, 'http://www.headingtech.com/center/tz/6/3de8bc19641b435cbf3a2a35ce3ab048/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1368, 1368, 'http://www.headingtech.com/center/tz/6/435b068eda2d4db98719739760d89183/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1369, 1369, 'http://www.headingtech.com/center/tz/6/e837b7c40ac74edc8e382577bd52ea0a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1370, 1370, 'http://www.headingtech.com/center/tz/6/320c4ac473df4866b3688b75f095554d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1371, 1371, 'http://www.headingtech.com/center/tz/6/5769feec612f4708af3c78a9b1c6598a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1372, 1372, 'http://www.headingtech.com/center/tz/6/afce6f6177cb4bcaaa4f78da15a863e5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1373, 1373, 'http://www.headingtech.com/center/tz/6/bb5e30af5f0240babd6c987f38d04a5e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1374, 1374, 'http://www.headingtech.com/center/tz/6/b7056a67f3a94ffb9b3eb6775b451cc5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1375, 1375, 'http://www.headingtech.com/center/tz/6/f414207dbf9549ea977f8f95a45a4c32/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1376, 1376, 'http://www.headingtech.com/center/tz/6/8a326379f44447148b86fafed297c8df/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1377, 1377, 'http://www.headingtech.com/center/tz/6/1d9d4d81248d4038b0c607bae1b90415/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1378, 1378, 'http://www.headingtech.com/center/tz/6/02424ee32ff448c2b4b3fb9c7a5232ff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1379, 1379, 'http://www.headingtech.com/center/tz/6/d30867e272594be3bdbaa645f80efc82/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1380, 1380, 'http://www.headingtech.com/center/tz/6/0f9654580d764973a3556a55652353cc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1381, 1381, 'http://www.headingtech.com/center/tz/6/216c0ba1578e4365ab54dc72dc5b77d2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1382, 1382, 'http://www.headingtech.com/center/tz/6/60997641b5b94997b5043c6da8c1ee84/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1383, 1383, 'http://www.headingtech.com/center/tz/6/e6c4d709604d4220aefb73e6d6a6bfa3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1384, 1384, 'http://www.headingtech.com/center/tz/6/9d34d1126fb64b808b539b75a50d944d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1385, 1385, 'http://www.headingtech.com/center/tz/6/87afdce5cc774f519a8abd4f3ddf28f5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1386, 1386, 'http://www.headingtech.com/center/tz/6/d11c34fe7e094951bf8fa0f9ff240288/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1387, 1387, 'http://www.headingtech.com/center/tz/6/2c217d26b1b345c5a697761be279f91f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1388, 1388, 'http://www.headingtech.com/center/tz/6/e592ad1fc681474391416dd565d78579/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1389, 1389, 'http://www.headingtech.com/center/tz/6/e65b4ac346d34bd484a4fa02be53d92f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1390, 1390, 'http://www.headingtech.com/center/tz/6/87aa5e4d16a54263b8a21b9578cc95c2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1391, 1391, 'http://www.headingtech.com/center/tz/6/0561565cf28942b2809126105a445924/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1392, 1392, 'http://www.headingtech.com/center/tz/6/c2d4c6b7ae0948c9ae1e772133cd1b53/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1393, 1393, 'http://www.headingtech.com/center/tz/6/6a7ceaee74ea4d2089eae7c4ecca0e1f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1394, 1394, 'http://www.headingtech.com/center/tz/6/cc611927db45453c89700023c66ce288/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1395, 1395, 'http://www.headingtech.com/center/tz/6/097b80fa9c914727bee82fe2fd3c7989/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1396, 1396, 'http://www.headingtech.com/center/tz/6/24e0c94cbf06490faa226d8d25b3f1f2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1397, 1397, 'http://www.headingtech.com/center/tz/6/b34a695fdffb403e932a12c76b1cbd82/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1398, 1398, 'http://www.headingtech.com/center/tz/6/e63ac1c930904555b16bdedab247fc47/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1399, 1399, 'http://www.headingtech.com/center/tz/6/0775c2e012dd4ce58ab0495ad0d64213/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1400, 1400, 'http://www.headingtech.com/center/tz/6/5f8004d834f047898d8a629df6a1dd85/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1401, 1401, 'http://www.headingtech.com/center/tz/6/4c5825e3adf2429aa5b989ba24d60de6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1402, 1402, 'http://www.headingtech.com/center/tz/6/821b302722354c098a6c45ce54118f71/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1403, 1403, 'http://www.headingtech.com/center/tz/6/545dc3fa4f66442783e3b2e07e9609ec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1404, 1404, 'http://www.headingtech.com/center/tz/6/5f4de859ba434c79be7ab61ea2d1baff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1405, 1405, 'http://www.headingtech.com/center/tz/6/e3ef44f64f964482b101cd43a339a975/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1406, 1406, 'http://www.headingtech.com/center/tz/6/f16c762ff08b4de190aef3b4dc0b5950/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1407, 1407, 'http://www.headingtech.com/center/tz/6/44d1adb8f35344ecb29c15904a92951f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1408, 1408, 'http://www.headingtech.com/center/tz/6/5f02f8b28aa84b489af315cacb8a3c19/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1409, 1409, 'http://www.headingtech.com/center/tz/6/93e70db11a954f60ae6f7cc2a5f2ac58/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1410, 1410, 'http://www.headingtech.com/center/tz/6/32ac211778ba43bb87082611bd705549/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1411, 1411, 'http://www.headingtech.com/center/tz/6/ab8ee914bd57473392ef82e2d81849f3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1412, 1412, 'http://www.headingtech.com/center/tz/6/de79d8ed1c30453cbc08a0b6e7e0d2f5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1413, 1413, 'http://www.headingtech.com/center/tz/6/8a309bde7df34d82ba4cbe5a6d211644/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1414, 1414, 'http://www.headingtech.com/center/tz/6/2d70d31e464a44d3a35eff85343e2e04/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1415, 1415, 'http://www.headingtech.com/center/tz/6/80bd95a3b966434dbed32114cd543bc4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1416, 1416, 'http://www.headingtech.com/center/tz/6/90b8004c26da434595a90d921a765e5a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1417, 1417, 'http://www.headingtech.com/center/tz/6/b5e4c322eda5469596162223a4f4c9b0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1418, 1418, 'http://www.headingtech.com/center/tz/6/3c36c46b55f2486c96c7966100d22dfe/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1419, 1419, 'http://www.headingtech.com/center/tz/6/8ca578522d984fdd939d1042f1526c05/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1420, 1420, 'http://www.headingtech.com/center/tz/6/a8de8789f55f4e8baad7727f79193869/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1421, 1421, 'http://www.headingtech.com/center/tz/6/860e5eb2dbfb40d0bd22cff3b5fa9294/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1422, 1422, 'http://www.headingtech.com/center/tz/6/470cb91066f5454bbc679ee45da0b177/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1423, 1423, 'http://www.headingtech.com/center/tz/6/99d9a2f35edf4e349e3327aafe9e8fa4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1424, 1424, 'http://www.headingtech.com/center/tz/6/8649961a897d43bd9e5e116193ccc6bf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1425, 1425, 'http://www.headingtech.com/center/tz/6/05e93d2719444b1d93db132b959279b8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1426, 1426, 'http://www.headingtech.com/center/tz/6/6999e5d8971a4263bc3ad29085c4ff7b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1427, 1427, 'http://www.headingtech.com/center/tz/6/cb1287720f6e44328ec41ffb575e11fd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1428, 1428, 'http://www.headingtech.com/center/tz/6/96660c47091642f389f23a4b5869cc87/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1429, 1429, 'http://www.headingtech.com/center/tz/6/1a8d7aa8e5e448cd80b4912618655dcc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1430, 1430, 'http://www.headingtech.com/center/tz/6/984fff247ead4cd7a755ef1a02422078/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1431, 1431, 'http://www.headingtech.com/center/tz/6/70ecf56f7de94383b23ddc100a1b0a5d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1432, 1432, 'http://www.headingtech.com/center/tz/6/441f431a9bf240baaa41228375685eaa/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1433, 1433, 'http://www.headingtech.com/center/tz/6/893f6d425d2b44a5a783d95e5e687a91/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1434, 1434, 'http://www.headingtech.com/center/tz/6/22857da2ab1c4e34b23556290798017e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1435, 1435, 'http://www.headingtech.com/center/tz/6/1b01ca269953469d843cbb1f8f791f59/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1436, 1436, 'http://www.headingtech.com/center/tz/6/3fd3ced9e545411292c2182941b80447/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1437, 1437, 'http://www.headingtech.com/center/tz/6/63865b5ccdf64ba29a49276e2bc73cb1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1438, 1438, 'http://www.headingtech.com/center/tz/6/020c8abbab7f414f9782c051959d75ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1439, 1439, 'http://www.headingtech.com/center/tz/6/3b58e2a7c94a44d58584cd0118d2bf28/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1440, 1440, 'http://www.headingtech.com/center/tz/6/223770a871f64bf0982917bc2ec375cd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1441, 1441, 'http://www.headingtech.com/center/tz/6/98c385d0881e4d06b32fb8f3dd4b2484/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1442, 1442, 'http://www.headingtech.com/center/tz/6/d422e2ddb61846f0b812e2913ab3108e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1443, 1443, 'http://www.headingtech.com/center/tz/6/ccd88cb9bded477fafac8fe9b9e1990e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1444, 1444, 'http://www.headingtech.com/center/tz/6/c45f4ae11531478ca9f27afcfa68913b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1445, 1445, 'http://www.headingtech.com/center/tz/6/2f8cb95ace584717942e9a7c337bc483/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1446, 1446, 'http://www.headingtech.com/center/tz/6/b448b9198eb04c51abacf3611cc58fb7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1447, 1447, 'http://www.headingtech.com/center/tz/6/3731e14f84e44c1196244114a4664600/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1448, 1448, 'http://www.headingtech.com/center/tz/6/19f559e0dba44a058e59671e1d9f5980/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1449, 1449, 'http://www.headingtech.com/center/tz/6/ac98b0f2f13c4d63bd6a21a525424634/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1450, 1450, 'http://www.headingtech.com/center/tz/6/1784ec36d05d4641844377218d69f421/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1451, 1451, 'http://www.headingtech.com/center/tz/6/024c52e82e9149fba559e1ca7aae97cf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1452, 1452, 'http://www.headingtech.com/center/tz/6/ae03a13513384a58b729713f71378796/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1453, 1453, 'http://www.headingtech.com/center/tz/6/1985abc5534c4cfd83ffd33431b7b165/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1454, 1454, 'http://www.headingtech.com/center/tz/6/d8186a7e92d94370ba61a98e9648f99c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1455, 1455, 'http://www.headingtech.com/center/tz/6/45b94eda3cb54e4c8cce254d417cdefe/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1456, 1456, 'http://www.headingtech.com/center/tz/6/2a60df6c9135432694d20cb2c14f514d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1457, 1457, 'http://www.headingtech.com/center/tz/6/00a37cfc215d4d379ba7d4de92c09ca3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1458, 1458, 'http://www.headingtech.com/center/tz/6/b432d117127f4e1897d8cf219bd446ca/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1459, 1459, 'http://www.headingtech.com/center/tz/6/d08d737eb3174116904e9634dc062129/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1460, 1460, 'http://www.headingtech.com/center/tz/6/9bbe977e0cd647e9855fc98d984a8c53/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1461, 1461, 'http://www.headingtech.com/center/tz/6/d52a7b62638943c59238f371f05604bc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1462, 1462, 'http://www.headingtech.com/center/tz/6/6318135024f34a99b378fec5a3958e59/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1463, 1463, 'http://www.headingtech.com/center/tz/6/0a854eb4aebe4ba59d75ac5a81a5fce5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1464, 1464, 'http://www.headingtech.com/center/tz/6/c1f1f401e83a470f800e8998c4053d68/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1465, 1465, 'http://www.headingtech.com/center/tz/6/02d76423070c4ee4be5d2eef3a99adcf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1466, 1466, 'http://www.headingtech.com/center/tz/6/e2056e67de5d49f993e705681c1a64f8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1467, 1467, 'http://www.headingtech.com/center/tz/6/5dca004f267e4d319e23cddbcf05bba7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1468, 1468, 'http://www.headingtech.com/center/tz/6/3869ae9a0b244b4da7a43143653e8634/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1469, 1469, 'http://www.headingtech.com/center/tz/6/9b11a0a8d21b4857918f7389bd155bff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1470, 1470, 'http://www.headingtech.com/center/tz/6/a254775e18c7485594ee77a8e14e54a3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1471, 1471, 'http://www.headingtech.com/center/tz/6/7ba2c8440a8d4843a90209bfbcd5309f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1472, 1472, 'http://www.headingtech.com/center/tz/6/7b0e4f9380bc43d390321ea257db313b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1473, 1473, 'http://www.headingtech.com/center/tz/6/128b9a17f3b3452daa4d656267086564/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1474, 1474, 'http://www.headingtech.com/center/tz/6/d16daf754970456da004b1bb68029902/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1475, 1475, 'http://www.headingtech.com/center/tz/6/8406890ea5ea4c4e94d8471f8831d69f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1476, 1476, 'http://www.headingtech.com/center/tz/6/1afe813c02274bc39a4ffff723dfd98c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1477, 1477, 'http://www.headingtech.com/center/tz/6/d76e1499f41d427db4029d578ff063da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1478, 1478, 'http://www.headingtech.com/center/tz/6/9f3f0dac2cf04369948cebed9c581934/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1479, 1479, 'http://www.headingtech.com/center/tz/6/82863abd59b64d0e88839791671f7424/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1480, 1480, 'http://www.headingtech.com/center/tz/6/2754385811824e66a22c866e235a2ca6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1481, 1481, 'http://www.headingtech.com/center/tz/6/1cb05052b94c4d1f981de2feafd28d1e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1482, 1482, 'http://www.headingtech.com/center/tz/6/687ae523301d4c00bbd4ae739ef7405c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1483, 1483, 'http://www.headingtech.com/center/tz/6/be314b633d5c40f09857670747e00ddb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1484, 1484, 'http://www.headingtech.com/center/tz/6/6a80dc1fdfed46ff994a7ec0776059a3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1485, 1485, 'http://www.headingtech.com/center/tz/6/9fd14970a21844ffa86888db4580603f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1486, 1486, 'http://www.headingtech.com/center/tz/6/b618e7dcae6448cc85a8597642ceea52/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1487, 1487, 'http://www.headingtech.com/center/tz/6/0c4e81284fb944fba4672a9822fee255/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1488, 1488, 'http://www.headingtech.com/center/tz/6/9f911cbcfd424231937979ca0e993e5e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1489, 1489, 'http://www.headingtech.com/center/tz/6/c967c84259864d6d82b65c3099270f2c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1490, 1490, 'http://www.headingtech.com/center/tz/6/bbd84f99af7446efbaa59b5288a0cf17/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1491, 1491, 'http://www.headingtech.com/center/tz/6/3a17eb39f636418282ac45f240dc9372/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1492, 1492, 'http://www.headingtech.com/center/tz/6/871ba48f5c1644e5b09773d78459df17/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1493, 1493, 'http://www.headingtech.com/center/tz/6/2bcdb2925d89410e9efee3a6d9ac8849/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1494, 1494, 'http://www.headingtech.com/center/tz/6/52e83ea804b344f6b723e8fe3b528290/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1495, 1495, 'http://www.headingtech.com/center/tz/6/3a20b132ce29429e835c0cd06d347988/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1496, 1496, 'http://www.headingtech.com/center/tz/6/a8d5eab5ae4140449251eeddf53e780d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1497, 1497, 'http://www.headingtech.com/center/tz/6/a62720d8598548f2be6bfd806fa9569e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1498, 1498, 'http://www.headingtech.com/center/tz/6/fad2288c090d4b988bdddadcc74276fc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1499, 1499, 'http://www.headingtech.com/center/tz/6/54820e1deebd4efca8403a7063d18939/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1500, 1500, 'http://www.headingtech.com/center/tz/6/4fef4696979c4fdba9a580a6e7107fb4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1501, 1501, 'http://www.headingtech.com/center/tz/6/cbc572ddecda442484b4cf5e30dcd5c8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1502, 1502, 'http://www.headingtech.com/center/tz/6/b74e653405f940d19eafd72e9f20f521/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1503, 1503, 'http://www.headingtech.com/center/tz/6/d11446618a264bbe9ff4ab676167d491/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1504, 1504, 'http://www.headingtech.com/center/tz/6/186ff7c32f7a4a928213b3fff483e5a1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1505, 1505, 'http://www.headingtech.com/center/tz/6/26d34086a56c4e28b07fd825f3930a02/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1506, 1506, 'http://www.headingtech.com/center/tz/6/2c87875c5e464961b624db2ce3929271/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1507, 1507, 'http://www.headingtech.com/center/tz/6/dc67e24aed474d8e91e5f85ca37b0564/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1508, 1508, 'http://www.headingtech.com/center/tz/6/c101664bcbd44ac1acf8a742b75d516e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1509, 1509, 'http://www.headingtech.com/center/tz/6/9534358312704943b9037167c302b15a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1510, 1510, 'http://www.headingtech.com/center/tz/6/0e8b3f38cb3740aeba1dffbf88a3335f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1511, 1511, 'http://www.headingtech.com/center/tz/6/45f35275ecf54edd97fd54a8e6a18de4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1512, 1512, 'http://www.headingtech.com/center/tz/6/405763dfa3c94f7188c796b0a932e3b5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1513, 1513, 'http://www.headingtech.com/center/tz/6/15cae690fe0a4e78829f404c16b911ec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1514, 1514, 'http://www.headingtech.com/center/tz/6/e34954a029a94d43bd5a028e5945e747/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1515, 1515, 'http://www.headingtech.com/center/tz/6/92fae13c9a004b6cb30d2f554de34cb8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1516, 1516, 'http://www.headingtech.com/center/tz/6/f3e2f4ff1494478f916b4f1cea090f86/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1517, 1517, 'http://www.headingtech.com/center/tz/6/9fbf43e96b094525a0e252ab8b764b6e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1518, 1518, 'http://www.headingtech.com/center/tz/6/08ca536783374b78b2efc1d69ab46f02/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1519, 1519, 'http://www.headingtech.com/center/tz/6/97e84a5c79ed44b5823ce440e5d09cd7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1520, 1520, 'http://www.headingtech.com/center/tz/6/f14be782015a48bdb6e5d26ca41a82de/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1521, 1521, 'http://www.headingtech.com/center/tz/6/f34da99f00bf42b3b2f28982e1575cec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1522, 1522, 'http://www.headingtech.com/center/tz/6/d128e1670a334a60b1b08f57507b2869/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1523, 1523, 'http://www.headingtech.com/center/tz/6/d550c7cb2ab7463391659204755bde86/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1524, 1524, 'http://www.headingtech.com/center/tz/6/73fa0bcfd37f4802a1266232839a1e0a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1525, 1525, 'http://www.headingtech.com/center/tz/6/aecd93b59a2144e0a0f5acdbca41ec7e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1526, 1526, 'http://www.headingtech.com/center/tz/6/8fe23b0168324a2eb81ce9670ee25b86/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1527, 1527, 'http://www.headingtech.com/center/tz/6/9fe33648014046c0844fb084de9c6f62/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1528, 1528, 'http://www.headingtech.com/center/tz/6/5d3147d781d64f8d811b655ce3f4d5be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1529, 1529, 'http://www.headingtech.com/center/tz/6/09c28798a2e5481f93c7b4afe81a646d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1530, 1530, 'http://www.headingtech.com/center/tz/6/9989d2d4d7b64be2bf9c125003ef211b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1531, 1531, 'http://www.headingtech.com/center/tz/6/105e88cc593943efb2fcabd241fedfdf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1532, 1532, 'http://www.headingtech.com/center/tz/6/d3155ffda8c14e718d1891363cc951d0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1533, 1533, 'http://www.headingtech.com/center/tz/6/4ecf6fd4903c4939a4f4595e7ff22a8f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1534, 1534, 'http://www.headingtech.com/center/tz/6/a4e9bebd114e4797bf99c89dff1621b4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1535, 1535, 'http://www.headingtech.com/center/tz/6/4dbdd2d3c2354b09ab9fca7497e949a5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1536, 1536, 'http://www.headingtech.com/center/tz/6/824dc036b24148c1a306163d04214f2e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1537, 1537, 'http://www.headingtech.com/center/tz/6/3af36e2a4f30434aa839c50a49300531/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1538, 1538, 'http://www.headingtech.com/center/tz/6/b35ffe0b855d411bbee804728fbc0920/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1539, 1539, 'http://www.headingtech.com/center/tz/6/cfc0a0e8412d4cc0a35758c2e226cbac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1540, 1540, 'http://www.headingtech.com/center/tz/6/18719802598747a5be4f631358c8f097/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1541, 1541, 'http://www.headingtech.com/center/tz/6/0119a8997c8e4e5cbe79a59d9c8f652b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1542, 1542, 'http://www.headingtech.com/center/tz/6/67386c2a8337464bbedee214cb0f7576/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1543, 1543, 'http://www.headingtech.com/center/tz/6/8db4995304e347a09f09af1d1459019a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1544, 1544, 'http://www.headingtech.com/center/tz/6/4c406cc64dc54a408906b2e8526cabea/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1545, 1545, 'http://www.headingtech.com/center/tz/6/4583a887b2a4400ebc47590d147d528d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1546, 1546, 'http://www.headingtech.com/center/tz/6/485d6a0ebc51463c900f6059a0afee20/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1547, 1547, 'http://www.headingtech.com/center/tz/6/e1c49ae1517247c3af65f8f2c0e51597/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1548, 1548, 'http://www.headingtech.com/center/tz/6/191f0a00b2a14eb1968c122d9f608516/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1549, 1549, 'http://www.headingtech.com/center/tz/6/984eaf0994a842139b0057b67ec40e4e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1550, 1550, 'http://www.headingtech.com/center/tz/6/a2a558882b1846768f7dd6a89bb80b81/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1551, 1551, 'http://www.headingtech.com/center/tz/6/a9764842b1cd4e7f81dbe811fc743ab3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1552, 1552, 'http://www.headingtech.com/center/tz/6/326fb7c0e7f842908863f39a78efcb0f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1553, 1553, 'http://www.headingtech.com/center/tz/6/1f2d6fc039664579abef59bb3ae7c9f7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1554, 1554, 'http://www.headingtech.com/center/tz/6/c364056224eb410fb899a5cc1b248155/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1555, 1555, 'http://www.headingtech.com/center/tz/6/5dc3f1a8468846eea09e907c3b620a3d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1556, 1556, 'http://www.headingtech.com/center/tz/6/75f52d7030a54b83b2f7c93c618cd9ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1557, 1557, 'http://www.headingtech.com/center/tz/6/a3d0e9f0ffe44313b40d6f64041f37ea/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1558, 1558, 'http://www.headingtech.com/center/tz/6/067d70b1f36e4657b19136753b4300ae/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1559, 1559, 'http://www.headingtech.com/center/tz/6/ac1b2df8144f44cab461f4ae50068981/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1560, 1560, 'http://www.headingtech.com/center/tz/6/6c348017512f49df8165768f696c7067/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1561, 1561, 'http://www.headingtech.com/center/tz/6/8826f2a177b04b5ca77db5a8f0148538/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1562, 1562, 'http://www.headingtech.com/center/tz/6/4ec3d4c613d846adac9735c6329e20dc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1563, 1563, 'http://www.headingtech.com/center/tz/6/9d07c0ddc8b54f2dac7948959440be4f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1564, 1564, 'http://www.headingtech.com/center/tz/6/815be84aedf24db8bb0db6feb7cc5d72/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1565, 1565, 'http://www.headingtech.com/center/tz/6/f0fadefbcc094e1eba2629af28ac134c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1566, 1566, 'http://www.headingtech.com/center/tz/6/89fc14940681459486677f48e7db14cb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1567, 1567, 'http://www.headingtech.com/center/tz/6/dd72283a754b4df6bcf12bde496062cf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1568, 1568, 'http://www.headingtech.com/center/tz/6/4b58dc5a6f5249118f9ec88ef32b6ae1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1569, 1569, 'http://www.headingtech.com/center/tz/6/38ef38178fda4b0e9061f884bc948163/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1570, 1570, 'http://www.headingtech.com/center/tz/6/35905e30edcd4d4e93bbaa6b608e391e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1571, 1571, 'http://www.headingtech.com/center/tz/6/1a2fe1326a0a41408307a0d5da8d5e27/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1572, 1572, 'http://www.headingtech.com/center/tz/6/689505f66ba64d27976c11bfdafdcbff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1573, 1573, 'http://www.headingtech.com/center/tz/6/ab148e3266344a108ed58cc602ceaf3f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1574, 1574, 'http://www.headingtech.com/center/tz/6/1de8aa8d54024a3888ecf7aed8db3387/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1575, 1575, 'http://www.headingtech.com/center/tz/6/21fb5ac10bc9478d95c51e331853f0ec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1576, 1576, 'http://www.headingtech.com/center/tz/6/637b01edbd2e41669b2062468428a755/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1577, 1577, 'http://www.headingtech.com/center/tz/6/7a51fb1b5b51439b9430c69a5c04af35/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1578, 1578, 'http://www.headingtech.com/center/tz/6/b0925dc236294a6ba5ae8b6af8c7e8c1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1579, 1579, 'http://www.headingtech.com/center/tz/6/34c448d027094f92be107b7a815771a7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1580, 1580, 'http://www.headingtech.com/center/tz/6/2f63dc49f4524dbd935911da1a5a3a72/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1581, 1581, 'http://www.headingtech.com/center/tz/6/1218148df2cb4663bf97ededdab77aff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1582, 1582, 'http://www.headingtech.com/center/tz/6/1a18923029804d8ca1e927c83f5b58db/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1583, 1583, 'http://www.headingtech.com/center/tz/6/5dc0b32ebecb49109fbe5f543a8a8f87/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1584, 1584, 'http://www.headingtech.com/center/tz/6/e5674406d3f14ce494680e976c6bc15a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1585, 1585, 'http://www.headingtech.com/center/tz/6/58028d94e8a74181ac64a090baac9dac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1586, 1586, 'http://www.headingtech.com/center/tz/6/12860616846c40549cf93613dd867b2d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1587, 1587, 'http://www.headingtech.com/center/tz/6/f2dfbcdbbcdc43249a1911ac07d1e1ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1588, 1588, 'http://www.headingtech.com/center/tz/6/1fbbc5579e8e492ab944085892311f74/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1589, 1589, 'http://www.headingtech.com/center/tz/6/6b41859812464662be4ece9060433406/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1590, 1590, 'http://www.headingtech.com/center/tz/6/81d42adabf044109b2966c3b88750eb6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1591, 1591, 'http://www.headingtech.com/center/tz/6/7b256153eb1d4012983580c10ff20050/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1592, 1592, 'http://www.headingtech.com/center/tz/6/b3a0f96f1fc04245bbf6253620a6dcd6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1593, 1593, 'http://www.headingtech.com/center/tz/6/e90be051a13a4926996e6e3fd548864b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1594, 1594, 'http://www.headingtech.com/center/tz/6/219dca8ba455467583d2a87d011699e3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1595, 1595, 'http://www.headingtech.com/center/tz/6/52b7966fc1474ddd93e313a4fb8cd296/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1596, 1596, 'http://www.headingtech.com/center/tz/6/dcbddf5f25bf4a96aa6fc727430531d3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1597, 1597, 'http://www.headingtech.com/center/tz/6/aa259d69eda643a2a1ff2a776b0bb6f3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1598, 1598, 'http://www.headingtech.com/center/tz/6/f28e0b6e55054137b63ff7b438ccf933/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1599, 1599, 'http://www.headingtech.com/center/tz/6/d551030b7679433db34e1975f9f267ef/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1600, 1600, 'http://www.headingtech.com/center/tz/6/aa391e1b63fb4c139ca4a03e6b728ed7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1601, 1601, 'http://www.headingtech.com/center/tz/6/17842bcbf0a24c1ea44fe94bd0868444/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1602, 1602, 'http://www.headingtech.com/center/tz/6/5f607f525857425ebc902c95f0517b9c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1603, 1603, 'http://www.headingtech.com/center/tz/6/12a8348dda0245d9acd903a0cf2e086c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1604, 1604, 'http://www.headingtech.com/center/tz/6/cd521aa220d4433e865def3cb64916b8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1605, 1605, 'http://www.headingtech.com/center/tz/6/2cb7ebf08a584a02b05694a346ff172b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1606, 1606, 'http://www.headingtech.com/center/tz/6/f640bfc0137f4fd38a0873c95fd69578/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1607, 1607, 'http://www.headingtech.com/center/tz/6/3f7b76b4ad2b4a47921056934dbca274/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1608, 1608, 'http://www.headingtech.com/center/tz/6/08a04c307d5f4f47a495bc0ad682910b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1609, 1609, 'http://www.headingtech.com/center/tz/6/c209c11e118847e8839073106b3ee8b0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1610, 1610, 'http://www.headingtech.com/center/tz/6/83265a6e7cf145db97e95886e3c4b35f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1611, 1611, 'http://www.headingtech.com/center/tz/6/4d543db561eb4638afe999b81f585bd0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1612, 1612, 'http://www.headingtech.com/center/tz/6/f59d5d4dcd5846a3a9a43bcb7a6b5eca/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1613, 1613, 'http://www.headingtech.com/center/tz/6/ece9909a225341dbb815f9c8b0f886ac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1614, 1614, 'http://www.headingtech.com/center/tz/6/533e55e5962749f7954d76a143e5490b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1615, 1615, 'http://www.headingtech.com/center/tz/6/18cca69ae3044898b5a8613b6fe6b0b9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1616, 1616, 'http://www.headingtech.com/center/tz/6/87a8a6a1ed2349dbbf0e26319d2da1ac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1617, 1617, 'http://www.headingtech.com/center/tz/6/4c4c409ae8204af98f13a7d3dcb08fde/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1618, 1618, 'http://www.headingtech.com/center/tz/6/b109cea176304b24a9cd5104e56f0c58/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1619, 1619, 'http://www.headingtech.com/center/tz/6/998654e5c5a6497fad8ea347183450bc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1620, 1620, 'http://www.headingtech.com/center/tz/6/81ededc9f59f4cc5b0f3ccad0084cc25/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1621, 1621, 'http://www.headingtech.com/center/tz/6/f10cf69732ce48d39a82442c2a6371b6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1622, 1622, 'http://www.headingtech.com/center/tz/6/0f4bf405b0e94ab78fff2d547c3d9edc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1623, 1623, 'http://www.headingtech.com/center/tz/6/f50c3bb66c27448aa646703660a08fd1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1624, 1624, 'http://www.headingtech.com/center/tz/6/6b8ac1dafaad46a8b77c7ca3ba5e1f0f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1625, 1625, 'http://www.headingtech.com/center/tz/6/15c2a125ab3e4b42b2c7e9accfeab75f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1626, 1626, 'http://www.headingtech.com/center/tz/6/14f8ddd16de2457fbea1cba9326f31eb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1627, 1627, 'http://www.headingtech.com/center/tz/6/54316cb9b88c4827a28bde3f927a3260/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1628, 1628, 'http://www.headingtech.com/center/tz/6/b8fee837518b4a73a51dd5f1f0d876db/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1629, 1629, 'http://www.headingtech.com/center/tz/6/57ee7386583c48d78691ce7de551be57/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1630, 1630, 'http://www.headingtech.com/center/tz/6/fffd3b5d2a374376a1a03b84f60ace1e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1631, 1631, 'http://www.headingtech.com/center/tz/6/cf0f4776158345f2a2d03359cd6e5fba/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1632, 1632, 'http://www.headingtech.com/center/tz/6/df10aa2cea0e41fa820affcdc3c1a606/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1633, 1633, 'http://www.headingtech.com/center/tz/6/c198eda59d674facaa97a0319f482ca2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1634, 1634, 'http://www.headingtech.com/center/tz/6/a505a5cc9a6e4580b212f533412d7e7f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1635, 1635, 'http://www.headingtech.com/center/tz/6/a027b3cff1e3470783de7529bc3c2731/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1636, 1636, 'http://www.headingtech.com/center/tz/6/a1896c9e1e2a40ac9a285c44f5447a90/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1637, 1637, 'http://www.headingtech.com/center/tz/6/ad0a41c47b494ea780cdbe7470071fc9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1638, 1638, 'http://www.headingtech.com/center/tz/6/0ad3ca4f28f649bbb8543fe7a71373e8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1639, 1639, 'http://www.headingtech.com/center/tz/6/27c6e2ae7cb34a6a89a112e6de8fd938/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1640, 1640, 'http://www.headingtech.com/center/tz/6/c48f47a6216440239d0f6a6239dace56/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1641, 1641, 'http://www.headingtech.com/center/tz/6/53a6eef143154a349b46404140641347/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1642, 1642, 'http://www.headingtech.com/center/tz/6/0d008ed57a2040fd897f9904c782cbd5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1643, 1643, 'http://www.headingtech.com/center/tz/6/f9f8c0e583254ec58b95f0f4466a5bae/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1644, 1644, 'http://www.headingtech.com/center/tz/6/d8632bda5ee04fc3a31a7f381ea479ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1645, 1645, 'http://www.headingtech.com/center/tz/6/0da4531db3574cfeb1723e42c5603111/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1646, 1646, 'http://www.headingtech.com/center/tz/6/4b785cd3d4a84a929e347499aa8cc20a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1647, 1647, 'http://www.headingtech.com/center/tz/6/378314a6bec147e392058af1419ab552/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1648, 1648, 'http://www.headingtech.com/center/tz/6/36285633c9a24bb28eedeb8678b9b5da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1649, 1649, 'http://www.headingtech.com/center/tz/6/f50b541b70e44a4faf67bb95f7a55c0e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1650, 1650, 'http://www.headingtech.com/center/tz/6/23bfb74957264b988395def59fa1df5a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1651, 1651, 'http://www.headingtech.com/center/tz/6/75454ed02796451d976054b2a885f1e3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1652, 1652, 'http://www.headingtech.com/center/tz/6/9e035981fbaf4b31afb80fe4d560157b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1653, 1653, 'http://www.headingtech.com/center/tz/6/75011834d899412db0b032aa038d65bd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1654, 1654, 'http://www.headingtech.com/center/tz/6/986be051d5f04836801667e3a6186fb6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1655, 1655, 'http://www.headingtech.com/center/tz/6/f9ef93206a7c45c495fdf949825ed0c0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1656, 1656, 'http://www.headingtech.com/center/tz/6/3ba2c47aac87418fb1f2dc012ddfcae8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1657, 1657, 'http://www.headingtech.com/center/tz/6/10f7e93c00154b9b89a3a0ae1010e820/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1658, 1658, 'http://www.headingtech.com/center/tz/6/7ee6961cef2b4b1c9589f7b901230088/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1659, 1659, 'http://www.headingtech.com/center/tz/6/e79e2c62f3934700960a5d6197ac5449/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1660, 1660, 'http://www.headingtech.com/center/tz/6/4ec4306d4c8c431f844de53a2f62ca1a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1661, 1661, 'http://www.headingtech.com/center/tz/6/89e35a077a444f8eadffb4302a4ecc0c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1662, 1662, 'http://www.headingtech.com/center/tz/6/4223eb6164c54b80bdc353b329aa7f60/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1663, 1663, 'http://www.headingtech.com/center/tz/6/fccbc900ac8d44718df888fe1b8b685c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1664, 1664, 'http://www.headingtech.com/center/tz/6/11c8e72161ef4f1ca70e2d261a1d5884/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1665, 1665, 'http://www.headingtech.com/center/tz/6/259b1ea654254b86957f53cf5af22e1e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1666, 1666, 'http://www.headingtech.com/center/tz/6/1064bfeb2dc94fce8b4e3745f65bd6de/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1667, 1667, 'http://www.headingtech.com/center/tz/6/42c06f0835834d76a37e4afe7ce32d4f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1668, 1668, 'http://www.headingtech.com/center/tz/6/c9b28b55f47b4f8ab9620d9558877f81/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1669, 1669, 'http://www.headingtech.com/center/tz/6/94a8e475b24e4991a9f0cd7f14c42906/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1670, 1670, 'http://www.headingtech.com/center/tz/6/1695f1e441d4458295597db824163085/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1671, 1671, 'http://www.headingtech.com/center/tz/6/ceca37d356ad4df5b4f4f21904719a38/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1672, 1672, 'http://www.headingtech.com/center/tz/6/6b45895c740c4e58a8c4a40c165cb67c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1673, 1673, 'http://www.headingtech.com/center/tz/6/d9d6e7fd57bd40068ac8e79151c6176d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1674, 1674, 'http://www.headingtech.com/center/tz/6/28bfb8c5b57945359a8c46e9285c6be3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1675, 1675, 'http://www.headingtech.com/center/tz/6/0f5874690e7d4ad18483d560c1460f83/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1676, 1676, 'http://www.headingtech.com/center/tz/6/a599370083eb48df9fa3d909a3c2622e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1677, 1677, 'http://www.headingtech.com/center/tz/6/4587adab8b464bb8a33a0a873fbe0523/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1678, 1678, 'http://www.headingtech.com/center/tz/6/a3028085ab0e4fffbcbb5cf41de58502/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1679, 1679, 'http://www.headingtech.com/center/tz/6/2cb9e654c1934c28aed45d104390301a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1680, 1680, 'http://www.headingtech.com/center/tz/6/de5216bb048f4b02b17a921d7922bd30/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1681, 1681, 'http://www.headingtech.com/center/tz/6/2d176a2afe974715aae41cd9d63c1ef8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1682, 1682, 'http://www.headingtech.com/center/tz/6/9ab8831896ef4312b851c9be241c57fe/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1683, 1683, 'http://www.headingtech.com/center/tz/6/5dddf20a594b42dc985381ff73d58b10/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1684, 1684, 'http://www.headingtech.com/center/tz/6/3eb7c4f2c010451096b44e7b16fb0dc4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1685, 1685, 'http://www.headingtech.com/center/tz/6/cc3e84b085714e2780a1e145a24b1725/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1686, 1686, 'http://www.headingtech.com/center/tz/6/b22ceaee180744dfaf8f767b3882acf2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1687, 1687, 'http://www.headingtech.com/center/tz/6/9a59e7dabdd54a3786d8ca04057ae8f9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1688, 1688, 'http://www.headingtech.com/center/tz/6/df23c02db3b04b5f8d26e5e6c7ce5c35/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1689, 1689, 'http://www.headingtech.com/center/tz/6/60c9f673682148ba87b4914a4fb8a5dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1690, 1690, 'http://www.headingtech.com/center/tz/6/13847c80f34c4487a52decbea6733d17/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1691, 1691, 'http://www.headingtech.com/center/tz/6/1a7b9bf996f94509a507e23b72d0853b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1692, 1692, 'http://www.headingtech.com/center/tz/6/2a2a191e0f5d41cc8b1f3319566dbcf2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1693, 1693, 'http://www.headingtech.com/center/tz/6/87216f48331f4ec09cf602b768e3b629/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1694, 1694, 'http://www.headingtech.com/center/tz/6/24519cd1d32e448fa7dc06bfc80a78c0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1695, 1695, 'http://www.headingtech.com/center/tz/6/2fb45ed589534f39b886912e3e2d0647/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1696, 1696, 'http://www.headingtech.com/center/tz/6/a4c0dedfc845408dbc00492ef799038f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1697, 1697, 'http://www.headingtech.com/center/tz/6/a8665f9eebb349a3a20b90cdddc55ff3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1698, 1698, 'http://www.headingtech.com/center/tz/6/7c7585c84931481f9ca3277136bb93c5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1699, 1699, 'http://www.headingtech.com/center/tz/6/d55eb5e814184046a96c0c83fd2fc224/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1700, 1700, 'http://www.headingtech.com/center/tz/6/c1db1259f63d4291bc3188791c95e548/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1701, 1701, 'http://www.headingtech.com/center/tz/6/fd9198d4e4ef4db69c5f4f269ae14de6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1702, 1702, 'http://www.headingtech.com/center/tz/6/d158f81bcd7b4ea483fe516ba6254beb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1703, 1703, 'http://www.headingtech.com/center/tz/6/8a7c20f911fd4e5ba2111f8b4638d412/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1704, 1704, 'http://www.headingtech.com/center/tz/6/99e4d51fd9524ab99df34f4e3f55fc44/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1705, 1705, 'http://www.headingtech.com/center/tz/6/227918980a484413867264ee5603e8ec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1706, 1706, 'http://www.headingtech.com/center/tz/6/dbd3f1fac83d4e11b6852eb2eb7c7d6c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1707, 1707, 'http://www.headingtech.com/center/tz/6/099fcd965df74c448174f1824ba8601e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1708, 1708, 'http://www.headingtech.com/center/tz/6/2d323c0ac8024d8591bb28a5d7103e83/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1709, 1709, 'http://www.headingtech.com/center/tz/6/b99e7ec2928c4ee18c029a9877cec3cd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1710, 1710, 'http://www.headingtech.com/center/tz/6/679fd6d85567465ea3beeefaecc9aa9e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1711, 1711, 'http://www.headingtech.com/center/tz/6/24e903fe02d84c4e84310785a1cc68be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1712, 1712, 'http://www.headingtech.com/center/tz/6/9d4382dbae174a8893e4e8224229db04/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1713, 1713, 'http://www.headingtech.com/center/tz/6/4a47c259169a4141814c4fd3652acdbd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1714, 1714, 'http://www.headingtech.com/center/tz/6/e64b2b80553844f28418334c744603f8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1715, 1715, 'http://www.headingtech.com/center/tz/6/affc0081aa04459fb19cf63a41b5f8a3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1716, 1716, 'http://www.headingtech.com/center/tz/6/3f6cee19103645a6957f4f286cb34985/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1717, 1717, 'http://www.headingtech.com/center/tz/6/b76a03222db54601b98a3f1bff238597/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1718, 1718, 'http://www.headingtech.com/center/tz/6/b95af78c13144816891fd075825d2336/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1719, 1719, 'http://www.headingtech.com/center/tz/6/71ab9a1ef16d4fa8b5b2dd246351527c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1720, 1720, 'http://www.headingtech.com/center/tz/6/c5a12f58011047f882614429850beece/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1721, 1721, 'http://www.headingtech.com/center/tz/6/1be97b6d16454b30a9de7252223b9c64/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1722, 1722, 'http://www.headingtech.com/center/tz/6/f7b30e6a90c043c088739cd2092a90b1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1723, 1723, 'http://www.headingtech.com/center/tz/6/f31543d034724c87bd2da73d53848902/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1724, 1724, 'http://www.headingtech.com/center/tz/6/ef98953bd6fe43c693c35d60018d7dfd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1725, 1725, 'http://www.headingtech.com/center/tz/6/b41aaf827e1b44d39ce843751f3faf17/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1726, 1726, 'http://www.headingtech.com/center/tz/6/56b38af197e24a36adab199f7e15affb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1727, 1727, 'http://www.headingtech.com/center/tz/6/58011d26816a4418bb07be781f669278/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1728, 1728, 'http://www.headingtech.com/center/tz/6/af4c18a47879406a9c8c64d488369272/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1729, 1729, 'http://www.headingtech.com/center/tz/6/09b0814e0c93433fbba83b48e5eaf037/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1730, 1730, 'http://www.headingtech.com/center/tz/6/b013ef27708241c29e5fc5286d737816/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1731, 1731, 'http://www.headingtech.com/center/tz/6/c165955ba6634ce4830b339388d5892b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1732, 1732, 'http://www.headingtech.com/center/tz/6/5eab4e9db55e42b5a2f53f0c62a5c85b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1733, 1733, 'http://www.headingtech.com/center/tz/6/db14f453350c48de922b37d4c457213a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1734, 1734, 'http://www.headingtech.com/center/tz/6/52f8bbb700e04834be70dca467f3b74f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1735, 1735, 'http://www.headingtech.com/center/tz/6/4d8de66e5aff4efc9c40e7c58216cbba/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1736, 1736, 'http://www.headingtech.com/center/tz/6/33b00ecec74940a2a8ee706f7053e794/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1737, 1737, 'http://www.headingtech.com/center/tz/6/5eb58b7c8df54cf498cfa4f8f6b9d634/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1738, 1738, 'http://www.headingtech.com/center/tz/6/18df22d95cfd46b190b4edb3fef230c6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1739, 1739, 'http://www.headingtech.com/center/tz/6/b3c7638375bb4baf95d421c01b4528d1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1740, 1740, 'http://www.headingtech.com/center/tz/6/d91513c4b99a44c698266c5f97a4a304/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1741, 1741, 'http://www.headingtech.com/center/tz/6/ee5f2934530c41bd8633c055384f4a79/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1742, 1742, 'http://www.headingtech.com/center/tz/6/7aec16f586a348dcbaf9977e9bf8cda5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1743, 1743, 'http://www.headingtech.com/center/tz/6/a7fbcccd4e4e4b5bb7d520c8b6201ca2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1744, 1744, 'http://www.headingtech.com/center/tz/6/aa7117deacd04936bdea1d393497fc14/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1745, 1745, 'http://www.headingtech.com/center/tz/6/769d54e0116a4ce7922ce6d248a7cee0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1746, 1746, 'http://www.headingtech.com/center/tz/6/8c5378a172ce416ea438a0dd1bd4d3af/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1747, 1747, 'http://www.headingtech.com/center/tz/6/a09638016a6d482c8ff0a417db60c700/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1748, 1748, 'http://www.headingtech.com/center/tz/6/b1dbe7f989524f5d9cf9657b8dcd01c9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1749, 1749, 'http://www.headingtech.com/center/tz/6/a1fd8743bebd4581a3e765f9f00ccc5b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1750, 1750, 'http://www.headingtech.com/center/tz/6/b74555a550f741de9a8eb8e472e15d16/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1751, 1751, 'http://www.headingtech.com/center/tz/6/e2e50e3c44ae4b15b28f7847ea6f8d1e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1752, 1752, 'http://www.headingtech.com/center/tz/6/b16577e779244becb3efd3de7f5f2ab8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1753, 1753, 'http://www.headingtech.com/center/tz/6/89d1cea222e4478d92019b8474ebcf18/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1754, 1754, 'http://www.headingtech.com/center/tz/6/041543477fc64050bc55a2b5f82a3665/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1755, 1755, 'http://www.headingtech.com/center/tz/6/0ae57028341b488eab6481db141eefd4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1756, 1756, 'http://www.headingtech.com/center/tz/6/96ef2963bd37486c91cb94886293af37/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1757, 1757, 'http://www.headingtech.com/center/tz/6/0218bd4867c6442688dd93b6c8cdfcbf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1758, 1758, 'http://www.headingtech.com/center/tz/6/21e0122c777b497a8ec8a4154b7f4d09/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1759, 1759, 'http://www.headingtech.com/center/tz/6/51206079071f492eb242665aaf3f3666/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1760, 1760, 'http://www.headingtech.com/center/tz/6/1327ddf416a94c2484c964f781c18772/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1761, 1761, 'http://www.headingtech.com/center/tz/6/6e587766b92f40b19c453e7b59bf3129/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1762, 1762, 'http://www.headingtech.com/center/tz/6/42b63b1c65694e2fb308219557a0b007/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1763, 1763, 'http://www.headingtech.com/center/tz/6/0a09e045713d406482e294790c8b73cc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1764, 1764, 'http://www.headingtech.com/center/tz/6/3b0bcbebe3844eed8cf85b8b4ebcd18c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1765, 1765, 'http://www.headingtech.com/center/tz/6/f2baecf16e2948bab71e0fcdc131ed3e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1766, 1766, 'http://www.headingtech.com/center/tz/6/49291576dca3489b8f7fcb3cd639743d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1767, 1767, 'http://www.headingtech.com/center/tz/6/62d4697cbf94485d8e46b2e03961f016/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1768, 1768, 'http://www.headingtech.com/center/tz/6/6f60b348face4427a13a39f77e47009c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1769, 1769, 'http://www.headingtech.com/center/tz/6/c707d67b0e104f0bb466989f2ab6eef2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1770, 1770, 'http://www.headingtech.com/center/tz/6/7b2b39585d43454d92c48dca487440b8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1771, 1771, 'http://www.headingtech.com/center/tz/6/951bdc01ba614de1b759bd542a2171fb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1772, 1772, 'http://www.headingtech.com/center/tz/6/4d5d83a9322a4e5b8d0d59bf1f8793ee/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1773, 1773, 'http://www.headingtech.com/center/tz/6/59fcd2199928432eb0cf8689765b89b1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1774, 1774, 'http://www.headingtech.com/center/tz/6/f91b689b422a4657a734db15d6cd3a86/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1775, 1775, 'http://www.headingtech.com/center/tz/6/46a09993f15c43d789b862a91e19274f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1776, 1776, 'http://www.headingtech.com/center/tz/6/34f2c9b192494c6686546d8d7da15316/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1777, 1777, 'http://www.headingtech.com/center/tz/6/4c9fca41c1ac4b26bd496ecdd7aca25d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1778, 1778, 'http://www.headingtech.com/center/tz/6/878545ef59ce4f4b86de02268ceae1ad/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1779, 1779, 'http://www.headingtech.com/center/tz/6/686dc67030c948fa849ea00cf62f7db0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1780, 1780, 'http://www.headingtech.com/center/tz/6/3a48319ddba44a76a0b82d76df733ac9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1781, 1781, 'http://www.headingtech.com/center/tz/6/5dd596e2c0e24f02915fcff55e0a52c6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1782, 1782, 'http://www.headingtech.com/center/tz/6/acd7654169f24bddb6731137fb0bd60d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1783, 1783, 'http://www.headingtech.com/center/tz/6/b32fcff720ca4ee9b8065f24c09097c0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1784, 1784, 'http://www.headingtech.com/center/tz/6/9ec76bf202a847b2831c2f95347d80a9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1785, 1785, 'http://www.headingtech.com/center/tz/6/6465745812e14715a048c9e4ee3e5c6e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1786, 1786, 'http://www.headingtech.com/center/tz/6/e2a841ef2ac9424192b1cf55f04930d4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1787, 1787, 'http://www.headingtech.com/center/tz/6/302a1e14a5ff41a7ac17c7c157d7b9a6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1788, 1788, 'http://www.headingtech.com/center/tz/6/5d11243458624a40a4e7277dfa90d978/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1789, 1789, 'http://www.headingtech.com/center/tz/6/946473cf5b8f49caa8c2f95509b49036/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1790, 1790, 'http://www.headingtech.com/center/tz/6/5fb647f59cfe426cae97e7306f6383df/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1791, 1791, 'http://www.headingtech.com/center/tz/6/eadc8f2a993940aca1610bce6fcd107d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1792, 1792, 'http://www.headingtech.com/center/tz/6/fa95b49937c246c180682dd4b1222021/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1793, 1793, 'http://www.headingtech.com/center/tz/6/b4ce75c9639e4e17a8d1be4857359688/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1794, 1794, 'http://www.headingtech.com/center/tz/6/4885405f38d34f2089bc3f7abbeabe46/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1795, 1795, 'http://www.headingtech.com/center/tz/6/0dc417becf224f5886421e08c4c19e44/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1796, 1796, 'http://www.headingtech.com/center/tz/6/5b7d4f5411854ad68bf5c578e9c970a4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1797, 1797, 'http://www.headingtech.com/center/tz/6/cca7332e39834a52818c480bfd1f97b9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1798, 1798, 'http://www.headingtech.com/center/tz/6/a1482c566f1c4495992f425dde308dcb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1799, 1799, 'http://www.headingtech.com/center/tz/6/50887e423c0041d295e2561d8120be72/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1800, 1800, 'http://www.headingtech.com/center/tz/6/107534fe97834d8798f3e6057ea80885/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1801, 1801, 'http://www.headingtech.com/center/tz/6/0e8f2cdeaa6d409f82e0added04a230d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1802, 1802, 'http://www.headingtech.com/center/tz/6/e854f64ca0a54ded87c997ffeb3321e5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1803, 1803, 'http://www.headingtech.com/center/tz/6/a80add8e4f6645d4a2b3c2206600a3df/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1804, 1804, 'http://www.headingtech.com/center/tz/6/0f5a0b1784b14980a92a18a9787133ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1805, 1805, 'http://www.headingtech.com/center/tz/6/d23162fb68324d91880596a1cbb8a479/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1806, 1806, 'http://www.headingtech.com/center/tz/6/f3bbfe3bead049ee8e60bfd35ea3b60f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1807, 1807, 'http://www.headingtech.com/center/tz/6/a1dc090d7f0f4238a73ef6e6e27be29a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1808, 1808, 'http://www.headingtech.com/center/tz/6/73b5d2bfec8e44adb06e4dc95d5eedf4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1809, 1809, 'http://www.headingtech.com/center/tz/6/b9836d66680a46038e5302ea5bac74c5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1810, 1810, 'http://www.headingtech.com/center/tz/6/8baccbc59df7491787e8e24c6e270cd9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1811, 1811, 'http://www.headingtech.com/center/tz/6/91e86af39aed45bc8eb4ca3e33ab687d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1812, 1812, 'http://www.headingtech.com/center/tz/6/b1c9d824fdab4bf59ea5d4038e79df9d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1813, 1813, 'http://www.headingtech.com/center/tz/6/fa8579b850054b7193cec6c8ca355d00/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1814, 1814, 'http://www.headingtech.com/center/tz/6/7a8d84586b014c05ba550892a5878f33/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1815, 1815, 'http://www.headingtech.com/center/tz/6/4414f3d3d38042f2bb335d69b77580da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1816, 1816, 'http://www.headingtech.com/center/tz/6/e3a77ed5587c4f15b7e5ddf9f547c0c4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1817, 1817, 'http://www.headingtech.com/center/tz/6/5e08b973bb7447c190052b07bdb924e1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1818, 1818, 'http://www.headingtech.com/center/tz/6/6ac2a44f9d70477887440159050f3dc0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1819, 1819, 'http://www.headingtech.com/center/tz/6/e928e087154d4eaba833d0ec226a5370/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1820, 1820, 'http://www.headingtech.com/center/tz/6/0756fd71e597495a87fd134393674b41/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1821, 1821, 'http://www.headingtech.com/center/tz/6/06615740b721410a8721b3b0ed77d72b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1822, 1822, 'http://www.headingtech.com/center/tz/6/fd94dd10eda646cdb39c04c8b65da196/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1823, 1823, 'http://www.headingtech.com/center/tz/6/f0777c2199834229813c041a8b38e602/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1824, 1824, 'http://www.headingtech.com/center/tz/6/205c710e7e3e46c5a71775249277e3c4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1825, 1825, 'http://www.headingtech.com/center/tz/6/20cb8afa346943369612e50566ae985d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1826, 1826, 'http://www.headingtech.com/center/tz/6/700f8c04b69149b8bd1c5bccfbf2cf05/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1827, 1827, 'http://www.headingtech.com/center/tz/6/cb91f952c34a4d0c905667478c468fab/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1828, 1828, 'http://www.headingtech.com/center/tz/6/8fbd07d092734e1fa2b2dccc332c01e0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1829, 1829, 'http://www.headingtech.com/center/tz/6/2113f7d2e43d4b6bbc68c303ef80992d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1830, 1830, 'http://www.headingtech.com/center/tz/6/2aa88efe5aba4681b7963d1eac8828af/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1831, 1831, 'http://www.headingtech.com/center/tz/6/3349805e5d904537b1be0dfb0a2c3b96/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1832, 1832, 'http://www.headingtech.com/center/tz/6/b870728581384fe8be632dcceaf5ea14/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1833, 1833, 'http://www.headingtech.com/center/tz/6/ce4356f409e043c088eb1f2fd4eb4817/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1834, 1834, 'http://www.headingtech.com/center/tz/6/a183ad3f4b984b088def0e01638aeded/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1835, 1835, 'http://www.headingtech.com/center/tz/6/6e2ff6701213485091a937caa107829b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1836, 1836, 'http://www.headingtech.com/center/tz/6/7d4f3ffd86a64707856082d36433aca8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1837, 1837, 'http://www.headingtech.com/center/tz/6/0176127d58d146e788a02665f2bf3d28/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1838, 1838, 'http://www.headingtech.com/center/tz/6/5b5d2f5d29b14c6193d030fc9b2f973b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1839, 1839, 'http://www.headingtech.com/center/tz/6/fd42c01d81c6484ebaaaea2310c6621b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1840, 1840, 'http://www.headingtech.com/center/tz/6/902a053ab3f445fabbb76a1b70014197/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1841, 1841, 'http://www.headingtech.com/center/tz/6/65635adb8fe54bcfa8a3720b07072f7b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1842, 1842, 'http://www.headingtech.com/center/tz/6/146933ecf4564b4e88d9f2af41c693c2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1843, 1843, 'http://www.headingtech.com/center/tz/6/26f304ee7b3d4f1686d5f695de34ff94/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1844, 1844, 'http://www.headingtech.com/center/tz/6/43b03cfdb1ab46cba469cc6358010423/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1845, 1845, 'http://www.headingtech.com/center/tz/6/8ee42852966a47688c7c7bb987293241/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1846, 1846, 'http://www.headingtech.com/center/tz/6/d7b51bd3da8340928d8a0cb904dd4cb6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1847, 1847, 'http://www.headingtech.com/center/tz/6/d0f251e4e3e74a91a75bf998bb81afc0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1848, 1848, 'http://www.headingtech.com/center/tz/6/bad8af6dc15349489663852035754e1d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1849, 1849, 'http://www.headingtech.com/center/tz/6/f1b1665ad1de49508382cd75b3f48535/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1850, 1850, 'http://www.headingtech.com/center/tz/6/a68ac4d6f48e4bc8b98427474697d93d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1851, 1851, 'http://www.headingtech.com/center/tz/6/43bdf0f830c4492ebadb6d2980f96ff1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1852, 1852, 'http://www.headingtech.com/center/tz/6/5f96946456314ee1b71cae6da17c5fc2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1853, 1853, 'http://www.headingtech.com/center/tz/6/121d1aa6d50f45deac242b55c86b50c7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1854, 1854, 'http://www.headingtech.com/center/tz/6/6fe9947b41104770aaff675263d723ee/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1855, 1855, 'http://www.headingtech.com/center/tz/6/74a70383c9ac4ce2a310b57c1247c1c6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1856, 1856, 'http://www.headingtech.com/center/tz/6/93eb3fd08cae47f791869c76b4e4b87a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1857, 1857, 'http://www.headingtech.com/center/tz/6/5fd849fcfd5e4f1280685603d2bf1f20/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1858, 1858, 'http://www.headingtech.com/center/tz/6/5df18705bbea487590530c3af478f3db/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1859, 1859, 'http://www.headingtech.com/center/tz/6/38bb01cf09664c048343e08c8d8fd22a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1860, 1860, 'http://www.headingtech.com/center/tz/6/a35784e1805748f1a70cade28c8812e8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1861, 1861, 'http://www.headingtech.com/center/tz/6/8ed5a5613c53444abd88ca853717b4c0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1862, 1862, 'http://www.headingtech.com/center/tz/6/e46b19799da64425b5a2a9f08215ea35/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1863, 1863, 'http://www.headingtech.com/center/tz/6/272659f181214258bd610f8cdc615de8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1864, 1864, 'http://www.headingtech.com/center/tz/6/b0bf7ee5cce742139f86aa0db62d9203/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1865, 1865, 'http://www.headingtech.com/center/tz/6/ca5ad8664de749b79efcc1401cbc4edc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1866, 1866, 'http://www.headingtech.com/center/tz/6/22e763a151e04d358b695461cf8a99d5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1867, 1867, 'http://www.headingtech.com/center/tz/6/c2a3f38ebb024321bc9290f13befdbc3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1868, 1868, 'http://www.headingtech.com/center/tz/6/5bd6a4b7a7a44d76bbe0a25869ae7196/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1869, 1869, 'http://www.headingtech.com/center/tz/6/caaf0c350d7045278259803a4867b774/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1870, 1870, 'http://www.headingtech.com/center/tz/6/063b8d742e174aef8041e43e094d90e4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1871, 1871, 'http://www.headingtech.com/center/tz/6/1992bea7d8454429ba2c8fc0d2021ac8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1872, 1872, 'http://www.headingtech.com/center/tz/6/083f98b75ca148efb5554d31ecbf6871/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1873, 1873, 'http://www.headingtech.com/center/tz/6/354c6d225c4040bf90719f21f7080039/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1874, 1874, 'http://www.headingtech.com/center/tz/6/581c4d1439de439e875c45676393dbf9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1875, 1875, 'http://www.headingtech.com/center/tz/6/d963a341351c41768192f1498e66ba2a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1876, 1876, 'http://www.headingtech.com/center/tz/6/8bd8c6a3032e485b8219f6ba898f3410/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1877, 1877, 'http://www.headingtech.com/center/tz/6/c5d94fb353224b04a4b1429b168d2ed3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1878, 1878, 'http://www.headingtech.com/center/tz/6/c983913b31974b74825348cac471555d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1879, 1879, 'http://www.headingtech.com/center/tz/6/91ee2c8993354853a01763424388b904/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1880, 1880, 'http://www.headingtech.com/center/tz/6/ce83b1b387954dd78005a97d080aec8e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1881, 1881, 'http://www.headingtech.com/center/tz/6/7e3e77d586ec49bfb7db91ad28955c32/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1882, 1882, 'http://www.headingtech.com/center/tz/6/97dd2d2bf1ed4f428231bb924fea6013/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1883, 1883, 'http://www.headingtech.com/center/tz/6/e7768ce785374f0d9133495ba3cacf0a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1884, 1884, 'http://www.headingtech.com/center/tz/6/6763c0f254a0470c8fe422ecd6efbbd8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1885, 1885, 'http://www.headingtech.com/center/tz/6/8732553951a84291be12d2aaa03a3172/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1886, 1886, 'http://www.headingtech.com/center/tz/6/4e25cb029f8d4c07b5cc187c92971fb8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1887, 1887, 'http://www.headingtech.com/center/tz/6/9fb2afd19abe45ab8b1e2e9feab8a7de/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1888, 1888, 'http://www.headingtech.com/center/tz/6/4d33e741ca7f45c9aa47d7ade0ff503f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1889, 1889, 'http://www.headingtech.com/center/tz/6/09da52bfc5b941d4894173a8751a7747/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1890, 1890, 'http://www.headingtech.com/center/tz/6/298e55fa042d4fbea7f6a5e97c515d5e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1891, 1891, 'http://www.headingtech.com/center/tz/6/b876c1337b00411aa7af42cbf1af1e14/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1892, 1892, 'http://www.headingtech.com/center/tz/6/505534dfb11a4403bb0f088249a4e7ae/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1893, 1893, 'http://www.headingtech.com/center/tz/6/801a2977bc3946aa8f3afb11174abbeb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1894, 1894, 'http://www.headingtech.com/center/tz/6/84697bd960794d31a0f1a2e3100d5f9d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1895, 1895, 'http://www.headingtech.com/center/tz/6/ea009927a746459c99cb275bb7b92ffa/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1896, 1896, 'http://www.headingtech.com/center/tz/6/87d00a3b2f2d477aa948a6ed8441abcf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1897, 1897, 'http://www.headingtech.com/center/tz/6/7d49cf3337e344709749ae5c67dd15bc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1898, 1898, 'http://www.headingtech.com/center/tz/6/6ed343698f1b455ab1dad20c1b54326a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1899, 1899, 'http://www.headingtech.com/center/tz/6/93cfdb1a191648b19b7900fd56b7d20d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1900, 1900, 'http://www.headingtech.com/center/tz/6/837cd1a4b31240be8d509bbf9dff451f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1901, 1901, 'http://www.headingtech.com/center/tz/6/9eae6a67fe6e48d3bff7dbb64fc8e3a0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1902, 1902, 'http://www.headingtech.com/center/tz/6/d2c5b865e2034c958753503ac9dcb8ae/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1903, 1903, 'http://www.headingtech.com/center/tz/6/e419527125cc4580a1485e8048c90b45/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1904, 1904, 'http://www.headingtech.com/center/tz/6/3c98311b94964ba6801203f641d43a0a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1905, 1905, 'http://www.headingtech.com/center/tz/6/b3323a5f9dd043d38d9cd6148d29f915/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1906, 1906, 'http://www.headingtech.com/center/tz/6/0e85836bfafb458b897c93abc6444aa7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1907, 1907, 'http://www.headingtech.com/center/tz/6/a085bc45413840a4a50239edef36939c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1908, 1908, 'http://www.headingtech.com/center/tz/6/1df8ef298b0f4a7291257b2f02cf8463/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1909, 1909, 'http://www.headingtech.com/center/tz/6/5e0c8058e41040b3aefb8a0ad0bbed59/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1910, 1910, 'http://www.headingtech.com/center/tz/6/6abba81ed6414c529aa9e512131d7651/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1911, 1911, 'http://www.headingtech.com/center/tz/6/77b5e6843c454ffe9646661d39941c83/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1912, 1912, 'http://www.headingtech.com/center/tz/6/fd34baa5dc5d424da60d32c8dd58d1e6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1913, 1913, 'http://www.headingtech.com/center/tz/6/43d1a5c621be482ca6cf3a1692bf468d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1914, 1914, 'http://www.headingtech.com/center/tz/6/dd35da3262ba4dfe816988330b95e36e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1915, 1915, 'http://www.headingtech.com/center/tz/6/3647bab3caac4c74ae2400b36b29b2ab/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1916, 1916, 'http://www.headingtech.com/center/tz/6/09f09e9f7b364efebe47e7e86ef2f991/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1917, 1917, 'http://www.headingtech.com/center/tz/6/a3fc004b768a41c1b6b72033bd65f8c6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1918, 1918, 'http://www.headingtech.com/center/tz/6/86b0817e874b426bb985593e9f93fe16/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1919, 1919, 'http://www.headingtech.com/center/tz/6/2a3c80427b7943e79d719777ac7ce0cd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1920, 1920, 'http://www.headingtech.com/center/tz/6/df0d5569cb2a4c57b6140436867d896e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1921, 1921, 'http://www.headingtech.com/center/tz/6/e02f99456db443b2bc4d47eb74ef0cbd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1922, 1922, 'http://www.headingtech.com/center/tz/6/f17f04a38bdd4417898ace35ef176e57/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1923, 1923, 'http://www.headingtech.com/center/tz/6/bb5ee1a2ed434cd793a64ac0bb68202d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1924, 1924, 'http://www.headingtech.com/center/tz/6/903611675b6c456b982435c139c986b1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1925, 1925, 'http://www.headingtech.com/center/tz/6/3104aa70f3164c0cbfd19d8c90294ab9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1926, 1926, 'http://www.headingtech.com/center/tz/6/a0e9d782fa5747d99af521b90f50b865/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1927, 1927, 'http://www.headingtech.com/center/tz/6/1736eb02ec0d456ebb2a08a0860fec03/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1928, 1928, 'http://www.headingtech.com/center/tz/6/ba6cf0ffdbdb46b2a23338d769a55c3d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1929, 1929, 'http://www.headingtech.com/center/tz/6/81de93c252a141b99d40a579de61fa13/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1930, 1930, 'http://www.headingtech.com/center/tz/6/4f8dfd1fda084745a5796cb73169dc1d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1931, 1931, 'http://www.headingtech.com/center/tz/6/acc19e9fb7c4464a81f8121db1ab027a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1932, 1932, 'http://www.headingtech.com/center/tz/6/ff6c85ecd09249b7bd1c3753e0d89dfb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1933, 1933, 'http://www.headingtech.com/center/tz/6/9f2885eb9f894706ba45a66722c44bf0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1934, 1934, 'http://www.headingtech.com/center/tz/6/d2214cfdc81f4918a2dedc431569a9fc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1935, 1935, 'http://www.headingtech.com/center/tz/6/09950ca33691486baf854560c2bc2a1b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1936, 1936, 'http://www.headingtech.com/center/tz/6/44b789cbeb8c409b8f3cbd16b403662e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1937, 1937, 'http://www.headingtech.com/center/tz/6/edd36c068e7144f0bfccb87561064c2e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1938, 1938, 'http://www.headingtech.com/center/tz/6/fa30f3dda6b34f2eb036b4c40eec589c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1939, 1939, 'http://www.headingtech.com/center/tz/6/d2d5cc1fca2b424d932e3deb51de8f6a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1940, 1940, 'http://www.headingtech.com/center/tz/6/b4a5b1051d1d4c43a14de42e1ed7b8e1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1941, 1941, 'http://www.headingtech.com/center/tz/6/a0663760bf7d47ba9483976118bfa851/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1942, 1942, 'http://www.headingtech.com/center/tz/6/d43798b6701945469a8a82b1522e4276/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1943, 1943, 'http://www.headingtech.com/center/tz/6/319f37bca5e94a14ae462bbe889c0631/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1944, 1944, 'http://www.headingtech.com/center/tz/6/e7ab508bd580444d8fc434ad38deb2da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1945, 1945, 'http://www.headingtech.com/center/tz/6/7a9969cdccc0458a90e5fdc403d1c497/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1946, 1946, 'http://www.headingtech.com/center/tz/6/5e75984858e844c680831534e3623959/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1947, 1947, 'http://www.headingtech.com/center/tz/6/6d9d2ab8478044bda97d3626acb33137/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1948, 1948, 'http://www.headingtech.com/center/tz/6/36f28c8e84f64075961b25c3568d7268/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1949, 1949, 'http://www.headingtech.com/center/tz/6/806e3409ce1b406d8a8031304054709c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1950, 1950, 'http://www.headingtech.com/center/tz/6/693c0b2702b24a969e1cf2ef0d1cb558/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1951, 1951, 'http://www.headingtech.com/center/tz/6/0e6c51457203459ebf9a47c0257cd09b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1952, 1952, 'http://www.headingtech.com/center/tz/6/749c29248af74c2f8a6d1d12b021008d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1953, 1953, 'http://www.headingtech.com/center/tz/6/62e795b363c245a0b96d6382859789c5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1954, 1954, 'http://www.headingtech.com/center/tz/6/d5cc376ffa8646f7a521eb267a6d713f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1955, 1955, 'http://www.headingtech.com/center/tz/6/043f0b1e26644e6ca2028b0ffb0af9d3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1956, 1956, 'http://www.headingtech.com/center/tz/6/a5231aced6034435a770de730e11ce9c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1957, 1957, 'http://www.headingtech.com/center/tz/6/63ebba7c0cb54668b20764ec18b17b6e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1958, 1958, 'http://www.headingtech.com/center/tz/6/e4869c8f03e34c97bbba4d6994945602/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1959, 1959, 'http://www.headingtech.com/center/tz/6/1eca376aff85408ba7ba71fd12302aca/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1960, 1960, 'http://www.headingtech.com/center/tz/6/91a5680463694e14a6e11ee9537fa2f6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1961, 1961, 'http://www.headingtech.com/center/tz/6/f95922dfee9d4eedb0c4bacc477a888b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1962, 1962, 'http://www.headingtech.com/center/tz/6/4db8e5bea55f40a88fe73666ba7cce34/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1963, 1963, 'http://www.headingtech.com/center/tz/6/21df7fdd88724ac4b9be183de0f72ad5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1964, 1964, 'http://www.headingtech.com/center/tz/6/bbe08d9a88e84212ba8492c468359d2c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1965, 1965, 'http://www.headingtech.com/center/tz/6/6fb0e7f4a0524646b3c7a73071e3b9ff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1966, 1966, 'http://www.headingtech.com/center/tz/6/cde06ca8d92e47a7a7ab182814460c5f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1967, 1967, 'http://www.headingtech.com/center/tz/6/0edb2172c57540d7b2cb83aedae06de8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1968, 1968, 'http://www.headingtech.com/center/tz/6/85d1ce87c8a949ac918e46503ceffd7f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1969, 1969, 'http://www.headingtech.com/center/tz/6/fe462dc51eeb428a9ddd03653603404d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1970, 1970, 'http://www.headingtech.com/center/tz/6/84617428fa9d43e4990e100dcd75bf2b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1971, 1971, 'http://www.headingtech.com/center/tz/6/8cd65d00bcb9463f907a95590f25a4a2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1972, 1972, 'http://www.headingtech.com/center/tz/6/713265b9e39b46338337931c09d256fc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1973, 1973, 'http://www.headingtech.com/center/tz/6/0f239a1cd4de4232b9ff48d4c4ea14e3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1974, 1974, 'http://www.headingtech.com/center/tz/6/f4c0bbc0b37c4b11bf613076207a95ba/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1975, 1975, 'http://www.headingtech.com/center/tz/6/cfe9a1cd44bd4216bd1a22e1d82fe130/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1976, 1976, 'http://www.headingtech.com/center/tz/6/eb2f73387e654169809d23b11e68af39/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1977, 1977, 'http://www.headingtech.com/center/tz/6/92b0f42bca7949c08a3b325c271bcdfb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1978, 1978, 'http://www.headingtech.com/center/tz/6/c5a5b3daa99b402086b0e16729bb8624/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1979, 1979, 'http://www.headingtech.com/center/tz/6/2d632abb96584bb681ec87737ad1d32a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1980, 1980, 'http://www.headingtech.com/center/tz/6/af96219dd8a846c8b48ccc89000b3a1b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1981, 1981, 'http://www.headingtech.com/center/tz/6/b6fc4609da9d44d0bd2cd685369fa455/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1982, 1982, 'http://www.headingtech.com/center/tz/6/7d84321a99134a74b447ae95bcb8e38d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1983, 1983, 'http://www.headingtech.com/center/tz/6/ffab83f3c42341d49a261d1ee40916da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1984, 1984, 'http://www.headingtech.com/center/tz/6/f5f3d0ea76f7456895fc847f0b4ecd7c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1985, 1985, 'http://www.headingtech.com/center/tz/6/27986a2a3e844e11a3267ac107c56ac7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1986, 1986, 'http://www.headingtech.com/center/tz/6/a4a0d99c93f246b995e518574cc60e47/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1987, 1987, 'http://www.headingtech.com/center/tz/6/d195c6d7d9ea49eabb5cd6e9db9f666a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1988, 1988, 'http://www.headingtech.com/center/tz/6/c4510e59c81547c981157325bac536b2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1989, 1989, 'http://www.headingtech.com/center/tz/6/56944f5603e44a2dad693766eed5fd15/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1990, 1990, 'http://www.headingtech.com/center/tz/6/916835df64804a9fb2a99db746404b48/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1991, 1991, 'http://www.headingtech.com/center/tz/6/94c40ec3e175454a96878b9ac5218343/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1992, 1992, 'http://www.headingtech.com/center/tz/6/9b05baf65fcb4a1db99b6e4c09338164/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1993, 1993, 'http://www.headingtech.com/center/tz/6/1ab91398b3df43f9aaf4c1644243496e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1994, 1994, 'http://www.headingtech.com/center/tz/6/3d1f1bccae5a4d7f90881faaadcd03bb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1995, 1995, 'http://www.headingtech.com/center/tz/6/ceeba85fd1c44849b088d147de581c57/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1996, 1996, 'http://www.headingtech.com/center/tz/6/70ccc5f5eb824e63a02d698e68818654/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1997, 1997, 'http://www.headingtech.com/center/tz/6/32bd8077ae5d47dd8294f5dcf0331547/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1998, 1998, 'http://www.headingtech.com/center/tz/6/d27e73bd683d4729b88e4ccfdb68316b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (1999, 1999, 'http://www.headingtech.com/center/tz/6/32a4b42723c24950a0867f44d869d324/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2000, 2000, 'http://www.headingtech.com/center/tz/6/5ceebbb953074f9592dd24ffd9944839/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2001, 2001, 'http://www.headingtech.com/center/tz/6/d5ed04442fff4a348a1e23b7244cc8bf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2002, 2002, 'http://www.headingtech.com/center/tz/6/b2c0eda82af548f5bd020273a479b69e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2003, 2003, 'http://www.headingtech.com/center/tz/6/147d78732b1c49de94f488fedcb28fe6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2004, 2004, 'http://www.headingtech.com/center/tz/6/1a08ba11c63047b3abcd99e5adc5a1af/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2005, 2005, 'http://www.headingtech.com/center/tz/6/dd0a3f575fa34035ad292c80d0a3ecf6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2006, 2006, 'http://www.headingtech.com/center/tz/6/431c06df59dc41dcb4c7234e1eaf0ad7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2007, 2007, 'http://www.headingtech.com/center/tz/6/4031089e503c460ebda4159f4f412ceb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2008, 2008, 'http://www.headingtech.com/center/tz/6/ebad891e0f7d4ae7b67683c0d011b5f9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2009, 2009, 'http://www.headingtech.com/center/tz/6/e01fd9e5322a49e6b09bbd69830171a6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2010, 2010, 'http://www.headingtech.com/center/tz/6/34b212f292584f3fbfdf1cac0af1131f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2011, 2011, 'http://www.headingtech.com/center/tz/6/0909cec7af0344c1bb268688a37a2428/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2012, 2012, 'http://www.headingtech.com/center/tz/6/3263731ef0864b71968d68c629974a8d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2013, 2013, 'http://www.headingtech.com/center/tz/6/e1cf136e7daf4b78b5d53d4fcaf76383/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2014, 2014, 'http://www.headingtech.com/center/tz/6/619b514e8d084ab1aab482972fd26ddd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2015, 2015, 'http://www.headingtech.com/center/tz/6/a6361ee16e944f8e95d066e278db66a9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2016, 2016, 'http://www.headingtech.com/center/tz/6/07a8b1ff7ae745c19e16bdcc76a1b4e8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2017, 2017, 'http://www.headingtech.com/center/tz/6/29dc51345da64570b5762ae58d9ee817/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2018, 2018, 'http://www.headingtech.com/center/tz/6/ceeb12bdda9e4d5880ca41f27d0a757d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2019, 2019, 'http://www.headingtech.com/center/tz/6/087f3b3f2495401fbb8c49c54ff08a18/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2020, 2020, 'http://www.headingtech.com/center/tz/6/d15e55604021436b8377c552697a8305/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2021, 2021, 'http://www.headingtech.com/center/tz/6/da750359ace445e49211a5925f9713b4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2022, 2022, 'http://www.headingtech.com/center/tz/6/5edf0b2e99554839ab78c7d9d0c4bcd8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2023, 2023, 'http://www.headingtech.com/center/tz/6/5152ea9102934347b8a70e88bedcd0a1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2024, 2024, 'http://www.headingtech.com/center/tz/6/89b3e4189bb645b1a9bce1a149ee418a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2025, 2025, 'http://www.headingtech.com/center/tz/6/949c579bd5444d41b8b5753a75e9b9ea/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2026, 2026, 'http://www.headingtech.com/center/tz/6/f07faecb2016486fb2c3931a3ae0f3dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2027, 2027, 'http://www.headingtech.com/center/tz/6/1b315c69e0da47399f55b48525028f64/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2028, 2028, 'http://www.headingtech.com/center/tz/6/c6f8627afac240f4b624c15f64cb4710/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2029, 2029, 'http://www.headingtech.com/center/tz/6/f53d63b0a1a64899b92931721c024ea4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2030, 2030, 'http://www.headingtech.com/center/tz/6/b6b2208656d449fb8e49d502e87e3395/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2031, 2031, 'http://www.headingtech.com/center/tz/6/a4c88fee687b4f0ca8a872ea71f74b59/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2032, 2032, 'http://www.headingtech.com/center/tz/6/bffa3b3812f94aab85deb16bd6aa0564/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2033, 2033, 'http://www.headingtech.com/center/tz/6/82a69f8e00a545e998e02015da73e440/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2034, 2034, 'http://www.headingtech.com/center/tz/6/69d33b7ca4ef44d8a6d0fe4ec3eaf5cb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2035, 2035, 'http://www.headingtech.com/center/tz/6/c793a38bd1ef4f7f9eeb0ef5f034b6a9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2036, 2036, 'http://www.headingtech.com/center/tz/6/a031d17b102f4f4293f0344d2fc4989a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2037, 2037, 'http://www.headingtech.com/center/tz/6/74fabfc4e49d433ea6589a9648b4bb71/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2038, 2038, 'http://www.headingtech.com/center/tz/6/df511bf8295c4862ac133df5c2d2195e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2039, 2039, 'http://www.headingtech.com/center/tz/6/71c5acb63784457688c93800df14f438/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2040, 2040, 'http://www.headingtech.com/center/tz/6/883ca09884284c419721d9d34f748600/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2041, 2041, 'http://www.headingtech.com/center/tz/6/55157bac539c4242a9da9567b5900353/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2042, 2042, 'http://www.headingtech.com/center/tz/6/5c0ee42a17ed4466a12e207d13962b9c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2043, 2043, 'http://www.headingtech.com/center/tz/6/bd6a8a490e784f7e8051a4c8bb75a8ea/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2044, 2044, 'http://www.headingtech.com/center/tz/6/bffd5f99d1bb46e29f462e8fe49230db/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2045, 2045, 'http://www.headingtech.com/center/tz/6/7c4e517a62d243f7857359ce447e4eb2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2046, 2046, 'http://www.headingtech.com/center/tz/6/0e06368f9f3b48bd88a04cdb2ca65586/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2047, 2047, 'http://www.headingtech.com/center/tz/6/4cc1fde0d2ac44149c2f2224e6067595/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2048, 2048, 'http://www.headingtech.com/center/tz/6/dc4dffb8f9934258a9f47437fdbf55be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2049, 2049, 'http://www.headingtech.com/center/tz/6/df7eae8490d2494eae7eb27325f74d08/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2050, 2050, 'http://www.headingtech.com/center/tz/6/ddfc68f532ca4e3b800a26ad1fd9af51/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2051, 2051, 'http://www.headingtech.com/center/tz/6/b55a264a61eb4717816f1af6e75be84f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2052, 2052, 'http://www.headingtech.com/center/tz/6/cfa21e47690d4416993ee33b2fc1e64a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2053, 2053, 'http://www.headingtech.com/center/tz/6/18af352b88884785ac11b2df5fc5098e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2054, 2054, 'http://www.headingtech.com/center/tz/6/44ffdf6d06d3425e8a697077f7ff5546/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2055, 2055, 'http://www.headingtech.com/center/tz/6/9cc5282e427c4edc99eb10a8ef989afd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2056, 2056, 'http://www.headingtech.com/center/tz/6/9210a871022d46098883fd43547085f0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2057, 2057, 'http://www.headingtech.com/center/tz/6/cb4cd85627d24945a7412ed51061fe7c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2058, 2058, 'http://www.headingtech.com/center/tz/6/bac596d0a24147408c49569d9dfee563/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2059, 2059, 'http://www.headingtech.com/center/tz/6/15dfa6b24d4846dbb268c47293d4ca15/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2060, 2060, 'http://www.headingtech.com/center/tz/6/996d92d75ac248f6b295c7a3f81f2225/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2061, 2061, 'http://www.headingtech.com/center/tz/6/19c9009fbf5a4e1e9c6f7e4305babf0d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2062, 2062, 'http://www.headingtech.com/center/tz/6/a3bb5a12598d41549b6ffd964259a9e3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2063, 2063, 'http://www.headingtech.com/center/tz/6/932acba4a6df43efa1ffef3a6b914dc9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2064, 2064, 'http://www.headingtech.com/center/tz/6/38ec299441b64653a35b8db0d846e4e4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2065, 2065, 'http://www.headingtech.com/center/tz/6/7b62b420fab14edb830266b43ab5b8f3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2066, 2066, 'http://www.headingtech.com/center/tz/6/4f870412cb684c429d82f7fe5a4fc615/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2067, 2067, 'http://www.headingtech.com/center/tz/6/44ed24507a9b4748ab5b5c110ab94888/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2068, 2068, 'http://www.headingtech.com/center/tz/6/02ae0b8cc9b04d3a8623b7bd4cd964b5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2069, 2069, 'http://www.headingtech.com/center/tz/6/4949096765914f14b67fabf1b7341709/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2070, 2070, 'http://www.headingtech.com/center/tz/6/d6a2516a175f4e51868c06d6c447f54b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2071, 2071, 'http://www.headingtech.com/center/tz/6/0b389f888ae94bc0bd7c4ccb47fd41b9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2072, 2072, 'http://www.headingtech.com/center/tz/6/fe073f02a85c4ad9a7e98aa8745b0b3f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2073, 2073, 'http://www.headingtech.com/center/tz/6/bc3ef19768774dac86d42ce1216542be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2074, 2074, 'http://www.headingtech.com/center/tz/6/1745ae79cff543c8acc684cdb5e4344f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2075, 2075, 'http://www.headingtech.com/center/tz/6/84c63fd6a56743cea7546bf7403a6d74/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2076, 2076, 'http://www.headingtech.com/center/tz/6/b85400252fb94c8b906bd737d33d46c5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2077, 2077, 'http://www.headingtech.com/center/tz/6/bc4c99fc7cd4447fb5ad415f741ec386/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2078, 2078, 'http://www.headingtech.com/center/tz/6/c7fb6d66f3ec448dbfef71816450f126/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2079, 2079, 'http://www.headingtech.com/center/tz/6/10afc3045ba74cf59ccd9a4e139b0e79/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2080, 2080, 'http://www.headingtech.com/center/tz/6/b7d6f94e96a243b1a66b9a0dd1ff3211/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2081, 2081, 'http://www.headingtech.com/center/tz/6/625fa8d201a6475297c4ba9be315843e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2082, 2082, 'http://www.headingtech.com/center/tz/6/a1ca97b2b2b447eb995f37e9d06e85f1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2083, 2083, 'http://www.headingtech.com/center/tz/6/1fbce71a9b9642789733bb740bbfbbc6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2084, 2084, 'http://www.headingtech.com/center/tz/6/93978ac6d9f644349c438d7cf7c7bb19/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2085, 2085, 'http://www.headingtech.com/center/tz/6/76fa330f7a5445c295638d07076e76d7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2086, 2086, 'http://www.headingtech.com/center/tz/6/99fe9589ae5544d39844e530742969ba/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2087, 2087, 'http://www.headingtech.com/center/tz/6/4663f40b2c5446aab96ea0b83aca9492/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2088, 2088, 'http://www.headingtech.com/center/tz/6/84a4f6e35ca549cbab50c35d550d09e5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2089, 2089, 'http://www.headingtech.com/center/tz/6/0b0d8f9783974f1da3eedace2277214b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2090, 2090, 'http://www.headingtech.com/center/tz/6/1f7cfecc2c1049b883f660b9d4f36943/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2091, 2091, 'http://www.headingtech.com/center/tz/6/435ff5df1ab743788e732ed131d441be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2092, 2092, 'http://www.headingtech.com/center/tz/6/3d58af14be5b430b8cfd0b7a1bfb3de7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2093, 2093, 'http://www.headingtech.com/center/tz/6/d8ba1ee3ef1342cea5687a32643dae2c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2094, 2094, 'http://www.headingtech.com/center/tz/6/a8d08505d40649bbaa3e485c457f307b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2095, 2095, 'http://www.headingtech.com/center/tz/6/145e52dcb3cf4280b7b4a91b9efd3443/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2096, 2096, 'http://www.headingtech.com/center/tz/6/e0c8018468b549929a2c7af9ed2fac20/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2097, 2097, 'http://www.headingtech.com/center/tz/6/0acf64768a9b454e90cc93fc95c7e742/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2098, 2098, 'http://www.headingtech.com/center/tz/6/78522a38e9cb4996ae5bdf17934f2a04/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2099, 2099, 'http://www.headingtech.com/center/tz/6/567da1ed5f5e4c87bf783525f87e6129/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2100, 2100, 'http://www.headingtech.com/center/tz/6/44190ffa63664ff0a1a7ef90e6ea26c2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2101, 2101, 'http://www.headingtech.com/center/tz/6/293ab8b48227472a8d07ff8426e04361/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2102, 2102, 'http://www.headingtech.com/center/tz/6/c64a9687c19a4541968e6329baa745c1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2103, 2103, 'http://www.headingtech.com/center/tz/6/bb3625eba8614a96b530bad7453c943a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2104, 2104, 'http://www.headingtech.com/center/tz/6/7bc781619f0a42db83e6b536c8ce80c9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2105, 2105, 'http://www.headingtech.com/center/tz/6/28eaa68827fc4e44b6480e037330926d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2106, 2106, 'http://www.headingtech.com/center/tz/6/875b4aead1974e61ad9cc32abb5d5259/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2107, 2107, 'http://www.headingtech.com/center/tz/6/39bb414bc83344268a4f4465bb415623/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2108, 2108, 'http://www.headingtech.com/center/tz/6/b6924b18d5844603acd9df9143152365/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2109, 2109, 'http://www.headingtech.com/center/tz/6/2b4771fb1802447b9934d53f8be77f73/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2110, 2110, 'http://www.headingtech.com/center/tz/6/21f1404884ae4e8cadb56b2eb402bfd3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2111, 2111, 'http://www.headingtech.com/center/tz/6/0a3ce0f92ed647bfb39fec754255b4fb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2112, 2112, 'http://www.headingtech.com/center/tz/6/067a320250354a1daf70f88db8920890/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2113, 2113, 'http://www.headingtech.com/center/tz/6/5928a26bbc1642aa9ccb64c91eb592a4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2114, 2114, 'http://www.headingtech.com/center/tz/6/d8d23507458d40b3be3b2109e0f8dc19/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2115, 2115, 'http://www.headingtech.com/center/tz/6/b7174cbba74446e099ad5ae5ee75e639/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2116, 2116, 'http://www.headingtech.com/center/tz/6/ecf887fb28784f3397f9e479b67c7318/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2117, 2117, 'http://www.headingtech.com/center/tz/6/3db8dfd41365498a945942548c5dcf41/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2118, 2118, 'http://www.headingtech.com/center/tz/6/b18b50fbfe464f53b5bf59374bdd8192/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2119, 2119, 'http://www.headingtech.com/center/tz/6/3a29a0235a7644968673c7b7c4e8dce3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2120, 2120, 'http://www.headingtech.com/center/tz/6/333b4e6029e04b7880eed7759e5c3896/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2121, 2121, 'http://www.headingtech.com/center/tz/6/993a75cd891b4515a21cc8035fe0fa67/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2122, 2122, 'http://www.headingtech.com/center/tz/6/9c7412d28df14d73b26040ec6d1640c7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2123, 2123, 'http://www.headingtech.com/center/tz/6/d075c08e121749a1a2f10921873a4950/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2124, 2124, 'http://www.headingtech.com/center/tz/6/fb0b8babe6be4d6b9e5a9118451eb364/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2125, 2125, 'http://www.headingtech.com/center/tz/6/53abe7d00cfa4367834877923067bf3e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2126, 2126, 'http://www.headingtech.com/center/tz/6/08e573de7455456b9efdf0ae4b1369b6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2127, 2127, 'http://www.headingtech.com/center/tz/6/7c8df3eb3d0247899318b8c871098cc4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2128, 2128, 'http://www.headingtech.com/center/tz/6/d1665039a3e34cbcbf97c605a2af8dda/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2129, 2129, 'http://www.headingtech.com/center/tz/6/848221de3fc44695808491d62a6e1c13/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2130, 2130, 'http://www.headingtech.com/center/tz/6/f470df90d13d4273bc2f6f254c4f0b63/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2131, 2131, 'http://www.headingtech.com/center/tz/6/eecd37e413c641f095ca24dc6c890724/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2132, 2132, 'http://www.headingtech.com/center/tz/6/b896aafffd344a1db5580b5644cf67ff/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2133, 2133, 'http://www.headingtech.com/center/tz/6/44501ba5fdc64e79af6cb2b94569c47d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2134, 2134, 'http://www.headingtech.com/center/tz/6/dc7ead2ce03c470baa353e80f2666440/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2135, 2135, 'http://www.headingtech.com/center/tz/6/42f92e4dd6254968ba60883b0d808861/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2136, 2136, 'http://www.headingtech.com/center/tz/6/5d01ae2153ff4a41b71c9708128183ba/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2137, 2137, 'http://www.headingtech.com/center/tz/6/f974ebc07786482d8302e7e28630cd6a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2138, 2138, 'http://www.headingtech.com/center/tz/6/0ebee61c0bb04e9da0c8b0f21c84552a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2139, 2139, 'http://www.headingtech.com/center/tz/6/3e8183ea7b16450587357a36c3338de2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2140, 2140, 'http://www.headingtech.com/center/tz/6/fa117292ef5a4b9b8218f851a3ba5b3e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2141, 2141, 'http://www.headingtech.com/center/tz/6/4968110884cc46d19de67b082b6b06dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2142, 2142, 'http://www.headingtech.com/center/tz/6/9758dcc521004337b357fe0143a6d541/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2143, 2143, 'http://www.headingtech.com/center/tz/6/0ad5308032e749f599b3dd4fa2005539/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2144, 2144, 'http://www.headingtech.com/center/tz/6/de68a82b65234e0c92e8bca13ac81545/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2145, 2145, 'http://www.headingtech.com/center/tz/6/477485bfe77b463f8553ebf7e5ef1d91/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2146, 2146, 'http://www.headingtech.com/center/tz/6/2a845d5d28804b029d1bfa267cef35d2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2147, 2147, 'http://www.headingtech.com/center/tz/6/b513494072eb452db15b98a0cc01be3e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2148, 2148, 'http://www.headingtech.com/center/tz/6/684227010f454213b631a5860e302466/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2149, 2149, 'http://www.headingtech.com/center/tz/6/3c8b0bdbe9ae48b3b1df9f843984b7a1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2150, 2150, 'http://www.headingtech.com/center/tz/6/8de75e7ab98548c6a40fd91f2acbc555/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2151, 2151, 'http://www.headingtech.com/center/tz/6/a25f98832bee47aeb4cfe3fbbc7d8e46/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2152, 2152, 'http://www.headingtech.com/center/tz/6/906e172d068f45c6be5c8d3a738d6449/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2153, 2153, 'http://www.headingtech.com/center/tz/6/ea9a3ae60f484de9bd77f30be5a3b9d1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2154, 2154, 'http://www.headingtech.com/center/tz/6/3c0e7f17d2334f4c8e2edc14fa0576ed/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2155, 2155, 'http://www.headingtech.com/center/tz/6/6b2a3ddf26bb43b69ba1311b200411bc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2156, 2156, 'http://www.headingtech.com/center/tz/6/3580ebc30c2a4b7590b103f9d024d457/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2157, 2157, 'http://www.headingtech.com/center/tz/6/95341c3b8a2d43818e53bdf49731dfbe/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2158, 2158, 'http://www.headingtech.com/center/tz/6/2bc50d6f05334a128bb604d66763df33/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2159, 2159, 'http://www.headingtech.com/center/tz/6/46dcd82629d54425b0449f971202f5da/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2160, 2160, 'http://www.headingtech.com/center/tz/6/9a0d40a5665f4ae5978f7dd6efbc6509/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2161, 2161, 'http://www.headingtech.com/center/tz/6/e4f86cd72b0c4e638128d27439268214/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2162, 2162, 'http://www.headingtech.com/center/tz/6/fcdeb7ef10874babb4a161acd6a8caa4/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2163, 2163, 'http://www.headingtech.com/center/tz/6/3684bbab81e14da2ac717771a8f03883/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2164, 2164, 'http://www.headingtech.com/center/tz/6/a33a0fc2ea2f4180a1e405313c6a3eeb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2165, 2165, 'http://www.headingtech.com/center/tz/6/a3f2d098a1eb44fda844138e1788e496/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2166, 2166, 'http://www.headingtech.com/center/tz/6/caed098794e24fbe9a58323e297b5f87/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2167, 2167, 'http://www.headingtech.com/center/tz/6/3c6b75f113a7411c975208763b2c350d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2168, 2168, 'http://www.headingtech.com/center/tz/6/6d318ca88d9c4f4e912892f34f16d767/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2169, 2169, 'http://www.headingtech.com/center/tz/6/8da43bf0ce96480cb51c5436c0e696dc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2170, 2170, 'http://www.headingtech.com/center/tz/6/686349bf952844bf8e47e14cfc667f17/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2171, 2171, 'http://www.headingtech.com/center/tz/6/9ce69a9717a24dff8776cd41a711ac70/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2172, 2172, 'http://www.headingtech.com/center/tz/6/537c870d7ce14db1861acb462f7cd47e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2173, 2173, 'http://www.headingtech.com/center/tz/6/683e4ddc7dad49268f4fbc6a5e1865c1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2174, 2174, 'http://www.headingtech.com/center/tz/6/8a19d9eda51049d0b4f47da7858a45e3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2175, 2175, 'http://www.headingtech.com/center/tz/6/5ab33a2a8ab04ff19e7af06d9c32fb6c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2176, 2176, 'http://www.headingtech.com/center/tz/6/0b422485192b41e4adcf14f8f185724a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2177, 2177, 'http://www.headingtech.com/center/tz/6/5de0478dce1846a0b3d8edac2209a515/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2178, 2178, 'http://www.headingtech.com/center/tz/6/740f3b147c9c4d1da323b1741eb9a36b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2179, 2179, 'http://www.headingtech.com/center/tz/6/99105ccb1b554dcb9ffd5671fbb20b08/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2180, 2180, 'http://www.headingtech.com/center/tz/6/c7900b2ae006485485e5359f0a8fa1db/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2181, 2181, 'http://www.headingtech.com/center/tz/6/f13ecdbef0534985a3a82b48219b9b35/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2182, 2182, 'http://www.headingtech.com/center/tz/6/1a438afeecb440968e18eb0871f7a683/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2183, 2183, 'http://www.headingtech.com/center/tz/6/362e3792d1dd47d1b6dd437f87590e2a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2184, 2184, 'http://www.headingtech.com/center/tz/6/596481b5e0bc4d268935172dc06dac81/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2185, 2185, 'http://www.headingtech.com/center/tz/6/f0492390d822451681a33bf3028a8aa8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2186, 2186, 'http://www.headingtech.com/center/tz/6/1b510d567c344631ad00cf4b2e979217/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2187, 2187, 'http://www.headingtech.com/center/tz/6/de8b4a4e0c6948ee8679ddde09506464/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2188, 2188, 'http://www.headingtech.com/center/tz/6/c0595447c0444b49860eb8674ea968c8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2189, 2189, 'http://www.headingtech.com/center/tz/6/fa188a4be7e94323bfb968955ab28092/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2190, 2190, 'http://www.headingtech.com/center/tz/6/be5b70987c8a4126a50ce7b0d7906ea1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2191, 2191, 'http://www.headingtech.com/center/tz/6/5108f2c7d37e489e88fc1c268c1b6b39/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2192, 2192, 'http://www.headingtech.com/center/tz/6/e1c3298015204dc899501f5a80b014aa/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2193, 2193, 'http://www.headingtech.com/center/tz/6/cb823156928840c4a2f429e216e47ac3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2194, 2194, 'http://www.headingtech.com/center/tz/6/47e3c9de1c3d44a6824ed377473806fc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2195, 2195, 'http://www.headingtech.com/center/tz/6/b4cafd68b0064c6c8dac3b48b68b3113/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2196, 2196, 'http://www.headingtech.com/center/tz/6/c7bf6989ac7c469b95ed6a458013c112/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2197, 2197, 'http://www.headingtech.com/center/tz/6/afd99dc2071f43d89db6b9e26d7ffcca/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2198, 2198, 'http://www.headingtech.com/center/tz/6/121ea26e92dd4dd5bd1981c30e625838/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2199, 2199, 'http://www.headingtech.com/center/tz/6/ab271a81044c4a10ac8d3faa6731ce36/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2200, 2200, 'http://www.headingtech.com/center/tz/6/ef132128a96647aa84058594d5ddd089/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2201, 2201, 'http://www.headingtech.com/center/tz/6/c4dcc6a3ec484a84b1aee223e6e972dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2202, 2202, 'http://www.headingtech.com/center/tz/6/881248928b174a0282bea496ceea6be1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2203, 2203, 'http://www.headingtech.com/center/tz/6/b5adcf9ef11c43cc9bb59db18c905b56/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2204, 2204, 'http://www.headingtech.com/center/tz/6/e36403f8747e4ad185acdfebb99fbbdc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2205, 2205, 'http://www.headingtech.com/center/tz/6/e119d2e2faff4e168d4d7dae0a49308e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2206, 2206, 'http://www.headingtech.com/center/tz/6/ef91de29f0c24879958a0fbd200e7fb9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2207, 2207, 'http://www.headingtech.com/center/tz/6/f5f14cfe7b5046a0a90f57792990ec9d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2208, 2208, 'http://www.headingtech.com/center/tz/6/ad091096e1b241ed8ac9062c7512d8ac/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2209, 2209, 'http://www.headingtech.com/center/tz/6/4fb8fd30b0e24a64998d72a77351811e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2210, 2210, 'http://www.headingtech.com/center/tz/6/8879520b899041cb9668c704e57ccfa1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2211, 2211, 'http://www.headingtech.com/center/tz/6/9d99f9b26ee64a72a4eb2e3d90a55f72/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2212, 2212, 'http://www.headingtech.com/center/tz/6/a2d6c89614de4d368c57b029259c7b96/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2213, 2213, 'http://www.headingtech.com/center/tz/6/4484a2d3520141d9bde21558a6c5a953/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2214, 2214, 'http://www.headingtech.com/center/tz/6/e5fb7aed2c61468aa4c3dff11e651a57/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2215, 2215, 'http://www.headingtech.com/center/tz/6/bc814e9f39114b1d968bdc46eb48761b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2216, 2216, 'http://www.headingtech.com/center/tz/6/877dd7eca6314ec28ab3daa72d1fbc40/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2217, 2217, 'http://www.headingtech.com/center/tz/6/4e60279776b443b2bf37f15f3bb04e9c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2218, 2218, 'http://www.headingtech.com/center/tz/6/f5bd16c6c41a480aa6d67fa669800f93/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2219, 2219, 'http://www.headingtech.com/center/tz/6/0d27bbd369ea479d972a817724bed609/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2220, 2220, 'http://www.headingtech.com/center/tz/6/7eebddeba49442279ee4ee794e823d2d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2221, 2221, 'http://www.headingtech.com/center/tz/6/3c8ea81e620c4725a204eb3bfb814014/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2222, 2222, 'http://www.headingtech.com/center/tz/6/f205ec43462e4662b3dfed7ebcc0657c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2223, 2223, 'http://www.headingtech.com/center/tz/6/83e4162dbfb14ce893c8eae383726c93/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2224, 2224, 'http://www.headingtech.com/center/tz/6/3c4631236b694f19957bcde3d82e1be5/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2225, 2225, 'http://www.headingtech.com/center/tz/6/73cd5898fc8640ea84e97b492aa4ec08/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2226, 2226, 'http://www.headingtech.com/center/tz/6/cb4416f5220d49919d36483ef2c2ebec/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2227, 2227, 'http://www.headingtech.com/center/tz/6/60605d0d53f243128a4f2450d3d8b227/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2228, 2228, 'http://www.headingtech.com/center/tz/6/1bdd1d0c71994116acf2c951264ab320/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2229, 2229, 'http://www.headingtech.com/center/tz/6/c2511e4202d7405697185c9cd956ff2c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2230, 2230, 'http://www.headingtech.com/center/tz/6/e13d59553c454a838b76fe7d879844ad/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2231, 2231, 'http://www.headingtech.com/center/tz/6/622f1fbe7bdc4b5189a751e78f96ad45/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2232, 2232, 'http://www.headingtech.com/center/tz/6/623f569a43894f1b8d3a81574526ba9e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2233, 2233, 'http://www.headingtech.com/center/tz/6/33281af84a7042959adb48a16dcffae7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2234, 2234, 'http://www.headingtech.com/center/tz/6/c1f9f198cedb4257b32d858aec1a3bf7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2235, 2235, 'http://www.headingtech.com/center/tz/6/89910ce6b4f242008a56c877b8beebdc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2236, 2236, 'http://www.headingtech.com/center/tz/6/977798dfc5bb4c888d5e84864b295b9d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2237, 2237, 'http://www.headingtech.com/center/tz/6/a17bb3c62e0343ae84372674da75830d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2238, 2238, 'http://www.headingtech.com/center/tz/6/7e03b529f2e048828e7f2b2ce82abb1f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2239, 2239, 'http://www.headingtech.com/center/tz/6/96d63b9260ba48948bf6ea56fc7031d9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2240, 2240, 'http://www.headingtech.com/center/tz/6/52323f9d4b2748a7ad19db7b906f1d75/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2241, 2241, 'http://www.headingtech.com/center/tz/6/ba3a3ac0465b42f3ae1559f056bbc34b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2242, 2242, 'http://www.headingtech.com/center/tz/6/c92bdd80754c4706974775c41fc0bc3f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2243, 2243, 'http://www.headingtech.com/center/tz/6/4d24297850bb4640a39c6c4605b99d7d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2244, 2244, 'http://www.headingtech.com/center/tz/6/e787b0fce4e14feab90a30616ac64f84/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2245, 2245, 'http://www.headingtech.com/center/tz/6/e69c592f32f548d5a66ff81ff3645a22/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2246, 2246, 'http://www.headingtech.com/center/tz/6/16e3186a0e92400b89c04a5129bf8f91/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2247, 2247, 'http://www.headingtech.com/center/tz/6/ead0c56df520411297d75cb9ab624e4b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2248, 2248, 'http://www.headingtech.com/center/tz/6/093f4fa3fe5f4ab1b370847772d21844/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2249, 2249, 'http://www.headingtech.com/center/tz/6/4436aa7d56094a37a6b8625e48166d7f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2250, 2250, 'http://www.headingtech.com/center/tz/6/915c4725d34a443289ec36e7086259ad/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2251, 2251, 'http://www.headingtech.com/center/tz/6/1eabacbabe69446793911ce25c3fb4c0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2252, 2252, 'http://www.headingtech.com/center/tz/6/e2ee9104f91f4c0086274cd293e6cfcb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2253, 2253, 'http://www.headingtech.com/center/tz/6/c828e6839d0b4c7c80618debe427293d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2254, 2254, 'http://www.headingtech.com/center/tz/6/a02bcaa008f34258ac215681469eff8f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2255, 2255, 'http://www.headingtech.com/center/tz/6/51756d5f1f364da0999b70aa6baa6f79/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2256, 2256, 'http://www.headingtech.com/center/tz/6/7217e34fcff645479c1d2d191b60ed58/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2257, 2257, 'http://www.headingtech.com/center/tz/6/1fbdd329fcd54979a79076951e2abbb3/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2258, 2258, 'http://www.headingtech.com/center/tz/6/09ef2dae6f454d43ab188faae20fb940/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2259, 2259, 'http://www.headingtech.com/center/tz/6/174c260c99324888a914ad8d5695265c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2260, 2260, 'http://www.headingtech.com/center/tz/6/edd94ecd534048859245d3fa9d15ec9c/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2261, 2261, 'http://www.headingtech.com/center/tz/6/cfb59397c52f4f6e8d4f9c80a13fdcc9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2262, 2262, 'http://www.headingtech.com/center/tz/6/4fee82ceeb6d4de6bb9234ee7463fcd9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2263, 2263, 'http://www.headingtech.com/center/tz/6/c3130ed7b7f44ab6a7f74c4413b3b6be/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2264, 2264, 'http://www.headingtech.com/center/tz/6/b1e1d4c9146946769c9ca3a3b207ec18/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2265, 2265, 'http://www.headingtech.com/center/tz/6/e263081c7fe84898ac0f9ca527827f02/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2266, 2266, 'http://www.headingtech.com/center/tz/6/1562b7a3433248b6a428dcc79b71e39a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2267, 2267, 'http://www.headingtech.com/center/tz/6/6e450f96177c4c34890708a0cb6f8c20/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2268, 2268, 'http://www.headingtech.com/center/tz/6/f0cd7897252849a988937c570f90691b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2269, 2269, 'http://www.headingtech.com/center/tz/6/d96e6da74671471e83f422a56d92de8d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2270, 2270, 'http://www.headingtech.com/center/tz/6/e13672a7ada44cbaa331226764abaab0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2271, 2271, 'http://www.headingtech.com/center/tz/6/840cbc2f42df432da34a8e7d1c735c68/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2272, 2272, 'http://www.headingtech.com/center/tz/6/c5e4bf81db2241c69e02f1d7f78b1ba7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2273, 2273, 'http://www.headingtech.com/center/tz/6/377f593b174a43f9b2eef306ad2c06b0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2274, 2274, 'http://www.headingtech.com/center/tz/6/6880c98338dc4840b332d440f226b762/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2275, 2275, 'http://www.headingtech.com/center/tz/6/acb42399cf05478dadb3cd2505c58aef/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2276, 2276, 'http://www.headingtech.com/center/tz/6/176ab5b79f304c6c910a47f7334861f6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2277, 2277, 'http://www.headingtech.com/center/tz/6/8b0d8b6ca9244aedae719bc57f339355/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2278, 2278, 'http://www.headingtech.com/center/tz/6/1e58b95a6bd743d39c673f0c5e16702a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2279, 2279, 'http://www.headingtech.com/center/tz/6/49b0cd9f802e4697bccc3bff6cd0cba8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2280, 2280, 'http://www.headingtech.com/center/tz/6/758f0e64d40341099e0e5de4e9344576/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2281, 2281, 'http://www.headingtech.com/center/tz/6/c4a189b783af46e0bc2f32a3a076b2c6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2282, 2282, 'http://www.headingtech.com/center/tz/6/12beb89be9c343fb9c88a76b4b29221b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2283, 2283, 'http://www.headingtech.com/center/tz/6/2a5153e1d647466abb744aadad0eb776/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2284, 2284, 'http://www.headingtech.com/center/tz/6/579ea5064e754556a20248a820894e1d/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2285, 2285, 'http://www.headingtech.com/center/tz/6/7591106ca91c4b32a4e1cb2fbaf3df06/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2286, 2286, 'http://www.headingtech.com/center/tz/6/425fc9de27fc4faf8fbd6c95fbafc3ea/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2287, 2287, 'http://www.headingtech.com/center/tz/6/3046965ade614ee7988cec3863572c76/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2288, 2288, 'http://www.headingtech.com/center/tz/6/2fa9c5d7bb614ab689df888791ac5e48/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2289, 2289, 'http://www.headingtech.com/center/tz/6/36c6a03b647b4e4c8edd191651ba1a22/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2290, 2290, 'http://www.headingtech.com/center/tz/6/4967773e7fab46e987c95e46b2f90a89/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2291, 2291, 'http://www.headingtech.com/center/tz/6/17e4065090d14c4a8688fb2adcf12dc7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2292, 2292, 'http://www.headingtech.com/center/tz/6/0d7924ee9ad54255a698eed012df19b7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2293, 2293, 'http://www.headingtech.com/center/tz/6/934dc8cf38254d78b094769aa849dcb9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2294, 2294, 'http://www.headingtech.com/center/tz/6/72acfdf604d544428f5ebe07ec6d8e8e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2295, 2295, 'http://www.headingtech.com/center/tz/6/1af1978b8eaa41c6ac2b67a3de56a4c8/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2296, 2296, 'http://www.headingtech.com/center/tz/6/55d9cb1e733c423d98d4b28ab06d3e21/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2297, 2297, 'http://www.headingtech.com/center/tz/6/ad579e69e50f49189429c2e8106b2c8f/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2298, 2298, 'http://www.headingtech.com/center/tz/6/27ff7fec1d2d4fb08d6a3f4ed2cd202b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2299, 2299, 'http://www.headingtech.com/center/tz/6/e555801a59234e998fdba8a7b456d9cf/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2300, 2300, 'http://www.headingtech.com/center/tz/6/0a868fd265684aac9699314708818aad/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2301, 2301, 'http://www.headingtech.com/center/tz/6/e0f45337a9934957b156bc73ea5fc2e1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2302, 2302, 'http://www.headingtech.com/center/tz/6/9f3bdd2a54a04affa8ee7d0f64644127/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2303, 2303, 'http://www.headingtech.com/center/tz/6/2def7d90e9024af782b4817c316766b0/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2304, 2304, 'http://www.headingtech.com/center/tz/6/fdf5552ce39f413e9884b3f94d5cb0fb/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2305, 2305, 'http://www.headingtech.com/center/tz/6/f4cb4ba0b98847ce81c4fc72dd40de5b/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2306, 2306, 'http://www.headingtech.com/center/tz/6/ff22c9ef7b79418193a7d6929fe12505/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2307, 2307, 'http://www.headingtech.com/center/tz/6/3331d1cb268140ffbbbbc84458d74eb1/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2308, 2308, 'http://www.headingtech.com/center/tz/6/fb99cc5d94514042be5848bb4c3476c2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2309, 2309, 'http://www.headingtech.com/center/tz/6/6034c3e386c64822b16c6679cf728ea7/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2310, 2310, 'http://www.headingtech.com/center/tz/6/f441a439323e42578c56b362225a90e9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2311, 2311, 'http://www.headingtech.com/center/tz/6/96a3c4ef0133461aaa40b5ce9e78840e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2312, 2312, 'http://www.headingtech.com/center/tz/6/efe20f7cff314603949b77c734ebc912/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2313, 2313, 'http://www.headingtech.com/center/tz/6/e3b3644c5c944fb0b3ff817642df5279/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2314, 2314, 'http://www.headingtech.com/center/tz/6/ed2384243a0c4ad2b4e4298dfc97c3dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2315, 2315, 'http://www.headingtech.com/center/tz/6/0ec55a1ffa6f46e3819f2d4ec5993c70/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2316, 2316, 'http://www.headingtech.com/center/tz/6/76f8f739108749b79ea618aadc6cf8a2/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2317, 2317, 'http://www.headingtech.com/center/tz/6/f2eb9d9699e5443ba0026899193fb226/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2318, 2318, 'http://www.headingtech.com/center/tz/6/4099795bff264b76bb8012739920d0de/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2319, 2319, 'http://www.headingtech.com/center/tz/6/f7bb5696b59a47d185727f54a61a4fce/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2320, 2320, 'http://www.headingtech.com/center/tz/6/998e9f1eb5ca4e7098a0fa23bd36f697/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2321, 2321, 'http://www.headingtech.com/center/tz/6/e192f2ae1fb543858ca716c196179f33/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2322, 2322, 'http://www.headingtech.com/center/tz/6/b269b62da9f743cc99c5e94f25478e56/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2323, 2323, 'http://www.headingtech.com/center/tz/6/0ed3788970c047808c05ead0519a1596/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2324, 2324, 'http://www.headingtech.com/center/tz/6/2c20e5354e934ef39340949d169b0642/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2325, 2325, 'http://www.headingtech.com/center/tz/6/52b8f4e895a847aabc8a9c9b85c50eb6/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2326, 2326, 'http://www.headingtech.com/center/tz/6/d013e3a5ed7f4cfbbdace8271db531c9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2327, 2327, 'http://www.headingtech.com/center/tz/6/a760e66aaa084e54b1f36038a52383bc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2328, 2328, 'http://www.headingtech.com/center/tz/6/81ba8780674a4c7a963896b0cfaececc/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2329, 2329, 'http://www.headingtech.com/center/tz/6/295d5951ecbc483296dbb1312d55d652/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2330, 2330, 'http://www.headingtech.com/center/tz/6/ea8c7c93364549039aa8ec6417fcbb2e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2331, 2331, 'http://www.headingtech.com/center/tz/6/b194bda621bc4985906fd505f88ea0dd/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2332, 2332, 'http://www.headingtech.com/center/tz/6/0f1ea43b945b4bafa347dc8886a9c028/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2333, 2333, 'http://www.headingtech.com/center/tz/6/14cd39e5287847e28927d58660f97396/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2334, 2334, 'http://www.headingtech.com/center/tz/6/7c41b6d2235d445a91b70c29cefed31e/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2335, 2335, 'http://www.headingtech.com/center/tz/6/c8667dff2ee84f1795ecf1f823e5e14a/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2336, 2336, 'http://www.headingtech.com/center/tz/6/415934ca39dc4bada10aa3d093cdfbd9/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2337, 2337, 'http://www.headingtech.com/center/tz/6/353c6c1e7b84438d89734e6b359dc517/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2338, 2338, 'http://www.headingtech.com/center/tz/6/c48f25b07e0c4ee18be85fbacb7afc61/12', '20181203230119', 2, 2, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2339, 2339, 'http://www.headingtech.com/center/tz/6/cc104e91c5bc448c974ac9909640e01f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2340, 2340, 'http://www.headingtech.com/center/tz/6/19a6df8062124df0aaaf5acda946e1a4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2341, 2341, 'http://www.headingtech.com/center/tz/6/13e620c239604f83bae4167f161b932e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2342, 2342, 'http://www.headingtech.com/center/tz/6/fdb2fc101c474f60b5a959a1118d8b81/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2343, 2343, 'http://www.headingtech.com/center/tz/6/ec7df2973a7a478f9b8a4d47b14b5457/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2344, 2344, 'http://www.headingtech.com/center/tz/6/6cd7f7b9175a4d4984f3439e7ef33e2f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2345, 2345, 'http://www.headingtech.com/center/tz/6/f726925096b9494badd2ae4d5de5b786/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2346, 2346, 'http://www.headingtech.com/center/tz/6/370a44d964fe4aeda8f7c4699c866caf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2347, 2347, 'http://www.headingtech.com/center/tz/6/e7b3f9d587164818b70f18cfb77cebcc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2348, 2348, 'http://www.headingtech.com/center/tz/6/2ca84389e2764de1bd9f7a28683c1e0e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2349, 2349, 'http://www.headingtech.com/center/tz/6/ba414a4af4764513a801b0d4a18dc335/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2350, 2350, 'http://www.headingtech.com/center/tz/6/4d14de85c0e644b5924eac2006558d18/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2351, 2351, 'http://www.headingtech.com/center/tz/6/a90d8a5ff14d47f6a5481f275f51d4c1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2352, 2352, 'http://www.headingtech.com/center/tz/6/0c255f59f3434202baf16ba2c0c6392a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2353, 2353, 'http://www.headingtech.com/center/tz/6/94c71f3a15ed45e191091fd18158a8c3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2354, 2354, 'http://www.headingtech.com/center/tz/6/d959073ebc8c47b8aabd93039b4dc717/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2355, 2355, 'http://www.headingtech.com/center/tz/6/e5dac147f0344635acb41e2891d4104f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2356, 2356, 'http://www.headingtech.com/center/tz/6/78edf984d33a4c9d85b7492da9da363a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2357, 2357, 'http://www.headingtech.com/center/tz/6/a74de36256f44640b0c9715bc52450d4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2358, 2358, 'http://www.headingtech.com/center/tz/6/4fc004e027f942f1a2e64dfcd5ab0cf2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2359, 2359, 'http://www.headingtech.com/center/tz/6/10c70462b3a04cd4a87a54b5a232e356/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2360, 2360, 'http://www.headingtech.com/center/tz/6/e58caadfc2b94eccba795ff0a296e68e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2361, 2361, 'http://www.headingtech.com/center/tz/6/035cabea749b40548855eb092f6b969b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2362, 2362, 'http://www.headingtech.com/center/tz/6/315c5a657927487b884ef00aaf3020b9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2363, 2363, 'http://www.headingtech.com/center/tz/6/9ad3d47fc91b48ff9378d5413e0c4488/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2364, 2364, 'http://www.headingtech.com/center/tz/6/7b036221a9314a77a1fa726aa1378c04/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2365, 2365, 'http://www.headingtech.com/center/tz/6/b331cdb34ee54f3882060864230744f3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2366, 2366, 'http://www.headingtech.com/center/tz/6/9646b00a6e1e47b4943cd52d51b400c6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2367, 2367, 'http://www.headingtech.com/center/tz/6/07ec23d62e5c433f9794e469bbfd5b95/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2368, 2368, 'http://www.headingtech.com/center/tz/6/2dc4d1aa6a984fc39ab503eccf0f1a51/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2369, 2369, 'http://www.headingtech.com/center/tz/6/5756fa6d3ec342f49f184e4120aebfa3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2370, 2370, 'http://www.headingtech.com/center/tz/6/96ee4a4573f946ac99c8bcf255b9c295/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2371, 2371, 'http://www.headingtech.com/center/tz/6/4f3215b2ee43444486940b814bc82ce6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2372, 2372, 'http://www.headingtech.com/center/tz/6/e4e8c410e2a9411db60c38bcf0003a04/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2373, 2373, 'http://www.headingtech.com/center/tz/6/ad757a2892a843b7a52abaecbb421100/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2374, 2374, 'http://www.headingtech.com/center/tz/6/3ae663f28d2b448c9fa5d786932d9c9b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2375, 2375, 'http://www.headingtech.com/center/tz/6/95c02870ca334e1cab82f4374905c55a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2376, 2376, 'http://www.headingtech.com/center/tz/6/c8eab75a7b564567ac87b3d478ae2c1f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2377, 2377, 'http://www.headingtech.com/center/tz/6/24ac8c18688d4d15b1f0df4bd92eaf6f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2378, 2378, 'http://www.headingtech.com/center/tz/6/6e1c44763f564987ba763e390ca5b73f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2379, 2379, 'http://www.headingtech.com/center/tz/6/0b3941e747d8461fb278321a121e599c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2380, 2380, 'http://www.headingtech.com/center/tz/6/9be644c81d4b474f81141f6cf5e17b69/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2381, 2381, 'http://www.headingtech.com/center/tz/6/b648aded62334d1f8502144320d96c6f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2382, 2382, 'http://www.headingtech.com/center/tz/6/b081e3868d4445ff90ca1e8ea26b7d45/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2383, 2383, 'http://www.headingtech.com/center/tz/6/7e5957d03b7b4a02accde1b01d7165e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2384, 2384, 'http://www.headingtech.com/center/tz/6/b05807074dc444a38c5bcf1c91d3fb63/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2385, 2385, 'http://www.headingtech.com/center/tz/6/1a793d1a622b4080b661ae5282978512/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2386, 2386, 'http://www.headingtech.com/center/tz/6/49c6d5cb345f43638ada63a486077a98/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2387, 2387, 'http://www.headingtech.com/center/tz/6/f775ef6acff34b33b1fbf2d15b32d6d5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2388, 2388, 'http://www.headingtech.com/center/tz/6/8dfb8f1d68014adf977d0056ad209bf6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2389, 2389, 'http://www.headingtech.com/center/tz/6/2ed47ce4074a451aab0fcf4cb288bcba/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2390, 2390, 'http://www.headingtech.com/center/tz/6/34c68e99fd344d8dbb5f08bc8e20e7f3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2391, 2391, 'http://www.headingtech.com/center/tz/6/465f3eedcf1c45f7bc85925e143752f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2392, 2392, 'http://www.headingtech.com/center/tz/6/c13b3bb6f1f14b049a92ff1e81a43349/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2393, 2393, 'http://www.headingtech.com/center/tz/6/79fcf0db195b47f0ab56970e10328661/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2394, 2394, 'http://www.headingtech.com/center/tz/6/3c9c75030553423a979c940642b9dd3a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2395, 2395, 'http://www.headingtech.com/center/tz/6/9c02a127e60746778b5a0677d390dd2e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2396, 2396, 'http://www.headingtech.com/center/tz/6/e8e1d3a0617b4e2fa799c1d2ecc034c5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2397, 2397, 'http://www.headingtech.com/center/tz/6/a0d9b802f69b4a7cbbbc3af856080883/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2398, 2398, 'http://www.headingtech.com/center/tz/6/d0f79ddc059d4e9191af8ae6decb2ef1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2399, 2399, 'http://www.headingtech.com/center/tz/6/ec06b9d0388e4401aa45e44b53bab572/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2400, 2400, 'http://www.headingtech.com/center/tz/6/1d3a9a33e14f437f962678ef7b3e9922/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2401, 2401, 'http://www.headingtech.com/center/tz/6/190b2d1ed27f4a98bffe1b39f02d2135/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2402, 2402, 'http://www.headingtech.com/center/tz/6/208ab199ff684d2b9a927d1c3cffb185/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2403, 2403, 'http://www.headingtech.com/center/tz/6/74010b891fed4b5c908ecec85500e50f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2404, 2404, 'http://www.headingtech.com/center/tz/6/80f3123cca8b4c45977751a149ff5163/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2405, 2405, 'http://www.headingtech.com/center/tz/6/ea3e5e7e6e0641749f7098729274a91f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2406, 2406, 'http://www.headingtech.com/center/tz/6/a0477094976348a989ed0e4764467424/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2407, 2407, 'http://www.headingtech.com/center/tz/6/9609fe268d044317ba2b9244f34e21e0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2408, 2408, 'http://www.headingtech.com/center/tz/6/d31d0658870a4f9f88ba409039bbc949/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2409, 2409, 'http://www.headingtech.com/center/tz/6/4139bc309f3f4dae89605474a5aa5aae/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2410, 2410, 'http://www.headingtech.com/center/tz/6/96f9eb96343d4368ba3ec86ba8c37a34/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2411, 2411, 'http://www.headingtech.com/center/tz/6/609b69585fcd415a93759bc6e99dfcf2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2412, 2412, 'http://www.headingtech.com/center/tz/6/d28fafaf27174596b4561f77dd3a9357/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2413, 2413, 'http://www.headingtech.com/center/tz/6/0cbadb30a3f5496098fea2635d475834/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2414, 2414, 'http://www.headingtech.com/center/tz/6/62f2ba24102b4182957a80f51f1f6447/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2415, 2415, 'http://www.headingtech.com/center/tz/6/c38bfcf6d81d4818886672a83195d6e9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2416, 2416, 'http://www.headingtech.com/center/tz/6/f4b1011f3240441da813c93d1f37e4de/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2417, 2417, 'http://www.headingtech.com/center/tz/6/38173bb30aaa466bbc21b7aa38043a20/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2418, 2418, 'http://www.headingtech.com/center/tz/6/58b480e2a2be4c9e9753d0e02a8f5b9c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2419, 2419, 'http://www.headingtech.com/center/tz/6/8321e1655ea24453ad3af2ffb7539f03/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2420, 2420, 'http://www.headingtech.com/center/tz/6/62ba17c2fa79437bb958bdfcfd423c3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2421, 2421, 'http://www.headingtech.com/center/tz/6/e2aad546ee5f4a3ab6d1be00db511377/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2422, 2422, 'http://www.headingtech.com/center/tz/6/80f78b38656e488599d7b1047f813341/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2423, 2423, 'http://www.headingtech.com/center/tz/6/96d633a407ee49149c8381c0864962a6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2424, 2424, 'http://www.headingtech.com/center/tz/6/49809d7f747e485987739b0e9744ab3e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2425, 2425, 'http://www.headingtech.com/center/tz/6/883a3497f7c24e51a547e0a9a0049285/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2426, 2426, 'http://www.headingtech.com/center/tz/6/a3187b0f7ceb4860b832462a26a6655c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2427, 2427, 'http://www.headingtech.com/center/tz/6/403aea3526af4582a89f7fc1defa6cae/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2428, 2428, 'http://www.headingtech.com/center/tz/6/a9ce876cc1d6432189258c6ccb452640/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2429, 2429, 'http://www.headingtech.com/center/tz/6/c1d43cdc6b3c4f58ac7618b858307a0b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2430, 2430, 'http://www.headingtech.com/center/tz/6/a53ffb991e804eb7b050fdb106990151/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2431, 2431, 'http://www.headingtech.com/center/tz/6/5016ea0dbcac420fa05defbc40f75b9a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2432, 2432, 'http://www.headingtech.com/center/tz/6/d92fd503a1864109bf713ee51f89953e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2433, 2433, 'http://www.headingtech.com/center/tz/6/059ebe381f24490295f3ce69bb593084/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2434, 2434, 'http://www.headingtech.com/center/tz/6/277eb29d3aa2453abdcf3482e855b52f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2435, 2435, 'http://www.headingtech.com/center/tz/6/6a3bdeea45134047a3865b643856e74e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2436, 2436, 'http://www.headingtech.com/center/tz/6/82e3ddcc39fc401fa6b808fac19c0389/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2437, 2437, 'http://www.headingtech.com/center/tz/6/576091af05d74a1183902981ba19d072/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2438, 2438, 'http://www.headingtech.com/center/tz/6/04b39312057c4e86a9ad7df23a1e4dce/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2439, 2439, 'http://www.headingtech.com/center/tz/6/20130be5e2e3458281bce3ca201d5630/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2440, 2440, 'http://www.headingtech.com/center/tz/6/22716a64a341468b9dc5b6c2fdf14a07/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2441, 2441, 'http://www.headingtech.com/center/tz/6/27c0c5873aad45b5822bbea03d5d8f6d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2442, 2442, 'http://www.headingtech.com/center/tz/6/05fe492a521445c0b5726b351262578a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2443, 2443, 'http://www.headingtech.com/center/tz/6/3350c268581a45ea9237f11092120666/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2444, 2444, 'http://www.headingtech.com/center/tz/6/35a45b83718b4e38a7b027dbf4254be1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2445, 2445, 'http://www.headingtech.com/center/tz/6/1021ffe5f42e40c1a9f72056de4719f9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2446, 2446, 'http://www.headingtech.com/center/tz/6/e2678c71ca724b6f8e5cc781ae6e9991/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2447, 2447, 'http://www.headingtech.com/center/tz/6/c3ac5ccc7cff447eb7fdc01ba9d9fac8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2448, 2448, 'http://www.headingtech.com/center/tz/6/86da397d505047269a7a014030a9a021/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2449, 2449, 'http://www.headingtech.com/center/tz/6/543d50824f1f4ecd90c57aeae5efb64d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2450, 2450, 'http://www.headingtech.com/center/tz/6/f7f47008769349f6a053cde4fb2c1970/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2451, 2451, 'http://www.headingtech.com/center/tz/6/c89f59f6827b4be499de3abff5df37f0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2452, 2452, 'http://www.headingtech.com/center/tz/6/ef1e6226c4514f168b9a9177bd805b0f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2453, 2453, 'http://www.headingtech.com/center/tz/6/1fe1e068329c4301b43864ccb72435ec/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2454, 2454, 'http://www.headingtech.com/center/tz/6/8e8ae68d742346dbaa1224fe1ed2b126/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2455, 2455, 'http://www.headingtech.com/center/tz/6/9ad272e5bb474341a8f3d5cd39519741/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2456, 2456, 'http://www.headingtech.com/center/tz/6/6b9a3d12160048c4af6e875206b9586d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2457, 2457, 'http://www.headingtech.com/center/tz/6/cf08b07f2e9541689024147acc09565f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2458, 2458, 'http://www.headingtech.com/center/tz/6/5c1c34bd02094285ad92c7f419bd16bc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2459, 2459, 'http://www.headingtech.com/center/tz/6/a939da20c84a4e539eca1170d144c8ee/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2460, 2460, 'http://www.headingtech.com/center/tz/6/7cdb04e87862472ead4afaf0641420d0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2461, 2461, 'http://www.headingtech.com/center/tz/6/09e8cee932fa4a46ae77f8b91cb27a73/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2462, 2462, 'http://www.headingtech.com/center/tz/6/8ea1344a4dc24e20a498b991458d11c3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2463, 2463, 'http://www.headingtech.com/center/tz/6/84f0f624227c485fb7d3855e5f4cb678/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2464, 2464, 'http://www.headingtech.com/center/tz/6/670ec06e65314d8a89740b3a61b9e65b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2465, 2465, 'http://www.headingtech.com/center/tz/6/13bbaa7e70fd425d9532ace335f85f64/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2466, 2466, 'http://www.headingtech.com/center/tz/6/7ad8700c10104fec8806c079cca5633d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2467, 2467, 'http://www.headingtech.com/center/tz/6/4af0181650924c46ad9f010d83397f30/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2468, 2468, 'http://www.headingtech.com/center/tz/6/2126e6e6188044a2a450742a7d9332ff/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2469, 2469, 'http://www.headingtech.com/center/tz/6/1623d2aaf9b34ccbb1d008425d8f885d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2470, 2470, 'http://www.headingtech.com/center/tz/6/599e9fb486304a9ba107bebf72e59e61/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2471, 2471, 'http://www.headingtech.com/center/tz/6/0b8d0e586ce04fff8bb860db85f57912/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2472, 2472, 'http://www.headingtech.com/center/tz/6/b7d9fcc609b4474688a41b5ff40ac575/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2473, 2473, 'http://www.headingtech.com/center/tz/6/5568f07baed44a41ab67c6ca55396b22/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2474, 2474, 'http://www.headingtech.com/center/tz/6/64295fbfcb2a4c4f90c13787047f5b8d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2475, 2475, 'http://www.headingtech.com/center/tz/6/faddcea46bfb4d09a6cbbc6972822b43/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2476, 2476, 'http://www.headingtech.com/center/tz/6/7bfda392ff2745c7b5486194a037f88d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2477, 2477, 'http://www.headingtech.com/center/tz/6/2a434fbac08047f4a1bd7eb311a053d4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2478, 2478, 'http://www.headingtech.com/center/tz/6/bf9a02eb35ad49339c0482d954932f73/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2479, 2479, 'http://www.headingtech.com/center/tz/6/b6540df8120648429c2fc08d1df61a96/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2480, 2480, 'http://www.headingtech.com/center/tz/6/242d659174ed480f8c1d90cacf7e465b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2481, 2481, 'http://www.headingtech.com/center/tz/6/443a3bba1e674ff4a4cf324519350571/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2482, 2482, 'http://www.headingtech.com/center/tz/6/c3f4b767bb7e4b7a907abfd5d3cf0a87/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2483, 2483, 'http://www.headingtech.com/center/tz/6/40f842eeeb8d4bf2bacfbb4e928fdf25/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2484, 2484, 'http://www.headingtech.com/center/tz/6/fb91830d3d684d6eb65a9a7984843e12/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2485, 2485, 'http://www.headingtech.com/center/tz/6/66a8f62eb5014dda94fb2001244c43dc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2486, 2486, 'http://www.headingtech.com/center/tz/6/030798dbd2e24020ab9f5c38bd2729fa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2487, 2487, 'http://www.headingtech.com/center/tz/6/60080bcf287a42a98f110c669ac224c1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2488, 2488, 'http://www.headingtech.com/center/tz/6/415e3dd1f55d4f00be4c1b17c618099c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2489, 2489, 'http://www.headingtech.com/center/tz/6/d928114391ca4b40b8f13b6af59a3869/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2490, 2490, 'http://www.headingtech.com/center/tz/6/e20158b8b9604b4e870362c44758ab29/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2491, 2491, 'http://www.headingtech.com/center/tz/6/9b42f2a3773247889ebdc296fa3e3fb6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2492, 2492, 'http://www.headingtech.com/center/tz/6/9115b47be2804496b1a7f6f33e102b80/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2493, 2493, 'http://www.headingtech.com/center/tz/6/5aa8bd29f2aa48ffb5dcd2a0334d34b3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2494, 2494, 'http://www.headingtech.com/center/tz/6/423c91e225064736a7bc0758d11c5fbe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2495, 2495, 'http://www.headingtech.com/center/tz/6/1e141d22fd3d42e195addde6803ed5e9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2496, 2496, 'http://www.headingtech.com/center/tz/6/f3c6350d0d6940efbd679593744ec69f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2497, 2497, 'http://www.headingtech.com/center/tz/6/75fb5522df594f45a6674e0d741475f0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2498, 2498, 'http://www.headingtech.com/center/tz/6/df5ea1b24f654cff9251a316a5ccb798/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2499, 2499, 'http://www.headingtech.com/center/tz/6/a81167ad99514cb386c30a7d9a8ad0ab/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2500, 2500, 'http://www.headingtech.com/center/tz/6/4a958ce17e5e4468a641597e3908f6e0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2501, 2501, 'http://www.headingtech.com/center/tz/6/8ea5c7e4da224035a3053535843f8ebd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2502, 2502, 'http://www.headingtech.com/center/tz/6/218b10fe733040eca1a052b4468bc174/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2503, 2503, 'http://www.headingtech.com/center/tz/6/ae70fdca416b49a08a9689e81db562dd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2504, 2504, 'http://www.headingtech.com/center/tz/6/2a3e25cb43594c8082451d19bbffaa22/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2505, 2505, 'http://www.headingtech.com/center/tz/6/2c348a3b9d0340548cfb900227410290/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2506, 2506, 'http://www.headingtech.com/center/tz/6/1015aa480b774726a46b17dddb2dde54/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2507, 2507, 'http://www.headingtech.com/center/tz/6/e0ced699500f4cccb56dbb5a6a64189e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2508, 2508, 'http://www.headingtech.com/center/tz/6/75cdf10eab5e4eafa68f49a8d70efd0d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2509, 2509, 'http://www.headingtech.com/center/tz/6/81ad1e34bef54a4da8c08f1fbe8e320c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2510, 2510, 'http://www.headingtech.com/center/tz/6/2b2c2e6f639b444c9b5c04ceb1d1340d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2511, 2511, 'http://www.headingtech.com/center/tz/6/35ffbab0d959433882baa5bda9a5a45b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2512, 2512, 'http://www.headingtech.com/center/tz/6/75e2e83563854ae8bf5485f10188a5e6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2513, 2513, 'http://www.headingtech.com/center/tz/6/b98b81b33f1140618b76849f3248beda/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2514, 2514, 'http://www.headingtech.com/center/tz/6/cb435614ff4d41a88290558055972438/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2515, 2515, 'http://www.headingtech.com/center/tz/6/d93e45cdf012493987f8770b7f21fccb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2516, 2516, 'http://www.headingtech.com/center/tz/6/2225b6f3defb4fc98b2916c19542ac0d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2517, 2517, 'http://www.headingtech.com/center/tz/6/6d044a7e7a0e48928be73ce9a44f7783/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2518, 2518, 'http://www.headingtech.com/center/tz/6/dc60f5d64fb24c83a341251899f615a0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2519, 2519, 'http://www.headingtech.com/center/tz/6/f65b38eea75d4527935b7baa037f7c02/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2520, 2520, 'http://www.headingtech.com/center/tz/6/37a4828d54704563bca0835c2bb46a23/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2521, 2521, 'http://www.headingtech.com/center/tz/6/97fdb3a7ce9d494caf9c2c266cc7caed/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2522, 2522, 'http://www.headingtech.com/center/tz/6/a6e364f5fa2b478b936330014d2b54ca/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2523, 2523, 'http://www.headingtech.com/center/tz/6/9832097efde245689feafe0866a16bda/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2524, 2524, 'http://www.headingtech.com/center/tz/6/803a50d465e040bca3f3844c7a156e1e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2525, 2525, 'http://www.headingtech.com/center/tz/6/c34ff36cf04b47448c8fd1b3c65d3b15/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2526, 2526, 'http://www.headingtech.com/center/tz/6/ac093edcc35941ab9df9a09b66b86660/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2527, 2527, 'http://www.headingtech.com/center/tz/6/f0af6d9daa3a4e22bc62343ded0f89f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2528, 2528, 'http://www.headingtech.com/center/tz/6/449f574e64eb4012ac14cb9fa24141e8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2529, 2529, 'http://www.headingtech.com/center/tz/6/6bf2b99d3e754d43bf8e7c0dcdb3274a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2530, 2530, 'http://www.headingtech.com/center/tz/6/6f76ee25551c4c938293bf317b7c0aec/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2531, 2531, 'http://www.headingtech.com/center/tz/6/7c3499036699454d86497f2107898869/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2532, 2532, 'http://www.headingtech.com/center/tz/6/402c20e8572b459cb408cd239c8dbc00/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2533, 2533, 'http://www.headingtech.com/center/tz/6/1ecaf96c93834144baf13101a8730273/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2534, 2534, 'http://www.headingtech.com/center/tz/6/ebd570dc428a4d81ab820540b4618dc4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2535, 2535, 'http://www.headingtech.com/center/tz/6/efe1d7ee67e84e51bd4086f5ca7043e9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2536, 2536, 'http://www.headingtech.com/center/tz/6/74a2aa5b1ed642a9a72d6d6557131726/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2537, 2537, 'http://www.headingtech.com/center/tz/6/9b3133f201034821ab310ea65fb88662/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2538, 2538, 'http://www.headingtech.com/center/tz/6/45eef439a4c44070aefae7c2e8320811/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2539, 2539, 'http://www.headingtech.com/center/tz/6/e93bd4d052464b959524ca4208532da1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2540, 2540, 'http://www.headingtech.com/center/tz/6/3eeda5f854b040a29f209a6adcf01bea/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2541, 2541, 'http://www.headingtech.com/center/tz/6/3756c45706d44e16a3a9ed7186228069/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2542, 2542, 'http://www.headingtech.com/center/tz/6/09b65a48470942f196c5d4dc63a3de33/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2543, 2543, 'http://www.headingtech.com/center/tz/6/dd78b256ed804cb78d7d8498e3771a3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2544, 2544, 'http://www.headingtech.com/center/tz/6/00c146ffb38c4eb18bd993164e9dd1e7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2545, 2545, 'http://www.headingtech.com/center/tz/6/7dd2903923524076a462b534fb313ada/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2546, 2546, 'http://www.headingtech.com/center/tz/6/1ee1a8c24fcd4555b5b3665d56bf9628/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2547, 2547, 'http://www.headingtech.com/center/tz/6/40bc13e61dcd41b78e45e0724e43c745/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2548, 2548, 'http://www.headingtech.com/center/tz/6/4026d4d8837a45e2b5763fd2d6aacce2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2549, 2549, 'http://www.headingtech.com/center/tz/6/67145edd72ca4e0caf66761bad2c9fc4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2550, 2550, 'http://www.headingtech.com/center/tz/6/b7ed8605b2274b14badf87a36ce5519d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2551, 2551, 'http://www.headingtech.com/center/tz/6/d4b6d2c696d640f8824c84dda0e67bcc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2552, 2552, 'http://www.headingtech.com/center/tz/6/eb5147cfa7ef46c8b83b1f9d6c1a610b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2553, 2553, 'http://www.headingtech.com/center/tz/6/8e3eb9c77206418fa6f58e3ede100f96/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2554, 2554, 'http://www.headingtech.com/center/tz/6/c47cb09e929a477998b5bd4de8df1547/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2555, 2555, 'http://www.headingtech.com/center/tz/6/17431a6bfd0b44c884fd04bf6a1124af/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2556, 2556, 'http://www.headingtech.com/center/tz/6/2896d09476674f75aa62de004456dc36/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2557, 2557, 'http://www.headingtech.com/center/tz/6/de1ebd58e7cd47558c2ee23e7c040ed9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2558, 2558, 'http://www.headingtech.com/center/tz/6/2118245dc7d240a4993204ebabf033e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2559, 2559, 'http://www.headingtech.com/center/tz/6/ac1d59ee827a43c8a44780b5c4537356/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2560, 2560, 'http://www.headingtech.com/center/tz/6/0b37a04712744a669e92d67c1b3ad95c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2561, 2561, 'http://www.headingtech.com/center/tz/6/c5c88a04029a4337aad521f8a9088b39/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2562, 2562, 'http://www.headingtech.com/center/tz/6/7e1d8c22023a45ada21afb7956ca606f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2563, 2563, 'http://www.headingtech.com/center/tz/6/a6b953537ec449f0bf4ab47e7ed90366/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2564, 2564, 'http://www.headingtech.com/center/tz/6/8957f630af844fc39897b670e1041e98/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2565, 2565, 'http://www.headingtech.com/center/tz/6/bf7388ece3f84ed2a0eb846e4909f9f7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2566, 2566, 'http://www.headingtech.com/center/tz/6/c7e61bcf267f4fa7971340268e9fa6ab/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2567, 2567, 'http://www.headingtech.com/center/tz/6/18e014ebfc6643d4bccfc5c0a8e2b4ac/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2568, 2568, 'http://www.headingtech.com/center/tz/6/1852183b942b4d1d98b2307a2f9eefd1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2569, 2569, 'http://www.headingtech.com/center/tz/6/4eab7244f85c41ec991ddf25307a8776/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2570, 2570, 'http://www.headingtech.com/center/tz/6/f69829fe08264d42b4f9a1f42607f089/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2571, 2571, 'http://www.headingtech.com/center/tz/6/e25dbe3dcb4c42b7bf97b42ec2f48056/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2572, 2572, 'http://www.headingtech.com/center/tz/6/aa36ed321fd14f95932986903b2703d0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2573, 2573, 'http://www.headingtech.com/center/tz/6/2571e91ec6944ea28aa7edb1b7d17004/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2574, 2574, 'http://www.headingtech.com/center/tz/6/50f8f95920c54360b473157921849e78/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2575, 2575, 'http://www.headingtech.com/center/tz/6/766b2a769cb244419fe8eeb3d15bb631/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2576, 2576, 'http://www.headingtech.com/center/tz/6/499bd419da4d4a308ec06756ead69127/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2577, 2577, 'http://www.headingtech.com/center/tz/6/ade57758915b46c5b0de1451864b8213/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2578, 2578, 'http://www.headingtech.com/center/tz/6/ca9e4d8d6f35483eb5bc5e6b82a81aa0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2579, 2579, 'http://www.headingtech.com/center/tz/6/9d71f13429d240c389183dfbf5c8b898/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2580, 2580, 'http://www.headingtech.com/center/tz/6/b6f5145e4f224dd7bf4d80d9babd0bcc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2581, 2581, 'http://www.headingtech.com/center/tz/6/c7decb8db64448f59d3d8d0a00a44068/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2582, 2582, 'http://www.headingtech.com/center/tz/6/6cacbefd323044f4b225e58418d36fd7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2583, 2583, 'http://www.headingtech.com/center/tz/6/7cd18345b2f2454983d05aa9f777efe4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2584, 2584, 'http://www.headingtech.com/center/tz/6/9265b37ef7c947c2a6b58ccf82798e4d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2585, 2585, 'http://www.headingtech.com/center/tz/6/228058ac17674c9f9663dd1ac5d7f2ff/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2586, 2586, 'http://www.headingtech.com/center/tz/6/6caa5392436a40fb8757f45dbeac1886/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2587, 2587, 'http://www.headingtech.com/center/tz/6/e10ad2aefe214287a44b22b6c2b3b557/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2588, 2588, 'http://www.headingtech.com/center/tz/6/6d949f850d2c4d4da1a782188cf239ea/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2589, 2589, 'http://www.headingtech.com/center/tz/6/f30033d4ef7c4c5297dd65a486958384/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2590, 2590, 'http://www.headingtech.com/center/tz/6/3f908e08df7b4c83bbc1fb838607046b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2591, 2591, 'http://www.headingtech.com/center/tz/6/e3b0dce2f4044548ba201b1f5377f200/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2592, 2592, 'http://www.headingtech.com/center/tz/6/d4fb607ae9d348758a80ae962b240f25/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2593, 2593, 'http://www.headingtech.com/center/tz/6/a5e252e14a34487faf7724dcd61e8e79/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2594, 2594, 'http://www.headingtech.com/center/tz/6/a276a2e444e7483e960d4e52c661a6fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2595, 2595, 'http://www.headingtech.com/center/tz/6/471f9a60e1414b508adbb6ff2af27a78/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2596, 2596, 'http://www.headingtech.com/center/tz/6/fa8db95a74fc4a7294a831a6549f2748/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2597, 2597, 'http://www.headingtech.com/center/tz/6/673e55bc81dc42b98dddeaec544486c7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2598, 2598, 'http://www.headingtech.com/center/tz/6/a36b9acaa5b84ac2b8c982434fa8fba3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2599, 2599, 'http://www.headingtech.com/center/tz/6/9c4ac8f9399549b2aae1f03953392366/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2600, 2600, 'http://www.headingtech.com/center/tz/6/59bc60c3c50f4a0180d4a320a3356182/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2601, 2601, 'http://www.headingtech.com/center/tz/6/0a4ec25490374b5a95473f3945c480bf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2602, 2602, 'http://www.headingtech.com/center/tz/6/44c50f2322eb437facd7d4280a7966e2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2603, 2603, 'http://www.headingtech.com/center/tz/6/99078cdf27a94554b2ce317fd3b72fe3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2604, 2604, 'http://www.headingtech.com/center/tz/6/e89c8474f29c4c8a9b83c4d326b16a12/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2605, 2605, 'http://www.headingtech.com/center/tz/6/13c81787dc8946c6add1553af11e768f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2606, 2606, 'http://www.headingtech.com/center/tz/6/b5d19cabb4fb4d5a8977e3ab53008472/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2607, 2607, 'http://www.headingtech.com/center/tz/6/846fad970a54489899d4d164213cee52/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2608, 2608, 'http://www.headingtech.com/center/tz/6/b7a6253bf4994082a4e45fa6926b8820/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2609, 2609, 'http://www.headingtech.com/center/tz/6/b49e9c01a4214a068c4784a8bef9ad8d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2610, 2610, 'http://www.headingtech.com/center/tz/6/4edc3d0b2f1049289ff01a92df181695/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2611, 2611, 'http://www.headingtech.com/center/tz/6/2ba7e99c5c9c41f7878505f342066a91/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2612, 2612, 'http://www.headingtech.com/center/tz/6/2dbf3eb8f0c04590b0cb7097c59b24d5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2613, 2613, 'http://www.headingtech.com/center/tz/6/02b5c64454f84793a2d713f325c9e65a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2614, 2614, 'http://www.headingtech.com/center/tz/6/6b269a28f3024b7f9ef829c264921d03/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2615, 2615, 'http://www.headingtech.com/center/tz/6/3371814afa334efb9a0c431f193aca8c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2616, 2616, 'http://www.headingtech.com/center/tz/6/6bf87589b25742c7b088aefe0aa660b1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2617, 2617, 'http://www.headingtech.com/center/tz/6/97f4b7bf8a3a46959ed5779e25c4ad9e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2618, 2618, 'http://www.headingtech.com/center/tz/6/844625fa349947f6ab65b41fd1b642bd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2619, 2619, 'http://www.headingtech.com/center/tz/6/35c3370403f44d2399dec0f481ba3515/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2620, 2620, 'http://www.headingtech.com/center/tz/6/26cb4f4a094b4db7b3137ce63d270230/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2621, 2621, 'http://www.headingtech.com/center/tz/6/f5fa48e05a634f17b8e5600fd439b15e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2622, 2622, 'http://www.headingtech.com/center/tz/6/1e2f2974be3d4c16b7bc33576dc47cbe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2623, 2623, 'http://www.headingtech.com/center/tz/6/0a8550da44ad49769ca854203614202e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2624, 2624, 'http://www.headingtech.com/center/tz/6/23672cf8da1a4028b0c820ebb1004b21/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2625, 2625, 'http://www.headingtech.com/center/tz/6/7e16c261376a4ca6a2bf56700fab4b3d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2626, 2626, 'http://www.headingtech.com/center/tz/6/d7086f74ab4c4e4494e8a2b080ee342a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2627, 2627, 'http://www.headingtech.com/center/tz/6/4fe2080d4c524672b3286bb0f83aadb0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2628, 2628, 'http://www.headingtech.com/center/tz/6/7940be1d45304541b36c71eb2f35726c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2629, 2629, 'http://www.headingtech.com/center/tz/6/1d56f5559ef6473b808c8ab2f0399d77/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2630, 2630, 'http://www.headingtech.com/center/tz/6/a68132292044437ba0ce2c1f058f592e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2631, 2631, 'http://www.headingtech.com/center/tz/6/dae0cfdc38434bd986d44ce01dc807be/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2632, 2632, 'http://www.headingtech.com/center/tz/6/cf92175f50194dd6a5b5bb283d849960/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2633, 2633, 'http://www.headingtech.com/center/tz/6/dcd8726a0cca4ccab009d3e38c332dfc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2634, 2634, 'http://www.headingtech.com/center/tz/6/0c02084623da4e6c81f0061f1cf1f43a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2635, 2635, 'http://www.headingtech.com/center/tz/6/5cb8227848c749c4b0ffd1e9e98cdb93/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2636, 2636, 'http://www.headingtech.com/center/tz/6/91b7fddbfd45410797ff8f5b2398dacd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2637, 2637, 'http://www.headingtech.com/center/tz/6/91b9a5c435e84c9e962bc82cd48cf497/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2638, 2638, 'http://www.headingtech.com/center/tz/6/05c69af345ff4e87881442a00afbe8c8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2639, 2639, 'http://www.headingtech.com/center/tz/6/ddfe382525564d81a29fbe77619a6787/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2640, 2640, 'http://www.headingtech.com/center/tz/6/bc60d2bbb0b74d51aaa7f0cd123ec060/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2641, 2641, 'http://www.headingtech.com/center/tz/6/3b90de5780604054b01db89b15effec0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2642, 2642, 'http://www.headingtech.com/center/tz/6/c9519dca2c62436a803d40dc2629329e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2643, 2643, 'http://www.headingtech.com/center/tz/6/85a57da68f6d432a994bda26c1a13c7a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2644, 2644, 'http://www.headingtech.com/center/tz/6/6d38bfcc49764ee29e2ae35f78710a7e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2645, 2645, 'http://www.headingtech.com/center/tz/6/5251bb50b9cf4902912ae2d8f08c57bd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2646, 2646, 'http://www.headingtech.com/center/tz/6/e867e559f4fb444a8d4b427733197926/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2647, 2647, 'http://www.headingtech.com/center/tz/6/19ca128895754b61a89614ebb39b296d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2648, 2648, 'http://www.headingtech.com/center/tz/6/78fce1638df44f71bdf0c2cb24275300/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2649, 2649, 'http://www.headingtech.com/center/tz/6/484892db425d42f081d8b42c2156b1f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2650, 2650, 'http://www.headingtech.com/center/tz/6/2cb4facce5384f40b155f51b1c691a33/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2651, 2651, 'http://www.headingtech.com/center/tz/6/57099915ef2541b0a9c7c24bff05d81a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2652, 2652, 'http://www.headingtech.com/center/tz/6/69c18e94bae64d8d974c0734a32e633a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2653, 2653, 'http://www.headingtech.com/center/tz/6/c97ebad824774d03a3c55248b5d01780/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2654, 2654, 'http://www.headingtech.com/center/tz/6/f1990ce52407492391f85165cbfd5ae9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2655, 2655, 'http://www.headingtech.com/center/tz/6/5576769693634b2691995d040e23e829/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2656, 2656, 'http://www.headingtech.com/center/tz/6/bc5092eb88c243758db6f0b500c4c87a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2657, 2657, 'http://www.headingtech.com/center/tz/6/5d66cbd04aa248e9a8969d867054fe08/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2658, 2658, 'http://www.headingtech.com/center/tz/6/87900db03dd141078074ab6195908a48/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2659, 2659, 'http://www.headingtech.com/center/tz/6/ed3a2ef6f7804f89897664ecb69fa1ba/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2660, 2660, 'http://www.headingtech.com/center/tz/6/7f9cfe93c0d54f85b175aa52e3137ddd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2661, 2661, 'http://www.headingtech.com/center/tz/6/87faf2f610f0488dbb1c602553e6612b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2662, 2662, 'http://www.headingtech.com/center/tz/6/5149f66e78424c25bbe9bf0b6d8892e4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2663, 2663, 'http://www.headingtech.com/center/tz/6/65edc2b8de87444aa449c738f56bd442/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2664, 2664, 'http://www.headingtech.com/center/tz/6/468f47608c7e402186dc72b3251c8f1d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2665, 2665, 'http://www.headingtech.com/center/tz/6/c80ca8b77bd0407fa6c1de2f480fa245/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2666, 2666, 'http://www.headingtech.com/center/tz/6/a3872f0fd55843809265a2faf2849f87/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2667, 2667, 'http://www.headingtech.com/center/tz/6/2abfea6683c64fbb8a1e842b9e3559dc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2668, 2668, 'http://www.headingtech.com/center/tz/6/45239e02e9244bdbb1a4c14629ff1de4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2669, 2669, 'http://www.headingtech.com/center/tz/6/bd307d10a6ed449c809d2555e1099ca2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2670, 2670, 'http://www.headingtech.com/center/tz/6/9c06bb56e1c8450fbba114eaaafc1d40/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2671, 2671, 'http://www.headingtech.com/center/tz/6/782863632bb14043a9f3cf110ff0d591/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2672, 2672, 'http://www.headingtech.com/center/tz/6/b47a696db5d2443e99b28a9966fdce12/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2673, 2673, 'http://www.headingtech.com/center/tz/6/ea529e45d8554b10afa99103cfce2a81/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2674, 2674, 'http://www.headingtech.com/center/tz/6/429e4040df15471497296482811414b7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2675, 2675, 'http://www.headingtech.com/center/tz/6/eaaa124aa0f1422bbc6e42cbb5198da2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2676, 2676, 'http://www.headingtech.com/center/tz/6/718ce443d6124a268d2cf17d3095d801/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2677, 2677, 'http://www.headingtech.com/center/tz/6/ad57ade9b7c043a3b11fa0c866f06b72/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2678, 2678, 'http://www.headingtech.com/center/tz/6/93414a0bd32b4e6b87e324d2389699db/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2679, 2679, 'http://www.headingtech.com/center/tz/6/15e689520aa44d899aac0bb49b68517c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2680, 2680, 'http://www.headingtech.com/center/tz/6/193ebf05a261462cb707f5c713b44b72/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2681, 2681, 'http://www.headingtech.com/center/tz/6/4e1b190680c2422aa4de959b5d4a8621/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2682, 2682, 'http://www.headingtech.com/center/tz/6/3c928d5cb8c84b16b4819466380de12b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2683, 2683, 'http://www.headingtech.com/center/tz/6/168638a03270449fa3f3984e7fb382b2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2684, 2684, 'http://www.headingtech.com/center/tz/6/15c3c83057fd4a68b0d93410fc49182a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2685, 2685, 'http://www.headingtech.com/center/tz/6/dd76d0d6d97043eaaf44a5a4a8dcfb6e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2686, 2686, 'http://www.headingtech.com/center/tz/6/4780771be42a485b8defabe767d3b8c0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2687, 2687, 'http://www.headingtech.com/center/tz/6/20f0752df97d4f53ba60c5e9ef3e23b6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2688, 2688, 'http://www.headingtech.com/center/tz/6/e3650914834c4b80a4234488960de782/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2689, 2689, 'http://www.headingtech.com/center/tz/6/ba7021d419964fd8a1906b98aebbe0e8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2690, 2690, 'http://www.headingtech.com/center/tz/6/2c9ded592d2146d3bbfd6f7c7d8f04f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2691, 2691, 'http://www.headingtech.com/center/tz/6/f3a350d3c9a24d58889e4bf020d5999b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2692, 2692, 'http://www.headingtech.com/center/tz/6/7558d769fe9f4e8cb27712eba1a5de5a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2693, 2693, 'http://www.headingtech.com/center/tz/6/a04deec8015c4ae9907e20edf02cba2c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2694, 2694, 'http://www.headingtech.com/center/tz/6/d412c98a18ff40d0a49d5ade772dc6d7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2695, 2695, 'http://www.headingtech.com/center/tz/6/ebb47b8c31584a41a19d115c90a4525e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2696, 2696, 'http://www.headingtech.com/center/tz/6/ac9b4f416b6747b1b2345a263ca51285/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2697, 2697, 'http://www.headingtech.com/center/tz/6/dd8653bcd5a14542a425395016160503/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2698, 2698, 'http://www.headingtech.com/center/tz/6/2b7c2b77f58e46b497aa9333d8d03579/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2699, 2699, 'http://www.headingtech.com/center/tz/6/f707858a49cc46cbae5f2ab1f6da8742/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2700, 2700, 'http://www.headingtech.com/center/tz/6/732f8efbf56842c580de7d06196f2b8f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2701, 2701, 'http://www.headingtech.com/center/tz/6/ceb5759093b44d0eb3f4a1bb7f9ebc21/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2702, 2702, 'http://www.headingtech.com/center/tz/6/765cae3d63074781af4b95ba7f7afe5f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2703, 2703, 'http://www.headingtech.com/center/tz/6/8d6c128953b3414b9206038d80ae365c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2704, 2704, 'http://www.headingtech.com/center/tz/6/a95d50d455a7487ba37df6dab7b9545d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2705, 2705, 'http://www.headingtech.com/center/tz/6/c9ee057b7c234dbb8d8e08662237ee82/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2706, 2706, 'http://www.headingtech.com/center/tz/6/dd2fb3892c9f41fb84162a6810c1695c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2707, 2707, 'http://www.headingtech.com/center/tz/6/a22129b0d9274f8899446581be46fa33/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2708, 2708, 'http://www.headingtech.com/center/tz/6/37c30c6556da4f4d9c001c849dd3a80d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2709, 2709, 'http://www.headingtech.com/center/tz/6/07a8fad6790f48b983cab59eb744aad0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2710, 2710, 'http://www.headingtech.com/center/tz/6/7546bd10dc8d4815922ac320e79a0505/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2711, 2711, 'http://www.headingtech.com/center/tz/6/edabdfae1b4e4516bea21e9dd5012480/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2712, 2712, 'http://www.headingtech.com/center/tz/6/96b2c87ea0ca460790999d38392d9faf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2713, 2713, 'http://www.headingtech.com/center/tz/6/5a97e261c59a41449e7eea7853e050cf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2714, 2714, 'http://www.headingtech.com/center/tz/6/f0649e25277544608a61458fe67c96d0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2715, 2715, 'http://www.headingtech.com/center/tz/6/733abc86ae5442df87af42e2ca360070/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2716, 2716, 'http://www.headingtech.com/center/tz/6/3eca4f29533942aba6e3dd9a466e85e7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2717, 2717, 'http://www.headingtech.com/center/tz/6/59fd12f9f22e48bbbf7b19124218be27/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2718, 2718, 'http://www.headingtech.com/center/tz/6/0c65f87ff2b744228e1cd042d4cb1135/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2719, 2719, 'http://www.headingtech.com/center/tz/6/328acf9c1af541348f7f659ba566e659/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2720, 2720, 'http://www.headingtech.com/center/tz/6/ee3812ce97814d9d9a52f6f14b009e44/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2721, 2721, 'http://www.headingtech.com/center/tz/6/42b8bb12c9aa46288be445b0aa4dad2a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2722, 2722, 'http://www.headingtech.com/center/tz/6/d3d52f006f1343869622af96a3c9f0af/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2723, 2723, 'http://www.headingtech.com/center/tz/6/be7b123f6baf40e99722eb0f7548ad43/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2724, 2724, 'http://www.headingtech.com/center/tz/6/8b195c28eeb847c5811e15532bf73d2e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2725, 2725, 'http://www.headingtech.com/center/tz/6/bc837a15ac684a239c11551b21813788/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2726, 2726, 'http://www.headingtech.com/center/tz/6/f2671a2bc13c4301bf9249713e9bc341/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2727, 2727, 'http://www.headingtech.com/center/tz/6/86c9c9a8d49343c4a29856c9bf424a4f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2728, 2728, 'http://www.headingtech.com/center/tz/6/e07d9fdd2f0047519ce65c4c1f2d1d66/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2729, 2729, 'http://www.headingtech.com/center/tz/6/aeeae63064f2426f8c15c2db2d938f3e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2730, 2730, 'http://www.headingtech.com/center/tz/6/069adb1953d04930a7260ea9fc1d9be7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2731, 2731, 'http://www.headingtech.com/center/tz/6/8b114ab808454fb28eec4f96699ec874/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2732, 2732, 'http://www.headingtech.com/center/tz/6/4da0fd8453304f588d257b40dbbca9f1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2733, 2733, 'http://www.headingtech.com/center/tz/6/b4ab35224b174d5fa7733be3a38a671a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2734, 2734, 'http://www.headingtech.com/center/tz/6/c8e03e0e324a4885b4221f360e29f2a1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2735, 2735, 'http://www.headingtech.com/center/tz/6/f1a82f482ceb40779bfcd66dc604c790/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2736, 2736, 'http://www.headingtech.com/center/tz/6/620d2f5e82744cfb9f8f3c6009aa2577/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2737, 2737, 'http://www.headingtech.com/center/tz/6/6f739ec15a0e4bbe9e55d665f7f59e1a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2738, 2738, 'http://www.headingtech.com/center/tz/6/69a4d1b9bcbe4d729e64d9dd6ccbe7fa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2739, 2739, 'http://www.headingtech.com/center/tz/6/8051df1717c7422c98f40db099ef9429/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2740, 2740, 'http://www.headingtech.com/center/tz/6/038b2cadafb94b0caf630887b067c927/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2741, 2741, 'http://www.headingtech.com/center/tz/6/732839f4b8d54ec596ae14328958beb6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2742, 2742, 'http://www.headingtech.com/center/tz/6/7891ad1aaed9460990fe516c15f4618f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2743, 2743, 'http://www.headingtech.com/center/tz/6/10570fa7c011468e84f147bebb0541df/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2744, 2744, 'http://www.headingtech.com/center/tz/6/d361892f30f14a54be0cbb32a7c79812/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2745, 2745, 'http://www.headingtech.com/center/tz/6/aa1a630cce30459cb5409db6a8c64748/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2746, 2746, 'http://www.headingtech.com/center/tz/6/8d714352a24b4e50b72a83878dc75c83/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2747, 2747, 'http://www.headingtech.com/center/tz/6/66db785073254929bce886b1af6bdc14/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2748, 2748, 'http://www.headingtech.com/center/tz/6/f0ab37d6670242658666feed6f503e32/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2749, 2749, 'http://www.headingtech.com/center/tz/6/f94e7e33fe324e90884014773cd0f9a1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2750, 2750, 'http://www.headingtech.com/center/tz/6/67c73a78743f45d2a6f6ccaf1cf7ecf0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2751, 2751, 'http://www.headingtech.com/center/tz/6/0da20f47376842af9e090b78c8dc3fcb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2752, 2752, 'http://www.headingtech.com/center/tz/6/616d400121e94ec08ea58dbda1e635b6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2753, 2753, 'http://www.headingtech.com/center/tz/6/b2c1d13457f74bb1a5088e346fed7f68/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2754, 2754, 'http://www.headingtech.com/center/tz/6/67023d6e95d248a9b03414374bc2f2d5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2755, 2755, 'http://www.headingtech.com/center/tz/6/375c277ace5d475680051ae2dda2a122/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2756, 2756, 'http://www.headingtech.com/center/tz/6/2910651ab2de43ce879b7fed54845ff9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2757, 2757, 'http://www.headingtech.com/center/tz/6/bbe3a2eccfb94ef58d1f766796c470fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2758, 2758, 'http://www.headingtech.com/center/tz/6/deb87725db924fe280bc6cf61366b860/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2759, 2759, 'http://www.headingtech.com/center/tz/6/448224229594400f98a0b226a0de2543/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2760, 2760, 'http://www.headingtech.com/center/tz/6/74206e7f10594dcf8d22e113d552e6f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2761, 2761, 'http://www.headingtech.com/center/tz/6/7efeca85d2eb49909517c667bd33b183/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2762, 2762, 'http://www.headingtech.com/center/tz/6/f0aed88137b44bc9869fc7da72596362/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2763, 2763, 'http://www.headingtech.com/center/tz/6/180832eb50a04d1ea628914f55ad2261/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2764, 2764, 'http://www.headingtech.com/center/tz/6/39b2b946dd304cf69e67898031f4e2d1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2765, 2765, 'http://www.headingtech.com/center/tz/6/56ec319fce124c51a967e4ae5bffc83d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2766, 2766, 'http://www.headingtech.com/center/tz/6/8a8da457c8504fd383d1aacff284a4a9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2767, 2767, 'http://www.headingtech.com/center/tz/6/c8ee5fa38a2d49e385ecb02fb2578d86/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2768, 2768, 'http://www.headingtech.com/center/tz/6/9b568e4078b3458fbdb12df665202128/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2769, 2769, 'http://www.headingtech.com/center/tz/6/7a142506be094465ad5989ae2a9dfd1c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2770, 2770, 'http://www.headingtech.com/center/tz/6/e663edd3a75e4dc6a6ad2cb4d3a0ee8c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2771, 2771, 'http://www.headingtech.com/center/tz/6/c361b5be2e624680a64f1beeab62fc36/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2772, 2772, 'http://www.headingtech.com/center/tz/6/18ce892eb0d94528bb1fe5be895d47e7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2773, 2773, 'http://www.headingtech.com/center/tz/6/86de91ad68b946a9ac72a39ca7d39899/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2774, 2774, 'http://www.headingtech.com/center/tz/6/e1d1792383a240d7a06d4d7553793b2e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2775, 2775, 'http://www.headingtech.com/center/tz/6/7770950eb0e245c29ed11191f49aac73/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2776, 2776, 'http://www.headingtech.com/center/tz/6/5b4c62d1d9974aca85674d28083ff7f2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2777, 2777, 'http://www.headingtech.com/center/tz/6/1e6097d491d24eb486b6973f3dd278ef/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2778, 2778, 'http://www.headingtech.com/center/tz/6/901b56155e0a4410902d2d6aedccab47/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2779, 2779, 'http://www.headingtech.com/center/tz/6/2b6d28e44b024f7d933993b8007d6abd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2780, 2780, 'http://www.headingtech.com/center/tz/6/7badedb4199a40beb0539684583b39d0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2781, 2781, 'http://www.headingtech.com/center/tz/6/fa281b3eea224b4b9469feb73f2fe416/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2782, 2782, 'http://www.headingtech.com/center/tz/6/0b2c96ad9bc941598084badace1753f2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2783, 2783, 'http://www.headingtech.com/center/tz/6/dfe2b16439da4701be3c56367e1b1c01/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2784, 2784, 'http://www.headingtech.com/center/tz/6/ffc27c3e3812446d9f43e87ad7113504/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2785, 2785, 'http://www.headingtech.com/center/tz/6/5a022c7919f64db9a97705f333f935a6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2786, 2786, 'http://www.headingtech.com/center/tz/6/88616bed3075457cbdf70ac6d2033dcf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2787, 2787, 'http://www.headingtech.com/center/tz/6/6155141a8b504bada3c9b9bbde7c6c88/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2788, 2788, 'http://www.headingtech.com/center/tz/6/3473e2e8821b47d19375598dcd07439a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2789, 2789, 'http://www.headingtech.com/center/tz/6/d38c94ee0b16484a86e01d65b5f3cd91/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2790, 2790, 'http://www.headingtech.com/center/tz/6/75ae42e13e3e48e8b6cbcaf259c664df/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2791, 2791, 'http://www.headingtech.com/center/tz/6/d3271acfc0024d0dbce50543d3e3ac33/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2792, 2792, 'http://www.headingtech.com/center/tz/6/a037fc6203254d9ca86b6689f0b6c4b2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2793, 2793, 'http://www.headingtech.com/center/tz/6/8edd8885e155430f8747d8b56bd54542/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2794, 2794, 'http://www.headingtech.com/center/tz/6/49b15d5766b348ef9f21a5b567e1f282/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2795, 2795, 'http://www.headingtech.com/center/tz/6/a58d9c98104d46dd99ec636f754af15f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2796, 2796, 'http://www.headingtech.com/center/tz/6/462007fe6de540398d03eb456ca60ed1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2797, 2797, 'http://www.headingtech.com/center/tz/6/8a35e37dcffc40839cc996068157938f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2798, 2798, 'http://www.headingtech.com/center/tz/6/1102080bb1f344948c5fc8261ddd907d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2799, 2799, 'http://www.headingtech.com/center/tz/6/b9cb3a9b6a314660acc3fa15335128fd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2800, 2800, 'http://www.headingtech.com/center/tz/6/b782978284b842b68554ad5350c02254/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2801, 2801, 'http://www.headingtech.com/center/tz/6/5d65209e9dc34accbdae89370018d2fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2802, 2802, 'http://www.headingtech.com/center/tz/6/3853cae7ea2843ba8e36b8ef0c3eb760/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2803, 2803, 'http://www.headingtech.com/center/tz/6/318d34f99e9744d0b1e2cfded90aa3d3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2804, 2804, 'http://www.headingtech.com/center/tz/6/660b28207f30408ca4e9a453e9507f0e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2805, 2805, 'http://www.headingtech.com/center/tz/6/dc80d88e4d2546e6aeb84018f6edeb49/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2806, 2806, 'http://www.headingtech.com/center/tz/6/0c57fbfba9714821b58f9473ea32913b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2807, 2807, 'http://www.headingtech.com/center/tz/6/160dc1db00e845a4822d334786d03565/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2808, 2808, 'http://www.headingtech.com/center/tz/6/0f808e40f47e4c80a29cfb004e31bbd8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2809, 2809, 'http://www.headingtech.com/center/tz/6/8e2c74d9f1954bfd84ce631b48bc047e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2810, 2810, 'http://www.headingtech.com/center/tz/6/13bf8931859645829ff9f7178965e897/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2811, 2811, 'http://www.headingtech.com/center/tz/6/b83efcdaa7b04e20880f0ebcc1ca1693/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2812, 2812, 'http://www.headingtech.com/center/tz/6/47667adef3a844a98b4675b23d1ed243/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2813, 2813, 'http://www.headingtech.com/center/tz/6/6542ab3d26ae48359e2901df30ee4445/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2814, 2814, 'http://www.headingtech.com/center/tz/6/b3040e32eaf843dca12fd145d084eca5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2815, 2815, 'http://www.headingtech.com/center/tz/6/a3acf29703ab482e800955869e989a08/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2816, 2816, 'http://www.headingtech.com/center/tz/6/b8889d4565fa4d2f8508917d7300d577/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2817, 2817, 'http://www.headingtech.com/center/tz/6/5013f20a925649c1abf75137318c609b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2818, 2818, 'http://www.headingtech.com/center/tz/6/bbaeb6482aee477d8f35b6bd61171324/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2819, 2819, 'http://www.headingtech.com/center/tz/6/2135ea30c8cf4f6eb3cfeee713e4046e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2820, 2820, 'http://www.headingtech.com/center/tz/6/7ff84e3046014541bce39bdc8cba7202/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2821, 2821, 'http://www.headingtech.com/center/tz/6/a685da312f6e4fe3b5c57a642fdb264e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2822, 2822, 'http://www.headingtech.com/center/tz/6/1f7ad4a8ca204cf090526a5206c532a8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2823, 2823, 'http://www.headingtech.com/center/tz/6/d84665c7a01b41f3abf1938dd5a31efd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2824, 2824, 'http://www.headingtech.com/center/tz/6/8a810834eb3b43acb540c3bd02cf1f35/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2825, 2825, 'http://www.headingtech.com/center/tz/6/cdfa776a46fe439d90e1a3039496a297/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2826, 2826, 'http://www.headingtech.com/center/tz/6/db843c2d88af45e59e7808dc0a45b469/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2827, 2827, 'http://www.headingtech.com/center/tz/6/2ba15976126d4e6d840a70efb665d35b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2828, 2828, 'http://www.headingtech.com/center/tz/6/0e7790eb34f544ec9cae18b2c39324f7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2829, 2829, 'http://www.headingtech.com/center/tz/6/4a7a9e3546cf407a9a79af1e62e23c75/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2830, 2830, 'http://www.headingtech.com/center/tz/6/d84d4e54a5574914931bf0b4859ed922/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2831, 2831, 'http://www.headingtech.com/center/tz/6/9f2ba6b9fa754de185016ea02c79b819/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2832, 2832, 'http://www.headingtech.com/center/tz/6/f3ac4ad703bb46a09e59996f198e6b1d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2833, 2833, 'http://www.headingtech.com/center/tz/6/4cbd2cb9502b415a9b33ee7c0432332b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2834, 2834, 'http://www.headingtech.com/center/tz/6/656919230e10448f9f5be677251a72ed/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2835, 2835, 'http://www.headingtech.com/center/tz/6/0272e5196e0a4c498f58f13b2c22cfc8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2836, 2836, 'http://www.headingtech.com/center/tz/6/e78f10e75b4e49278164f654a4bf7ae9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2837, 2837, 'http://www.headingtech.com/center/tz/6/3b14e8e451ec45db9435b2f784895047/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2838, 2838, 'http://www.headingtech.com/center/tz/6/d8261730caf34f5ea55773a3c456faa8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2839, 2839, 'http://www.headingtech.com/center/tz/6/9f3ad872eea14e1e962b786dfcfdc3b1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2840, 2840, 'http://www.headingtech.com/center/tz/6/9e943f86e0bb449baa0482b209f7c5f6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2841, 2841, 'http://www.headingtech.com/center/tz/6/69b56c41aed0441aa06406634d366a46/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2842, 2842, 'http://www.headingtech.com/center/tz/6/15cdf393860a4e1aa8fc1c631529765f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2843, 2843, 'http://www.headingtech.com/center/tz/6/aff80df3c16544ed97eb65a59aac2892/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2844, 2844, 'http://www.headingtech.com/center/tz/6/e2ca2b583d554969a39a1a4e4f707c7f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2845, 2845, 'http://www.headingtech.com/center/tz/6/6d19caa18fce45e38cf5b7c49384df5b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2846, 2846, 'http://www.headingtech.com/center/tz/6/73b92042784849168f89194f51188309/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2847, 2847, 'http://www.headingtech.com/center/tz/6/61c4c7bc4e6545d4b3e2305326d4722a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2848, 2848, 'http://www.headingtech.com/center/tz/6/799d622a96894e1aa464fbcc98e2e02a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2849, 2849, 'http://www.headingtech.com/center/tz/6/33d21ef1c4374aa292fcf04525d7d649/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2850, 2850, 'http://www.headingtech.com/center/tz/6/802acde773ca45b8aede77621d5bdb5f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2851, 2851, 'http://www.headingtech.com/center/tz/6/edc20c0ac32a40c19007b31a33bc6a8e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2852, 2852, 'http://www.headingtech.com/center/tz/6/255f9afc6832469a954905738fba8bfe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2853, 2853, 'http://www.headingtech.com/center/tz/6/afdbb57abea44cf6b763e0f862079f3d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2854, 2854, 'http://www.headingtech.com/center/tz/6/df5f32f05f5a42d3b8d765eb5af645fc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2855, 2855, 'http://www.headingtech.com/center/tz/6/761a2f71a12548828033cd4f3adbd52c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2856, 2856, 'http://www.headingtech.com/center/tz/6/ca22ce3a668b41d2986f15072defe794/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2857, 2857, 'http://www.headingtech.com/center/tz/6/4aa0d3fac20547ca90916b3e08568e3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2858, 2858, 'http://www.headingtech.com/center/tz/6/3a96e322fca94f3a9f555f1397830c08/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2859, 2859, 'http://www.headingtech.com/center/tz/6/7a6c315abed040b3af75d367d37b7a9d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2860, 2860, 'http://www.headingtech.com/center/tz/6/3db7c442f8e0468f99c7bfe0fbc8e6b1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2861, 2861, 'http://www.headingtech.com/center/tz/6/c8f7bf83c6a541529a57166643790b5d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2862, 2862, 'http://www.headingtech.com/center/tz/6/e490da845cba42c0baffd492dc938298/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2863, 2863, 'http://www.headingtech.com/center/tz/6/cb5cb8add96f47b9a31c2f8e3ba63c6f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2864, 2864, 'http://www.headingtech.com/center/tz/6/baf2e24e9f104327963446632bd7e933/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2865, 2865, 'http://www.headingtech.com/center/tz/6/3b2bfbd7793844d3ab16ec7844c1b6d2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2866, 2866, 'http://www.headingtech.com/center/tz/6/354d9bd3813b48dcb09b5f8d3cda6241/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2867, 2867, 'http://www.headingtech.com/center/tz/6/2b1f3cd4cd714decb5d1deef0d20b525/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2868, 2868, 'http://www.headingtech.com/center/tz/6/4465b6dedc4e4973b425140867ad3723/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2869, 2869, 'http://www.headingtech.com/center/tz/6/9a7e0da87bd842f19851c63f514fc43c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2870, 2870, 'http://www.headingtech.com/center/tz/6/0a9afd31faea4d329b5fc354823da0f2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2871, 2871, 'http://www.headingtech.com/center/tz/6/79f37036a487465285cc8e0d82bf2ee8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2872, 2872, 'http://www.headingtech.com/center/tz/6/b24d57f99aba42acbc7ba08a1a94fa83/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2873, 2873, 'http://www.headingtech.com/center/tz/6/4cebc0104dc746c4a985ff9603095b7d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2874, 2874, 'http://www.headingtech.com/center/tz/6/0734abb279394cdaa98d879457c85b2b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2875, 2875, 'http://www.headingtech.com/center/tz/6/afc05c83ac824645b4bbeaa86742d108/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2876, 2876, 'http://www.headingtech.com/center/tz/6/18863ca5a79d41e6affd2344a7c6a2c5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2877, 2877, 'http://www.headingtech.com/center/tz/6/21144e1d0227441ca7c6a0920e9d6146/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2878, 2878, 'http://www.headingtech.com/center/tz/6/e0d2373d9dcf4080a6192e43b0a1d8dd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2879, 2879, 'http://www.headingtech.com/center/tz/6/952c695c76c74305bb6d60ac30f5109a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2880, 2880, 'http://www.headingtech.com/center/tz/6/f106e61e60fd49a3b51d7966fce3bf95/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2881, 2881, 'http://www.headingtech.com/center/tz/6/0ee1328642ac4250bd3d251266b7fd99/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2882, 2882, 'http://www.headingtech.com/center/tz/6/a1bd0c2faf774d62a56a34609fc097c5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2883, 2883, 'http://www.headingtech.com/center/tz/6/a2a48a781bed475f9a74c0f53d88cbf0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2884, 2884, 'http://www.headingtech.com/center/tz/6/9420f05ec2794e588b8473d5c23ec250/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2885, 2885, 'http://www.headingtech.com/center/tz/6/174c411eadd84db8810295f6d4a94435/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2886, 2886, 'http://www.headingtech.com/center/tz/6/2feba552694d4ef593f8fa6ddcbe52a1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2887, 2887, 'http://www.headingtech.com/center/tz/6/f290b7e4661148a181ada851b8a6001e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2888, 2888, 'http://www.headingtech.com/center/tz/6/1c9d3270cb0c444b951d7f4d4996873c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2889, 2889, 'http://www.headingtech.com/center/tz/6/c952a017d5fa47e9acbf849b74c6e9c6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2890, 2890, 'http://www.headingtech.com/center/tz/6/8f99eee63ed848918d8e82f437c3f64c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2891, 2891, 'http://www.headingtech.com/center/tz/6/5e16e7b5468c4ebaa72aba1d9ea8c014/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2892, 2892, 'http://www.headingtech.com/center/tz/6/5cc9026bf2334e6caad9b2fd8deede71/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2893, 2893, 'http://www.headingtech.com/center/tz/6/4f59300b4361482d9ce76ed95f72cbbc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2894, 2894, 'http://www.headingtech.com/center/tz/6/b3704953760f402cbf9274697fc55219/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2895, 2895, 'http://www.headingtech.com/center/tz/6/34d2bce67aa14e7dbf9303c83fec66b8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2896, 2896, 'http://www.headingtech.com/center/tz/6/f1c9929a23dd43b696027700ebc32a45/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2897, 2897, 'http://www.headingtech.com/center/tz/6/0a08f46529af48f7b2d2e00e66b5e8b2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2898, 2898, 'http://www.headingtech.com/center/tz/6/fa6f91f293dc45738a97dd0b009b5dcf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2899, 2899, 'http://www.headingtech.com/center/tz/6/2e5066753a39451e8d2d040bb59ec85d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2900, 2900, 'http://www.headingtech.com/center/tz/6/871f805a088244c1a8efda3c391a62e8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2901, 2901, 'http://www.headingtech.com/center/tz/6/2be07c2c67754f73b3ea2f6c46c4ecac/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2902, 2902, 'http://www.headingtech.com/center/tz/6/7fc8e1981cb34cb9a58b14b05e0bc6d8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2903, 2903, 'http://www.headingtech.com/center/tz/6/7f9876bd7f4144cfb7f38e82c807ca25/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2904, 2904, 'http://www.headingtech.com/center/tz/6/81bd3de6f60b44e493aeb3fa07f1c543/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2905, 2905, 'http://www.headingtech.com/center/tz/6/e0999fceb5a643cd8ef937609c63512c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2906, 2906, 'http://www.headingtech.com/center/tz/6/7ed5482f70a34064a82364eacde81017/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2907, 2907, 'http://www.headingtech.com/center/tz/6/34e1595a67dc4c4db59dcf225fba5f9d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2908, 2908, 'http://www.headingtech.com/center/tz/6/c3b0fb53cb2f43c4bd0ead682310db3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2909, 2909, 'http://www.headingtech.com/center/tz/6/31709b39aea94706bbbbf3cd412b23f8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2910, 2910, 'http://www.headingtech.com/center/tz/6/37155d4d6ffc4b66b32cb346609cf6aa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2911, 2911, 'http://www.headingtech.com/center/tz/6/c106d0cbfe8445cbb4db4b61cae2c6fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2912, 2912, 'http://www.headingtech.com/center/tz/6/e8ed54b0c89b445dad06f39084976b7b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2913, 2913, 'http://www.headingtech.com/center/tz/6/390adcef4d0546e08ed508c7367d180f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2914, 2914, 'http://www.headingtech.com/center/tz/6/f4bac92860184bf4829ae0a88fb561fc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2915, 2915, 'http://www.headingtech.com/center/tz/6/15a2f73b68e7447197a82cc38c66c2a2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2916, 2916, 'http://www.headingtech.com/center/tz/6/6a224c22ddf64dfebef46b75806ebfbb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2917, 2917, 'http://www.headingtech.com/center/tz/6/60ca5f7a67ed47b1af865a0dbaac7f7b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2918, 2918, 'http://www.headingtech.com/center/tz/6/d3ae80c859384fbaa71d33b7252721bf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2919, 2919, 'http://www.headingtech.com/center/tz/6/c70529dc406b46fea43747879269d558/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2920, 2920, 'http://www.headingtech.com/center/tz/6/d96ea0fd0d97443d9dae9b178334104a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2921, 2921, 'http://www.headingtech.com/center/tz/6/e0c5348d72654985b30a59382a851a10/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2922, 2922, 'http://www.headingtech.com/center/tz/6/6023eba27444439da33bbc1e8952e59a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2923, 2923, 'http://www.headingtech.com/center/tz/6/44ca1d66fead448aa67e8fcfc35eaca4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2924, 2924, 'http://www.headingtech.com/center/tz/6/01370d03e0294881ade03c8b51319f39/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2925, 2925, 'http://www.headingtech.com/center/tz/6/4767ffe97c7e414f961ae434db341ad6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2926, 2926, 'http://www.headingtech.com/center/tz/6/fdb2de6360f541c883ff2d3b080a180d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2927, 2927, 'http://www.headingtech.com/center/tz/6/85811fe8a540403f96ed198c285de922/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2928, 2928, 'http://www.headingtech.com/center/tz/6/e7f88598123e46fca076b3d388fb7b52/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2929, 2929, 'http://www.headingtech.com/center/tz/6/e0b74dc117b745dcabb0e3aee23031a3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2930, 2930, 'http://www.headingtech.com/center/tz/6/ba2d3bc26f2343db93a91f9ab055c672/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2931, 2931, 'http://www.headingtech.com/center/tz/6/3a448fee5cac4d348e43edf75cf9e45e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2932, 2932, 'http://www.headingtech.com/center/tz/6/db88ab2dc3d8486885f9b8224bb41115/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2933, 2933, 'http://www.headingtech.com/center/tz/6/1d05a8a017684d9c9a1f1aaeb98345a3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2934, 2934, 'http://www.headingtech.com/center/tz/6/b51de412ce0a4b79af5472dfe577c633/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2935, 2935, 'http://www.headingtech.com/center/tz/6/1997bdcc7bcf4b838b990b423406b1e5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2936, 2936, 'http://www.headingtech.com/center/tz/6/b3008b6a51c247e58987932b1dadfa75/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2937, 2937, 'http://www.headingtech.com/center/tz/6/037f9742f20c4f5c960d9f3136886a77/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2938, 2938, 'http://www.headingtech.com/center/tz/6/d8762ebc047e4976a0e69ce4d7476fe4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2939, 2939, 'http://www.headingtech.com/center/tz/6/f0de2e1d66f740ceb5dfbf38f2c626af/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2940, 2940, 'http://www.headingtech.com/center/tz/6/b15ec4592c1a4fd4b7b5705c7aad85aa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2941, 2941, 'http://www.headingtech.com/center/tz/6/390ff4782a594652ac58c6dee3b2aab5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2942, 2942, 'http://www.headingtech.com/center/tz/6/1ef617081dab43559f3b38429268d5bb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2943, 2943, 'http://www.headingtech.com/center/tz/6/ea677cab66db4bc6b1efe1783907335e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2944, 2944, 'http://www.headingtech.com/center/tz/6/3a12522c503849309b5b83cfac95c0d1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2945, 2945, 'http://www.headingtech.com/center/tz/6/1cc2375958a54f84a09e04e49c8a1bb9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2946, 2946, 'http://www.headingtech.com/center/tz/6/170286c98de34c0087a6a78e92ced9c6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2947, 2947, 'http://www.headingtech.com/center/tz/6/83a6747954404ffaa67c9608953f6e3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2948, 2948, 'http://www.headingtech.com/center/tz/6/0e9a02ff2cd5498697eb18fd13b4b43f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2949, 2949, 'http://www.headingtech.com/center/tz/6/c2cab10d807f45789ca01c3fffa45e49/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2950, 2950, 'http://www.headingtech.com/center/tz/6/b6d13448eeab41db817c664c42c57be3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2951, 2951, 'http://www.headingtech.com/center/tz/6/051f094a480a4c8bb2ba603bfe3bf162/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2952, 2952, 'http://www.headingtech.com/center/tz/6/4d47009ca14a4c0f962c29a84d35d337/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2953, 2953, 'http://www.headingtech.com/center/tz/6/9dc39d2e58cb476fb50f3eba16c24cc2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2954, 2954, 'http://www.headingtech.com/center/tz/6/c373e0102ebe47aca43b00d55d4e29e7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2955, 2955, 'http://www.headingtech.com/center/tz/6/1423ca9f9205460b95239a5502c94a58/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2956, 2956, 'http://www.headingtech.com/center/tz/6/5e4344917d6a49838a8f6f92502e6a9a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2957, 2957, 'http://www.headingtech.com/center/tz/6/c31a5865ab8d47938e539476279bd927/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2958, 2958, 'http://www.headingtech.com/center/tz/6/9f2a391d96024e35aca7eebe7099c634/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2959, 2959, 'http://www.headingtech.com/center/tz/6/75ed78cc52154f71af20ddf7735f2b08/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2960, 2960, 'http://www.headingtech.com/center/tz/6/92d1be70827b491fa35640951286d4ab/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2961, 2961, 'http://www.headingtech.com/center/tz/6/87d783c4fc0f45bcb8ef8497dc360e24/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2962, 2962, 'http://www.headingtech.com/center/tz/6/7425d1bb81ea43f694a5c0acf9af18b1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2963, 2963, 'http://www.headingtech.com/center/tz/6/773e1942f5684e1f8355083c5143b415/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2964, 2964, 'http://www.headingtech.com/center/tz/6/630c8e47528e4787b03b73f84edff800/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2965, 2965, 'http://www.headingtech.com/center/tz/6/08e820e99f8143d49dd9e75e859018ad/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2966, 2966, 'http://www.headingtech.com/center/tz/6/68ad91f0a0fd4725acb2be43f90d32dd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2967, 2967, 'http://www.headingtech.com/center/tz/6/302459e9802e4ea28bdaf16bf396e29f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2968, 2968, 'http://www.headingtech.com/center/tz/6/bde5e68a6a674723ab4a294c70446ced/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2969, 2969, 'http://www.headingtech.com/center/tz/6/dca8be34a9da43fa965edf7246da421d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2970, 2970, 'http://www.headingtech.com/center/tz/6/e3b77737b3954125a9b409a25afd764e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2971, 2971, 'http://www.headingtech.com/center/tz/6/c0645801afac439a8b2099ead74a86e2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2972, 2972, 'http://www.headingtech.com/center/tz/6/f0a5c525b22e4c41b281c26a4478fdcc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2973, 2973, 'http://www.headingtech.com/center/tz/6/3c872dc939e748da9bf97f70c2b76e60/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2974, 2974, 'http://www.headingtech.com/center/tz/6/4bd84c500ff5447d924b88b885b915f0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2975, 2975, 'http://www.headingtech.com/center/tz/6/c9aed58ca4904638a3669013c5df185c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2976, 2976, 'http://www.headingtech.com/center/tz/6/974790bc4b144864b6310f0d51cc749e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2977, 2977, 'http://www.headingtech.com/center/tz/6/44c5a50aa8204cc486de46f9df0918fc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2978, 2978, 'http://www.headingtech.com/center/tz/6/3554f451936d479eb3f605655fafe923/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2979, 2979, 'http://www.headingtech.com/center/tz/6/70f81f5a8dac4642a124d85edba25989/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2980, 2980, 'http://www.headingtech.com/center/tz/6/86f7aa3762d64448a9090919d13c0d15/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2981, 2981, 'http://www.headingtech.com/center/tz/6/976cfbd8b0b54895b56582b12aae33d9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2982, 2982, 'http://www.headingtech.com/center/tz/6/aa0c8a3af7e6459ab0278a83e6f31ad7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2983, 2983, 'http://www.headingtech.com/center/tz/6/e62eb95e3ed04920a7b20d1818eba69c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2984, 2984, 'http://www.headingtech.com/center/tz/6/56e0496e91694b12b60e63cc6113a131/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2985, 2985, 'http://www.headingtech.com/center/tz/6/7e00f8302bc74c149e418eea3ec01d93/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2986, 2986, 'http://www.headingtech.com/center/tz/6/2dd4f78ef76c4658bd03b80914502f01/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2987, 2987, 'http://www.headingtech.com/center/tz/6/415c3ae654d643098ab17b1fe354540f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2988, 2988, 'http://www.headingtech.com/center/tz/6/79d99d48131844988ea85ed9fd015935/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2989, 2989, 'http://www.headingtech.com/center/tz/6/b1fb1fc0945a4ca28bcf1db56c7bdfab/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2990, 2990, 'http://www.headingtech.com/center/tz/6/ca805eab22174353974f3b8484239784/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2991, 2991, 'http://www.headingtech.com/center/tz/6/701b1562c4894571892d63f9aa86db95/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2992, 2992, 'http://www.headingtech.com/center/tz/6/3ca88ca2dcb9485b98bec3d415698cd7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2993, 2993, 'http://www.headingtech.com/center/tz/6/576c8f1bda6a4b69a750ddfa20634b01/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2994, 2994, 'http://www.headingtech.com/center/tz/6/61c4030abe144f64964938240af80213/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2995, 2995, 'http://www.headingtech.com/center/tz/6/db845b40c51e42e59bf1c99c3064c4bd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2996, 2996, 'http://www.headingtech.com/center/tz/6/f398006625794703aa17679dfbeef627/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2997, 2997, 'http://www.headingtech.com/center/tz/6/b00fb5018b6a4062a0e86aab356f5a15/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2998, 2998, 'http://www.headingtech.com/center/tz/6/b0651ba7722e4206976f8c3930d3be63/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (2999, 2999, 'http://www.headingtech.com/center/tz/6/a2c8acc60f2d4b9b8e4f3134365aa23a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3000, 3000, 'http://www.headingtech.com/center/tz/6/da667ac29db84f508f56b1e9ac6e9b79/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3001, 3001, 'http://www.headingtech.com/center/tz/6/a129beb78d6f4e62b8f5d15b5c40aec0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3002, 3002, 'http://www.headingtech.com/center/tz/6/7907ba89449349f4a5160933b1219366/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3003, 3003, 'http://www.headingtech.com/center/tz/6/0c08146bf4984b7aa5f60eebf40a528f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3004, 3004, 'http://www.headingtech.com/center/tz/6/b25578361ea04a718cc524e5d97bdb51/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3005, 3005, 'http://www.headingtech.com/center/tz/6/ce27c423b72349ef9475141eb5e80515/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3006, 3006, 'http://www.headingtech.com/center/tz/6/fc3e590901df4eea915b669ef2e752d8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3007, 3007, 'http://www.headingtech.com/center/tz/6/c940890c6ea84f6582d1198c2aabc736/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3008, 3008, 'http://www.headingtech.com/center/tz/6/f752eabb27994f708b4d4a03f0d478b1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3009, 3009, 'http://www.headingtech.com/center/tz/6/dafb568a534342bb8a5cac2a47698148/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3010, 3010, 'http://www.headingtech.com/center/tz/6/dab8fb1e17af48279acd42948edeeb2d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3011, 3011, 'http://www.headingtech.com/center/tz/6/d7709798813e460e84f9d49ff657c5aa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3012, 3012, 'http://www.headingtech.com/center/tz/6/62f61b9293f241e39755b663fd756c1e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3013, 3013, 'http://www.headingtech.com/center/tz/6/6c23829296084a15940bddb23cd84333/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3014, 3014, 'http://www.headingtech.com/center/tz/6/b8e2cf4dd7854908a785e2802baeb3b2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3015, 3015, 'http://www.headingtech.com/center/tz/6/1cda5b71aa754e6aad425e12f2109c20/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3016, 3016, 'http://www.headingtech.com/center/tz/6/fa6570b0e1c24dbe99606260eba151c2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3017, 3017, 'http://www.headingtech.com/center/tz/6/47976ad7a9144225943106808f76fa19/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3018, 3018, 'http://www.headingtech.com/center/tz/6/d3515a31389549fa90740cf7fa7b5fb9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3019, 3019, 'http://www.headingtech.com/center/tz/6/e3b4822d148d403382b1e01904ccbd20/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3020, 3020, 'http://www.headingtech.com/center/tz/6/68b398e7da7e45bf876107ac2b7de04f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3021, 3021, 'http://www.headingtech.com/center/tz/6/477254a854324e8f82a79a33c33f8657/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3022, 3022, 'http://www.headingtech.com/center/tz/6/fa513ca74e05497badee84231cdad3d0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3023, 3023, 'http://www.headingtech.com/center/tz/6/f6c493cfe6d04751b6af685d33091ffb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3024, 3024, 'http://www.headingtech.com/center/tz/6/41262e7f8eec4add8373d7209558ac70/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3025, 3025, 'http://www.headingtech.com/center/tz/6/962c43f69e5a423d93f0e1d4c2e53348/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3026, 3026, 'http://www.headingtech.com/center/tz/6/b9cc0c373a774445bebb6b5f9ea153db/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3027, 3027, 'http://www.headingtech.com/center/tz/6/f5b7ccb6bed94432af2a93c53613b2f4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3028, 3028, 'http://www.headingtech.com/center/tz/6/6c596f8177454b5287636806d200514b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3029, 3029, 'http://www.headingtech.com/center/tz/6/f5abf468952d43258c1d4bcbd9b694c6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3030, 3030, 'http://www.headingtech.com/center/tz/6/a85ae42a3b9f424bbf1479eb840ad7b3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3031, 3031, 'http://www.headingtech.com/center/tz/6/33eb4f40ea0341ae99669f09ddae4a2a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3032, 3032, 'http://www.headingtech.com/center/tz/6/c38166b764084ea3b2eba521837ea0d4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3033, 3033, 'http://www.headingtech.com/center/tz/6/4479d86264e94e3a8c6f241f7e66baef/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3034, 3034, 'http://www.headingtech.com/center/tz/6/2a53c159d8f64a5ba0053c0824d01777/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3035, 3035, 'http://www.headingtech.com/center/tz/6/84250e683bee4458875303fe5694e9b6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3036, 3036, 'http://www.headingtech.com/center/tz/6/7eebe6c94b2940628cffd629da8288e2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3037, 3037, 'http://www.headingtech.com/center/tz/6/39e78a4021924698969769a183891f5c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3038, 3038, 'http://www.headingtech.com/center/tz/6/280c601215b446edadb05a4ec3f594e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3039, 3039, 'http://www.headingtech.com/center/tz/6/3bfe489a0192466db5b500268fb95255/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3040, 3040, 'http://www.headingtech.com/center/tz/6/e5ad24f3102946d9a3a62ac937a589eb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3041, 3041, 'http://www.headingtech.com/center/tz/6/7aa84f81527744e2aa0f2e3abca58f00/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3042, 3042, 'http://www.headingtech.com/center/tz/6/c33df2b0d5d442cfb05f337ad5fae6a2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3043, 3043, 'http://www.headingtech.com/center/tz/6/df93bc2939e8429db1122571fc693c17/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3044, 3044, 'http://www.headingtech.com/center/tz/6/843a66bd93634db8a36e8503e0fd193a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3045, 3045, 'http://www.headingtech.com/center/tz/6/bbeeec696165401a9798869673150666/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3046, 3046, 'http://www.headingtech.com/center/tz/6/c4f5bfc3abad404d81f91508dde22d68/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3047, 3047, 'http://www.headingtech.com/center/tz/6/7a595fc2697a42c1a43a50171b4afcc4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3048, 3048, 'http://www.headingtech.com/center/tz/6/8b3103a995cc4a1fb2e837b6047e6cb5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3049, 3049, 'http://www.headingtech.com/center/tz/6/ecb2bcf4dd51454992229cf7307317fa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3050, 3050, 'http://www.headingtech.com/center/tz/6/c1342911c3444207942a9b53df03a9b9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3051, 3051, 'http://www.headingtech.com/center/tz/6/a1f26346002c4c11b62ba63f523c5e54/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3052, 3052, 'http://www.headingtech.com/center/tz/6/deb90a7610234f22a91838af6ce199fd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3053, 3053, 'http://www.headingtech.com/center/tz/6/455fb749d1ef4ab09ea57099e1578e62/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3054, 3054, 'http://www.headingtech.com/center/tz/6/fdc9b60ac7364ab68768caaa427802be/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3055, 3055, 'http://www.headingtech.com/center/tz/6/97c7b6ba8ea54959a271374bbf115780/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3056, 3056, 'http://www.headingtech.com/center/tz/6/6d08047325a144169eba98e20a4901f1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3057, 3057, 'http://www.headingtech.com/center/tz/6/30f2b379f2884254a9ce21fec583af9d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3058, 3058, 'http://www.headingtech.com/center/tz/6/0672fa8474904b8f95dbeed63c786575/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3059, 3059, 'http://www.headingtech.com/center/tz/6/8bebbba80d614a59b505915aca92ba3e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3060, 3060, 'http://www.headingtech.com/center/tz/6/7c09cbbc4b3f4ad89d3a7d661d62994d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3061, 3061, 'http://www.headingtech.com/center/tz/6/57d8db54d3f74859bfc9d43ef519e700/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3062, 3062, 'http://www.headingtech.com/center/tz/6/9bfa548f6a414746bd8647d2bee800e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3063, 3063, 'http://www.headingtech.com/center/tz/6/4dc8a794e42445d8b4a8074949b7bcec/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3064, 3064, 'http://www.headingtech.com/center/tz/6/f4b4fd9a12db40dda46763d2ce8c5c0b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3065, 3065, 'http://www.headingtech.com/center/tz/6/f1d2312f8f3e4e029076a3a689362fbc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3066, 3066, 'http://www.headingtech.com/center/tz/6/f6ad558a12334475ada94487761cabef/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3067, 3067, 'http://www.headingtech.com/center/tz/6/1fafdca0eec94498a96854b234b62dbc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3068, 3068, 'http://www.headingtech.com/center/tz/6/fbe256a2556e4eb48396e966ea0f92e2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3069, 3069, 'http://www.headingtech.com/center/tz/6/5f234b59b1104f31ad394765a0ee9fc2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3070, 3070, 'http://www.headingtech.com/center/tz/6/17983d1ff95646a6bf6848f01ffcb073/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3071, 3071, 'http://www.headingtech.com/center/tz/6/453bf02562314c2a86384fc3a78195f2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3072, 3072, 'http://www.headingtech.com/center/tz/6/c3768ee148284058993cd54746545a1d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3073, 3073, 'http://www.headingtech.com/center/tz/6/53f0a2778d37472ebd22ad77ba32b29c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3074, 3074, 'http://www.headingtech.com/center/tz/6/9d4415d619024dcbb576cfb9aa160de2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3075, 3075, 'http://www.headingtech.com/center/tz/6/2c7fcc21784c4caab3e2a9c3e1f426a1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3076, 3076, 'http://www.headingtech.com/center/tz/6/e3eee965c4304c6aa29d18d424efa4c9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3077, 3077, 'http://www.headingtech.com/center/tz/6/a1ce8714d558410bbc811355f45435a6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3078, 3078, 'http://www.headingtech.com/center/tz/6/5cfeeb018ece4153b95324c91bf98839/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3079, 3079, 'http://www.headingtech.com/center/tz/6/b88c33ad9f4f47dfb919d853ab78e726/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3080, 3080, 'http://www.headingtech.com/center/tz/6/408f8caa46b74ae2a72e5cc31e386952/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3081, 3081, 'http://www.headingtech.com/center/tz/6/595cd011130345c791232ba0b29add32/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3082, 3082, 'http://www.headingtech.com/center/tz/6/062dce3b9cb04922b9e5949b8c182ea9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3083, 3083, 'http://www.headingtech.com/center/tz/6/8bce111d6e4846e3b7b70fc432a81295/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3084, 3084, 'http://www.headingtech.com/center/tz/6/051aaf8e250b4636917385a1e7f5d27b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3085, 3085, 'http://www.headingtech.com/center/tz/6/415d4085bae543e18f7212e4844aa036/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3086, 3086, 'http://www.headingtech.com/center/tz/6/8b33e825c0214b5b9ea08440e494be54/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3087, 3087, 'http://www.headingtech.com/center/tz/6/985fc7d140e34558ba03bc6e10d9bea8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3088, 3088, 'http://www.headingtech.com/center/tz/6/0e52aefa63204ddbb4bd01916123a597/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3089, 3089, 'http://www.headingtech.com/center/tz/6/7a23fc69de354617938a53d3a2bb8cfb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3090, 3090, 'http://www.headingtech.com/center/tz/6/3239927c51dd40f8bfa8fd02946ea681/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3091, 3091, 'http://www.headingtech.com/center/tz/6/5c24c762a3fd4cd5a565067a3ce664b6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3092, 3092, 'http://www.headingtech.com/center/tz/6/c45c2f6b1dd74191ab116c1fe369c90e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3093, 3093, 'http://www.headingtech.com/center/tz/6/a9785685592a49df8231966e734a9819/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3094, 3094, 'http://www.headingtech.com/center/tz/6/5d57878c37db47de9aea3aa0ac1764b9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3095, 3095, 'http://www.headingtech.com/center/tz/6/076acdffd5e74c4599c5924506166cf8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3096, 3096, 'http://www.headingtech.com/center/tz/6/51dd73c463c5442db4d8491906ec471c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3097, 3097, 'http://www.headingtech.com/center/tz/6/de77668f7bd24ff191011b5699944630/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3098, 3098, 'http://www.headingtech.com/center/tz/6/2c722474782944af99004d8f94744987/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3099, 3099, 'http://www.headingtech.com/center/tz/6/617a3abae08f45cbb4c4e8ddaa46ac8c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3100, 3100, 'http://www.headingtech.com/center/tz/6/5ab65bb55a8e478ebc1252ffe47fdd18/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3101, 3101, 'http://www.headingtech.com/center/tz/6/26dbebf6cc0340f3b2d4df68dc4b19bb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3102, 3102, 'http://www.headingtech.com/center/tz/6/5d1bd172f09b46fcbf4346f73de83735/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3103, 3103, 'http://www.headingtech.com/center/tz/6/4dff0338e9274498b02a38b053958111/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3104, 3104, 'http://www.headingtech.com/center/tz/6/587beb0d3e6f465d830e8fdcddad662d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3105, 3105, 'http://www.headingtech.com/center/tz/6/a96ec1fb079e45efa7f78c9693735b33/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3106, 3106, 'http://www.headingtech.com/center/tz/6/c1a528f9c4894df7911803d6a1c8ff71/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3107, 3107, 'http://www.headingtech.com/center/tz/6/55a15502370c45aca909fc61abb54701/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3108, 3108, 'http://www.headingtech.com/center/tz/6/a5ae8c11b63b42dd87879f155139c8d9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3109, 3109, 'http://www.headingtech.com/center/tz/6/4d0f7d40589f44668088c6d1c8850fdd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3110, 3110, 'http://www.headingtech.com/center/tz/6/db0a29781d6845a9a0af96609cb1f458/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3111, 3111, 'http://www.headingtech.com/center/tz/6/98b43c8f81e7413faf4cdf847e92c4e1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3112, 3112, 'http://www.headingtech.com/center/tz/6/c72d8c0610ba49ecacb908ec790ff891/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3113, 3113, 'http://www.headingtech.com/center/tz/6/aa7d0a43a4fb453ca24d86f6cb503e0b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3114, 3114, 'http://www.headingtech.com/center/tz/6/5477846e61dc45098e48248f9bcf61fd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3115, 3115, 'http://www.headingtech.com/center/tz/6/8c7876c68d83443f9b11b28574a4baba/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3116, 3116, 'http://www.headingtech.com/center/tz/6/c9d6bba0ff984d03bca64ed4f2150a71/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3117, 3117, 'http://www.headingtech.com/center/tz/6/811cbd49af2642119a782a3e83b9dd12/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3118, 3118, 'http://www.headingtech.com/center/tz/6/395a2fd41ecc408892b6f99166948208/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3119, 3119, 'http://www.headingtech.com/center/tz/6/54ec337954f141f091ae28a1ac665feb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3120, 3120, 'http://www.headingtech.com/center/tz/6/f7721b2cee0245b7b9e4ccf212790313/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3121, 3121, 'http://www.headingtech.com/center/tz/6/fe362185b1344bbebaf2f92ec2afdecb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3122, 3122, 'http://www.headingtech.com/center/tz/6/49fd8f6d30174ff0b9c9f6e14b4715b7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3123, 3123, 'http://www.headingtech.com/center/tz/6/c8686e712be74ded85ff476150e18db1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3124, 3124, 'http://www.headingtech.com/center/tz/6/76676424456c4a18a951b82b0ec24ef3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3125, 3125, 'http://www.headingtech.com/center/tz/6/c979f56fea9d4b59a9fb292b2dbb8a83/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3126, 3126, 'http://www.headingtech.com/center/tz/6/f742b79c0938426db30579bab694bfa8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3127, 3127, 'http://www.headingtech.com/center/tz/6/adfee1a9befd4a49aab878810afc88e6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3128, 3128, 'http://www.headingtech.com/center/tz/6/82d331e756024b60b037ecda58b37561/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3129, 3129, 'http://www.headingtech.com/center/tz/6/3fd4222bf3ab46ddab79ec7087e9f217/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3130, 3130, 'http://www.headingtech.com/center/tz/6/5308d2cd94434fd3be78cd51a97a260a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3131, 3131, 'http://www.headingtech.com/center/tz/6/8e9e88e481154965bce30e867d6f2a22/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3132, 3132, 'http://www.headingtech.com/center/tz/6/74bb2237668a4191ba4079ec0c49e9c1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3133, 3133, 'http://www.headingtech.com/center/tz/6/24077adf5a9b435d834054a7d44b5f1d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3134, 3134, 'http://www.headingtech.com/center/tz/6/65687c744e8341f998fff61e93f9a8b5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3135, 3135, 'http://www.headingtech.com/center/tz/6/ebda648b2ffe47a5ac3161ba4e2c82d7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3136, 3136, 'http://www.headingtech.com/center/tz/6/ef2b34de02bf4fffb0c832f59f842e26/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3137, 3137, 'http://www.headingtech.com/center/tz/6/b5cd83bff3bd49f2935b1d53910a2636/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3138, 3138, 'http://www.headingtech.com/center/tz/6/2834610c96e249c0a8baef0aa4af058a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3139, 3139, 'http://www.headingtech.com/center/tz/6/0bc3ed4b0b584aafb67cf5f67440d3d4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3140, 3140, 'http://www.headingtech.com/center/tz/6/caa7f8794e244a58be61efe9a7ea7803/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3141, 3141, 'http://www.headingtech.com/center/tz/6/db3d5a89233a43a08bdf37c7d24e5390/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3142, 3142, 'http://www.headingtech.com/center/tz/6/def560b8148049a48f1d774aca0297c1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3143, 3143, 'http://www.headingtech.com/center/tz/6/7e5822cf2d104c06ae78f830b1505e56/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3144, 3144, 'http://www.headingtech.com/center/tz/6/48ee7308ee1645229ab153c3f8ff3105/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3145, 3145, 'http://www.headingtech.com/center/tz/6/22405d38baf8408bba92ca25f2564744/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3146, 3146, 'http://www.headingtech.com/center/tz/6/68cfedc2ec4d4cd4b37da37dc6765059/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3147, 3147, 'http://www.headingtech.com/center/tz/6/00f52e945b3646e5a7764afff96760fb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3148, 3148, 'http://www.headingtech.com/center/tz/6/7a665e0778424c79a8e457d6bb6480e9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3149, 3149, 'http://www.headingtech.com/center/tz/6/34f1e5ee2271495b88d6a848fedd5bfb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3150, 3150, 'http://www.headingtech.com/center/tz/6/7dacdbf21098464aaddf656c078cde2d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3151, 3151, 'http://www.headingtech.com/center/tz/6/980a8d2c9e704f078b74a09cddf13d3d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3152, 3152, 'http://www.headingtech.com/center/tz/6/e3ab6afdcc584f68870430da2e7c9f0b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3153, 3153, 'http://www.headingtech.com/center/tz/6/4fb6537487704b41bc558358e7847fb5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3154, 3154, 'http://www.headingtech.com/center/tz/6/ceb91fd5624b4d09abcac44d224cd60a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3155, 3155, 'http://www.headingtech.com/center/tz/6/548eb29947594467920f029a7205fdf0/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3156, 3156, 'http://www.headingtech.com/center/tz/6/0cc844fdfe7f4118b3b9d584a4bcaa16/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3157, 3157, 'http://www.headingtech.com/center/tz/6/2395f179d93f430297b8aaaee162a599/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3158, 3158, 'http://www.headingtech.com/center/tz/6/a051785a7d1c4108988f188c5604803a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3159, 3159, 'http://www.headingtech.com/center/tz/6/784288795b1a45719b3abaddf666315c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3160, 3160, 'http://www.headingtech.com/center/tz/6/5fd2edd5431b4426897351845f2bfacd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3161, 3161, 'http://www.headingtech.com/center/tz/6/94af0731783a4daeb89a3bbdd18300c2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3162, 3162, 'http://www.headingtech.com/center/tz/6/d9c6ec71af214e6b84de29fe5ce005a3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3163, 3163, 'http://www.headingtech.com/center/tz/6/13d42fe50e7e4919a89ff2333a52c483/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3164, 3164, 'http://www.headingtech.com/center/tz/6/4356eed05c7b444ca0b0e5d3c0a531cb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3165, 3165, 'http://www.headingtech.com/center/tz/6/4e9c74f283df42e6806ab08852de0b1f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3166, 3166, 'http://www.headingtech.com/center/tz/6/b7955ec2e08c41928c91631e90694a62/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3167, 3167, 'http://www.headingtech.com/center/tz/6/b660edffaf114fc191f35e508992214d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3168, 3168, 'http://www.headingtech.com/center/tz/6/26eacf77d8794a1dbed8844f4ee3568a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3169, 3169, 'http://www.headingtech.com/center/tz/6/6b3a3e2ce7364f69ad6d2cc9c18f3eb3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3170, 3170, 'http://www.headingtech.com/center/tz/6/93ddad42da77431e8eb716b398987292/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3171, 3171, 'http://www.headingtech.com/center/tz/6/39acf8a7bffb41cb9714deef1b1b8e0f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3172, 3172, 'http://www.headingtech.com/center/tz/6/9d1747e8ce6444b7bfe333075529c894/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3173, 3173, 'http://www.headingtech.com/center/tz/6/312bfb6156b442a19bdfd03a4310d895/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3174, 3174, 'http://www.headingtech.com/center/tz/6/0258e809cb8b41bda67b60e99303f1ab/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3175, 3175, 'http://www.headingtech.com/center/tz/6/a518e8433c11444f869944c39803b393/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3176, 3176, 'http://www.headingtech.com/center/tz/6/712d5bc082d04fcc87d224e82103ba13/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3177, 3177, 'http://www.headingtech.com/center/tz/6/422122b6035e454b8c446ce8afddaf3e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3178, 3178, 'http://www.headingtech.com/center/tz/6/4e0bea994a624561a0b51a7175206f97/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3179, 3179, 'http://www.headingtech.com/center/tz/6/91b9615d984e466ebf1a020fd822cbce/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3180, 3180, 'http://www.headingtech.com/center/tz/6/11e209782d3445e2bdb82730f73a95fc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3181, 3181, 'http://www.headingtech.com/center/tz/6/3bc6f29970c24770b0e7d102aec03fb3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3182, 3182, 'http://www.headingtech.com/center/tz/6/ef2014e1e3494f068a1595891561e551/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3183, 3183, 'http://www.headingtech.com/center/tz/6/de4c289137b84d879b635f05908a1617/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3184, 3184, 'http://www.headingtech.com/center/tz/6/dac581f8318540dab1ed6f6fa3ed9717/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3185, 3185, 'http://www.headingtech.com/center/tz/6/678acc741eee43bd8d853b87655709ee/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3186, 3186, 'http://www.headingtech.com/center/tz/6/4996684126824d50a627c1ec6f7b0524/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3187, 3187, 'http://www.headingtech.com/center/tz/6/ac6eb9f305a042919911a960551189f3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3188, 3188, 'http://www.headingtech.com/center/tz/6/3c0e941f50524d4bb4a1a60ca96e8da1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3189, 3189, 'http://www.headingtech.com/center/tz/6/ca53af91dcdc4a04a4753d97943726de/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3190, 3190, 'http://www.headingtech.com/center/tz/6/48287346701b4b7b83acb337a0fdcb3c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3191, 3191, 'http://www.headingtech.com/center/tz/6/95eb957dfe8748b39d99b875c1adce1c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3192, 3192, 'http://www.headingtech.com/center/tz/6/5d23c211ea5c43e683e918f69bcbdc0f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3193, 3193, 'http://www.headingtech.com/center/tz/6/09a19eb6136b4866b07f3c3cb1246949/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3194, 3194, 'http://www.headingtech.com/center/tz/6/25e0f3a1571a436ab11faaef269e4470/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3195, 3195, 'http://www.headingtech.com/center/tz/6/a0d97fdae4fd4db39b4b4354d667aed5/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3196, 3196, 'http://www.headingtech.com/center/tz/6/7bcf27d546bf4a4babdc2a1d1e0b270c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3197, 3197, 'http://www.headingtech.com/center/tz/6/5500cdfb429342b1acf5a627ecc85f24/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3198, 3198, 'http://www.headingtech.com/center/tz/6/50d89c0b2e974fe699d8277b50b4e62b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3199, 3199, 'http://www.headingtech.com/center/tz/6/cba5892ca135440d88e4b65eb7da8cb8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3200, 3200, 'http://www.headingtech.com/center/tz/6/05156cb48e7b448796f3b9caa1437f64/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3201, 3201, 'http://www.headingtech.com/center/tz/6/1ec5efbbf3834cdc9370f8263a938a90/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3202, 3202, 'http://www.headingtech.com/center/tz/6/233184253cf04b948600a3b24214db94/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3203, 3203, 'http://www.headingtech.com/center/tz/6/f67f5de2f6cc4dce9078f9b600791ebe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3204, 3204, 'http://www.headingtech.com/center/tz/6/03ea0ba414fd4b869fcad011d0d31ba7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3205, 3205, 'http://www.headingtech.com/center/tz/6/2c77d6525a1e40d5801625dac39c4c06/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3206, 3206, 'http://www.headingtech.com/center/tz/6/97f7c122abf74e4db1e6f25605d89853/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3207, 3207, 'http://www.headingtech.com/center/tz/6/fdbee6ecb150419ab3cb9fb4724e0032/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3208, 3208, 'http://www.headingtech.com/center/tz/6/aeb49021c1ef407693bba0c3d0e2bc58/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3209, 3209, 'http://www.headingtech.com/center/tz/6/db441403158541c0bf621d0736322f79/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3210, 3210, 'http://www.headingtech.com/center/tz/6/16a1547aa33b462ca6841f34be6723ff/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3211, 3211, 'http://www.headingtech.com/center/tz/6/2facccb94b964a2aa93e170eb3c1e3b2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3212, 3212, 'http://www.headingtech.com/center/tz/6/390ae5f667cd4861bfef87d5a11e4e6c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3213, 3213, 'http://www.headingtech.com/center/tz/6/59c53387ce9c44fd9bf57f0884730606/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3214, 3214, 'http://www.headingtech.com/center/tz/6/03e8088210164079879d4fd2e3234c73/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3215, 3215, 'http://www.headingtech.com/center/tz/6/1d3f9cfc5b584bc48498b26847fd51f4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3216, 3216, 'http://www.headingtech.com/center/tz/6/17cea7d3e42842738712f6d5649fef02/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3217, 3217, 'http://www.headingtech.com/center/tz/6/055b2629d32c49e8a439506df5bd8576/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3218, 3218, 'http://www.headingtech.com/center/tz/6/c794179998b844e3ac79c03ef04b4102/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3219, 3219, 'http://www.headingtech.com/center/tz/6/02bcd93e325d4288b2c598303ecac8e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3220, 3220, 'http://www.headingtech.com/center/tz/6/f444dacc8aca4ec89597a77be7c99191/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3221, 3221, 'http://www.headingtech.com/center/tz/6/151c496f3cc9452d8fae164a320255a8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3222, 3222, 'http://www.headingtech.com/center/tz/6/12564a69a1344bf6a4adfcf0ae304338/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3223, 3223, 'http://www.headingtech.com/center/tz/6/4feeb9521a194e54ba4b440a294cd500/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3224, 3224, 'http://www.headingtech.com/center/tz/6/b05c138030ff47cbbf4a4f8d1f152327/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3225, 3225, 'http://www.headingtech.com/center/tz/6/976d76f9c6a847d7b49457b32b565fe2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3226, 3226, 'http://www.headingtech.com/center/tz/6/060d9ff3abff456d8dc3a41f9acd7f36/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3227, 3227, 'http://www.headingtech.com/center/tz/6/aa455ca142ba49509a240acdd6d49bfd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3228, 3228, 'http://www.headingtech.com/center/tz/6/73a9b41b33f141cdaac2bd7f01ab5f39/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3229, 3229, 'http://www.headingtech.com/center/tz/6/477585ec5a8d4b178aa4483f3f3b083e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3230, 3230, 'http://www.headingtech.com/center/tz/6/a750053fd61044c89ef71c06f99ca906/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3231, 3231, 'http://www.headingtech.com/center/tz/6/89a1d60724fe4f008e7ea83f99865c6e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3232, 3232, 'http://www.headingtech.com/center/tz/6/4c7d7609aa9d4d48915114a09bc237cb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3233, 3233, 'http://www.headingtech.com/center/tz/6/d2e66ae287fb48269ad609ddd3adb4e1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3234, 3234, 'http://www.headingtech.com/center/tz/6/928b6ee1a12c4d0e839cd2967e3dbc4f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3235, 3235, 'http://www.headingtech.com/center/tz/6/0f7eef64b96f4c1d8a71aceeba0d2699/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3236, 3236, 'http://www.headingtech.com/center/tz/6/5d0556056f474d238716cafeb5598714/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3237, 3237, 'http://www.headingtech.com/center/tz/6/4f6f3f57823d4e9bb10459149055e43d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3238, 3238, 'http://www.headingtech.com/center/tz/6/9d3a48bbe42c46efabfbf96108e028ce/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3239, 3239, 'http://www.headingtech.com/center/tz/6/c70683140fb144f584862ffe35c9cccc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3240, 3240, 'http://www.headingtech.com/center/tz/6/add2a8580a7f47cd9f11f20d79d2d3d9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3241, 3241, 'http://www.headingtech.com/center/tz/6/886d03a9d8cf4f1b96d0ed528a5b705e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3242, 3242, 'http://www.headingtech.com/center/tz/6/a2f7787cab764523a9a88ce407cd7baf/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3243, 3243, 'http://www.headingtech.com/center/tz/6/8bc3aa34ee7a4a88bdbaa2e5736cb19d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3244, 3244, 'http://www.headingtech.com/center/tz/6/3a0e78ef9fe243cd9419178e2ca98f04/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3245, 3245, 'http://www.headingtech.com/center/tz/6/6407bd9aa065484b902e5faad3a93f43/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3246, 3246, 'http://www.headingtech.com/center/tz/6/04d2509862344af4b80482d8fb9962b4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3247, 3247, 'http://www.headingtech.com/center/tz/6/e9ab7343a5854522991905b8a826f25f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3248, 3248, 'http://www.headingtech.com/center/tz/6/d2a1db88734249ec81ff2793b3be3465/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3249, 3249, 'http://www.headingtech.com/center/tz/6/ac5b337073bc4d85ba7d3ab38d50c8aa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3250, 3250, 'http://www.headingtech.com/center/tz/6/18193d91accd4057a6463438366a94c1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3251, 3251, 'http://www.headingtech.com/center/tz/6/c95eb45ad9f347bd8b3d128a53de98ed/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3252, 3252, 'http://www.headingtech.com/center/tz/6/ae4c8109a57b43fdb8a50eed71d1a801/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3253, 3253, 'http://www.headingtech.com/center/tz/6/ab491735f3da40e9a0033ebcacfadbe6/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3254, 3254, 'http://www.headingtech.com/center/tz/6/fca46ab48e6a436f9c1e7d08283c15b8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3255, 3255, 'http://www.headingtech.com/center/tz/6/c1760c120a9b49f884051fe6e03b536e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3256, 3256, 'http://www.headingtech.com/center/tz/6/aec1fd6836f14644b0af954d8aa9f1cd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3257, 3257, 'http://www.headingtech.com/center/tz/6/11817ac9c498470389961aab5ec73893/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3258, 3258, 'http://www.headingtech.com/center/tz/6/6004694e472c48019fc9ea320f2a6ecd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3259, 3259, 'http://www.headingtech.com/center/tz/6/f3879da2d9404e1b9d9e1a10e65b1520/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3260, 3260, 'http://www.headingtech.com/center/tz/6/71179bb312554a1185ea9c3ecc0ef973/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3261, 3261, 'http://www.headingtech.com/center/tz/6/60f34d9c0edd43029b9ae840c1f00bbd/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3262, 3262, 'http://www.headingtech.com/center/tz/6/e8467b5648364fdf89fcd633f2af293f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3263, 3263, 'http://www.headingtech.com/center/tz/6/befa39419d0247c8802e38ae1132f9e7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3264, 3264, 'http://www.headingtech.com/center/tz/6/96d30b2ac25d41318ae4639480548b78/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3265, 3265, 'http://www.headingtech.com/center/tz/6/666ad857010b45a6a14abb9d84cc4fc3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3266, 3266, 'http://www.headingtech.com/center/tz/6/4ab7aed38822418584fac19e1f54bb7c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3267, 3267, 'http://www.headingtech.com/center/tz/6/3d8a6ea8ab1c4bc7a136dd67b46a9d2e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3268, 3268, 'http://www.headingtech.com/center/tz/6/eb2c1810a0134099944e87e919cc5c70/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3269, 3269, 'http://www.headingtech.com/center/tz/6/2983ba06aac44f0282a2ff99bb8ba5a7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3270, 3270, 'http://www.headingtech.com/center/tz/6/77fbd6a170c7455dbd8e63cecc321c54/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3271, 3271, 'http://www.headingtech.com/center/tz/6/9a6db5d870bb4f8db89abc17ee58bc35/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3272, 3272, 'http://www.headingtech.com/center/tz/6/c750d149c7ad4baabb01365d2c4b7c1e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3273, 3273, 'http://www.headingtech.com/center/tz/6/44bd6e80a03e4ba1a772497704a82ea3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3274, 3274, 'http://www.headingtech.com/center/tz/6/1ecdfc6b9a5047128dffb525c1fcee57/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3275, 3275, 'http://www.headingtech.com/center/tz/6/996de9b350a24d79b86cbfa29bd817fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3276, 3276, 'http://www.headingtech.com/center/tz/6/acb2523a3a4e4a339ae65e2f3d768909/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3277, 3277, 'http://www.headingtech.com/center/tz/6/f1cbb0ad15fe4ab6a5828a0567ea430a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3278, 3278, 'http://www.headingtech.com/center/tz/6/312d9e23260644ad9b92d971e8d6551e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3279, 3279, 'http://www.headingtech.com/center/tz/6/3029eb6400d545ca9c0f9f9949e4384a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3280, 3280, 'http://www.headingtech.com/center/tz/6/08d826acdbbd4bd29c8a1c857973a528/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3281, 3281, 'http://www.headingtech.com/center/tz/6/93a16ed01190403489f210ecdd82c9ea/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3282, 3282, 'http://www.headingtech.com/center/tz/6/ceadb30bb2bf4aa98e1ccf8a37c01382/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3283, 3283, 'http://www.headingtech.com/center/tz/6/1b9d17c2f8684776938286a9e9e25cde/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3284, 3284, 'http://www.headingtech.com/center/tz/6/46b2ebaaf7384f3784687a8d36ec6541/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3285, 3285, 'http://www.headingtech.com/center/tz/6/e77ac4e8f1bb45799b8a9d58fee2ca6e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3286, 3286, 'http://www.headingtech.com/center/tz/6/52484331904e440db0d3d28dc5efdc69/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3287, 3287, 'http://www.headingtech.com/center/tz/6/72eeb183e28a4399b1627047b8fb041a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3288, 3288, 'http://www.headingtech.com/center/tz/6/0c5439c1bfe04a7ebf08794883d6b0b9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3289, 3289, 'http://www.headingtech.com/center/tz/6/458073949c764cc4b49bc5bfb1a9f184/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3290, 3290, 'http://www.headingtech.com/center/tz/6/e7454825ef674baebe0df66e4d19e6fa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3291, 3291, 'http://www.headingtech.com/center/tz/6/aeaa44f640fa4f399f3ba5752e0a3753/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3292, 3292, 'http://www.headingtech.com/center/tz/6/a06825836a6b44e99fa667f1d48ee204/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3293, 3293, 'http://www.headingtech.com/center/tz/6/df9a1839e31b410cb6b05d421bca418f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3294, 3294, 'http://www.headingtech.com/center/tz/6/08ae4b918f0f405298ced66905428bf7/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3295, 3295, 'http://www.headingtech.com/center/tz/6/8fa855f88d9046b7a3723ea8e610663c/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3296, 3296, 'http://www.headingtech.com/center/tz/6/575d4557603347d1a4400f63726b33de/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3297, 3297, 'http://www.headingtech.com/center/tz/6/82d7574275be4a3290f30cb509d04409/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3298, 3298, 'http://www.headingtech.com/center/tz/6/baaec24a82fd431a9cc19324a8b679c4/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3299, 3299, 'http://www.headingtech.com/center/tz/6/b418316f0500436194e9c20217b210ba/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3300, 3300, 'http://www.headingtech.com/center/tz/6/7d2ddae64ddd4600922bff5def3400fe/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3301, 3301, 'http://www.headingtech.com/center/tz/6/d31657c1cff84b96b073ac1a49e57c97/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3302, 3302, 'http://www.headingtech.com/center/tz/6/c6b951cb3ffb49808b0980d760d20ad1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3303, 3303, 'http://www.headingtech.com/center/tz/6/7f4699d7e0c643159cde995fc863e7e1/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3304, 3304, 'http://www.headingtech.com/center/tz/6/021322fbb25b4b408eb50d3735eae43d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3305, 3305, 'http://www.headingtech.com/center/tz/6/fb1631f226c947bd97d6c4ed58c7491d/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3306, 3306, 'http://www.headingtech.com/center/tz/6/4b4ec0b7359c4f168bacaea53654bc9e/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3307, 3307, 'http://www.headingtech.com/center/tz/6/26e473746a564525934e1420f799ad09/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3308, 3308, 'http://www.headingtech.com/center/tz/6/c294e026327f434385fbbc3f7f7df003/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3309, 3309, 'http://www.headingtech.com/center/tz/6/ffb110777a6c4f67b55a46a177f721f2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3310, 3310, 'http://www.headingtech.com/center/tz/6/66e03689c22740f2929f3182cd6f8660/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3311, 3311, 'http://www.headingtech.com/center/tz/6/62cb467ff19145dea689457b419bfe0f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3312, 3312, 'http://www.headingtech.com/center/tz/6/7ae8c2303af7476c811fe80aa35fe940/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3313, 3313, 'http://www.headingtech.com/center/tz/6/d1041d328ece4be782d3b98b38261687/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3314, 3314, 'http://www.headingtech.com/center/tz/6/e82a8846f8074f6ca57dd8f69f9c3652/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3315, 3315, 'http://www.headingtech.com/center/tz/6/cbf6d391ea3e4a8dbcfe82d714bab947/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3316, 3316, 'http://www.headingtech.com/center/tz/6/709754eeeb5e46fba2876493af91a6e3/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3317, 3317, 'http://www.headingtech.com/center/tz/6/e9d3c9369b8f44f5af6af025e291b38b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3318, 3318, 'http://www.headingtech.com/center/tz/6/4ca4faf2b3fd433faca9bfa403b5cadb/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3319, 3319, 'http://www.headingtech.com/center/tz/6/715aed4160844f05a99e5c82343f55aa/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3320, 3320, 'http://www.headingtech.com/center/tz/6/4858c28a76664cc29ee6c760180bb578/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3321, 3321, 'http://www.headingtech.com/center/tz/6/384d075e1b4342f98d0a92ec0261a721/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3322, 3322, 'http://www.headingtech.com/center/tz/6/31eb063f389a48bc9e7a7131a526f089/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3323, 3323, 'http://www.headingtech.com/center/tz/6/e6067befec6041988646a785485d445f/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3324, 3324, 'http://www.headingtech.com/center/tz/6/936baa0cc6c14cb7897809fa290b3b31/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3325, 3325, 'http://www.headingtech.com/center/tz/6/4cc0c8a5e1e04abab241de748aa3984a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3326, 3326, 'http://www.headingtech.com/center/tz/6/2badc6768e3946ea84a0a9362dd415a8/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3327, 3327, 'http://www.headingtech.com/center/tz/6/53f6ac74059344808ac022923e892b8b/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3328, 3328, 'http://www.headingtech.com/center/tz/6/184a69525a3b4b56aec73d386d3c0957/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3329, 3329, 'http://www.headingtech.com/center/tz/6/6a417e00322049e98ca393e478d9efc2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3330, 3330, 'http://www.headingtech.com/center/tz/6/d1596d64d06240479e7675cb4affffca/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3331, 3331, 'http://www.headingtech.com/center/tz/6/1a0922df764844239e80ffb61cf9a58a/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3332, 3332, 'http://www.headingtech.com/center/tz/6/1bdddd7970b7472c9d777af0cb429970/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3333, 3333, 'http://www.headingtech.com/center/tz/6/ef9006d37f5a4e67b219623508b48bcc/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3334, 3334, 'http://www.headingtech.com/center/tz/6/a872a2d785cf4f34a691c4a441d4c8ea/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3335, 3335, 'http://www.headingtech.com/center/tz/6/942a0aa17d004450ab2e7e3a04439dd9/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3336, 3336, 'http://www.headingtech.com/center/tz/6/119e261462844fd498dab75841053c65/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3337, 3337, 'http://www.headingtech.com/center/tz/6/f3ef60016dae4291a00f4d475ce5e4c2/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_201812` VALUES (3338, 3338, 'http://www.headingtech.com/center/tz/6/c377bfc17e3c4c6984f85ee43941da86/12', '20181203230112', 1, 1, '2018-12-03 23:01:52', '2018-12-03 23:01:52');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_apply_code_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_apply_code_info`;
CREATE TABLE `t_ser_apply_code_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请订单号',
  `apply_user_id` bigint(20) DEFAULT NULL COMMENT '申请人',
  `code_type_id` bigint(20) DEFAULT NULL COMMENT '溯源码种类',
  `code_position_id` bigint(20) DEFAULT NULL COMMENT '溯源码类型',
  `code_position_type_id` bigint(20) DEFAULT NULL COMMENT '溯源码位置类型',
  `apply_count` int(255) DEFAULT NULL COMMENT '申请数量',
  `apply_state` int(255) DEFAULT NULL COMMENT '申请状态',
  `code_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码存放表',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码申请';

-- ----------------------------
-- Records of t_ser_apply_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_apply_code_info` VALUES (12, '20181125123952', 2, 2, 1, 1, 5, 1, '201811', '2018-11-25 12:39:52', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_info` VALUES (13, '20181125124200', 2, 2, 2, 2, 5, 1, '201811', '2018-11-25 12:42:01', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_info` VALUES (14, '20181125124500', 2, 2, 1, 1, 5, 1, '201811', '2018-11-25 12:45:01', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_info` VALUES (15, '20181125125209', 2, 2, 2, 4, 5, 1, '201811', '2018-11-25 12:52:10', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_info` VALUES (16, '20181126150453', 2, 2, 1, 1, 3, 1, '201811', '2018-11-26 15:04:54', '2018-11-26 15:06:11');
INSERT INTO `t_ser_apply_code_info` VALUES (17, '20181126150503', 2, 2, 2, 2, 3, 1, '201811', '2018-11-26 15:05:03', '2018-11-26 15:06:12');
INSERT INTO `t_ser_apply_code_info` VALUES (18, '20181126150515', 2, 2, 2, 3, 3, 1, '201811', '2018-11-26 15:05:16', '2018-11-26 15:06:13');
INSERT INTO `t_ser_apply_code_info` VALUES (19, '20181126150538', 2, 2, 2, 4, 3, 1, '201811', '2018-11-26 15:05:39', '2018-11-26 15:06:14');
INSERT INTO `t_ser_apply_code_info` VALUES (20, '20181126150555', 2, 1, 2, 5, 2, 1, '201811', '2018-11-26 15:05:55', '2018-11-26 15:06:15');
INSERT INTO `t_ser_apply_code_info` VALUES (21, '20181203100009', 2, 2, 2, 2, 4, 0, NULL, '2018-12-03 10:00:10', '2018-12-03 10:00:10');
INSERT INTO `t_ser_apply_code_info` VALUES (22, '20181203200926', 1, 2, 1, 1, 10, 1, '201812', '2018-12-03 20:09:26', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_info` VALUES (23, '20181203201031', 1, 1, 2, 5, 10, 1, '201812', '2018-12-03 20:10:32', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_info` VALUES (24, '20181203201045', 1, 1, 2, 5, 2, 1, '201812', '2018-12-03 20:10:45', '2018-12-03 20:11:02');
INSERT INTO `t_ser_apply_code_info` VALUES (25, '20181203204105', 1, 2, 2, 2, 10, 1, '201812', '2018-12-03 20:41:06', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_info` VALUES (26, '20181203220319', 2, 2, 1, 1, 2, 1, '201812', '2018-12-03 22:03:20', '2018-12-03 22:04:20');
INSERT INTO `t_ser_apply_code_info` VALUES (27, '20181203220327', 2, 2, 2, 2, 2, 1, '201812', '2018-12-03 22:03:27', '2018-12-03 22:04:19');
INSERT INTO `t_ser_apply_code_info` VALUES (28, '20181203222845', 2, 2, 2, 5, 2, 1, '201812', '2018-12-03 22:28:46', '2018-12-03 22:28:55');
INSERT INTO `t_ser_apply_code_info` VALUES (29, '20181203230112', 2, 2, 1, 1, 1000, 1, '201812', '2018-12-03 23:01:12', '2018-12-03 23:01:53');
INSERT INTO `t_ser_apply_code_info` VALUES (30, '20181203230119', 2, 2, 2, 2, 1000, 1, '201812', '2018-12-03 23:01:19', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_info` VALUES (31, '20181203230128', 2, 2, 2, 4, 1000, 1, '201812', '2018-12-03 23:01:28', '2018-12-03 23:01:51');
INSERT INTO `t_ser_apply_code_info` VALUES (32, '20181203230144', 2, 1, 2, 5, 300, 1, '201812', '2018-12-03 23:01:44', '2018-12-03 23:01:50');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_apply_code_table_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_apply_code_table_info`;
CREATE TABLE `t_ser_apply_code_table_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码标识',
  `code_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '溯源码存在的表',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码申请对应的存放表';

-- ----------------------------
-- Records of t_ser_apply_code_table_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_apply_code_table_info` VALUES (11, '11', 't_ser_apply_code_201811', '2018-11-25 12:39:57', '2018-11-25 12:39:57');
INSERT INTO `t_ser_apply_code_table_info` VALUES (12, '11', 't_ser_apply_code_201811', '2018-11-25 12:42:26', '2018-11-25 12:42:26');
INSERT INTO `t_ser_apply_code_table_info` VALUES (13, '11', 't_ser_apply_code_201811', '2018-11-25 12:45:05', '2018-11-25 12:45:05');
INSERT INTO `t_ser_apply_code_table_info` VALUES (14, '11', 't_ser_apply_code_201811', '2018-11-25 12:52:22', '2018-11-25 12:52:22');
INSERT INTO `t_ser_apply_code_table_info` VALUES (15, '11', 't_ser_apply_code_201811', '2018-11-26 15:06:11', '2018-11-26 15:06:11');
INSERT INTO `t_ser_apply_code_table_info` VALUES (16, '11', 't_ser_apply_code_201811', '2018-11-26 15:06:12', '2018-11-26 15:06:12');
INSERT INTO `t_ser_apply_code_table_info` VALUES (17, '11', 't_ser_apply_code_201811', '2018-11-26 15:06:13', '2018-11-26 15:06:13');
INSERT INTO `t_ser_apply_code_table_info` VALUES (18, '11', 't_ser_apply_code_201811', '2018-11-26 15:06:14', '2018-11-26 15:06:14');
INSERT INTO `t_ser_apply_code_table_info` VALUES (19, '11', 't_ser_apply_code_201811', '2018-11-26 15:06:15', '2018-11-26 15:06:15');
INSERT INTO `t_ser_apply_code_table_info` VALUES (20, '12', 't_ser_apply_code_201812', '2018-12-03 20:09:33', '2018-12-03 20:09:33');
INSERT INTO `t_ser_apply_code_table_info` VALUES (21, '12', 't_ser_apply_code_201812', '2018-12-03 20:11:02', '2018-12-03 20:11:02');
INSERT INTO `t_ser_apply_code_table_info` VALUES (22, '12', 't_ser_apply_code_201812', '2018-12-03 20:11:03', '2018-12-03 20:11:03');
INSERT INTO `t_ser_apply_code_table_info` VALUES (23, '12', 't_ser_apply_code_201812', '2018-12-03 20:41:13', '2018-12-03 20:41:13');
INSERT INTO `t_ser_apply_code_table_info` VALUES (24, '12', 't_ser_apply_code_201812', '2018-12-03 22:04:19', '2018-12-03 22:04:19');
INSERT INTO `t_ser_apply_code_table_info` VALUES (25, '12', 't_ser_apply_code_201812', '2018-12-03 22:04:21', '2018-12-03 22:04:21');
INSERT INTO `t_ser_apply_code_table_info` VALUES (26, '12', 't_ser_apply_code_201812', '2018-12-03 22:28:55', '2018-12-03 22:28:55');
INSERT INTO `t_ser_apply_code_table_info` VALUES (27, '12', 't_ser_apply_code_201812', '2018-12-03 23:01:50', '2018-12-03 23:01:50');
INSERT INTO `t_ser_apply_code_table_info` VALUES (28, '12', 't_ser_apply_code_201812', '2018-12-03 23:01:51', '2018-12-03 23:01:51');
INSERT INTO `t_ser_apply_code_table_info` VALUES (29, '12', 't_ser_apply_code_201812', '2018-12-03 23:01:52', '2018-12-03 23:01:52');
INSERT INTO `t_ser_apply_code_table_info` VALUES (30, '12', 't_ser_apply_code_201812', '2018-12-03 23:01:53', '2018-12-03 23:01:53');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_info`;
CREATE TABLE `t_ser_brand_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `short_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简略标题',
  `brand_sort` int(255) DEFAULT NULL COMMENT '排序',
  `region_id` bigint(255) DEFAULT NULL COMMENT '产地',
  `brand_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌关键字',
  `brand_remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌备注',
  `brand_state` int(255) DEFAULT NULL COMMENT '品牌状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业品牌信息';

-- ----------------------------
-- Records of t_ser_brand_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_info` VALUES (1, '第一品牌', NULL, 1, NULL, NULL, '第一个备注', 0, '2018-11-13 16:26:03', '2018-11-14 16:02:22');
INSERT INTO `t_ser_brand_info` VALUES (2, '第二品牌', NULL, 2, NULL, NULL, '第二个备注', 0, '2018-11-13 16:35:55', '2018-11-13 17:00:57');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_logo_file
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_logo_file`;
CREATE TABLE `t_ser_brand_logo_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌',
  `file_id` bigint(20) DEFAULT NULL COMMENT '品牌logo文件id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE,
  CONSTRAINT `t_ser_brand_logo_file_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `t_ser_brand_info` (`id`),
  CONSTRAINT `t_ser_brand_logo_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `t_sys_file_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌logo信息';

-- ----------------------------
-- Records of t_ser_brand_logo_file
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_logo_file` VALUES (14, 2, 4);
INSERT INTO `t_ser_brand_logo_file` VALUES (18, 1, 22);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_series_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_series_info`;
CREATE TABLE `t_ser_brand_series_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `series_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列名称',
  `short_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简略标题',
  `key_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字',
  `series_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列备注',
  `series_state` int(255) DEFAULT NULL COMMENT '系列状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  CONSTRAINT `t_ser_brand_series_info_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `t_ser_brand_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌系列信息';

-- ----------------------------
-- Records of t_ser_brand_series_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_info` VALUES (1, 1, NULL, '系列1', NULL, NULL, '第一品牌系列1', 0, '2018-11-13 17:51:19', '2018-11-13 18:07:20');
INSERT INTO `t_ser_brand_series_info` VALUES (2, 1, NULL, '系列2', NULL, NULL, '第一品牌系列2', 0, '2018-11-13 17:51:39', '2018-11-13 18:07:29');
INSERT INTO `t_ser_brand_series_info` VALUES (3, 2, NULL, '系列1', NULL, NULL, '第二品牌系列1', 0, '2018-11-13 17:51:53', '2018-11-13 18:07:39');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_series_product_code_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_series_product_code_info`;
CREATE TABLE `t_ser_brand_series_product_code_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(255) DEFAULT NULL COMMENT '产品id',
  `code_id` bigint(20) DEFAULT NULL COMMENT '码类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品组成码信息';

-- ----------------------------
-- Records of t_ser_brand_series_product_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (75, 5, 1);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (76, 5, 5);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (77, 5, 3);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (78, 5, 4);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (79, 6, 1);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (80, 6, 5);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (81, 6, 4);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (82, 7, 1);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (83, 7, 2);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (84, 7, 4);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (85, 7, 5);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_series_product_file
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_series_product_file`;
CREATE TABLE `t_ser_brand_series_product_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL COMMENT '系列id',
  `file_id` bigint(20) DEFAULT NULL COMMENT '系列图片id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE,
  CONSTRAINT `t_ser_brand_series_product_file_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `t_ser_brand_series_product_info` (`id`),
  CONSTRAINT `t_ser_brand_series_product_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `t_sys_file_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌产品系列图片';

-- ----------------------------
-- Records of t_ser_brand_series_product_file
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_file` VALUES (41, 5, 17);
INSERT INTO `t_ser_brand_series_product_file` VALUES (42, 5, 18);
INSERT INTO `t_ser_brand_series_product_file` VALUES (43, 5, 19);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_series_product_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_series_product_info`;
CREATE TABLE `t_ser_brand_series_product_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `series_id` bigint(20) DEFAULT NULL COMMENT '系列id',
  `series_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列名称',
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `short_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简略标题',
  `key_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字',
  `code_number` int(11) DEFAULT NULL COMMENT '码数量',
  `series_standard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品规格',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `sales_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `code_69` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品69码',
  `product_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `product_state` int(255) DEFAULT NULL COMMENT '产品状态（0：使用，1：未使用）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `series_id` (`series_id`) USING BTREE,
  CONSTRAINT `t_ser_brand_series_product_info_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `t_ser_brand_series_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌系列产品信息';

-- ----------------------------
-- Records of t_ser_brand_series_product_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_info` VALUES (5, 1, NULL, '产品1', NULL, NULL, NULL, '600ml', 56.00, 45.00, '1234asdf', '备注1', '2018-11-14 13:58:01', '2018-11-26 19:53:41', 0);
INSERT INTO `t_ser_brand_series_product_info` VALUES (6, 2, NULL, '产品2', NULL, NULL, NULL, '600ml', 76.00, 70.00, '2345trew', '测试', '2018-11-27 13:37:07', '2018-11-27 13:37:07', 0);
INSERT INTO `t_ser_brand_series_product_info` VALUES (7, 3, NULL, '狗年新品', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 21:53:31', '2018-12-03 21:53:31', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_import_temp_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_import_temp_info`;
CREATE TABLE `t_ser_code_import_temp_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(255) DEFAULT NULL COMMENT '模板id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `left_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '左码',
  `right_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '右码',
  `left_code_type` bigint(255) DEFAULT NULL COMMENT '左码码类型（盖内外盖之类）',
  `right_code_type` bigint(255) DEFAULT NULL COMMENT '右码码类型（盖内外盖之类）',
  `import_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导入的订单号',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `orderno` int(11) DEFAULT NULL COMMENT '排序用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码导入临时表';

-- ----------------------------
-- Table structure for t_ser_code_import_template_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_import_template_info`;
CREATE TABLE `t_ser_code_import_template_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板名称',
  `left_code_type` bigint(255) DEFAULT NULL COMMENT '溯源左码类型（1：内码，2：外码）',
  `left_code_type_id` bigint(20) DEFAULT NULL COMMENT '左码',
  `right_code_type_id` bigint(20) DEFAULT NULL COMMENT '右码',
  `template_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板说明',
  `template_state` int(255) DEFAULT NULL COMMENT '模板状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `left_code_type_id` (`left_code_type_id`) USING BTREE,
  KEY `right_code_type_id` (`right_code_type_id`) USING BTREE,
  CONSTRAINT `t_ser_code_import_template_info_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `t_ser_brand_series_product_info` (`id`),
  CONSTRAINT `t_ser_code_import_template_info_ibfk_4` FOREIGN KEY (`left_code_type_id`) REFERENCES `t_ser_code_type3_info` (`id`),
  CONSTRAINT `t_ser_code_import_template_info_ibfk_5` FOREIGN KEY (`right_code_type_id`) REFERENCES `t_ser_code_type3_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码导入模板';

-- ----------------------------
-- Records of t_ser_code_import_template_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_import_template_info` VALUES (1, 5, '盖内-盖外', 1, 1, 2, '产品1的盖内外模板', 0, '2018-11-14 15:23:55', '2018-11-25 12:57:18');
INSERT INTO `t_ser_code_import_template_info` VALUES (2, 5, '盒子-箱子', 2, 4, 5, '吧啦啦啦', 0, '2018-11-23 17:22:56', '2018-11-25 12:57:04');
INSERT INTO `t_ser_code_import_template_info` VALUES (3, 5, '盖外-盒子', 2, 2, 4, '测试', 0, '2018-11-26 15:31:06', '2018-11-26 15:31:06');
INSERT INTO `t_ser_code_import_template_info` VALUES (4, 5, '盖内和箱子', 1, 1, 5, '11', 0, '2018-12-03 20:13:33', '2018-12-03 20:13:33');
INSERT INTO `t_ser_code_import_template_info` VALUES (5, 5, 'XXX盖外 ---箱子', 2, 2, 5, NULL, 0, '2018-12-03 20:45:10', '2018-12-03 20:45:10');
INSERT INTO `t_ser_code_import_template_info` VALUES (6, 7, '狗年  内码到外码', 1, 1, 2, NULL, 0, '2018-12-03 22:03:07', '2018-12-03 22:03:07');
INSERT INTO `t_ser_code_import_template_info` VALUES (7, 7, '狗年外到想', 2, 2, 5, '123', 0, '2018-12-03 22:30:40', '2018-12-03 22:30:40');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_type1_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_type1_info`;
CREATE TABLE `t_ser_code_type1_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内外码';

-- ----------------------------
-- Records of t_ser_code_type1_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_type1_info` VALUES (1, '内码', '2018-11-23 11:26:29', '2018-11-23 11:26:33');
INSERT INTO `t_ser_code_type1_info` VALUES (2, '外码', '2018-11-23 11:26:42', '2018-11-23 11:26:45');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_type2_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_type2_info`;
CREATE TABLE `t_ser_code_type2_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='条形码二维码';

-- ----------------------------
-- Records of t_ser_code_type2_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_type2_info` VALUES (1, '条形码', '2018-11-23 11:27:14', '2018-11-23 11:27:18');
INSERT INTO `t_ser_code_type2_info` VALUES (2, '二维码', '2018-11-23 11:27:27', '2018-11-23 11:27:31');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_type3_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_type3_info`;
CREATE TABLE `t_ser_code_type3_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码类型名称',
  `code_state` int(255) DEFAULT NULL COMMENT '类型状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码类型';

-- ----------------------------
-- Records of t_ser_code_type3_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_type3_info` VALUES (1, '盖内码', 0, '2018-11-14 11:38:48', '2018-11-14 11:38:48');
INSERT INTO `t_ser_code_type3_info` VALUES (2, '盖外码', 0, '2018-11-14 11:39:02', '2018-11-14 11:39:02');
INSERT INTO `t_ser_code_type3_info` VALUES (3, '瓶码', 0, '2018-11-14 11:40:32', '2018-11-14 11:40:32');
INSERT INTO `t_ser_code_type3_info` VALUES (4, '盒码', 0, '2018-11-14 11:40:45', '2018-11-23 10:01:56');
INSERT INTO `t_ser_code_type3_info` VALUES (5, '箱码', 0, '2018-11-14 11:40:56', '2018-11-14 11:40:56');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_dealer_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_dealer_info`;
CREATE TABLE `t_ser_dealer_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dealer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经销商名称',
  `person_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人',
  `person_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人电话',
  `dealer_state` int(255) DEFAULT NULL COMMENT '与供应商合作状态（0：合作，1：不合作）',
  `region_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商区域id',
  `dealer_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商详细地址',
  `social_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商社会码',
  `dealer_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经销商备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经销商信息';

-- ----------------------------
-- Records of t_ser_dealer_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_dealer_info` VALUES (1, '经销商1', '周星星', '9528', 0, NULL, '龙口科技大厦', '123qwe', '备注1', '2018-11-15 11:24:42', '2018-11-15 11:41:19');
INSERT INTO `t_ser_dealer_info` VALUES (2, '经销商2', '周素素', '9528', 0, NULL, '科技大厦', 'WERS', '备注2', '2018-11-27 13:13:07', '2018-11-27 13:13:07');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_dealer_region_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_dealer_region_info`;
CREATE TABLE `t_ser_dealer_region_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dealer_id` bigint(20) DEFAULT NULL COMMENT '经销商id',
  `region_id` bigint(20) DEFAULT NULL COMMENT '区域id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经销商区域';

-- ----------------------------
-- Records of t_ser_dealer_region_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_dealer_region_info` VALUES (13, 1, 1930);
INSERT INTO `t_ser_dealer_region_info` VALUES (14, 1, 1931);
INSERT INTO `t_ser_dealer_region_info` VALUES (15, 1, 1935);
INSERT INTO `t_ser_dealer_region_info` VALUES (16, 2, 1930);
INSERT INTO `t_ser_dealer_region_info` VALUES (17, 2, 1931);
INSERT INTO `t_ser_dealer_region_info` VALUES (18, 2, 1935);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_goods_info`;
CREATE TABLE `t_ser_goods_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(255) NOT NULL COMMENT '品牌',
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌名称',
  `brand_series_id` bigint(255) NOT NULL COMMENT '系列',
  `brand_series_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系列名称',
  `brand_series_product_id` bigint(255) NOT NULL COMMENT '产品',
  `brand_series_product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `M1` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '内码',
  `M2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M9` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M10` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外码',
  `M1_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M2_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M3_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M4_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M5_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M6_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M7_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M8_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M9_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `M10_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码说明',
  `goods_state` int(255) DEFAULT NULL COMMENT '商品状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品信息表';

-- ----------------------------
-- Records of t_ser_goods_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_goods_info` VALUES (1, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://9suyuan.com/6/C7lQnKEEvt/11', 'http://9suyuan.com/6/bHVx0aqq77zd/11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-26 15:14:15', '2018-11-26 15:14:15');
INSERT INTO `t_ser_goods_info` VALUES (2, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://9suyuan.com/6/yHtxbXxVfb/11', 'http://9suyuan.com/6/0Vk83Mk4Pv0p/11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-26 15:14:15', '2018-11-26 15:14:15');
INSERT INTO `t_ser_goods_info` VALUES (3, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://9suyuan.com/6/CbRxMRoXQf/11', 'http://9suyuan.com/6/G8FdIJif8Ir8/11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-11-26 15:14:15', '2018-11-26 15:14:15');
INSERT INTO `t_ser_goods_info` VALUES (14, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://www.headingtech.com/center/tz/6/8c8b21ede0d543bb88f0cf68f1cc19c5/12', 'http://www.headingtech.com/center/tz/6/c29407124f574fa7b421f7a02f2dca32/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `t_ser_goods_info` VALUES (15, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://www.headingtech.com/center/tz/6/54d859c3e9a54bd5a1d0ef8bfd4b3631/12', 'http://www.headingtech.com/center/tz/6/c2d90c3bfe1643ee86ee063d73a2c0bf/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `t_ser_goods_info` VALUES (16, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://www.headingtech.com/center/tz/6/7a3de5b3363d4bed923784d69763963a/12', 'http://www.headingtech.com/center/tz/6/21af5541779c453f8282f94ecc3c66e6/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `t_ser_goods_info` VALUES (17, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://www.headingtech.com/center/tz/6/c362d7c12cde462993bc7a4854fa95fb/12', 'http://www.headingtech.com/center/tz/6/b15c6ef47dfb4312b53f214a5db090ac/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `t_ser_goods_info` VALUES (18, 1, '第一品牌', 1, '系列1', 5, '产品1', 'http://www.headingtech.com/center/tz/6/e12469cd6513442bb508e7a0bdd54ab1/12', 'http://www.headingtech.com/center/tz/6/7fe1deeb486047b6b2b00a847f5aadcb/12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2018-12-03 20:43:04', '2018-12-03 20:43:04');
INSERT INTO `t_ser_goods_info` VALUES (23, 2, '第二品牌', 3, '系列1', 7, '狗年新品', 'http://www.headingtech.com/center/tz/6/5c2eb70380d74ad8a363f51a452e8b58/12', 'http://www.headingtech.com/center/tz/6/46c22156dc534224bb5fac4ecb7e01bf/12', NULL, NULL, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2018-12-03 22:27:36', '2018-12-03 22:27:36');
INSERT INTO `t_ser_goods_info` VALUES (24, 2, '第二品牌', 3, '系列1', 7, '狗年新品', 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', 'http://www.headingtech.com/center/tz/6/0339d5d2704b44c1a3c2a8fe6a8db47a/12', NULL, NULL, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', NULL, NULL, NULL, NULL, NULL, '盖内码', '盖外码', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2018-12-03 22:27:36', '2018-12-03 22:27:36');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_order_info`;
CREATE TABLE `t_ser_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `dealer_id` bigint(20) DEFAULT NULL COMMENT '经销商',
  `dealer_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经销商社会编码',
  `brand_id` bigint(11) DEFAULT NULL COMMENT '品牌',
  `series_id` bigint(255) DEFAULT NULL COMMENT '产品',
  `product_id` bigint(255) DEFAULT NULL COMMENT '系列',
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数量',
  `order_state` int(11) DEFAULT NULL COMMENT '订单状态（0：备单，1：确认订单，2：发货）',
  `order_remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `financial_id` bigint(20) DEFAULT NULL COMMENT '财务',
  `iData1` int(11) DEFAULT NULL,
  `iData2` int(11) DEFAULT NULL,
  `iData3` int(11) DEFAULT NULL,
  `iData4` int(11) DEFAULT NULL,
  `sData1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sData2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sData3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sData4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='销售订单表';

-- ----------------------------
-- Records of t_ser_order_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_order_info` VALUES (1, '20181129125419', 1, NULL, NULL, NULL, NULL, '7', 2, '备注1', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-29 12:54:19', '2018-11-29 12:55:08');
INSERT INTO `t_ser_order_info` VALUES (2, '20181129132946', 1, NULL, NULL, NULL, NULL, '7', 2, '214sad', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-29 13:29:47', '2018-11-29 14:34:59');
INSERT INTO `t_ser_order_info` VALUES (3, '20181203215346', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 21:53:46', '2018-12-03 21:55:11');
INSERT INTO `t_ser_order_info` VALUES (4, '20181203223116', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 22:31:16', '2018-12-03 22:31:32');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_order_info_details
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_order_info_details`;
CREATE TABLE `t_ser_order_info_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(255) DEFAULT NULL COMMENT '订单id',
  `product_id` bigint(255) DEFAULT NULL COMMENT '产品id',
  `box_number` int(255) DEFAULT NULL COMMENT '箱数',
  `user_id` bigint(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_FK_SERV_ORDER_IDEALS` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='销售订单详情';

-- ----------------------------
-- Records of t_ser_order_info_details
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_order_info_details` VALUES (96, 1, 5, 3, 2, '2018-11-29 12:54:20', '2018-11-29 12:54:20');
INSERT INTO `t_ser_order_info_details` VALUES (97, 1, 6, 4, 2, '2018-11-29 12:54:20', '2018-11-29 12:54:20');
INSERT INTO `t_ser_order_info_details` VALUES (133, 2, 5, 3, 2, '2018-11-29 14:29:18', '2018-11-29 14:29:18');
INSERT INTO `t_ser_order_info_details` VALUES (134, 2, 6, 4, 2, '2018-11-29 14:29:25', '2018-11-29 14:29:25');
INSERT INTO `t_ser_order_info_details` VALUES (139, 3, 7, 12, 2, '2018-12-03 21:53:46', '2018-12-03 21:53:46');
INSERT INTO `t_ser_order_info_details` VALUES (141, 4, 7, 1, 2, '2018-12-03 22:31:16', '2018-12-03 22:31:16');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_prize_manager_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_prize_manager_info`;
CREATE TABLE `t_ser_prize_manager_info` (
  `prize_manage_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prize_type_id` bigint(20) DEFAULT NULL COMMENT '奖项类型',
  `prize_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖项名称',
  `prize_content` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖项内容',
  `prize_remark` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖项备注',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`prize_manage_id`) USING BTREE,
  KEY `FK_PK_PRIZE_MANAGER` (`prize_type_id`) USING BTREE,
  CONSTRAINT `t_ser_prize_manager_info_ibfk_1` FOREIGN KEY (`prize_type_id`) REFERENCES `t_ser_prize_type_info` (`prize_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='奖项管理';

-- ----------------------------
-- Records of t_ser_prize_manager_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_prize_manager_info` VALUES (1, 1, '现金红包', '现金红包', '扫码获取现金红包', 2, 0, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, '2018-11-30 11:25:59', '2018-12-03 10:14:45');
INSERT INTO `t_ser_prize_manager_info` VALUES (2, 2, '获得积分', '扫码获得积分', '扫码获得积分', 2, 0, NULL, NULL, NULL, 'PT', NULL, NULL, NULL, '2018-11-30 11:26:09', '2018-12-03 10:14:45');
INSERT INTO `t_ser_prize_manager_info` VALUES (3, 7, '过年大奖', '只有微信红包', NULL, 2, 0, NULL, NULL, NULL, 'wxhb', NULL, NULL, NULL, '2018-12-03 21:56:37', '2018-12-04 10:24:13');
INSERT INTO `t_ser_prize_manager_info` VALUES (4, 7, '今晚最后一次测试', '1、盖内码只能扫描一次', NULL, 2, 0, NULL, NULL, NULL, 'wxhb', NULL, NULL, NULL, '2018-12-03 22:49:28', '2018-12-04 10:24:21');
INSERT INTO `t_ser_prize_manager_info` VALUES (5, 1, '今晚最后一次测试', '庆祝今晚测试通过！', NULL, 2, 0, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, '2018-12-03 22:51:12', '2018-12-04 10:24:27');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_prize_recode_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_prize_recode_info`;
CREATE TABLE `t_ser_prize_recode_info` (
  `prize_recor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `pr_code` varchar(1024) COLLATE utf8_unicode_ci NOT NULL COMMENT '产品编码',
  `prize_set_id` bigint(20) NOT NULL COMMENT '奖项设定id',
  `prize_set_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '布奖名称',
  `prod_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `member_type` bigint(11) DEFAULT NULL COMMENT '会员类型',
  `region_id` bigint(20) DEFAULT NULL COMMENT '布奖区域',
  `prize_quantity` int(11) DEFAULT NULL COMMENT '布奖数量',
  `money` decimal(5,2) DEFAULT NULL COMMENT '红包额度',
  `ponit` int(11) DEFAULT NULL COMMENT '积分额度',
  `prize_set_type` int(11) DEFAULT NULL COMMENT '布奖类型',
  `prize_mode_type` int(11) DEFAULT NULL COMMENT '布奖模式（1：随机，2：平均）',
  `card_money` int(11) DEFAULT NULL COMMENT '卡券消费额度',
  `card_coupon_money` int(11) DEFAULT NULL COMMENT '卡券优惠额度',
  `prize_state` int(11) DEFAULT NULL COMMENT '布奖状态（0：未激活，1：激活）',
  `track_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `cash_time` datetime DEFAULT NULL COMMENT '兑奖时间',
  `open_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '中奖人id',
  `prize_start_date` datetime DEFAULT NULL COMMENT '布奖开始日期',
  `prize_end_date` datetime DEFAULT NULL COMMENT '布奖结束日期',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`prize_recor_id`) USING BTREE,
  UNIQUE KEY `pr_code` (`pr_code`(255)) USING BTREE COMMENT '商品溯源码'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='奖项记录（布奖、兑奖）';

-- ----------------------------
-- Records of t_ser_prize_recode_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_prize_recode_info` VALUES (15, '20181203223116', 'http://www.headingtech.com/center/tz/6/5c2eb70380d74ad8a363f51a452e8b58/12', 4, '测试红包！', 7, 1, 3, NULL, 1.31, NULL, 1, 1, NULL, NULL, 1, NULL, '2018-12-03 23:00:55', '', '2018-12-03 00:00:00', '2019-01-09 00:00:00', 2, NULL, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, '2018-12-03 22:51:59', '2018-12-03 22:51:59');
INSERT INTO `t_ser_prize_recode_info` VALUES (16, '20181203223116', 'http://www.headingtech.com/center/tz/6/9e6a100d140a4786bab4888f1ceca00a/12', 4, '测试红包！', 7, 1, 3, NULL, 0.00, NULL, 1, 1, NULL, NULL, 1, NULL, '2018-12-03 22:59:28', '', '2018-12-03 00:00:00', '2019-01-09 00:00:00', 2, NULL, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, '2018-12-03 22:51:59', '2018-12-03 22:51:59');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_prize_set_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_prize_set_info`;
CREATE TABLE `t_ser_prize_set_info` (
  `prize_set_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prize_manager_id` bigint(20) DEFAULT NULL COMMENT '奖项管理id',
  `prize_set_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '布奖名称',
  `prod_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `member_type` bigint(11) DEFAULT NULL COMMENT '会员类型',
  `region_id` bigint(20) DEFAULT NULL COMMENT '布奖区域',
  `prize_quantity` int(11) DEFAULT NULL COMMENT '布奖数量',
  `money` decimal(5,2) DEFAULT NULL COMMENT '红包额度',
  `money_end` decimal(5,2) DEFAULT NULL COMMENT '红包额度结束',
  `ponit` int(11) DEFAULT NULL COMMENT '积分额度',
  `point_end` int(11) DEFAULT NULL COMMENT '积分额度结束',
  `prize_set_type` int(11) DEFAULT NULL COMMENT '布奖类型(1：限制数量，2：不限制数量)',
  `prize_mode_type` int(11) DEFAULT NULL COMMENT '布奖模式(1：随机，2：平均)',
  `card_money` int(11) DEFAULT NULL COMMENT '卡券消费额度',
  `card_coupon_money` int(11) DEFAULT NULL COMMENT '卡券优惠额度',
  `prize_start_date` datetime DEFAULT NULL COMMENT '布奖开始日期',
  `prize_end_date` datetime DEFAULT NULL COMMENT '布奖结束日期',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `idata1` int(11) DEFAULT NULL,
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`prize_set_id`) USING BTREE,
  KEY `prize_manager_id` (`prize_manager_id`) USING BTREE,
  CONSTRAINT `t_ser_prize_set_info_ibfk_1` FOREIGN KEY (`prize_manager_id`) REFERENCES `t_ser_prize_manager_info` (`prize_manage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='奖项设定';

-- ----------------------------
-- Records of t_ser_prize_set_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_prize_set_info` VALUES (1, 1, '扫码获得现金红包', 5, 1, 19, 2, 2.00, 20.00, 5, 30, 1, 2, 100, 200, '2018-11-30 00:00:00', '2018-12-03 00:00:00', 2, 0, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, NULL, '2018-12-03 11:41:14');
INSERT INTO `t_ser_prize_set_info` VALUES (2, 1, '扫码红包不限量', 5, 1, 19, 0, 0.10, 10.00, 1, 14, 2, 2, 11, 15, '2018-12-03 00:00:00', '2018-12-07 00:00:00', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 17:50:05', '2018-12-03 17:50:05');
INSERT INTO `t_ser_prize_set_info` VALUES (3, 3, '狗年过年大奖', 7, 1, 76, 1, 1.00, 2.00, 10, 20, 1, 1, 0, 0, '2018-12-04 00:00:00', '2019-01-10 00:00:00', 2, 0, NULL, NULL, NULL, 'wxhb', NULL, NULL, NULL, '2018-12-03 21:59:55', '2018-12-03 22:44:50');
INSERT INTO `t_ser_prize_set_info` VALUES (4, 5, '测试红包！', 7, 1, 3, 1, 1.00, 2.00, 10, 20, 1, 1, 0, 0, '2018-12-03 00:00:00', '2019-01-09 00:00:00', 2, 1, NULL, NULL, NULL, 'HB', NULL, NULL, NULL, '2018-12-03 22:51:46', '2018-12-03 22:59:24');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_prize_type_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_prize_type_info`;
CREATE TABLE `t_ser_prize_type_info` (
  `prize_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prize_type_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '奖项类型编码',
  `prize_type_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖项类型名称',
  `prize_type_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖项类型内容',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作人',
  `idata1` int(11) DEFAULT NULL COMMENT '奖项类型状态（0：启用，1：停用）',
  `idata2` int(11) DEFAULT NULL,
  `idata3` int(11) DEFAULT NULL,
  `idata4` int(11) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`prize_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='奖项类型';

-- ----------------------------
-- Records of t_ser_prize_type_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_prize_type_info` VALUES (1, 'HB', '红包', '红包', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 09:50:48', '2018-12-03 10:12:44');
INSERT INTO `t_ser_prize_type_info` VALUES (2, 'PT', '积分', '积分', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 09:56:26', '2018-12-03 10:12:44');
INSERT INTO `t_ser_prize_type_info` VALUES (3, 'CP', '卡券', '卡券', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-30 09:56:42', '2018-12-03 10:12:45');
INSERT INTO `t_ser_prize_type_info` VALUES (4, 'GD', '实物', '实物', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 10:10:51', '2018-12-03 10:12:45');
INSERT INTO `t_ser_prize_type_info` VALUES (5, 'CM', '大转盘', '大转盘', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 10:11:04', '2018-12-03 10:13:03');
INSERT INTO `t_ser_prize_type_info` VALUES (6, 'CP@', '卡券@', '卡券#', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 10:11:19', '2018-12-03 10:13:28');
INSERT INTO `t_ser_prize_type_info` VALUES (7, 'wxhb', '微信红包1', NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-12-03 21:56:01', '2018-12-03 21:56:17');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_purchase_order_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_purchase_order_info`;
CREATE TABLE `t_ser_purchase_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dealer_id` bigint(255) DEFAULT NULL COMMENT '经销商id',
  `order_no` int(11) DEFAULT NULL COMMENT '退货订单号',
  `order_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '退货原因',
  `idata1` int(255) DEFAULT NULL,
  `idata2` int(255) DEFAULT NULL,
  `idata3` int(255) DEFAULT NULL,
  `idata4` int(255) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品退货订单';

-- ----------------------------
-- Table structure for t_ser_purchase_order_info_details
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_purchase_order_info_details`;
CREATE TABLE `t_ser_purchase_order_info_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '退货订单id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品系列id',
  `box_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '箱号',
  `is_no` int(11) DEFAULT NULL COMMENT '是否直接入库（0：是，1：否）',
  `purchase_state` int(255) DEFAULT NULL COMMENT '退货状态（0：供应商发起，1：仓管员发起）',
  `idata1` int(255) DEFAULT NULL,
  `idata2` int(255) DEFAULT NULL,
  `idata3` int(255) DEFAULT NULL,
  `idata4` int(255) DEFAULT NULL,
  `sdata1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdata4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='退货订单商品明细';

-- ----------------------------
-- Table structure for t_ser_warehouse_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_warehouse_goods_info`;
CREATE TABLE `t_ser_warehouse_goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_type` int(255) DEFAULT NULL COMMENT '入库来源（0：生产入库，1：换货入库，2：退货入库，3：换仓入库）',
  `warehouse_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `box_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '箱码',
  `goods_state` int(255) DEFAULT NULL COMMENT '商品状态（0：未入库，1：入库，2：出库，3：丢失，4：已扫描兑奖）',
  `warehouse_in_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入库编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '入库人',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入库备注',
  `create_time` datetime DEFAULT NULL COMMENT '入库时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `warehouse_id` (`warehouse_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  CONSTRAINT `t_ser_warehouse_goods_info_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `t_ser_warehouse_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品入库';

-- ----------------------------
-- Records of t_ser_warehouse_goods_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_warehouse_goods_info` VALUES (4, 0, 1, NULL, 'http://www.headingtech.com/center/tz/6/d0685add2d44465eb226147e01199d67/12', 2, '20181203223747', 3, NULL, '2018-12-03 22:37:47', '2018-12-03 22:41:21');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_warehouse_info`;
CREATE TABLE `t_ser_warehouse_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '系统用户id',
  `warehouse_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库管理员',
  `warehouse_person_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库管理员电话',
  `total_inventory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '库存总量',
  `warehouse_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库备注',
  `warehouse_state` int(255) DEFAULT NULL COMMENT '仓库状态（0：未使用，1：使用）',
  `longitude` double DEFAULT NULL COMMENT '经度',
  `latitude` double DEFAULT NULL COMMENT '维度',
  `is_inventory` int(255) DEFAULT NULL COMMENT '清点库存（0：不清点，1：清点）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `t_ser_warehouse_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库信息';

-- ----------------------------
-- Records of t_ser_warehouse_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_warehouse_info` VALUES (1, '仓库1', 3, '周1', '9999', '1000', '备注1', 0, NULL, NULL, NULL, '2018-11-15 15:04:32', '2018-11-15 15:04:32');
INSERT INTO `t_ser_warehouse_info` VALUES (2, '仓库2', 3, '周2', '9998', '1000', '备注2', 0, NULL, NULL, NULL, '2018-11-15 15:05:09', '2018-11-15 15:31:11');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_api_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_api_info`;
CREATE TABLE `t_sys_api_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_type` int(255) DEFAULT NULL COMMENT 'api标识类型(0：用户授权码，1：接口授权码)',
  `api_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'api标识内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业api标识';

-- ----------------------------
-- Records of t_sys_api_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_api_info` VALUES (1, 0, '8521d755faa736d24f0be5638a6f499c', '2018-11-19 17:17:52', '2018-11-19 17:17:56');
INSERT INTO `t_sys_api_info` VALUES (2, 1, 'ff80d68c6c8f402f2b31bf0e90155faf', '2018-11-19 17:17:59', '2018-11-19 17:18:03');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_base_region_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_base_region_info`;
CREATE TABLE `t_sys_base_region_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint(20) DEFAULT NULL COMMENT '父id',
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统区域信息表';

-- ----------------------------
-- Records of t_sys_base_region_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_base_region_info` VALUES (1, 0, '北京市');
INSERT INTO `t_sys_base_region_info` VALUES (2, 1, '北京城区');
INSERT INTO `t_sys_base_region_info` VALUES (3, 2, '东城区');
INSERT INTO `t_sys_base_region_info` VALUES (4, 2, '朝阳区');
INSERT INTO `t_sys_base_region_info` VALUES (5, 2, '丰台区');
INSERT INTO `t_sys_base_region_info` VALUES (6, 2, '石景山区');
INSERT INTO `t_sys_base_region_info` VALUES (7, 2, '门头沟区');
INSERT INTO `t_sys_base_region_info` VALUES (8, 2, '房山区');
INSERT INTO `t_sys_base_region_info` VALUES (9, 2, '通州区');
INSERT INTO `t_sys_base_region_info` VALUES (10, 2, '顺义区');
INSERT INTO `t_sys_base_region_info` VALUES (11, 2, '昌平区');
INSERT INTO `t_sys_base_region_info` VALUES (12, 2, '大兴区');
INSERT INTO `t_sys_base_region_info` VALUES (13, 2, '怀柔区');
INSERT INTO `t_sys_base_region_info` VALUES (14, 2, '平谷区');
INSERT INTO `t_sys_base_region_info` VALUES (15, 2, '密云区');
INSERT INTO `t_sys_base_region_info` VALUES (16, 2, '延庆区');
INSERT INTO `t_sys_base_region_info` VALUES (17, 0, '天津市');
INSERT INTO `t_sys_base_region_info` VALUES (18, 17, '天津城区');
INSERT INTO `t_sys_base_region_info` VALUES (19, 18, '和平区');
INSERT INTO `t_sys_base_region_info` VALUES (20, 18, '河东区');
INSERT INTO `t_sys_base_region_info` VALUES (21, 18, '河西区');
INSERT INTO `t_sys_base_region_info` VALUES (22, 18, '南开区');
INSERT INTO `t_sys_base_region_info` VALUES (23, 18, '河北区');
INSERT INTO `t_sys_base_region_info` VALUES (24, 18, '红桥区');
INSERT INTO `t_sys_base_region_info` VALUES (25, 18, '西青区');
INSERT INTO `t_sys_base_region_info` VALUES (26, 18, '津南区');
INSERT INTO `t_sys_base_region_info` VALUES (27, 18, '北辰区');
INSERT INTO `t_sys_base_region_info` VALUES (28, 18, '武清区');
INSERT INTO `t_sys_base_region_info` VALUES (29, 18, '宝坻区');
INSERT INTO `t_sys_base_region_info` VALUES (30, 18, '滨海新区');
INSERT INTO `t_sys_base_region_info` VALUES (31, 18, '宁河区');
INSERT INTO `t_sys_base_region_info` VALUES (32, 18, '静海区');
INSERT INTO `t_sys_base_region_info` VALUES (33, 18, '蓟州区');
INSERT INTO `t_sys_base_region_info` VALUES (34, 0, '河北省');
INSERT INTO `t_sys_base_region_info` VALUES (35, 34, '石家庄市');
INSERT INTO `t_sys_base_region_info` VALUES (36, 35, '长安区');
INSERT INTO `t_sys_base_region_info` VALUES (37, 35, '桥西区');
INSERT INTO `t_sys_base_region_info` VALUES (38, 35, '新华区');
INSERT INTO `t_sys_base_region_info` VALUES (39, 35, '井陉矿区');
INSERT INTO `t_sys_base_region_info` VALUES (40, 35, '裕华区');
INSERT INTO `t_sys_base_region_info` VALUES (41, 35, '藁城区');
INSERT INTO `t_sys_base_region_info` VALUES (42, 35, '鹿泉区');
INSERT INTO `t_sys_base_region_info` VALUES (43, 35, '栾城区');
INSERT INTO `t_sys_base_region_info` VALUES (44, 35, '井陉县');
INSERT INTO `t_sys_base_region_info` VALUES (45, 35, '正定县');
INSERT INTO `t_sys_base_region_info` VALUES (46, 35, '行唐县');
INSERT INTO `t_sys_base_region_info` VALUES (47, 35, '灵寿县');
INSERT INTO `t_sys_base_region_info` VALUES (48, 35, '高邑县');
INSERT INTO `t_sys_base_region_info` VALUES (49, 35, '深泽县');
INSERT INTO `t_sys_base_region_info` VALUES (50, 35, '赞皇县');
INSERT INTO `t_sys_base_region_info` VALUES (51, 35, '无极县');
INSERT INTO `t_sys_base_region_info` VALUES (52, 35, '平山县');
INSERT INTO `t_sys_base_region_info` VALUES (53, 35, '元氏县');
INSERT INTO `t_sys_base_region_info` VALUES (54, 35, '赵县');
INSERT INTO `t_sys_base_region_info` VALUES (55, 35, '辛集市');
INSERT INTO `t_sys_base_region_info` VALUES (56, 35, '晋州市');
INSERT INTO `t_sys_base_region_info` VALUES (57, 35, '新乐市');
INSERT INTO `t_sys_base_region_info` VALUES (58, 34, '唐山市');
INSERT INTO `t_sys_base_region_info` VALUES (59, 58, '路南区');
INSERT INTO `t_sys_base_region_info` VALUES (60, 58, '路北区');
INSERT INTO `t_sys_base_region_info` VALUES (61, 58, '古冶区');
INSERT INTO `t_sys_base_region_info` VALUES (62, 58, '开平区');
INSERT INTO `t_sys_base_region_info` VALUES (63, 58, '丰南区');
INSERT INTO `t_sys_base_region_info` VALUES (64, 58, '丰润区');
INSERT INTO `t_sys_base_region_info` VALUES (65, 58, '曹妃甸区');
INSERT INTO `t_sys_base_region_info` VALUES (66, 58, '滦县');
INSERT INTO `t_sys_base_region_info` VALUES (67, 58, '滦南县');
INSERT INTO `t_sys_base_region_info` VALUES (68, 58, '乐亭县');
INSERT INTO `t_sys_base_region_info` VALUES (69, 58, '迁西县');
INSERT INTO `t_sys_base_region_info` VALUES (70, 58, '玉田县');
INSERT INTO `t_sys_base_region_info` VALUES (71, 58, '遵化市');
INSERT INTO `t_sys_base_region_info` VALUES (72, 58, '迁安市');
INSERT INTO `t_sys_base_region_info` VALUES (73, 34, '秦皇岛市');
INSERT INTO `t_sys_base_region_info` VALUES (74, 73, '海港区');
INSERT INTO `t_sys_base_region_info` VALUES (75, 73, '山海关区');
INSERT INTO `t_sys_base_region_info` VALUES (76, 73, '北戴河区');
INSERT INTO `t_sys_base_region_info` VALUES (77, 73, '抚宁区');
INSERT INTO `t_sys_base_region_info` VALUES (78, 73, '青龙满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (79, 73, '昌黎县');
INSERT INTO `t_sys_base_region_info` VALUES (80, 73, '卢龙县');
INSERT INTO `t_sys_base_region_info` VALUES (81, 34, '邯郸市');
INSERT INTO `t_sys_base_region_info` VALUES (82, 81, '邯山区');
INSERT INTO `t_sys_base_region_info` VALUES (83, 81, '丛台区');
INSERT INTO `t_sys_base_region_info` VALUES (84, 81, '复兴区');
INSERT INTO `t_sys_base_region_info` VALUES (85, 81, '峰峰矿区');
INSERT INTO `t_sys_base_region_info` VALUES (86, 81, '肥乡区');
INSERT INTO `t_sys_base_region_info` VALUES (87, 81, '永年区');
INSERT INTO `t_sys_base_region_info` VALUES (88, 81, '临漳县');
INSERT INTO `t_sys_base_region_info` VALUES (89, 81, '成安县');
INSERT INTO `t_sys_base_region_info` VALUES (90, 81, '大名县');
INSERT INTO `t_sys_base_region_info` VALUES (91, 81, '涉县');
INSERT INTO `t_sys_base_region_info` VALUES (92, 81, '磁县');
INSERT INTO `t_sys_base_region_info` VALUES (93, 81, '邱县');
INSERT INTO `t_sys_base_region_info` VALUES (94, 81, '鸡泽县');
INSERT INTO `t_sys_base_region_info` VALUES (95, 81, '广平县');
INSERT INTO `t_sys_base_region_info` VALUES (96, 81, '馆陶县');
INSERT INTO `t_sys_base_region_info` VALUES (97, 81, '魏县');
INSERT INTO `t_sys_base_region_info` VALUES (98, 81, '曲周县');
INSERT INTO `t_sys_base_region_info` VALUES (99, 81, '武安市');
INSERT INTO `t_sys_base_region_info` VALUES (100, 34, '邢台市');
INSERT INTO `t_sys_base_region_info` VALUES (101, 100, '桥东区');
INSERT INTO `t_sys_base_region_info` VALUES (102, 100, '桥西区');
INSERT INTO `t_sys_base_region_info` VALUES (103, 100, '邢台县');
INSERT INTO `t_sys_base_region_info` VALUES (104, 100, '临城县');
INSERT INTO `t_sys_base_region_info` VALUES (105, 100, '内丘县');
INSERT INTO `t_sys_base_region_info` VALUES (106, 100, '柏乡县');
INSERT INTO `t_sys_base_region_info` VALUES (107, 100, '隆尧县');
INSERT INTO `t_sys_base_region_info` VALUES (108, 100, '任县');
INSERT INTO `t_sys_base_region_info` VALUES (109, 100, '南和县');
INSERT INTO `t_sys_base_region_info` VALUES (110, 100, '宁晋县');
INSERT INTO `t_sys_base_region_info` VALUES (111, 100, '巨鹿县');
INSERT INTO `t_sys_base_region_info` VALUES (112, 100, '新河县');
INSERT INTO `t_sys_base_region_info` VALUES (113, 100, '广宗县');
INSERT INTO `t_sys_base_region_info` VALUES (114, 100, '平乡县');
INSERT INTO `t_sys_base_region_info` VALUES (115, 100, '威县');
INSERT INTO `t_sys_base_region_info` VALUES (116, 100, '清河县');
INSERT INTO `t_sys_base_region_info` VALUES (117, 100, '临西县');
INSERT INTO `t_sys_base_region_info` VALUES (118, 100, '南宫市');
INSERT INTO `t_sys_base_region_info` VALUES (119, 100, '沙河市');
INSERT INTO `t_sys_base_region_info` VALUES (120, 34, '保定市');
INSERT INTO `t_sys_base_region_info` VALUES (121, 120, '竞秀区');
INSERT INTO `t_sys_base_region_info` VALUES (122, 120, '莲池区');
INSERT INTO `t_sys_base_region_info` VALUES (123, 120, '满城区');
INSERT INTO `t_sys_base_region_info` VALUES (124, 120, '清苑区');
INSERT INTO `t_sys_base_region_info` VALUES (125, 120, '徐水区');
INSERT INTO `t_sys_base_region_info` VALUES (126, 120, '涞水县');
INSERT INTO `t_sys_base_region_info` VALUES (127, 120, '阜平县');
INSERT INTO `t_sys_base_region_info` VALUES (128, 120, '定兴县');
INSERT INTO `t_sys_base_region_info` VALUES (129, 120, '唐县');
INSERT INTO `t_sys_base_region_info` VALUES (130, 120, '高阳县');
INSERT INTO `t_sys_base_region_info` VALUES (131, 120, '容城县');
INSERT INTO `t_sys_base_region_info` VALUES (132, 120, '涞源县');
INSERT INTO `t_sys_base_region_info` VALUES (133, 120, '望都县');
INSERT INTO `t_sys_base_region_info` VALUES (134, 120, '安新县');
INSERT INTO `t_sys_base_region_info` VALUES (135, 120, '易县');
INSERT INTO `t_sys_base_region_info` VALUES (136, 120, '曲阳县');
INSERT INTO `t_sys_base_region_info` VALUES (137, 120, '蠡县');
INSERT INTO `t_sys_base_region_info` VALUES (138, 120, '顺平县');
INSERT INTO `t_sys_base_region_info` VALUES (139, 120, '博野县');
INSERT INTO `t_sys_base_region_info` VALUES (140, 120, '雄县');
INSERT INTO `t_sys_base_region_info` VALUES (141, 120, '涿州市');
INSERT INTO `t_sys_base_region_info` VALUES (142, 120, '定州市');
INSERT INTO `t_sys_base_region_info` VALUES (143, 120, '安国市');
INSERT INTO `t_sys_base_region_info` VALUES (144, 120, '高碑店市');
INSERT INTO `t_sys_base_region_info` VALUES (145, 34, '张家口市');
INSERT INTO `t_sys_base_region_info` VALUES (146, 145, '桥东区');
INSERT INTO `t_sys_base_region_info` VALUES (147, 145, '桥西区');
INSERT INTO `t_sys_base_region_info` VALUES (148, 145, '宣化区');
INSERT INTO `t_sys_base_region_info` VALUES (149, 145, '下花园区');
INSERT INTO `t_sys_base_region_info` VALUES (150, 145, '万全区');
INSERT INTO `t_sys_base_region_info` VALUES (151, 145, '崇礼区');
INSERT INTO `t_sys_base_region_info` VALUES (152, 145, '张北县');
INSERT INTO `t_sys_base_region_info` VALUES (153, 145, '康保县');
INSERT INTO `t_sys_base_region_info` VALUES (154, 145, '沽源县');
INSERT INTO `t_sys_base_region_info` VALUES (155, 145, '尚义县');
INSERT INTO `t_sys_base_region_info` VALUES (156, 145, '蔚县');
INSERT INTO `t_sys_base_region_info` VALUES (157, 145, '阳原县');
INSERT INTO `t_sys_base_region_info` VALUES (158, 145, '怀安县');
INSERT INTO `t_sys_base_region_info` VALUES (159, 145, '怀来县');
INSERT INTO `t_sys_base_region_info` VALUES (160, 145, '涿鹿县');
INSERT INTO `t_sys_base_region_info` VALUES (161, 145, '赤城县');
INSERT INTO `t_sys_base_region_info` VALUES (162, 34, '承德市');
INSERT INTO `t_sys_base_region_info` VALUES (163, 162, '双桥区');
INSERT INTO `t_sys_base_region_info` VALUES (164, 162, '双滦区');
INSERT INTO `t_sys_base_region_info` VALUES (165, 162, '鹰手营子矿区');
INSERT INTO `t_sys_base_region_info` VALUES (166, 162, '承德县');
INSERT INTO `t_sys_base_region_info` VALUES (167, 162, '兴隆县');
INSERT INTO `t_sys_base_region_info` VALUES (168, 162, '滦平县');
INSERT INTO `t_sys_base_region_info` VALUES (169, 162, '隆化县');
INSERT INTO `t_sys_base_region_info` VALUES (170, 162, '丰宁满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (171, 162, '宽城满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (172, 162, '围场满族蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (173, 162, '平泉市');
INSERT INTO `t_sys_base_region_info` VALUES (174, 34, '沧州市');
INSERT INTO `t_sys_base_region_info` VALUES (175, 174, '新华区');
INSERT INTO `t_sys_base_region_info` VALUES (176, 174, '运河区');
INSERT INTO `t_sys_base_region_info` VALUES (177, 174, '沧县');
INSERT INTO `t_sys_base_region_info` VALUES (178, 174, '青县');
INSERT INTO `t_sys_base_region_info` VALUES (179, 174, '东光县');
INSERT INTO `t_sys_base_region_info` VALUES (180, 174, '海兴县');
INSERT INTO `t_sys_base_region_info` VALUES (181, 174, '盐山县');
INSERT INTO `t_sys_base_region_info` VALUES (182, 174, '肃宁县');
INSERT INTO `t_sys_base_region_info` VALUES (183, 174, '南皮县');
INSERT INTO `t_sys_base_region_info` VALUES (184, 174, '吴桥县');
INSERT INTO `t_sys_base_region_info` VALUES (185, 174, '献县');
INSERT INTO `t_sys_base_region_info` VALUES (186, 174, '孟村回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (187, 174, '泊头市');
INSERT INTO `t_sys_base_region_info` VALUES (188, 174, '任丘市');
INSERT INTO `t_sys_base_region_info` VALUES (189, 174, '黄骅市');
INSERT INTO `t_sys_base_region_info` VALUES (190, 174, '河间市');
INSERT INTO `t_sys_base_region_info` VALUES (191, 34, '廊坊市');
INSERT INTO `t_sys_base_region_info` VALUES (192, 191, '安次区');
INSERT INTO `t_sys_base_region_info` VALUES (193, 191, '广阳区');
INSERT INTO `t_sys_base_region_info` VALUES (194, 191, '固安县');
INSERT INTO `t_sys_base_region_info` VALUES (195, 191, '永清县');
INSERT INTO `t_sys_base_region_info` VALUES (196, 191, '香河县');
INSERT INTO `t_sys_base_region_info` VALUES (197, 191, '大城县');
INSERT INTO `t_sys_base_region_info` VALUES (198, 191, '文安县');
INSERT INTO `t_sys_base_region_info` VALUES (199, 191, '大厂回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (200, 191, '霸州市');
INSERT INTO `t_sys_base_region_info` VALUES (201, 191, '三河市');
INSERT INTO `t_sys_base_region_info` VALUES (202, 34, '衡水市');
INSERT INTO `t_sys_base_region_info` VALUES (203, 202, '桃城区');
INSERT INTO `t_sys_base_region_info` VALUES (204, 202, '冀州区');
INSERT INTO `t_sys_base_region_info` VALUES (205, 202, '枣强县');
INSERT INTO `t_sys_base_region_info` VALUES (206, 202, '武邑县');
INSERT INTO `t_sys_base_region_info` VALUES (207, 202, '武强县');
INSERT INTO `t_sys_base_region_info` VALUES (208, 202, '饶阳县');
INSERT INTO `t_sys_base_region_info` VALUES (209, 202, '安平县');
INSERT INTO `t_sys_base_region_info` VALUES (210, 202, '故城县');
INSERT INTO `t_sys_base_region_info` VALUES (211, 202, '景县');
INSERT INTO `t_sys_base_region_info` VALUES (212, 202, '阜城县');
INSERT INTO `t_sys_base_region_info` VALUES (213, 202, '深州市');
INSERT INTO `t_sys_base_region_info` VALUES (214, 0, '山西省');
INSERT INTO `t_sys_base_region_info` VALUES (215, 214, '太原市');
INSERT INTO `t_sys_base_region_info` VALUES (216, 215, '小店区');
INSERT INTO `t_sys_base_region_info` VALUES (217, 215, '迎泽区');
INSERT INTO `t_sys_base_region_info` VALUES (218, 215, '杏花岭区');
INSERT INTO `t_sys_base_region_info` VALUES (219, 215, '尖草坪区');
INSERT INTO `t_sys_base_region_info` VALUES (220, 215, '万柏林区');
INSERT INTO `t_sys_base_region_info` VALUES (221, 215, '晋源区');
INSERT INTO `t_sys_base_region_info` VALUES (222, 215, '清徐县');
INSERT INTO `t_sys_base_region_info` VALUES (223, 215, '阳曲县');
INSERT INTO `t_sys_base_region_info` VALUES (224, 215, '娄烦县');
INSERT INTO `t_sys_base_region_info` VALUES (225, 215, '古交市');
INSERT INTO `t_sys_base_region_info` VALUES (226, 214, '大同市');
INSERT INTO `t_sys_base_region_info` VALUES (227, 226, '城区');
INSERT INTO `t_sys_base_region_info` VALUES (228, 226, '矿区');
INSERT INTO `t_sys_base_region_info` VALUES (229, 226, '南郊区');
INSERT INTO `t_sys_base_region_info` VALUES (230, 226, '新荣区');
INSERT INTO `t_sys_base_region_info` VALUES (231, 226, '阳高县');
INSERT INTO `t_sys_base_region_info` VALUES (232, 226, '天镇县');
INSERT INTO `t_sys_base_region_info` VALUES (233, 226, '广灵县');
INSERT INTO `t_sys_base_region_info` VALUES (234, 226, '灵丘县');
INSERT INTO `t_sys_base_region_info` VALUES (235, 226, '浑源县');
INSERT INTO `t_sys_base_region_info` VALUES (236, 226, '左云县');
INSERT INTO `t_sys_base_region_info` VALUES (237, 226, '大同县');
INSERT INTO `t_sys_base_region_info` VALUES (238, 214, '阳泉市');
INSERT INTO `t_sys_base_region_info` VALUES (239, 238, '城区');
INSERT INTO `t_sys_base_region_info` VALUES (240, 238, '矿区');
INSERT INTO `t_sys_base_region_info` VALUES (241, 238, '郊区');
INSERT INTO `t_sys_base_region_info` VALUES (242, 238, '平定县');
INSERT INTO `t_sys_base_region_info` VALUES (243, 238, '盂县');
INSERT INTO `t_sys_base_region_info` VALUES (244, 214, '长治市');
INSERT INTO `t_sys_base_region_info` VALUES (245, 244, '城区');
INSERT INTO `t_sys_base_region_info` VALUES (246, 244, '郊区');
INSERT INTO `t_sys_base_region_info` VALUES (247, 244, '长治县');
INSERT INTO `t_sys_base_region_info` VALUES (248, 244, '襄垣县');
INSERT INTO `t_sys_base_region_info` VALUES (249, 244, '屯留县');
INSERT INTO `t_sys_base_region_info` VALUES (250, 244, '平顺县');
INSERT INTO `t_sys_base_region_info` VALUES (251, 244, '黎城县');
INSERT INTO `t_sys_base_region_info` VALUES (252, 244, '壶关县');
INSERT INTO `t_sys_base_region_info` VALUES (253, 244, '长子县');
INSERT INTO `t_sys_base_region_info` VALUES (254, 244, '武乡县');
INSERT INTO `t_sys_base_region_info` VALUES (255, 244, '沁县');
INSERT INTO `t_sys_base_region_info` VALUES (256, 244, '沁源县');
INSERT INTO `t_sys_base_region_info` VALUES (257, 244, '潞城市');
INSERT INTO `t_sys_base_region_info` VALUES (258, 214, '晋城市');
INSERT INTO `t_sys_base_region_info` VALUES (259, 258, '城区');
INSERT INTO `t_sys_base_region_info` VALUES (260, 258, '沁水县');
INSERT INTO `t_sys_base_region_info` VALUES (261, 258, '阳城县');
INSERT INTO `t_sys_base_region_info` VALUES (262, 258, '陵川县');
INSERT INTO `t_sys_base_region_info` VALUES (263, 258, '泽州县');
INSERT INTO `t_sys_base_region_info` VALUES (264, 258, '高平市');
INSERT INTO `t_sys_base_region_info` VALUES (265, 214, '朔州市');
INSERT INTO `t_sys_base_region_info` VALUES (266, 265, '朔城区');
INSERT INTO `t_sys_base_region_info` VALUES (267, 265, '平鲁区');
INSERT INTO `t_sys_base_region_info` VALUES (268, 265, '山阴县');
INSERT INTO `t_sys_base_region_info` VALUES (269, 265, '应县');
INSERT INTO `t_sys_base_region_info` VALUES (270, 265, '右玉县');
INSERT INTO `t_sys_base_region_info` VALUES (271, 265, '怀仁县');
INSERT INTO `t_sys_base_region_info` VALUES (272, 214, '晋中市');
INSERT INTO `t_sys_base_region_info` VALUES (273, 272, '榆次区');
INSERT INTO `t_sys_base_region_info` VALUES (274, 272, '榆社县');
INSERT INTO `t_sys_base_region_info` VALUES (275, 272, '左权县');
INSERT INTO `t_sys_base_region_info` VALUES (276, 272, '和顺县');
INSERT INTO `t_sys_base_region_info` VALUES (277, 272, '昔阳县');
INSERT INTO `t_sys_base_region_info` VALUES (278, 272, '寿阳县');
INSERT INTO `t_sys_base_region_info` VALUES (279, 272, '太谷县');
INSERT INTO `t_sys_base_region_info` VALUES (280, 272, '祁县');
INSERT INTO `t_sys_base_region_info` VALUES (281, 272, '平遥县');
INSERT INTO `t_sys_base_region_info` VALUES (282, 272, '灵石县');
INSERT INTO `t_sys_base_region_info` VALUES (283, 272, '介休市');
INSERT INTO `t_sys_base_region_info` VALUES (284, 214, '运城市');
INSERT INTO `t_sys_base_region_info` VALUES (285, 284, '盐湖区');
INSERT INTO `t_sys_base_region_info` VALUES (286, 284, '临猗县');
INSERT INTO `t_sys_base_region_info` VALUES (287, 284, '万荣县');
INSERT INTO `t_sys_base_region_info` VALUES (288, 284, '闻喜县');
INSERT INTO `t_sys_base_region_info` VALUES (289, 284, '稷山县');
INSERT INTO `t_sys_base_region_info` VALUES (290, 284, '新绛县');
INSERT INTO `t_sys_base_region_info` VALUES (291, 284, '绛县');
INSERT INTO `t_sys_base_region_info` VALUES (292, 284, '垣曲县');
INSERT INTO `t_sys_base_region_info` VALUES (293, 284, '夏县');
INSERT INTO `t_sys_base_region_info` VALUES (294, 284, '平陆县');
INSERT INTO `t_sys_base_region_info` VALUES (295, 284, '芮城县');
INSERT INTO `t_sys_base_region_info` VALUES (296, 284, '永济市');
INSERT INTO `t_sys_base_region_info` VALUES (297, 284, '河津市');
INSERT INTO `t_sys_base_region_info` VALUES (298, 214, '忻州市');
INSERT INTO `t_sys_base_region_info` VALUES (299, 298, '忻府区');
INSERT INTO `t_sys_base_region_info` VALUES (300, 298, '定襄县');
INSERT INTO `t_sys_base_region_info` VALUES (301, 298, '五台县');
INSERT INTO `t_sys_base_region_info` VALUES (302, 298, '代县');
INSERT INTO `t_sys_base_region_info` VALUES (303, 298, '繁峙县');
INSERT INTO `t_sys_base_region_info` VALUES (304, 298, '宁武县');
INSERT INTO `t_sys_base_region_info` VALUES (305, 298, '静乐县');
INSERT INTO `t_sys_base_region_info` VALUES (306, 298, '神池县');
INSERT INTO `t_sys_base_region_info` VALUES (307, 298, '五寨县');
INSERT INTO `t_sys_base_region_info` VALUES (308, 298, '岢岚县');
INSERT INTO `t_sys_base_region_info` VALUES (309, 298, '河曲县');
INSERT INTO `t_sys_base_region_info` VALUES (310, 298, '保德县');
INSERT INTO `t_sys_base_region_info` VALUES (311, 298, '偏关县');
INSERT INTO `t_sys_base_region_info` VALUES (312, 298, '原平市');
INSERT INTO `t_sys_base_region_info` VALUES (313, 214, '临汾市');
INSERT INTO `t_sys_base_region_info` VALUES (314, 313, '尧都区');
INSERT INTO `t_sys_base_region_info` VALUES (315, 313, '曲沃县');
INSERT INTO `t_sys_base_region_info` VALUES (316, 313, '翼城县');
INSERT INTO `t_sys_base_region_info` VALUES (317, 313, '襄汾县');
INSERT INTO `t_sys_base_region_info` VALUES (318, 313, '洪洞县');
INSERT INTO `t_sys_base_region_info` VALUES (319, 313, '古县');
INSERT INTO `t_sys_base_region_info` VALUES (320, 313, '安泽县');
INSERT INTO `t_sys_base_region_info` VALUES (321, 313, '浮山县');
INSERT INTO `t_sys_base_region_info` VALUES (322, 313, '吉县');
INSERT INTO `t_sys_base_region_info` VALUES (323, 313, '乡宁县');
INSERT INTO `t_sys_base_region_info` VALUES (324, 313, '大宁县');
INSERT INTO `t_sys_base_region_info` VALUES (325, 313, '隰县');
INSERT INTO `t_sys_base_region_info` VALUES (326, 313, '永和县');
INSERT INTO `t_sys_base_region_info` VALUES (327, 313, '蒲县');
INSERT INTO `t_sys_base_region_info` VALUES (328, 313, '汾西县');
INSERT INTO `t_sys_base_region_info` VALUES (329, 313, '侯马市');
INSERT INTO `t_sys_base_region_info` VALUES (330, 313, '霍州市');
INSERT INTO `t_sys_base_region_info` VALUES (331, 214, '吕梁市');
INSERT INTO `t_sys_base_region_info` VALUES (332, 331, '离石区');
INSERT INTO `t_sys_base_region_info` VALUES (333, 331, '文水县');
INSERT INTO `t_sys_base_region_info` VALUES (334, 331, '交城县');
INSERT INTO `t_sys_base_region_info` VALUES (335, 331, '兴县');
INSERT INTO `t_sys_base_region_info` VALUES (336, 331, '临县');
INSERT INTO `t_sys_base_region_info` VALUES (337, 331, '柳林县');
INSERT INTO `t_sys_base_region_info` VALUES (338, 331, '石楼县');
INSERT INTO `t_sys_base_region_info` VALUES (339, 331, '岚县');
INSERT INTO `t_sys_base_region_info` VALUES (340, 331, '方山县');
INSERT INTO `t_sys_base_region_info` VALUES (341, 331, '中阳县');
INSERT INTO `t_sys_base_region_info` VALUES (342, 331, '交口县');
INSERT INTO `t_sys_base_region_info` VALUES (343, 331, '孝义市');
INSERT INTO `t_sys_base_region_info` VALUES (344, 331, '汾阳市');
INSERT INTO `t_sys_base_region_info` VALUES (345, 0, '内蒙古自治区');
INSERT INTO `t_sys_base_region_info` VALUES (346, 345, '呼和浩特市');
INSERT INTO `t_sys_base_region_info` VALUES (347, 346, '新城区');
INSERT INTO `t_sys_base_region_info` VALUES (348, 346, '回民区');
INSERT INTO `t_sys_base_region_info` VALUES (349, 346, '玉泉区');
INSERT INTO `t_sys_base_region_info` VALUES (350, 346, '赛罕区');
INSERT INTO `t_sys_base_region_info` VALUES (351, 346, '土默特左旗');
INSERT INTO `t_sys_base_region_info` VALUES (352, 346, '托克托县');
INSERT INTO `t_sys_base_region_info` VALUES (353, 346, '和林格尔县');
INSERT INTO `t_sys_base_region_info` VALUES (354, 346, '清水河县');
INSERT INTO `t_sys_base_region_info` VALUES (355, 346, '武川县');
INSERT INTO `t_sys_base_region_info` VALUES (356, 345, '包头市');
INSERT INTO `t_sys_base_region_info` VALUES (357, 356, '东河区');
INSERT INTO `t_sys_base_region_info` VALUES (358, 356, '昆都仑区');
INSERT INTO `t_sys_base_region_info` VALUES (359, 356, '青山区');
INSERT INTO `t_sys_base_region_info` VALUES (360, 356, '石拐区');
INSERT INTO `t_sys_base_region_info` VALUES (361, 356, '白云鄂博矿区');
INSERT INTO `t_sys_base_region_info` VALUES (362, 356, '九原区');
INSERT INTO `t_sys_base_region_info` VALUES (363, 356, '土默特右旗');
INSERT INTO `t_sys_base_region_info` VALUES (364, 356, '固阳县');
INSERT INTO `t_sys_base_region_info` VALUES (365, 356, '达尔罕茂明安联合旗');
INSERT INTO `t_sys_base_region_info` VALUES (366, 345, '乌海市');
INSERT INTO `t_sys_base_region_info` VALUES (367, 366, '海勃湾区');
INSERT INTO `t_sys_base_region_info` VALUES (368, 366, '海南区');
INSERT INTO `t_sys_base_region_info` VALUES (369, 366, '乌达区');
INSERT INTO `t_sys_base_region_info` VALUES (370, 345, '赤峰市');
INSERT INTO `t_sys_base_region_info` VALUES (371, 370, '红山区');
INSERT INTO `t_sys_base_region_info` VALUES (372, 370, '元宝山区');
INSERT INTO `t_sys_base_region_info` VALUES (373, 370, '松山区');
INSERT INTO `t_sys_base_region_info` VALUES (374, 370, '阿鲁科尔沁旗');
INSERT INTO `t_sys_base_region_info` VALUES (375, 370, '巴林左旗');
INSERT INTO `t_sys_base_region_info` VALUES (376, 370, '巴林右旗');
INSERT INTO `t_sys_base_region_info` VALUES (377, 370, '林西县');
INSERT INTO `t_sys_base_region_info` VALUES (378, 370, '克什克腾旗');
INSERT INTO `t_sys_base_region_info` VALUES (379, 370, '翁牛特旗');
INSERT INTO `t_sys_base_region_info` VALUES (380, 370, '喀喇沁旗');
INSERT INTO `t_sys_base_region_info` VALUES (381, 370, '宁城县');
INSERT INTO `t_sys_base_region_info` VALUES (382, 370, '敖汉旗');
INSERT INTO `t_sys_base_region_info` VALUES (383, 345, '通辽市');
INSERT INTO `t_sys_base_region_info` VALUES (384, 383, '科尔沁区');
INSERT INTO `t_sys_base_region_info` VALUES (385, 383, '科尔沁左翼中旗');
INSERT INTO `t_sys_base_region_info` VALUES (386, 383, '科尔沁左翼后旗');
INSERT INTO `t_sys_base_region_info` VALUES (387, 383, '开鲁县');
INSERT INTO `t_sys_base_region_info` VALUES (388, 383, '库伦旗');
INSERT INTO `t_sys_base_region_info` VALUES (389, 383, '奈曼旗');
INSERT INTO `t_sys_base_region_info` VALUES (390, 383, '扎鲁特旗');
INSERT INTO `t_sys_base_region_info` VALUES (391, 383, '霍林郭勒市');
INSERT INTO `t_sys_base_region_info` VALUES (392, 345, '鄂尔多斯市');
INSERT INTO `t_sys_base_region_info` VALUES (393, 392, '东胜区');
INSERT INTO `t_sys_base_region_info` VALUES (394, 392, '康巴什区');
INSERT INTO `t_sys_base_region_info` VALUES (395, 392, '达拉特旗');
INSERT INTO `t_sys_base_region_info` VALUES (396, 392, '准格尔旗');
INSERT INTO `t_sys_base_region_info` VALUES (397, 392, '鄂托克前旗');
INSERT INTO `t_sys_base_region_info` VALUES (398, 392, '鄂托克旗');
INSERT INTO `t_sys_base_region_info` VALUES (399, 392, '杭锦旗');
INSERT INTO `t_sys_base_region_info` VALUES (400, 392, '乌审旗');
INSERT INTO `t_sys_base_region_info` VALUES (401, 392, '伊金霍洛旗');
INSERT INTO `t_sys_base_region_info` VALUES (402, 345, '呼伦贝尔市');
INSERT INTO `t_sys_base_region_info` VALUES (403, 402, '海拉尔区');
INSERT INTO `t_sys_base_region_info` VALUES (404, 402, '扎赉诺尔区');
INSERT INTO `t_sys_base_region_info` VALUES (405, 402, '阿荣旗');
INSERT INTO `t_sys_base_region_info` VALUES (406, 402, '莫力达瓦达斡尔族自治旗');
INSERT INTO `t_sys_base_region_info` VALUES (407, 402, '鄂伦春自治旗');
INSERT INTO `t_sys_base_region_info` VALUES (408, 402, '鄂温克族自治旗');
INSERT INTO `t_sys_base_region_info` VALUES (409, 402, '陈巴尔虎旗');
INSERT INTO `t_sys_base_region_info` VALUES (410, 402, '新巴尔虎左旗');
INSERT INTO `t_sys_base_region_info` VALUES (411, 402, '新巴尔虎右旗');
INSERT INTO `t_sys_base_region_info` VALUES (412, 402, '满洲里市');
INSERT INTO `t_sys_base_region_info` VALUES (413, 402, '牙克石市');
INSERT INTO `t_sys_base_region_info` VALUES (414, 402, '扎兰屯市');
INSERT INTO `t_sys_base_region_info` VALUES (415, 402, '额尔古纳市');
INSERT INTO `t_sys_base_region_info` VALUES (416, 402, '根河市');
INSERT INTO `t_sys_base_region_info` VALUES (417, 345, '巴彦淖尔市');
INSERT INTO `t_sys_base_region_info` VALUES (418, 417, '临河区');
INSERT INTO `t_sys_base_region_info` VALUES (419, 417, '五原县');
INSERT INTO `t_sys_base_region_info` VALUES (420, 417, '磴口县');
INSERT INTO `t_sys_base_region_info` VALUES (421, 417, '乌拉特前旗');
INSERT INTO `t_sys_base_region_info` VALUES (422, 417, '乌拉特中旗');
INSERT INTO `t_sys_base_region_info` VALUES (423, 417, '乌拉特后旗');
INSERT INTO `t_sys_base_region_info` VALUES (424, 417, '杭锦后旗');
INSERT INTO `t_sys_base_region_info` VALUES (425, 345, '乌兰察布市');
INSERT INTO `t_sys_base_region_info` VALUES (426, 425, '集宁区');
INSERT INTO `t_sys_base_region_info` VALUES (427, 425, '卓资县');
INSERT INTO `t_sys_base_region_info` VALUES (428, 425, '化德县');
INSERT INTO `t_sys_base_region_info` VALUES (429, 425, '商都县');
INSERT INTO `t_sys_base_region_info` VALUES (430, 425, '兴和县');
INSERT INTO `t_sys_base_region_info` VALUES (431, 425, '凉城县');
INSERT INTO `t_sys_base_region_info` VALUES (432, 425, '察哈尔右翼前旗');
INSERT INTO `t_sys_base_region_info` VALUES (433, 425, '察哈尔右翼中旗');
INSERT INTO `t_sys_base_region_info` VALUES (434, 425, '察哈尔右翼后旗');
INSERT INTO `t_sys_base_region_info` VALUES (435, 425, '四子王旗');
INSERT INTO `t_sys_base_region_info` VALUES (436, 425, '丰镇市');
INSERT INTO `t_sys_base_region_info` VALUES (437, 345, '兴安盟');
INSERT INTO `t_sys_base_region_info` VALUES (438, 437, '乌兰浩特市');
INSERT INTO `t_sys_base_region_info` VALUES (439, 437, '阿尔山市');
INSERT INTO `t_sys_base_region_info` VALUES (440, 437, '科尔沁右翼前旗');
INSERT INTO `t_sys_base_region_info` VALUES (441, 437, '科尔沁右翼中旗');
INSERT INTO `t_sys_base_region_info` VALUES (442, 437, '扎赉特旗');
INSERT INTO `t_sys_base_region_info` VALUES (443, 437, '突泉县');
INSERT INTO `t_sys_base_region_info` VALUES (444, 345, '锡林郭勒盟');
INSERT INTO `t_sys_base_region_info` VALUES (445, 444, '二连浩特市');
INSERT INTO `t_sys_base_region_info` VALUES (446, 444, '锡林浩特市');
INSERT INTO `t_sys_base_region_info` VALUES (447, 444, '阿巴嘎旗');
INSERT INTO `t_sys_base_region_info` VALUES (448, 444, '苏尼特左旗');
INSERT INTO `t_sys_base_region_info` VALUES (449, 444, '苏尼特右旗');
INSERT INTO `t_sys_base_region_info` VALUES (450, 444, '东乌珠穆沁旗');
INSERT INTO `t_sys_base_region_info` VALUES (451, 444, '西乌珠穆沁旗');
INSERT INTO `t_sys_base_region_info` VALUES (452, 444, '太仆寺旗');
INSERT INTO `t_sys_base_region_info` VALUES (453, 444, '镶黄旗');
INSERT INTO `t_sys_base_region_info` VALUES (454, 444, '正镶白旗');
INSERT INTO `t_sys_base_region_info` VALUES (455, 444, '正蓝旗');
INSERT INTO `t_sys_base_region_info` VALUES (456, 444, '多伦县');
INSERT INTO `t_sys_base_region_info` VALUES (457, 345, '阿拉善盟');
INSERT INTO `t_sys_base_region_info` VALUES (458, 457, '阿拉善左旗');
INSERT INTO `t_sys_base_region_info` VALUES (459, 457, '阿拉善右旗');
INSERT INTO `t_sys_base_region_info` VALUES (460, 457, '额济纳旗');
INSERT INTO `t_sys_base_region_info` VALUES (461, 0, '辽宁省');
INSERT INTO `t_sys_base_region_info` VALUES (462, 461, '沈阳市');
INSERT INTO `t_sys_base_region_info` VALUES (463, 462, '和平区');
INSERT INTO `t_sys_base_region_info` VALUES (464, 462, '沈河区');
INSERT INTO `t_sys_base_region_info` VALUES (465, 462, '大东区');
INSERT INTO `t_sys_base_region_info` VALUES (466, 462, '皇姑区');
INSERT INTO `t_sys_base_region_info` VALUES (467, 462, '铁西区');
INSERT INTO `t_sys_base_region_info` VALUES (468, 462, '苏家屯区');
INSERT INTO `t_sys_base_region_info` VALUES (469, 462, '浑南区');
INSERT INTO `t_sys_base_region_info` VALUES (470, 462, '沈北新区');
INSERT INTO `t_sys_base_region_info` VALUES (471, 462, '于洪区');
INSERT INTO `t_sys_base_region_info` VALUES (472, 462, '辽中区');
INSERT INTO `t_sys_base_region_info` VALUES (473, 462, '康平县');
INSERT INTO `t_sys_base_region_info` VALUES (474, 462, '法库县');
INSERT INTO `t_sys_base_region_info` VALUES (475, 462, '新民市');
INSERT INTO `t_sys_base_region_info` VALUES (476, 461, '大连市');
INSERT INTO `t_sys_base_region_info` VALUES (477, 476, '中山区');
INSERT INTO `t_sys_base_region_info` VALUES (478, 476, '西岗区');
INSERT INTO `t_sys_base_region_info` VALUES (479, 476, '沙河口区');
INSERT INTO `t_sys_base_region_info` VALUES (480, 476, '甘井子区');
INSERT INTO `t_sys_base_region_info` VALUES (481, 476, '旅顺口区');
INSERT INTO `t_sys_base_region_info` VALUES (482, 476, '金州区');
INSERT INTO `t_sys_base_region_info` VALUES (483, 476, '普兰店区');
INSERT INTO `t_sys_base_region_info` VALUES (484, 476, '长海县');
INSERT INTO `t_sys_base_region_info` VALUES (485, 476, '瓦房店市');
INSERT INTO `t_sys_base_region_info` VALUES (486, 476, '庄河市');
INSERT INTO `t_sys_base_region_info` VALUES (487, 461, '鞍山市');
INSERT INTO `t_sys_base_region_info` VALUES (488, 487, '铁东区');
INSERT INTO `t_sys_base_region_info` VALUES (489, 487, '铁西区');
INSERT INTO `t_sys_base_region_info` VALUES (490, 487, '立山区');
INSERT INTO `t_sys_base_region_info` VALUES (491, 487, '千山区');
INSERT INTO `t_sys_base_region_info` VALUES (492, 487, '台安县');
INSERT INTO `t_sys_base_region_info` VALUES (493, 487, '岫岩满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (494, 487, '海城市');
INSERT INTO `t_sys_base_region_info` VALUES (495, 461, '抚顺市');
INSERT INTO `t_sys_base_region_info` VALUES (496, 495, '新抚区');
INSERT INTO `t_sys_base_region_info` VALUES (497, 495, '东洲区');
INSERT INTO `t_sys_base_region_info` VALUES (498, 495, '望花区');
INSERT INTO `t_sys_base_region_info` VALUES (499, 495, '顺城区');
INSERT INTO `t_sys_base_region_info` VALUES (500, 495, '抚顺县');
INSERT INTO `t_sys_base_region_info` VALUES (501, 495, '新宾满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (502, 495, '清原满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (503, 461, '本溪市');
INSERT INTO `t_sys_base_region_info` VALUES (504, 503, '平山区');
INSERT INTO `t_sys_base_region_info` VALUES (505, 503, '溪湖区');
INSERT INTO `t_sys_base_region_info` VALUES (506, 503, '明山区');
INSERT INTO `t_sys_base_region_info` VALUES (507, 503, '南芬区');
INSERT INTO `t_sys_base_region_info` VALUES (508, 503, '本溪满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (509, 503, '桓仁满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (510, 461, '丹东市');
INSERT INTO `t_sys_base_region_info` VALUES (511, 510, '元宝区');
INSERT INTO `t_sys_base_region_info` VALUES (512, 510, '振兴区');
INSERT INTO `t_sys_base_region_info` VALUES (513, 510, '振安区');
INSERT INTO `t_sys_base_region_info` VALUES (514, 510, '宽甸满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (515, 510, '东港市');
INSERT INTO `t_sys_base_region_info` VALUES (516, 510, '凤城市');
INSERT INTO `t_sys_base_region_info` VALUES (517, 461, '锦州市');
INSERT INTO `t_sys_base_region_info` VALUES (518, 517, '古塔区');
INSERT INTO `t_sys_base_region_info` VALUES (519, 517, '凌河区');
INSERT INTO `t_sys_base_region_info` VALUES (520, 517, '太和区');
INSERT INTO `t_sys_base_region_info` VALUES (521, 517, '黑山县');
INSERT INTO `t_sys_base_region_info` VALUES (522, 517, '义县');
INSERT INTO `t_sys_base_region_info` VALUES (523, 517, '凌海市');
INSERT INTO `t_sys_base_region_info` VALUES (524, 517, '北镇市');
INSERT INTO `t_sys_base_region_info` VALUES (525, 461, '营口市');
INSERT INTO `t_sys_base_region_info` VALUES (526, 525, '站前区');
INSERT INTO `t_sys_base_region_info` VALUES (527, 525, '西市区');
INSERT INTO `t_sys_base_region_info` VALUES (528, 525, '鲅鱼圈区');
INSERT INTO `t_sys_base_region_info` VALUES (529, 525, '老边区');
INSERT INTO `t_sys_base_region_info` VALUES (530, 525, '盖州市');
INSERT INTO `t_sys_base_region_info` VALUES (531, 525, '大石桥市');
INSERT INTO `t_sys_base_region_info` VALUES (532, 461, '阜新市');
INSERT INTO `t_sys_base_region_info` VALUES (533, 532, '海州区');
INSERT INTO `t_sys_base_region_info` VALUES (534, 532, '新邱区');
INSERT INTO `t_sys_base_region_info` VALUES (535, 532, '太平区');
INSERT INTO `t_sys_base_region_info` VALUES (536, 532, '清河门区');
INSERT INTO `t_sys_base_region_info` VALUES (537, 532, '细河区');
INSERT INTO `t_sys_base_region_info` VALUES (538, 532, '阜新蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (539, 532, '彰武县');
INSERT INTO `t_sys_base_region_info` VALUES (540, 461, '辽阳市');
INSERT INTO `t_sys_base_region_info` VALUES (541, 540, '白塔区');
INSERT INTO `t_sys_base_region_info` VALUES (542, 540, '文圣区');
INSERT INTO `t_sys_base_region_info` VALUES (543, 540, '宏伟区');
INSERT INTO `t_sys_base_region_info` VALUES (544, 540, '弓长岭区');
INSERT INTO `t_sys_base_region_info` VALUES (545, 540, '太子河区');
INSERT INTO `t_sys_base_region_info` VALUES (546, 540, '辽阳县');
INSERT INTO `t_sys_base_region_info` VALUES (547, 540, '灯塔市');
INSERT INTO `t_sys_base_region_info` VALUES (548, 461, '盘锦市');
INSERT INTO `t_sys_base_region_info` VALUES (549, 548, '双台子区');
INSERT INTO `t_sys_base_region_info` VALUES (550, 548, '兴隆台区');
INSERT INTO `t_sys_base_region_info` VALUES (551, 548, '大洼区');
INSERT INTO `t_sys_base_region_info` VALUES (552, 548, '盘山县');
INSERT INTO `t_sys_base_region_info` VALUES (553, 461, '铁岭市');
INSERT INTO `t_sys_base_region_info` VALUES (554, 553, '银州区');
INSERT INTO `t_sys_base_region_info` VALUES (555, 553, '清河区');
INSERT INTO `t_sys_base_region_info` VALUES (556, 553, '铁岭县');
INSERT INTO `t_sys_base_region_info` VALUES (557, 553, '西丰县');
INSERT INTO `t_sys_base_region_info` VALUES (558, 553, '昌图县');
INSERT INTO `t_sys_base_region_info` VALUES (559, 553, '调兵山市');
INSERT INTO `t_sys_base_region_info` VALUES (560, 553, '开原市');
INSERT INTO `t_sys_base_region_info` VALUES (561, 461, '朝阳市');
INSERT INTO `t_sys_base_region_info` VALUES (562, 561, '双塔区');
INSERT INTO `t_sys_base_region_info` VALUES (563, 561, '龙城区');
INSERT INTO `t_sys_base_region_info` VALUES (564, 561, '朝阳县');
INSERT INTO `t_sys_base_region_info` VALUES (565, 561, '建平县');
INSERT INTO `t_sys_base_region_info` VALUES (566, 561, '喀喇沁左翼蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (567, 561, '北票市');
INSERT INTO `t_sys_base_region_info` VALUES (568, 561, '凌源市');
INSERT INTO `t_sys_base_region_info` VALUES (569, 461, '葫芦岛市');
INSERT INTO `t_sys_base_region_info` VALUES (570, 569, '连山区');
INSERT INTO `t_sys_base_region_info` VALUES (571, 569, '龙港区');
INSERT INTO `t_sys_base_region_info` VALUES (572, 569, '南票区');
INSERT INTO `t_sys_base_region_info` VALUES (573, 569, '绥中县');
INSERT INTO `t_sys_base_region_info` VALUES (574, 569, '建昌县');
INSERT INTO `t_sys_base_region_info` VALUES (575, 569, '兴城市');
INSERT INTO `t_sys_base_region_info` VALUES (576, 0, '吉林省');
INSERT INTO `t_sys_base_region_info` VALUES (577, 576, '长春市');
INSERT INTO `t_sys_base_region_info` VALUES (578, 577, '南关区');
INSERT INTO `t_sys_base_region_info` VALUES (579, 577, '宽城区');
INSERT INTO `t_sys_base_region_info` VALUES (580, 577, '朝阳区');
INSERT INTO `t_sys_base_region_info` VALUES (581, 577, '二道区');
INSERT INTO `t_sys_base_region_info` VALUES (582, 577, '绿园区');
INSERT INTO `t_sys_base_region_info` VALUES (583, 577, '双阳区');
INSERT INTO `t_sys_base_region_info` VALUES (584, 577, '九台区');
INSERT INTO `t_sys_base_region_info` VALUES (585, 577, '农安县');
INSERT INTO `t_sys_base_region_info` VALUES (586, 576, '吉林市');
INSERT INTO `t_sys_base_region_info` VALUES (587, 586, '昌邑区');
INSERT INTO `t_sys_base_region_info` VALUES (588, 586, '龙潭区');
INSERT INTO `t_sys_base_region_info` VALUES (589, 586, '船营区');
INSERT INTO `t_sys_base_region_info` VALUES (590, 586, '丰满区');
INSERT INTO `t_sys_base_region_info` VALUES (591, 586, '永吉县');
INSERT INTO `t_sys_base_region_info` VALUES (592, 586, '蛟河市');
INSERT INTO `t_sys_base_region_info` VALUES (593, 586, '桦甸市');
INSERT INTO `t_sys_base_region_info` VALUES (594, 586, '舒兰市');
INSERT INTO `t_sys_base_region_info` VALUES (595, 586, '磐石市');
INSERT INTO `t_sys_base_region_info` VALUES (596, 576, '四平市');
INSERT INTO `t_sys_base_region_info` VALUES (597, 596, '铁西区');
INSERT INTO `t_sys_base_region_info` VALUES (598, 596, '铁东区');
INSERT INTO `t_sys_base_region_info` VALUES (599, 596, '梨树县');
INSERT INTO `t_sys_base_region_info` VALUES (600, 596, '伊通满族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (601, 596, '公主岭市');
INSERT INTO `t_sys_base_region_info` VALUES (602, 596, '双辽市');
INSERT INTO `t_sys_base_region_info` VALUES (603, 576, '辽源市');
INSERT INTO `t_sys_base_region_info` VALUES (604, 603, '龙山区');
INSERT INTO `t_sys_base_region_info` VALUES (605, 603, '西安区');
INSERT INTO `t_sys_base_region_info` VALUES (606, 603, '东丰县');
INSERT INTO `t_sys_base_region_info` VALUES (607, 603, '东辽县');
INSERT INTO `t_sys_base_region_info` VALUES (608, 576, '通化市');
INSERT INTO `t_sys_base_region_info` VALUES (609, 608, '东昌区');
INSERT INTO `t_sys_base_region_info` VALUES (610, 608, '二道江区');
INSERT INTO `t_sys_base_region_info` VALUES (611, 608, '通化县');
INSERT INTO `t_sys_base_region_info` VALUES (612, 608, '辉南县');
INSERT INTO `t_sys_base_region_info` VALUES (613, 608, '柳河县');
INSERT INTO `t_sys_base_region_info` VALUES (614, 608, '梅河口市');
INSERT INTO `t_sys_base_region_info` VALUES (615, 608, '集安市');
INSERT INTO `t_sys_base_region_info` VALUES (616, 576, '白山市');
INSERT INTO `t_sys_base_region_info` VALUES (617, 616, '浑江区');
INSERT INTO `t_sys_base_region_info` VALUES (618, 616, '江源区');
INSERT INTO `t_sys_base_region_info` VALUES (619, 616, '抚松县');
INSERT INTO `t_sys_base_region_info` VALUES (620, 616, '靖宇县');
INSERT INTO `t_sys_base_region_info` VALUES (621, 616, '长白朝鲜族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (622, 616, '临江市');
INSERT INTO `t_sys_base_region_info` VALUES (623, 576, '松原市');
INSERT INTO `t_sys_base_region_info` VALUES (624, 623, '宁江区');
INSERT INTO `t_sys_base_region_info` VALUES (625, 623, '前郭尔罗斯蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (626, 623, '长岭县');
INSERT INTO `t_sys_base_region_info` VALUES (627, 623, '乾安县');
INSERT INTO `t_sys_base_region_info` VALUES (628, 623, '扶余市');
INSERT INTO `t_sys_base_region_info` VALUES (629, 576, '白城市');
INSERT INTO `t_sys_base_region_info` VALUES (630, 629, '洮北区');
INSERT INTO `t_sys_base_region_info` VALUES (631, 629, '镇赉县');
INSERT INTO `t_sys_base_region_info` VALUES (632, 629, '通榆县');
INSERT INTO `t_sys_base_region_info` VALUES (633, 629, '洮南市');
INSERT INTO `t_sys_base_region_info` VALUES (634, 629, '大安市');
INSERT INTO `t_sys_base_region_info` VALUES (635, 576, '延边朝鲜族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (636, 635, '延吉市');
INSERT INTO `t_sys_base_region_info` VALUES (637, 635, '图们市');
INSERT INTO `t_sys_base_region_info` VALUES (638, 635, '敦化市');
INSERT INTO `t_sys_base_region_info` VALUES (639, 635, '珲春市');
INSERT INTO `t_sys_base_region_info` VALUES (640, 635, '龙井市');
INSERT INTO `t_sys_base_region_info` VALUES (641, 635, '和龙市');
INSERT INTO `t_sys_base_region_info` VALUES (642, 635, '汪清县');
INSERT INTO `t_sys_base_region_info` VALUES (643, 635, '安图县');
INSERT INTO `t_sys_base_region_info` VALUES (644, 0, '黑龙江省');
INSERT INTO `t_sys_base_region_info` VALUES (645, 644, '哈尔滨市');
INSERT INTO `t_sys_base_region_info` VALUES (646, 645, '道里区');
INSERT INTO `t_sys_base_region_info` VALUES (647, 645, '南岗区');
INSERT INTO `t_sys_base_region_info` VALUES (648, 645, '道外区');
INSERT INTO `t_sys_base_region_info` VALUES (649, 645, '平房区');
INSERT INTO `t_sys_base_region_info` VALUES (650, 645, '松北区');
INSERT INTO `t_sys_base_region_info` VALUES (651, 645, '香坊区');
INSERT INTO `t_sys_base_region_info` VALUES (652, 645, '呼兰区');
INSERT INTO `t_sys_base_region_info` VALUES (653, 645, '阿城区');
INSERT INTO `t_sys_base_region_info` VALUES (654, 645, '双城区');
INSERT INTO `t_sys_base_region_info` VALUES (655, 645, '依兰县');
INSERT INTO `t_sys_base_region_info` VALUES (656, 645, '方正县');
INSERT INTO `t_sys_base_region_info` VALUES (657, 645, '宾县');
INSERT INTO `t_sys_base_region_info` VALUES (658, 645, '巴彦县');
INSERT INTO `t_sys_base_region_info` VALUES (659, 645, '木兰县');
INSERT INTO `t_sys_base_region_info` VALUES (660, 645, '通河县');
INSERT INTO `t_sys_base_region_info` VALUES (661, 645, '延寿县');
INSERT INTO `t_sys_base_region_info` VALUES (662, 645, '尚志市');
INSERT INTO `t_sys_base_region_info` VALUES (663, 645, '五常市');
INSERT INTO `t_sys_base_region_info` VALUES (664, 644, '齐齐哈尔市');
INSERT INTO `t_sys_base_region_info` VALUES (665, 664, '龙沙区');
INSERT INTO `t_sys_base_region_info` VALUES (666, 664, '建华区');
INSERT INTO `t_sys_base_region_info` VALUES (667, 664, '铁锋区');
INSERT INTO `t_sys_base_region_info` VALUES (668, 664, '昂昂溪区');
INSERT INTO `t_sys_base_region_info` VALUES (669, 664, '富拉尔基区');
INSERT INTO `t_sys_base_region_info` VALUES (670, 664, '碾子山区');
INSERT INTO `t_sys_base_region_info` VALUES (671, 664, '梅里斯达斡尔族区');
INSERT INTO `t_sys_base_region_info` VALUES (672, 664, '龙江县');
INSERT INTO `t_sys_base_region_info` VALUES (673, 664, '依安县');
INSERT INTO `t_sys_base_region_info` VALUES (674, 664, '泰来县');
INSERT INTO `t_sys_base_region_info` VALUES (675, 664, '甘南县');
INSERT INTO `t_sys_base_region_info` VALUES (676, 664, '富裕县');
INSERT INTO `t_sys_base_region_info` VALUES (677, 664, '克山县');
INSERT INTO `t_sys_base_region_info` VALUES (678, 664, '克东县');
INSERT INTO `t_sys_base_region_info` VALUES (679, 664, '拜泉县');
INSERT INTO `t_sys_base_region_info` VALUES (680, 664, '讷河市');
INSERT INTO `t_sys_base_region_info` VALUES (681, 644, '鸡西市');
INSERT INTO `t_sys_base_region_info` VALUES (682, 681, '鸡冠区');
INSERT INTO `t_sys_base_region_info` VALUES (683, 681, '恒山区');
INSERT INTO `t_sys_base_region_info` VALUES (684, 681, '滴道区');
INSERT INTO `t_sys_base_region_info` VALUES (685, 681, '梨树区');
INSERT INTO `t_sys_base_region_info` VALUES (686, 681, '城子河区');
INSERT INTO `t_sys_base_region_info` VALUES (687, 681, '麻山区');
INSERT INTO `t_sys_base_region_info` VALUES (688, 681, '鸡东县');
INSERT INTO `t_sys_base_region_info` VALUES (689, 681, '虎林市');
INSERT INTO `t_sys_base_region_info` VALUES (690, 681, '密山市');
INSERT INTO `t_sys_base_region_info` VALUES (691, 644, '鹤岗市');
INSERT INTO `t_sys_base_region_info` VALUES (692, 691, '向阳区');
INSERT INTO `t_sys_base_region_info` VALUES (693, 691, '工农区');
INSERT INTO `t_sys_base_region_info` VALUES (694, 691, '南山区');
INSERT INTO `t_sys_base_region_info` VALUES (695, 691, '兴安区');
INSERT INTO `t_sys_base_region_info` VALUES (696, 691, '东山区');
INSERT INTO `t_sys_base_region_info` VALUES (697, 691, '兴山区');
INSERT INTO `t_sys_base_region_info` VALUES (698, 691, '萝北县');
INSERT INTO `t_sys_base_region_info` VALUES (699, 691, '绥滨县');
INSERT INTO `t_sys_base_region_info` VALUES (700, 644, '双鸭山市');
INSERT INTO `t_sys_base_region_info` VALUES (701, 700, '尖山区');
INSERT INTO `t_sys_base_region_info` VALUES (702, 700, '岭东区');
INSERT INTO `t_sys_base_region_info` VALUES (703, 700, '四方台区');
INSERT INTO `t_sys_base_region_info` VALUES (704, 700, '宝山区');
INSERT INTO `t_sys_base_region_info` VALUES (705, 700, '集贤县');
INSERT INTO `t_sys_base_region_info` VALUES (706, 700, '友谊县');
INSERT INTO `t_sys_base_region_info` VALUES (707, 700, '宝清县');
INSERT INTO `t_sys_base_region_info` VALUES (708, 700, '饶河县');
INSERT INTO `t_sys_base_region_info` VALUES (709, 644, '大庆市');
INSERT INTO `t_sys_base_region_info` VALUES (710, 709, '萨尔图区');
INSERT INTO `t_sys_base_region_info` VALUES (711, 709, '龙凤区');
INSERT INTO `t_sys_base_region_info` VALUES (712, 709, '让胡路区');
INSERT INTO `t_sys_base_region_info` VALUES (713, 709, '红岗区');
INSERT INTO `t_sys_base_region_info` VALUES (714, 709, '大同区');
INSERT INTO `t_sys_base_region_info` VALUES (715, 709, '肇州县');
INSERT INTO `t_sys_base_region_info` VALUES (716, 709, '肇源县');
INSERT INTO `t_sys_base_region_info` VALUES (717, 709, '林甸县');
INSERT INTO `t_sys_base_region_info` VALUES (718, 709, '杜尔伯特蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (719, 644, '伊春市');
INSERT INTO `t_sys_base_region_info` VALUES (720, 719, '伊春区');
INSERT INTO `t_sys_base_region_info` VALUES (721, 719, '南岔区');
INSERT INTO `t_sys_base_region_info` VALUES (722, 719, '友好区');
INSERT INTO `t_sys_base_region_info` VALUES (723, 719, '西林区');
INSERT INTO `t_sys_base_region_info` VALUES (724, 719, '翠峦区');
INSERT INTO `t_sys_base_region_info` VALUES (725, 719, '新青区');
INSERT INTO `t_sys_base_region_info` VALUES (726, 719, '美溪区');
INSERT INTO `t_sys_base_region_info` VALUES (727, 719, '金山屯区');
INSERT INTO `t_sys_base_region_info` VALUES (728, 719, '五营区');
INSERT INTO `t_sys_base_region_info` VALUES (729, 719, '乌马河区');
INSERT INTO `t_sys_base_region_info` VALUES (730, 719, '汤旺河区');
INSERT INTO `t_sys_base_region_info` VALUES (731, 719, '带岭区');
INSERT INTO `t_sys_base_region_info` VALUES (732, 719, '乌伊岭区');
INSERT INTO `t_sys_base_region_info` VALUES (733, 719, '红星区');
INSERT INTO `t_sys_base_region_info` VALUES (734, 719, '上甘岭区');
INSERT INTO `t_sys_base_region_info` VALUES (735, 719, '嘉荫县');
INSERT INTO `t_sys_base_region_info` VALUES (736, 719, '铁力市');
INSERT INTO `t_sys_base_region_info` VALUES (737, 644, '佳木斯市');
INSERT INTO `t_sys_base_region_info` VALUES (738, 737, '向阳区');
INSERT INTO `t_sys_base_region_info` VALUES (739, 737, '前进区');
INSERT INTO `t_sys_base_region_info` VALUES (740, 737, '东风区');
INSERT INTO `t_sys_base_region_info` VALUES (741, 737, '郊区');
INSERT INTO `t_sys_base_region_info` VALUES (742, 737, '桦南县');
INSERT INTO `t_sys_base_region_info` VALUES (743, 737, '桦川县');
INSERT INTO `t_sys_base_region_info` VALUES (744, 737, '汤原县');
INSERT INTO `t_sys_base_region_info` VALUES (745, 737, '同江市');
INSERT INTO `t_sys_base_region_info` VALUES (746, 737, '富锦市');
INSERT INTO `t_sys_base_region_info` VALUES (747, 737, '抚远市');
INSERT INTO `t_sys_base_region_info` VALUES (748, 644, '七台河市');
INSERT INTO `t_sys_base_region_info` VALUES (749, 748, '新兴区');
INSERT INTO `t_sys_base_region_info` VALUES (750, 748, '桃山区');
INSERT INTO `t_sys_base_region_info` VALUES (751, 748, '茄子河区');
INSERT INTO `t_sys_base_region_info` VALUES (752, 748, '勃利县');
INSERT INTO `t_sys_base_region_info` VALUES (753, 644, '牡丹江市');
INSERT INTO `t_sys_base_region_info` VALUES (754, 753, '东安区');
INSERT INTO `t_sys_base_region_info` VALUES (755, 753, '阳明区');
INSERT INTO `t_sys_base_region_info` VALUES (756, 753, '爱民区');
INSERT INTO `t_sys_base_region_info` VALUES (757, 753, '西安区');
INSERT INTO `t_sys_base_region_info` VALUES (758, 753, '林口县');
INSERT INTO `t_sys_base_region_info` VALUES (759, 753, '绥芬河市');
INSERT INTO `t_sys_base_region_info` VALUES (760, 753, '海林市');
INSERT INTO `t_sys_base_region_info` VALUES (761, 753, '宁安市');
INSERT INTO `t_sys_base_region_info` VALUES (762, 753, '穆棱市');
INSERT INTO `t_sys_base_region_info` VALUES (763, 753, '东宁市');
INSERT INTO `t_sys_base_region_info` VALUES (764, 644, '黑河市');
INSERT INTO `t_sys_base_region_info` VALUES (765, 764, '爱辉区');
INSERT INTO `t_sys_base_region_info` VALUES (766, 764, '嫩江县');
INSERT INTO `t_sys_base_region_info` VALUES (767, 764, '逊克县');
INSERT INTO `t_sys_base_region_info` VALUES (768, 764, '孙吴县');
INSERT INTO `t_sys_base_region_info` VALUES (769, 764, '北安市');
INSERT INTO `t_sys_base_region_info` VALUES (770, 764, '五大连池市');
INSERT INTO `t_sys_base_region_info` VALUES (771, 644, '绥化市');
INSERT INTO `t_sys_base_region_info` VALUES (772, 771, '北林区');
INSERT INTO `t_sys_base_region_info` VALUES (773, 771, '望奎县');
INSERT INTO `t_sys_base_region_info` VALUES (774, 771, '兰西县');
INSERT INTO `t_sys_base_region_info` VALUES (775, 771, '青冈县');
INSERT INTO `t_sys_base_region_info` VALUES (776, 771, '庆安县');
INSERT INTO `t_sys_base_region_info` VALUES (777, 771, '明水县');
INSERT INTO `t_sys_base_region_info` VALUES (778, 771, '绥棱县');
INSERT INTO `t_sys_base_region_info` VALUES (779, 771, '安达市');
INSERT INTO `t_sys_base_region_info` VALUES (780, 771, '肇东市');
INSERT INTO `t_sys_base_region_info` VALUES (781, 771, '海伦市');
INSERT INTO `t_sys_base_region_info` VALUES (782, 644, '大兴安岭地区');
INSERT INTO `t_sys_base_region_info` VALUES (783, 782, '加格达奇区');
INSERT INTO `t_sys_base_region_info` VALUES (784, 782, '呼玛县');
INSERT INTO `t_sys_base_region_info` VALUES (785, 782, '塔河县');
INSERT INTO `t_sys_base_region_info` VALUES (786, 782, '漠河县');
INSERT INTO `t_sys_base_region_info` VALUES (787, 0, '上海市');
INSERT INTO `t_sys_base_region_info` VALUES (788, 787, '上海城区');
INSERT INTO `t_sys_base_region_info` VALUES (789, 788, '黄浦区');
INSERT INTO `t_sys_base_region_info` VALUES (790, 788, '徐汇区');
INSERT INTO `t_sys_base_region_info` VALUES (791, 788, '长宁区');
INSERT INTO `t_sys_base_region_info` VALUES (792, 788, '静安区');
INSERT INTO `t_sys_base_region_info` VALUES (793, 788, '普陀区');
INSERT INTO `t_sys_base_region_info` VALUES (794, 788, '虹口区');
INSERT INTO `t_sys_base_region_info` VALUES (795, 788, '杨浦区');
INSERT INTO `t_sys_base_region_info` VALUES (796, 788, '闵行区');
INSERT INTO `t_sys_base_region_info` VALUES (797, 788, '宝山区');
INSERT INTO `t_sys_base_region_info` VALUES (798, 788, '嘉定区');
INSERT INTO `t_sys_base_region_info` VALUES (799, 788, '浦东新区');
INSERT INTO `t_sys_base_region_info` VALUES (800, 788, '金山区');
INSERT INTO `t_sys_base_region_info` VALUES (801, 788, '松江区');
INSERT INTO `t_sys_base_region_info` VALUES (802, 788, '青浦区');
INSERT INTO `t_sys_base_region_info` VALUES (803, 788, '奉贤区');
INSERT INTO `t_sys_base_region_info` VALUES (804, 788, '崇明区');
INSERT INTO `t_sys_base_region_info` VALUES (805, 0, '江苏省');
INSERT INTO `t_sys_base_region_info` VALUES (806, 805, '南京市');
INSERT INTO `t_sys_base_region_info` VALUES (807, 806, '玄武区');
INSERT INTO `t_sys_base_region_info` VALUES (808, 806, '秦淮区');
INSERT INTO `t_sys_base_region_info` VALUES (809, 806, '建邺区');
INSERT INTO `t_sys_base_region_info` VALUES (810, 806, '鼓楼区');
INSERT INTO `t_sys_base_region_info` VALUES (811, 806, '浦口区');
INSERT INTO `t_sys_base_region_info` VALUES (812, 806, '栖霞区');
INSERT INTO `t_sys_base_region_info` VALUES (813, 806, '雨花台区');
INSERT INTO `t_sys_base_region_info` VALUES (814, 806, '江宁区');
INSERT INTO `t_sys_base_region_info` VALUES (815, 806, '六合区');
INSERT INTO `t_sys_base_region_info` VALUES (816, 806, '溧水区');
INSERT INTO `t_sys_base_region_info` VALUES (817, 806, '高淳区');
INSERT INTO `t_sys_base_region_info` VALUES (818, 805, '无锡市');
INSERT INTO `t_sys_base_region_info` VALUES (819, 818, '锡山区');
INSERT INTO `t_sys_base_region_info` VALUES (820, 818, '惠山区');
INSERT INTO `t_sys_base_region_info` VALUES (821, 818, '滨湖区');
INSERT INTO `t_sys_base_region_info` VALUES (822, 818, '梁溪区');
INSERT INTO `t_sys_base_region_info` VALUES (823, 818, '新吴区');
INSERT INTO `t_sys_base_region_info` VALUES (824, 818, '江阴市');
INSERT INTO `t_sys_base_region_info` VALUES (825, 818, '宜兴市');
INSERT INTO `t_sys_base_region_info` VALUES (826, 805, '徐州市');
INSERT INTO `t_sys_base_region_info` VALUES (827, 826, '鼓楼区');
INSERT INTO `t_sys_base_region_info` VALUES (828, 826, '云龙区');
INSERT INTO `t_sys_base_region_info` VALUES (829, 826, '贾汪区');
INSERT INTO `t_sys_base_region_info` VALUES (830, 826, '泉山区');
INSERT INTO `t_sys_base_region_info` VALUES (831, 826, '铜山区');
INSERT INTO `t_sys_base_region_info` VALUES (832, 826, '丰县');
INSERT INTO `t_sys_base_region_info` VALUES (833, 826, '沛县');
INSERT INTO `t_sys_base_region_info` VALUES (834, 826, '睢宁县');
INSERT INTO `t_sys_base_region_info` VALUES (835, 826, '新沂市');
INSERT INTO `t_sys_base_region_info` VALUES (836, 826, '邳州市');
INSERT INTO `t_sys_base_region_info` VALUES (837, 805, '常州市');
INSERT INTO `t_sys_base_region_info` VALUES (838, 837, '天宁区');
INSERT INTO `t_sys_base_region_info` VALUES (839, 837, '钟楼区');
INSERT INTO `t_sys_base_region_info` VALUES (840, 837, '新北区');
INSERT INTO `t_sys_base_region_info` VALUES (841, 837, '武进区');
INSERT INTO `t_sys_base_region_info` VALUES (842, 837, '金坛区');
INSERT INTO `t_sys_base_region_info` VALUES (843, 837, '溧阳市');
INSERT INTO `t_sys_base_region_info` VALUES (844, 805, '苏州市');
INSERT INTO `t_sys_base_region_info` VALUES (845, 844, '虎丘区');
INSERT INTO `t_sys_base_region_info` VALUES (846, 844, '吴中区');
INSERT INTO `t_sys_base_region_info` VALUES (847, 844, '相城区');
INSERT INTO `t_sys_base_region_info` VALUES (848, 844, '姑苏区');
INSERT INTO `t_sys_base_region_info` VALUES (849, 844, '吴江区');
INSERT INTO `t_sys_base_region_info` VALUES (850, 844, '常熟市');
INSERT INTO `t_sys_base_region_info` VALUES (851, 844, '张家港市');
INSERT INTO `t_sys_base_region_info` VALUES (852, 844, '昆山市');
INSERT INTO `t_sys_base_region_info` VALUES (853, 844, '太仓市');
INSERT INTO `t_sys_base_region_info` VALUES (854, 805, '南通市');
INSERT INTO `t_sys_base_region_info` VALUES (855, 854, '崇川区');
INSERT INTO `t_sys_base_region_info` VALUES (856, 854, '港闸区');
INSERT INTO `t_sys_base_region_info` VALUES (857, 854, '通州区');
INSERT INTO `t_sys_base_region_info` VALUES (858, 854, '海安县');
INSERT INTO `t_sys_base_region_info` VALUES (859, 854, '如东县');
INSERT INTO `t_sys_base_region_info` VALUES (860, 854, '启东市');
INSERT INTO `t_sys_base_region_info` VALUES (861, 854, '如皋市');
INSERT INTO `t_sys_base_region_info` VALUES (862, 854, '海门市');
INSERT INTO `t_sys_base_region_info` VALUES (863, 805, '连云港市');
INSERT INTO `t_sys_base_region_info` VALUES (864, 863, '连云区');
INSERT INTO `t_sys_base_region_info` VALUES (865, 863, '海州区');
INSERT INTO `t_sys_base_region_info` VALUES (866, 863, '赣榆区');
INSERT INTO `t_sys_base_region_info` VALUES (867, 863, '东海县');
INSERT INTO `t_sys_base_region_info` VALUES (868, 863, '灌云县');
INSERT INTO `t_sys_base_region_info` VALUES (869, 863, '灌南县');
INSERT INTO `t_sys_base_region_info` VALUES (870, 805, '淮安市');
INSERT INTO `t_sys_base_region_info` VALUES (871, 870, '淮安区');
INSERT INTO `t_sys_base_region_info` VALUES (872, 870, '淮阴区');
INSERT INTO `t_sys_base_region_info` VALUES (873, 870, '清江浦区');
INSERT INTO `t_sys_base_region_info` VALUES (874, 870, '洪泽区');
INSERT INTO `t_sys_base_region_info` VALUES (875, 870, '涟水县');
INSERT INTO `t_sys_base_region_info` VALUES (876, 870, '盱眙县');
INSERT INTO `t_sys_base_region_info` VALUES (877, 870, '金湖县');
INSERT INTO `t_sys_base_region_info` VALUES (878, 805, '盐城市');
INSERT INTO `t_sys_base_region_info` VALUES (879, 878, '亭湖区');
INSERT INTO `t_sys_base_region_info` VALUES (880, 878, '盐都区');
INSERT INTO `t_sys_base_region_info` VALUES (881, 878, '大丰区');
INSERT INTO `t_sys_base_region_info` VALUES (882, 878, '响水县');
INSERT INTO `t_sys_base_region_info` VALUES (883, 878, '滨海县');
INSERT INTO `t_sys_base_region_info` VALUES (884, 878, '阜宁县');
INSERT INTO `t_sys_base_region_info` VALUES (885, 878, '射阳县');
INSERT INTO `t_sys_base_region_info` VALUES (886, 878, '建湖县');
INSERT INTO `t_sys_base_region_info` VALUES (887, 878, '东台市');
INSERT INTO `t_sys_base_region_info` VALUES (888, 805, '扬州市');
INSERT INTO `t_sys_base_region_info` VALUES (889, 888, '广陵区');
INSERT INTO `t_sys_base_region_info` VALUES (890, 888, '邗江区');
INSERT INTO `t_sys_base_region_info` VALUES (891, 888, '江都区');
INSERT INTO `t_sys_base_region_info` VALUES (892, 888, '宝应县');
INSERT INTO `t_sys_base_region_info` VALUES (893, 888, '仪征市');
INSERT INTO `t_sys_base_region_info` VALUES (894, 888, '高邮市');
INSERT INTO `t_sys_base_region_info` VALUES (895, 805, '镇江市');
INSERT INTO `t_sys_base_region_info` VALUES (896, 895, '京口区');
INSERT INTO `t_sys_base_region_info` VALUES (897, 895, '润州区');
INSERT INTO `t_sys_base_region_info` VALUES (898, 895, '丹徒区');
INSERT INTO `t_sys_base_region_info` VALUES (899, 895, '丹阳市');
INSERT INTO `t_sys_base_region_info` VALUES (900, 895, '扬中市');
INSERT INTO `t_sys_base_region_info` VALUES (901, 895, '句容市');
INSERT INTO `t_sys_base_region_info` VALUES (902, 805, '泰州市');
INSERT INTO `t_sys_base_region_info` VALUES (903, 902, '海陵区');
INSERT INTO `t_sys_base_region_info` VALUES (904, 902, '高港区');
INSERT INTO `t_sys_base_region_info` VALUES (905, 902, '姜堰区');
INSERT INTO `t_sys_base_region_info` VALUES (906, 902, '兴化市');
INSERT INTO `t_sys_base_region_info` VALUES (907, 902, '靖江市');
INSERT INTO `t_sys_base_region_info` VALUES (908, 902, '泰兴市');
INSERT INTO `t_sys_base_region_info` VALUES (909, 805, '宿迁市');
INSERT INTO `t_sys_base_region_info` VALUES (910, 909, '宿城区');
INSERT INTO `t_sys_base_region_info` VALUES (911, 909, '宿豫区');
INSERT INTO `t_sys_base_region_info` VALUES (912, 909, '沭阳县');
INSERT INTO `t_sys_base_region_info` VALUES (913, 909, '泗阳县');
INSERT INTO `t_sys_base_region_info` VALUES (914, 909, '泗洪县');
INSERT INTO `t_sys_base_region_info` VALUES (915, 0, '浙江省');
INSERT INTO `t_sys_base_region_info` VALUES (916, 915, '杭州市');
INSERT INTO `t_sys_base_region_info` VALUES (917, 916, '上城区');
INSERT INTO `t_sys_base_region_info` VALUES (918, 916, '下城区');
INSERT INTO `t_sys_base_region_info` VALUES (919, 916, '江干区');
INSERT INTO `t_sys_base_region_info` VALUES (920, 916, '拱墅区');
INSERT INTO `t_sys_base_region_info` VALUES (921, 916, '西湖区');
INSERT INTO `t_sys_base_region_info` VALUES (922, 916, '滨江区');
INSERT INTO `t_sys_base_region_info` VALUES (923, 916, '萧山区');
INSERT INTO `t_sys_base_region_info` VALUES (924, 916, '余杭区');
INSERT INTO `t_sys_base_region_info` VALUES (925, 916, '富阳区');
INSERT INTO `t_sys_base_region_info` VALUES (926, 916, '桐庐县');
INSERT INTO `t_sys_base_region_info` VALUES (927, 916, '淳安县');
INSERT INTO `t_sys_base_region_info` VALUES (928, 916, '建德市');
INSERT INTO `t_sys_base_region_info` VALUES (929, 916, '临安区');
INSERT INTO `t_sys_base_region_info` VALUES (930, 915, '宁波市');
INSERT INTO `t_sys_base_region_info` VALUES (931, 930, '海曙区');
INSERT INTO `t_sys_base_region_info` VALUES (932, 930, '江北区');
INSERT INTO `t_sys_base_region_info` VALUES (933, 930, '北仑区');
INSERT INTO `t_sys_base_region_info` VALUES (934, 930, '镇海区');
INSERT INTO `t_sys_base_region_info` VALUES (935, 930, '鄞州区');
INSERT INTO `t_sys_base_region_info` VALUES (936, 930, '奉化区');
INSERT INTO `t_sys_base_region_info` VALUES (937, 930, '象山县');
INSERT INTO `t_sys_base_region_info` VALUES (938, 930, '宁海县');
INSERT INTO `t_sys_base_region_info` VALUES (939, 930, '余姚市');
INSERT INTO `t_sys_base_region_info` VALUES (940, 930, '慈溪市');
INSERT INTO `t_sys_base_region_info` VALUES (941, 915, '温州市');
INSERT INTO `t_sys_base_region_info` VALUES (942, 941, '鹿城区');
INSERT INTO `t_sys_base_region_info` VALUES (943, 941, '龙湾区');
INSERT INTO `t_sys_base_region_info` VALUES (944, 941, '瓯海区');
INSERT INTO `t_sys_base_region_info` VALUES (945, 941, '洞头区');
INSERT INTO `t_sys_base_region_info` VALUES (946, 941, '永嘉县');
INSERT INTO `t_sys_base_region_info` VALUES (947, 941, '平阳县');
INSERT INTO `t_sys_base_region_info` VALUES (948, 941, '苍南县');
INSERT INTO `t_sys_base_region_info` VALUES (949, 941, '文成县');
INSERT INTO `t_sys_base_region_info` VALUES (950, 941, '泰顺县');
INSERT INTO `t_sys_base_region_info` VALUES (951, 941, '瑞安市');
INSERT INTO `t_sys_base_region_info` VALUES (952, 941, '乐清市');
INSERT INTO `t_sys_base_region_info` VALUES (953, 915, '嘉兴市');
INSERT INTO `t_sys_base_region_info` VALUES (954, 953, '南湖区');
INSERT INTO `t_sys_base_region_info` VALUES (955, 953, '秀洲区');
INSERT INTO `t_sys_base_region_info` VALUES (956, 953, '嘉善县');
INSERT INTO `t_sys_base_region_info` VALUES (957, 953, '海盐县');
INSERT INTO `t_sys_base_region_info` VALUES (958, 953, '海宁市');
INSERT INTO `t_sys_base_region_info` VALUES (959, 953, '平湖市');
INSERT INTO `t_sys_base_region_info` VALUES (960, 953, '桐乡市');
INSERT INTO `t_sys_base_region_info` VALUES (961, 915, '湖州市');
INSERT INTO `t_sys_base_region_info` VALUES (962, 961, '吴兴区');
INSERT INTO `t_sys_base_region_info` VALUES (963, 961, '南浔区');
INSERT INTO `t_sys_base_region_info` VALUES (964, 961, '德清县');
INSERT INTO `t_sys_base_region_info` VALUES (965, 961, '长兴县');
INSERT INTO `t_sys_base_region_info` VALUES (966, 961, '安吉县');
INSERT INTO `t_sys_base_region_info` VALUES (967, 915, '绍兴市');
INSERT INTO `t_sys_base_region_info` VALUES (968, 967, '越城区');
INSERT INTO `t_sys_base_region_info` VALUES (969, 967, '柯桥区');
INSERT INTO `t_sys_base_region_info` VALUES (970, 967, '上虞区');
INSERT INTO `t_sys_base_region_info` VALUES (971, 967, '新昌县');
INSERT INTO `t_sys_base_region_info` VALUES (972, 967, '诸暨市');
INSERT INTO `t_sys_base_region_info` VALUES (973, 967, '嵊州市');
INSERT INTO `t_sys_base_region_info` VALUES (974, 915, '金华市');
INSERT INTO `t_sys_base_region_info` VALUES (975, 974, '婺城区');
INSERT INTO `t_sys_base_region_info` VALUES (976, 974, '金东区');
INSERT INTO `t_sys_base_region_info` VALUES (977, 974, '武义县');
INSERT INTO `t_sys_base_region_info` VALUES (978, 974, '浦江县');
INSERT INTO `t_sys_base_region_info` VALUES (979, 974, '磐安县');
INSERT INTO `t_sys_base_region_info` VALUES (980, 974, '兰溪市');
INSERT INTO `t_sys_base_region_info` VALUES (981, 974, '义乌市');
INSERT INTO `t_sys_base_region_info` VALUES (982, 974, '东阳市');
INSERT INTO `t_sys_base_region_info` VALUES (983, 974, '永康市');
INSERT INTO `t_sys_base_region_info` VALUES (984, 915, '衢州市');
INSERT INTO `t_sys_base_region_info` VALUES (985, 984, '柯城区');
INSERT INTO `t_sys_base_region_info` VALUES (986, 984, '衢江区');
INSERT INTO `t_sys_base_region_info` VALUES (987, 984, '常山县');
INSERT INTO `t_sys_base_region_info` VALUES (988, 984, '开化县');
INSERT INTO `t_sys_base_region_info` VALUES (989, 984, '龙游县');
INSERT INTO `t_sys_base_region_info` VALUES (990, 984, '江山市');
INSERT INTO `t_sys_base_region_info` VALUES (991, 915, '舟山市');
INSERT INTO `t_sys_base_region_info` VALUES (992, 991, '定海区');
INSERT INTO `t_sys_base_region_info` VALUES (993, 991, '普陀区');
INSERT INTO `t_sys_base_region_info` VALUES (994, 991, '岱山县');
INSERT INTO `t_sys_base_region_info` VALUES (995, 991, '嵊泗县');
INSERT INTO `t_sys_base_region_info` VALUES (996, 915, '台州市');
INSERT INTO `t_sys_base_region_info` VALUES (997, 996, '椒江区');
INSERT INTO `t_sys_base_region_info` VALUES (998, 996, '黄岩区');
INSERT INTO `t_sys_base_region_info` VALUES (999, 996, '路桥区');
INSERT INTO `t_sys_base_region_info` VALUES (1000, 996, '三门县');
INSERT INTO `t_sys_base_region_info` VALUES (1001, 996, '天台县');
INSERT INTO `t_sys_base_region_info` VALUES (1002, 996, '仙居县');
INSERT INTO `t_sys_base_region_info` VALUES (1003, 996, '温岭市');
INSERT INTO `t_sys_base_region_info` VALUES (1004, 996, '临海市');
INSERT INTO `t_sys_base_region_info` VALUES (1005, 996, '玉环市');
INSERT INTO `t_sys_base_region_info` VALUES (1006, 915, '丽水市');
INSERT INTO `t_sys_base_region_info` VALUES (1007, 1006, '莲都区');
INSERT INTO `t_sys_base_region_info` VALUES (1008, 1006, '青田县');
INSERT INTO `t_sys_base_region_info` VALUES (1009, 1006, '缙云县');
INSERT INTO `t_sys_base_region_info` VALUES (1010, 1006, '遂昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1011, 1006, '松阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1012, 1006, '云和县');
INSERT INTO `t_sys_base_region_info` VALUES (1013, 1006, '庆元县');
INSERT INTO `t_sys_base_region_info` VALUES (1014, 1006, '景宁畲族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1015, 1006, '龙泉市');
INSERT INTO `t_sys_base_region_info` VALUES (1016, 0, '安徽省');
INSERT INTO `t_sys_base_region_info` VALUES (1017, 1016, '合肥市');
INSERT INTO `t_sys_base_region_info` VALUES (1018, 1017, '瑶海区');
INSERT INTO `t_sys_base_region_info` VALUES (1019, 1017, '庐阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1020, 1017, '蜀山区');
INSERT INTO `t_sys_base_region_info` VALUES (1021, 1017, '包河区');
INSERT INTO `t_sys_base_region_info` VALUES (1022, 1017, '长丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1023, 1017, '肥东县');
INSERT INTO `t_sys_base_region_info` VALUES (1024, 1017, '肥西县');
INSERT INTO `t_sys_base_region_info` VALUES (1025, 1017, '庐江县');
INSERT INTO `t_sys_base_region_info` VALUES (1026, 1017, '巢湖市');
INSERT INTO `t_sys_base_region_info` VALUES (1027, 1016, '芜湖市');
INSERT INTO `t_sys_base_region_info` VALUES (1028, 1027, '镜湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1029, 1027, '弋江区');
INSERT INTO `t_sys_base_region_info` VALUES (1030, 1027, '鸠江区');
INSERT INTO `t_sys_base_region_info` VALUES (1031, 1027, '三山区');
INSERT INTO `t_sys_base_region_info` VALUES (1032, 1027, '芜湖县');
INSERT INTO `t_sys_base_region_info` VALUES (1033, 1027, '繁昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1034, 1027, '南陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1035, 1027, '无为县');
INSERT INTO `t_sys_base_region_info` VALUES (1036, 1016, '蚌埠市');
INSERT INTO `t_sys_base_region_info` VALUES (1037, 1036, '龙子湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1038, 1036, '蚌山区');
INSERT INTO `t_sys_base_region_info` VALUES (1039, 1036, '禹会区');
INSERT INTO `t_sys_base_region_info` VALUES (1040, 1036, '淮上区');
INSERT INTO `t_sys_base_region_info` VALUES (1041, 1036, '怀远县');
INSERT INTO `t_sys_base_region_info` VALUES (1042, 1036, '五河县');
INSERT INTO `t_sys_base_region_info` VALUES (1043, 1036, '固镇县');
INSERT INTO `t_sys_base_region_info` VALUES (1044, 1016, '淮南市');
INSERT INTO `t_sys_base_region_info` VALUES (1045, 1044, '大通区');
INSERT INTO `t_sys_base_region_info` VALUES (1046, 1044, '田家庵区');
INSERT INTO `t_sys_base_region_info` VALUES (1047, 1044, '谢家集区');
INSERT INTO `t_sys_base_region_info` VALUES (1048, 1044, '八公山区');
INSERT INTO `t_sys_base_region_info` VALUES (1049, 1044, '潘集区');
INSERT INTO `t_sys_base_region_info` VALUES (1050, 1044, '凤台县');
INSERT INTO `t_sys_base_region_info` VALUES (1051, 1044, '寿县');
INSERT INTO `t_sys_base_region_info` VALUES (1052, 1016, '马鞍山市');
INSERT INTO `t_sys_base_region_info` VALUES (1053, 1052, '花山区');
INSERT INTO `t_sys_base_region_info` VALUES (1054, 1052, '雨山区');
INSERT INTO `t_sys_base_region_info` VALUES (1055, 1052, '博望区');
INSERT INTO `t_sys_base_region_info` VALUES (1056, 1052, '当涂县');
INSERT INTO `t_sys_base_region_info` VALUES (1057, 1052, '含山县');
INSERT INTO `t_sys_base_region_info` VALUES (1058, 1052, '和县');
INSERT INTO `t_sys_base_region_info` VALUES (1059, 1016, '淮北市');
INSERT INTO `t_sys_base_region_info` VALUES (1060, 1059, '杜集区');
INSERT INTO `t_sys_base_region_info` VALUES (1061, 1059, '相山区');
INSERT INTO `t_sys_base_region_info` VALUES (1062, 1059, '烈山区');
INSERT INTO `t_sys_base_region_info` VALUES (1063, 1059, '濉溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1064, 1016, '铜陵市');
INSERT INTO `t_sys_base_region_info` VALUES (1065, 1064, '铜官区');
INSERT INTO `t_sys_base_region_info` VALUES (1066, 1064, '义安区');
INSERT INTO `t_sys_base_region_info` VALUES (1067, 1064, '郊区');
INSERT INTO `t_sys_base_region_info` VALUES (1068, 1064, '枞阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1069, 1016, '安庆市');
INSERT INTO `t_sys_base_region_info` VALUES (1070, 1069, '迎江区');
INSERT INTO `t_sys_base_region_info` VALUES (1071, 1069, '大观区');
INSERT INTO `t_sys_base_region_info` VALUES (1072, 1069, '宜秀区');
INSERT INTO `t_sys_base_region_info` VALUES (1073, 1069, '怀宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1074, 1069, '潜山县');
INSERT INTO `t_sys_base_region_info` VALUES (1075, 1069, '太湖县');
INSERT INTO `t_sys_base_region_info` VALUES (1076, 1069, '宿松县');
INSERT INTO `t_sys_base_region_info` VALUES (1077, 1069, '望江县');
INSERT INTO `t_sys_base_region_info` VALUES (1078, 1069, '岳西县');
INSERT INTO `t_sys_base_region_info` VALUES (1079, 1069, '桐城市');
INSERT INTO `t_sys_base_region_info` VALUES (1080, 1016, '黄山市');
INSERT INTO `t_sys_base_region_info` VALUES (1081, 1080, '屯溪区');
INSERT INTO `t_sys_base_region_info` VALUES (1082, 1080, '黄山区');
INSERT INTO `t_sys_base_region_info` VALUES (1083, 1080, '徽州区');
INSERT INTO `t_sys_base_region_info` VALUES (1084, 1080, '歙县');
INSERT INTO `t_sys_base_region_info` VALUES (1085, 1080, '休宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1086, 1080, '黟县');
INSERT INTO `t_sys_base_region_info` VALUES (1087, 1080, '祁门县');
INSERT INTO `t_sys_base_region_info` VALUES (1088, 1016, '滁州市');
INSERT INTO `t_sys_base_region_info` VALUES (1089, 1088, '琅琊区');
INSERT INTO `t_sys_base_region_info` VALUES (1090, 1088, '南谯区');
INSERT INTO `t_sys_base_region_info` VALUES (1091, 1088, '来安县');
INSERT INTO `t_sys_base_region_info` VALUES (1092, 1088, '全椒县');
INSERT INTO `t_sys_base_region_info` VALUES (1093, 1088, '定远县');
INSERT INTO `t_sys_base_region_info` VALUES (1094, 1088, '凤阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1095, 1088, '天长市');
INSERT INTO `t_sys_base_region_info` VALUES (1096, 1088, '明光市');
INSERT INTO `t_sys_base_region_info` VALUES (1097, 1016, '阜阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1098, 1097, '颍州区');
INSERT INTO `t_sys_base_region_info` VALUES (1099, 1097, '颍东区');
INSERT INTO `t_sys_base_region_info` VALUES (1100, 1097, '颍泉区');
INSERT INTO `t_sys_base_region_info` VALUES (1101, 1097, '临泉县');
INSERT INTO `t_sys_base_region_info` VALUES (1102, 1097, '太和县');
INSERT INTO `t_sys_base_region_info` VALUES (1103, 1097, '阜南县');
INSERT INTO `t_sys_base_region_info` VALUES (1104, 1097, '颍上县');
INSERT INTO `t_sys_base_region_info` VALUES (1105, 1097, '界首市');
INSERT INTO `t_sys_base_region_info` VALUES (1106, 1016, '宿州市');
INSERT INTO `t_sys_base_region_info` VALUES (1107, 1106, '埇桥区');
INSERT INTO `t_sys_base_region_info` VALUES (1108, 1106, '砀山县');
INSERT INTO `t_sys_base_region_info` VALUES (1109, 1106, '萧县');
INSERT INTO `t_sys_base_region_info` VALUES (1110, 1106, '灵璧县');
INSERT INTO `t_sys_base_region_info` VALUES (1111, 1106, '泗县');
INSERT INTO `t_sys_base_region_info` VALUES (1112, 1016, '六安市');
INSERT INTO `t_sys_base_region_info` VALUES (1113, 1112, '金安区');
INSERT INTO `t_sys_base_region_info` VALUES (1114, 1112, '裕安区');
INSERT INTO `t_sys_base_region_info` VALUES (1115, 1112, '叶集区');
INSERT INTO `t_sys_base_region_info` VALUES (1116, 1112, '霍邱县');
INSERT INTO `t_sys_base_region_info` VALUES (1117, 1112, '舒城县');
INSERT INTO `t_sys_base_region_info` VALUES (1118, 1112, '金寨县');
INSERT INTO `t_sys_base_region_info` VALUES (1119, 1112, '霍山县');
INSERT INTO `t_sys_base_region_info` VALUES (1120, 1016, '亳州市');
INSERT INTO `t_sys_base_region_info` VALUES (1121, 1120, '谯城区');
INSERT INTO `t_sys_base_region_info` VALUES (1122, 1120, '涡阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1123, 1120, '蒙城县');
INSERT INTO `t_sys_base_region_info` VALUES (1124, 1120, '利辛县');
INSERT INTO `t_sys_base_region_info` VALUES (1125, 1016, '池州市');
INSERT INTO `t_sys_base_region_info` VALUES (1126, 1125, '贵池区');
INSERT INTO `t_sys_base_region_info` VALUES (1127, 1125, '东至县');
INSERT INTO `t_sys_base_region_info` VALUES (1128, 1125, '石台县');
INSERT INTO `t_sys_base_region_info` VALUES (1129, 1125, '青阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1130, 1016, '宣城市');
INSERT INTO `t_sys_base_region_info` VALUES (1131, 1130, '宣州区');
INSERT INTO `t_sys_base_region_info` VALUES (1132, 1130, '郎溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1133, 1130, '广德县');
INSERT INTO `t_sys_base_region_info` VALUES (1134, 1130, '泾县');
INSERT INTO `t_sys_base_region_info` VALUES (1135, 1130, '绩溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1136, 1130, '旌德县');
INSERT INTO `t_sys_base_region_info` VALUES (1137, 1130, '宁国市');
INSERT INTO `t_sys_base_region_info` VALUES (1138, 0, '福建省');
INSERT INTO `t_sys_base_region_info` VALUES (1139, 1138, '福州市');
INSERT INTO `t_sys_base_region_info` VALUES (1140, 1139, '鼓楼区');
INSERT INTO `t_sys_base_region_info` VALUES (1141, 1139, '台江区');
INSERT INTO `t_sys_base_region_info` VALUES (1142, 1139, '仓山区');
INSERT INTO `t_sys_base_region_info` VALUES (1143, 1139, '马尾区');
INSERT INTO `t_sys_base_region_info` VALUES (1144, 1139, '晋安区');
INSERT INTO `t_sys_base_region_info` VALUES (1145, 1139, '闽侯县');
INSERT INTO `t_sys_base_region_info` VALUES (1146, 1139, '连江县');
INSERT INTO `t_sys_base_region_info` VALUES (1147, 1139, '罗源县');
INSERT INTO `t_sys_base_region_info` VALUES (1148, 1139, '闽清县');
INSERT INTO `t_sys_base_region_info` VALUES (1149, 1139, '永泰县');
INSERT INTO `t_sys_base_region_info` VALUES (1150, 1139, '平潭县');
INSERT INTO `t_sys_base_region_info` VALUES (1151, 1139, '福清市');
INSERT INTO `t_sys_base_region_info` VALUES (1152, 1139, '长乐区');
INSERT INTO `t_sys_base_region_info` VALUES (1153, 1138, '厦门市');
INSERT INTO `t_sys_base_region_info` VALUES (1154, 1153, '思明区');
INSERT INTO `t_sys_base_region_info` VALUES (1155, 1153, '海沧区');
INSERT INTO `t_sys_base_region_info` VALUES (1156, 1153, '湖里区');
INSERT INTO `t_sys_base_region_info` VALUES (1157, 1153, '集美区');
INSERT INTO `t_sys_base_region_info` VALUES (1158, 1153, '同安区');
INSERT INTO `t_sys_base_region_info` VALUES (1159, 1153, '翔安区');
INSERT INTO `t_sys_base_region_info` VALUES (1160, 1138, '莆田市');
INSERT INTO `t_sys_base_region_info` VALUES (1161, 1160, '城厢区');
INSERT INTO `t_sys_base_region_info` VALUES (1162, 1160, '涵江区');
INSERT INTO `t_sys_base_region_info` VALUES (1163, 1160, '荔城区');
INSERT INTO `t_sys_base_region_info` VALUES (1164, 1160, '秀屿区');
INSERT INTO `t_sys_base_region_info` VALUES (1165, 1160, '仙游县');
INSERT INTO `t_sys_base_region_info` VALUES (1166, 1138, '三明市');
INSERT INTO `t_sys_base_region_info` VALUES (1167, 1166, '梅列区');
INSERT INTO `t_sys_base_region_info` VALUES (1168, 1166, '三元区');
INSERT INTO `t_sys_base_region_info` VALUES (1169, 1166, '明溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1170, 1166, '清流县');
INSERT INTO `t_sys_base_region_info` VALUES (1171, 1166, '宁化县');
INSERT INTO `t_sys_base_region_info` VALUES (1172, 1166, '大田县');
INSERT INTO `t_sys_base_region_info` VALUES (1173, 1166, '尤溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1174, 1166, '沙县');
INSERT INTO `t_sys_base_region_info` VALUES (1175, 1166, '将乐县');
INSERT INTO `t_sys_base_region_info` VALUES (1176, 1166, '泰宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1177, 1166, '建宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1178, 1166, '永安市');
INSERT INTO `t_sys_base_region_info` VALUES (1179, 1138, '泉州市');
INSERT INTO `t_sys_base_region_info` VALUES (1180, 1179, '鲤城区');
INSERT INTO `t_sys_base_region_info` VALUES (1181, 1179, '丰泽区');
INSERT INTO `t_sys_base_region_info` VALUES (1182, 1179, '洛江区');
INSERT INTO `t_sys_base_region_info` VALUES (1183, 1179, '泉港区');
INSERT INTO `t_sys_base_region_info` VALUES (1184, 1179, '惠安县');
INSERT INTO `t_sys_base_region_info` VALUES (1185, 1179, '安溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1186, 1179, '永春县');
INSERT INTO `t_sys_base_region_info` VALUES (1187, 1179, '德化县');
INSERT INTO `t_sys_base_region_info` VALUES (1188, 1179, '金门县');
INSERT INTO `t_sys_base_region_info` VALUES (1189, 1179, '石狮市');
INSERT INTO `t_sys_base_region_info` VALUES (1190, 1179, '晋江市');
INSERT INTO `t_sys_base_region_info` VALUES (1191, 1179, '南安市');
INSERT INTO `t_sys_base_region_info` VALUES (1192, 1138, '漳州市');
INSERT INTO `t_sys_base_region_info` VALUES (1193, 1192, '芗城区');
INSERT INTO `t_sys_base_region_info` VALUES (1194, 1192, '龙文区');
INSERT INTO `t_sys_base_region_info` VALUES (1195, 1192, '云霄县');
INSERT INTO `t_sys_base_region_info` VALUES (1196, 1192, '漳浦县');
INSERT INTO `t_sys_base_region_info` VALUES (1197, 1192, '诏安县');
INSERT INTO `t_sys_base_region_info` VALUES (1198, 1192, '长泰县');
INSERT INTO `t_sys_base_region_info` VALUES (1199, 1192, '东山县');
INSERT INTO `t_sys_base_region_info` VALUES (1200, 1192, '南靖县');
INSERT INTO `t_sys_base_region_info` VALUES (1201, 1192, '平和县');
INSERT INTO `t_sys_base_region_info` VALUES (1202, 1192, '华安县');
INSERT INTO `t_sys_base_region_info` VALUES (1203, 1192, '龙海市');
INSERT INTO `t_sys_base_region_info` VALUES (1204, 1138, '南平市');
INSERT INTO `t_sys_base_region_info` VALUES (1205, 1204, '延平区');
INSERT INTO `t_sys_base_region_info` VALUES (1206, 1204, '建阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1207, 1204, '顺昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1208, 1204, '浦城县');
INSERT INTO `t_sys_base_region_info` VALUES (1209, 1204, '光泽县');
INSERT INTO `t_sys_base_region_info` VALUES (1210, 1204, '松溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1211, 1204, '政和县');
INSERT INTO `t_sys_base_region_info` VALUES (1212, 1204, '邵武市');
INSERT INTO `t_sys_base_region_info` VALUES (1213, 1204, '武夷山市');
INSERT INTO `t_sys_base_region_info` VALUES (1214, 1204, '建瓯市');
INSERT INTO `t_sys_base_region_info` VALUES (1215, 1138, '龙岩市');
INSERT INTO `t_sys_base_region_info` VALUES (1216, 1215, '新罗区');
INSERT INTO `t_sys_base_region_info` VALUES (1217, 1215, '永定区');
INSERT INTO `t_sys_base_region_info` VALUES (1218, 1215, '长汀县');
INSERT INTO `t_sys_base_region_info` VALUES (1219, 1215, '上杭县');
INSERT INTO `t_sys_base_region_info` VALUES (1220, 1215, '武平县');
INSERT INTO `t_sys_base_region_info` VALUES (1221, 1215, '连城县');
INSERT INTO `t_sys_base_region_info` VALUES (1222, 1215, '漳平市');
INSERT INTO `t_sys_base_region_info` VALUES (1223, 1138, '宁德市');
INSERT INTO `t_sys_base_region_info` VALUES (1224, 1223, '蕉城区');
INSERT INTO `t_sys_base_region_info` VALUES (1225, 1223, '霞浦县');
INSERT INTO `t_sys_base_region_info` VALUES (1226, 1223, '古田县');
INSERT INTO `t_sys_base_region_info` VALUES (1227, 1223, '屏南县');
INSERT INTO `t_sys_base_region_info` VALUES (1228, 1223, '寿宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1229, 1223, '周宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1230, 1223, '柘荣县');
INSERT INTO `t_sys_base_region_info` VALUES (1231, 1223, '福安市');
INSERT INTO `t_sys_base_region_info` VALUES (1232, 1223, '福鼎市');
INSERT INTO `t_sys_base_region_info` VALUES (1233, 0, '江西省');
INSERT INTO `t_sys_base_region_info` VALUES (1234, 1233, '南昌市');
INSERT INTO `t_sys_base_region_info` VALUES (1235, 1234, '东湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1236, 1234, '西湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1237, 1234, '青云谱区');
INSERT INTO `t_sys_base_region_info` VALUES (1238, 1234, '湾里区');
INSERT INTO `t_sys_base_region_info` VALUES (1239, 1234, '青山湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1240, 1234, '新建区');
INSERT INTO `t_sys_base_region_info` VALUES (1241, 1234, '南昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1242, 1234, '安义县');
INSERT INTO `t_sys_base_region_info` VALUES (1243, 1234, '进贤县');
INSERT INTO `t_sys_base_region_info` VALUES (1244, 1233, '景德镇市');
INSERT INTO `t_sys_base_region_info` VALUES (1245, 1244, '昌江区');
INSERT INTO `t_sys_base_region_info` VALUES (1246, 1244, '珠山区');
INSERT INTO `t_sys_base_region_info` VALUES (1247, 1244, '浮梁县');
INSERT INTO `t_sys_base_region_info` VALUES (1248, 1244, '乐平市');
INSERT INTO `t_sys_base_region_info` VALUES (1249, 1233, '萍乡市');
INSERT INTO `t_sys_base_region_info` VALUES (1250, 1249, '安源区');
INSERT INTO `t_sys_base_region_info` VALUES (1251, 1249, '湘东区');
INSERT INTO `t_sys_base_region_info` VALUES (1252, 1249, '莲花县');
INSERT INTO `t_sys_base_region_info` VALUES (1253, 1249, '上栗县');
INSERT INTO `t_sys_base_region_info` VALUES (1254, 1249, '芦溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1255, 1233, '九江市');
INSERT INTO `t_sys_base_region_info` VALUES (1256, 1255, '濂溪区');
INSERT INTO `t_sys_base_region_info` VALUES (1257, 1255, '浔阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1258, 1255, '柴桑区');
INSERT INTO `t_sys_base_region_info` VALUES (1259, 1255, '武宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1260, 1255, '修水县');
INSERT INTO `t_sys_base_region_info` VALUES (1261, 1255, '永修县');
INSERT INTO `t_sys_base_region_info` VALUES (1262, 1255, '德安县');
INSERT INTO `t_sys_base_region_info` VALUES (1263, 1255, '都昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1264, 1255, '湖口县');
INSERT INTO `t_sys_base_region_info` VALUES (1265, 1255, '彭泽县');
INSERT INTO `t_sys_base_region_info` VALUES (1266, 1255, '瑞昌市');
INSERT INTO `t_sys_base_region_info` VALUES (1267, 1255, '共青城市');
INSERT INTO `t_sys_base_region_info` VALUES (1268, 1255, '庐山市');
INSERT INTO `t_sys_base_region_info` VALUES (1269, 1233, '新余市');
INSERT INTO `t_sys_base_region_info` VALUES (1270, 1269, '渝水区');
INSERT INTO `t_sys_base_region_info` VALUES (1271, 1269, '分宜县');
INSERT INTO `t_sys_base_region_info` VALUES (1272, 1233, '鹰潭市');
INSERT INTO `t_sys_base_region_info` VALUES (1273, 1272, '月湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1274, 1272, '余江县');
INSERT INTO `t_sys_base_region_info` VALUES (1275, 1272, '贵溪市');
INSERT INTO `t_sys_base_region_info` VALUES (1276, 1233, '赣州市');
INSERT INTO `t_sys_base_region_info` VALUES (1277, 1276, '章贡区');
INSERT INTO `t_sys_base_region_info` VALUES (1278, 1276, '南康区');
INSERT INTO `t_sys_base_region_info` VALUES (1279, 1276, '赣县区');
INSERT INTO `t_sys_base_region_info` VALUES (1280, 1276, '信丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1281, 1276, '大余县');
INSERT INTO `t_sys_base_region_info` VALUES (1282, 1276, '上犹县');
INSERT INTO `t_sys_base_region_info` VALUES (1283, 1276, '崇义县');
INSERT INTO `t_sys_base_region_info` VALUES (1284, 1276, '安远县');
INSERT INTO `t_sys_base_region_info` VALUES (1285, 1276, '龙南县');
INSERT INTO `t_sys_base_region_info` VALUES (1286, 1276, '定南县');
INSERT INTO `t_sys_base_region_info` VALUES (1287, 1276, '全南县');
INSERT INTO `t_sys_base_region_info` VALUES (1288, 1276, '宁都县');
INSERT INTO `t_sys_base_region_info` VALUES (1289, 1276, '于都县');
INSERT INTO `t_sys_base_region_info` VALUES (1290, 1276, '兴国县');
INSERT INTO `t_sys_base_region_info` VALUES (1291, 1276, '会昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1292, 1276, '寻乌县');
INSERT INTO `t_sys_base_region_info` VALUES (1293, 1276, '石城县');
INSERT INTO `t_sys_base_region_info` VALUES (1294, 1276, '瑞金市');
INSERT INTO `t_sys_base_region_info` VALUES (1295, 1233, '吉安市');
INSERT INTO `t_sys_base_region_info` VALUES (1296, 1295, '吉州区');
INSERT INTO `t_sys_base_region_info` VALUES (1297, 1295, '青原区');
INSERT INTO `t_sys_base_region_info` VALUES (1298, 1295, '吉安县');
INSERT INTO `t_sys_base_region_info` VALUES (1299, 1295, '吉水县');
INSERT INTO `t_sys_base_region_info` VALUES (1300, 1295, '峡江县');
INSERT INTO `t_sys_base_region_info` VALUES (1301, 1295, '新干县');
INSERT INTO `t_sys_base_region_info` VALUES (1302, 1295, '永丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1303, 1295, '泰和县');
INSERT INTO `t_sys_base_region_info` VALUES (1304, 1295, '遂川县');
INSERT INTO `t_sys_base_region_info` VALUES (1305, 1295, '万安县');
INSERT INTO `t_sys_base_region_info` VALUES (1306, 1295, '安福县');
INSERT INTO `t_sys_base_region_info` VALUES (1307, 1295, '永新县');
INSERT INTO `t_sys_base_region_info` VALUES (1308, 1295, '井冈山市');
INSERT INTO `t_sys_base_region_info` VALUES (1309, 1233, '宜春市');
INSERT INTO `t_sys_base_region_info` VALUES (1310, 1309, '袁州区');
INSERT INTO `t_sys_base_region_info` VALUES (1311, 1309, '奉新县');
INSERT INTO `t_sys_base_region_info` VALUES (1312, 1309, '万载县');
INSERT INTO `t_sys_base_region_info` VALUES (1313, 1309, '上高县');
INSERT INTO `t_sys_base_region_info` VALUES (1314, 1309, '宜丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1315, 1309, '靖安县');
INSERT INTO `t_sys_base_region_info` VALUES (1316, 1309, '铜鼓县');
INSERT INTO `t_sys_base_region_info` VALUES (1317, 1309, '丰城市');
INSERT INTO `t_sys_base_region_info` VALUES (1318, 1309, '樟树市');
INSERT INTO `t_sys_base_region_info` VALUES (1319, 1309, '高安市');
INSERT INTO `t_sys_base_region_info` VALUES (1320, 1233, '抚州市');
INSERT INTO `t_sys_base_region_info` VALUES (1321, 1320, '临川区');
INSERT INTO `t_sys_base_region_info` VALUES (1322, 1320, '东乡区');
INSERT INTO `t_sys_base_region_info` VALUES (1323, 1320, '南城县');
INSERT INTO `t_sys_base_region_info` VALUES (1324, 1320, '黎川县');
INSERT INTO `t_sys_base_region_info` VALUES (1325, 1320, '南丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1326, 1320, '崇仁县');
INSERT INTO `t_sys_base_region_info` VALUES (1327, 1320, '乐安县');
INSERT INTO `t_sys_base_region_info` VALUES (1328, 1320, '宜黄县');
INSERT INTO `t_sys_base_region_info` VALUES (1329, 1320, '金溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1330, 1320, '资溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1331, 1320, '广昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1332, 1233, '上饶市');
INSERT INTO `t_sys_base_region_info` VALUES (1333, 1332, '信州区');
INSERT INTO `t_sys_base_region_info` VALUES (1334, 1332, '广丰区');
INSERT INTO `t_sys_base_region_info` VALUES (1335, 1332, '广信区');
INSERT INTO `t_sys_base_region_info` VALUES (1336, 1332, '玉山县');
INSERT INTO `t_sys_base_region_info` VALUES (1337, 1332, '铅山县');
INSERT INTO `t_sys_base_region_info` VALUES (1338, 1332, '横峰县');
INSERT INTO `t_sys_base_region_info` VALUES (1339, 1332, '弋阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1340, 1332, '余干县');
INSERT INTO `t_sys_base_region_info` VALUES (1341, 1332, '鄱阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1342, 1332, '万年县');
INSERT INTO `t_sys_base_region_info` VALUES (1343, 1332, '婺源县');
INSERT INTO `t_sys_base_region_info` VALUES (1344, 1332, '德兴市');
INSERT INTO `t_sys_base_region_info` VALUES (1345, 0, '山东省');
INSERT INTO `t_sys_base_region_info` VALUES (1346, 1345, '济南市');
INSERT INTO `t_sys_base_region_info` VALUES (1347, 1346, '历下区');
INSERT INTO `t_sys_base_region_info` VALUES (1348, 1346, '市中区');
INSERT INTO `t_sys_base_region_info` VALUES (1349, 1346, '槐荫区');
INSERT INTO `t_sys_base_region_info` VALUES (1350, 1346, '天桥区');
INSERT INTO `t_sys_base_region_info` VALUES (1351, 1346, '历城区');
INSERT INTO `t_sys_base_region_info` VALUES (1352, 1346, '长清区');
INSERT INTO `t_sys_base_region_info` VALUES (1353, 1346, '章丘区');
INSERT INTO `t_sys_base_region_info` VALUES (1354, 1346, '平阴县');
INSERT INTO `t_sys_base_region_info` VALUES (1355, 1346, '济阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1356, 1346, '商河县');
INSERT INTO `t_sys_base_region_info` VALUES (1357, 1345, '青岛市');
INSERT INTO `t_sys_base_region_info` VALUES (1358, 1357, '市南区');
INSERT INTO `t_sys_base_region_info` VALUES (1359, 1357, '市北区');
INSERT INTO `t_sys_base_region_info` VALUES (1360, 1357, '黄岛区');
INSERT INTO `t_sys_base_region_info` VALUES (1361, 1357, '崂山区');
INSERT INTO `t_sys_base_region_info` VALUES (1362, 1357, '李沧区');
INSERT INTO `t_sys_base_region_info` VALUES (1363, 1357, '城阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1364, 1357, '胶州市');
INSERT INTO `t_sys_base_region_info` VALUES (1365, 1357, '即墨区');
INSERT INTO `t_sys_base_region_info` VALUES (1366, 1357, '平度市');
INSERT INTO `t_sys_base_region_info` VALUES (1367, 1357, '莱西市');
INSERT INTO `t_sys_base_region_info` VALUES (1368, 1345, '淄博市');
INSERT INTO `t_sys_base_region_info` VALUES (1369, 1368, '淄川区');
INSERT INTO `t_sys_base_region_info` VALUES (1370, 1368, '张店区');
INSERT INTO `t_sys_base_region_info` VALUES (1371, 1368, '博山区');
INSERT INTO `t_sys_base_region_info` VALUES (1372, 1368, '临淄区');
INSERT INTO `t_sys_base_region_info` VALUES (1373, 1368, '周村区');
INSERT INTO `t_sys_base_region_info` VALUES (1374, 1368, '桓台县');
INSERT INTO `t_sys_base_region_info` VALUES (1375, 1368, '高青县');
INSERT INTO `t_sys_base_region_info` VALUES (1376, 1368, '沂源县');
INSERT INTO `t_sys_base_region_info` VALUES (1377, 1345, '枣庄市');
INSERT INTO `t_sys_base_region_info` VALUES (1378, 1377, '市中区');
INSERT INTO `t_sys_base_region_info` VALUES (1379, 1377, '薛城区');
INSERT INTO `t_sys_base_region_info` VALUES (1380, 1377, '峄城区');
INSERT INTO `t_sys_base_region_info` VALUES (1381, 1377, '台儿庄区');
INSERT INTO `t_sys_base_region_info` VALUES (1382, 1377, '山亭区');
INSERT INTO `t_sys_base_region_info` VALUES (1383, 1377, '滕州市');
INSERT INTO `t_sys_base_region_info` VALUES (1384, 1345, '东营市');
INSERT INTO `t_sys_base_region_info` VALUES (1385, 1384, '东营区');
INSERT INTO `t_sys_base_region_info` VALUES (1386, 1384, '河口区');
INSERT INTO `t_sys_base_region_info` VALUES (1387, 1384, '垦利区');
INSERT INTO `t_sys_base_region_info` VALUES (1388, 1384, '利津县');
INSERT INTO `t_sys_base_region_info` VALUES (1389, 1384, '广饶县');
INSERT INTO `t_sys_base_region_info` VALUES (1390, 1345, '烟台市');
INSERT INTO `t_sys_base_region_info` VALUES (1391, 1390, '芝罘区');
INSERT INTO `t_sys_base_region_info` VALUES (1392, 1390, '福山区');
INSERT INTO `t_sys_base_region_info` VALUES (1393, 1390, '牟平区');
INSERT INTO `t_sys_base_region_info` VALUES (1394, 1390, '莱山区');
INSERT INTO `t_sys_base_region_info` VALUES (1395, 1390, '长岛县');
INSERT INTO `t_sys_base_region_info` VALUES (1396, 1390, '龙口市');
INSERT INTO `t_sys_base_region_info` VALUES (1397, 1390, '莱阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1398, 1390, '莱州市');
INSERT INTO `t_sys_base_region_info` VALUES (1399, 1390, '蓬莱市');
INSERT INTO `t_sys_base_region_info` VALUES (1400, 1390, '招远市');
INSERT INTO `t_sys_base_region_info` VALUES (1401, 1390, '栖霞市');
INSERT INTO `t_sys_base_region_info` VALUES (1402, 1390, '海阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1403, 1345, '潍坊市');
INSERT INTO `t_sys_base_region_info` VALUES (1404, 1403, '潍城区');
INSERT INTO `t_sys_base_region_info` VALUES (1405, 1403, '寒亭区');
INSERT INTO `t_sys_base_region_info` VALUES (1406, 1403, '坊子区');
INSERT INTO `t_sys_base_region_info` VALUES (1407, 1403, '奎文区');
INSERT INTO `t_sys_base_region_info` VALUES (1408, 1403, '临朐县');
INSERT INTO `t_sys_base_region_info` VALUES (1409, 1403, '昌乐县');
INSERT INTO `t_sys_base_region_info` VALUES (1410, 1403, '青州市');
INSERT INTO `t_sys_base_region_info` VALUES (1411, 1403, '诸城市');
INSERT INTO `t_sys_base_region_info` VALUES (1412, 1403, '寿光市');
INSERT INTO `t_sys_base_region_info` VALUES (1413, 1403, '安丘市');
INSERT INTO `t_sys_base_region_info` VALUES (1414, 1403, '高密市');
INSERT INTO `t_sys_base_region_info` VALUES (1415, 1403, '昌邑市');
INSERT INTO `t_sys_base_region_info` VALUES (1416, 1345, '济宁市');
INSERT INTO `t_sys_base_region_info` VALUES (1417, 1416, '任城区');
INSERT INTO `t_sys_base_region_info` VALUES (1418, 1416, '兖州区');
INSERT INTO `t_sys_base_region_info` VALUES (1419, 1416, '微山县');
INSERT INTO `t_sys_base_region_info` VALUES (1420, 1416, '鱼台县');
INSERT INTO `t_sys_base_region_info` VALUES (1421, 1416, '金乡县');
INSERT INTO `t_sys_base_region_info` VALUES (1422, 1416, '嘉祥县');
INSERT INTO `t_sys_base_region_info` VALUES (1423, 1416, '汶上县');
INSERT INTO `t_sys_base_region_info` VALUES (1424, 1416, '泗水县');
INSERT INTO `t_sys_base_region_info` VALUES (1425, 1416, '梁山县');
INSERT INTO `t_sys_base_region_info` VALUES (1426, 1416, '曲阜市');
INSERT INTO `t_sys_base_region_info` VALUES (1427, 1416, '邹城市');
INSERT INTO `t_sys_base_region_info` VALUES (1428, 1345, '泰安市');
INSERT INTO `t_sys_base_region_info` VALUES (1429, 1428, '泰山区');
INSERT INTO `t_sys_base_region_info` VALUES (1430, 1428, '岱岳区');
INSERT INTO `t_sys_base_region_info` VALUES (1431, 1428, '宁阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1432, 1428, '东平县');
INSERT INTO `t_sys_base_region_info` VALUES (1433, 1428, '新泰市');
INSERT INTO `t_sys_base_region_info` VALUES (1434, 1428, '肥城市');
INSERT INTO `t_sys_base_region_info` VALUES (1435, 1345, '威海市');
INSERT INTO `t_sys_base_region_info` VALUES (1436, 1435, '环翠区');
INSERT INTO `t_sys_base_region_info` VALUES (1437, 1435, '文登区');
INSERT INTO `t_sys_base_region_info` VALUES (1438, 1435, '荣成市');
INSERT INTO `t_sys_base_region_info` VALUES (1439, 1435, '乳山市');
INSERT INTO `t_sys_base_region_info` VALUES (1440, 1345, '日照市');
INSERT INTO `t_sys_base_region_info` VALUES (1441, 1440, '东港区');
INSERT INTO `t_sys_base_region_info` VALUES (1442, 1440, '岚山区');
INSERT INTO `t_sys_base_region_info` VALUES (1443, 1440, '五莲县');
INSERT INTO `t_sys_base_region_info` VALUES (1444, 1440, '莒县');
INSERT INTO `t_sys_base_region_info` VALUES (1445, 1345, '莱芜市');
INSERT INTO `t_sys_base_region_info` VALUES (1446, 1445, '莱城区');
INSERT INTO `t_sys_base_region_info` VALUES (1447, 1445, '钢城区');
INSERT INTO `t_sys_base_region_info` VALUES (1448, 1345, '临沂市');
INSERT INTO `t_sys_base_region_info` VALUES (1449, 1448, '兰山区');
INSERT INTO `t_sys_base_region_info` VALUES (1450, 1448, '罗庄区');
INSERT INTO `t_sys_base_region_info` VALUES (1451, 1448, '河东区');
INSERT INTO `t_sys_base_region_info` VALUES (1452, 1448, '沂南县');
INSERT INTO `t_sys_base_region_info` VALUES (1453, 1448, '郯城县');
INSERT INTO `t_sys_base_region_info` VALUES (1454, 1448, '沂水县');
INSERT INTO `t_sys_base_region_info` VALUES (1455, 1448, '兰陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1456, 1448, '费县');
INSERT INTO `t_sys_base_region_info` VALUES (1457, 1448, '平邑县');
INSERT INTO `t_sys_base_region_info` VALUES (1458, 1448, '莒南县');
INSERT INTO `t_sys_base_region_info` VALUES (1459, 1448, '蒙阴县');
INSERT INTO `t_sys_base_region_info` VALUES (1460, 1448, '临沭县');
INSERT INTO `t_sys_base_region_info` VALUES (1461, 1345, '德州市');
INSERT INTO `t_sys_base_region_info` VALUES (1462, 1461, '德城区');
INSERT INTO `t_sys_base_region_info` VALUES (1463, 1461, '陵城区');
INSERT INTO `t_sys_base_region_info` VALUES (1464, 1461, '宁津县');
INSERT INTO `t_sys_base_region_info` VALUES (1465, 1461, '庆云县');
INSERT INTO `t_sys_base_region_info` VALUES (1466, 1461, '临邑县');
INSERT INTO `t_sys_base_region_info` VALUES (1467, 1461, '齐河县');
INSERT INTO `t_sys_base_region_info` VALUES (1468, 1461, '平原县');
INSERT INTO `t_sys_base_region_info` VALUES (1469, 1461, '夏津县');
INSERT INTO `t_sys_base_region_info` VALUES (1470, 1461, '武城县');
INSERT INTO `t_sys_base_region_info` VALUES (1471, 1461, '乐陵市');
INSERT INTO `t_sys_base_region_info` VALUES (1472, 1461, '禹城市');
INSERT INTO `t_sys_base_region_info` VALUES (1473, 1345, '聊城市');
INSERT INTO `t_sys_base_region_info` VALUES (1474, 1473, '东昌府区');
INSERT INTO `t_sys_base_region_info` VALUES (1475, 1473, '阳谷县');
INSERT INTO `t_sys_base_region_info` VALUES (1476, 1473, '莘县');
INSERT INTO `t_sys_base_region_info` VALUES (1477, 1473, '茌平县');
INSERT INTO `t_sys_base_region_info` VALUES (1478, 1473, '东阿县');
INSERT INTO `t_sys_base_region_info` VALUES (1479, 1473, '冠县');
INSERT INTO `t_sys_base_region_info` VALUES (1480, 1473, '高唐县');
INSERT INTO `t_sys_base_region_info` VALUES (1481, 1473, '临清市');
INSERT INTO `t_sys_base_region_info` VALUES (1482, 1345, '滨州市');
INSERT INTO `t_sys_base_region_info` VALUES (1483, 1482, '滨城区');
INSERT INTO `t_sys_base_region_info` VALUES (1484, 1482, '沾化区');
INSERT INTO `t_sys_base_region_info` VALUES (1485, 1482, '惠民县');
INSERT INTO `t_sys_base_region_info` VALUES (1486, 1482, '阳信县');
INSERT INTO `t_sys_base_region_info` VALUES (1487, 1482, '无棣县');
INSERT INTO `t_sys_base_region_info` VALUES (1488, 1482, '博兴县');
INSERT INTO `t_sys_base_region_info` VALUES (1489, 1482, '邹平县');
INSERT INTO `t_sys_base_region_info` VALUES (1490, 1345, '菏泽市');
INSERT INTO `t_sys_base_region_info` VALUES (1491, 1490, '牡丹区');
INSERT INTO `t_sys_base_region_info` VALUES (1492, 1490, '定陶区');
INSERT INTO `t_sys_base_region_info` VALUES (1493, 1490, '曹县');
INSERT INTO `t_sys_base_region_info` VALUES (1494, 1490, '单县');
INSERT INTO `t_sys_base_region_info` VALUES (1495, 1490, '成武县');
INSERT INTO `t_sys_base_region_info` VALUES (1496, 1490, '巨野县');
INSERT INTO `t_sys_base_region_info` VALUES (1497, 1490, '郓城县');
INSERT INTO `t_sys_base_region_info` VALUES (1498, 1490, '鄄城县');
INSERT INTO `t_sys_base_region_info` VALUES (1499, 1490, '东明县');
INSERT INTO `t_sys_base_region_info` VALUES (1500, 0, '河南省');
INSERT INTO `t_sys_base_region_info` VALUES (1501, 1500, '郑州市');
INSERT INTO `t_sys_base_region_info` VALUES (1502, 1501, '中原区');
INSERT INTO `t_sys_base_region_info` VALUES (1503, 1501, '二七区');
INSERT INTO `t_sys_base_region_info` VALUES (1504, 1501, '管城回族区');
INSERT INTO `t_sys_base_region_info` VALUES (1505, 1501, '金水区');
INSERT INTO `t_sys_base_region_info` VALUES (1506, 1501, '上街区');
INSERT INTO `t_sys_base_region_info` VALUES (1507, 1501, '惠济区');
INSERT INTO `t_sys_base_region_info` VALUES (1508, 1501, '中牟县');
INSERT INTO `t_sys_base_region_info` VALUES (1509, 1501, '巩义市');
INSERT INTO `t_sys_base_region_info` VALUES (1510, 1501, '荥阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1511, 1501, '新密市');
INSERT INTO `t_sys_base_region_info` VALUES (1512, 1501, '新郑市');
INSERT INTO `t_sys_base_region_info` VALUES (1513, 1501, '登封市');
INSERT INTO `t_sys_base_region_info` VALUES (1514, 1500, '开封市');
INSERT INTO `t_sys_base_region_info` VALUES (1515, 1514, '龙亭区');
INSERT INTO `t_sys_base_region_info` VALUES (1516, 1514, '顺河回族区');
INSERT INTO `t_sys_base_region_info` VALUES (1517, 1514, '鼓楼区');
INSERT INTO `t_sys_base_region_info` VALUES (1518, 1514, '禹王台区');
INSERT INTO `t_sys_base_region_info` VALUES (1519, 1514, '祥符区');
INSERT INTO `t_sys_base_region_info` VALUES (1520, 1514, '杞县');
INSERT INTO `t_sys_base_region_info` VALUES (1521, 1514, '通许县');
INSERT INTO `t_sys_base_region_info` VALUES (1522, 1514, '尉氏县');
INSERT INTO `t_sys_base_region_info` VALUES (1523, 1514, '兰考县');
INSERT INTO `t_sys_base_region_info` VALUES (1524, 1500, '洛阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1525, 1524, '老城区');
INSERT INTO `t_sys_base_region_info` VALUES (1526, 1524, '西工区');
INSERT INTO `t_sys_base_region_info` VALUES (1527, 1524, '瀍河回族区');
INSERT INTO `t_sys_base_region_info` VALUES (1528, 1524, '涧西区');
INSERT INTO `t_sys_base_region_info` VALUES (1529, 1524, '吉利区');
INSERT INTO `t_sys_base_region_info` VALUES (1530, 1524, '洛龙区');
INSERT INTO `t_sys_base_region_info` VALUES (1531, 1524, '孟津县');
INSERT INTO `t_sys_base_region_info` VALUES (1532, 1524, '新安县');
INSERT INTO `t_sys_base_region_info` VALUES (1533, 1524, '栾川县');
INSERT INTO `t_sys_base_region_info` VALUES (1534, 1524, '嵩县');
INSERT INTO `t_sys_base_region_info` VALUES (1535, 1524, '汝阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1536, 1524, '宜阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1537, 1524, '洛宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1538, 1524, '伊川县');
INSERT INTO `t_sys_base_region_info` VALUES (1539, 1524, '偃师市');
INSERT INTO `t_sys_base_region_info` VALUES (1540, 1500, '平顶山市');
INSERT INTO `t_sys_base_region_info` VALUES (1541, 1540, '新华区');
INSERT INTO `t_sys_base_region_info` VALUES (1542, 1540, '卫东区');
INSERT INTO `t_sys_base_region_info` VALUES (1543, 1540, '石龙区');
INSERT INTO `t_sys_base_region_info` VALUES (1544, 1540, '湛河区');
INSERT INTO `t_sys_base_region_info` VALUES (1545, 1540, '宝丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1546, 1540, '叶县');
INSERT INTO `t_sys_base_region_info` VALUES (1547, 1540, '鲁山县');
INSERT INTO `t_sys_base_region_info` VALUES (1548, 1540, '郏县');
INSERT INTO `t_sys_base_region_info` VALUES (1549, 1540, '舞钢市');
INSERT INTO `t_sys_base_region_info` VALUES (1550, 1540, '汝州市');
INSERT INTO `t_sys_base_region_info` VALUES (1551, 1500, '安阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1552, 1551, '文峰区');
INSERT INTO `t_sys_base_region_info` VALUES (1553, 1551, '北关区');
INSERT INTO `t_sys_base_region_info` VALUES (1554, 1551, '殷都区');
INSERT INTO `t_sys_base_region_info` VALUES (1555, 1551, '龙安区');
INSERT INTO `t_sys_base_region_info` VALUES (1556, 1551, '安阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1557, 1551, '汤阴县');
INSERT INTO `t_sys_base_region_info` VALUES (1558, 1551, '滑县');
INSERT INTO `t_sys_base_region_info` VALUES (1559, 1551, '内黄县');
INSERT INTO `t_sys_base_region_info` VALUES (1560, 1551, '林州市');
INSERT INTO `t_sys_base_region_info` VALUES (1561, 1500, '鹤壁市');
INSERT INTO `t_sys_base_region_info` VALUES (1562, 1561, '鹤山区');
INSERT INTO `t_sys_base_region_info` VALUES (1563, 1561, '山城区');
INSERT INTO `t_sys_base_region_info` VALUES (1564, 1561, '淇滨区');
INSERT INTO `t_sys_base_region_info` VALUES (1565, 1561, '浚县');
INSERT INTO `t_sys_base_region_info` VALUES (1566, 1561, '淇县');
INSERT INTO `t_sys_base_region_info` VALUES (1567, 1500, '新乡市');
INSERT INTO `t_sys_base_region_info` VALUES (1568, 1567, '红旗区');
INSERT INTO `t_sys_base_region_info` VALUES (1569, 1567, '卫滨区');
INSERT INTO `t_sys_base_region_info` VALUES (1570, 1567, '凤泉区');
INSERT INTO `t_sys_base_region_info` VALUES (1571, 1567, '牧野区');
INSERT INTO `t_sys_base_region_info` VALUES (1572, 1567, '新乡县');
INSERT INTO `t_sys_base_region_info` VALUES (1573, 1567, '获嘉县');
INSERT INTO `t_sys_base_region_info` VALUES (1574, 1567, '原阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1575, 1567, '延津县');
INSERT INTO `t_sys_base_region_info` VALUES (1576, 1567, '封丘县');
INSERT INTO `t_sys_base_region_info` VALUES (1577, 1567, '长垣县');
INSERT INTO `t_sys_base_region_info` VALUES (1578, 1567, '卫辉市');
INSERT INTO `t_sys_base_region_info` VALUES (1579, 1567, '辉县市');
INSERT INTO `t_sys_base_region_info` VALUES (1580, 1500, '焦作市');
INSERT INTO `t_sys_base_region_info` VALUES (1581, 1580, '解放区');
INSERT INTO `t_sys_base_region_info` VALUES (1582, 1580, '中站区');
INSERT INTO `t_sys_base_region_info` VALUES (1583, 1580, '马村区');
INSERT INTO `t_sys_base_region_info` VALUES (1584, 1580, '山阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1585, 1580, '修武县');
INSERT INTO `t_sys_base_region_info` VALUES (1586, 1580, '博爱县');
INSERT INTO `t_sys_base_region_info` VALUES (1587, 1580, '武陟县');
INSERT INTO `t_sys_base_region_info` VALUES (1588, 1580, '温县');
INSERT INTO `t_sys_base_region_info` VALUES (1589, 1580, '沁阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1590, 1580, '孟州市');
INSERT INTO `t_sys_base_region_info` VALUES (1591, 1500, '濮阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1592, 1591, '华龙区');
INSERT INTO `t_sys_base_region_info` VALUES (1593, 1591, '清丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1594, 1591, '南乐县');
INSERT INTO `t_sys_base_region_info` VALUES (1595, 1591, '范县');
INSERT INTO `t_sys_base_region_info` VALUES (1596, 1591, '台前县');
INSERT INTO `t_sys_base_region_info` VALUES (1597, 1591, '濮阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1598, 1500, '许昌市');
INSERT INTO `t_sys_base_region_info` VALUES (1599, 1598, '魏都区');
INSERT INTO `t_sys_base_region_info` VALUES (1600, 1598, '建安区');
INSERT INTO `t_sys_base_region_info` VALUES (1601, 1598, '鄢陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1602, 1598, '襄城县');
INSERT INTO `t_sys_base_region_info` VALUES (1603, 1598, '禹州市');
INSERT INTO `t_sys_base_region_info` VALUES (1604, 1598, '长葛市');
INSERT INTO `t_sys_base_region_info` VALUES (1605, 1500, '漯河市');
INSERT INTO `t_sys_base_region_info` VALUES (1606, 1605, '源汇区');
INSERT INTO `t_sys_base_region_info` VALUES (1607, 1605, '郾城区');
INSERT INTO `t_sys_base_region_info` VALUES (1608, 1605, '召陵区');
INSERT INTO `t_sys_base_region_info` VALUES (1609, 1605, '舞阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1610, 1605, '临颍县');
INSERT INTO `t_sys_base_region_info` VALUES (1611, 1500, '三门峡市');
INSERT INTO `t_sys_base_region_info` VALUES (1612, 1611, '湖滨区');
INSERT INTO `t_sys_base_region_info` VALUES (1613, 1611, '陕州区');
INSERT INTO `t_sys_base_region_info` VALUES (1614, 1611, '渑池县');
INSERT INTO `t_sys_base_region_info` VALUES (1615, 1611, '卢氏县');
INSERT INTO `t_sys_base_region_info` VALUES (1616, 1611, '义马市');
INSERT INTO `t_sys_base_region_info` VALUES (1617, 1611, '灵宝市');
INSERT INTO `t_sys_base_region_info` VALUES (1618, 1500, '南阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1619, 1618, '宛城区');
INSERT INTO `t_sys_base_region_info` VALUES (1620, 1618, '卧龙区');
INSERT INTO `t_sys_base_region_info` VALUES (1621, 1618, '南召县');
INSERT INTO `t_sys_base_region_info` VALUES (1622, 1618, '方城县');
INSERT INTO `t_sys_base_region_info` VALUES (1623, 1618, '西峡县');
INSERT INTO `t_sys_base_region_info` VALUES (1624, 1618, '镇平县');
INSERT INTO `t_sys_base_region_info` VALUES (1625, 1618, '内乡县');
INSERT INTO `t_sys_base_region_info` VALUES (1626, 1618, '淅川县');
INSERT INTO `t_sys_base_region_info` VALUES (1627, 1618, '社旗县');
INSERT INTO `t_sys_base_region_info` VALUES (1628, 1618, '唐河县');
INSERT INTO `t_sys_base_region_info` VALUES (1629, 1618, '新野县');
INSERT INTO `t_sys_base_region_info` VALUES (1630, 1618, '桐柏县');
INSERT INTO `t_sys_base_region_info` VALUES (1631, 1618, '邓州市');
INSERT INTO `t_sys_base_region_info` VALUES (1632, 1500, '商丘市');
INSERT INTO `t_sys_base_region_info` VALUES (1633, 1632, '梁园区');
INSERT INTO `t_sys_base_region_info` VALUES (1634, 1632, '睢阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1635, 1632, '民权县');
INSERT INTO `t_sys_base_region_info` VALUES (1636, 1632, '睢县');
INSERT INTO `t_sys_base_region_info` VALUES (1637, 1632, '宁陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1638, 1632, '柘城县');
INSERT INTO `t_sys_base_region_info` VALUES (1639, 1632, '虞城县');
INSERT INTO `t_sys_base_region_info` VALUES (1640, 1632, '夏邑县');
INSERT INTO `t_sys_base_region_info` VALUES (1641, 1632, '永城市');
INSERT INTO `t_sys_base_region_info` VALUES (1642, 1500, '信阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1643, 1642, '浉河区');
INSERT INTO `t_sys_base_region_info` VALUES (1644, 1642, '平桥区');
INSERT INTO `t_sys_base_region_info` VALUES (1645, 1642, '罗山县');
INSERT INTO `t_sys_base_region_info` VALUES (1646, 1642, '光山县');
INSERT INTO `t_sys_base_region_info` VALUES (1647, 1642, '新县');
INSERT INTO `t_sys_base_region_info` VALUES (1648, 1642, '商城县');
INSERT INTO `t_sys_base_region_info` VALUES (1649, 1642, '固始县');
INSERT INTO `t_sys_base_region_info` VALUES (1650, 1642, '潢川县');
INSERT INTO `t_sys_base_region_info` VALUES (1651, 1642, '淮滨县');
INSERT INTO `t_sys_base_region_info` VALUES (1652, 1642, '息县');
INSERT INTO `t_sys_base_region_info` VALUES (1653, 1500, '周口市');
INSERT INTO `t_sys_base_region_info` VALUES (1654, 1653, '川汇区');
INSERT INTO `t_sys_base_region_info` VALUES (1655, 1653, '扶沟县');
INSERT INTO `t_sys_base_region_info` VALUES (1656, 1653, '西华县');
INSERT INTO `t_sys_base_region_info` VALUES (1657, 1653, '商水县');
INSERT INTO `t_sys_base_region_info` VALUES (1658, 1653, '沈丘县');
INSERT INTO `t_sys_base_region_info` VALUES (1659, 1653, '郸城县');
INSERT INTO `t_sys_base_region_info` VALUES (1660, 1653, '淮阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1661, 1653, '太康县');
INSERT INTO `t_sys_base_region_info` VALUES (1662, 1653, '鹿邑县');
INSERT INTO `t_sys_base_region_info` VALUES (1663, 1653, '项城市');
INSERT INTO `t_sys_base_region_info` VALUES (1664, 1500, '驻马店市');
INSERT INTO `t_sys_base_region_info` VALUES (1665, 1664, '驿城区');
INSERT INTO `t_sys_base_region_info` VALUES (1666, 1664, '西平县');
INSERT INTO `t_sys_base_region_info` VALUES (1667, 1664, '上蔡县');
INSERT INTO `t_sys_base_region_info` VALUES (1668, 1664, '平舆县');
INSERT INTO `t_sys_base_region_info` VALUES (1669, 1664, '正阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1670, 1664, '确山县');
INSERT INTO `t_sys_base_region_info` VALUES (1671, 1664, '泌阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1672, 1664, '汝南县');
INSERT INTO `t_sys_base_region_info` VALUES (1673, 1664, '遂平县');
INSERT INTO `t_sys_base_region_info` VALUES (1674, 1664, '新蔡县');
INSERT INTO `t_sys_base_region_info` VALUES (1675, 1500, '济源市');
INSERT INTO `t_sys_base_region_info` VALUES (1676, 0, '湖北省');
INSERT INTO `t_sys_base_region_info` VALUES (1677, 1676, '武汉市');
INSERT INTO `t_sys_base_region_info` VALUES (1678, 1677, '江岸区');
INSERT INTO `t_sys_base_region_info` VALUES (1679, 1677, '江汉区');
INSERT INTO `t_sys_base_region_info` VALUES (1680, 1677, '硚口区');
INSERT INTO `t_sys_base_region_info` VALUES (1681, 1677, '汉阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1682, 1677, '武昌区');
INSERT INTO `t_sys_base_region_info` VALUES (1683, 1677, '青山区');
INSERT INTO `t_sys_base_region_info` VALUES (1684, 1677, '洪山区');
INSERT INTO `t_sys_base_region_info` VALUES (1685, 1677, '东西湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1686, 1677, '汉南区');
INSERT INTO `t_sys_base_region_info` VALUES (1687, 1677, '蔡甸区');
INSERT INTO `t_sys_base_region_info` VALUES (1688, 1677, '江夏区');
INSERT INTO `t_sys_base_region_info` VALUES (1689, 1677, '黄陂区');
INSERT INTO `t_sys_base_region_info` VALUES (1690, 1677, '新洲区');
INSERT INTO `t_sys_base_region_info` VALUES (1691, 1676, '黄石市');
INSERT INTO `t_sys_base_region_info` VALUES (1692, 1691, '黄石港区');
INSERT INTO `t_sys_base_region_info` VALUES (1693, 1691, '西塞山区');
INSERT INTO `t_sys_base_region_info` VALUES (1694, 1691, '下陆区');
INSERT INTO `t_sys_base_region_info` VALUES (1695, 1691, '铁山区');
INSERT INTO `t_sys_base_region_info` VALUES (1696, 1691, '阳新县');
INSERT INTO `t_sys_base_region_info` VALUES (1697, 1691, '大冶市');
INSERT INTO `t_sys_base_region_info` VALUES (1698, 1676, '十堰市');
INSERT INTO `t_sys_base_region_info` VALUES (1699, 1698, '茅箭区');
INSERT INTO `t_sys_base_region_info` VALUES (1700, 1698, '张湾区');
INSERT INTO `t_sys_base_region_info` VALUES (1701, 1698, '郧阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1702, 1698, '郧西县');
INSERT INTO `t_sys_base_region_info` VALUES (1703, 1698, '竹山县');
INSERT INTO `t_sys_base_region_info` VALUES (1704, 1698, '竹溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1705, 1698, '房县');
INSERT INTO `t_sys_base_region_info` VALUES (1706, 1698, '丹江口市');
INSERT INTO `t_sys_base_region_info` VALUES (1707, 1676, '宜昌市');
INSERT INTO `t_sys_base_region_info` VALUES (1708, 1707, '西陵区');
INSERT INTO `t_sys_base_region_info` VALUES (1709, 1707, '伍家岗区');
INSERT INTO `t_sys_base_region_info` VALUES (1710, 1707, '点军区');
INSERT INTO `t_sys_base_region_info` VALUES (1711, 1707, '猇亭区');
INSERT INTO `t_sys_base_region_info` VALUES (1712, 1707, '夷陵区');
INSERT INTO `t_sys_base_region_info` VALUES (1713, 1707, '远安县');
INSERT INTO `t_sys_base_region_info` VALUES (1714, 1707, '兴山县');
INSERT INTO `t_sys_base_region_info` VALUES (1715, 1707, '秭归县');
INSERT INTO `t_sys_base_region_info` VALUES (1716, 1707, '长阳土家族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1717, 1707, '五峰土家族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1718, 1707, '宜都市');
INSERT INTO `t_sys_base_region_info` VALUES (1719, 1707, '当阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1720, 1707, '枝江市');
INSERT INTO `t_sys_base_region_info` VALUES (1721, 1676, '襄阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1722, 1721, '襄城区');
INSERT INTO `t_sys_base_region_info` VALUES (1723, 1721, '樊城区');
INSERT INTO `t_sys_base_region_info` VALUES (1724, 1721, '襄州区');
INSERT INTO `t_sys_base_region_info` VALUES (1725, 1721, '南漳县');
INSERT INTO `t_sys_base_region_info` VALUES (1726, 1721, '谷城县');
INSERT INTO `t_sys_base_region_info` VALUES (1727, 1721, '保康县');
INSERT INTO `t_sys_base_region_info` VALUES (1728, 1721, '老河口市');
INSERT INTO `t_sys_base_region_info` VALUES (1729, 1721, '枣阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1730, 1721, '宜城市');
INSERT INTO `t_sys_base_region_info` VALUES (1731, 1676, '鄂州市');
INSERT INTO `t_sys_base_region_info` VALUES (1732, 1731, '梁子湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1733, 1731, '华容区');
INSERT INTO `t_sys_base_region_info` VALUES (1734, 1731, '鄂城区');
INSERT INTO `t_sys_base_region_info` VALUES (1735, 1676, '荆门市');
INSERT INTO `t_sys_base_region_info` VALUES (1736, 1735, '东宝区');
INSERT INTO `t_sys_base_region_info` VALUES (1737, 1735, '掇刀区');
INSERT INTO `t_sys_base_region_info` VALUES (1738, 1735, '京山县');
INSERT INTO `t_sys_base_region_info` VALUES (1739, 1735, '沙洋县');
INSERT INTO `t_sys_base_region_info` VALUES (1740, 1735, '钟祥市');
INSERT INTO `t_sys_base_region_info` VALUES (1741, 1676, '孝感市');
INSERT INTO `t_sys_base_region_info` VALUES (1742, 1741, '孝南区');
INSERT INTO `t_sys_base_region_info` VALUES (1743, 1741, '孝昌县');
INSERT INTO `t_sys_base_region_info` VALUES (1744, 1741, '大悟县');
INSERT INTO `t_sys_base_region_info` VALUES (1745, 1741, '云梦县');
INSERT INTO `t_sys_base_region_info` VALUES (1746, 1741, '应城市');
INSERT INTO `t_sys_base_region_info` VALUES (1747, 1741, '安陆市');
INSERT INTO `t_sys_base_region_info` VALUES (1748, 1741, '汉川市');
INSERT INTO `t_sys_base_region_info` VALUES (1749, 1676, '荆州市');
INSERT INTO `t_sys_base_region_info` VALUES (1750, 1749, '沙市区');
INSERT INTO `t_sys_base_region_info` VALUES (1751, 1749, '荆州区');
INSERT INTO `t_sys_base_region_info` VALUES (1752, 1749, '公安县');
INSERT INTO `t_sys_base_region_info` VALUES (1753, 1749, '监利县');
INSERT INTO `t_sys_base_region_info` VALUES (1754, 1749, '江陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1755, 1749, '石首市');
INSERT INTO `t_sys_base_region_info` VALUES (1756, 1749, '洪湖市');
INSERT INTO `t_sys_base_region_info` VALUES (1757, 1749, '松滋市');
INSERT INTO `t_sys_base_region_info` VALUES (1758, 1676, '黄冈市');
INSERT INTO `t_sys_base_region_info` VALUES (1759, 1758, '黄州区');
INSERT INTO `t_sys_base_region_info` VALUES (1760, 1758, '团风县');
INSERT INTO `t_sys_base_region_info` VALUES (1761, 1758, '红安县');
INSERT INTO `t_sys_base_region_info` VALUES (1762, 1758, '罗田县');
INSERT INTO `t_sys_base_region_info` VALUES (1763, 1758, '英山县');
INSERT INTO `t_sys_base_region_info` VALUES (1764, 1758, '浠水县');
INSERT INTO `t_sys_base_region_info` VALUES (1765, 1758, '蕲春县');
INSERT INTO `t_sys_base_region_info` VALUES (1766, 1758, '黄梅县');
INSERT INTO `t_sys_base_region_info` VALUES (1767, 1758, '麻城市');
INSERT INTO `t_sys_base_region_info` VALUES (1768, 1758, '武穴市');
INSERT INTO `t_sys_base_region_info` VALUES (1769, 1676, '咸宁市');
INSERT INTO `t_sys_base_region_info` VALUES (1770, 1769, '咸安区');
INSERT INTO `t_sys_base_region_info` VALUES (1771, 1769, '嘉鱼县');
INSERT INTO `t_sys_base_region_info` VALUES (1772, 1769, '通城县');
INSERT INTO `t_sys_base_region_info` VALUES (1773, 1769, '崇阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1774, 1769, '通山县');
INSERT INTO `t_sys_base_region_info` VALUES (1775, 1769, '赤壁市');
INSERT INTO `t_sys_base_region_info` VALUES (1776, 1676, '随州市');
INSERT INTO `t_sys_base_region_info` VALUES (1777, 1776, '曾都区');
INSERT INTO `t_sys_base_region_info` VALUES (1778, 1776, '随县');
INSERT INTO `t_sys_base_region_info` VALUES (1779, 1776, '广水市');
INSERT INTO `t_sys_base_region_info` VALUES (1780, 1676, '恩施土家族苗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (1781, 1780, '恩施市');
INSERT INTO `t_sys_base_region_info` VALUES (1782, 1780, '利川市');
INSERT INTO `t_sys_base_region_info` VALUES (1783, 1780, '建始县');
INSERT INTO `t_sys_base_region_info` VALUES (1784, 1780, '巴东县');
INSERT INTO `t_sys_base_region_info` VALUES (1785, 1780, '宣恩县');
INSERT INTO `t_sys_base_region_info` VALUES (1786, 1780, '咸丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1787, 1780, '来凤县');
INSERT INTO `t_sys_base_region_info` VALUES (1788, 1780, '鹤峰县');
INSERT INTO `t_sys_base_region_info` VALUES (1789, 1676, '仙桃市');
INSERT INTO `t_sys_base_region_info` VALUES (1790, 1676, '潜江市');
INSERT INTO `t_sys_base_region_info` VALUES (1791, 1676, '天门市');
INSERT INTO `t_sys_base_region_info` VALUES (1792, 1676, '神农架林区');
INSERT INTO `t_sys_base_region_info` VALUES (1793, 0, '湖南省');
INSERT INTO `t_sys_base_region_info` VALUES (1794, 1793, '长沙市');
INSERT INTO `t_sys_base_region_info` VALUES (1795, 1794, '芙蓉区');
INSERT INTO `t_sys_base_region_info` VALUES (1796, 1794, '天心区');
INSERT INTO `t_sys_base_region_info` VALUES (1797, 1794, '岳麓区');
INSERT INTO `t_sys_base_region_info` VALUES (1798, 1794, '开福区');
INSERT INTO `t_sys_base_region_info` VALUES (1799, 1794, '雨花区');
INSERT INTO `t_sys_base_region_info` VALUES (1800, 1794, '望城区');
INSERT INTO `t_sys_base_region_info` VALUES (1801, 1794, '长沙县');
INSERT INTO `t_sys_base_region_info` VALUES (1802, 1794, '宁乡市');
INSERT INTO `t_sys_base_region_info` VALUES (1803, 1794, '浏阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1804, 1793, '株洲市');
INSERT INTO `t_sys_base_region_info` VALUES (1805, 1804, '荷塘区');
INSERT INTO `t_sys_base_region_info` VALUES (1806, 1804, '芦淞区');
INSERT INTO `t_sys_base_region_info` VALUES (1807, 1804, '石峰区');
INSERT INTO `t_sys_base_region_info` VALUES (1808, 1804, '天元区');
INSERT INTO `t_sys_base_region_info` VALUES (1809, 1804, '株洲县');
INSERT INTO `t_sys_base_region_info` VALUES (1810, 1804, '攸县');
INSERT INTO `t_sys_base_region_info` VALUES (1811, 1804, '茶陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1812, 1804, '炎陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1813, 1804, '醴陵市');
INSERT INTO `t_sys_base_region_info` VALUES (1814, 1793, '湘潭市');
INSERT INTO `t_sys_base_region_info` VALUES (1815, 1814, '雨湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1816, 1814, '岳塘区');
INSERT INTO `t_sys_base_region_info` VALUES (1817, 1814, '湘潭县');
INSERT INTO `t_sys_base_region_info` VALUES (1818, 1814, '湘乡市');
INSERT INTO `t_sys_base_region_info` VALUES (1819, 1814, '韶山市');
INSERT INTO `t_sys_base_region_info` VALUES (1820, 1793, '衡阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1821, 1820, '珠晖区');
INSERT INTO `t_sys_base_region_info` VALUES (1822, 1820, '雁峰区');
INSERT INTO `t_sys_base_region_info` VALUES (1823, 1820, '石鼓区');
INSERT INTO `t_sys_base_region_info` VALUES (1824, 1820, '蒸湘区');
INSERT INTO `t_sys_base_region_info` VALUES (1825, 1820, '南岳区');
INSERT INTO `t_sys_base_region_info` VALUES (1826, 1820, '衡阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1827, 1820, '衡南县');
INSERT INTO `t_sys_base_region_info` VALUES (1828, 1820, '衡山县');
INSERT INTO `t_sys_base_region_info` VALUES (1829, 1820, '衡东县');
INSERT INTO `t_sys_base_region_info` VALUES (1830, 1820, '祁东县');
INSERT INTO `t_sys_base_region_info` VALUES (1831, 1820, '耒阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1832, 1820, '常宁市');
INSERT INTO `t_sys_base_region_info` VALUES (1833, 1793, '邵阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1834, 1833, '双清区');
INSERT INTO `t_sys_base_region_info` VALUES (1835, 1833, '大祥区');
INSERT INTO `t_sys_base_region_info` VALUES (1836, 1833, '北塔区');
INSERT INTO `t_sys_base_region_info` VALUES (1837, 1833, '邵东县');
INSERT INTO `t_sys_base_region_info` VALUES (1838, 1833, '新邵县');
INSERT INTO `t_sys_base_region_info` VALUES (1839, 1833, '邵阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1840, 1833, '隆回县');
INSERT INTO `t_sys_base_region_info` VALUES (1841, 1833, '洞口县');
INSERT INTO `t_sys_base_region_info` VALUES (1842, 1833, '绥宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1843, 1833, '新宁县');
INSERT INTO `t_sys_base_region_info` VALUES (1844, 1833, '城步苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1845, 1833, '武冈市');
INSERT INTO `t_sys_base_region_info` VALUES (1846, 1793, '岳阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1847, 1846, '岳阳楼区');
INSERT INTO `t_sys_base_region_info` VALUES (1848, 1846, '云溪区');
INSERT INTO `t_sys_base_region_info` VALUES (1849, 1846, '君山区');
INSERT INTO `t_sys_base_region_info` VALUES (1850, 1846, '岳阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1851, 1846, '华容县');
INSERT INTO `t_sys_base_region_info` VALUES (1852, 1846, '湘阴县');
INSERT INTO `t_sys_base_region_info` VALUES (1853, 1846, '平江县');
INSERT INTO `t_sys_base_region_info` VALUES (1854, 1846, '汨罗市');
INSERT INTO `t_sys_base_region_info` VALUES (1855, 1846, '临湘市');
INSERT INTO `t_sys_base_region_info` VALUES (1856, 1793, '常德市');
INSERT INTO `t_sys_base_region_info` VALUES (1857, 1856, '武陵区');
INSERT INTO `t_sys_base_region_info` VALUES (1858, 1856, '鼎城区');
INSERT INTO `t_sys_base_region_info` VALUES (1859, 1856, '安乡县');
INSERT INTO `t_sys_base_region_info` VALUES (1860, 1856, '汉寿县');
INSERT INTO `t_sys_base_region_info` VALUES (1861, 1856, '澧县');
INSERT INTO `t_sys_base_region_info` VALUES (1862, 1856, '临澧县');
INSERT INTO `t_sys_base_region_info` VALUES (1863, 1856, '桃源县');
INSERT INTO `t_sys_base_region_info` VALUES (1864, 1856, '石门县');
INSERT INTO `t_sys_base_region_info` VALUES (1865, 1856, '津市市');
INSERT INTO `t_sys_base_region_info` VALUES (1866, 1793, '张家界市');
INSERT INTO `t_sys_base_region_info` VALUES (1867, 1866, '永定区');
INSERT INTO `t_sys_base_region_info` VALUES (1868, 1866, '武陵源区');
INSERT INTO `t_sys_base_region_info` VALUES (1869, 1866, '慈利县');
INSERT INTO `t_sys_base_region_info` VALUES (1870, 1866, '桑植县');
INSERT INTO `t_sys_base_region_info` VALUES (1871, 1793, '益阳市');
INSERT INTO `t_sys_base_region_info` VALUES (1872, 1871, '资阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1873, 1871, '赫山区');
INSERT INTO `t_sys_base_region_info` VALUES (1874, 1871, '南县');
INSERT INTO `t_sys_base_region_info` VALUES (1875, 1871, '桃江县');
INSERT INTO `t_sys_base_region_info` VALUES (1876, 1871, '安化县');
INSERT INTO `t_sys_base_region_info` VALUES (1877, 1871, '沅江市');
INSERT INTO `t_sys_base_region_info` VALUES (1878, 1793, '郴州市');
INSERT INTO `t_sys_base_region_info` VALUES (1879, 1878, '北湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1880, 1878, '苏仙区');
INSERT INTO `t_sys_base_region_info` VALUES (1881, 1878, '桂阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1882, 1878, '宜章县');
INSERT INTO `t_sys_base_region_info` VALUES (1883, 1878, '永兴县');
INSERT INTO `t_sys_base_region_info` VALUES (1884, 1878, '嘉禾县');
INSERT INTO `t_sys_base_region_info` VALUES (1885, 1878, '临武县');
INSERT INTO `t_sys_base_region_info` VALUES (1886, 1878, '汝城县');
INSERT INTO `t_sys_base_region_info` VALUES (1887, 1878, '桂东县');
INSERT INTO `t_sys_base_region_info` VALUES (1888, 1878, '安仁县');
INSERT INTO `t_sys_base_region_info` VALUES (1889, 1878, '资兴市');
INSERT INTO `t_sys_base_region_info` VALUES (1890, 1793, '永州市');
INSERT INTO `t_sys_base_region_info` VALUES (1891, 1890, '零陵区');
INSERT INTO `t_sys_base_region_info` VALUES (1892, 1890, '冷水滩区');
INSERT INTO `t_sys_base_region_info` VALUES (1893, 1890, '祁阳县');
INSERT INTO `t_sys_base_region_info` VALUES (1894, 1890, '东安县');
INSERT INTO `t_sys_base_region_info` VALUES (1895, 1890, '双牌县');
INSERT INTO `t_sys_base_region_info` VALUES (1896, 1890, '道县');
INSERT INTO `t_sys_base_region_info` VALUES (1897, 1890, '江永县');
INSERT INTO `t_sys_base_region_info` VALUES (1898, 1890, '宁远县');
INSERT INTO `t_sys_base_region_info` VALUES (1899, 1890, '蓝山县');
INSERT INTO `t_sys_base_region_info` VALUES (1900, 1890, '新田县');
INSERT INTO `t_sys_base_region_info` VALUES (1901, 1890, '江华瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1902, 1793, '怀化市');
INSERT INTO `t_sys_base_region_info` VALUES (1903, 1902, '鹤城区');
INSERT INTO `t_sys_base_region_info` VALUES (1904, 1902, '中方县');
INSERT INTO `t_sys_base_region_info` VALUES (1905, 1902, '沅陵县');
INSERT INTO `t_sys_base_region_info` VALUES (1906, 1902, '辰溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1907, 1902, '溆浦县');
INSERT INTO `t_sys_base_region_info` VALUES (1908, 1902, '会同县');
INSERT INTO `t_sys_base_region_info` VALUES (1909, 1902, '麻阳苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1910, 1902, '新晃侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1911, 1902, '芷江侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1912, 1902, '靖州苗族侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1913, 1902, '通道侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1914, 1902, '洪江市');
INSERT INTO `t_sys_base_region_info` VALUES (1915, 1793, '娄底市');
INSERT INTO `t_sys_base_region_info` VALUES (1916, 1915, '娄星区');
INSERT INTO `t_sys_base_region_info` VALUES (1917, 1915, '双峰县');
INSERT INTO `t_sys_base_region_info` VALUES (1918, 1915, '新化县');
INSERT INTO `t_sys_base_region_info` VALUES (1919, 1915, '冷水江市');
INSERT INTO `t_sys_base_region_info` VALUES (1920, 1915, '涟源市');
INSERT INTO `t_sys_base_region_info` VALUES (1921, 1793, '湘西土家族苗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (1922, 1921, '吉首市');
INSERT INTO `t_sys_base_region_info` VALUES (1923, 1921, '泸溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1924, 1921, '凤凰县');
INSERT INTO `t_sys_base_region_info` VALUES (1925, 1921, '花垣县');
INSERT INTO `t_sys_base_region_info` VALUES (1926, 1921, '保靖县');
INSERT INTO `t_sys_base_region_info` VALUES (1927, 1921, '古丈县');
INSERT INTO `t_sys_base_region_info` VALUES (1928, 1921, '永顺县');
INSERT INTO `t_sys_base_region_info` VALUES (1929, 1921, '龙山县');
INSERT INTO `t_sys_base_region_info` VALUES (1930, 0, '广东省');
INSERT INTO `t_sys_base_region_info` VALUES (1931, 1930, '广州市');
INSERT INTO `t_sys_base_region_info` VALUES (1932, 1931, '荔湾区');
INSERT INTO `t_sys_base_region_info` VALUES (1933, 1931, '越秀区');
INSERT INTO `t_sys_base_region_info` VALUES (1934, 1931, '海珠区');
INSERT INTO `t_sys_base_region_info` VALUES (1935, 1931, '天河区');
INSERT INTO `t_sys_base_region_info` VALUES (1936, 1931, '白云区');
INSERT INTO `t_sys_base_region_info` VALUES (1937, 1931, '黄埔区');
INSERT INTO `t_sys_base_region_info` VALUES (1938, 1931, '番禺区');
INSERT INTO `t_sys_base_region_info` VALUES (1939, 1931, '花都区');
INSERT INTO `t_sys_base_region_info` VALUES (1940, 1931, '南沙区');
INSERT INTO `t_sys_base_region_info` VALUES (1941, 1931, '从化区');
INSERT INTO `t_sys_base_region_info` VALUES (1942, 1931, '增城区');
INSERT INTO `t_sys_base_region_info` VALUES (1943, 1930, '韶关市');
INSERT INTO `t_sys_base_region_info` VALUES (1944, 1943, '武江区');
INSERT INTO `t_sys_base_region_info` VALUES (1945, 1943, '浈江区');
INSERT INTO `t_sys_base_region_info` VALUES (1946, 1943, '曲江区');
INSERT INTO `t_sys_base_region_info` VALUES (1947, 1943, '始兴县');
INSERT INTO `t_sys_base_region_info` VALUES (1948, 1943, '仁化县');
INSERT INTO `t_sys_base_region_info` VALUES (1949, 1943, '翁源县');
INSERT INTO `t_sys_base_region_info` VALUES (1950, 1943, '乳源瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (1951, 1943, '新丰县');
INSERT INTO `t_sys_base_region_info` VALUES (1952, 1943, '乐昌市');
INSERT INTO `t_sys_base_region_info` VALUES (1953, 1943, '南雄市');
INSERT INTO `t_sys_base_region_info` VALUES (1954, 1930, '深圳市');
INSERT INTO `t_sys_base_region_info` VALUES (1955, 1954, '罗湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1956, 1954, '福田区');
INSERT INTO `t_sys_base_region_info` VALUES (1957, 1954, '南山区');
INSERT INTO `t_sys_base_region_info` VALUES (1958, 1954, '宝安区');
INSERT INTO `t_sys_base_region_info` VALUES (1959, 1954, '龙岗区');
INSERT INTO `t_sys_base_region_info` VALUES (1960, 1954, '盐田区');
INSERT INTO `t_sys_base_region_info` VALUES (1961, 1954, '龙华区');
INSERT INTO `t_sys_base_region_info` VALUES (1962, 1954, '坪山区');
INSERT INTO `t_sys_base_region_info` VALUES (1963, 1930, '珠海市');
INSERT INTO `t_sys_base_region_info` VALUES (1964, 1963, '香洲区');
INSERT INTO `t_sys_base_region_info` VALUES (1965, 1963, '斗门区');
INSERT INTO `t_sys_base_region_info` VALUES (1966, 1963, '金湾区');
INSERT INTO `t_sys_base_region_info` VALUES (1967, 1930, '汕头市');
INSERT INTO `t_sys_base_region_info` VALUES (1968, 1967, '龙湖区');
INSERT INTO `t_sys_base_region_info` VALUES (1969, 1967, '金平区');
INSERT INTO `t_sys_base_region_info` VALUES (1970, 1967, '濠江区');
INSERT INTO `t_sys_base_region_info` VALUES (1971, 1967, '潮阳区');
INSERT INTO `t_sys_base_region_info` VALUES (1972, 1967, '潮南区');
INSERT INTO `t_sys_base_region_info` VALUES (1973, 1967, '澄海区');
INSERT INTO `t_sys_base_region_info` VALUES (1974, 1967, '南澳县');
INSERT INTO `t_sys_base_region_info` VALUES (1975, 1930, '佛山市');
INSERT INTO `t_sys_base_region_info` VALUES (1976, 1975, '禅城区');
INSERT INTO `t_sys_base_region_info` VALUES (1977, 1975, '南海区');
INSERT INTO `t_sys_base_region_info` VALUES (1978, 1975, '顺德区');
INSERT INTO `t_sys_base_region_info` VALUES (1979, 1975, '三水区');
INSERT INTO `t_sys_base_region_info` VALUES (1980, 1975, '高明区');
INSERT INTO `t_sys_base_region_info` VALUES (1981, 1930, '江门市');
INSERT INTO `t_sys_base_region_info` VALUES (1982, 1981, '蓬江区');
INSERT INTO `t_sys_base_region_info` VALUES (1983, 1981, '江海区');
INSERT INTO `t_sys_base_region_info` VALUES (1984, 1981, '新会区');
INSERT INTO `t_sys_base_region_info` VALUES (1985, 1981, '台山市');
INSERT INTO `t_sys_base_region_info` VALUES (1986, 1981, '开平市');
INSERT INTO `t_sys_base_region_info` VALUES (1987, 1981, '鹤山市');
INSERT INTO `t_sys_base_region_info` VALUES (1988, 1981, '恩平市');
INSERT INTO `t_sys_base_region_info` VALUES (1989, 1930, '湛江市');
INSERT INTO `t_sys_base_region_info` VALUES (1990, 1989, '赤坎区');
INSERT INTO `t_sys_base_region_info` VALUES (1991, 1989, '霞山区');
INSERT INTO `t_sys_base_region_info` VALUES (1992, 1989, '坡头区');
INSERT INTO `t_sys_base_region_info` VALUES (1993, 1989, '麻章区');
INSERT INTO `t_sys_base_region_info` VALUES (1994, 1989, '遂溪县');
INSERT INTO `t_sys_base_region_info` VALUES (1995, 1989, '徐闻县');
INSERT INTO `t_sys_base_region_info` VALUES (1996, 1989, '廉江市');
INSERT INTO `t_sys_base_region_info` VALUES (1997, 1989, '雷州市');
INSERT INTO `t_sys_base_region_info` VALUES (1998, 1989, '吴川市');
INSERT INTO `t_sys_base_region_info` VALUES (1999, 1930, '茂名市');
INSERT INTO `t_sys_base_region_info` VALUES (2000, 1999, '茂南区');
INSERT INTO `t_sys_base_region_info` VALUES (2001, 1999, '电白区');
INSERT INTO `t_sys_base_region_info` VALUES (2002, 1999, '高州市');
INSERT INTO `t_sys_base_region_info` VALUES (2003, 1999, '化州市');
INSERT INTO `t_sys_base_region_info` VALUES (2004, 1999, '信宜市');
INSERT INTO `t_sys_base_region_info` VALUES (2005, 1930, '肇庆市');
INSERT INTO `t_sys_base_region_info` VALUES (2006, 2005, '端州区');
INSERT INTO `t_sys_base_region_info` VALUES (2007, 2005, '鼎湖区');
INSERT INTO `t_sys_base_region_info` VALUES (2008, 2005, '高要区');
INSERT INTO `t_sys_base_region_info` VALUES (2009, 2005, '广宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2010, 2005, '怀集县');
INSERT INTO `t_sys_base_region_info` VALUES (2011, 2005, '封开县');
INSERT INTO `t_sys_base_region_info` VALUES (2012, 2005, '德庆县');
INSERT INTO `t_sys_base_region_info` VALUES (2013, 2005, '四会市');
INSERT INTO `t_sys_base_region_info` VALUES (2014, 1930, '惠州市');
INSERT INTO `t_sys_base_region_info` VALUES (2015, 2014, '惠城区');
INSERT INTO `t_sys_base_region_info` VALUES (2016, 2014, '惠阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2017, 2014, '博罗县');
INSERT INTO `t_sys_base_region_info` VALUES (2018, 2014, '惠东县');
INSERT INTO `t_sys_base_region_info` VALUES (2019, 2014, '龙门县');
INSERT INTO `t_sys_base_region_info` VALUES (2020, 1930, '梅州市');
INSERT INTO `t_sys_base_region_info` VALUES (2021, 2020, '梅江区');
INSERT INTO `t_sys_base_region_info` VALUES (2022, 2020, '梅县区');
INSERT INTO `t_sys_base_region_info` VALUES (2023, 2020, '大埔县');
INSERT INTO `t_sys_base_region_info` VALUES (2024, 2020, '丰顺县');
INSERT INTO `t_sys_base_region_info` VALUES (2025, 2020, '五华县');
INSERT INTO `t_sys_base_region_info` VALUES (2026, 2020, '平远县');
INSERT INTO `t_sys_base_region_info` VALUES (2027, 2020, '蕉岭县');
INSERT INTO `t_sys_base_region_info` VALUES (2028, 2020, '兴宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2029, 1930, '汕尾市');
INSERT INTO `t_sys_base_region_info` VALUES (2030, 2029, '城区');
INSERT INTO `t_sys_base_region_info` VALUES (2031, 2029, '海丰县');
INSERT INTO `t_sys_base_region_info` VALUES (2032, 2029, '陆河县');
INSERT INTO `t_sys_base_region_info` VALUES (2033, 2029, '陆丰市');
INSERT INTO `t_sys_base_region_info` VALUES (2034, 1930, '河源市');
INSERT INTO `t_sys_base_region_info` VALUES (2035, 2034, '源城区');
INSERT INTO `t_sys_base_region_info` VALUES (2036, 2034, '紫金县');
INSERT INTO `t_sys_base_region_info` VALUES (2037, 2034, '龙川县');
INSERT INTO `t_sys_base_region_info` VALUES (2038, 2034, '连平县');
INSERT INTO `t_sys_base_region_info` VALUES (2039, 2034, '和平县');
INSERT INTO `t_sys_base_region_info` VALUES (2040, 2034, '东源县');
INSERT INTO `t_sys_base_region_info` VALUES (2041, 1930, '阳江市');
INSERT INTO `t_sys_base_region_info` VALUES (2042, 2041, '江城区');
INSERT INTO `t_sys_base_region_info` VALUES (2043, 2041, '阳东区');
INSERT INTO `t_sys_base_region_info` VALUES (2044, 2041, '阳西县');
INSERT INTO `t_sys_base_region_info` VALUES (2045, 2041, '阳春市');
INSERT INTO `t_sys_base_region_info` VALUES (2046, 1930, '清远市');
INSERT INTO `t_sys_base_region_info` VALUES (2047, 2046, '清城区');
INSERT INTO `t_sys_base_region_info` VALUES (2048, 2046, '清新区');
INSERT INTO `t_sys_base_region_info` VALUES (2049, 2046, '佛冈县');
INSERT INTO `t_sys_base_region_info` VALUES (2050, 2046, '阳山县');
INSERT INTO `t_sys_base_region_info` VALUES (2051, 2046, '连山壮族瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2052, 2046, '连南瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2053, 2046, '英德市');
INSERT INTO `t_sys_base_region_info` VALUES (2054, 2046, '连州市');
INSERT INTO `t_sys_base_region_info` VALUES (2055, 1930, '东莞市');
INSERT INTO `t_sys_base_region_info` VALUES (2056, 1930, '中山市');
INSERT INTO `t_sys_base_region_info` VALUES (2057, 1930, '东沙群岛');
INSERT INTO `t_sys_base_region_info` VALUES (2058, 1930, '潮州市');
INSERT INTO `t_sys_base_region_info` VALUES (2059, 2058, '湘桥区');
INSERT INTO `t_sys_base_region_info` VALUES (2060, 2058, '潮安区');
INSERT INTO `t_sys_base_region_info` VALUES (2061, 2058, '饶平县');
INSERT INTO `t_sys_base_region_info` VALUES (2062, 1930, '揭阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2063, 2062, '榕城区');
INSERT INTO `t_sys_base_region_info` VALUES (2064, 2062, '揭东区');
INSERT INTO `t_sys_base_region_info` VALUES (2065, 2062, '揭西县');
INSERT INTO `t_sys_base_region_info` VALUES (2066, 2062, '惠来县');
INSERT INTO `t_sys_base_region_info` VALUES (2067, 2062, '普宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2068, 1930, '云浮市');
INSERT INTO `t_sys_base_region_info` VALUES (2069, 2068, '云城区');
INSERT INTO `t_sys_base_region_info` VALUES (2070, 2068, '云安区');
INSERT INTO `t_sys_base_region_info` VALUES (2071, 2068, '新兴县');
INSERT INTO `t_sys_base_region_info` VALUES (2072, 2068, '郁南县');
INSERT INTO `t_sys_base_region_info` VALUES (2073, 2068, '罗定市');
INSERT INTO `t_sys_base_region_info` VALUES (2074, 0, '广西壮族自治区');
INSERT INTO `t_sys_base_region_info` VALUES (2075, 2074, '南宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2076, 2075, '兴宁区');
INSERT INTO `t_sys_base_region_info` VALUES (2077, 2075, '青秀区');
INSERT INTO `t_sys_base_region_info` VALUES (2078, 2075, '江南区');
INSERT INTO `t_sys_base_region_info` VALUES (2079, 2075, '西乡塘区');
INSERT INTO `t_sys_base_region_info` VALUES (2080, 2075, '良庆区');
INSERT INTO `t_sys_base_region_info` VALUES (2081, 2075, '邕宁区');
INSERT INTO `t_sys_base_region_info` VALUES (2082, 2075, '武鸣区');
INSERT INTO `t_sys_base_region_info` VALUES (2083, 2075, '隆安县');
INSERT INTO `t_sys_base_region_info` VALUES (2084, 2075, '马山县');
INSERT INTO `t_sys_base_region_info` VALUES (2085, 2075, '上林县');
INSERT INTO `t_sys_base_region_info` VALUES (2086, 2075, '宾阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2087, 2075, '横县');
INSERT INTO `t_sys_base_region_info` VALUES (2088, 2074, '柳州市');
INSERT INTO `t_sys_base_region_info` VALUES (2089, 2088, '城中区');
INSERT INTO `t_sys_base_region_info` VALUES (2090, 2088, '鱼峰区');
INSERT INTO `t_sys_base_region_info` VALUES (2091, 2088, '柳南区');
INSERT INTO `t_sys_base_region_info` VALUES (2092, 2088, '柳北区');
INSERT INTO `t_sys_base_region_info` VALUES (2093, 2088, '柳江区');
INSERT INTO `t_sys_base_region_info` VALUES (2094, 2088, '柳城县');
INSERT INTO `t_sys_base_region_info` VALUES (2095, 2088, '鹿寨县');
INSERT INTO `t_sys_base_region_info` VALUES (2096, 2088, '融安县');
INSERT INTO `t_sys_base_region_info` VALUES (2097, 2088, '融水苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2098, 2088, '三江侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2099, 2074, '桂林市');
INSERT INTO `t_sys_base_region_info` VALUES (2100, 2099, '秀峰区');
INSERT INTO `t_sys_base_region_info` VALUES (2101, 2099, '叠彩区');
INSERT INTO `t_sys_base_region_info` VALUES (2102, 2099, '象山区');
INSERT INTO `t_sys_base_region_info` VALUES (2103, 2099, '七星区');
INSERT INTO `t_sys_base_region_info` VALUES (2104, 2099, '雁山区');
INSERT INTO `t_sys_base_region_info` VALUES (2105, 2099, '临桂区');
INSERT INTO `t_sys_base_region_info` VALUES (2106, 2099, '阳朔县');
INSERT INTO `t_sys_base_region_info` VALUES (2107, 2099, '灵川县');
INSERT INTO `t_sys_base_region_info` VALUES (2108, 2099, '全州县');
INSERT INTO `t_sys_base_region_info` VALUES (2109, 2099, '兴安县');
INSERT INTO `t_sys_base_region_info` VALUES (2110, 2099, '永福县');
INSERT INTO `t_sys_base_region_info` VALUES (2111, 2099, '灌阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2112, 2099, '龙胜各族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2113, 2099, '资源县');
INSERT INTO `t_sys_base_region_info` VALUES (2114, 2099, '平乐县');
INSERT INTO `t_sys_base_region_info` VALUES (2115, 2099, '荔浦县');
INSERT INTO `t_sys_base_region_info` VALUES (2116, 2099, '恭城瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2117, 2074, '梧州市');
INSERT INTO `t_sys_base_region_info` VALUES (2118, 2117, '万秀区');
INSERT INTO `t_sys_base_region_info` VALUES (2119, 2117, '长洲区');
INSERT INTO `t_sys_base_region_info` VALUES (2120, 2117, '龙圩区');
INSERT INTO `t_sys_base_region_info` VALUES (2121, 2117, '苍梧县');
INSERT INTO `t_sys_base_region_info` VALUES (2122, 2117, '藤县');
INSERT INTO `t_sys_base_region_info` VALUES (2123, 2117, '蒙山县');
INSERT INTO `t_sys_base_region_info` VALUES (2124, 2117, '岑溪市');
INSERT INTO `t_sys_base_region_info` VALUES (2125, 2074, '北海市');
INSERT INTO `t_sys_base_region_info` VALUES (2126, 2125, '海城区');
INSERT INTO `t_sys_base_region_info` VALUES (2127, 2125, '银海区');
INSERT INTO `t_sys_base_region_info` VALUES (2128, 2125, '铁山港区');
INSERT INTO `t_sys_base_region_info` VALUES (2129, 2125, '合浦县');
INSERT INTO `t_sys_base_region_info` VALUES (2130, 2074, '防城港市');
INSERT INTO `t_sys_base_region_info` VALUES (2131, 2130, '港口区');
INSERT INTO `t_sys_base_region_info` VALUES (2132, 2130, '防城区');
INSERT INTO `t_sys_base_region_info` VALUES (2133, 2130, '上思县');
INSERT INTO `t_sys_base_region_info` VALUES (2134, 2130, '东兴市');
INSERT INTO `t_sys_base_region_info` VALUES (2135, 2074, '钦州市');
INSERT INTO `t_sys_base_region_info` VALUES (2136, 2135, '钦南区');
INSERT INTO `t_sys_base_region_info` VALUES (2137, 2135, '钦北区');
INSERT INTO `t_sys_base_region_info` VALUES (2138, 2135, '灵山县');
INSERT INTO `t_sys_base_region_info` VALUES (2139, 2135, '浦北县');
INSERT INTO `t_sys_base_region_info` VALUES (2140, 2074, '贵港市');
INSERT INTO `t_sys_base_region_info` VALUES (2141, 2140, '港北区');
INSERT INTO `t_sys_base_region_info` VALUES (2142, 2140, '港南区');
INSERT INTO `t_sys_base_region_info` VALUES (2143, 2140, '覃塘区');
INSERT INTO `t_sys_base_region_info` VALUES (2144, 2140, '平南县');
INSERT INTO `t_sys_base_region_info` VALUES (2145, 2140, '桂平市');
INSERT INTO `t_sys_base_region_info` VALUES (2146, 2074, '玉林市');
INSERT INTO `t_sys_base_region_info` VALUES (2147, 2146, '玉州区');
INSERT INTO `t_sys_base_region_info` VALUES (2148, 2146, '福绵区');
INSERT INTO `t_sys_base_region_info` VALUES (2149, 2146, '容县');
INSERT INTO `t_sys_base_region_info` VALUES (2150, 2146, '陆川县');
INSERT INTO `t_sys_base_region_info` VALUES (2151, 2146, '博白县');
INSERT INTO `t_sys_base_region_info` VALUES (2152, 2146, '兴业县');
INSERT INTO `t_sys_base_region_info` VALUES (2153, 2146, '北流市');
INSERT INTO `t_sys_base_region_info` VALUES (2154, 2074, '百色市');
INSERT INTO `t_sys_base_region_info` VALUES (2155, 2154, '右江区');
INSERT INTO `t_sys_base_region_info` VALUES (2156, 2154, '田阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2157, 2154, '田东县');
INSERT INTO `t_sys_base_region_info` VALUES (2158, 2154, '平果县');
INSERT INTO `t_sys_base_region_info` VALUES (2159, 2154, '德保县');
INSERT INTO `t_sys_base_region_info` VALUES (2160, 2154, '那坡县');
INSERT INTO `t_sys_base_region_info` VALUES (2161, 2154, '凌云县');
INSERT INTO `t_sys_base_region_info` VALUES (2162, 2154, '乐业县');
INSERT INTO `t_sys_base_region_info` VALUES (2163, 2154, '田林县');
INSERT INTO `t_sys_base_region_info` VALUES (2164, 2154, '西林县');
INSERT INTO `t_sys_base_region_info` VALUES (2165, 2154, '隆林各族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2166, 2154, '靖西市');
INSERT INTO `t_sys_base_region_info` VALUES (2167, 2074, '贺州市');
INSERT INTO `t_sys_base_region_info` VALUES (2168, 2167, '八步区');
INSERT INTO `t_sys_base_region_info` VALUES (2169, 2167, '平桂区');
INSERT INTO `t_sys_base_region_info` VALUES (2170, 2167, '昭平县');
INSERT INTO `t_sys_base_region_info` VALUES (2171, 2167, '钟山县');
INSERT INTO `t_sys_base_region_info` VALUES (2172, 2167, '富川瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2173, 2074, '河池市');
INSERT INTO `t_sys_base_region_info` VALUES (2174, 2173, '金城江区');
INSERT INTO `t_sys_base_region_info` VALUES (2175, 2173, '宜州区');
INSERT INTO `t_sys_base_region_info` VALUES (2176, 2173, '南丹县');
INSERT INTO `t_sys_base_region_info` VALUES (2177, 2173, '天峨县');
INSERT INTO `t_sys_base_region_info` VALUES (2178, 2173, '凤山县');
INSERT INTO `t_sys_base_region_info` VALUES (2179, 2173, '东兰县');
INSERT INTO `t_sys_base_region_info` VALUES (2180, 2173, '罗城仫佬族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2181, 2173, '环江毛南族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2182, 2173, '巴马瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2183, 2173, '都安瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2184, 2173, '大化瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2185, 2074, '来宾市');
INSERT INTO `t_sys_base_region_info` VALUES (2186, 2185, '兴宾区');
INSERT INTO `t_sys_base_region_info` VALUES (2187, 2185, '忻城县');
INSERT INTO `t_sys_base_region_info` VALUES (2188, 2185, '象州县');
INSERT INTO `t_sys_base_region_info` VALUES (2189, 2185, '武宣县');
INSERT INTO `t_sys_base_region_info` VALUES (2190, 2185, '金秀瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2191, 2185, '合山市');
INSERT INTO `t_sys_base_region_info` VALUES (2192, 2074, '崇左市');
INSERT INTO `t_sys_base_region_info` VALUES (2193, 2192, '江州区');
INSERT INTO `t_sys_base_region_info` VALUES (2194, 2192, '扶绥县');
INSERT INTO `t_sys_base_region_info` VALUES (2195, 2192, '宁明县');
INSERT INTO `t_sys_base_region_info` VALUES (2196, 2192, '龙州县');
INSERT INTO `t_sys_base_region_info` VALUES (2197, 2192, '大新县');
INSERT INTO `t_sys_base_region_info` VALUES (2198, 2192, '天等县');
INSERT INTO `t_sys_base_region_info` VALUES (2199, 2192, '凭祥市');
INSERT INTO `t_sys_base_region_info` VALUES (2200, 0, '海南省');
INSERT INTO `t_sys_base_region_info` VALUES (2201, 2200, '海口市');
INSERT INTO `t_sys_base_region_info` VALUES (2202, 2201, '秀英区');
INSERT INTO `t_sys_base_region_info` VALUES (2203, 2201, '龙华区');
INSERT INTO `t_sys_base_region_info` VALUES (2204, 2201, '琼山区');
INSERT INTO `t_sys_base_region_info` VALUES (2205, 2201, '美兰区');
INSERT INTO `t_sys_base_region_info` VALUES (2206, 2200, '三亚市');
INSERT INTO `t_sys_base_region_info` VALUES (2207, 2206, '海棠区');
INSERT INTO `t_sys_base_region_info` VALUES (2208, 2206, '吉阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2209, 2206, '天涯区');
INSERT INTO `t_sys_base_region_info` VALUES (2210, 2206, '崖州区');
INSERT INTO `t_sys_base_region_info` VALUES (2211, 2200, '三沙市');
INSERT INTO `t_sys_base_region_info` VALUES (2212, 2211, '西沙群岛');
INSERT INTO `t_sys_base_region_info` VALUES (2213, 2211, '南沙群岛');
INSERT INTO `t_sys_base_region_info` VALUES (2214, 2211, '中沙群岛的岛礁及其海域');
INSERT INTO `t_sys_base_region_info` VALUES (2215, 2200, '儋州市');
INSERT INTO `t_sys_base_region_info` VALUES (2216, 2200, '五指山市');
INSERT INTO `t_sys_base_region_info` VALUES (2217, 2200, '琼海市');
INSERT INTO `t_sys_base_region_info` VALUES (2218, 2200, '文昌市');
INSERT INTO `t_sys_base_region_info` VALUES (2219, 2200, '万宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2220, 2200, '东方市');
INSERT INTO `t_sys_base_region_info` VALUES (2221, 2200, '定安县');
INSERT INTO `t_sys_base_region_info` VALUES (2222, 2200, '屯昌县');
INSERT INTO `t_sys_base_region_info` VALUES (2223, 2200, '澄迈县');
INSERT INTO `t_sys_base_region_info` VALUES (2224, 2200, '临高县');
INSERT INTO `t_sys_base_region_info` VALUES (2225, 2200, '白沙黎族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2226, 2200, '昌江黎族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2227, 2200, '乐东黎族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2228, 2200, '陵水黎族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2229, 2200, '保亭黎族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2230, 2200, '琼中黎族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2231, 0, '重庆市');
INSERT INTO `t_sys_base_region_info` VALUES (2232, 2231, '重庆城区');
INSERT INTO `t_sys_base_region_info` VALUES (2233, 2232, '万州区');
INSERT INTO `t_sys_base_region_info` VALUES (2234, 2232, '涪陵区');
INSERT INTO `t_sys_base_region_info` VALUES (2235, 2232, '渝中区');
INSERT INTO `t_sys_base_region_info` VALUES (2236, 2232, '大渡口区');
INSERT INTO `t_sys_base_region_info` VALUES (2237, 2232, '江北区');
INSERT INTO `t_sys_base_region_info` VALUES (2238, 2232, '沙坪坝区');
INSERT INTO `t_sys_base_region_info` VALUES (2239, 2232, '九龙坡区');
INSERT INTO `t_sys_base_region_info` VALUES (2240, 2232, '南岸区');
INSERT INTO `t_sys_base_region_info` VALUES (2241, 2232, '北碚区');
INSERT INTO `t_sys_base_region_info` VALUES (2242, 2232, '綦江区');
INSERT INTO `t_sys_base_region_info` VALUES (2243, 2232, '大足区');
INSERT INTO `t_sys_base_region_info` VALUES (2244, 2232, '渝北区');
INSERT INTO `t_sys_base_region_info` VALUES (2245, 2232, '巴南区');
INSERT INTO `t_sys_base_region_info` VALUES (2246, 2232, '黔江区');
INSERT INTO `t_sys_base_region_info` VALUES (2247, 2232, '长寿区');
INSERT INTO `t_sys_base_region_info` VALUES (2248, 2232, '江津区');
INSERT INTO `t_sys_base_region_info` VALUES (2249, 2232, '合川区');
INSERT INTO `t_sys_base_region_info` VALUES (2250, 2232, '永川区');
INSERT INTO `t_sys_base_region_info` VALUES (2251, 2232, '南川区');
INSERT INTO `t_sys_base_region_info` VALUES (2252, 2232, '璧山区');
INSERT INTO `t_sys_base_region_info` VALUES (2253, 2232, '铜梁区');
INSERT INTO `t_sys_base_region_info` VALUES (2254, 2232, '潼南区');
INSERT INTO `t_sys_base_region_info` VALUES (2255, 2232, '荣昌区');
INSERT INTO `t_sys_base_region_info` VALUES (2256, 2232, '开州区');
INSERT INTO `t_sys_base_region_info` VALUES (2257, 2231, '重庆郊县');
INSERT INTO `t_sys_base_region_info` VALUES (2258, 2257, '梁平区');
INSERT INTO `t_sys_base_region_info` VALUES (2259, 2257, '武隆区');
INSERT INTO `t_sys_base_region_info` VALUES (2260, 2257, '城口县');
INSERT INTO `t_sys_base_region_info` VALUES (2261, 2257, '丰都县');
INSERT INTO `t_sys_base_region_info` VALUES (2262, 2257, '垫江县');
INSERT INTO `t_sys_base_region_info` VALUES (2263, 2257, '忠县');
INSERT INTO `t_sys_base_region_info` VALUES (2264, 2257, '云阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2265, 2257, '奉节县');
INSERT INTO `t_sys_base_region_info` VALUES (2266, 2257, '巫山县');
INSERT INTO `t_sys_base_region_info` VALUES (2267, 2257, '巫溪县');
INSERT INTO `t_sys_base_region_info` VALUES (2268, 2257, '石柱土家族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2269, 2257, '秀山土家族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2270, 2257, '酉阳土家族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2271, 2257, '彭水苗族土家族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2272, 0, '四川省');
INSERT INTO `t_sys_base_region_info` VALUES (2273, 2272, '成都市');
INSERT INTO `t_sys_base_region_info` VALUES (2274, 2273, '锦江区');
INSERT INTO `t_sys_base_region_info` VALUES (2275, 2273, '青羊区');
INSERT INTO `t_sys_base_region_info` VALUES (2276, 2273, '武侯区');
INSERT INTO `t_sys_base_region_info` VALUES (2277, 2273, '成华区');
INSERT INTO `t_sys_base_region_info` VALUES (2278, 2273, '龙泉驿区');
INSERT INTO `t_sys_base_region_info` VALUES (2279, 2273, '青白江区');
INSERT INTO `t_sys_base_region_info` VALUES (2280, 2273, '新都区');
INSERT INTO `t_sys_base_region_info` VALUES (2281, 2273, '温江区');
INSERT INTO `t_sys_base_region_info` VALUES (2282, 2273, '双流区');
INSERT INTO `t_sys_base_region_info` VALUES (2283, 2273, '郫都区');
INSERT INTO `t_sys_base_region_info` VALUES (2284, 2273, '金堂县');
INSERT INTO `t_sys_base_region_info` VALUES (2285, 2273, '大邑县');
INSERT INTO `t_sys_base_region_info` VALUES (2286, 2273, '蒲江县');
INSERT INTO `t_sys_base_region_info` VALUES (2287, 2273, '新津县');
INSERT INTO `t_sys_base_region_info` VALUES (2288, 2273, '都江堰市');
INSERT INTO `t_sys_base_region_info` VALUES (2289, 2273, '彭州市');
INSERT INTO `t_sys_base_region_info` VALUES (2290, 2273, '邛崃市');
INSERT INTO `t_sys_base_region_info` VALUES (2291, 2273, '崇州市');
INSERT INTO `t_sys_base_region_info` VALUES (2292, 2273, '简阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2293, 2272, '自贡市');
INSERT INTO `t_sys_base_region_info` VALUES (2294, 2293, '自流井区');
INSERT INTO `t_sys_base_region_info` VALUES (2295, 2293, '贡井区');
INSERT INTO `t_sys_base_region_info` VALUES (2296, 2293, '大安区');
INSERT INTO `t_sys_base_region_info` VALUES (2297, 2293, '沿滩区');
INSERT INTO `t_sys_base_region_info` VALUES (2298, 2293, '荣县');
INSERT INTO `t_sys_base_region_info` VALUES (2299, 2293, '富顺县');
INSERT INTO `t_sys_base_region_info` VALUES (2300, 2272, '攀枝花市');
INSERT INTO `t_sys_base_region_info` VALUES (2301, 2300, '东区');
INSERT INTO `t_sys_base_region_info` VALUES (2302, 2300, '西区');
INSERT INTO `t_sys_base_region_info` VALUES (2303, 2300, '仁和区');
INSERT INTO `t_sys_base_region_info` VALUES (2304, 2300, '米易县');
INSERT INTO `t_sys_base_region_info` VALUES (2305, 2300, '盐边县');
INSERT INTO `t_sys_base_region_info` VALUES (2306, 2272, '泸州市');
INSERT INTO `t_sys_base_region_info` VALUES (2307, 2306, '江阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2308, 2306, '纳溪区');
INSERT INTO `t_sys_base_region_info` VALUES (2309, 2306, '龙马潭区');
INSERT INTO `t_sys_base_region_info` VALUES (2310, 2306, '泸县');
INSERT INTO `t_sys_base_region_info` VALUES (2311, 2306, '合江县');
INSERT INTO `t_sys_base_region_info` VALUES (2312, 2306, '叙永县');
INSERT INTO `t_sys_base_region_info` VALUES (2313, 2306, '古蔺县');
INSERT INTO `t_sys_base_region_info` VALUES (2314, 2272, '德阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2315, 2314, '旌阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2316, 2314, '中江县');
INSERT INTO `t_sys_base_region_info` VALUES (2317, 2314, '罗江区');
INSERT INTO `t_sys_base_region_info` VALUES (2318, 2314, '广汉市');
INSERT INTO `t_sys_base_region_info` VALUES (2319, 2314, '什邡市');
INSERT INTO `t_sys_base_region_info` VALUES (2320, 2314, '绵竹市');
INSERT INTO `t_sys_base_region_info` VALUES (2321, 2272, '绵阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2322, 2321, '涪城区');
INSERT INTO `t_sys_base_region_info` VALUES (2323, 2321, '游仙区');
INSERT INTO `t_sys_base_region_info` VALUES (2324, 2321, '安州区');
INSERT INTO `t_sys_base_region_info` VALUES (2325, 2321, '三台县');
INSERT INTO `t_sys_base_region_info` VALUES (2326, 2321, '盐亭县');
INSERT INTO `t_sys_base_region_info` VALUES (2327, 2321, '梓潼县');
INSERT INTO `t_sys_base_region_info` VALUES (2328, 2321, '北川羌族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2329, 2321, '平武县');
INSERT INTO `t_sys_base_region_info` VALUES (2330, 2321, '江油市');
INSERT INTO `t_sys_base_region_info` VALUES (2331, 2272, '广元市');
INSERT INTO `t_sys_base_region_info` VALUES (2332, 2331, '利州区');
INSERT INTO `t_sys_base_region_info` VALUES (2333, 2331, '昭化区');
INSERT INTO `t_sys_base_region_info` VALUES (2334, 2331, '朝天区');
INSERT INTO `t_sys_base_region_info` VALUES (2335, 2331, '旺苍县');
INSERT INTO `t_sys_base_region_info` VALUES (2336, 2331, '青川县');
INSERT INTO `t_sys_base_region_info` VALUES (2337, 2331, '剑阁县');
INSERT INTO `t_sys_base_region_info` VALUES (2338, 2331, '苍溪县');
INSERT INTO `t_sys_base_region_info` VALUES (2339, 2272, '遂宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2340, 2339, '船山区');
INSERT INTO `t_sys_base_region_info` VALUES (2341, 2339, '安居区');
INSERT INTO `t_sys_base_region_info` VALUES (2342, 2339, '蓬溪县');
INSERT INTO `t_sys_base_region_info` VALUES (2343, 2339, '射洪县');
INSERT INTO `t_sys_base_region_info` VALUES (2344, 2339, '大英县');
INSERT INTO `t_sys_base_region_info` VALUES (2345, 2272, '内江市');
INSERT INTO `t_sys_base_region_info` VALUES (2346, 2345, '市中区');
INSERT INTO `t_sys_base_region_info` VALUES (2347, 2345, '东兴区');
INSERT INTO `t_sys_base_region_info` VALUES (2348, 2345, '威远县');
INSERT INTO `t_sys_base_region_info` VALUES (2349, 2345, '资中县');
INSERT INTO `t_sys_base_region_info` VALUES (2350, 2345, '隆昌市');
INSERT INTO `t_sys_base_region_info` VALUES (2351, 2272, '乐山市');
INSERT INTO `t_sys_base_region_info` VALUES (2352, 2351, '市中区');
INSERT INTO `t_sys_base_region_info` VALUES (2353, 2351, '沙湾区');
INSERT INTO `t_sys_base_region_info` VALUES (2354, 2351, '五通桥区');
INSERT INTO `t_sys_base_region_info` VALUES (2355, 2351, '金口河区');
INSERT INTO `t_sys_base_region_info` VALUES (2356, 2351, '犍为县');
INSERT INTO `t_sys_base_region_info` VALUES (2357, 2351, '井研县');
INSERT INTO `t_sys_base_region_info` VALUES (2358, 2351, '夹江县');
INSERT INTO `t_sys_base_region_info` VALUES (2359, 2351, '沐川县');
INSERT INTO `t_sys_base_region_info` VALUES (2360, 2351, '峨边彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2361, 2351, '马边彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2362, 2351, '峨眉山市');
INSERT INTO `t_sys_base_region_info` VALUES (2363, 2272, '南充市');
INSERT INTO `t_sys_base_region_info` VALUES (2364, 2363, '顺庆区');
INSERT INTO `t_sys_base_region_info` VALUES (2365, 2363, '高坪区');
INSERT INTO `t_sys_base_region_info` VALUES (2366, 2363, '嘉陵区');
INSERT INTO `t_sys_base_region_info` VALUES (2367, 2363, '南部县');
INSERT INTO `t_sys_base_region_info` VALUES (2368, 2363, '营山县');
INSERT INTO `t_sys_base_region_info` VALUES (2369, 2363, '蓬安县');
INSERT INTO `t_sys_base_region_info` VALUES (2370, 2363, '仪陇县');
INSERT INTO `t_sys_base_region_info` VALUES (2371, 2363, '西充县');
INSERT INTO `t_sys_base_region_info` VALUES (2372, 2363, '阆中市');
INSERT INTO `t_sys_base_region_info` VALUES (2373, 2272, '眉山市');
INSERT INTO `t_sys_base_region_info` VALUES (2374, 2373, '东坡区');
INSERT INTO `t_sys_base_region_info` VALUES (2375, 2373, '彭山区');
INSERT INTO `t_sys_base_region_info` VALUES (2376, 2373, '仁寿县');
INSERT INTO `t_sys_base_region_info` VALUES (2377, 2373, '洪雅县');
INSERT INTO `t_sys_base_region_info` VALUES (2378, 2373, '丹棱县');
INSERT INTO `t_sys_base_region_info` VALUES (2379, 2373, '青神县');
INSERT INTO `t_sys_base_region_info` VALUES (2380, 2272, '宜宾市');
INSERT INTO `t_sys_base_region_info` VALUES (2381, 2380, '翠屏区');
INSERT INTO `t_sys_base_region_info` VALUES (2382, 2380, '南溪区');
INSERT INTO `t_sys_base_region_info` VALUES (2383, 2380, '宜宾县');
INSERT INTO `t_sys_base_region_info` VALUES (2384, 2380, '江安县');
INSERT INTO `t_sys_base_region_info` VALUES (2385, 2380, '长宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2386, 2380, '高县');
INSERT INTO `t_sys_base_region_info` VALUES (2387, 2380, '珙县');
INSERT INTO `t_sys_base_region_info` VALUES (2388, 2380, '筠连县');
INSERT INTO `t_sys_base_region_info` VALUES (2389, 2380, '兴文县');
INSERT INTO `t_sys_base_region_info` VALUES (2390, 2380, '屏山县');
INSERT INTO `t_sys_base_region_info` VALUES (2391, 2272, '广安市');
INSERT INTO `t_sys_base_region_info` VALUES (2392, 2391, '广安区');
INSERT INTO `t_sys_base_region_info` VALUES (2393, 2391, '前锋区');
INSERT INTO `t_sys_base_region_info` VALUES (2394, 2391, '岳池县');
INSERT INTO `t_sys_base_region_info` VALUES (2395, 2391, '武胜县');
INSERT INTO `t_sys_base_region_info` VALUES (2396, 2391, '邻水县');
INSERT INTO `t_sys_base_region_info` VALUES (2397, 2391, '华蓥市');
INSERT INTO `t_sys_base_region_info` VALUES (2398, 2272, '达州市');
INSERT INTO `t_sys_base_region_info` VALUES (2399, 2398, '通川区');
INSERT INTO `t_sys_base_region_info` VALUES (2400, 2398, '达川区');
INSERT INTO `t_sys_base_region_info` VALUES (2401, 2398, '宣汉县');
INSERT INTO `t_sys_base_region_info` VALUES (2402, 2398, '开江县');
INSERT INTO `t_sys_base_region_info` VALUES (2403, 2398, '大竹县');
INSERT INTO `t_sys_base_region_info` VALUES (2404, 2398, '渠县');
INSERT INTO `t_sys_base_region_info` VALUES (2405, 2398, '万源市');
INSERT INTO `t_sys_base_region_info` VALUES (2406, 2272, '雅安市');
INSERT INTO `t_sys_base_region_info` VALUES (2407, 2406, '雨城区');
INSERT INTO `t_sys_base_region_info` VALUES (2408, 2406, '名山区');
INSERT INTO `t_sys_base_region_info` VALUES (2409, 2406, '荥经县');
INSERT INTO `t_sys_base_region_info` VALUES (2410, 2406, '汉源县');
INSERT INTO `t_sys_base_region_info` VALUES (2411, 2406, '石棉县');
INSERT INTO `t_sys_base_region_info` VALUES (2412, 2406, '天全县');
INSERT INTO `t_sys_base_region_info` VALUES (2413, 2406, '芦山县');
INSERT INTO `t_sys_base_region_info` VALUES (2414, 2406, '宝兴县');
INSERT INTO `t_sys_base_region_info` VALUES (2415, 2272, '巴中市');
INSERT INTO `t_sys_base_region_info` VALUES (2416, 2415, '巴州区');
INSERT INTO `t_sys_base_region_info` VALUES (2417, 2415, '恩阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2418, 2415, '通江县');
INSERT INTO `t_sys_base_region_info` VALUES (2419, 2415, '南江县');
INSERT INTO `t_sys_base_region_info` VALUES (2420, 2415, '平昌县');
INSERT INTO `t_sys_base_region_info` VALUES (2421, 2272, '资阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2422, 2421, '雁江区');
INSERT INTO `t_sys_base_region_info` VALUES (2423, 2421, '安岳县');
INSERT INTO `t_sys_base_region_info` VALUES (2424, 2421, '乐至县');
INSERT INTO `t_sys_base_region_info` VALUES (2425, 2272, '阿坝藏族羌族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2426, 2425, '马尔康市');
INSERT INTO `t_sys_base_region_info` VALUES (2427, 2425, '汶川县');
INSERT INTO `t_sys_base_region_info` VALUES (2428, 2425, '理县');
INSERT INTO `t_sys_base_region_info` VALUES (2429, 2425, '茂县');
INSERT INTO `t_sys_base_region_info` VALUES (2430, 2425, '松潘县');
INSERT INTO `t_sys_base_region_info` VALUES (2431, 2425, '九寨沟县');
INSERT INTO `t_sys_base_region_info` VALUES (2432, 2425, '金川县');
INSERT INTO `t_sys_base_region_info` VALUES (2433, 2425, '小金县');
INSERT INTO `t_sys_base_region_info` VALUES (2434, 2425, '黑水县');
INSERT INTO `t_sys_base_region_info` VALUES (2435, 2425, '壤塘县');
INSERT INTO `t_sys_base_region_info` VALUES (2436, 2425, '阿坝县');
INSERT INTO `t_sys_base_region_info` VALUES (2437, 2425, '若尔盖县');
INSERT INTO `t_sys_base_region_info` VALUES (2438, 2425, '红原县');
INSERT INTO `t_sys_base_region_info` VALUES (2439, 2272, '甘孜藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2440, 2439, '康定市');
INSERT INTO `t_sys_base_region_info` VALUES (2441, 2439, '泸定县');
INSERT INTO `t_sys_base_region_info` VALUES (2442, 2439, '丹巴县');
INSERT INTO `t_sys_base_region_info` VALUES (2443, 2439, '九龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2444, 2439, '雅江县');
INSERT INTO `t_sys_base_region_info` VALUES (2445, 2439, '道孚县');
INSERT INTO `t_sys_base_region_info` VALUES (2446, 2439, '炉霍县');
INSERT INTO `t_sys_base_region_info` VALUES (2447, 2439, '甘孜县');
INSERT INTO `t_sys_base_region_info` VALUES (2448, 2439, '新龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2449, 2439, '德格县');
INSERT INTO `t_sys_base_region_info` VALUES (2450, 2439, '白玉县');
INSERT INTO `t_sys_base_region_info` VALUES (2451, 2439, '石渠县');
INSERT INTO `t_sys_base_region_info` VALUES (2452, 2439, '色达县');
INSERT INTO `t_sys_base_region_info` VALUES (2453, 2439, '理塘县');
INSERT INTO `t_sys_base_region_info` VALUES (2454, 2439, '巴塘县');
INSERT INTO `t_sys_base_region_info` VALUES (2455, 2439, '乡城县');
INSERT INTO `t_sys_base_region_info` VALUES (2456, 2439, '稻城县');
INSERT INTO `t_sys_base_region_info` VALUES (2457, 2439, '得荣县');
INSERT INTO `t_sys_base_region_info` VALUES (2458, 2272, '凉山彝族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2459, 2458, '西昌市');
INSERT INTO `t_sys_base_region_info` VALUES (2460, 2458, '木里藏族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2461, 2458, '盐源县');
INSERT INTO `t_sys_base_region_info` VALUES (2462, 2458, '德昌县');
INSERT INTO `t_sys_base_region_info` VALUES (2463, 2458, '会理县');
INSERT INTO `t_sys_base_region_info` VALUES (2464, 2458, '会东县');
INSERT INTO `t_sys_base_region_info` VALUES (2465, 2458, '宁南县');
INSERT INTO `t_sys_base_region_info` VALUES (2466, 2458, '普格县');
INSERT INTO `t_sys_base_region_info` VALUES (2467, 2458, '布拖县');
INSERT INTO `t_sys_base_region_info` VALUES (2468, 2458, '金阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2469, 2458, '昭觉县');
INSERT INTO `t_sys_base_region_info` VALUES (2470, 2458, '喜德县');
INSERT INTO `t_sys_base_region_info` VALUES (2471, 2458, '冕宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2472, 2458, '越西县');
INSERT INTO `t_sys_base_region_info` VALUES (2473, 2458, '甘洛县');
INSERT INTO `t_sys_base_region_info` VALUES (2474, 2458, '美姑县');
INSERT INTO `t_sys_base_region_info` VALUES (2475, 2458, '雷波县');
INSERT INTO `t_sys_base_region_info` VALUES (2476, 0, '贵州省');
INSERT INTO `t_sys_base_region_info` VALUES (2477, 2476, '贵阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2478, 2477, '南明区');
INSERT INTO `t_sys_base_region_info` VALUES (2479, 2477, '云岩区');
INSERT INTO `t_sys_base_region_info` VALUES (2480, 2477, '花溪区');
INSERT INTO `t_sys_base_region_info` VALUES (2481, 2477, '乌当区');
INSERT INTO `t_sys_base_region_info` VALUES (2482, 2477, '白云区');
INSERT INTO `t_sys_base_region_info` VALUES (2483, 2477, '观山湖区');
INSERT INTO `t_sys_base_region_info` VALUES (2484, 2477, '开阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2485, 2477, '息烽县');
INSERT INTO `t_sys_base_region_info` VALUES (2486, 2477, '修文县');
INSERT INTO `t_sys_base_region_info` VALUES (2487, 2477, '清镇市');
INSERT INTO `t_sys_base_region_info` VALUES (2488, 2476, '六盘水市');
INSERT INTO `t_sys_base_region_info` VALUES (2489, 2488, '钟山区');
INSERT INTO `t_sys_base_region_info` VALUES (2490, 2488, '六枝特区');
INSERT INTO `t_sys_base_region_info` VALUES (2491, 2488, '水城县');
INSERT INTO `t_sys_base_region_info` VALUES (2492, 2488, '盘州市');
INSERT INTO `t_sys_base_region_info` VALUES (2493, 2476, '遵义市');
INSERT INTO `t_sys_base_region_info` VALUES (2494, 2493, '红花岗区');
INSERT INTO `t_sys_base_region_info` VALUES (2495, 2493, '汇川区');
INSERT INTO `t_sys_base_region_info` VALUES (2496, 2493, '播州区');
INSERT INTO `t_sys_base_region_info` VALUES (2497, 2493, '桐梓县');
INSERT INTO `t_sys_base_region_info` VALUES (2498, 2493, '绥阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2499, 2493, '正安县');
INSERT INTO `t_sys_base_region_info` VALUES (2500, 2493, '道真仡佬族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2501, 2493, '务川仡佬族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2502, 2493, '凤冈县');
INSERT INTO `t_sys_base_region_info` VALUES (2503, 2493, '湄潭县');
INSERT INTO `t_sys_base_region_info` VALUES (2504, 2493, '余庆县');
INSERT INTO `t_sys_base_region_info` VALUES (2505, 2493, '习水县');
INSERT INTO `t_sys_base_region_info` VALUES (2506, 2493, '赤水市');
INSERT INTO `t_sys_base_region_info` VALUES (2507, 2493, '仁怀市');
INSERT INTO `t_sys_base_region_info` VALUES (2508, 2476, '安顺市');
INSERT INTO `t_sys_base_region_info` VALUES (2509, 2508, '西秀区');
INSERT INTO `t_sys_base_region_info` VALUES (2510, 2508, '平坝区');
INSERT INTO `t_sys_base_region_info` VALUES (2511, 2508, '普定县');
INSERT INTO `t_sys_base_region_info` VALUES (2512, 2508, '镇宁布依族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2513, 2508, '关岭布依族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2514, 2508, '紫云苗族布依族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2515, 2476, '毕节市');
INSERT INTO `t_sys_base_region_info` VALUES (2516, 2515, '七星关区');
INSERT INTO `t_sys_base_region_info` VALUES (2517, 2515, '大方县');
INSERT INTO `t_sys_base_region_info` VALUES (2518, 2515, '黔西县');
INSERT INTO `t_sys_base_region_info` VALUES (2519, 2515, '金沙县');
INSERT INTO `t_sys_base_region_info` VALUES (2520, 2515, '织金县');
INSERT INTO `t_sys_base_region_info` VALUES (2521, 2515, '纳雍县');
INSERT INTO `t_sys_base_region_info` VALUES (2522, 2515, '威宁彝族回族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2523, 2515, '赫章县');
INSERT INTO `t_sys_base_region_info` VALUES (2524, 2476, '铜仁市');
INSERT INTO `t_sys_base_region_info` VALUES (2525, 2524, '碧江区');
INSERT INTO `t_sys_base_region_info` VALUES (2526, 2524, '万山区');
INSERT INTO `t_sys_base_region_info` VALUES (2527, 2524, '江口县');
INSERT INTO `t_sys_base_region_info` VALUES (2528, 2524, '玉屏侗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2529, 2524, '石阡县');
INSERT INTO `t_sys_base_region_info` VALUES (2530, 2524, '思南县');
INSERT INTO `t_sys_base_region_info` VALUES (2531, 2524, '印江土家族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2532, 2524, '德江县');
INSERT INTO `t_sys_base_region_info` VALUES (2533, 2524, '沿河土家族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2534, 2524, '松桃苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2535, 2476, '黔西南布依族苗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2536, 2535, '兴义市');
INSERT INTO `t_sys_base_region_info` VALUES (2537, 2535, '兴仁县');
INSERT INTO `t_sys_base_region_info` VALUES (2538, 2535, '普安县');
INSERT INTO `t_sys_base_region_info` VALUES (2539, 2535, '晴隆县');
INSERT INTO `t_sys_base_region_info` VALUES (2540, 2535, '贞丰县');
INSERT INTO `t_sys_base_region_info` VALUES (2541, 2535, '望谟县');
INSERT INTO `t_sys_base_region_info` VALUES (2542, 2535, '册亨县');
INSERT INTO `t_sys_base_region_info` VALUES (2543, 2535, '安龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2544, 2476, '黔东南苗族侗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2545, 2544, '凯里市');
INSERT INTO `t_sys_base_region_info` VALUES (2546, 2544, '黄平县');
INSERT INTO `t_sys_base_region_info` VALUES (2547, 2544, '施秉县');
INSERT INTO `t_sys_base_region_info` VALUES (2548, 2544, '三穗县');
INSERT INTO `t_sys_base_region_info` VALUES (2549, 2544, '镇远县');
INSERT INTO `t_sys_base_region_info` VALUES (2550, 2544, '岑巩县');
INSERT INTO `t_sys_base_region_info` VALUES (2551, 2544, '天柱县');
INSERT INTO `t_sys_base_region_info` VALUES (2552, 2544, '锦屏县');
INSERT INTO `t_sys_base_region_info` VALUES (2553, 2544, '剑河县');
INSERT INTO `t_sys_base_region_info` VALUES (2554, 2544, '台江县');
INSERT INTO `t_sys_base_region_info` VALUES (2555, 2544, '黎平县');
INSERT INTO `t_sys_base_region_info` VALUES (2556, 2544, '榕江县');
INSERT INTO `t_sys_base_region_info` VALUES (2557, 2544, '从江县');
INSERT INTO `t_sys_base_region_info` VALUES (2558, 2544, '雷山县');
INSERT INTO `t_sys_base_region_info` VALUES (2559, 2544, '麻江县');
INSERT INTO `t_sys_base_region_info` VALUES (2560, 2544, '丹寨县');
INSERT INTO `t_sys_base_region_info` VALUES (2561, 2476, '黔南布依族苗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2562, 2561, '都匀市');
INSERT INTO `t_sys_base_region_info` VALUES (2563, 2561, '福泉市');
INSERT INTO `t_sys_base_region_info` VALUES (2564, 2561, '荔波县');
INSERT INTO `t_sys_base_region_info` VALUES (2565, 2561, '贵定县');
INSERT INTO `t_sys_base_region_info` VALUES (2566, 2561, '瓮安县');
INSERT INTO `t_sys_base_region_info` VALUES (2567, 2561, '独山县');
INSERT INTO `t_sys_base_region_info` VALUES (2568, 2561, '平塘县');
INSERT INTO `t_sys_base_region_info` VALUES (2569, 2561, '罗甸县');
INSERT INTO `t_sys_base_region_info` VALUES (2570, 2561, '长顺县');
INSERT INTO `t_sys_base_region_info` VALUES (2571, 2561, '龙里县');
INSERT INTO `t_sys_base_region_info` VALUES (2572, 2561, '惠水县');
INSERT INTO `t_sys_base_region_info` VALUES (2573, 2561, '三都水族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2574, 0, '云南省');
INSERT INTO `t_sys_base_region_info` VALUES (2575, 2574, '昆明市');
INSERT INTO `t_sys_base_region_info` VALUES (2576, 2575, '五华区');
INSERT INTO `t_sys_base_region_info` VALUES (2577, 2575, '盘龙区');
INSERT INTO `t_sys_base_region_info` VALUES (2578, 2575, '官渡区');
INSERT INTO `t_sys_base_region_info` VALUES (2579, 2575, '西山区');
INSERT INTO `t_sys_base_region_info` VALUES (2580, 2575, '东川区');
INSERT INTO `t_sys_base_region_info` VALUES (2581, 2575, '呈贡区');
INSERT INTO `t_sys_base_region_info` VALUES (2582, 2575, '晋宁区');
INSERT INTO `t_sys_base_region_info` VALUES (2583, 2575, '富民县');
INSERT INTO `t_sys_base_region_info` VALUES (2584, 2575, '宜良县');
INSERT INTO `t_sys_base_region_info` VALUES (2585, 2575, '石林彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2586, 2575, '嵩明县');
INSERT INTO `t_sys_base_region_info` VALUES (2587, 2575, '禄劝彝族苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2588, 2575, '寻甸回族彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2589, 2575, '安宁市');
INSERT INTO `t_sys_base_region_info` VALUES (2590, 2574, '曲靖市');
INSERT INTO `t_sys_base_region_info` VALUES (2591, 2590, '麒麟区');
INSERT INTO `t_sys_base_region_info` VALUES (2592, 2590, '沾益区');
INSERT INTO `t_sys_base_region_info` VALUES (2593, 2590, '马龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2594, 2590, '陆良县');
INSERT INTO `t_sys_base_region_info` VALUES (2595, 2590, '师宗县');
INSERT INTO `t_sys_base_region_info` VALUES (2596, 2590, '罗平县');
INSERT INTO `t_sys_base_region_info` VALUES (2597, 2590, '富源县');
INSERT INTO `t_sys_base_region_info` VALUES (2598, 2590, '会泽县');
INSERT INTO `t_sys_base_region_info` VALUES (2599, 2590, '宣威市');
INSERT INTO `t_sys_base_region_info` VALUES (2600, 2574, '玉溪市');
INSERT INTO `t_sys_base_region_info` VALUES (2601, 2600, '红塔区');
INSERT INTO `t_sys_base_region_info` VALUES (2602, 2600, '江川区');
INSERT INTO `t_sys_base_region_info` VALUES (2603, 2600, '澄江县');
INSERT INTO `t_sys_base_region_info` VALUES (2604, 2600, '通海县');
INSERT INTO `t_sys_base_region_info` VALUES (2605, 2600, '华宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2606, 2600, '易门县');
INSERT INTO `t_sys_base_region_info` VALUES (2607, 2600, '峨山彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2608, 2600, '新平彝族傣族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2609, 2600, '元江哈尼族彝族傣族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2610, 2574, '保山市');
INSERT INTO `t_sys_base_region_info` VALUES (2611, 2610, '隆阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2612, 2610, '施甸县');
INSERT INTO `t_sys_base_region_info` VALUES (2613, 2610, '龙陵县');
INSERT INTO `t_sys_base_region_info` VALUES (2614, 2610, '昌宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2615, 2610, '腾冲市');
INSERT INTO `t_sys_base_region_info` VALUES (2616, 2574, '昭通市');
INSERT INTO `t_sys_base_region_info` VALUES (2617, 2616, '昭阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2618, 2616, '鲁甸县');
INSERT INTO `t_sys_base_region_info` VALUES (2619, 2616, '巧家县');
INSERT INTO `t_sys_base_region_info` VALUES (2620, 2616, '盐津县');
INSERT INTO `t_sys_base_region_info` VALUES (2621, 2616, '大关县');
INSERT INTO `t_sys_base_region_info` VALUES (2622, 2616, '永善县');
INSERT INTO `t_sys_base_region_info` VALUES (2623, 2616, '绥江县');
INSERT INTO `t_sys_base_region_info` VALUES (2624, 2616, '镇雄县');
INSERT INTO `t_sys_base_region_info` VALUES (2625, 2616, '彝良县');
INSERT INTO `t_sys_base_region_info` VALUES (2626, 2616, '威信县');
INSERT INTO `t_sys_base_region_info` VALUES (2627, 2616, '水富县');
INSERT INTO `t_sys_base_region_info` VALUES (2628, 2574, '丽江市');
INSERT INTO `t_sys_base_region_info` VALUES (2629, 2628, '古城区');
INSERT INTO `t_sys_base_region_info` VALUES (2630, 2628, '玉龙纳西族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2631, 2628, '永胜县');
INSERT INTO `t_sys_base_region_info` VALUES (2632, 2628, '华坪县');
INSERT INTO `t_sys_base_region_info` VALUES (2633, 2628, '宁蒗彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2634, 2574, '普洱市');
INSERT INTO `t_sys_base_region_info` VALUES (2635, 2634, '思茅区');
INSERT INTO `t_sys_base_region_info` VALUES (2636, 2634, '宁洱哈尼族彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2637, 2634, '墨江哈尼族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2638, 2634, '景东彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2639, 2634, '景谷傣族彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2640, 2634, '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2641, 2634, '江城哈尼族彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2642, 2634, '孟连傣族拉祜族佤族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2643, 2634, '澜沧拉祜族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2644, 2634, '西盟佤族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2645, 2574, '临沧市');
INSERT INTO `t_sys_base_region_info` VALUES (2646, 2645, '临翔区');
INSERT INTO `t_sys_base_region_info` VALUES (2647, 2645, '凤庆县');
INSERT INTO `t_sys_base_region_info` VALUES (2648, 2645, '云县');
INSERT INTO `t_sys_base_region_info` VALUES (2649, 2645, '永德县');
INSERT INTO `t_sys_base_region_info` VALUES (2650, 2645, '镇康县');
INSERT INTO `t_sys_base_region_info` VALUES (2651, 2645, '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2652, 2645, '耿马傣族佤族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2653, 2645, '沧源佤族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2654, 2574, '楚雄彝族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2655, 2654, '楚雄市');
INSERT INTO `t_sys_base_region_info` VALUES (2656, 2654, '双柏县');
INSERT INTO `t_sys_base_region_info` VALUES (2657, 2654, '牟定县');
INSERT INTO `t_sys_base_region_info` VALUES (2658, 2654, '南华县');
INSERT INTO `t_sys_base_region_info` VALUES (2659, 2654, '姚安县');
INSERT INTO `t_sys_base_region_info` VALUES (2660, 2654, '大姚县');
INSERT INTO `t_sys_base_region_info` VALUES (2661, 2654, '永仁县');
INSERT INTO `t_sys_base_region_info` VALUES (2662, 2654, '元谋县');
INSERT INTO `t_sys_base_region_info` VALUES (2663, 2654, '武定县');
INSERT INTO `t_sys_base_region_info` VALUES (2664, 2654, '禄丰县');
INSERT INTO `t_sys_base_region_info` VALUES (2665, 2574, '红河哈尼族彝族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2666, 2665, '个旧市');
INSERT INTO `t_sys_base_region_info` VALUES (2667, 2665, '开远市');
INSERT INTO `t_sys_base_region_info` VALUES (2668, 2665, '蒙自市');
INSERT INTO `t_sys_base_region_info` VALUES (2669, 2665, '弥勒市');
INSERT INTO `t_sys_base_region_info` VALUES (2670, 2665, '屏边苗族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2671, 2665, '建水县');
INSERT INTO `t_sys_base_region_info` VALUES (2672, 2665, '石屏县');
INSERT INTO `t_sys_base_region_info` VALUES (2673, 2665, '泸西县');
INSERT INTO `t_sys_base_region_info` VALUES (2674, 2665, '元阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2675, 2665, '红河县');
INSERT INTO `t_sys_base_region_info` VALUES (2676, 2665, '金平苗族瑶族傣族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2677, 2665, '绿春县');
INSERT INTO `t_sys_base_region_info` VALUES (2678, 2665, '河口瑶族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2679, 2574, '文山壮族苗族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2680, 2679, '文山市');
INSERT INTO `t_sys_base_region_info` VALUES (2681, 2679, '砚山县');
INSERT INTO `t_sys_base_region_info` VALUES (2682, 2679, '西畴县');
INSERT INTO `t_sys_base_region_info` VALUES (2683, 2679, '麻栗坡县');
INSERT INTO `t_sys_base_region_info` VALUES (2684, 2679, '马关县');
INSERT INTO `t_sys_base_region_info` VALUES (2685, 2679, '丘北县');
INSERT INTO `t_sys_base_region_info` VALUES (2686, 2679, '广南县');
INSERT INTO `t_sys_base_region_info` VALUES (2687, 2679, '富宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2688, 2574, '西双版纳傣族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2689, 2688, '景洪市');
INSERT INTO `t_sys_base_region_info` VALUES (2690, 2688, '勐海县');
INSERT INTO `t_sys_base_region_info` VALUES (2691, 2688, '勐腊县');
INSERT INTO `t_sys_base_region_info` VALUES (2692, 2574, '大理白族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2693, 2692, '大理市');
INSERT INTO `t_sys_base_region_info` VALUES (2694, 2692, '漾濞彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2695, 2692, '祥云县');
INSERT INTO `t_sys_base_region_info` VALUES (2696, 2692, '宾川县');
INSERT INTO `t_sys_base_region_info` VALUES (2697, 2692, '弥渡县');
INSERT INTO `t_sys_base_region_info` VALUES (2698, 2692, '南涧彝族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2699, 2692, '巍山彝族回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2700, 2692, '永平县');
INSERT INTO `t_sys_base_region_info` VALUES (2701, 2692, '云龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2702, 2692, '洱源县');
INSERT INTO `t_sys_base_region_info` VALUES (2703, 2692, '剑川县');
INSERT INTO `t_sys_base_region_info` VALUES (2704, 2692, '鹤庆县');
INSERT INTO `t_sys_base_region_info` VALUES (2705, 2574, '德宏傣族景颇族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2706, 2705, '瑞丽市');
INSERT INTO `t_sys_base_region_info` VALUES (2707, 2705, '芒市');
INSERT INTO `t_sys_base_region_info` VALUES (2708, 2705, '梁河县');
INSERT INTO `t_sys_base_region_info` VALUES (2709, 2705, '盈江县');
INSERT INTO `t_sys_base_region_info` VALUES (2710, 2705, '陇川县');
INSERT INTO `t_sys_base_region_info` VALUES (2711, 2574, '怒江傈僳族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2712, 2711, '泸水市');
INSERT INTO `t_sys_base_region_info` VALUES (2713, 2711, '福贡县');
INSERT INTO `t_sys_base_region_info` VALUES (2714, 2711, '贡山独龙族怒族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2715, 2711, '兰坪白族普米族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2716, 2574, '迪庆藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (2717, 2716, '香格里拉市');
INSERT INTO `t_sys_base_region_info` VALUES (2718, 2716, '德钦县');
INSERT INTO `t_sys_base_region_info` VALUES (2719, 2716, '维西傈僳族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2720, 0, '西藏自治区');
INSERT INTO `t_sys_base_region_info` VALUES (2721, 2720, '拉萨市');
INSERT INTO `t_sys_base_region_info` VALUES (2722, 2721, '城关区');
INSERT INTO `t_sys_base_region_info` VALUES (2723, 2721, '堆龙德庆区');
INSERT INTO `t_sys_base_region_info` VALUES (2724, 2721, '林周县');
INSERT INTO `t_sys_base_region_info` VALUES (2725, 2721, '当雄县');
INSERT INTO `t_sys_base_region_info` VALUES (2726, 2721, '尼木县');
INSERT INTO `t_sys_base_region_info` VALUES (2727, 2721, '曲水县');
INSERT INTO `t_sys_base_region_info` VALUES (2728, 2721, '达孜县');
INSERT INTO `t_sys_base_region_info` VALUES (2729, 2721, '墨竹工卡县');
INSERT INTO `t_sys_base_region_info` VALUES (2730, 2720, '日喀则市');
INSERT INTO `t_sys_base_region_info` VALUES (2731, 2730, '桑珠孜区');
INSERT INTO `t_sys_base_region_info` VALUES (2732, 2730, '南木林县');
INSERT INTO `t_sys_base_region_info` VALUES (2733, 2730, '江孜县');
INSERT INTO `t_sys_base_region_info` VALUES (2734, 2730, '定日县');
INSERT INTO `t_sys_base_region_info` VALUES (2735, 2730, '萨迦县');
INSERT INTO `t_sys_base_region_info` VALUES (2736, 2730, '拉孜县');
INSERT INTO `t_sys_base_region_info` VALUES (2737, 2730, '昂仁县');
INSERT INTO `t_sys_base_region_info` VALUES (2738, 2730, '谢通门县');
INSERT INTO `t_sys_base_region_info` VALUES (2739, 2730, '白朗县');
INSERT INTO `t_sys_base_region_info` VALUES (2740, 2730, '仁布县');
INSERT INTO `t_sys_base_region_info` VALUES (2741, 2730, '康马县');
INSERT INTO `t_sys_base_region_info` VALUES (2742, 2730, '定结县');
INSERT INTO `t_sys_base_region_info` VALUES (2743, 2730, '仲巴县');
INSERT INTO `t_sys_base_region_info` VALUES (2744, 2730, '亚东县');
INSERT INTO `t_sys_base_region_info` VALUES (2745, 2730, '吉隆县');
INSERT INTO `t_sys_base_region_info` VALUES (2746, 2730, '聂拉木县');
INSERT INTO `t_sys_base_region_info` VALUES (2747, 2730, '萨嘎县');
INSERT INTO `t_sys_base_region_info` VALUES (2748, 2730, '岗巴县');
INSERT INTO `t_sys_base_region_info` VALUES (2749, 2720, '昌都市');
INSERT INTO `t_sys_base_region_info` VALUES (2750, 2749, '卡若区');
INSERT INTO `t_sys_base_region_info` VALUES (2751, 2749, '江达县');
INSERT INTO `t_sys_base_region_info` VALUES (2752, 2749, '贡觉县');
INSERT INTO `t_sys_base_region_info` VALUES (2753, 2749, '类乌齐县');
INSERT INTO `t_sys_base_region_info` VALUES (2754, 2749, '丁青县');
INSERT INTO `t_sys_base_region_info` VALUES (2755, 2749, '察雅县');
INSERT INTO `t_sys_base_region_info` VALUES (2756, 2749, '八宿县');
INSERT INTO `t_sys_base_region_info` VALUES (2757, 2749, '左贡县');
INSERT INTO `t_sys_base_region_info` VALUES (2758, 2749, '芒康县');
INSERT INTO `t_sys_base_region_info` VALUES (2759, 2749, '洛隆县');
INSERT INTO `t_sys_base_region_info` VALUES (2760, 2749, '边坝县');
INSERT INTO `t_sys_base_region_info` VALUES (2761, 2720, '林芝市');
INSERT INTO `t_sys_base_region_info` VALUES (2762, 2761, '巴宜区');
INSERT INTO `t_sys_base_region_info` VALUES (2763, 2761, '工布江达县');
INSERT INTO `t_sys_base_region_info` VALUES (2764, 2761, '米林县');
INSERT INTO `t_sys_base_region_info` VALUES (2765, 2761, '墨脱县');
INSERT INTO `t_sys_base_region_info` VALUES (2766, 2761, '波密县');
INSERT INTO `t_sys_base_region_info` VALUES (2767, 2761, '察隅县');
INSERT INTO `t_sys_base_region_info` VALUES (2768, 2761, '朗县');
INSERT INTO `t_sys_base_region_info` VALUES (2769, 2720, '山南市');
INSERT INTO `t_sys_base_region_info` VALUES (2770, 2769, '乃东区');
INSERT INTO `t_sys_base_region_info` VALUES (2771, 2769, '扎囊县');
INSERT INTO `t_sys_base_region_info` VALUES (2772, 2769, '贡嘎县');
INSERT INTO `t_sys_base_region_info` VALUES (2773, 2769, '桑日县');
INSERT INTO `t_sys_base_region_info` VALUES (2774, 2769, '琼结县');
INSERT INTO `t_sys_base_region_info` VALUES (2775, 2769, '曲松县');
INSERT INTO `t_sys_base_region_info` VALUES (2776, 2769, '措美县');
INSERT INTO `t_sys_base_region_info` VALUES (2777, 2769, '洛扎县');
INSERT INTO `t_sys_base_region_info` VALUES (2778, 2769, '加查县');
INSERT INTO `t_sys_base_region_info` VALUES (2779, 2769, '隆子县');
INSERT INTO `t_sys_base_region_info` VALUES (2780, 2769, '错那县');
INSERT INTO `t_sys_base_region_info` VALUES (2781, 2769, '浪卡子县');
INSERT INTO `t_sys_base_region_info` VALUES (2782, 2720, '那曲地区');
INSERT INTO `t_sys_base_region_info` VALUES (2783, 2782, '那曲县');
INSERT INTO `t_sys_base_region_info` VALUES (2784, 2782, '嘉黎县');
INSERT INTO `t_sys_base_region_info` VALUES (2785, 2782, '比如县');
INSERT INTO `t_sys_base_region_info` VALUES (2786, 2782, '聂荣县');
INSERT INTO `t_sys_base_region_info` VALUES (2787, 2782, '安多县');
INSERT INTO `t_sys_base_region_info` VALUES (2788, 2782, '申扎县');
INSERT INTO `t_sys_base_region_info` VALUES (2789, 2782, '索县');
INSERT INTO `t_sys_base_region_info` VALUES (2790, 2782, '班戈县');
INSERT INTO `t_sys_base_region_info` VALUES (2791, 2782, '巴青县');
INSERT INTO `t_sys_base_region_info` VALUES (2792, 2782, '尼玛县');
INSERT INTO `t_sys_base_region_info` VALUES (2793, 2782, '双湖县');
INSERT INTO `t_sys_base_region_info` VALUES (2794, 2720, '阿里地区');
INSERT INTO `t_sys_base_region_info` VALUES (2795, 2794, '普兰县');
INSERT INTO `t_sys_base_region_info` VALUES (2796, 2794, '札达县');
INSERT INTO `t_sys_base_region_info` VALUES (2797, 2794, '噶尔县');
INSERT INTO `t_sys_base_region_info` VALUES (2798, 2794, '日土县');
INSERT INTO `t_sys_base_region_info` VALUES (2799, 2794, '革吉县');
INSERT INTO `t_sys_base_region_info` VALUES (2800, 2794, '改则县');
INSERT INTO `t_sys_base_region_info` VALUES (2801, 2794, '措勤县');
INSERT INTO `t_sys_base_region_info` VALUES (2802, 0, '陕西省');
INSERT INTO `t_sys_base_region_info` VALUES (2803, 2802, '西安市');
INSERT INTO `t_sys_base_region_info` VALUES (2804, 2803, '新城区');
INSERT INTO `t_sys_base_region_info` VALUES (2805, 2803, '碑林区');
INSERT INTO `t_sys_base_region_info` VALUES (2806, 2803, '莲湖区');
INSERT INTO `t_sys_base_region_info` VALUES (2807, 2803, '灞桥区');
INSERT INTO `t_sys_base_region_info` VALUES (2808, 2803, '未央区');
INSERT INTO `t_sys_base_region_info` VALUES (2809, 2803, '雁塔区');
INSERT INTO `t_sys_base_region_info` VALUES (2810, 2803, '阎良区');
INSERT INTO `t_sys_base_region_info` VALUES (2811, 2803, '临潼区');
INSERT INTO `t_sys_base_region_info` VALUES (2812, 2803, '长安区');
INSERT INTO `t_sys_base_region_info` VALUES (2813, 2803, '高陵区');
INSERT INTO `t_sys_base_region_info` VALUES (2814, 2803, '鄠邑区');
INSERT INTO `t_sys_base_region_info` VALUES (2815, 2803, '蓝田县');
INSERT INTO `t_sys_base_region_info` VALUES (2816, 2803, '周至县');
INSERT INTO `t_sys_base_region_info` VALUES (2817, 2802, '铜川市');
INSERT INTO `t_sys_base_region_info` VALUES (2818, 2817, '王益区');
INSERT INTO `t_sys_base_region_info` VALUES (2819, 2817, '印台区');
INSERT INTO `t_sys_base_region_info` VALUES (2820, 2817, '耀州区');
INSERT INTO `t_sys_base_region_info` VALUES (2821, 2817, '宜君县');
INSERT INTO `t_sys_base_region_info` VALUES (2822, 2817, '宝鸡市');
INSERT INTO `t_sys_base_region_info` VALUES (2823, 2822, '渭滨区');
INSERT INTO `t_sys_base_region_info` VALUES (2824, 2822, '金台区');
INSERT INTO `t_sys_base_region_info` VALUES (2825, 2822, '陈仓区');
INSERT INTO `t_sys_base_region_info` VALUES (2826, 2822, '凤翔县');
INSERT INTO `t_sys_base_region_info` VALUES (2827, 2822, '岐山县');
INSERT INTO `t_sys_base_region_info` VALUES (2828, 2822, '扶风县');
INSERT INTO `t_sys_base_region_info` VALUES (2829, 2822, '眉县');
INSERT INTO `t_sys_base_region_info` VALUES (2830, 2822, '陇县');
INSERT INTO `t_sys_base_region_info` VALUES (2831, 2822, '千阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2832, 2822, '麟游县');
INSERT INTO `t_sys_base_region_info` VALUES (2833, 2822, '凤县');
INSERT INTO `t_sys_base_region_info` VALUES (2834, 2822, '太白县');
INSERT INTO `t_sys_base_region_info` VALUES (2835, 2802, '咸阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2836, 2835, '秦都区');
INSERT INTO `t_sys_base_region_info` VALUES (2837, 2835, '杨陵区');
INSERT INTO `t_sys_base_region_info` VALUES (2838, 2835, '渭城区');
INSERT INTO `t_sys_base_region_info` VALUES (2839, 2835, '三原县');
INSERT INTO `t_sys_base_region_info` VALUES (2840, 2835, '泾阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2841, 2835, '乾县');
INSERT INTO `t_sys_base_region_info` VALUES (2842, 2835, '礼泉县');
INSERT INTO `t_sys_base_region_info` VALUES (2843, 2835, '永寿县');
INSERT INTO `t_sys_base_region_info` VALUES (2844, 2835, '彬县');
INSERT INTO `t_sys_base_region_info` VALUES (2845, 2835, '长武县');
INSERT INTO `t_sys_base_region_info` VALUES (2846, 2835, '旬邑县');
INSERT INTO `t_sys_base_region_info` VALUES (2847, 2835, '淳化县');
INSERT INTO `t_sys_base_region_info` VALUES (2848, 2835, '武功县');
INSERT INTO `t_sys_base_region_info` VALUES (2849, 2835, '兴平市');
INSERT INTO `t_sys_base_region_info` VALUES (2850, 2802, '渭南市');
INSERT INTO `t_sys_base_region_info` VALUES (2851, 2850, '临渭区');
INSERT INTO `t_sys_base_region_info` VALUES (2852, 2850, '华州区');
INSERT INTO `t_sys_base_region_info` VALUES (2853, 2850, '潼关县');
INSERT INTO `t_sys_base_region_info` VALUES (2854, 2850, '大荔县');
INSERT INTO `t_sys_base_region_info` VALUES (2855, 2850, '合阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2856, 2850, '澄城县');
INSERT INTO `t_sys_base_region_info` VALUES (2857, 2850, '蒲城县');
INSERT INTO `t_sys_base_region_info` VALUES (2858, 2850, '白水县');
INSERT INTO `t_sys_base_region_info` VALUES (2859, 2850, '富平县');
INSERT INTO `t_sys_base_region_info` VALUES (2860, 2850, '韩城市');
INSERT INTO `t_sys_base_region_info` VALUES (2861, 2850, '华阴市');
INSERT INTO `t_sys_base_region_info` VALUES (2862, 2802, '延安市');
INSERT INTO `t_sys_base_region_info` VALUES (2863, 2862, '宝塔区');
INSERT INTO `t_sys_base_region_info` VALUES (2864, 2862, '安塞区');
INSERT INTO `t_sys_base_region_info` VALUES (2865, 2862, '延长县');
INSERT INTO `t_sys_base_region_info` VALUES (2866, 2862, '延川县');
INSERT INTO `t_sys_base_region_info` VALUES (2867, 2862, '子长县');
INSERT INTO `t_sys_base_region_info` VALUES (2868, 2862, '志丹县');
INSERT INTO `t_sys_base_region_info` VALUES (2869, 2862, '吴起县');
INSERT INTO `t_sys_base_region_info` VALUES (2870, 2862, '甘泉县');
INSERT INTO `t_sys_base_region_info` VALUES (2871, 2862, '富县');
INSERT INTO `t_sys_base_region_info` VALUES (2872, 2862, '洛川县');
INSERT INTO `t_sys_base_region_info` VALUES (2873, 2862, '宜川县');
INSERT INTO `t_sys_base_region_info` VALUES (2874, 2862, '黄龙县');
INSERT INTO `t_sys_base_region_info` VALUES (2875, 2862, '黄陵县');
INSERT INTO `t_sys_base_region_info` VALUES (2876, 2802, '汉中市');
INSERT INTO `t_sys_base_region_info` VALUES (2877, 2876, '汉台区');
INSERT INTO `t_sys_base_region_info` VALUES (2878, 2876, '南郑区');
INSERT INTO `t_sys_base_region_info` VALUES (2879, 2876, '城固县');
INSERT INTO `t_sys_base_region_info` VALUES (2880, 2876, '洋县');
INSERT INTO `t_sys_base_region_info` VALUES (2881, 2876, '西乡县');
INSERT INTO `t_sys_base_region_info` VALUES (2882, 2876, '勉县');
INSERT INTO `t_sys_base_region_info` VALUES (2883, 2876, '宁强县');
INSERT INTO `t_sys_base_region_info` VALUES (2884, 2876, '略阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2885, 2876, '镇巴县');
INSERT INTO `t_sys_base_region_info` VALUES (2886, 2876, '留坝县');
INSERT INTO `t_sys_base_region_info` VALUES (2887, 2876, '佛坪县');
INSERT INTO `t_sys_base_region_info` VALUES (2888, 2802, '榆林市');
INSERT INTO `t_sys_base_region_info` VALUES (2889, 2888, '榆阳区');
INSERT INTO `t_sys_base_region_info` VALUES (2890, 2888, '横山区');
INSERT INTO `t_sys_base_region_info` VALUES (2891, 2888, '府谷县');
INSERT INTO `t_sys_base_region_info` VALUES (2892, 2888, '靖边县');
INSERT INTO `t_sys_base_region_info` VALUES (2893, 2888, '定边县');
INSERT INTO `t_sys_base_region_info` VALUES (2894, 2888, '绥德县');
INSERT INTO `t_sys_base_region_info` VALUES (2895, 2888, '米脂县');
INSERT INTO `t_sys_base_region_info` VALUES (2896, 2888, '佳县');
INSERT INTO `t_sys_base_region_info` VALUES (2897, 2888, '吴堡县');
INSERT INTO `t_sys_base_region_info` VALUES (2898, 2888, '清涧县');
INSERT INTO `t_sys_base_region_info` VALUES (2899, 2888, '子洲县');
INSERT INTO `t_sys_base_region_info` VALUES (2900, 2888, '神木市');
INSERT INTO `t_sys_base_region_info` VALUES (2901, 2802, '安康市');
INSERT INTO `t_sys_base_region_info` VALUES (2902, 2901, '汉滨区');
INSERT INTO `t_sys_base_region_info` VALUES (2903, 2901, '汉阴县');
INSERT INTO `t_sys_base_region_info` VALUES (2904, 2901, '石泉县');
INSERT INTO `t_sys_base_region_info` VALUES (2905, 2901, '宁陕县');
INSERT INTO `t_sys_base_region_info` VALUES (2906, 2901, '紫阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2907, 2901, '岚皋县');
INSERT INTO `t_sys_base_region_info` VALUES (2908, 2901, '平利县');
INSERT INTO `t_sys_base_region_info` VALUES (2909, 2901, '镇坪县');
INSERT INTO `t_sys_base_region_info` VALUES (2910, 2901, '旬阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2911, 2901, '白河县');
INSERT INTO `t_sys_base_region_info` VALUES (2912, 2802, '商洛市');
INSERT INTO `t_sys_base_region_info` VALUES (2913, 2912, '商州区');
INSERT INTO `t_sys_base_region_info` VALUES (2914, 2912, '洛南县');
INSERT INTO `t_sys_base_region_info` VALUES (2915, 2912, '丹凤县');
INSERT INTO `t_sys_base_region_info` VALUES (2916, 2912, '商南县');
INSERT INTO `t_sys_base_region_info` VALUES (2917, 2912, '山阳县');
INSERT INTO `t_sys_base_region_info` VALUES (2918, 2912, '镇安县');
INSERT INTO `t_sys_base_region_info` VALUES (2919, 2912, '柞水县');
INSERT INTO `t_sys_base_region_info` VALUES (2920, 0, '甘肃省');
INSERT INTO `t_sys_base_region_info` VALUES (2921, 2920, '兰州市');
INSERT INTO `t_sys_base_region_info` VALUES (2922, 2921, '城关区');
INSERT INTO `t_sys_base_region_info` VALUES (2923, 2921, '七里河区');
INSERT INTO `t_sys_base_region_info` VALUES (2924, 2921, '西固区');
INSERT INTO `t_sys_base_region_info` VALUES (2925, 2921, '安宁区');
INSERT INTO `t_sys_base_region_info` VALUES (2926, 2921, '红古区');
INSERT INTO `t_sys_base_region_info` VALUES (2927, 2921, '永登县');
INSERT INTO `t_sys_base_region_info` VALUES (2928, 2921, '皋兰县');
INSERT INTO `t_sys_base_region_info` VALUES (2929, 2921, '榆中县');
INSERT INTO `t_sys_base_region_info` VALUES (2930, 2920, '嘉峪关市');
INSERT INTO `t_sys_base_region_info` VALUES (2931, 2920, '金昌市');
INSERT INTO `t_sys_base_region_info` VALUES (2932, 2931, '金川区');
INSERT INTO `t_sys_base_region_info` VALUES (2933, 2931, '永昌县');
INSERT INTO `t_sys_base_region_info` VALUES (2934, 2920, '白银市');
INSERT INTO `t_sys_base_region_info` VALUES (2935, 2934, '白银区');
INSERT INTO `t_sys_base_region_info` VALUES (2936, 2934, '平川区');
INSERT INTO `t_sys_base_region_info` VALUES (2937, 2934, '靖远县');
INSERT INTO `t_sys_base_region_info` VALUES (2938, 2934, '会宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2939, 2934, '景泰县');
INSERT INTO `t_sys_base_region_info` VALUES (2940, 2920, '天水市');
INSERT INTO `t_sys_base_region_info` VALUES (2941, 2940, '秦州区');
INSERT INTO `t_sys_base_region_info` VALUES (2942, 2940, '麦积区');
INSERT INTO `t_sys_base_region_info` VALUES (2943, 2940, '清水县');
INSERT INTO `t_sys_base_region_info` VALUES (2944, 2940, '秦安县');
INSERT INTO `t_sys_base_region_info` VALUES (2945, 2940, '甘谷县');
INSERT INTO `t_sys_base_region_info` VALUES (2946, 2940, '武山县');
INSERT INTO `t_sys_base_region_info` VALUES (2947, 2940, '张家川回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2948, 2920, '武威市');
INSERT INTO `t_sys_base_region_info` VALUES (2949, 2948, '凉州区');
INSERT INTO `t_sys_base_region_info` VALUES (2950, 2948, '民勤县');
INSERT INTO `t_sys_base_region_info` VALUES (2951, 2948, '古浪县');
INSERT INTO `t_sys_base_region_info` VALUES (2952, 2948, '天祝藏族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2953, 2920, '张掖市');
INSERT INTO `t_sys_base_region_info` VALUES (2954, 2953, '甘州区');
INSERT INTO `t_sys_base_region_info` VALUES (2955, 2953, '肃南裕固族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2956, 2953, '民乐县');
INSERT INTO `t_sys_base_region_info` VALUES (2957, 2953, '临泽县');
INSERT INTO `t_sys_base_region_info` VALUES (2958, 2953, '高台县');
INSERT INTO `t_sys_base_region_info` VALUES (2959, 2953, '山丹县');
INSERT INTO `t_sys_base_region_info` VALUES (2960, 2920, '平凉市');
INSERT INTO `t_sys_base_region_info` VALUES (2961, 2960, '崆峒区');
INSERT INTO `t_sys_base_region_info` VALUES (2962, 2960, '泾川县');
INSERT INTO `t_sys_base_region_info` VALUES (2963, 2960, '灵台县');
INSERT INTO `t_sys_base_region_info` VALUES (2964, 2960, '崇信县');
INSERT INTO `t_sys_base_region_info` VALUES (2965, 2960, '华亭县');
INSERT INTO `t_sys_base_region_info` VALUES (2966, 2960, '庄浪县');
INSERT INTO `t_sys_base_region_info` VALUES (2967, 2960, '静宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2968, 2920, '酒泉市');
INSERT INTO `t_sys_base_region_info` VALUES (2969, 2968, '肃州区');
INSERT INTO `t_sys_base_region_info` VALUES (2970, 2968, '金塔县');
INSERT INTO `t_sys_base_region_info` VALUES (2971, 2968, '瓜州县');
INSERT INTO `t_sys_base_region_info` VALUES (2972, 2968, '肃北蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2973, 2968, '阿克塞哈萨克族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (2974, 2968, '玉门市');
INSERT INTO `t_sys_base_region_info` VALUES (2975, 2968, '敦煌市');
INSERT INTO `t_sys_base_region_info` VALUES (2976, 2920, '庆阳市');
INSERT INTO `t_sys_base_region_info` VALUES (2977, 2976, '西峰区');
INSERT INTO `t_sys_base_region_info` VALUES (2978, 2976, '庆城县');
INSERT INTO `t_sys_base_region_info` VALUES (2979, 2976, '环县');
INSERT INTO `t_sys_base_region_info` VALUES (2980, 2976, '华池县');
INSERT INTO `t_sys_base_region_info` VALUES (2981, 2976, '合水县');
INSERT INTO `t_sys_base_region_info` VALUES (2982, 2976, '正宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2983, 2976, '宁县');
INSERT INTO `t_sys_base_region_info` VALUES (2984, 2976, '镇原县');
INSERT INTO `t_sys_base_region_info` VALUES (2985, 2920, '定西市');
INSERT INTO `t_sys_base_region_info` VALUES (2986, 2985, '安定区');
INSERT INTO `t_sys_base_region_info` VALUES (2987, 2985, '通渭县');
INSERT INTO `t_sys_base_region_info` VALUES (2988, 2985, '陇西县');
INSERT INTO `t_sys_base_region_info` VALUES (2989, 2985, '渭源县');
INSERT INTO `t_sys_base_region_info` VALUES (2990, 2985, '临洮县');
INSERT INTO `t_sys_base_region_info` VALUES (2991, 2985, '漳县');
INSERT INTO `t_sys_base_region_info` VALUES (2992, 2985, '岷县');
INSERT INTO `t_sys_base_region_info` VALUES (2993, 2920, '陇南市');
INSERT INTO `t_sys_base_region_info` VALUES (2994, 2993, '武都区');
INSERT INTO `t_sys_base_region_info` VALUES (2995, 2993, '成县');
INSERT INTO `t_sys_base_region_info` VALUES (2996, 2993, '文县');
INSERT INTO `t_sys_base_region_info` VALUES (2997, 2993, '宕昌县');
INSERT INTO `t_sys_base_region_info` VALUES (2998, 2993, '康县');
INSERT INTO `t_sys_base_region_info` VALUES (2999, 2993, '西和县');
INSERT INTO `t_sys_base_region_info` VALUES (3000, 2993, '礼县');
INSERT INTO `t_sys_base_region_info` VALUES (3001, 2993, '徽县');
INSERT INTO `t_sys_base_region_info` VALUES (3002, 2993, '两当县');
INSERT INTO `t_sys_base_region_info` VALUES (3003, 2920, '临夏回族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3004, 3003, '临夏市');
INSERT INTO `t_sys_base_region_info` VALUES (3005, 3003, '临夏县');
INSERT INTO `t_sys_base_region_info` VALUES (3006, 3003, '康乐县');
INSERT INTO `t_sys_base_region_info` VALUES (3007, 3003, '永靖县');
INSERT INTO `t_sys_base_region_info` VALUES (3008, 3003, '广河县');
INSERT INTO `t_sys_base_region_info` VALUES (3009, 3003, '和政县');
INSERT INTO `t_sys_base_region_info` VALUES (3010, 3003, '东乡族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3011, 3003, '积石山保安族东乡族撒拉族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3012, 2920, '甘南藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3013, 3012, '合作市');
INSERT INTO `t_sys_base_region_info` VALUES (3014, 3012, '临潭县');
INSERT INTO `t_sys_base_region_info` VALUES (3015, 3012, '卓尼县');
INSERT INTO `t_sys_base_region_info` VALUES (3016, 3012, '舟曲县');
INSERT INTO `t_sys_base_region_info` VALUES (3017, 3012, '迭部县');
INSERT INTO `t_sys_base_region_info` VALUES (3018, 3012, '玛曲县');
INSERT INTO `t_sys_base_region_info` VALUES (3019, 3012, '碌曲县');
INSERT INTO `t_sys_base_region_info` VALUES (3020, 3012, '夏河县');
INSERT INTO `t_sys_base_region_info` VALUES (3021, 0, '青海省');
INSERT INTO `t_sys_base_region_info` VALUES (3022, 3021, '西宁市');
INSERT INTO `t_sys_base_region_info` VALUES (3023, 3022, '城东区');
INSERT INTO `t_sys_base_region_info` VALUES (3024, 3022, '城中区');
INSERT INTO `t_sys_base_region_info` VALUES (3025, 3022, '城西区');
INSERT INTO `t_sys_base_region_info` VALUES (3026, 3022, '城北区');
INSERT INTO `t_sys_base_region_info` VALUES (3027, 3022, '大通回族土族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3028, 3022, '湟中县');
INSERT INTO `t_sys_base_region_info` VALUES (3029, 3022, '湟源县');
INSERT INTO `t_sys_base_region_info` VALUES (3030, 3021, '海东市');
INSERT INTO `t_sys_base_region_info` VALUES (3031, 3030, '乐都区');
INSERT INTO `t_sys_base_region_info` VALUES (3032, 3030, '平安区');
INSERT INTO `t_sys_base_region_info` VALUES (3033, 3030, '民和回族土族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3034, 3030, '互助土族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3035, 3030, '化隆回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3036, 3030, '循化撒拉族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3037, 3021, '海北藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3038, 3037, '门源回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3039, 3037, '祁连县');
INSERT INTO `t_sys_base_region_info` VALUES (3040, 3037, '海晏县');
INSERT INTO `t_sys_base_region_info` VALUES (3041, 3037, '刚察县');
INSERT INTO `t_sys_base_region_info` VALUES (3042, 3021, '黄南藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3043, 3042, '同仁县');
INSERT INTO `t_sys_base_region_info` VALUES (3044, 3042, '尖扎县');
INSERT INTO `t_sys_base_region_info` VALUES (3045, 3042, '泽库县');
INSERT INTO `t_sys_base_region_info` VALUES (3046, 3042, '河南蒙古族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3047, 3021, '海南藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3048, 3047, '共和县');
INSERT INTO `t_sys_base_region_info` VALUES (3049, 3047, '同德县');
INSERT INTO `t_sys_base_region_info` VALUES (3050, 3047, '贵德县');
INSERT INTO `t_sys_base_region_info` VALUES (3051, 3047, '兴海县');
INSERT INTO `t_sys_base_region_info` VALUES (3052, 3047, '贵南县');
INSERT INTO `t_sys_base_region_info` VALUES (3053, 3021, '果洛藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3054, 3053, '玛沁县');
INSERT INTO `t_sys_base_region_info` VALUES (3055, 3053, '班玛县');
INSERT INTO `t_sys_base_region_info` VALUES (3056, 3053, '甘德县');
INSERT INTO `t_sys_base_region_info` VALUES (3057, 3053, '达日县');
INSERT INTO `t_sys_base_region_info` VALUES (3058, 3053, '久治县');
INSERT INTO `t_sys_base_region_info` VALUES (3059, 3053, '玛多县');
INSERT INTO `t_sys_base_region_info` VALUES (3060, 3021, '玉树藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3061, 3060, '玉树市');
INSERT INTO `t_sys_base_region_info` VALUES (3062, 3060, '杂多县');
INSERT INTO `t_sys_base_region_info` VALUES (3063, 3060, '称多县');
INSERT INTO `t_sys_base_region_info` VALUES (3064, 3060, '治多县');
INSERT INTO `t_sys_base_region_info` VALUES (3065, 3060, '囊谦县');
INSERT INTO `t_sys_base_region_info` VALUES (3066, 3060, '曲麻莱县');
INSERT INTO `t_sys_base_region_info` VALUES (3067, 3021, '海西蒙古族藏族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3068, 3067, '格尔木市');
INSERT INTO `t_sys_base_region_info` VALUES (3069, 3067, '德令哈市');
INSERT INTO `t_sys_base_region_info` VALUES (3070, 3067, '乌兰县');
INSERT INTO `t_sys_base_region_info` VALUES (3071, 3067, '都兰县');
INSERT INTO `t_sys_base_region_info` VALUES (3072, 3067, '天峻县');
INSERT INTO `t_sys_base_region_info` VALUES (3073, 3067, '海西蒙古族藏族自治州直辖');
INSERT INTO `t_sys_base_region_info` VALUES (3074, 0, '宁夏回族自治区');
INSERT INTO `t_sys_base_region_info` VALUES (3075, 3074, '银川市');
INSERT INTO `t_sys_base_region_info` VALUES (3076, 3075, '兴庆区');
INSERT INTO `t_sys_base_region_info` VALUES (3077, 3075, '西夏区');
INSERT INTO `t_sys_base_region_info` VALUES (3078, 3075, '金凤区');
INSERT INTO `t_sys_base_region_info` VALUES (3079, 3075, '永宁县');
INSERT INTO `t_sys_base_region_info` VALUES (3080, 3075, '贺兰县');
INSERT INTO `t_sys_base_region_info` VALUES (3081, 3075, '灵武市');
INSERT INTO `t_sys_base_region_info` VALUES (3082, 3074, '石嘴山市');
INSERT INTO `t_sys_base_region_info` VALUES (3083, 3082, '大武口区');
INSERT INTO `t_sys_base_region_info` VALUES (3084, 3082, '惠农区');
INSERT INTO `t_sys_base_region_info` VALUES (3085, 3082, '平罗县');
INSERT INTO `t_sys_base_region_info` VALUES (3086, 3074, '吴忠市');
INSERT INTO `t_sys_base_region_info` VALUES (3087, 3086, '利通区');
INSERT INTO `t_sys_base_region_info` VALUES (3088, 3086, '红寺堡区');
INSERT INTO `t_sys_base_region_info` VALUES (3089, 3086, '盐池县');
INSERT INTO `t_sys_base_region_info` VALUES (3090, 3086, '同心县');
INSERT INTO `t_sys_base_region_info` VALUES (3091, 3086, '青铜峡市');
INSERT INTO `t_sys_base_region_info` VALUES (3092, 3074, '固原市');
INSERT INTO `t_sys_base_region_info` VALUES (3093, 3092, '原州区');
INSERT INTO `t_sys_base_region_info` VALUES (3094, 3092, '西吉县');
INSERT INTO `t_sys_base_region_info` VALUES (3095, 3092, '隆德县');
INSERT INTO `t_sys_base_region_info` VALUES (3096, 3092, '泾源县');
INSERT INTO `t_sys_base_region_info` VALUES (3097, 3092, '彭阳县');
INSERT INTO `t_sys_base_region_info` VALUES (3098, 3074, '中卫市');
INSERT INTO `t_sys_base_region_info` VALUES (3099, 3098, '沙坡头区');
INSERT INTO `t_sys_base_region_info` VALUES (3100, 3098, '中宁县');
INSERT INTO `t_sys_base_region_info` VALUES (3101, 3098, '海原县');
INSERT INTO `t_sys_base_region_info` VALUES (3102, 0, '新疆维吾尔自治区');
INSERT INTO `t_sys_base_region_info` VALUES (3103, 3102, '乌鲁木齐市');
INSERT INTO `t_sys_base_region_info` VALUES (3104, 3103, '天山区');
INSERT INTO `t_sys_base_region_info` VALUES (3105, 3103, '沙依巴克区');
INSERT INTO `t_sys_base_region_info` VALUES (3106, 3103, '新市区');
INSERT INTO `t_sys_base_region_info` VALUES (3107, 3103, '水磨沟区');
INSERT INTO `t_sys_base_region_info` VALUES (3108, 3103, '头屯河区');
INSERT INTO `t_sys_base_region_info` VALUES (3109, 3103, '达坂城区');
INSERT INTO `t_sys_base_region_info` VALUES (3110, 3103, '米东区');
INSERT INTO `t_sys_base_region_info` VALUES (3111, 3103, '乌鲁木齐县');
INSERT INTO `t_sys_base_region_info` VALUES (3112, 3102, '克拉玛依市');
INSERT INTO `t_sys_base_region_info` VALUES (3113, 3112, '独山子区');
INSERT INTO `t_sys_base_region_info` VALUES (3114, 3112, '克拉玛依区');
INSERT INTO `t_sys_base_region_info` VALUES (3115, 3112, '白碱滩区');
INSERT INTO `t_sys_base_region_info` VALUES (3116, 3112, '乌尔禾区');
INSERT INTO `t_sys_base_region_info` VALUES (3117, 3102, '吐鲁番市');
INSERT INTO `t_sys_base_region_info` VALUES (3118, 3117, '高昌区');
INSERT INTO `t_sys_base_region_info` VALUES (3119, 3117, '鄯善县');
INSERT INTO `t_sys_base_region_info` VALUES (3120, 3117, '托克逊县');
INSERT INTO `t_sys_base_region_info` VALUES (3121, 3102, '哈密市');
INSERT INTO `t_sys_base_region_info` VALUES (3122, 3121, '伊州区');
INSERT INTO `t_sys_base_region_info` VALUES (3123, 3121, '巴里坤哈萨克自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3124, 3121, '伊吾县');
INSERT INTO `t_sys_base_region_info` VALUES (3125, 3102, '昌吉回族自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3126, 3125, '昌吉市');
INSERT INTO `t_sys_base_region_info` VALUES (3127, 3125, '阜康市');
INSERT INTO `t_sys_base_region_info` VALUES (3128, 3125, '呼图壁县');
INSERT INTO `t_sys_base_region_info` VALUES (3129, 3125, '玛纳斯县');
INSERT INTO `t_sys_base_region_info` VALUES (3130, 3125, '奇台县');
INSERT INTO `t_sys_base_region_info` VALUES (3131, 3125, '吉木萨尔县');
INSERT INTO `t_sys_base_region_info` VALUES (3132, 3125, '木垒哈萨克自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3133, 3102, '博尔塔拉蒙古自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3134, 3133, '博乐市');
INSERT INTO `t_sys_base_region_info` VALUES (3135, 3133, '阿拉山口市');
INSERT INTO `t_sys_base_region_info` VALUES (3136, 3133, '精河县');
INSERT INTO `t_sys_base_region_info` VALUES (3137, 3133, '温泉县');
INSERT INTO `t_sys_base_region_info` VALUES (3138, 3102, '巴音郭楞蒙古自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3139, 3138, '库尔勒市');
INSERT INTO `t_sys_base_region_info` VALUES (3140, 3138, '轮台县');
INSERT INTO `t_sys_base_region_info` VALUES (3141, 3138, '尉犁县');
INSERT INTO `t_sys_base_region_info` VALUES (3142, 3138, '若羌县');
INSERT INTO `t_sys_base_region_info` VALUES (3143, 3138, '且末县');
INSERT INTO `t_sys_base_region_info` VALUES (3144, 3138, '焉耆回族自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3145, 3138, '和静县');
INSERT INTO `t_sys_base_region_info` VALUES (3146, 3138, '和硕县');
INSERT INTO `t_sys_base_region_info` VALUES (3147, 3138, '博湖县');
INSERT INTO `t_sys_base_region_info` VALUES (3148, 3102, '阿克苏地区');
INSERT INTO `t_sys_base_region_info` VALUES (3149, 3148, '阿克苏市');
INSERT INTO `t_sys_base_region_info` VALUES (3150, 3148, '温宿县');
INSERT INTO `t_sys_base_region_info` VALUES (3151, 3148, '库车县');
INSERT INTO `t_sys_base_region_info` VALUES (3152, 3148, '沙雅县');
INSERT INTO `t_sys_base_region_info` VALUES (3153, 3148, '新和县');
INSERT INTO `t_sys_base_region_info` VALUES (3154, 3148, '拜城县');
INSERT INTO `t_sys_base_region_info` VALUES (3155, 3148, '乌什县');
INSERT INTO `t_sys_base_region_info` VALUES (3156, 3148, '阿瓦提县');
INSERT INTO `t_sys_base_region_info` VALUES (3157, 3148, '柯坪县');
INSERT INTO `t_sys_base_region_info` VALUES (3158, 3102, '克孜勒苏柯尔克孜自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3159, 3158, '阿图什市');
INSERT INTO `t_sys_base_region_info` VALUES (3160, 3158, '阿克陶县');
INSERT INTO `t_sys_base_region_info` VALUES (3161, 3158, '阿合奇县');
INSERT INTO `t_sys_base_region_info` VALUES (3162, 3158, '乌恰县');
INSERT INTO `t_sys_base_region_info` VALUES (3163, 3102, '喀什地区');
INSERT INTO `t_sys_base_region_info` VALUES (3164, 3163, '喀什市');
INSERT INTO `t_sys_base_region_info` VALUES (3165, 3163, '疏附县');
INSERT INTO `t_sys_base_region_info` VALUES (3166, 3163, '疏勒县');
INSERT INTO `t_sys_base_region_info` VALUES (3167, 3163, '英吉沙县');
INSERT INTO `t_sys_base_region_info` VALUES (3168, 3163, '泽普县');
INSERT INTO `t_sys_base_region_info` VALUES (3169, 3163, '莎车县');
INSERT INTO `t_sys_base_region_info` VALUES (3170, 3163, '叶城县');
INSERT INTO `t_sys_base_region_info` VALUES (3171, 3163, '麦盖提县');
INSERT INTO `t_sys_base_region_info` VALUES (3172, 3163, '岳普湖县');
INSERT INTO `t_sys_base_region_info` VALUES (3173, 3163, '伽师县');
INSERT INTO `t_sys_base_region_info` VALUES (3174, 3163, '巴楚县');
INSERT INTO `t_sys_base_region_info` VALUES (3175, 3163, '塔什库尔干塔吉克自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3176, 3102, '和田地区');
INSERT INTO `t_sys_base_region_info` VALUES (3177, 3176, '和田市');
INSERT INTO `t_sys_base_region_info` VALUES (3178, 3176, '和田县');
INSERT INTO `t_sys_base_region_info` VALUES (3179, 3176, '墨玉县');
INSERT INTO `t_sys_base_region_info` VALUES (3180, 3176, '皮山县');
INSERT INTO `t_sys_base_region_info` VALUES (3181, 3176, '洛浦县');
INSERT INTO `t_sys_base_region_info` VALUES (3182, 3176, '策勒县');
INSERT INTO `t_sys_base_region_info` VALUES (3183, 3176, '于田县');
INSERT INTO `t_sys_base_region_info` VALUES (3184, 3176, '民丰县');
INSERT INTO `t_sys_base_region_info` VALUES (3185, 3102, '伊犁哈萨克自治州');
INSERT INTO `t_sys_base_region_info` VALUES (3186, 3185, '伊宁市');
INSERT INTO `t_sys_base_region_info` VALUES (3187, 3185, '奎屯市');
INSERT INTO `t_sys_base_region_info` VALUES (3188, 3185, '霍尔果斯市');
INSERT INTO `t_sys_base_region_info` VALUES (3189, 3185, '伊宁县');
INSERT INTO `t_sys_base_region_info` VALUES (3190, 3185, '察布查尔锡伯自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3191, 3185, '霍城县');
INSERT INTO `t_sys_base_region_info` VALUES (3192, 3185, '巩留县');
INSERT INTO `t_sys_base_region_info` VALUES (3193, 3185, '新源县');
INSERT INTO `t_sys_base_region_info` VALUES (3194, 3185, '昭苏县');
INSERT INTO `t_sys_base_region_info` VALUES (3195, 3185, '特克斯县');
INSERT INTO `t_sys_base_region_info` VALUES (3196, 3185, '尼勒克县');
INSERT INTO `t_sys_base_region_info` VALUES (3197, 3102, '塔城地区');
INSERT INTO `t_sys_base_region_info` VALUES (3198, 3197, '塔城市');
INSERT INTO `t_sys_base_region_info` VALUES (3199, 3197, '乌苏市');
INSERT INTO `t_sys_base_region_info` VALUES (3200, 3197, '额敏县');
INSERT INTO `t_sys_base_region_info` VALUES (3201, 3197, '沙湾县');
INSERT INTO `t_sys_base_region_info` VALUES (3202, 3197, '托里县');
INSERT INTO `t_sys_base_region_info` VALUES (3203, 3197, '裕民县');
INSERT INTO `t_sys_base_region_info` VALUES (3204, 3197, '和布克赛尔蒙古自治县');
INSERT INTO `t_sys_base_region_info` VALUES (3205, 3102, '阿勒泰地区');
INSERT INTO `t_sys_base_region_info` VALUES (3206, 3205, '阿勒泰市');
INSERT INTO `t_sys_base_region_info` VALUES (3207, 3205, '布尔津县');
INSERT INTO `t_sys_base_region_info` VALUES (3208, 3205, '富蕴县');
INSERT INTO `t_sys_base_region_info` VALUES (3209, 3205, '福海县');
INSERT INTO `t_sys_base_region_info` VALUES (3210, 3205, '哈巴河县');
INSERT INTO `t_sys_base_region_info` VALUES (3211, 3205, '青河县');
INSERT INTO `t_sys_base_region_info` VALUES (3212, 3205, '吉木乃县');
INSERT INTO `t_sys_base_region_info` VALUES (3213, 3102, '石河子市');
INSERT INTO `t_sys_base_region_info` VALUES (3214, 3102, '阿拉尔市');
INSERT INTO `t_sys_base_region_info` VALUES (3215, 3102, '图木舒克市');
INSERT INTO `t_sys_base_region_info` VALUES (3216, 3102, '五家渠市');
INSERT INTO `t_sys_base_region_info` VALUES (3217, 3102, '北屯市');
INSERT INTO `t_sys_base_region_info` VALUES (3218, 3102, '铁门关市');
INSERT INTO `t_sys_base_region_info` VALUES (3219, 3102, '双河市');
INSERT INTO `t_sys_base_region_info` VALUES (3220, 3102, '可克达拉市');
INSERT INTO `t_sys_base_region_info` VALUES (3221, 3102, '昆玉市');
INSERT INTO `t_sys_base_region_info` VALUES (3222, 0, '台湾省');
INSERT INTO `t_sys_base_region_info` VALUES (3223, 0, '香港特别行政区');
INSERT INTO `t_sys_base_region_info` VALUES (3224, 3223, '中西区');
INSERT INTO `t_sys_base_region_info` VALUES (3225, 3223, '湾仔区');
INSERT INTO `t_sys_base_region_info` VALUES (3226, 3223, '东区');
INSERT INTO `t_sys_base_region_info` VALUES (3227, 3223, '南区');
INSERT INTO `t_sys_base_region_info` VALUES (3228, 3223, '油尖旺区');
INSERT INTO `t_sys_base_region_info` VALUES (3229, 3223, '深水埗区');
INSERT INTO `t_sys_base_region_info` VALUES (3230, 3223, '九龙城区');
INSERT INTO `t_sys_base_region_info` VALUES (3231, 3223, '黄大仙区');
INSERT INTO `t_sys_base_region_info` VALUES (3232, 3223, '观塘区');
INSERT INTO `t_sys_base_region_info` VALUES (3233, 3223, '荃湾区');
INSERT INTO `t_sys_base_region_info` VALUES (3234, 3223, '屯门区');
INSERT INTO `t_sys_base_region_info` VALUES (3235, 3223, '元朗区');
INSERT INTO `t_sys_base_region_info` VALUES (3236, 3223, '北区');
INSERT INTO `t_sys_base_region_info` VALUES (3237, 3223, '大埔区');
INSERT INTO `t_sys_base_region_info` VALUES (3238, 3223, '西贡区');
INSERT INTO `t_sys_base_region_info` VALUES (3239, 3223, '沙田区');
INSERT INTO `t_sys_base_region_info` VALUES (3240, 3223, '葵青区');
INSERT INTO `t_sys_base_region_info` VALUES (3241, 3223, '离岛区');
INSERT INTO `t_sys_base_region_info` VALUES (3242, 0, '澳门特别行政区');
INSERT INTO `t_sys_base_region_info` VALUES (3243, 3242, '花地玛堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3244, 3242, '花王堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3245, 3242, '望德堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3246, 3242, '大堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3247, 3242, '风顺堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3248, 3242, '嘉模堂区');
INSERT INTO `t_sys_base_region_info` VALUES (3249, 3242, '路凼填海区');
INSERT INTO `t_sys_base_region_info` VALUES (3250, 3242, '圣方济各堂区');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_file_info`;
CREATE TABLE `t_sys_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='上传文件信息';

-- ----------------------------
-- Records of t_sys_file_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_file_info` VALUES (1, '2626ac6411984ef3985078a6555edb8b0011.jpg', 'upload/2626ac6411984ef3985078a6555edb8b0011.jpg', '2018-11-13 16:25:47', '2018-11-13 16:25:47');
INSERT INTO `t_sys_file_info` VALUES (2, '7bdd0b97c89543edbb35a2bb90634a050022.jpg', 'upload/7bdd0b97c89543edbb35a2bb90634a050022.jpg', '2018-11-13 16:34:25', '2018-11-13 16:34:25');
INSERT INTO `t_sys_file_info` VALUES (3, 'a7cb599a9a7143aa8eb6bf48e638f7d80011.jpg', 'upload/a7cb599a9a7143aa8eb6bf48e638f7d80011.jpg', '2018-11-13 16:34:57', '2018-11-13 16:34:57');
INSERT INTO `t_sys_file_info` VALUES (4, 'b37de4f168d14a7e9eb62fa867090bd40011.jpg', 'upload/b37de4f168d14a7e9eb62fa867090bd40011.jpg', '2018-11-13 16:35:48', '2018-11-13 16:35:48');
INSERT INTO `t_sys_file_info` VALUES (5, '45bf863c1a9041c89526606048c4e3f20011.jpg', 'upload/45bf863c1a9041c89526606048c4e3f20011.jpg', '2018-11-14 09:41:43', '2018-11-14 09:41:43');
INSERT INTO `t_sys_file_info` VALUES (6, 'e8d3e1e9a02448b99fc4386ce668a24a0022.jpg', 'upload/e8d3e1e9a02448b99fc4386ce668a24a0022.jpg', '2018-11-14 09:41:43', '2018-11-14 09:41:43');
INSERT INTO `t_sys_file_info` VALUES (7, 'c145d8d9128741839faabe25b84ead740011.jpg', 'upload/c145d8d9128741839faabe25b84ead740011.jpg', '2018-11-14 12:15:24', '2018-11-14 12:15:24');
INSERT INTO `t_sys_file_info` VALUES (8, 'd2c72e76f85445fe92cff83dd1f2473d0022.jpg', 'upload/d2c72e76f85445fe92cff83dd1f2473d0022.jpg', '2018-11-14 12:15:24', '2018-11-14 12:15:24');
INSERT INTO `t_sys_file_info` VALUES (9, '846da7a5c20d45f48cb1c67e819523eb0011.jpg', 'upload/846da7a5c20d45f48cb1c67e819523eb0011.jpg', '2018-11-14 12:19:58', '2018-11-14 12:19:58');
INSERT INTO `t_sys_file_info` VALUES (10, 'df57bd0a62b847bbb9eaf5f302225ecd0022.jpg', 'upload/df57bd0a62b847bbb9eaf5f302225ecd0022.jpg', '2018-11-14 12:19:58', '2018-11-14 12:19:58');
INSERT INTO `t_sys_file_info` VALUES (11, '8cadd091aafe471880b6e0e153a6c3b80022.jpg', 'upload/8cadd091aafe471880b6e0e153a6c3b80022.jpg', '2018-11-14 12:27:14', '2018-11-14 12:27:14');
INSERT INTO `t_sys_file_info` VALUES (12, '1502bbbedfea43f7a2768c55d87cc56b0011.jpg', 'upload/1502bbbedfea43f7a2768c55d87cc56b0011.jpg', '2018-11-14 12:27:14', '2018-11-14 12:27:14');
INSERT INTO `t_sys_file_info` VALUES (13, 'ce9839286e2748bbabe507e9be29dafd0011.jpg', 'upload/ce9839286e2748bbabe507e9be29dafd0011.jpg', '2018-11-14 13:51:06', '2018-11-14 13:51:06');
INSERT INTO `t_sys_file_info` VALUES (14, 'c4184004993b42ff8ebc8a0d76f95ca30022.jpg', 'upload/c4184004993b42ff8ebc8a0d76f95ca30022.jpg', '2018-11-14 13:51:06', '2018-11-14 13:51:06');
INSERT INTO `t_sys_file_info` VALUES (15, '06a6f275ce51434d95fa50b69ed1475d0011.jpg', 'upload/06a6f275ce51434d95fa50b69ed1475d0011.jpg', '2018-11-14 13:57:58', '2018-11-14 13:57:58');
INSERT INTO `t_sys_file_info` VALUES (16, '0dcd05de3ef7464caee536bb889bc3f50022.jpg', 'upload/0dcd05de3ef7464caee536bb889bc3f50022.jpg', '2018-11-14 13:57:58', '2018-11-14 13:57:58');
INSERT INTO `t_sys_file_info` VALUES (17, 'e881c6885af14afa9f829e04838e0b940011.jpg', 'upload/e881c6885af14afa9f829e04838e0b940011.jpg', '2018-11-14 14:02:19', '2018-11-14 14:02:19');
INSERT INTO `t_sys_file_info` VALUES (18, '4193ad73a7914a8d90e607c9982bdae80022.jpg', 'upload/4193ad73a7914a8d90e607c9982bdae80022.jpg', '2018-11-14 14:02:19', '2018-11-14 14:02:19');
INSERT INTO `t_sys_file_info` VALUES (19, '95f562b80ed34877aa83f38f9ba053130022.jpg', 'upload/95f562b80ed34877aa83f38f9ba053130022.jpg', '2018-11-14 14:07:37', '2018-11-14 14:07:37');
INSERT INTO `t_sys_file_info` VALUES (20, 'bdcada0687874db0a8e38dfff1c88cbd0011.jpg', 'upload/bdcada0687874db0a8e38dfff1c88cbd0011.jpg', '2018-11-14 15:59:26', '2018-11-14 15:59:26');
INSERT INTO `t_sys_file_info` VALUES (21, '675a2520364d47a6b95636209d43c16d0011.jpg', 'upload/675a2520364d47a6b95636209d43c16d0011.jpg', '2018-11-14 16:00:05', '2018-11-14 16:00:05');
INSERT INTO `t_sys_file_info` VALUES (22, '5d3fd66040bd4477ba31e6844aca76ab0011.jpg', 'upload/5d3fd66040bd4477ba31e6844aca76ab0011.jpg', '2018-11-14 16:02:11', '2018-11-14 16:02:11');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu_info`;
CREATE TABLE `t_sys_menu_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `pid` bigint(255) DEFAULT NULL COMMENT '父id',
  `menu_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_type` int(255) DEFAULT NULL COMMENT '类型（0：菜单，1：按钮）',
  `menu_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标链接',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单链接',
  `menu_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单许可标识',
  `menu_sort` int(255) DEFAULT NULL COMMENT '排序',
  `menu_state` int(255) DEFAULT NULL COMMENT '状态（0：有效，1：无效）',
  `menu_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单信息';

-- ----------------------------
-- Records of t_sys_menu_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_menu_info` VALUES (1, 0, '系统管理', 0, 'icon-settings_light', NULL, NULL, 1, 0, '', '2018-09-28 14:49:29', '2018-09-28 14:49:33');
INSERT INTO `t_sys_menu_info` VALUES (2, 1, '导航栏管理', 0, 'icon-cascades', '/sys/bar', NULL, 1, 0, '', '2018-09-28 14:51:16', '2018-09-28 14:51:19');
INSERT INTO `t_sys_menu_info` VALUES (3, 2, '添加-导航栏', 1, NULL, NULL, 'sys_bar_add', 1, 0, '', '2018-09-28 14:52:06', '2018-10-02 21:55:09');
INSERT INTO `t_sys_menu_info` VALUES (4, 1, '菜单管理', 0, 'icon-list', '/sys/menu', NULL, 2, 0, '', '2018-10-01 18:52:11', '2018-10-01 18:52:15');
INSERT INTO `t_sys_menu_info` VALUES (5, 2, '编辑-导航栏', 1, NULL, NULL, 'sys_bar_edit', 2, 0, NULL, '2018-10-02 11:42:15', '2018-10-02 21:55:14');
INSERT INTO `t_sys_menu_info` VALUES (6, 0, ' 基础设置', 0, 'icon-present', NULL, NULL, 2, 0, NULL, '2018-10-02 12:29:51', '2018-10-02 12:34:01');
INSERT INTO `t_sys_menu_info` VALUES (7, 6, '图标库', 0, 'icon-skin_light', '/sys/icon', NULL, 999, 0, NULL, '2018-10-02 12:31:01', '2018-10-11 10:05:50');
INSERT INTO `t_sys_menu_info` VALUES (8, 1, '角色管理', 0, 'icon-people_list_light', '/sys/role', NULL, 3, 0, NULL, '2018-10-02 12:33:21', '2018-10-02 12:33:44');
INSERT INTO `t_sys_menu_info` VALUES (9, 1, '用户管理', 0, 'icon-friend_settings_light', '/sys/user', NULL, 4, 0, NULL, '2018-10-02 17:13:40', '2018-10-02 17:14:04');
INSERT INTO `t_sys_menu_info` VALUES (10, 6, '区域库', 0, 'icon-location_light', '/sys/region', NULL, 4, 0, '区域库', '2018-11-12 18:22:44', '2018-11-13 12:18:04');
INSERT INTO `t_sys_menu_info` VALUES (11, 6, '品牌库', 0, NULL, '/base/brand', NULL, 1, 0, NULL, '2018-11-13 12:16:52', '2018-11-13 12:16:52');
INSERT INTO `t_sys_menu_info` VALUES (12, 6, '系列库', 0, NULL, '/base/series', NULL, 2, 0, NULL, '2018-11-13 12:17:18', '2018-11-13 18:05:37');
INSERT INTO `t_sys_menu_info` VALUES (13, 6, '产品库', 0, NULL, '/base/product', NULL, 3, 0, NULL, '2018-11-13 12:17:41', '2018-11-13 18:05:32');
INSERT INTO `t_sys_menu_info` VALUES (14, 6, '码类型库', 0, NULL, '/base/codeType', NULL, 5, 0, '码类型库', '2018-11-14 11:14:20', '2018-11-14 11:14:20');
INSERT INTO `t_sys_menu_info` VALUES (15, 6, '模板库', 0, NULL, '/base/codeTemplate', NULL, 6, 0, NULL, '2018-11-14 15:11:36', '2018-11-14 15:11:36');
INSERT INTO `t_sys_menu_info` VALUES (16, 0, '业务管理', 0, NULL, NULL, NULL, 3, 0, '业务管理', '2018-11-14 17:42:01', '2018-11-14 17:42:01');
INSERT INTO `t_sys_menu_info` VALUES (17, 16, '经销商管理', 0, NULL, '/server/dealer', NULL, 1, 0, NULL, '2018-11-14 17:42:35', '2018-11-14 17:42:35');
INSERT INTO `t_sys_menu_info` VALUES (18, 16, '仓库管理', 0, NULL, '/server/warehouse', NULL, 2, 0, NULL, '2018-11-15 12:58:58', '2018-11-15 12:58:58');
INSERT INTO `t_sys_menu_info` VALUES (19, 16, '溯源码申请', 0, NULL, '/center/code/apply', NULL, 3, 0, NULL, '2018-11-15 15:42:57', '2018-11-23 09:59:40');
INSERT INTO `t_sys_menu_info` VALUES (20, 16, '溯源码导入', 0, NULL, '/server/code/import', NULL, 4, 0, NULL, '2018-11-15 15:44:12', '2018-11-23 09:59:50');
INSERT INTO `t_sys_menu_info` VALUES (21, 16, '中心注册', 0, 'icon-link', '/center/register', NULL, 5, 0, NULL, '2018-11-19 11:27:09', '2018-11-19 11:28:24');
INSERT INTO `t_sys_menu_info` VALUES (22, 16, '销售订单管理', 0, NULL, '/server/order/sale', NULL, 6, 0, '', '2018-11-27 11:45:23', '2018-11-27 11:59:00');
INSERT INTO `t_sys_menu_info` VALUES (23, 16, '退货订单管理', 0, NULL, '/server/order/return', NULL, 7, 0, NULL, '2018-11-27 11:57:46', '2018-11-28 18:16:12');
INSERT INTO `t_sys_menu_info` VALUES (24, 22, '退回-销售订单', 1, NULL, NULL, 'sale_order_return', 2, 0, NULL, '2018-11-27 16:37:42', '2018-11-27 16:42:46');
INSERT INTO `t_sys_menu_info` VALUES (25, 22, '同意-销售订单', 1, NULL, NULL, 'sale_order_agree', 1, 0, NULL, '2018-11-27 16:39:17', '2018-11-27 16:42:40');
INSERT INTO `t_sys_menu_info` VALUES (26, 22, '新建-销售订单', 1, NULL, NULL, 'sale_order_add', 0, 0, NULL, '2018-11-27 16:42:35', '2018-11-27 16:42:35');
INSERT INTO `t_sys_menu_info` VALUES (27, 16, '入库管理', 0, NULL, '/server/warehouse/putIn', NULL, 8, 0, NULL, '2018-11-28 18:34:52', '2018-11-28 18:34:52');
INSERT INTO `t_sys_menu_info` VALUES (28, 16, '出库管理', 0, NULL, '/server/warehouse/putOut', NULL, 9, 0, NULL, '2018-11-28 18:35:10', '2018-11-28 18:35:10');
INSERT INTO `t_sys_menu_info` VALUES (29, 16, '布奖兑奖', 0, NULL, '', NULL, 10, 0, NULL, '2018-11-28 18:35:43', '2018-11-28 18:35:43');
INSERT INTO `t_sys_menu_info` VALUES (30, 29, '奖项类型', 0, NULL, '/server/prize/type', NULL, 1, 0, NULL, '2018-11-28 18:36:35', '2018-11-30 11:33:30');
INSERT INTO `t_sys_menu_info` VALUES (31, 29, '奖项管理', 0, NULL, '/server/prize/manager', NULL, 2, 0, NULL, '2018-11-28 18:36:48', '2018-11-30 11:33:37');
INSERT INTO `t_sys_menu_info` VALUES (32, 29, '奖项设定', 0, NULL, '/server/prize/set', NULL, 3, 0, NULL, '2018-11-28 18:36:59', '2018-11-30 11:33:20');
INSERT INTO `t_sys_menu_info` VALUES (33, 29, '布奖记录', 0, NULL, '/server/prize/log/set', NULL, 4, 0, NULL, '2018-11-28 18:37:12', '2018-11-29 18:13:14');
INSERT INTO `t_sys_menu_info` VALUES (34, 16, '会员管理', 0, NULL, NULL, NULL, 11, 0, NULL, '2018-11-28 18:37:45', '2018-11-28 18:37:45');
INSERT INTO `t_sys_menu_info` VALUES (35, 34, '会员列表', 0, NULL, '/server/member/list', NULL, 1, 0, NULL, '2018-11-28 18:38:06', '2018-11-28 18:38:06');
INSERT INTO `t_sys_menu_info` VALUES (36, 34, '等级管理', 0, NULL, '/server/member/level', NULL, 2, 0, NULL, '2018-11-28 18:38:22', '2018-11-28 18:38:22');
INSERT INTO `t_sys_menu_info` VALUES (37, 34, '积分管理', 0, NULL, '/server/member/integral', NULL, 3, 0, NULL, '2018-11-28 18:38:38', '2018-11-28 18:38:38');
INSERT INTO `t_sys_menu_info` VALUES (38, 29, '兑奖记录', 0, NULL, '/server/prize/log/ticket', NULL, 5, 0, NULL, '2018-11-29 18:12:11', '2018-11-29 18:12:48');
INSERT INTO `t_sys_menu_info` VALUES (39, 34, '会员类型', 0, NULL, '/server/member/type', NULL, 4, 0, NULL, '2018-11-30 14:08:33', '2018-11-30 14:09:31');
INSERT INTO `t_sys_menu_info` VALUES (40, 34, '积分规则', 0, NULL, '/server/member/rule', NULL, 5, 0, NULL, '2018-11-30 14:08:55', '2018-11-30 14:09:48');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_navigation_bar_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_navigation_bar_info`;
CREATE TABLE `t_sys_navigation_bar_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bar_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导航栏名称',
  `bar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导航栏链接',
  `bar_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导航栏图标',
  `bar_sort` int(255) DEFAULT NULL COMMENT '导航栏顺序',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `bar_state` int(255) DEFAULT NULL COMMENT '状态（0：有效，1：无效）',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导航栏信息表';

-- ----------------------------
-- Records of t_sys_navigation_bar_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_navigation_bar_info` VALUES (1, '系统设置', '/sys/bar', 'el-icon-setting', 0, '系统', 0, '2018-09-28 17:14:26', '2018-11-12 17:48:41');
INSERT INTO `t_sys_navigation_bar_info` VALUES (2, '系统基础设置', '/sys/icon', 'icon-present', 1, '系统', 0, '2018-10-01 23:16:56', '2018-11-14 11:32:16');
INSERT INTO `t_sys_navigation_bar_info` VALUES (3, '基础设置', '/base/brand', 'icon-present', 2, '业务基础设置', 0, '2018-11-14 11:30:56', '2018-11-14 15:11:54');
INSERT INTO `t_sys_navigation_bar_info` VALUES (4, '企业业务', '/server/dealer', 'icon-qi', 4, '经销商管理', 0, '2018-11-14 17:41:10', '2018-12-03 22:21:55');
INSERT INTO `t_sys_navigation_bar_info` VALUES (5, '中心业务', '/center/code/apply', 'icon-goodsfavor', 3, '溯源业务', 0, '2018-11-15 15:41:01', '2018-11-23 10:00:27');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_navigation_bar_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_navigation_bar_menu_info`;
CREATE TABLE `t_sys_navigation_bar_menu_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bar_id` bigint(20) DEFAULT NULL COMMENT '导航栏id',
  `menu_id` bigint(255) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bar_id` (`bar_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `t_sys_navigation_bar_menu_info_ibfk_1` FOREIGN KEY (`bar_id`) REFERENCES `t_sys_navigation_bar_info` (`id`),
  CONSTRAINT `t_sys_navigation_bar_menu_info_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `t_sys_menu_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单关联导航';

-- ----------------------------
-- Records of t_sys_navigation_bar_menu_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (3, 1, 1);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (4, 1, 2);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (5, 1, 4);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (6, 1, 8);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (7, 1, 9);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (15, 2, 6);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (16, 2, 10);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (17, 2, 7);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (18, 3, 11);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (19, 3, 6);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (20, 3, 12);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (21, 3, 13);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (22, 3, 14);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (23, 3, 15);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (29, 5, 16);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (30, 5, 19);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (31, 5, 20);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (120, 4, 17);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (121, 4, 30);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (122, 4, 35);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (123, 4, 18);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (124, 4, 31);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (125, 4, 36);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (126, 4, 16);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (127, 4, 32);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (128, 4, 37);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (129, 4, 9);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (130, 4, 33);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (131, 4, 39);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (132, 4, 38);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (133, 4, 40);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (134, 4, 22);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (135, 4, 23);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (136, 4, 27);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (137, 4, 28);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (138, 4, 29);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (139, 4, 34);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_info`;
CREATE TABLE `t_sys_role_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `role_state` int(255) DEFAULT NULL COMMENT '状态（0：有效，1：无效）',
  `role_flag` int(255) DEFAULT NULL COMMENT '标识（0：其他，1：最高级）',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_sys_role_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_info` VALUES (1, '超级管理员', 0, 1, '2018-09-28 14:37:36', '2018-11-27 17:38:58');
INSERT INTO `t_sys_role_info` VALUES (2, '系统管理员', 0, 0, '2018-09-28 14:38:05', '2018-11-27 17:39:06');
INSERT INTO `t_sys_role_info` VALUES (3, '测试员', 0, 0, '2018-10-04 22:43:38', '2018-11-15 12:49:37');
INSERT INTO `t_sys_role_info` VALUES (4, '仓库管理员', 0, 0, '2018-11-15 12:51:54', '2018-11-15 12:55:05');
INSERT INTO `t_sys_role_info` VALUES (5, '销售人员', 0, 0, '2018-11-15 12:52:07', '2018-11-15 12:52:07');
INSERT INTO `t_sys_role_info` VALUES (6, '财务人员', 0, 0, '2018-11-15 12:52:14', '2018-11-27 16:40:58');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu_info`;
CREATE TABLE `t_sys_role_menu_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  `menu_id` bigint(255) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `t_sys_role_menu_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`),
  CONSTRAINT `t_sys_role_menu_info_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `t_sys_menu_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联菜单';

-- ----------------------------
-- Records of t_sys_role_menu_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_menu_info` VALUES (3, 6, 25);
INSERT INTO `t_sys_role_menu_info` VALUES (4, 6, 24);
INSERT INTO `t_sys_role_menu_info` VALUES (5, 2, 26);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_role_navigation_bar_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_navigation_bar_info`;
CREATE TABLE `t_sys_role_navigation_bar_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  `bar_id` bigint(255) DEFAULT NULL COMMENT '导航栏id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `bar_id` (`bar_id`) USING BTREE,
  CONSTRAINT `t_sys_role_navigation_bar_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`),
  CONSTRAINT `t_sys_role_navigation_bar_info_ibfk_2` FOREIGN KEY (`bar_id`) REFERENCES `t_sys_navigation_bar_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联导航栏';

-- ----------------------------
-- Records of t_sys_role_navigation_bar_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (2, 1, 1);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (3, 1, 2);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (8, 2, 3);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (9, 2, 4);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (10, 2, 5);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (11, 6, 4);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_info`;
CREATE TABLE `t_sys_user_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `pid` bigint(255) DEFAULT NULL COMMENT '父id',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `login_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录名',
  `login_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `login_password_plaintext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码明文(可设置可不设置)',
  `user_state` int(255) DEFAULT '0' COMMENT '用户状态（0：有效，1：无效，2：禁用）',
  `user_type` int(255) DEFAULT NULL COMMENT '用户类型（0：系统用户，1：其他）',
  `authorization_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '授权码',
  `create_user_id` bigint(255) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of t_sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_info` VALUES (1, 0, '管理员', 'sadmin', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-06-29 16:39:09', '2018-06-29 16:39:18');
INSERT INTO `t_sys_user_info` VALUES (2, 1, '系统管理员', 'admin', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-10-04 21:54:27', '2018-10-21 16:16:30');
INSERT INTO `t_sys_user_info` VALUES (3, 1, '仓库员1', 'ck1', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-11-15 12:53:35', '2018-11-15 12:53:35');
INSERT INTO `t_sys_user_info` VALUES (4, 1, '仓库员2', 'ck2', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-11-15 12:53:50', '2018-11-15 12:53:50');
INSERT INTO `t_sys_user_info` VALUES (5, 1, '财务1', 'cw1', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-11-27 16:41:12', '2018-11-27 16:41:12');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_user_role_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role_info`;
CREATE TABLE `t_sys_user_role_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `t_sys_user_role_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user_info` (`id`),
  CONSTRAINT `t_sys_user_role_info_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户关联角色';

-- ----------------------------
-- Records of t_sys_user_role_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_role_info` VALUES (1, 1, 1);
INSERT INTO `t_sys_user_role_info` VALUES (2, 1, 2);
INSERT INTO `t_sys_user_role_info` VALUES (3, 2, 2);
INSERT INTO `t_sys_user_role_info` VALUES (4, 3, 4);
INSERT INTO `t_sys_user_role_info` VALUES (5, 4, 4);
INSERT INTO `t_sys_user_role_info` VALUES (6, 5, 6);
COMMIT;

-- ----------------------------
-- Procedure structure for p_create_qrcode_table
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_create_qrcode_table`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_create_qrcode_table`()
BEGIN
  #Routine body goes here...
	-- 表日期
	-- SET @tableDate = DATE_FORMAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH),'%Y%m'); -- 上一个月
	SET @tableDate = DATE_FORMAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH),'%Y%m'); -- 下一月
	
	SET @sql = CONCAT('CREATE TABLE t_ser_apply_code_',@tableDate,'(
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT "主键",
  `center_id` bigint(20) DEFAULT NULL COMMENT "中心id",
  `code_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT "溯源码内容",
  `code_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT "溯源码订单号",
	`code_position` bigint(255) DEFAULT NULL COMMENT "溯源码位置",
	`code_position_type` bigint(255) DEFAULT NULL COMMENT "溯源码位置类型",
  `create_time` datetime DEFAULT NULL COMMENT "创建时间",
  `update_time` datetime DEFAULT NULL COMMENT "修改时间",
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT="溯源码";');
	-- SELECT @sql;
	
	PREPARE exctable FROM @sql;
	EXECUTE exctable;
	
END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_DELTEMPS
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_DELTEMPS`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_DELTEMPS`( )
BEGIN
#2,3
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m2 = a.left_code AND b.M3 = a.right_code 
	WHERE a.left_code_type = 2 AND a.right_code_type = 3;
#2,4
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m2 = a.left_code AND b.M4 = a.right_code 
	WHERE a.left_code_type = 2 AND a.right_code_type = 4;
#2,5
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m2 = a.left_code AND b.M5 = a.right_code 
	WHERE a.left_code_type = 2 AND a.right_code_type = 5;
		
#3,2
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m3 = a.left_code AND b.M2 = a.right_code 
	WHERE a.left_code_type = 3 AND a.right_code_type = 2;
#3,4
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m3 = a.left_code AND b.M4 = a.right_code 
	WHERE a.left_code_type = 3 AND a.right_code_type = 4;
#3,5
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m3 = a.left_code AND b.M5 = a.right_code 
	WHERE a.left_code_type = 3 AND a.right_code_type = 5;
		
#4,2
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m4 = a.left_code AND b.M2 = a.right_code 
	WHERE a.left_code_type = 4 AND a.right_code_type = 2;
#4,3
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m4 = a.left_code AND b.M3 = a.right_code 
	WHERE a.left_code_type = 4 AND a.right_code_type = 3;
#4,5
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m4 = a.left_code AND b.M5 = a.right_code 
	WHERE a.left_code_type = 4 AND a.right_code_type = 5;

#5,2
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m5 = a.left_code AND b.M2 = a.right_code 
	WHERE a.left_code_type = 5 AND a.right_code_type = 2;
#5,3
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m5 = a.left_code AND b.M3 = a.right_code 
	WHERE a.left_code_type = 5 AND a.right_code_type = 3;
#5,4
	DELETE a.* FROM t_ser_code_import_temp_info a
		LEFT JOIN t_ser_goods_info b ON b.m5 = a.left_code AND b.M4 = a.right_code 
	WHERE a.left_code_type = 5 AND a.right_code_type = 4;

END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_UPDAEGOODS2
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_UPDAEGOODS2`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPDAEGOODS2`( IN v_improtno VARCHAR ( 32 ), IN v_left_code_type INT, IN v_right_code_type INT )
BEGIN
	DECLARE
		v_imno VARCHAR ( 255 );
	DECLARE
		updatetype INT;#代表要更新的码位置 M3,M4，M5
	DECLARE
		wheretype INT;#代表添加吗位置m2,m3,m4
	DECLARE
		codetype INT;#0 更新左码  1位更新右码
	IF
		v_left_code_type > v_right_code_type THEN
			
			SET updatetype = v_left_code_type;
		
		SET wheretype = v_right_code_type;
		ELSE 
			SET updatetype = v_right_code_type;
		
		SET wheretype = v_left_code_type;
		
	END IF;
	
	SET codetype = v_left_code_type < v_right_code_type;
	IF
		wheretype = 2 THEN
		IF
			updatetype = 3 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m3 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m2 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m3 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m2 );
				
			END IF;
			
			ELSEIF updatetype = 4 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m4 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m2 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m4 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m2 );
				
			END IF;
			
			ELSEIF updatetype = 5 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m5 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m2 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m5 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m2 );
				
			END IF;
			
		END IF;
		
		ELSEIF wheretype = 3 THEN
		IF
			updatetype = 4 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m4 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m3 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m4 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m3 );
				
			END IF;
			
			ELSEIF updatetype = 5 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m5 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m3 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m5 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m3 );
				
			END IF;
			
		END IF;
		
		ELSEIF wheretype = 4 THEN
		IF
			updatetype = 5 THEN
			IF
				codetype = 0 THEN
					UPDATE t_ser_goods_info s 
					SET m5 = ( SELECT left_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.right_code = s.m4 );
				
				ELSEIF codetype = 1 THEN
				UPDATE t_ser_goods_info s 
				SET m5 = ( SELECT right_code FROM t_ser_code_import_temp_info b WHERE b.import_no = v_improtno AND b.left_code = s.m4 );
				
			END IF;
			
		END IF;
		
	END IF;

END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for p_update_goods_m
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_update_goods_m`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_update_goods_m`( )
BEGIN
	DECLARE
		done INT DEFAULT FALSE;-- 自定义控制游标循环变量,默认false
/*定义临时表游标*/
	DECLARE
		v_left_code VARCHAR ( 1024 );
	DECLARE
		v_right_code VARCHAR ( 1024 );
	DECLARE
		v_left_code_type INT;
	DECLARE
		v_right_code_type INT;
	DECLARE
		resSql VARCHAR ( 2000 );
	DECLARE
		tempCur CURSOR FOR SELECT
		left_code,
		right_code,
		left_code_type,
		right_code_type 
	FROM
		t_ser_code_import_temp_info;
	DECLARE
		CONTINUE HANDLER FOR NOT FOUND 
		SET done = TRUE;-- 绑定控制变量到游标,游标循环结束自动转true
#打开游标执行更新
	OPEN tempCur;
/*打开游标*/
	myLoop :
	LOOP-- 开始循环体,myLoop为自定义循环名,结束循环时用到
		FETCH tempCur INTO v_left_code,
		v_right_code,
		v_left_code_type,
		v_right_code_type;
		IF
			done THEN-- 判断是否继续循环
				LEAVE myLoop;-- 结束循环
			
		END IF;
		IF
			v_right_code_type < v_left_code_type THEN
				
				SET resSql = CONCAT( 'update  t_ser_goods_info set m', v_left_code_type, '=''', v_left_code, ''' where m', v_right_code_type, '=''', v_right_code, '''' );
			ELSE 
				SET resSql = CONCAT( 'update  t_ser_goods_info set m', v_right_code_type, '=''', v_right_code, ''' where m', v_left_code_type, '=''', v_left_code, '''' );
			
		END IF;
		
		SET @MyQuery = resSql;
		PREPARE MSQL 
		FROM
			@MyQuery;
		EXECUTE MSQL;
		
	END LOOP myLoop;-- 结束自定义循环体
	CLOSE tempCur;

END;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for P_UPD_CommonM
-- ----------------------------
DROP PROCEDURE IF EXISTS `P_UPD_CommonM`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPD_CommonM`( )
BEGIN
	DECLARE
		flag INT DEFAULT TRUE;#声明一个开关变量flag用于循环结束判断默认是true;
	DECLARE
		v_imortno VARCHAR ( 255 );
	DECLARE
		v_left_code_type INT;
	DECLARE
		v_right_code_type INT;
	DECLARE
		cur_param CURSOR FOR SELECT DISTINCT
		a.import_no,
		a.left_code_type,
		a.right_code_type 
	FROM
		t_ser_code_import_temp_info a 
	ORDER BY
		orderno;
	DECLARE
		CONTINUE HANDLER FOR NOT found 
		SET flag = FALSE;
	OPEN cur_param;#打开游标
	REPEAT
			FETCH cur_param INTO v_imortno,
			v_left_code_type,
			v_right_code_type;#把游标的内容赋值到变量中。
		CALL P_UPDAEGOODS2 ( v_imortno, v_left_code_type, v_right_code_type );
		COMMIT;
		UNTIL flag = FALSE 
	END REPEAT;
	CLOSE cur_param;#删除临时表数据
	CALL P_DELTEMPS ( );

END;
;;
delimiter ;

-- ----------------------------
-- Event structure for create_qrcode_table_event
-- ----------------------------
DROP EVENT IF EXISTS `create_qrcode_table_event`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` EVENT `create_qrcode_table_event` ON SCHEDULE EVERY 1 MONTH STARTS '2018-10-31 00:00:01' ON COMPLETION NOT PRESERVE ENABLE DO CALL p_create_qrcode_table();
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table l_ser_warehouse_goods_info
-- ----------------------------
DROP TRIGGER IF EXISTS `t_aftint_warehousegoogsin`;
delimiter ;;
CREATE TRIGGER `t_aftint_warehousegoogsin` AFTER INSERT ON `l_ser_warehouse_goods_info` FOR EACH ROW BEGIN		 

DECLARE BOXNONUMS INT DEFAULT 0;
#查询是否存在商品
select  count(*) into BOXNONUMS from t_ser_warehouse_goods_info where box_no=new.box_no;
if BOXNONUMS=0 then 
#插入库存表
	INSERT INTO t_ser_warehouse_goods_info ( source_type, warehouse_id, goods_id, box_no, goods_state, 
	warehouse_in_no, user_id, remark, create_time, update_time)
	 VALUES ( '0', new.warehouse_id, NULL, new.box_no, 1, new.warehouse_in_no, new.user_id, null, SYSDATE(), new.update_time);
	
end if;

 #通过箱码 更新码状态  更新码状态为未激活
update  t_ser_goods_info set goods_state=1 where  m5=new.box_no;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table l_ser_warehouse_goods_out_info
-- ----------------------------
DROP TRIGGER IF EXISTS `t_aftint_warehousegoogsout`;
delimiter ;;
CREATE TRIGGER `t_aftint_warehousegoogsout` BEFORE INSERT ON `l_ser_warehouse_goods_out_info` FOR EACH ROW BEGIN		 
#更新出入库状态
update t_ser_warehouse_goods_info set goods_state=2,update_time=new.goods_out_time where box_no=new.box_no;


#通过箱码更新商品吗状态  更新码状态为激活
update  t_ser_goods_info set goods_state=2 where  m5=new.box_no;
#更新布奖状态
#如果是通过订单表布奖
if new.order_id is not null then 
	update   t_ser_prize_recode_info set  prize_state=2   where pr_code  in  (select  m1 from t_ser_goods_info a,	  l_ser_warehouse_goods_out_info b where a.M5=b.box_no and b.order_id= new.order_id);
elseif new.product_id is not null then 
	#产品2不为空
	update   t_ser_prize_recode_info set  prize_state=2   where pr_code  in (select  m1 froM t_ser_goods_info where brand_series_product_id =new.product_id);
end if;


END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_ser_code_import_temp_info
-- ----------------------------
DROP TRIGGER IF EXISTS `t_bftint_codetempinfo`;
delimiter ;;
CREATE TRIGGER `t_bftint_codetempinfo` BEFORE INSERT ON `t_ser_code_import_temp_info` FOR EACH ROW BEGIN
	if new.left_code_type<new.right_code_type then 
		set new.orderno=new.left_code_type;
	else 
		set 	new.orderno=new.right_code_type;
	end if;
		 

		 
		
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_ser_prize_recode_info
-- ----------------------------
DROP TRIGGER IF EXISTS `T_AFTUPD_PRIZERECORD`;
delimiter ;;
CREATE TRIGGER `T_AFTUPD_PRIZERECORD` BEFORE UPDATE ON `t_ser_prize_recode_info` FOR EACH ROW BEGIN		 
#通过中奖的码 更新码状态为失效 4 
if new.cash_time is not null then 
	update  t_ser_goods_info set goods_state=3 where  m1=new.pr_code;
end if;

		
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

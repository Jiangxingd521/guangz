/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : os_node

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-11-10 12:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='上传文件信息';

-- ----------------------------
-- Records of t_sys_file_info
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单信息';

-- ----------------------------
-- Records of t_sys_menu_info
-- ----------------------------
INSERT INTO `t_sys_menu_info` VALUES ('1', '0', '系统管理', '0', 'icon-settings_light', null, null, '1', '0', '', '2018-09-28 14:49:29', '2018-09-28 14:49:33');
INSERT INTO `t_sys_menu_info` VALUES ('2', '1', '导航栏管理', '0', 'icon-cascades', '/sys/bar', null, '1', '0', '', '2018-09-28 14:51:16', '2018-09-28 14:51:19');
INSERT INTO `t_sys_menu_info` VALUES ('3', '2', '添加-导航栏', '1', null, null, 'sys_bar_add', '1', '0', '', '2018-09-28 14:52:06', '2018-10-02 21:55:09');
INSERT INTO `t_sys_menu_info` VALUES ('4', '1', '菜单管理', '0', 'icon-list', '/sys/menu', null, '2', '0', '', '2018-10-01 18:52:11', '2018-10-01 18:52:15');
INSERT INTO `t_sys_menu_info` VALUES ('5', '2', '编辑-导航栏', '1', null, null, 'sys_bar_edit', '2', '0', null, '2018-10-02 11:42:15', '2018-10-02 21:55:14');
INSERT INTO `t_sys_menu_info` VALUES ('6', '0', ' 基础设置', '0', 'icon-present', null, null, '2', '0', null, '2018-10-02 12:29:51', '2018-10-02 12:34:01');
INSERT INTO `t_sys_menu_info` VALUES ('7', '6', '图标库', '0', 'icon-skin_light', '/sys/icon', null, '999', '0', null, '2018-10-02 12:31:01', '2018-10-11 10:05:50');
INSERT INTO `t_sys_menu_info` VALUES ('8', '1', '角色管理', '0', 'icon-people_list_light', '/sys/role', null, '3', '0', null, '2018-10-02 12:33:21', '2018-10-02 12:33:44');
INSERT INTO `t_sys_menu_info` VALUES ('9', '1', '用户管理', '0', 'icon-friend_settings_light', '/sys/user', null, '4', '0', null, '2018-10-02 17:13:40', '2018-10-02 17:14:04');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导航栏信息表';

-- ----------------------------
-- Records of t_sys_navigation_bar_info
-- ----------------------------
INSERT INTO `t_sys_navigation_bar_info` VALUES ('1', '系统设置', '/sys/bar', 'el-icon-setting', '0', '系统', '0', '2018-09-28 17:14:26', '2018-11-10 12:06:19');
INSERT INTO `t_sys_navigation_bar_info` VALUES ('2', '基础设置', '/sys/icon', 'cs_as', '1', '系统', '0', '2018-10-01 23:16:56', '2018-11-10 12:06:00');

-- ----------------------------
-- Table structure for t_sys_navigation_bar_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_navigation_bar_menu_info`;
CREATE TABLE `t_sys_navigation_bar_menu_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `bar_id` bigint(20) DEFAULT NULL COMMENT '导航栏id',
  `menu_id` bigint(255) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`),
  KEY `bar_id` (`bar_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `t_sys_navigation_bar_menu_info_ibfk_1` FOREIGN KEY (`bar_id`) REFERENCES `t_sys_navigation_bar_info` (`id`),
  CONSTRAINT `t_sys_navigation_bar_menu_info_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `t_sys_menu_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单关联导航';

-- ----------------------------
-- Records of t_sys_navigation_bar_menu_info
-- ----------------------------
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES ('3', '1', '1');
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES ('4', '1', '2');
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES ('5', '1', '4');
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES ('6', '1', '8');
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES ('7', '1', '9');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_sys_role_info
-- ----------------------------
INSERT INTO `t_sys_role_info` VALUES ('1', '超级管理员', '0', '1', '2018-09-28 14:37:36', '2018-11-10 00:24:54');
INSERT INTO `t_sys_role_info` VALUES ('2', '系统管理员', '0', '0', '2018-09-28 14:38:05', '2018-10-16 14:26:40');
INSERT INTO `t_sys_role_info` VALUES ('3', '测试员', '0', '0', '2018-10-04 22:43:38', '2018-10-16 14:26:52');

-- ----------------------------
-- Table structure for t_sys_role_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu_info`;
CREATE TABLE `t_sys_role_menu_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  `menu_id` bigint(255) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `t_sys_role_menu_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`),
  CONSTRAINT `t_sys_role_menu_info_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `t_sys_menu_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联菜单';

-- ----------------------------
-- Records of t_sys_role_menu_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role_navigation_bar_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_navigation_bar_info`;
CREATE TABLE `t_sys_role_navigation_bar_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  `bar_id` bigint(255) DEFAULT NULL COMMENT '导航栏id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `bar_id` (`bar_id`) USING BTREE,
  CONSTRAINT `t_sys_role_navigation_bar_info_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`),
  CONSTRAINT `t_sys_role_navigation_bar_info_ibfk_2` FOREIGN KEY (`bar_id`) REFERENCES `t_sys_navigation_bar_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联导航栏';

-- ----------------------------
-- Records of t_sys_role_navigation_bar_info
-- ----------------------------
INSERT INTO `t_sys_role_navigation_bar_info` VALUES ('1', '1', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of t_sys_user_info
-- ----------------------------
INSERT INTO `t_sys_user_info` VALUES ('1', '0', '管理员', 'sadmin', '25d55ad283aa400af464c76d713c07ad', '12345678', '0', '0', null, '1', '2018-06-29 16:39:09', '2018-06-29 16:39:18');
INSERT INTO `t_sys_user_info` VALUES ('2', '1', '系统管理员', 'admin', '25d55ad283aa400af464c76d713c07ad', '12345678', '0', '0', null, '1', '2018-10-04 21:54:27', '2018-10-21 16:16:30');

-- ----------------------------
-- Table structure for t_sys_user_role_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role_info`;
CREATE TABLE `t_sys_user_role_info` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(255) DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(255) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `t_sys_user_role_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user_info` (`id`),
  CONSTRAINT `t_sys_user_role_info_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_sys_role_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户关联角色';

-- ----------------------------
-- Records of t_sys_user_role_info
-- ----------------------------
INSERT INTO `t_sys_user_role_info` VALUES ('1', '1', '1');
INSERT INTO `t_sys_user_role_info` VALUES ('2', '1', '2');

-- ----------------------------
-- Procedure structure for p_create_qrcode_table
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_create_qrcode_table`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_create_qrcode_table`()
BEGIN
  #Routine body goes here...
	-- 表日期
	-- SET @tableDate = DATE_FORMAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH),'%Y%m'); -- 上一个月
	SET @tableDate = DATE_FORMAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH),'%Y%m'); -- 下一月
	
	SET @sql = CONCAT('CREATE TABLE t_ser_qrcode_info_',@tableDate,'(
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT "主键",
	`code_center_id` bigint(20) NOT NULL COMMENT "中心id",
	`code_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT "码内容",
	`code_state` int(255) DEFAULT "0" COMMENT "码状态（0：，1：，2：，3：）",
  `code_type` int(255) DEFAULT NULL COMMENT "码类型（0：M1，1：M2，2：M3，3：4：M4，5：M5）",
  `code_batch` int(255) DEFAULT NULL COMMENT "批次",
  `code_product` bigint(20) DEFAULT NULL COMMENT "产品",
  `code_series` bigint(20) DEFAULT NULL COMMENT "产品系列",
  `create_time` timestamp NULL DEFAULT NULL COMMENT "创建时间",
  `update_time` timestamp NULL DEFAULT NULL COMMENT "修改时间",
	PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT="二维码批次号";');
	-- SELECT @sql;
	
	PREPARE exctable FROM @sql;
	EXECUTE exctable;
	
END
;;
DELIMITER ;

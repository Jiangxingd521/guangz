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

 Date: 14/11/2018 18:32:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `file_id` (`file_id`),
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
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='产品组成码信息';

-- ----------------------------
-- Records of t_ser_brand_series_product_code_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (65, 5, 3);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (66, 5, 4);
INSERT INTO `t_ser_brand_series_product_code_info` VALUES (67, 5, 5);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_brand_series_product_file
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_brand_series_product_file`;
CREATE TABLE `t_ser_brand_series_product_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL COMMENT '系列id',
  `file_id` bigint(20) DEFAULT NULL COMMENT '系列图片id',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `t_ser_brand_series_product_file_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `t_ser_brand_series_product_info` (`id`),
  CONSTRAINT `t_ser_brand_series_product_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `t_sys_file_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌产品系列图片';

-- ----------------------------
-- Records of t_ser_brand_series_product_file
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_file` VALUES (32, 5, 17);
INSERT INTO `t_ser_brand_series_product_file` VALUES (33, 5, 18);
INSERT INTO `t_ser_brand_series_product_file` VALUES (34, 5, 19);
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
  PRIMARY KEY (`id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `t_ser_brand_series_product_info_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `t_ser_brand_series_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='品牌系列产品信息';

-- ----------------------------
-- Records of t_ser_brand_series_product_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_brand_series_product_info` VALUES (5, 1, NULL, '产品1', NULL, NULL, NULL, '600ml', 56.00, 45.00, '1234asdf', '备注1', '2018-11-14 13:58:01', '2018-11-14 14:07:56', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_import_template_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_import_template_info`;
CREATE TABLE `t_ser_code_import_template_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板名称',
  `left_code_type_id` bigint(20) DEFAULT NULL COMMENT '左码',
  `right_code_type_id` bigint(20) DEFAULT NULL COMMENT '右码',
  `template_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板说明',
  `template_state` int(255) DEFAULT NULL COMMENT '模板状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `left_code_type_id` (`left_code_type_id`),
  KEY `right_code_type_id` (`right_code_type_id`),
  CONSTRAINT `t_ser_code_import_template_info_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `t_ser_brand_series_product_info` (`id`),
  CONSTRAINT `t_ser_code_import_template_info_ibfk_4` FOREIGN KEY (`left_code_type_id`) REFERENCES `t_ser_code_type_info` (`id`),
  CONSTRAINT `t_ser_code_import_template_info_ibfk_5` FOREIGN KEY (`right_code_type_id`) REFERENCES `t_ser_code_type_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='码导入模板';

-- ----------------------------
-- Records of t_ser_code_import_template_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_import_template_info` VALUES (1, 5, '盖内-盖外', 3, 4, '产品1的盖内外模板', 0, '2018-11-14 15:23:55', '2018-11-14 15:26:30');
COMMIT;

-- ----------------------------
-- Table structure for t_ser_code_type_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ser_code_type_info`;
CREATE TABLE `t_ser_code_type_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '码类型名称',
  `code_type` int(255) DEFAULT NULL COMMENT '码类型（0：码模板，1：内外码，2：码类型）',
  `code_state` int(255) DEFAULT NULL COMMENT '类型状态（0：使用，1：未使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='溯源码类型';

-- ----------------------------
-- Records of t_ser_code_type_info
-- ----------------------------
BEGIN;
INSERT INTO `t_ser_code_type_info` VALUES (1, '内码', 1, 0, '2018-11-14 11:38:48', '2018-11-14 11:38:48');
INSERT INTO `t_ser_code_type_info` VALUES (2, '外码', 1, 0, '2018-11-14 11:39:02', '2018-11-14 11:39:02');
INSERT INTO `t_ser_code_type_info` VALUES (3, '盖内码', 0, 0, '2018-11-14 11:40:32', '2018-11-14 11:40:32');
INSERT INTO `t_ser_code_type_info` VALUES (4, '盖外码', 0, 0, '2018-11-14 11:40:45', '2018-11-14 11:40:45');
INSERT INTO `t_ser_code_type_info` VALUES (5, '瓶码', 0, 0, '2018-11-14 11:40:56', '2018-11-14 11:40:56');
INSERT INTO `t_ser_code_type_info` VALUES (6, '盒码', 0, 0, '2018-11-14 11:41:09', '2018-11-14 11:41:09');
INSERT INTO `t_ser_code_type_info` VALUES (7, '箱码', 0, 0, '2018-11-14 11:41:22', '2018-11-14 11:41:22');
INSERT INTO `t_ser_code_type_info` VALUES (8, '二维码', 2, 0, '2018-11-14 11:45:31', '2018-11-14 11:45:31');
INSERT INTO `t_ser_code_type_info` VALUES (9, '条形码', 2, 0, '2018-11-14 11:45:37', '2018-11-14 11:45:37');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经销商信息';

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
  `inventory` int(255) DEFAULT NULL COMMENT '商品库存',
  `inventory_state` int(255) DEFAULT NULL COMMENT '库存状态（0：正常，1：异常）',
  `total_inventory` int(255) DEFAULT NULL COMMENT '库存总量',
  `warehouse_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库备注',
  `warehouse_state` int(255) DEFAULT NULL COMMENT '仓库状态（0：未使用，1：使用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_ser_warehouse_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库信息';

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
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导航栏信息表';

-- ----------------------------
-- Records of t_sys_navigation_bar_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_navigation_bar_info` VALUES (1, '系统设置', '/sys/bar', 'el-icon-setting', 0, '系统', 0, '2018-09-28 17:14:26', '2018-11-12 17:48:41');
INSERT INTO `t_sys_navigation_bar_info` VALUES (2, '系统基础设置', '/sys/icon', 'icon-present', 1, '系统', 0, '2018-10-01 23:16:56', '2018-11-14 11:32:16');
INSERT INTO `t_sys_navigation_bar_info` VALUES (3, '基础设置', '/base/brand', 'icon-present', 2, '业务基础设置', 0, '2018-11-14 11:30:56', '2018-11-14 15:11:54');
INSERT INTO `t_sys_navigation_bar_info` VALUES (4, '企业业务', '/server/dealer', NULL, 3, '经销商管理', 0, '2018-11-14 17:41:10', '2018-11-14 17:42:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单关联导航';

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
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (24, 4, 17);
INSERT INTO `t_sys_navigation_bar_menu_info` VALUES (25, 4, 16);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色权限表';

-- ----------------------------
-- Records of t_sys_role_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_info` VALUES (1, '超级管理员', 0, 1, '2018-09-28 14:37:36', '2018-11-14 11:54:15');
INSERT INTO `t_sys_role_info` VALUES (2, '系统管理员', 0, 0, '2018-09-28 14:38:05', '2018-11-14 17:43:10');
INSERT INTO `t_sys_role_info` VALUES (3, '测试员', 0, 0, '2018-10-04 22:43:38', '2018-10-16 14:26:52');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联菜单';

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色关联导航栏';

-- ----------------------------
-- Records of t_sys_role_navigation_bar_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (2, 1, 1);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (3, 1, 2);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (6, 2, 3);
INSERT INTO `t_sys_role_navigation_bar_info` VALUES (7, 2, 4);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of t_sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_info` VALUES (1, 0, '管理员', 'sadmin', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-06-29 16:39:09', '2018-06-29 16:39:18');
INSERT INTO `t_sys_user_info` VALUES (2, 1, '系统管理员', 'admin', '25d55ad283aa400af464c76d713c07ad', '12345678', 0, 0, NULL, 1, '2018-10-04 21:54:27', '2018-10-21 16:16:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户关联角色';

-- ----------------------------
-- Records of t_sys_user_role_info
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_user_role_info` VALUES (1, 1, 1);
INSERT INTO `t_sys_user_role_info` VALUES (2, 1, 2);
INSERT INTO `t_sys_user_role_info` VALUES (3, 2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

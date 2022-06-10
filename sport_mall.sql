/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : sport_mall

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 08/06/2022 21:35:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_regtime` datetime(0) NULL,
  `user_modtime` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 分类id主键',
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称 分类名称',
  `category_level` int(11) NOT NULL COMMENT '分类层级 分类得类型，\n1:一级大分类\n2:二级分类\n3:三级小分类',
  `parent_id` int(11) NOT NULL COMMENT '父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级',
  `category_icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标 logo',
  `category_slogan` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '口号',
  `category_pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图',
  `category_bg_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '运动潮鞋', 1, 0, '鞋子.png', '爱运动，爱生活', '运动组.png', 'black');
INSERT INTO `category` VALUES (2, '运动服饰', 1, 0, '衣服,服装.png', '健康饮食远离我', '衣服.png', 'black');
INSERT INTO `category` VALUES (3, '健身训练', 1, 0, '健身.png', '我要做强的男人', '举重.png', 'black');
INSERT INTO `category` VALUES (4, '运动包饰', 1, 0, '运动包.png', 'nice！nice！nice！', '包包.png', 'black');
INSERT INTO `category` VALUES (5, '骑行运动', 1, 0, '自行车.png', '酥酥脆脆，回味无穷', '自行车2.png', 'black');
INSERT INTO `category` VALUES (6, '体育用品', 1, 0, '篮球.png', '动起来动起来', '篮球2.png', 'black');
INSERT INTO `category` VALUES (7, '户外鞋服', 1, 0, '户外鞋.png', NULL, '冲浪.png', 'black');
INSERT INTO `category` VALUES (8, '户外装备', 1, 0, '户外.png', NULL, 'act2.png', 'black');
INSERT INTO `category` VALUES (9, '垂钓用品', 1, 0, '垂钓.png', '健康快乐每一天', 'act3.png', 'black');
INSERT INTO `category` VALUES (10, '游泳用品', 1, 0, '游泳.png', '冲冲冲', NULL, 'black');
INSERT INTO `category` VALUES (11, '男子鞋类', 2, 1, NULL, NULL, NULL, 'black');
INSERT INTO `category` VALUES (12, '女子鞋类', 2, 1, NULL, NULL, NULL, 'black');
INSERT INTO `category` VALUES (13, '男子服饰', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (14, '女子服饰', 2, 2, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (15, '运动包', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (16, '斜挎包', 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (17, '居家器材', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (18, '专业器材', 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (19, '车具', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (20, '服饰', 2, 5, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (21, '器材', 2, 6, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (24, '户外服饰', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (25, '户外鞋饰', 2, 7, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (26, '户外必备', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (27, '户外工具', 2, 8, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (28, '钓鱼用具', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (29, '辅助装备', 2, 9, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (30, '泳衣', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (31, '游泳配件', 2, 10, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (36, '休闲鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (37, '帆布鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (38, '篮球鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (39, '足球鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (40, '运动鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (41, '训练鞋', 3, 11, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (44, '运动鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (45, '小白鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (46, '跑步鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (47, '老爹鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (49, '健身/训练鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (50, '气垫鞋', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (53, '运动裤', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (54, '运动套装', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (55, '运动配饰', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (56, '运动背心', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (57, '健身服', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (58, 'T恤', 3, 13, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (62, '运动内衣', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (63, '运动套装', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (64, '运动裤', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (65, '运动背心', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (66, '健身服', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (67, 'T恤', 3, 14, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (69, '大包', 3, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (70, '中包', 2, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (71, '小包', 2, 15, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (72, '大包', 2, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (73, '中包', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (74, '小包', 3, 16, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (75, '跑步机', 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (76, '瑜伽用品', 3, 17, '', '冲冲冲', '', 'black');
INSERT INTO `category` VALUES (77, '跳绳', 3, 17, '', '冲冲冲', '', 'black');
INSERT INTO `category` VALUES (78, '哑铃', 3, 17, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (79, '动感单车', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (82, '健身车', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (83, '椭圆机', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (84, '划船机', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (85, '拉力器', 3, 18, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (86, '山地车', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (87, '折叠车', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (88, '城市自行车', 3, 19, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (89, '骑行服', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (90, '穿戴装备', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (91, '自行车配件', 3, 20, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (92, '篮球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (93, '足球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (94, '排球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (95, '网球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (96, '乒乓球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (97, '羽毛球', 3, 21, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (98, '冲锋衣裤', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (99, '速干衣裤', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (100, '户外风衣', 3, 24, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (101, '登山鞋', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (102, '工装鞋', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (103, '沙滩/凉拖', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (104, '徒步鞋', 3, 25, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (105, '背包', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (106, '帐篷', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (107, '旅行装备', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (108, '睡袋', 3, 26, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (109, '户外仪表', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (110, '滑雪装备', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (111, '登山攀岩', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (112, '救援装备', 3, 27, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (113, '钓竿', 3, 28, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (114, '鱼线', 3, 28, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (115, '鱼饵', 3, 28, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (116, '渔具包', 3, 28, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (117, '钓鱼配件', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (118, '钓箱钓椅', 3, 29, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (119, '男士泳衣', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (120, '女士泳衣', 3, 30, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (121, '泳帽', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (122, '泳镜', 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (123, '哈哈', 1, 11, 'package.png', '冲冲冲', '', 'black');
INSERT INTO `category` VALUES (124, '为', 1, 11, 'package.png', '', '', '23');

-- ----------------------------
-- Table structure for index_img
-- ----------------------------
DROP TABLE IF EXISTS `index_img`;
CREATE TABLE `index_img`  (
  `img_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片 图片地址',
  `img_bg_color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景色 背景颜色',
  `prod_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id 商品id',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类id 商品分类id',
  `index_type` int(11) NOT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
  `seq` int(11) NOT NULL COMMENT '轮播图展示顺序 轮播图展示顺序，从小到大',
  `status` int(11) NOT NULL COMMENT '是否展示:1表示正常显示，0表示下线 是否展示，1：展示    0：不展示',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间 创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间 更新',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of index_img
-- ----------------------------
INSERT INTO `index_img` VALUES ('1', 'ad3.jpg', 'blue', '101', NULL, 1, 1, 1, '2021-04-14 17:21:13', '2021-04-14 17:21:18');
INSERT INTO `index_img` VALUES ('2', 'ad2.jpg', 'blue', NULL, '1', 2, 2, 1, '2021-04-14 17:21:49', '2021-04-14 17:21:52');
INSERT INTO `index_img` VALUES ('3', 'bg6.png', 'blue', '103', NULL, 1, 3, 1, '2021-04-14 17:22:23', '2021-04-14 17:22:27');
INSERT INTO `index_img` VALUES ('4', 'ad4.jpg', 'black', NULL, '2', 2, 4, 1, '2021-04-14 17:23:06', '2021-04-14 17:23:08');
INSERT INTO `index_img` VALUES ('5', 'ad5.jpg', 'yellow', '101', NULL, 1, 2, 0, '2021-04-24 09:34:01', '2021-04-25 09:34:05');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单项ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `product_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `sku_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `product_price` decimal(32, 8) NOT NULL COMMENT '商品价格',
  `buy_counts` int(11) NOT NULL COMMENT '购买数量',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '商品总金额',
  `basket_date` datetime(0) NULL DEFAULT NULL COMMENT '加入购物车时间',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '购买时间',
  `is_comment` int(11) NULL DEFAULT NULL COMMENT '评论状态： 0 未评价  1 已评价',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单项/快照 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('164924314742277158', '176ca9a176a64a6298c1dbdcf0ebaa29', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 599.00000000, 2, 1198.00000000, '2022-04-06 19:05:47', '2022-04-06 19:05:47', 0);
INSERT INTO `order_item` VALUES ('164924314742649000', '176ca9a176a64a6298c1dbdcf0ebaa29', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 599.00000000, 1, 599.00000000, '2022-04-06 19:05:47', '2022-04-06 19:05:47', 0);
INSERT INTO `order_item` VALUES ('164952167778298225', 'ea0faf1a4eb14f97905396e65274d636', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 00:27:58', '2022-04-10 00:27:58', 0);
INSERT INTO `order_item` VALUES ('164952197321043848', '196493b9636e4680a58c2d1bdb037836', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 00:32:53', '2022-04-10 00:32:53', 0);
INSERT INTO `order_item` VALUES ('164952234909676019', '3ea9c114330143cd94a52e0d4f3bafa0', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 00:39:09', '2022-04-10 00:39:09', 0);
INSERT INTO `order_item` VALUES ('164952285752047674', 'c90fd5be8f5f4948855b8cdb65a79303', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 00:47:38', '2022-04-10 00:47:38', 0);
INSERT INTO `order_item` VALUES ('164952379195826313', '46a264b3bc524484a4a8386a44790df9', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:03:12', '2022-04-10 01:03:12', 0);
INSERT INTO `order_item` VALUES ('164952416626793363', '646767f4385b49b084a8d1fb72b6b557', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:09:26', '2022-04-10 01:09:26', 0);
INSERT INTO `order_item` VALUES ('164952466083633234', '10adcff1fa3a44ec9b873edac2788324', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:17:41', '2022-04-10 01:17:41', 0);
INSERT INTO `order_item` VALUES ('164952542817894506', '986dd35fd30843d0957a85f340bcc1dd', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:30:28', '2022-04-10 01:30:28', 0);
INSERT INTO `order_item` VALUES ('164952599374141740', '4a61829b73af4ab2a4cda49b527ac9ba', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:39:54', '2022-04-10 01:39:54', 0);
INSERT INTO `order_item` VALUES ('164952608744022656', '74dd759557f449a199a1267867402e1a', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:41:27', '2022-04-10 01:41:27', 0);
INSERT INTO `order_item` VALUES ('164952702574898554', '87ee630aae1d4b04a76b796f3a4862fe', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 01:57:06', '2022-04-10 01:57:06', 0);
INSERT INTO `order_item` VALUES ('164959515516717408', 'cf4f9074bbc64062b1dd18a96cbd3384', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 20:52:35', '2022-04-10 20:52:35', 0);
INSERT INTO `order_item` VALUES ('164959539332638379', 'ee1cdeda3de84ab7b718a1cb5b848704', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 20:56:33', '2022-04-10 20:56:33', 0);
INSERT INTO `order_item` VALUES ('164959600935736165', '42a0c4810a5e42d19ee370f23091e16d', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:06:49', '2022-04-10 21:06:49', 0);
INSERT INTO `order_item` VALUES ('164959611756938849', 'ac1e85528ab345d6b1d012095efff274', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:08:38', '2022-04-10 21:08:38', 0);
INSERT INTO `order_item` VALUES ('164959620473715543', '98291b0373a547f8be983ecf114b858b', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:10:05', '2022-04-10 21:10:05', 0);
INSERT INTO `order_item` VALUES ('164959642333369580', 'f28e9e8c385e4f199dc16d718f94da1b', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:13:43', '2022-04-10 21:13:43', 0);
INSERT INTO `order_item` VALUES ('164959659954879836', '3f9105ff6b0b4784b80dd688c82d1b32', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:16:40', '2022-04-10 21:16:40', 0);
INSERT INTO `order_item` VALUES ('164959680414422633', '64e6ccae58164c5d8575f2236975e76f', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:20:04', '2022-04-10 21:20:04', 0);
INSERT INTO `order_item` VALUES ('164959702638621200', '69a52fd70f7c43db82c319983d53a7b0', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:23:46', '2022-04-10 21:23:46', 0);
INSERT INTO `order_item` VALUES ('164959707370067912', '6c3f5f9e480c4d1199d11299fd11872b', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:24:34', '2022-04-10 21:24:34', 0);
INSERT INTO `order_item` VALUES ('164959722431625145', 'd19f0da9ad644dcab79457f54cee2c55', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:27:04', '2022-04-10 21:27:04', 0);
INSERT INTO `order_item` VALUES ('164959730600912399', '34421d7e37af4a3b859b0970804f62e6', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:28:26', '2022-04-10 21:28:26', 0);
INSERT INTO `order_item` VALUES ('164959736678712135', '83211e44032148febaed1875bb92cdbe', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:29:27', '2022-04-10 21:29:27', 0);
INSERT INTO `order_item` VALUES ('164959768034032711', '1a3d93296c004985b45aeff1b02ae778', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-10 21:34:40', '2022-04-10 21:34:40', 0);
INSERT INTO `order_item` VALUES ('164974383129491220', '20a74ee233114f1f89ad88c27110d1cb', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-12 14:10:31', '2022-04-12 14:10:31', 0);
INSERT INTO `order_item` VALUES ('164974439818370247', '498d2e544e344dceaf21ea62d6c663de', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-12 14:19:58', '2022-04-12 14:19:58', 0);
INSERT INTO `order_item` VALUES ('164974463507062790', '9870b4b92f0c4c39a2cfc0bca787b3de', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-12 14:23:55', '2022-04-12 14:23:55', 0);
INSERT INTO `order_item` VALUES ('164974542338611707', 'd57b4eda23e24c7e9c130c640762b835', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-12 14:37:03', '2022-04-12 14:37:03', 0);
INSERT INTO `order_item` VALUES ('165028754894888211', '48f1daf5f2e64f9687d3e5c6bcfb016d', '26', 'adidas跑步鞋', 'af1_1.jpg', '12', '加力加 100g', 2.00000000, 1, 2.00000000, '2022-04-18 21:12:29', '2022-04-18 21:12:29', 0);
INSERT INTO `order_item` VALUES ('165044805380113717', 'd790beadb1d2403681dc98fb1b831f83', '20', 'adidas跑步鞋3', 'adidas4.jpg', '25', '黑色', 1.00000000, 1, 1.00000000, '2022-04-20 17:47:34', '2022-04-20 17:47:34', 0);
INSERT INTO `order_item` VALUES ('165044805380499821', 'd790beadb1d2403681dc98fb1b831f83', '3', 'NIKE REVOLUTION5 跑步鞋', 'REVOLUTION5_1.jpg', '1', '空军一号 白色 夜光', 599.00000000, 1, 599.00000000, '2022-04-20 17:47:34', '2022-04-20 17:47:34', 0);
INSERT INTO `order_item` VALUES ('165052194929132410', '4cff5f19da644483a1e7163ebf4c8a82', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '1', '空军一号 白色 夜光', 599.00000000, 1, 599.00000000, '2022-04-21 14:19:09', '2022-04-21 14:19:09', 0);
INSERT INTO `order_item` VALUES ('165052248318768816', '180f21ad8709411b934e0781b253268e', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 14:28:03', '2022-04-21 14:28:03', 0);
INSERT INTO `order_item` VALUES ('165054715514835596', '06c5f7cea45945f18f6519b73afb74bf', '11', '耐克 男/女 NIKE FREE METCON 4 ', 'nike2.jpg', '16', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 21:19:15', '2022-04-21 21:19:15', 0);
INSERT INTO `order_item` VALUES ('165054725490955937', '51c4eb7604204666869c5c81f246247a', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-21 21:20:55', '2022-04-21 21:20:55', 0);
INSERT INTO `order_item` VALUES ('165054725491188380', '51c4eb7604204666869c5c81f246247a', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 21:20:55', '2022-04-21 21:20:55', 0);
INSERT INTO `order_item` VALUES ('165054725491195294', '51c4eb7604204666869c5c81f246247a', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '6', '空军一号 黑色', 2.00000000, 1, 2.00000000, '2022-04-21 21:20:55', '2022-04-21 21:20:55', 0);
INSERT INTO `order_item` VALUES ('165054730952236686', '81a7da37b2324ca09f94f985315d5900', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 21:21:50', '2022-04-21 21:21:50', 0);
INSERT INTO `order_item` VALUES ('165054746439632315', 'b94463b1ba6643da907e8ca1ba766fb8', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 21:24:24', '2022-04-21 21:24:24', 0);
INSERT INTO `order_item` VALUES ('165055426358446681', '5e8e691bdd644ae79f67fbcaddbf9d2e', '12', 'NIKE运动鞋', 'nike3.jpg', '17', '黑色', 1.00000000, 1, 1.00000000, '2022-04-21 23:17:44', '2022-04-21 23:17:44', 0);
INSERT INTO `order_item` VALUES ('165055737488760262', '710806506c3742ae991ff79999e17f4c', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '3', '空军一号 纯色', 1.00000000, 1, 1.00000000, '2022-04-22 00:09:35', '2022-04-22 00:09:35', 0);
INSERT INTO `order_item` VALUES ('165062175821155157', 'd75db99053d64e2b809a9530ba2be82a', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 18:02:38', '2022-04-22 18:02:38', 0);
INSERT INTO `order_item` VALUES ('165062183238975020', 'c2ef4fbca3664c3cb0a9f5839c8c2e63', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 18:03:52', '2022-04-22 18:03:52', 0);
INSERT INTO `order_item` VALUES ('165062193656027036', '82ef257dc96e49769aa79ab61a739d77', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 18:05:37', '2022-04-22 18:05:37', 0);
INSERT INTO `order_item` VALUES ('165062196998669151', '257de34bc68e48a28c2044db963ebf5b', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 18:06:10', '2022-04-22 18:06:10', 0);
INSERT INTO `order_item` VALUES ('165062207435932774', 'c654fc3b06b94cc88466a0d18bc42af6', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 18:07:54', '2022-04-22 18:07:54', 0);
INSERT INTO `order_item` VALUES ('165062209328157996', 'cafc9f369942417bb9465edc709fe85a', '1', 'NIKE AIR FORCE 1\'07 AF1', 'af1_1.jpg', '6', '空军一号 黑色', 2.00000000, 1, 2.00000000, '2022-04-22 18:08:13', '2022-04-22 18:08:13', 0);
INSERT INTO `order_item` VALUES ('165062848380790877', 'fc4c1b67e1d84557a0eab7bb0455e69b', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 19:54:44', '2022-04-22 19:54:44', 0);
INSERT INTO `order_item` VALUES ('165062880560152249', '413c41401b7b4ec49e3f60ff8462f234', '8', 'Adidas阿迪达斯2022中性ULTRABOOST 5.0', 'adidas5.jpg', '13', '白色', 1.00000000, 1, 1.00000000, '2022-04-22 20:00:06', '2022-04-22 20:00:06', 0);
INSERT INTO `order_item` VALUES ('165062882594929143', '30ff1fed2b164720862f2f046b714eb6', '9', 'adidas阿迪达斯 男子篮球场下休闲', 'adidas6.jpg', '14', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:00:26', '2022-04-22 20:00:26', 0);
INSERT INTO `order_item` VALUES ('165062884900158735', 'eea37e80c6da48c4bc73e92630d54452', '22', 'adidas跑步鞋5', 'adidas4.jpg', '27', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:00:49', '2022-04-22 20:00:49', 0);
INSERT INTO `order_item` VALUES ('165062922991653285', '8132cf42aa4049b1a9be6c57b8db072e', '9', 'adidas阿迪达斯 男子篮球场下休闲', 'adidas6.jpg', '14', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:07:10', '2022-04-22 20:07:10', 0);
INSERT INTO `order_item` VALUES ('165062925067782185', '8e2ab2198662471197229026df72430f', '6', 'adidas阿迪达斯 男子GAMETALKER', 'adidas3.jpg', '11', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:07:31', '2022-04-22 20:07:31', 0);
INSERT INTO `order_item` VALUES ('165062927263416237', '765bfb57b2204058a9b30ec2262deb9f', '21', 'adidas跑步鞋4', 'adidas4.jpg', '26', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:07:53', '2022-04-22 20:07:53', 0);
INSERT INTO `order_item` VALUES ('165062931881727524', '24ef73125ec245399f8982db7bca332c', '23', 'JORDAN DELTA BREATHE 男子运动鞋', 'aj1.jpg', '28', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:08:39', '2022-04-22 20:08:39', 0);
INSERT INTO `order_item` VALUES ('165062933615879079', 'cf96d4c581224941a4d91abda7da3f5c', '24', 'JORDAN MA2 男子运动鞋 ', 'aj2.jpg', '29', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:08:56', '2022-04-22 20:08:56', 0);
INSERT INTO `order_item` VALUES ('165062940470463117', '8039ffe16e1b44e392f531657e9dffb7', '59', 'FILA斐乐官方运动裤男休闲长裤', 'fl3.jpg', '64', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:10:05', '2022-04-22 20:10:05', 0);
INSERT INTO `order_item` VALUES ('165062942348742351', 'f15438a0f82d4eeba64cb3e54279f26e', '59', 'FILA斐乐官方运动裤男休闲长裤', 'fl3.jpg', '64', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:10:23', '2022-04-22 20:10:23', 0);
INSERT INTO `order_item` VALUES ('165062944669035605', '7d3d0fc9fc5149b3acfde99a4e101f6f', '60', 'FILA斐乐官方运动裤男休闲长裤', 'fl4.jpg', '65', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:10:47', '2022-04-22 20:10:47', 0);
INSERT INTO `order_item` VALUES ('165062946586011441', 'bea47db1079342a7b7405275213b01b9', '62', 'FILA斐乐官方运动裤男休闲长裤', 'fl2.jpg', '67', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:11:06', '2022-04-22 20:11:06', 0);
INSERT INTO `order_item` VALUES ('165062965512089967', '7cd53768094d4aa9802f07d28dbbb03d', '29', 'CONVERSE匡威官方 1970s', 'kw1.jpg', '34', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:14:15', '2022-04-22 20:14:15', 0);
INSERT INTO `order_item` VALUES ('165062967666499772', '9a25973a14b749f5a56dc74697134ee5', '30', '回力帆布鞋男2021秋冬新款', 'hl2.jpg', '35', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:14:37', '2022-04-22 20:14:37', 0);
INSERT INTO `order_item` VALUES ('165062969490493101', 'b07cb1e3e542452da2422eece38071ea', '32', ' 高帮帆布鞋男鞋帆布鞋', 'hl4.jpg', '37', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:14:55', '2022-04-22 20:14:55', 0);
INSERT INTO `order_item` VALUES ('165063178523351725', 'ebd1d5571e3a4adeb8b4a557ccf4571e', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:49:45', '2022-04-22 20:49:45', 0);
INSERT INTO `order_item` VALUES ('165063185466871016', '40da7f988314449cb8516ef5faf772d4', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:50:55', '2022-04-22 20:50:55', 0);
INSERT INTO `order_item` VALUES ('165063190686587416', 'e160eee28a884193938a16404a226d0b', '78', '华亚男士哑铃', 'yl4.jpg', '83', '黑色', 1.00000000, 1, 1.00000000, '2022-04-22 20:51:47', '2022-04-22 20:51:47', 0);
INSERT INTO `order_item` VALUES ('165064824155274742', 'eb0f7a8e8fbb4e839ece9bb62d9156e1', '80', '华亚男士哑铃', 'yl2.jpg', '85', '黑色', 1.00000000, 1, 1.00000000, '2022-04-23 01:24:02', '2022-04-23 01:24:02', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID 同时也是订单编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `untitled` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称（多个产品用,隔开）',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人快照',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号快照',
  `receiver_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址快照',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '订单总价格',
  `actual_amount` int(11) NULL DEFAULT NULL COMMENT '实际支付总价格',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '支付方式 1:微信 2:支付宝',
  `order_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `delivery_flow_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `order_freight` decimal(32, 8) NULL DEFAULT 0.00000000 COMMENT '订单运费 默认可以为零，代表包邮',
  `delete_status` int(11) NULL DEFAULT 0 COMMENT '逻辑删除状态 1: 删除 0:未删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间（成交时间）',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `flish_time` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '取消时间',
  `close_type` int(11) NULL DEFAULT NULL COMMENT '订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('06c5f7cea45945f18f6519b73afb74bf', '1', '耐克 男/女 NIKE FREE METCON 4 ,', '小丽', '13131313311', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 21:19:15', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('10adcff1fa3a44ec9b873edac2788324', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 01:17:41', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('176ca9a176a64a6298c1dbdcf0ebaa29', '1', 'NIKE1\'07 AF1,NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1797.00000000, 1797, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-06 19:05:47', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('180f21ad8709411b934e0781b253268e', '1', '华亚男士哑铃,', '张三', '13030303300', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 14:28:03', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('196493b9636e4680a58c2d1bdb037836', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-10 00:32:53', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('1a3d93296c004985b45aeff1b02ae778', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:34:40', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('20a74ee233114f1f89ad88c27110d1cb', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-12 14:10:31', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('24ef73125ec245399f8982db7bca332c', '1', 'JORDAN DELTA BREATHE 男子运动鞋,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:08:39', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('257de34bc68e48a28c2044db963ebf5b', '14', '华亚男士哑铃,', '王五', '123123', '重庆 重庆 江北区 大道南段111号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 18:06:10', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('30ff1fed2b164720862f2f046b714eb6', '1', 'adidas阿迪达斯 男子篮球场下休闲,', '李四', '12345', '四川 成都 龙泉驿区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:00:26', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('34421d7e37af4a3b859b0970804f62e6', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:28:26', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('3ea9c114330143cd94a52e0d4f3bafa0', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-10 00:39:09', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('3f9105ff6b0b4784b80dd688c82d1b32', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:16:40', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('40da7f988314449cb8516ef5faf772d4', '1', '华亚男士哑铃,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '3', NULL, NULL, NULL, 0, '2022-04-22 20:50:55', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('413c41401b7b4ec49e3f60ff8462f234', '1', 'Adidas阿迪达斯2022中性ULTRABOOST 5.0,', '王五', '123123', '四川 成都 龙泉驿区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:00:06', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('42a0c4810a5e42d19ee370f23091e16d', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:06:49', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('46a264b3bc524484a4a8386a44790df9', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-10 01:03:12', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('48f1daf5f2e64f9687d3e5c6bcfb016d', '1', 'adidas跑步鞋,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 2.00000000, 2, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-18 21:12:29', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('498d2e544e344dceaf21ea62d6c663de', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-12 14:19:58', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('4a61829b73af4ab2a4cda49b527ac9ba', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 01:39:54', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('4cff5f19da644483a1e7163ebf4c8a82', '1', 'NIKE AIR FORCE 1\'07 AF1,', '小丽', '13131313311', '四川省 成都市 龙泉驿区 成洛大道南段', 599.00000000, 599, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 14:19:09', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('51c4eb7604204666869c5c81f246247a', '1', 'NIKE AIR FORCE 1\'07 AF1,NIKE AIR FORCE 1\'07 AF1,华亚男士哑铃,', '张三', '13030303300', '四川省 成都市 龙泉驿区 成洛大道南段', 4.00000000, 4, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-21 21:20:55', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('5e8e691bdd644ae79f67fbcaddbf9d2e', '14', 'NIKE运动鞋,', '李四', '12356777', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 23:17:44', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('646767f4385b49b084a8d1fb72b6b557', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-10 01:09:26', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('64e6ccae58164c5d8575f2236975e76f', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:20:04', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('69a52fd70f7c43db82c319983d53a7b0', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:23:46', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('6c3f5f9e480c4d1199d11299fd11872b', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:24:34', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('710806506c3742ae991ff79999e17f4c', '14', 'NIKE AIR FORCE 1\'07 AF1,', '李四', '12356777', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 00:09:35', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('74dd759557f449a199a1267867402e1a', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 01:41:27', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('765bfb57b2204058a9b30ec2262deb9f', '1', 'adidas跑步鞋4,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:07:53', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('7cd53768094d4aa9802f07d28dbbb03d', '1', 'CONVERSE匡威官方 1970s,', '李四', '12345', '上海 上海 浦江区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:14:15', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('7d3d0fc9fc5149b3acfde99a4e101f6f', '1', 'FILA斐乐官方运动裤男休闲长裤,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:10:47', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('8039ffe16e1b44e392f531657e9dffb7', '1', 'FILA斐乐官方运动裤男休闲长裤,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 20:10:05', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('8132cf42aa4049b1a9be6c57b8db072e', '1', 'adidas阿迪达斯 男子篮球场下休闲,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:07:10', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('81a7da37b2324ca09f94f985315d5900', '1', '华亚男士哑铃,', '小丽', '13131313311', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 21:21:50', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('82ef257dc96e49769aa79ab61a739d77', '14', '华亚男士哑铃,', '王五', '123123', '重庆 重庆 江北区 大道南段111号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 18:05:37', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('83211e44032148febaed1875bb92cdbe', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:29:27', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('87ee630aae1d4b04a76b796f3a4862fe', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 01:57:06', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('8e2ab2198662471197229026df72430f', '1', 'adidas阿迪达斯 男子GAMETALKER,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:07:31', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('98291b0373a547f8be983ecf114b858b', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:10:05', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('986dd35fd30843d0957a85f340bcc1dd', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 01:30:28', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('9870b4b92f0c4c39a2cfc0bca787b3de', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-12 14:23:55', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('9a25973a14b749f5a56dc74697134ee5', '1', '回力帆布鞋男2021秋冬新款,', '李四', '12345', '上海 上海 浦江区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:14:37', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('ac1e85528ab345d6b1d012095efff274', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:08:38', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('b07cb1e3e542452da2422eece38071ea', '1', ' 高帮帆布鞋男鞋帆布鞋,', '李四', '12345', '上海 上海 浦江区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:14:55', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('b94463b1ba6643da907e8ca1ba766fb8', '1', '华亚男士哑铃,', '张三', '13030303300', '四川省 成都市 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-21 21:24:24', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('bea47db1079342a7b7405275213b01b9', '1', 'FILA斐乐官方运动裤男休闲长裤,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:11:06', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('c2ef4fbca3664c3cb0a9f5839c8c2e63', '14', '华亚男士哑铃,', '王五', '123123', '重庆 重庆 江北区 大道南段111号', 1.00000000, 1, 1, '', '3', NULL, NULL, NULL, 0, '2022-04-22 18:03:52', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('c654fc3b06b94cc88466a0d18bc42af6', '14', '华亚男士哑铃,', '哈哈哈', '12312', '北京 北京 朝阳区 冲冲冲', 1.00000000, 1, 1, '', '5', NULL, NULL, NULL, 0, '2022-04-22 18:07:54', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('c90fd5be8f5f4948855b8cdb65a79303', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 00:47:38', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('cafc9f369942417bb9465edc709fe85a', '14', 'NIKE AIR FORCE 1\'07 AF1,', '哈哈哈', '12312', '北京 北京 朝阳区 冲冲冲', 2.00000000, 2, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 18:08:13', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('cf4f9074bbc64062b1dd18a96cbd3384', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 20:52:35', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('cf96d4c581224941a4d91abda7da3f5c', '1', 'JORDAN MA2 男子运动鞋 ,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:08:56', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('d19f0da9ad644dcab79457f54cee2c55', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:27:04', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('d57b4eda23e24c7e9c130c640762b835', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-12 14:37:03', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('d75db99053d64e2b809a9530ba2be82a', '14', '华亚男士哑铃,', '王五', '123123', '重庆 重庆 江北区 大道南段111号', 1.00000000, 1, 1, '', '3', NULL, NULL, NULL, 0, '2022-04-22 18:02:38', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('d790beadb1d2403681dc98fb1b831f83', '1', 'adidas跑步鞋3,NIKE REVOLUTION5 跑步鞋,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 600.00000000, 600, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-20 17:47:34', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('e160eee28a884193938a16404a226d0b', '1', '华亚男士哑铃,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '3', NULL, NULL, NULL, 0, '2022-04-22 20:51:47', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('ea0faf1a4eb14f97905396e65274d636', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-10 00:27:58', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('eb0f7a8e8fbb4e839ece9bb62d9156e1', '14', '华亚男士哑铃,', '李四', '12356777', '四川 成都 龙泉驿区 成洛大道', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-23 01:24:02', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('ebd1d5571e3a4adeb8b4a557ccf4571e', '1', '华亚男士哑铃,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '2', NULL, NULL, NULL, 0, '2022-04-22 20:49:45', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('ee1cdeda3de84ab7b718a1cb5b848704', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-10 20:56:33', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('eea37e80c6da48c4bc73e92630d54452', '1', 'adidas跑步鞋5,', '小丽', '13131313311', '四川 成都 龙泉驿区 成洛大道南段', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:00:49', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('f15438a0f82d4eeba64cb3e54279f26e', '1', 'FILA斐乐官方运动裤男休闲长裤,', '王五', '123123', '贵州 大道 天府 区 成洛大道', 1.00000000, 1, 1, '', '4', NULL, NULL, NULL, 0, '2022-04-22 20:10:23', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `orders` VALUES ('f28e9e8c385e4f199dc16d718f94da1b', '1', 'NIKE AIR FORCE 1\'07 AF1,', '张三', '13030303300', '湖北 武汉 江夏区 光谷大道77号', 1.00000000, 1, 1, '', '6', NULL, NULL, NULL, 0, '2022-04-10 21:13:43', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('fc4c1b67e1d84557a0eab7bb0455e69b', '14', '华亚男士哑铃,', '哈哈哈', '12312', '北京 北京 朝阳区 冲冲冲', 1.00000000, 1, 1, '', '3', NULL, NULL, NULL, 0, '2022-04-22 19:54:44', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主键id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称 商品名称',
  `category_id` int(11) NOT NULL COMMENT '分类外键id 分类id',
  `root_category_id` int(11) NOT NULL COMMENT '一级分类外键id 一级分类id，用于优化查询',
  `sold_num` int(11) NOT NULL COMMENT '销量 累计销售',
  `product_status` int(11) NOT NULL COMMENT '默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品内容 商品内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'NIKE AIR FORCE 1\'07 AF1', 36, 1, 233, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/><img src=\"static/pimgs/af1_desc2.jpg\"/><img src=\"static/pimgs/af1_desc3.jpg\"/><img src=\"static/pimgs/af1_desc4.jpg\"/><img src=\"static/pimgs/af1_desc5.jpg\"/><img src=\"static/pimgs/af1_desc6.jpg\"/><img src=\"static/pimgs/af1_desc7.jpg\"/>', '2022-04-30 19:55:38', '2022-04-30 19:55:51');
INSERT INTO `product` VALUES ('10', '耐克 男子运动鞋 NIKE KILLSHOT 2', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:46:49', '2022-04-19 14:46:49');
INSERT INTO `product` VALUES ('11', '耐克 男/女 NIKE FREE METCON 4 ', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:47:06', '2022-04-19 14:47:06');
INSERT INTO `product` VALUES ('12', 'NIKE运动鞋', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:14:51', '2022-04-19 15:14:51');
INSERT INTO `product` VALUES ('13', 'NIKE运动鞋2', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:14:57', '2022-04-19 15:14:57');
INSERT INTO `product` VALUES ('14', 'NIKE运动鞋3', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:15:01', '2022-04-19 15:15:01');
INSERT INTO `product` VALUES ('15', 'NIKE运动鞋4', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:15:05', '2022-04-19 15:15:05');
INSERT INTO `product` VALUES ('16', 'NIKE运动鞋5', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:15:08', '2022-04-19 15:15:08');
INSERT INTO `product` VALUES ('17', 'NIKE运动鞋6', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:15:11', '2022-04-19 15:15:11');
INSERT INTO `product` VALUES ('18', 'adidas跑步鞋1', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:15:58', '2022-04-19 15:15:58');
INSERT INTO `product` VALUES ('19', 'adidas跑步鞋2', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:16:03', '2022-04-19 15:16:03');
INSERT INTO `product` VALUES ('2', 'NIKE WEARALLDAY 运动鞋 CJ1682', 36, 1, 201, 1, '商品说明', '2022-03-19 14:24:59', '2022-03-19 14:25:02');
INSERT INTO `product` VALUES ('20', 'adidas跑步鞋3', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:16:06', '2022-04-19 15:16:06');
INSERT INTO `product` VALUES ('21', 'adidas跑步鞋4', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:16:10', '2022-04-19 15:16:10');
INSERT INTO `product` VALUES ('22', 'adidas跑步鞋5', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 15:16:13', '2022-04-19 15:16:13');
INSERT INTO `product` VALUES ('23', 'JORDAN DELTA BREATHE 男子运动鞋', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:24:19', '2022-04-19 19:24:19');
INSERT INTO `product` VALUES ('24', 'JORDAN MA2 男子运动鞋 ', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:26:47', '2022-04-19 19:26:47');
INSERT INTO `product` VALUES ('25', 'JORDAN 6 RINGS (GS) 运动鞋 ', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:27:07', '2022-04-19 19:27:07');
INSERT INTO `product` VALUES ('26', 'AIR JORDAN 1 NOVA XX AJ1 ', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:29:48', '2022-04-19 19:29:48');
INSERT INTO `product` VALUES ('27', 'AIR JORDAN 1 MID SE AJ1 ', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:30:37', '2022-04-19 19:30:37');
INSERT INTO `product` VALUES ('28', '经典帆布鞋 ', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:42:42', '2022-04-19 19:42:42');
INSERT INTO `product` VALUES ('29', 'CONVERSE匡威官方 1970s', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:44:48', '2022-04-19 19:44:48');
INSERT INTO `product` VALUES ('3', 'NIKE REVOLUTION5 跑步鞋', 38, 1, 333, 1, '商品说明', '2022-03-19 14:27:13', '2022-03-19 14:27:16');
INSERT INTO `product` VALUES ('30', '回力帆布鞋男2021秋冬新款', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:46:55', '2022-04-19 19:46:55');
INSERT INTO `product` VALUES ('31', ' 高帮帆布鞋男鞋春夏季', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:47:35', '2022-04-19 19:47:35');
INSERT INTO `product` VALUES ('32', ' 高帮帆布鞋男鞋帆布鞋', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:48:18', '2022-04-19 19:48:18');
INSERT INTO `product` VALUES ('33', '夏季新款韩版德训鞋学生低帮', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:49:06', '2022-04-19 19:49:06');
INSERT INTO `product` VALUES ('34', '官方帆布鞋男鞋夏季平底春款小白鞋', 37, 1, 300, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:51:23', '2022-04-19 19:51:23');
INSERT INTO `product` VALUES ('35', '男女同款复古高帮帆布鞋 167862C 紫色', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:53:00', '2022-04-19 19:53:00');
INSERT INTO `product` VALUES ('36', 'CONVERSE匡威官方 Run Star Hike', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:53:24', '2022-04-19 19:53:24');
INSERT INTO `product` VALUES ('37', 'CONVERSE匡威官方 All Star Move', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:53:46', '2022-04-19 19:53:46');
INSERT INTO `product` VALUES ('38', '匡威女鞋男鞋帆布鞋Run Star Hike', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:54:20', '2022-04-19 19:54:20');
INSERT INTO `product` VALUES ('39', 'CONVERSE\\/匡威2020年中性', 37, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:54:53', '2022-04-19 19:54:53');
INSERT INTO `product` VALUES ('4', 'adidas跑步鞋', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:36:16', '2022-04-19 14:36:16');
INSERT INTO `product` VALUES ('40', 'LEBRON XIX EP 篮球鞋', 38, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 19:56:53', '2022-04-19 19:56:53');
INSERT INTO `product` VALUES ('41', 'GIANNIS IMMORTALITY EP 运动鞋', 38, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:02:47', '2022-04-19 20:02:47');
INSERT INTO `product` VALUES ('42', '耐克2022春季男鞋欧文8', 38, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:03:08', '2022-04-19 20:03:08');
INSERT INTO `product` VALUES ('43', 'Nike耐克2021年男子JORDAN BREATHE', 38, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:03:46', '2022-04-19 20:03:46');
INSERT INTO `product` VALUES ('44', 'Nike耐克男鞋新款AIR ZOOM G.T. JUMP', 38, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:04:01', '2022-04-19 20:04:01');
INSERT INTO `product` VALUES ('45', '安踏运动套装男装', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:12:07', '2022-04-19 20:12:07');
INSERT INTO `product` VALUES ('46', '安踏运动套装男运动服2022春季新款', 54, 2, 20, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:17:07', '2022-04-19 20:17:07');
INSERT INTO `product` VALUES ('47', '安踏运动套装男装春季款透气', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:17:49', '2022-04-19 20:17:49');
INSERT INTO `product` VALUES ('48', '安踏运动套装男装春季款透气2', 54, 2, 3, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:18:04', '2022-04-19 20:18:04');
INSERT INTO `product` VALUES ('49', '安踏运动套装男装春季款透气2', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:18:10', '2022-04-19 20:18:10');
INSERT INTO `product` VALUES ('5', 'adidas阿迪达斯 男子BREAKNET PLUS', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:39:19', '2022-04-19 14:39:19');
INSERT INTO `product` VALUES ('50', '安踏运动套装男装春季款透气2', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:18:12', '2022-04-19 20:18:12');
INSERT INTO `product` VALUES ('51', '李宁运动套装男t恤短裤', 54, 2, 50, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:17', '2022-04-19 20:20:17');
INSERT INTO `product` VALUES ('52', '李宁运动套装男t恤短裤', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:18', '2022-04-19 20:20:18');
INSERT INTO `product` VALUES ('53', '李宁运动套装男t恤短裤', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:19', '2022-04-19 20:20:19');
INSERT INTO `product` VALUES ('54', '李宁运动套装男t恤短裤', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:20', '2022-04-19 20:20:20');
INSERT INTO `product` VALUES ('55', '李宁运动套装男t恤短裤', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:21', '2022-04-19 20:20:21');
INSERT INTO `product` VALUES ('56', '李宁运动套装男t恤短裤', 54, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:20:22', '2022-04-19 20:20:22');
INSERT INTO `product` VALUES ('57', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:12', '2022-04-19 20:31:12');
INSERT INTO `product` VALUES ('58', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:13', '2022-04-19 20:31:13');
INSERT INTO `product` VALUES ('59', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 6, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:14', '2022-04-19 20:31:14');
INSERT INTO `product` VALUES ('6', 'adidas阿迪达斯 男子GAMETALKER', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:41:06', '2022-04-19 14:41:06');
INSERT INTO `product` VALUES ('60', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product` VALUES ('61', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 300, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product` VALUES ('62', 'FILA斐乐官方运动裤男休闲长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:31:16', '2022-04-19 20:31:16');
INSERT INTO `product` VALUES ('63', 'NIKE耐克短裤运动短裤', 53, 2, 5, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:06', '2022-04-19 20:32:06');
INSERT INTO `product` VALUES ('64', '耐克 男子梭织跑步长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:21', '2022-04-19 20:32:21');
INSERT INTO `product` VALUES ('65', '耐克 男子梭织跑步长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:23', '2022-04-19 20:32:23');
INSERT INTO `product` VALUES ('66', '耐克 男子梭织跑步长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:24', '2022-04-19 20:32:24');
INSERT INTO `product` VALUES ('67', '耐克 男子梭织跑步长裤', 53, 2, 4, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:25', '2022-04-19 20:32:25');
INSERT INTO `product` VALUES ('68', '耐克 男子梭织跑步长裤', 53, 2, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:32:26', '2022-04-19 20:32:26');
INSERT INTO `product` VALUES ('69', '亿健跑步机 家用智能', 75, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:06', '2022-04-19 20:36:06');
INSERT INTO `product` VALUES ('7', 'Adidas阿迪达斯2021男子ALL COURT MID', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:41:53', '2022-04-19 14:41:53');
INSERT INTO `product` VALUES ('70', '亿健跑步机家用JD618', 75, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:27', '2022-04-19 20:36:27');
INSERT INTO `product` VALUES ('71', '亿健跑步机家用JD618', 75, 3, 3, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product` VALUES ('72', '亿健跑步机家用JD618', 75, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product` VALUES ('73', '亿健跑步机家用JD618', 75, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product` VALUES ('74', '亿健跑步机家用JD618', 75, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product` VALUES ('75', '华亚男士哑铃', 78, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:28', '2022-04-19 20:46:28');
INSERT INTO `product` VALUES ('76', '华亚男士哑铃', 78, 3, 3, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:32', '2022-04-19 20:46:32');
INSERT INTO `product` VALUES ('77', '华亚男士哑铃', 78, 3, 20, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:33', '2022-04-19 20:46:33');
INSERT INTO `product` VALUES ('78', '华亚男士哑铃', 78, 3, 50, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product` VALUES ('79', '华亚男士哑铃', 78, 3, 100, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product` VALUES ('8', 'Adidas阿迪达斯2022中性ULTRABOOST 5.0', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:42:10', '2022-04-19 14:42:10');
INSERT INTO `product` VALUES ('80', '华亚男士哑铃', 78, 3, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 20:46:35', '2022-04-19 20:46:35');
INSERT INTO `product` VALUES ('9', 'adidas阿迪达斯 男子篮球场下休闲', 36, 1, 1, 1, '<img src=\"static/pimgs/af1_desc1.jpg\"/>', '2022-04-19 14:45:37', '2022-04-19 14:45:37');

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `comm_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单项(商品快照)ID 可为空',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户id 用户名须脱敏',
  `is_anonymous` int(11) NULL DEFAULT NULL COMMENT '是否匿名（1:是，0:否）',
  `comm_type` int(11) NULL DEFAULT NULL COMMENT '评价类型（1好评，0中评，-1差评）',
  `comm_content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `comm_imgs` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价晒图(JSON {img1:url1,img2:url2}  )',
  `sepc_name` datetime(0) NULL DEFAULT NULL COMMENT '评价时间 可为空',
  `reply_status` int(11) NULL DEFAULT NULL COMMENT '是否回复（0:未回复，1:已回复）',
  `reply_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `is_show` int(11) NULL DEFAULT NULL COMMENT '是否显示（1:是，0:否）',
  PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO `product_comments` VALUES ('1', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000001', '4', 1, 1, '我买这不是来穿的，就是玩儿', '{}', '2022-03-29 14:51:10', 1, '感谢您的光临，希望你下次再来', '2022-04-21 20:08:03', 1);
INSERT INTO `product_comments` VALUES ('10', '1', 'NIKE AIR FORCE 1\'07 AF1', '164952197321043848', '1', 1, 0, '假货！！！不要买', NULL, '2022-04-21 14:23:34', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('11', '1', 'NIKE AIR FORCE 1\'07 AF1', '164952379195826313', '1', 1, 1, '穿着很舒服', NULL, '2022-04-21 14:23:49', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('12', '26', 'adidas跑步鞋', '165028754894888211', '1', 1, 1, '还可以', NULL, '2022-04-21 14:24:11', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('13', '1', 'NIKE AIR FORCE 1\'07 AF1', '164974439818370247', '1', 1, 1, '非常喜欢', NULL, '2022-04-21 14:24:51', 1, '谢谢你的选择', '2022-04-21 20:08:33', NULL);
INSERT INTO `product_comments` VALUES ('14', '1', 'NIKE AIR FORCE 1\'07 AF1', '165052194929132410', '1', 1, 1, '喜欢', NULL, '2022-04-21 14:25:16', 1, '谢谢宁的光临', '2022-04-21 19:58:02', NULL);
INSERT INTO `product_comments` VALUES ('15', '80', '华亚男士哑铃', '165062196998669151', '14', 1, 1, '很喜欢', NULL, '2022-04-22 19:56:18', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('16', '78', '华亚男士哑铃', '165062193656027036', '14', 0, 1, '喜欢', NULL, '2022-04-22 19:56:34', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('17', '1', 'NIKE AIR FORCE 1\'07 AF1', '165055737488760262', '14', 1, 1, '买了天天跑步', NULL, '2022-04-22 19:57:10', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('18', '12', 'NIKE运动鞋', '165055426358446681', '14', 1, 1, '很喜欢', NULL, '2022-04-22 19:57:22', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('19', '78', '华亚男士哑铃', '165062207435932774', '14', 1, 0, '很不错', NULL, '2022-04-22 19:57:36', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('2', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000002', '5', 0, 1, 'nice', '{img1:“mmxt2.png”}', '2022-03-29 14:53:20', 1, '你好我也好', '2021-04-27 14:53:37', 1);
INSERT INTO `product_comments` VALUES ('21', '80', '华亚男士哑铃', '165052248318768816', '1', 1, -1, '不行，假的', NULL, '2022-04-22 20:47:19', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('22', '23', 'JORDAN DELTA BREATHE 男子运动鞋', '165062931881727524', '1', 1, 1, '不错', NULL, '2022-04-22 20:47:35', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('23', '9', 'adidas阿迪达斯 男子篮球场下休闲', '165062882594929143', '1', NULL, 1, '不错', NULL, '2022-04-22 20:47:43', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('24', '8', 'adidas阿迪达斯2022中性ULTRABOOST 5.0', '165062880560152249', '1', 1, 1, '不错', NULL, '2022-04-22 20:47:55', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('25', '1', 'NIKE AIR FORCE 1\'07 AF1', '164952416626793363', '1', NULL, -1, '与实物不符', NULL, '2022-04-22 20:48:07', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('26', '59', 'FILA斐乐官方运动裤男休闲长裤', '165062940470463117', '1', 1, 1, '不错，紧身', NULL, '2022-04-22 20:48:21', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('27', '29', 'CONVERSE匡威官方 1970s', '165062965512089967', '1', 1, 1, '不错', NULL, '2022-04-22 20:48:29', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('28', '21', 'adidas跑步鞋4', '165062927263416237', '1', 1, 1, '很好', NULL, '2022-04-22 20:48:38', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('29', '78', '华亚男士哑铃', '165054730952236686', '1', 1, 1, '不错', NULL, '2022-04-22 20:48:47', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('30', '60', 'FILA斐乐官方运动裤男休闲长裤', '165062944669035605', '1', 1, 1, '很好', NULL, '2022-04-22 20:48:56', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('31', '1', 'NIKE AIR FORCE 1\'07 AF1', '164974463507062790', '1', 1, 1, '非常不错', NULL, '2022-04-22 20:49:04', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('32', '80', '华亚男士哑铃', '165054746439632315', '1', 1, 1, '非常不错', NULL, '2022-04-22 20:49:13', 0, NULL, NULL, NULL);
INSERT INTO `product_comments` VALUES ('4', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000004', '2', 1, 1, '评价内容3', '{}', '2022-03-29 09:37:28', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('5', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000005', '2', 1, 0, '评价内容5', '{}', '2022-03-29 09:38:13', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('6', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000006', '3', 1, 0, '评价内容6', '{}', '2022-03-29 09:39:16', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('7', '1', 'NIKE AIR FORCE 1\'07 AF1', '10000007', '4', 0, -1, '评价内容7', '{}', '2022-03-29 09:40:01', 0, NULL, NULL, 1);
INSERT INTO `product_comments` VALUES ('9', '1', 'NIKE AIR FORCE 1\'07 AF1', '164952234909676019', '1', 1, 1, '不错不错', NULL, '2022-04-21 01:22:45', 1, '谢谢亲亲对我们的大力支持', NULL, NULL);

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片主键',
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品外键id 商品外键id',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址 图片地址',
  `sort` int(11) NOT NULL COMMENT '顺序 图片顺序，从小到大',
  `is_main` int(11) NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('1', '1', 'af1_1.jpg', 1, 1, '2022-03-18 14:21:03', '2022-03-18 14:21:05');
INSERT INTO `product_img` VALUES ('10', '7', 'adidas4.jpg', 1, 1, '2022-04-19 14:41:53', '2022-04-19 14:41:53');
INSERT INTO `product_img` VALUES ('11', '8', 'adidas5.jpg', 1, 1, '2022-04-19 14:42:10', '2022-04-19 14:42:10');
INSERT INTO `product_img` VALUES ('12', '9', 'adidas6.jpg', 1, 1, '2022-04-19 14:45:37', '2022-04-19 14:45:37');
INSERT INTO `product_img` VALUES ('13', '10', 'nike1.jpg', 1, 1, '2022-04-19 14:46:49', '2022-04-19 14:46:49');
INSERT INTO `product_img` VALUES ('14', '11', 'nike2.jpg', 1, 1, '2022-04-19 14:47:06', '2022-04-19 14:47:06');
INSERT INTO `product_img` VALUES ('15', '12', 'nike3.jpg', 1, 1, '2022-04-19 15:14:51', '2022-04-19 15:14:51');
INSERT INTO `product_img` VALUES ('16', '13', 'nike4.jpg', 1, 1, '2022-04-19 15:14:57', '2022-04-19 15:14:57');
INSERT INTO `product_img` VALUES ('17', '14', 'nike5.jpg', 1, 1, '2022-04-19 15:15:01', '2022-04-19 15:15:01');
INSERT INTO `product_img` VALUES ('18', '15', 'nike6.jpg', 1, 1, '2022-04-19 15:15:05', '2022-04-19 15:15:05');
INSERT INTO `product_img` VALUES ('19', '16', 'nike4.jpg', 1, 1, '2022-04-19 15:15:08', '2022-04-19 15:15:08');
INSERT INTO `product_img` VALUES ('2', '1', 'af1_2.jpg', 2, 0, '2022-03-18 14:21:40', '2022-03-18 14:21:43');
INSERT INTO `product_img` VALUES ('20', '17', 'nike4.jpg', 1, 1, '2022-04-19 15:15:11', '2022-04-19 15:15:11');
INSERT INTO `product_img` VALUES ('21', '18', 'adidas4.jpg', 1, 1, '2022-04-19 15:15:58', '2022-04-19 15:15:58');
INSERT INTO `product_img` VALUES ('22', '19', 'adidas4.jpg', 1, 1, '2022-04-19 15:16:03', '2022-04-19 15:16:03');
INSERT INTO `product_img` VALUES ('23', '20', 'adidas4.jpg', 1, 1, '2022-04-19 15:16:06', '2022-04-19 15:16:06');
INSERT INTO `product_img` VALUES ('24', '21', 'adidas4.jpg', 1, 1, '2022-04-19 15:16:10', '2022-04-19 15:16:10');
INSERT INTO `product_img` VALUES ('25', '22', 'adidas4.jpg', 1, 1, '2022-04-19 15:16:13', '2022-04-19 15:16:13');
INSERT INTO `product_img` VALUES ('26', '23', 'aj1.jpg', 1, 1, '2022-04-19 19:24:19', '2022-04-19 19:24:19');
INSERT INTO `product_img` VALUES ('27', '24', 'aj2.jpg', 1, 1, '2022-04-19 19:26:47', '2022-04-19 19:26:47');
INSERT INTO `product_img` VALUES ('28', '25', 'aj3.jpg', 1, 1, '2022-04-19 19:27:07', '2022-04-19 19:27:07');
INSERT INTO `product_img` VALUES ('29', '26', 'aj4.jpg', 1, 1, '2022-04-19 19:29:48', '2022-04-19 19:29:48');
INSERT INTO `product_img` VALUES ('3', '2', 'WEARALLDAY_1.jpg', 1, 1, '2022-03-18 14:33:09', '2022-03-18 14:33:13');
INSERT INTO `product_img` VALUES ('30', '27', 'aj5.jpg', 1, 1, '2022-04-19 19:30:37', '2022-04-19 19:30:37');
INSERT INTO `product_img` VALUES ('31', '28', 'hl1.jpg', 1, 1, '2022-04-19 19:42:42', '2022-04-19 19:42:42');
INSERT INTO `product_img` VALUES ('32', '29', 'kw1.jpg', 1, 1, '2022-04-19 19:44:48', '2022-04-19 19:44:48');
INSERT INTO `product_img` VALUES ('33', '30', 'hl2.jpg', 1, 1, '2022-04-19 19:46:55', '2022-04-19 19:46:55');
INSERT INTO `product_img` VALUES ('34', '31', 'hl3.jpg', 1, 1, '2022-04-19 19:47:35', '2022-04-19 19:47:35');
INSERT INTO `product_img` VALUES ('35', '32', 'hl4.jpg', 1, 1, '2022-04-19 19:48:18', '2022-04-19 19:48:18');
INSERT INTO `product_img` VALUES ('36', '33', 'hl5.jpg', 1, 1, '2022-04-19 19:49:06', '2022-04-19 19:49:06');
INSERT INTO `product_img` VALUES ('37', '34', 'hl1.jpg', 1, 1, '2022-04-19 19:51:23', '2022-04-19 19:51:23');
INSERT INTO `product_img` VALUES ('38', '35', 'kw2.jpg', 1, 1, '2022-04-19 19:53:00', '2022-04-19 19:53:00');
INSERT INTO `product_img` VALUES ('39', '36', 'kw3.jpg', 1, 1, '2022-04-19 19:53:24', '2022-04-19 19:53:24');
INSERT INTO `product_img` VALUES ('4', '2', 'WEARALLDAY_2.jpg', 2, 0, '2022-03-18 14:33:36', '2022-03-18 14:33:38');
INSERT INTO `product_img` VALUES ('40', '37', 'kw4.jpg', 1, 1, '2022-04-19 19:53:46', '2022-04-19 19:53:46');
INSERT INTO `product_img` VALUES ('41', '38', 'kw1.jpg', 1, 1, '2022-04-19 19:54:20', '2022-04-19 19:54:20');
INSERT INTO `product_img` VALUES ('42', '39', 'kw2.jpg', 1, 1, '2022-04-19 19:54:53', '2022-04-19 19:54:53');
INSERT INTO `product_img` VALUES ('43', '40', 'qx1.jpg', 1, 1, '2022-04-19 19:56:53', '2022-04-19 19:56:53');
INSERT INTO `product_img` VALUES ('44', '41', 'qx2.jpg', 1, 1, '2022-04-19 20:02:47', '2022-04-19 20:02:47');
INSERT INTO `product_img` VALUES ('45', '42', 'qx3.jpg', 1, 1, '2022-04-19 20:03:08', '2022-04-19 20:03:08');
INSERT INTO `product_img` VALUES ('46', '43', 'qx4.jpg', 1, 1, '2022-04-19 20:03:46', '2022-04-19 20:03:46');
INSERT INTO `product_img` VALUES ('47', '44', 'qx1.jpg', 1, 1, '2022-04-19 20:04:01', '2022-04-19 20:04:01');
INSERT INTO `product_img` VALUES ('48', '45', 'tz1.jpg', 1, 1, '2022-04-19 20:12:07', '2022-04-19 20:12:07');
INSERT INTO `product_img` VALUES ('49', '46', 'tz2.jpg', 1, 1, '2022-04-19 20:17:07', '2022-04-19 20:17:07');
INSERT INTO `product_img` VALUES ('5', '3', 'REVOLUTION5_1.jpg', 1, 1, '2022-03-18 14:34:16', '2022-03-18 14:34:17');
INSERT INTO `product_img` VALUES ('50', '47', 'tz3.jpg', 1, 1, '2022-04-19 20:17:49', '2022-04-19 20:17:49');
INSERT INTO `product_img` VALUES ('51', '48', 'tz1.jpg', 1, 1, '2022-04-19 20:18:04', '2022-04-19 20:18:04');
INSERT INTO `product_img` VALUES ('52', '49', 'tz2.jpg', 1, 1, '2022-04-19 20:18:10', '2022-04-19 20:18:10');
INSERT INTO `product_img` VALUES ('53', '50', 'tz3.jpg', 1, 1, '2022-04-19 20:18:12', '2022-04-19 20:18:12');
INSERT INTO `product_img` VALUES ('54', '51', 'tz4.jpg', 1, 1, '2022-04-19 20:20:17', '2022-04-19 20:20:17');
INSERT INTO `product_img` VALUES ('55', '52', 'tz5.jpg', 1, 1, '2022-04-19 20:20:18', '2022-04-19 20:20:18');
INSERT INTO `product_img` VALUES ('56', '53', 'tz6.jpg', 1, 1, '2022-04-19 20:20:19', '2022-04-19 20:20:19');
INSERT INTO `product_img` VALUES ('57', '54', 'tz4.jpg', 1, 1, '2022-04-19 20:20:20', '2022-04-19 20:20:20');
INSERT INTO `product_img` VALUES ('58', '55', 'tz5.jpg', 1, 1, '2022-04-19 20:20:21', '2022-04-19 20:20:21');
INSERT INTO `product_img` VALUES ('59', '56', 'tz6.jpg', 1, 1, '2022-04-19 20:20:22', '2022-04-19 20:20:22');
INSERT INTO `product_img` VALUES ('6', '3', 'REVOLUTION5_2.jpg', 2, 0, '2022-03-18 14:34:39', '2022-03-18 14:34:40');
INSERT INTO `product_img` VALUES ('60', '57', 'fl1.jpg', 1, 1, '2022-04-19 20:31:12', '2022-04-19 20:31:12');
INSERT INTO `product_img` VALUES ('61', '58', 'fl2.jpg', 1, 1, '2022-04-19 20:31:13', '2022-04-19 20:31:13');
INSERT INTO `product_img` VALUES ('62', '59', 'fl3.jpg', 1, 1, '2022-04-19 20:31:14', '2022-04-19 20:31:14');
INSERT INTO `product_img` VALUES ('63', '60', 'fl4.jpg', 1, 1, '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product_img` VALUES ('64', '61', 'fl1.jpg', 1, 1, '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product_img` VALUES ('65', '62', 'fl2.jpg', 1, 1, '2022-04-19 20:31:16', '2022-04-19 20:31:16');
INSERT INTO `product_img` VALUES ('66', '63', 'nikekz1.jpg', 1, 1, '2022-04-19 20:32:06', '2022-04-19 20:32:06');
INSERT INTO `product_img` VALUES ('67', '64', 'nikekz2.jpg', 1, 1, '2022-04-19 20:32:21', '2022-04-19 20:32:21');
INSERT INTO `product_img` VALUES ('68', '65', 'nikekz3.png', 1, 1, '2022-04-19 20:32:23', '2022-04-19 20:32:23');
INSERT INTO `product_img` VALUES ('69', '66', 'nikekz2.jpg', 1, 1, '2022-04-19 20:32:24', '2022-04-19 20:32:24');
INSERT INTO `product_img` VALUES ('7', '4', 'adidas1.jpg', 1, 1, '2022-04-19 14:36:16', '2022-04-19 14:36:16');
INSERT INTO `product_img` VALUES ('70', '67', 'nikekz2.jpg', 1, 1, '2022-04-19 20:32:25', '2022-04-19 20:32:25');
INSERT INTO `product_img` VALUES ('71', '68', 'nikekz2.jpg', 1, 1, '2022-04-19 20:32:26', '2022-04-19 20:32:26');
INSERT INTO `product_img` VALUES ('72', '69', 'pbj1.jpg', 1, 1, '2022-04-19 20:36:06', '2022-04-19 20:36:06');
INSERT INTO `product_img` VALUES ('73', '70', 'pbj2.jpg', 1, 1, '2022-04-19 20:36:27', '2022-04-19 20:36:27');
INSERT INTO `product_img` VALUES ('74', '71', 'pbj3.jpg', 1, 1, '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product_img` VALUES ('75', '72', 'pbj1.jpg', 1, 1, '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product_img` VALUES ('76', '73', 'pbj2.jpg', 1, 1, '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product_img` VALUES ('77', '74', 'pbj3.jpg', 1, 1, '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product_img` VALUES ('78', '75', 'yl1.jpg', 1, 1, '2022-04-19 20:46:28', '2022-04-19 20:46:28');
INSERT INTO `product_img` VALUES ('79', '76', 'yl2.jpg', 1, 1, '2022-04-19 20:46:32', '2022-04-19 20:46:32');
INSERT INTO `product_img` VALUES ('8', '5', 'adidas2.jpg', 1, 1, '2022-04-19 14:39:19', '2022-04-19 14:39:19');
INSERT INTO `product_img` VALUES ('80', '77', 'yl3.jpg', 1, 1, '2022-04-19 20:46:33', '2022-04-19 20:46:33');
INSERT INTO `product_img` VALUES ('81', '78', 'yl4.jpg', 1, 1, '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product_img` VALUES ('82', '79', 'yl3.jpg', 1, 1, '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product_img` VALUES ('83', '80', 'yl2.jpg', 1, 1, '2022-04-19 20:46:35', '2022-04-19 20:46:35');
INSERT INTO `product_img` VALUES ('9', '6', 'adidas3.jpg', 1, 1, '2022-04-19 14:41:06', '2022-04-19 14:41:06');

-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params`  (
  `param_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品参数id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产地 产地，例：中国江苏',
  `clog` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '闭合方式',
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名 品牌名，例：nike',
  `factory_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂名 生产厂名，例：大灰狼工厂',
  `factory_address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产厂址 生产厂址，例：大灰狼生产基地',
  `function` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能',
  `weight` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品毛重 例：1.0kg',
  `details` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品细节',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`param_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参数 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_params
-- ----------------------------
INSERT INTO `product_params` VALUES ('1', '1', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮(帮高小于10cm)', '2022-03-29 11:53:20', '2022-03-29 11:53:35');
INSERT INTO `product_params` VALUES ('10', '10', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:46:49', '2022-04-19 14:46:49');
INSERT INTO `product_params` VALUES ('11', '11', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:47:06', '2022-04-19 14:47:06');
INSERT INTO `product_params` VALUES ('12', '12', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:14:51', '2022-04-19 15:14:51');
INSERT INTO `product_params` VALUES ('13', '13', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:14:57', '2022-04-19 15:14:57');
INSERT INTO `product_params` VALUES ('14', '14', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:15:01', '2022-04-19 15:15:01');
INSERT INTO `product_params` VALUES ('15', '15', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:15:05', '2022-04-19 15:15:05');
INSERT INTO `product_params` VALUES ('16', '16', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:15:08', '2022-04-19 15:15:08');
INSERT INTO `product_params` VALUES ('17', '17', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:15:11', '2022-04-19 15:15:11');
INSERT INTO `product_params` VALUES ('18', '18', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:15:58', '2022-04-19 15:15:58');
INSERT INTO `product_params` VALUES ('19', '19', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:16:03', '2022-04-19 15:16:03');
INSERT INTO `product_params` VALUES ('2', '2', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮(帮高小于10cm)', '2022-03-29 11:53:20', '2022-03-29 11:53:35');
INSERT INTO `product_params` VALUES ('20', '20', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:16:06', '2022-04-19 15:16:06');
INSERT INTO `product_params` VALUES ('21', '21', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:16:10', '2022-04-19 15:16:10');
INSERT INTO `product_params` VALUES ('22', '22', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 15:16:13', '2022-04-19 15:16:13');
INSERT INTO `product_params` VALUES ('23', '23', '中国四川成都', '系带', 'Jordan', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:24:19', '2022-04-19 19:24:19');
INSERT INTO `product_params` VALUES ('24', '24', '中国四川成都', '系带', 'Jordan', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:26:47', '2022-04-19 19:26:47');
INSERT INTO `product_params` VALUES ('25', '25', '中国四川成都', '系带', 'Jordan', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:27:07', '2022-04-19 19:27:07');
INSERT INTO `product_params` VALUES ('26', '26', '中国四川成都', '系带', 'Jordan', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:29:48', '2022-04-19 19:29:48');
INSERT INTO `product_params` VALUES ('27', '27', '中国四川成都', '系带', 'Jordan', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:30:37', '2022-04-19 19:30:37');
INSERT INTO `product_params` VALUES ('28', '28', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:42:42', '2022-04-19 19:42:42');
INSERT INTO `product_params` VALUES ('29', '29', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:44:48', '2022-04-19 19:44:48');
INSERT INTO `product_params` VALUES ('3', '3', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮(帮高小于10cm)', '2022-03-29 11:53:20', '2022-03-29 11:53:35');
INSERT INTO `product_params` VALUES ('30', '30', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:46:55', '2022-04-19 19:46:55');
INSERT INTO `product_params` VALUES ('31', '31', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:47:35', '2022-04-19 19:47:35');
INSERT INTO `product_params` VALUES ('32', '32', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:48:18', '2022-04-19 19:48:18');
INSERT INTO `product_params` VALUES ('33', '33', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:49:06', '2022-04-19 19:49:06');
INSERT INTO `product_params` VALUES ('34', '34', '中国四川成都', '系带', '回力', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:51:23', '2022-04-19 19:51:23');
INSERT INTO `product_params` VALUES ('35', '35', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:53:00', '2022-04-19 19:53:00');
INSERT INTO `product_params` VALUES ('36', '36', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:53:24', '2022-04-19 19:53:24');
INSERT INTO `product_params` VALUES ('37', '37', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:53:46', '2022-04-19 19:53:46');
INSERT INTO `product_params` VALUES ('38', '38', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:54:20', '2022-04-19 19:54:20');
INSERT INTO `product_params` VALUES ('39', '39', '中国四川成都', '系带', '匡威', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:54:53', '2022-04-19 19:54:53');
INSERT INTO `product_params` VALUES ('4', '4', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:36:16', '2022-04-19 14:36:16');
INSERT INTO `product_params` VALUES ('40', '40', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 19:56:53', '2022-04-19 19:56:53');
INSERT INTO `product_params` VALUES ('41', '41', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 20:02:47', '2022-04-19 20:02:47');
INSERT INTO `product_params` VALUES ('42', '42', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 20:03:08', '2022-04-19 20:03:08');
INSERT INTO `product_params` VALUES ('43', '43', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 20:03:46', '2022-04-19 20:03:46');
INSERT INTO `product_params` VALUES ('44', '44', '中国四川成都', '系带', 'nike', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 20:04:01', '2022-04-19 20:04:01');
INSERT INTO `product_params` VALUES ('45', '45', '中国四川成都', '拉链', '安踏', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 20:12:07', '2022-04-19 20:12:07');
INSERT INTO `product_params` VALUES ('46', '46', '中国四川成都', '拉链', '安踏', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:17:07', '2022-04-19 20:17:07');
INSERT INTO `product_params` VALUES ('47', '47', '中国四川成都', '拉链', '安踏', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:17:49', '2022-04-19 20:17:49');
INSERT INTO `product_params` VALUES ('48', '48', '中国四川成都', '拉链', '安踏', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:18:04', '2022-04-19 20:18:04');
INSERT INTO `product_params` VALUES ('49', '49', '中国四川成都', '拉链', '安踏', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:18:10', '2022-04-19 20:18:10');
INSERT INTO `product_params` VALUES ('5', '5', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:39:19', '2022-04-19 14:39:19');
INSERT INTO `product_params` VALUES ('50', '50', '中国四川成都', '拉链', '安踏', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:18:12', '2022-04-19 20:18:12');
INSERT INTO `product_params` VALUES ('51', '51', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:17', '2022-04-19 20:20:17');
INSERT INTO `product_params` VALUES ('52', '52', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:18', '2022-04-19 20:20:18');
INSERT INTO `product_params` VALUES ('53', '53', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:19', '2022-04-19 20:20:19');
INSERT INTO `product_params` VALUES ('54', '54', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:20', '2022-04-19 20:20:20');
INSERT INTO `product_params` VALUES ('55', '55', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:21', '2022-04-19 20:20:21');
INSERT INTO `product_params` VALUES ('56', '56', '中国四川成都', '拉链', '李宁', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:20:22', '2022-04-19 20:20:22');
INSERT INTO `product_params` VALUES ('57', '57', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:12', '2022-04-19 20:31:12');
INSERT INTO `product_params` VALUES ('58', '58', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:13', '2022-04-19 20:31:13');
INSERT INTO `product_params` VALUES ('59', '59', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:14', '2022-04-19 20:31:14');
INSERT INTO `product_params` VALUES ('6', '6', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:41:06', '2022-04-19 14:41:06');
INSERT INTO `product_params` VALUES ('60', '60', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product_params` VALUES ('61', '61', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:15', '2022-04-19 20:31:15');
INSERT INTO `product_params` VALUES ('62', '62', '中国四川成都', '拉链', 'FILA', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:31:16', '2022-04-19 20:31:16');
INSERT INTO `product_params` VALUES ('63', '63', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:06', '2022-04-19 20:32:06');
INSERT INTO `product_params` VALUES ('64', '64', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:21', '2022-04-19 20:32:21');
INSERT INTO `product_params` VALUES ('65', '65', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:23', '2022-04-19 20:32:23');
INSERT INTO `product_params` VALUES ('66', '66', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:24', '2022-04-19 20:32:24');
INSERT INTO `product_params` VALUES ('67', '67', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:25', '2022-04-19 20:32:25');
INSERT INTO `product_params` VALUES ('68', '68', '中国四川成都', '拉链', 'NIKE', '成都创新服装有限责任公司', '四川成都成洛大道南段50号', '修身', '1.0kg', '宽松', '2022-04-19 20:32:26', '2022-04-19 20:32:26');
INSERT INTO `product_params` VALUES ('69', '69', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:06', '2022-04-19 20:36:06');
INSERT INTO `product_params` VALUES ('7', '7', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:41:53', '2022-04-19 14:41:53');
INSERT INTO `product_params` VALUES ('70', '70', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:27', '2022-04-19 20:36:27');
INSERT INTO `product_params` VALUES ('71', '71', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product_params` VALUES ('72', '72', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:29', '2022-04-19 20:36:29');
INSERT INTO `product_params` VALUES ('73', '73', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product_params` VALUES ('74', '74', '中国四川成都', '1', '亿健', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:36:30', '2022-04-19 20:36:30');
INSERT INTO `product_params` VALUES ('75', '75', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:28', '2022-04-19 20:46:28');
INSERT INTO `product_params` VALUES ('76', '76', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:32', '2022-04-19 20:46:32');
INSERT INTO `product_params` VALUES ('77', '77', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:33', '2022-04-19 20:46:33');
INSERT INTO `product_params` VALUES ('78', '78', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product_params` VALUES ('79', '79', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:34', '2022-04-19 20:46:34');
INSERT INTO `product_params` VALUES ('8', '8', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:42:10', '2022-04-19 14:42:10');
INSERT INTO `product_params` VALUES ('80', '80', '中国四川成都', '1', '华亚', '成都创新有限责任公司', '四川成都成洛大道南段50号', '健身', '1.0kg', '长款', '2022-04-19 20:46:35', '2022-04-19 20:46:35');
INSERT INTO `product_params` VALUES ('9', '9', '中国四川成都', '系带', 'adidas', '成都创新鞋业有限责任公司', '四川成都成洛大道南段50号', '透气', '1.0kg', '低帮', '2022-04-19 14:45:37', '2022-04-19 14:45:37');

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `sku_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编号',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `sku_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `sku_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `untitled` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性组合（格式是p1:v1;p2:v2）',
  `original_price` int(11) NOT NULL COMMENT '原价',
  `sell_price` int(11) NOT NULL COMMENT '销售价格',
  `discounts` decimal(4, 2) NOT NULL COMMENT '折扣力度',
  `stock` int(11) NOT NULL COMMENT '库存',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `status` int(11) NULL DEFAULT NULL COMMENT 'sku状态(1启用，0禁用，-1删除)',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('1', '1', '空军一号 白色 夜光', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 799, 599, 0.70, 315, '2022-03-21 15:58:00', '2022-03-21 15:58:00', 1);
INSERT INTO `product_sku` VALUES ('10', '5', '黑色', 'adidas2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 999, '2022-04-19 14:39:19', '2022-04-19 14:39:19', 1);
INSERT INTO `product_sku` VALUES ('11', '6', '黑色', 'adidas3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 998, '2022-04-19 14:41:06', '2022-04-19 14:41:06', 1);
INSERT INTO `product_sku` VALUES ('12', '7', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 999, '2022-04-19 14:41:53', '2022-04-19 14:41:53', 1);
INSERT INTO `product_sku` VALUES ('13', '8', '白色', 'adidas5.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 998, '2022-04-19 14:42:10', '2022-04-19 14:42:10', 1);
INSERT INTO `product_sku` VALUES ('14', '9', '黑色', 'adidas6.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 997, '2022-04-19 14:45:37', '2022-04-19 14:45:37', 1);
INSERT INTO `product_sku` VALUES ('15', '10', '黑色', 'nike1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 14:46:49', '2022-04-19 14:46:49', 1);
INSERT INTO `product_sku` VALUES ('16', '11', '黑色', 'nike2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 14:47:06', '2022-04-19 14:47:06', 1);
INSERT INTO `product_sku` VALUES ('17', '12', '黑色', 'nike3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 15:14:51', '2022-04-19 15:14:51', 1);
INSERT INTO `product_sku` VALUES ('18', '13', '黑色', 'nike4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:14:57', '2022-04-19 15:14:57', 1);
INSERT INTO `product_sku` VALUES ('19', '14', '黑色', 'nike5.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:15:01', '2022-04-19 15:15:01', 1);
INSERT INTO `product_sku` VALUES ('2', '1', '空军一号 多色勾', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 799, 599, 0.70, 171, '2022-03-21 14:48:21', '2022-03-21 14:48:25', 1);
INSERT INTO `product_sku` VALUES ('20', '15', '黑色', 'nike6.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:15:05', '2022-04-19 15:15:05', 1);
INSERT INTO `product_sku` VALUES ('21', '16', '黑色', 'nike4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:15:08', '2022-04-19 15:15:08', 1);
INSERT INTO `product_sku` VALUES ('22', '17', '黑色', 'nike4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:15:11', '2022-04-19 15:15:11', 1);
INSERT INTO `product_sku` VALUES ('23', '18', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:15:58', '2022-04-19 15:15:58', 1);
INSERT INTO `product_sku` VALUES ('24', '19', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:16:03', '2022-04-19 15:16:03', 1);
INSERT INTO `product_sku` VALUES ('25', '20', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 15:16:06', '2022-04-19 15:16:06', 1);
INSERT INTO `product_sku` VALUES ('26', '21', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 15:16:10', '2022-04-19 15:16:10', 1);
INSERT INTO `product_sku` VALUES ('27', '22', '黑色', 'adidas4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 15:16:13', '2022-04-19 15:16:13', 1);
INSERT INTO `product_sku` VALUES ('28', '23', '黑色', 'aj1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 19:24:19', '2022-04-19 19:24:19', 1);
INSERT INTO `product_sku` VALUES ('29', '24', '黑色', 'aj2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 19:26:47', '2022-04-19 19:26:47', 1);
INSERT INTO `product_sku` VALUES ('3', '1', '空军一号 纯色', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 1, 1, 0.70, 29, '2022-03-21 14:49:20', '2022-03-21 14:49:23', 1);
INSERT INTO `product_sku` VALUES ('30', '25', '黑色', 'aj3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:27:07', '2022-04-19 19:27:07', 1);
INSERT INTO `product_sku` VALUES ('31', '26', '黑色', 'aj4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:29:48', '2022-04-19 19:29:48', 1);
INSERT INTO `product_sku` VALUES ('32', '27', '黑色', 'aj5.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:30:37', '2022-04-19 19:30:37', 1);
INSERT INTO `product_sku` VALUES ('33', '28', '黑色', 'hl1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:42:42', '2022-04-19 19:42:42', 1);
INSERT INTO `product_sku` VALUES ('34', '29', '黑色', 'kw1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 19:44:48', '2022-04-19 19:44:48', 1);
INSERT INTO `product_sku` VALUES ('35', '30', '黑色', 'hl2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 19:46:55', '2022-04-19 19:46:55', 1);
INSERT INTO `product_sku` VALUES ('36', '31', '黑色', 'hl3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:47:35', '2022-04-19 19:47:35', 1);
INSERT INTO `product_sku` VALUES ('37', '32', '黑色', 'hl4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 998, '2022-04-19 19:48:18', '2022-04-19 19:48:18', 1);
INSERT INTO `product_sku` VALUES ('38', '33', '黑色', 'hl5.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:49:06', '2022-04-19 19:49:06', 1);
INSERT INTO `product_sku` VALUES ('39', '34', '黑色', 'hl1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:51:23', '2022-04-19 19:51:23', 1);
INSERT INTO `product_sku` VALUES ('4', '1', '空军一号 万圣节款', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 10, 8, 0.80, 137, '2021-04-27 11:38:55', '2021-04-27 11:39:00', 1);
INSERT INTO `product_sku` VALUES ('40', '35', '黑色', 'kw2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:53:00', '2022-04-19 19:53:00', 1);
INSERT INTO `product_sku` VALUES ('41', '36', '黑色', 'kw3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:53:24', '2022-04-19 19:53:24', 1);
INSERT INTO `product_sku` VALUES ('42', '37', '黑色', 'kw4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:53:46', '2022-04-19 19:53:46', 1);
INSERT INTO `product_sku` VALUES ('43', '38', '黑色', 'kw1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:54:20', '2022-04-19 19:54:20', 1);
INSERT INTO `product_sku` VALUES ('44', '39', '黑色', 'kw2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:54:53', '2022-04-19 19:54:53', 1);
INSERT INTO `product_sku` VALUES ('45', '40', '黑色', 'qx1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 19:56:53', '2022-04-19 19:56:53', 1);
INSERT INTO `product_sku` VALUES ('46', '41', '黑色', 'qx2.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 20:02:47', '2022-04-19 20:02:47', 1);
INSERT INTO `product_sku` VALUES ('47', '42', '黑色', 'qx3.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 20:03:08', '2022-04-19 20:03:08', 1);
INSERT INTO `product_sku` VALUES ('48', '43', '黑色', 'qx4.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 20:03:46', '2022-04-19 20:03:46', 1);
INSERT INTO `product_sku` VALUES ('49', '44', '黑色', 'qx1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 5, 1, 0.80, 999, '2022-04-19 20:04:01', '2022-04-19 20:04:01', 1);
INSERT INTO `product_sku` VALUES ('5', '1', '空军一号 电竞款', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 899, 799, 0.90, 2000, '2022-03-21 13:17:31', '2022-03-21 13:17:36', 1);
INSERT INTO `product_sku` VALUES ('50', '45', '黑色', 'tz1.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:12:07', '2022-04-19 20:12:07', 1);
INSERT INTO `product_sku` VALUES ('51', '46', '黑色', 'tz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:17:07', '2022-04-19 20:17:07', 1);
INSERT INTO `product_sku` VALUES ('52', '47', '黑色', 'tz3.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:17:49', '2022-04-19 20:17:49', 1);
INSERT INTO `product_sku` VALUES ('53', '48', '黑色', 'tz1.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:18:04', '2022-04-19 20:18:04', 1);
INSERT INTO `product_sku` VALUES ('54', '49', '黑色', 'tz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:18:10', '2022-04-19 20:18:10', 1);
INSERT INTO `product_sku` VALUES ('55', '50', '黑色', 'tz3.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:18:12', '2022-04-19 20:18:12', 1);
INSERT INTO `product_sku` VALUES ('56', '51', '黑色', 'tz4.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:17', '2022-04-19 20:20:17', 1);
INSERT INTO `product_sku` VALUES ('57', '52', '黑色', 'tz5.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:18', '2022-04-19 20:20:18', 1);
INSERT INTO `product_sku` VALUES ('58', '53', '黑色', 'tz6.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:19', '2022-04-19 20:20:19', 1);
INSERT INTO `product_sku` VALUES ('59', '54', '黑色', 'tz4.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:20', '2022-04-19 20:20:20', 1);
INSERT INTO `product_sku` VALUES ('6', '1', '空军一号 黑色', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 3, 2, 0.50, 998, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('60', '55', '黑色', 'tz5.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:21', '2022-04-19 20:20:21', 1);
INSERT INTO `product_sku` VALUES ('61', '56', '黑色', 'tz6.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:20:22', '2022-04-19 20:20:22', 1);
INSERT INTO `product_sku` VALUES ('62', '57', '黑色', 'fl1.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:31:12', '2022-04-19 20:31:12', 1);
INSERT INTO `product_sku` VALUES ('63', '58', '黑色', 'fl2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:31:13', '2022-04-19 20:31:13', 1);
INSERT INTO `product_sku` VALUES ('64', '59', '黑色', 'fl3.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 997, '2022-04-19 20:31:14', '2022-04-19 20:31:14', 1);
INSERT INTO `product_sku` VALUES ('65', '60', '黑色', 'fl4.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 998, '2022-04-19 20:31:15', '2022-04-19 20:31:15', 1);
INSERT INTO `product_sku` VALUES ('66', '61', '黑色', 'fl1.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:31:15', '2022-04-19 20:31:15', 1);
INSERT INTO `product_sku` VALUES ('67', '62', '黑色', 'fl2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 998, '2022-04-19 20:31:16', '2022-04-19 20:31:16', 1);
INSERT INTO `product_sku` VALUES ('68', '63', '黑色', 'nikekz1.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:06', '2022-04-19 20:32:06', 1);
INSERT INTO `product_sku` VALUES ('69', '64', '黑色', 'nikekz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:21', '2022-04-19 20:32:21', 1);
INSERT INTO `product_sku` VALUES ('7', '2', '黑色', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\"]}', 2, 1, 0.50, 999, '2022-04-19 14:32:51', '2022-04-19 14:32:54', 1);
INSERT INTO `product_sku` VALUES ('70', '65', '黑色', 'nikekz3.png', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:23', '2022-04-19 20:32:23', 1);
INSERT INTO `product_sku` VALUES ('71', '66', '黑色', 'nikekz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:24', '2022-04-19 20:32:24', 1);
INSERT INTO `product_sku` VALUES ('72', '67', '黑色', 'nikekz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:25', '2022-04-19 20:32:25', 1);
INSERT INTO `product_sku` VALUES ('73', '68', '黑色', 'nikekz2.jpg', '{尺码:[\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXL\"]}', 5, 1, 0.80, 999, '2022-04-19 20:32:26', '2022-04-19 20:32:26', 1);
INSERT INTO `product_sku` VALUES ('74', '69', '黑色', 'pbj1.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:06', '2022-04-19 20:36:06', 1);
INSERT INTO `product_sku` VALUES ('75', '70', '黑色', 'pbj2.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:27', '2022-04-19 20:36:27', 1);
INSERT INTO `product_sku` VALUES ('76', '71', '黑色', 'pbj3.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:29', '2022-04-19 20:36:29', 1);
INSERT INTO `product_sku` VALUES ('77', '72', '黑色', 'pbj1.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:29', '2022-04-19 20:36:29', 1);
INSERT INTO `product_sku` VALUES ('78', '73', '黑色', 'pbj2.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:30', '2022-04-19 20:36:30', 1);
INSERT INTO `product_sku` VALUES ('79', '74', '黑色', 'pbj3.jpg', '{保修:[\"全保修两年\",\"意外换新\",\"换新保两年\"]}', 5, 1, 0.80, 999, '2022-04-19 20:36:30', '2022-04-19 20:36:30', 1);
INSERT INTO `product_sku` VALUES ('8', '3', '黑色', 'af1_1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\",\"42\",\"42.5\",\"43\",\"44\",\"44.5\"]}', 2, 1, 0.20, 999, '2022-04-19 14:33:35', '2022-04-19 14:33:38', 1);
INSERT INTO `product_sku` VALUES ('80', '75', '黑色', 'yl1.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 999, '2022-04-19 20:46:28', '2022-04-19 20:46:28', 1);
INSERT INTO `product_sku` VALUES ('81', '76', '黑色', 'yl2.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 999, '2022-04-19 20:46:32', '2022-04-19 20:46:32', 1);
INSERT INTO `product_sku` VALUES ('82', '77', '黑色', 'yl3.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 999, '2022-04-19 20:46:33', '2022-04-19 20:46:33', 1);
INSERT INTO `product_sku` VALUES ('83', '78', '黑色', 'yl4.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 993, '2022-04-19 20:46:34', '2022-04-19 20:46:34', 1);
INSERT INTO `product_sku` VALUES ('84', '79', '黑色', 'yl2.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 999, '2022-04-19 20:46:34', '2022-04-19 20:46:34', 1);
INSERT INTO `product_sku` VALUES ('85', '80', '黑色', 'yl3.jpg', '{尺码:[\"5kg\",\"6kg\",\"10kg\",\"5kg*2\",\"6kg*2\",\"10kg*2\"]}', 5, 1, 0.80, 993, '2022-04-19 20:46:35', '2022-04-19 20:46:35', 1);
INSERT INTO `product_sku` VALUES ('9', '4', '黑色', 'adidas1.jpg', '{鞋码:[\"38.5\",\"39\",\"40\",\"41\"]}', 5, 1, 0.80, 999, '2022-04-19 14:36:16', '2022-04-19 14:36:16', 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `cart_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购物车商品数量',
  `cart_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加购物车时间',
  `product_price` decimal(32, 8) NULL DEFAULT NULL COMMENT '添加购物车时商品价格',
  `sku_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择的套餐的属性',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (5, '3', '1', '6', '1', '2021-05-12 09:18:35', 1.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (6, '1', '4', '6', '1', '2021-05-12 09:18:47', 8.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (10, '1', '1', '13', '1', '2022-03-30 10:26:32', 599.00000000, '鞋码:40;');
INSERT INTO `shopping_cart` VALUES (11, '1', '4', '13', '1', '2022-03-30 10:27:05', 8.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (12, '1', '1', '13', '2', '2022-03-30 10:08:17', 599.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (15, '26', '12', '13', '1', '2022-04-18 09:08:49', 2.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (52, '11', '16', '1', '1', '2022-04-22 11:41:14', 1.00000000, '鞋码:42;');
INSERT INTO `shopping_cart` VALUES (53, '1', '1', '1', '1', '2022-04-22 11:41:33', 599.00000000, '鞋码:42;');
INSERT INTO `shopping_cart` VALUES (54, '80', '85', '1', '1', '2022-04-23 01:20:56', 1.00000000, '尺码:5kg;');
INSERT INTO `shopping_cart` VALUES (55, '1', '6', '1', '1', '2022-04-23 01:21:03', 2.00000000, '鞋码:38.5;');
INSERT INTO `shopping_cart` VALUES (56, '40', '45', '1', '1', '2022-04-23 01:21:14', 1.00000000, '鞋码:41;');

-- ----------------------------
-- Table structure for user_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_addr`;
CREATE TABLE `user_addr`  (
  `addr_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址主键id',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人姓名',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人手机号',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区县',
  `addr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int(11) NULL DEFAULT NULL COMMENT '是否默认地址 1是 1:是  0:否',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_addr
-- ----------------------------
INSERT INTO `user_addr` VALUES ('1', '1', '张三', '13030303300', '四川省', '成都市', '龙泉驿区', '成洛大道南段', '621000', 1, 1, '2021-04-30 09:33:30', '2022-04-20 20:59:23');
INSERT INTO `user_addr` VALUES ('2', '1', '小丽', '13131313311', '四川', '成都', '龙泉驿区', '成洛大道南段', '621000', 1, 0, '2021-04-30 09:34:41', '2021-04-30 09:34:44');
INSERT INTO `user_addr` VALUES ('3', '6', '韩梅梅', '13232323322', '四川', '成都', '龙泉驿区', '成洛大道南段', '621000', 1, 1, '2021-04-30 09:35:49', '2021-04-30 09:35:53');
INSERT INTO `user_addr` VALUES ('4', '1', '李四', '12345', '上海', '上海', '浦江区', '成洛大道', '621000', 1, 0, '2022-04-21 23:14:28', '2022-04-22 20:14:03');
INSERT INTO `user_addr` VALUES ('5', '1', '王五', '123123', '贵州', '大道', '天府 区', '成洛大道', '621000', 1, 0, '2022-04-21 23:15:07', '2022-04-22 20:02:12');
INSERT INTO `user_addr` VALUES ('6', '14', '李四', '12356777', '四川', '成都', '龙泉驿区', '成洛大道', '621000', 1, 1, '2022-04-21 23:16:40', '2022-04-21 23:16:40');
INSERT INTO `user_addr` VALUES ('7', '14', '王五', '123123', '重庆', '重庆', '江北区', '大道南段111号', '134122', 1, 0, '2022-04-22 18:02:11', '2022-04-22 18:02:11');
INSERT INTO `user_addr` VALUES ('8', '14', '哈哈哈', '12312', '北京', '北京', '朝阳区', '冲冲冲', '312313', 1, 0, '2022-04-22 18:07:41', '2022-04-22 18:07:41');

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AREA` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `COUNTRY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `IP` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `LOGIN_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录历史表 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(64) NOT NULL AUTO_INCREMENT COMMENT '主键id 用户id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名 用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称 昵称',
  `realname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名 真实姓名',
  `user_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像 头像',
  `user_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号 手机号',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址 邮箱地址',
  `user_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 M(男) or F(女)',
  `user_birth` date NULL DEFAULT NULL COMMENT '生日 生日',
  `user_regtime` datetime(0) NOT NULL COMMENT '注册时间 创建时间',
  `user_modtime` datetime(0) NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户 ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', 'f379eaf3c831b04de153469d1bec345e', '', '杨永涛', 'images/38406e869b264f70b88635d224112ce1.jpg', '135484391831', '2841928995@qq.com', 'M', '2022-04-15', '2021-04-15 16:10:53', '2022-04-22 23:39:54');
INSERT INTO `users` VALUES (2, 'aaaa', '2f7b52aacfbf6f44e13d27656ecb1f59', '', 'wh', 'images/c06132b2979a4f0b9877f91517d18e93.jpg', '2313', '2313', 'M', '2022-04-16', '2021-04-16 11:10:01', '2022-04-21 20:26:39');
INSERT INTO `users` VALUES (3, 'wahaha', '14e1b600b1fd579f47433b88e8d85291', '', 'wh', 'images/1cd635dfacb1452ca83a7bfcc9320bfd.jpg', '3123', '123123', 'M', '2022-04-16', '2021-04-16 15:36:52', '2022-04-21 20:26:47');
INSERT INTO `users` VALUES (4, 'heihei', '4297f44b13955235245b2497399d7a93', '二狗', NULL, 'images/userimg.jpg', NULL, NULL, 'M', '2022-04-16', '2021-04-16 15:38:49', '2021-04-16 15:38:49');
INSERT INTO `users` VALUES (5, 'Tony', '4297f44b13955235245b2497399d7a93', '托尼', NULL, 'images/userimg.jpg', NULL, NULL, 'F', '2022-04-16', '2021-04-23 10:25:04', '2021-04-23 10:25:04');
INSERT INTO `users` VALUES (6, 'hanmeimei', 'f379eaf3c831b04de153469d1bec345e', NULL, NULL, 'images/userimg.jpg', NULL, NULL, 'F', '2022-04-16', '2021-04-23 10:30:52', '2021-04-23 10:30:52');
INSERT INTO `users` VALUES (7, 'lilei123', '4297f44b13955235245b2497399d7a93', NULL, NULL, 'images/userimg.jpg', NULL, NULL, 'F', '2022-04-16', '2021-04-23 10:33:03', '2021-04-23 10:33:03');
INSERT INTO `users` VALUES (8, 'tom123123', '4297f44b13955235245b2497399d7a93', NULL, NULL, 'images/userimg.jpg', NULL, NULL, 'F', '2022-04-16', '2021-04-23 10:34:49', '2021-04-23 10:34:49');
INSERT INTO `users` VALUES (9, 'yyt123123', '123456789', NULL, NULL, '', NULL, NULL, 'M', '2022-04-16', '2022-02-24 21:22:17', '2022-02-24 21:22:19');
INSERT INTO `users` VALUES (10, 'yyt', '4297f44b13955235245b2497399d7a93', NULL, NULL, '111', NULL, NULL, 'M', NULL, '2022-02-25 20:37:54', '2022-02-25 20:37:54');
INSERT INTO `users` VALUES (13, 'yyt123456', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, 'images/userimg.jpg', NULL, NULL, 'M', '2022-04-16', '2022-03-03 22:29:09', '2022-03-03 22:29:09');
INSERT INTO `users` VALUES (14, 'aswdjkl123', '25d55ad283aa400af464c76d713c07ad', '', '杨永涛', 'images/10919b39ad48405e9965c6671d03460d.jpg', '12313213', '231231', 'M', '2022-04-20', '2022-03-06 12:45:27', '2022-04-21 23:16:16');
INSERT INTO `users` VALUES (15, '1hfhsr', 'e10adc3949ba59abbe56e057f20f883e', '', '杨永涛', 'images/61e390d96ed443a2a0d290d39747ebe1.jpg', '1234', '1212551', 'F', NULL, '2022-04-17 18:11:08', '2022-04-17 18:11:08');
INSERT INTO `users` VALUES (17, 'dasda', 'e10adc3949ba59abbe56e057f20f883e', '', '王五', 'images/b8cb5f969cd0458ebc3bb5fcf21924aa.jpg', '12313', '21313', 'M', '2022-04-13', '2022-04-22 23:16:31', '2022-04-22 23:16:31');
INSERT INTO `users` VALUES (18, 'yyt66666', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, '111', NULL, NULL, NULL, NULL, '2022-04-22 23:37:06', '2022-04-22 23:37:06');
INSERT INTO `users` VALUES (19, 'dasjkhadas', 'f379eaf3c831b04de153469d1bec345e', NULL, NULL, '111', NULL, NULL, NULL, NULL, '2022-04-22 23:39:02', '2022-04-22 23:39:02');
INSERT INTO `users` VALUES (20, 'a', '2a6571da26602a67be14ea8c5ab82349', '', 'dsa', 'images/0c5bc933c2874062986f2c74a798d9a2.jpg', '345', '34322', 'M', '2022-04-13', '2022-04-23 09:05:36', '2022-04-23 09:05:36');

SET FOREIGN_KEY_CHECKS = 1;

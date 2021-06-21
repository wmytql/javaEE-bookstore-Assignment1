/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : booktest

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 18/06/2021 16:01:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_book
-- ----------------------------
DROP TABLE IF EXISTS `bs_book`;
CREATE TABLE `bs_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `sales` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `img_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_book
-- ----------------------------
INSERT INTO `bs_book` VALUES (1, '解忧杂货店', '东野圭吾', 27.9, 109, 91, 'static/uploads/jieyouzahuodian.jpg');
INSERT INTO `bs_book` VALUES (2, '边城', '沈从文', 23, 105, 95, 'static/uploads/biancheng.jpg');
INSERT INTO `bs_book` VALUES (4, '忽然七日', ' 劳伦', 19.33, 104, 97, 'static/uploads/huranqiri.jpg');
INSERT INTO `bs_book` VALUES (6, '百年孤独', '马尔克斯', 29.5, 103, 97, 'static/uploads/bainiangudu.jpg');
INSERT INTO `bs_book` VALUES (7, '扶桑', '严歌苓', 19.8, 100, 100, 'static/uploads/fusang.jpg');
INSERT INTO `bs_book` VALUES (8, '给孩子的诗', '北岛', 22.2, 100, 100, 'static/uploads/geihaizideshi.jpg');
INSERT INTO `bs_book` VALUES (9, '为奴十二年', '所罗门', 16.5, 101, 99, 'static/uploads/weinushiernian.jpg');
INSERT INTO `bs_book` VALUES (10, '平凡的世界', '路遥', 55, 100, 100, 'static/uploads/pingfandeshijie.jpg');
INSERT INTO `bs_book` VALUES (11, '悟空传', '今何在', 14, 100, 100, 'static/uploads/wukongzhuan.jpg');
INSERT INTO `bs_book` VALUES (12, '硬派健身', '斌卡', 31.2, 100, 100, 'static/uploads/yingpaijianshen.jpg');
INSERT INTO `bs_book` VALUES (13, '从晚清到民国', '唐德刚', 39.9, 100, 100, 'static/uploads/congwanqingdaominguo.jpg');
INSERT INTO `bs_book` VALUES (14, '三体', '刘慈欣', 56.5, 100, 100, 'static/uploads/santi.jpg');
INSERT INTO `bs_book` VALUES (15, '看见', '柴静', 19.5, 100, 100, 'static/uploads/kanjian.jpg');
INSERT INTO `bs_book` VALUES (16, '活着', '余华', 11, 100, 100, 'static/uploads/huozhe.jpg');
INSERT INTO `bs_book` VALUES (17, '小王子', '安托万', 19.2, 100, 100, 'static/uploads/xiaowangzi.jpg');
INSERT INTO `bs_book` VALUES (18, '我们仨', '杨绛', 11.3, 100, 100, 'static/uploads/womensa.jpg');
INSERT INTO `bs_book` VALUES (19, '生命不息,折腾不止', '罗永浩', 25.2, 100, 100, 'static/uploads/shengmingbuxi.jpg');
INSERT INTO `bs_book` VALUES (20, '皮囊', '蔡崇达', 23.9, 100, 100, 'static/uploads/pinang.jpg');
INSERT INTO `bs_book` VALUES (21, '恰到好处的幸福', '毕淑敏', 16.4, 100, 100, 'static/uploads/qiadaohaochudexingfu.jpg');
INSERT INTO `bs_book` VALUES (22, '大数据预测', '埃里克', 37.2, 100, 100, 'static/uploads/dashujuyuce.jpg');
INSERT INTO `bs_book` VALUES (24, 'C语言入门经典', '霍尔顿', 45, 100, 100, 'static/uploads/cyuyanrumenjingdian.jpg');
INSERT INTO `bs_book` VALUES (25, '数学之美', '吴军', 29.9, 100, 100, 'static/uploads/shuxuezhimei.jpg');
INSERT INTO `bs_book` VALUES (27, '设计模式之禅', '秦小波', 20.2, 100, 100, 'static/uploads/shejimoshizhichan.jpg');
INSERT INTO `bs_book` VALUES (28, '图解机器学习', '杉山将', 33.8, 100, 100, 'static/uploads/tujiejiqixuexi.jpg');
INSERT INTO `bs_book` VALUES (29, '艾伦图灵传', '安德鲁', 47.2, 100, 100, 'static/uploads/ailuntulingzhuan.jpg');
INSERT INTO `bs_book` VALUES (30, '教父', '马里奥普佐', 29, 100, 100, 'static/uploads/jiaofu.jpg');
INSERT INTO `bs_book` VALUES (34, '解忧杂货店', '东野圭吾', 27.2, 100, 100, 'static/uploads/jieyouzahuodian.jpg');
INSERT INTO `bs_book` VALUES (35, '边城', '沈从文', 23, 100, 100, 'static/uploads/biancheng.jpg');
INSERT INTO `bs_book` VALUES (36, '中国哲学史', '冯友兰', 44.5, 100, 100, 'static/uploads/zhongguozhexueshi.jpg');
INSERT INTO `bs_book` VALUES (37, '忽然七日', ' 劳伦', 19.33, 100, 100, 'static/uploads/huranqiri.jpg');
INSERT INTO `bs_book` VALUES (38, '苏东坡传', '林语堂', 19.3, 100, 100, 'static/uploads/sudongpozhuan.jpg');
INSERT INTO `bs_book` VALUES (39, '百年孤独', '马尔克斯', 29.5, 100, 100, 'static/uploads/bainiangudu.jpg');
INSERT INTO `bs_book` VALUES (40, '扶桑', '严歌苓', 19.8, 100, 100, 'static/uploads/fusang.jpg');
INSERT INTO `bs_book` VALUES (41, '给孩子的诗', '北岛', 22.2, 100, 100, 'static/uploads/geihaizideshi.jpg');
INSERT INTO `bs_book` VALUES (42, '为奴十二年', '所罗门', 16.5, 100, 100, 'static/uploads/weinushiernian.jpg');
INSERT INTO `bs_book` VALUES (43, '平凡的世界', '路遥', 55, 100, 100, 'static/uploads/pingfandeshijie.jpg');
INSERT INTO `bs_book` VALUES (44, '悟空传', '今何在', 14, 100, 100, 'static/uploads/wukongzhuan.jpg');
INSERT INTO `bs_book` VALUES (45, '硬派健身', '斌卡', 31.2, 100, 100, 'static/uploads/yingpaijianshen.jpg');
INSERT INTO `bs_book` VALUES (46, '从晚清到民国', '唐德刚', 39.9, 100, 100, 'static/uploads/congwanqingdaominguo.jpg');
INSERT INTO `bs_book` VALUES (47, '三体', '刘慈欣', 56.5, 100, 100, 'static/uploads/santi.jpg');
INSERT INTO `bs_book` VALUES (48, '看见', '柴静', 19.5, 100, 100, 'static/uploads/kanjian.jpg');
INSERT INTO `bs_book` VALUES (49, '活着', '余华', 11, 100, 100, 'static/uploads/huozhe.jpg');
INSERT INTO `bs_book` VALUES (50, '小王子', '安托万', 19.2, 100, 100, 'static/uploads/xiaowangzi.jpg');
INSERT INTO `bs_book` VALUES (51, '我们仨', '杨绛', 11.3, 100, 100, 'static/uploads/womensa.jpg');
INSERT INTO `bs_book` VALUES (52, '生命不息,折腾不止', '罗永浩', 25.2, 100, 100, 'static/uploads/shengmingbuxi.jpg');
INSERT INTO `bs_book` VALUES (53, '皮囊', '蔡崇达', 23.9, 100, 100, 'static/uploads/pinang.jpg');
INSERT INTO `bs_book` VALUES (54, '恰到好处的幸福', '毕淑敏', 16.4, 100, 100, 'static/uploads/qiadaohaochudexingfu.jpg');
INSERT INTO `bs_book` VALUES (55, '大数据预测', '埃里克', 37.2, 100, 100, 'static/uploads/dashujuyuce.jpg');
INSERT INTO `bs_book` VALUES (56, '人月神话', '布鲁克斯', 55.9, 100, 100, 'static/uploads/renyueshenhua.jpg');
INSERT INTO `bs_book` VALUES (57, 'C语言入门经典', '霍尔顿', 45, 100, 100, 'static/uploads/cyuyanrumenjingdian.jpg');
INSERT INTO `bs_book` VALUES (58, '数学之美', '吴军', 29.9, 100, 100, 'static/uploads/shuxuezhimei.jpg');
INSERT INTO `bs_book` VALUES (59, 'Java编程思想', '埃史尔', 70.5, 100, 100, 'static/uploads/Javabianchengsixiang.jpg');
INSERT INTO `bs_book` VALUES (60, '设计模式之禅', '秦小波', 20.2, 100, 100, 'static/uploads/shejimoshizhichan.jpg');
INSERT INTO `bs_book` VALUES (61, '图解机器学习', '杉山将', 33.8, 100, 100, 'static/uploads/tujiejiqixuexi.jpg');
INSERT INTO `bs_book` VALUES (62, '艾伦图灵传', '安德鲁', 47.2, 100, 100, 'static/uploads/ailuntulingzhuan.jpg');
INSERT INTO `bs_book` VALUES (63, '教父', '马里奥普佐', 29, 100, 100, 'static/uploads/jiaofu.jpg');
INSERT INTO `bs_book` VALUES (64, '解忧杂货店', '东野圭吾', 27.2, 100, 100, 'static/uploads/jieyouzahuodian.jpg');
INSERT INTO `bs_book` VALUES (65, '边城', '沈从文', 23, 100, 100, 'static/uploads/biancheng.jpg');
INSERT INTO `bs_book` VALUES (66, '中国哲学史', '冯友兰', 44.5, 100, 100, 'static/uploads/zhongguozhexueshi.jpg');
INSERT INTO `bs_book` VALUES (67, '忽然七日', ' 劳伦', 19.33, 100, 100, 'static/uploads/huranqiri.jpg');
INSERT INTO `bs_book` VALUES (68, '苏东坡传', '林语堂', 19.3, 100, 100, 'static/uploads/sudongpozhuan.jpg');
INSERT INTO `bs_book` VALUES (69, '百年孤独', '马尔克斯', 29.5, 100, 100, 'static/uploads/bainiangudu.jpg');
INSERT INTO `bs_book` VALUES (70, '扶桑', '严歌苓', 19.8, 100, 100, 'static/uploads/fusang.jpg');
INSERT INTO `bs_book` VALUES (71, '给孩子的诗', '北岛', 22.2, 100, 100, 'static/uploads/geihaizideshi.jpg');
INSERT INTO `bs_book` VALUES (72, '为奴十二年', '所罗门', 16.5, 100, 100, 'static/uploads/weinushiernian.jpg');
INSERT INTO `bs_book` VALUES (73, '平凡的世界', '路遥', 55, 100, 100, 'static/uploads/pingfandeshijie.jpg');
INSERT INTO `bs_book` VALUES (74, '悟空传', '今何在', 14, 100, 100, 'static/uploads/wukongzhuan.jpg');
INSERT INTO `bs_book` VALUES (75, '硬派健身', '斌卡', 31.2, 100, 100, 'static/uploads/yingpaijianshen.jpg');
INSERT INTO `bs_book` VALUES (76, '从晚清到民国', '唐德刚', 39.9, 100, 100, 'static/uploads/congwanqingdaominguo.jpg');
INSERT INTO `bs_book` VALUES (77, '三体', '刘慈欣', 56.5, 100, 100, 'static/uploads/santi.jpg');
INSERT INTO `bs_book` VALUES (78, '看见', '柴静', 19.5, 100, 100, 'static/uploads/kanjian.jpg');
INSERT INTO `bs_book` VALUES (79, '活着', '余华', 11, 100, 100, 'static/uploads/huozhe.jpg');
INSERT INTO `bs_book` VALUES (80, '小王子', '安托万', 19.2, 100, 100, 'static/uploads/xiaowangzi.jpg');
INSERT INTO `bs_book` VALUES (81, '我们仨', '杨绛', 11.3, 100, 100, 'static/uploads/womensa.jpg');
INSERT INTO `bs_book` VALUES (82, '生命不息,折腾不止', '罗永浩', 25.2, 100, 100, 'static/uploads/shengmingbuxi.jpg');
INSERT INTO `bs_book` VALUES (83, '皮囊', '蔡崇达', 23.9, 100, 100, 'static/uploads/pinang.jpg');
INSERT INTO `bs_book` VALUES (84, '恰到好处的幸福', '毕淑敏', 16.4, 100, 100, 'static/uploads/qiadaohaochudexingfu.jpg');
INSERT INTO `bs_book` VALUES (85, '大数据预测', '埃里克', 37.2, 100, 100, 'static/uploads/dashujuyuce.jpg');
INSERT INTO `bs_book` VALUES (86, '人月神话', '布鲁克斯', 55.9, 100, 100, 'static/uploads/renyueshenhua.jpg');
INSERT INTO `bs_book` VALUES (87, 'C语言入门经典', '霍尔顿', 45, 100, 100, 'static/uploads/cyuyanrumenjingdian.jpg');
INSERT INTO `bs_book` VALUES (88, '数学之美', '吴军', 29.9, 100, 100, 'static/uploads/shuxuezhimei.jpg');
INSERT INTO `bs_book` VALUES (89, 'Java编程思想', '埃史尔', 70.5, 100, 100, 'static/uploads/Javabianchengsixiang.jpg');
INSERT INTO `bs_book` VALUES (90, '设计模式之禅', '秦小波', 20.2, 100, 100, 'static/uploads/shejimoshizhichan.jpg');
INSERT INTO `bs_book` VALUES (91, '图解机器学习', '杉山将', 33.8, 100, 100, 'static/uploads/tujiejiqixuexi.jpg');
INSERT INTO `bs_book` VALUES (92, '艾伦图灵传', '安德鲁', 47.2, 103, 97, 'static/uploads/ailuntulingzhuan.jpg');

-- ----------------------------
-- Table structure for bs_order
-- ----------------------------
DROP TABLE IF EXISTS `bs_order`;
CREATE TABLE `bs_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sequence` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_count` int(11) NULL DEFAULT NULL,
  `total_amount` double NULL DEFAULT NULL,
  `order_status` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_order
-- ----------------------------
INSERT INTO `bs_order` VALUES (34, '161933994301243', '2021-04-25 16:39:03', 4, 111.6, 0, 43);
INSERT INTO `bs_order` VALUES (35, '161935918940056', '2021-04-25 21:59:49', 2, 50.9, 0, 56);
INSERT INTO `bs_order` VALUES (39, '162400275665460', '2021-06-18 15:52:36', 1, 19.33, 0, 60);

-- ----------------------------
-- Table structure for bs_order_item
-- ----------------------------
DROP TABLE IF EXISTS `bs_order_item`;
CREATE TABLE `bs_order_item`  (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `img_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_count` int(11) NULL DEFAULT NULL,
  `item_amount` double NULL DEFAULT NULL,
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_order_item
-- ----------------------------
INSERT INTO `bs_order_item` VALUES (40, '解忧杂货店', 27.9, 'static/uploads/jieyouzahuodian.jpg', 4, 111.6, '34');
INSERT INTO `bs_order_item` VALUES (41, '解忧杂货店', 27.9, 'static/uploads/jieyouzahuodian.jpg', 1, 27.9, '35');
INSERT INTO `bs_order_item` VALUES (42, '边城', 23, 'static/uploads/biancheng.jpg', 1, 23, '35');
INSERT INTO `bs_order_item` VALUES (48, '忽然七日', 19.33, 'static/uploads/huranqiri.jpg', 1, 19.33, '39');

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES (43, 'admin0000', 'admin0000', '212@w.cn');
INSERT INTO `bs_user` VALUES (44, 'admin1111', 'admin1111', '4152@qq.com');
INSERT INTO `bs_user` VALUES (48, 'zhangsan123', 'zhangsan123', '4152@qq.com');
INSERT INTO `bs_user` VALUES (53, 'admin00001', 'admin00001', '4152@qq.com');

SET FOREIGN_KEY_CHECKS = 1;

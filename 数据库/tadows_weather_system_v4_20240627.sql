/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : tadows_weather_system

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 27/06/2024 15:36:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aqi_data
-- ----------------------------
DROP TABLE IF EXISTS `aqi_data`;
CREATE TABLE `aqi_data`  (
  `aqi_id` int NOT NULL AUTO_INCREMENT COMMENT '某地AQI的自增id',
  `grid_watcher_number` int NULL DEFAULT NULL COMMENT '进行记录的网格员的工号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `record_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `pm2d5` double NULL DEFAULT NULL COMMENT 'pm2.5含量',
  `pm10` double NULL DEFAULT NULL COMMENT 'pm10含量',
  `so2` double NULL DEFAULT NULL COMMENT '二氧化硫含量',
  `no2` double NULL DEFAULT NULL COMMENT '二氧化氮含量',
  `o3` double NULL DEFAULT NULL COMMENT '臭氧含量',
  PRIMARY KEY (`aqi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aqi_data
-- ----------------------------
INSERT INTO `aqi_data` VALUES (1, -1, '-1', NULL, -1, -1, -1, -1, -1);
INSERT INTO `aqi_data` VALUES (2, -1, '-1', NULL, -1, -1, -1, -1, -1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int NOT NULL AUTO_INCREMENT COMMENT '自增的消息id',
  `notice_id` int NOT NULL COMMENT '该消息对应的公告(notice)id（外键）',
  `order` int NULL DEFAULT NULL COMMENT '该信息是公告中的第n条消息',
  `type` int NULL DEFAULT NULL COMMENT '消息的类型（0->文字,1->图片)，二者只能选其一',
  `message_text` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息的文字内容',
  `message_image_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息附带的图片链接',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `notice_message`(`notice_id` ASC) USING BTREE,
  CONSTRAINT `notice_message` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '自增的公告id',
  `header_image_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告附带的图片的链接，可能是服务器相对路径或者图床',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '公告发布时间（精确到秒）',
  `type` int NULL DEFAULT NULL COMMENT '公告的类型（通知或动态），0->通知；1->动态',
  `if_important` int NULL DEFAULT NULL COMMENT '公告的位置（0->下面,1->滚动条,2->横幅）',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_attachment
-- ----------------------------
DROP TABLE IF EXISTS `oversight_attachment`;
CREATE TABLE `oversight_attachment`  (
  `attachment_id` int NOT NULL AUTO_INCREMENT COMMENT '记录监督附件的自增id',
  `record_id` int NOT NULL COMMENT '对应记录的id（外键）',
  `attachment_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件的路径或链接',
  PRIMARY KEY (`attachment_id`) USING BTREE,
  INDEX `record_acctachment`(`record_id` ASC) USING BTREE,
  CONSTRAINT `record_acctachment` FOREIGN KEY (`record_id`) REFERENCES `oversight_record` (`record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oversight_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_record
-- ----------------------------
DROP TABLE IF EXISTS `oversight_record`;
CREATE TABLE `oversight_record`  (
  `record_id` int NOT NULL AUTO_INCREMENT COMMENT '监督记录的自增id',
  `member_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监督员姓名',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进行记录的地址（监督员所在地址）',
  `type` int NULL DEFAULT NULL COMMENT '监督记录的种类（0->监督请求；1->质询，怀疑测的不准）',
  `occurrent_time` datetime NULL DEFAULT NULL COMMENT '记录发生的时间',
  `expect_resoluted_time` datetime NULL DEFAULT NULL COMMENT '期望解决时间',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录描述',
  `if_expedited` int NULL DEFAULT NULL COMMENT '是否紧急(0,1）',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oversight_record
-- ----------------------------
INSERT INTO `oversight_record` VALUES (1, '老爹', '210100', 0, '2024-06-26 11:07:44', '2024-06-27 11:07:46', '成龙，快去帮老爹看看外面下没下雨', 1);
INSERT INTO `oversight_record` VALUES (2, '常璐', '210100', 1, '2024-06-26 09:43:52', '2024-06-27 15:52:07', '9RdZk5qgkw', 0);
INSERT INTO `oversight_record` VALUES (3, '沈震南', '210100', 0, '2024-06-26 15:02:37', '2024-06-27 15:10:29', 'fH0lraEm9V', 1);
INSERT INTO `oversight_record` VALUES (4, '邹岚', '210100', 1, '2024-06-26 15:39:19', '2024-06-28 14:32:14', 'fSaJ9XgQfv', 1);
INSERT INTO `oversight_record` VALUES (5, '严震南', '210100', 1, '2024-06-26 16:58:22', '2024-06-28 13:26:42', 'auojLdCzWm', 1);
INSERT INTO `oversight_record` VALUES (6, '萧子异', '210200', 1, '2024-06-26 15:23:21', '2024-06-27 10:22:10', 'Q5halQTt2b', 0);
INSERT INTO `oversight_record` VALUES (7, '呂詩君', '210200', 0, '2024-06-26 10:31:36', '2024-06-28 10:37:07', 'KPXwdYycMz', 1);
INSERT INTO `oversight_record` VALUES (8, '金安琪', '210200', 0, '2024-06-26 16:20:52', '2024-06-28 13:57:32', 'fceGXNilFv', 0);
INSERT INTO `oversight_record` VALUES (9, '林玲玲', '210200', 1, '2024-06-26 11:12:48', '2024-06-28 16:38:42', 'EX5WApVTww', 1);
INSERT INTO `oversight_record` VALUES (10, '黎小慧', '210200', 0, '2024-06-26 17:29:34', '2024-06-27 10:43:23', 'lwDHOvZma0', 0);
INSERT INTO `oversight_record` VALUES (11, '黄子异', '210200', 1, '2024-06-26 11:59:19', '2024-06-27 16:36:06', 'eYp53ZTXZG', 0);
INSERT INTO `oversight_record` VALUES (12, '阎震南', '210100', 0, '2024-06-26 16:35:00', '2024-06-27 11:59:47', 'h3ML6RNwEI', 1);
INSERT INTO `oversight_record` VALUES (13, '陈子异', '210200', 0, '2024-06-26 11:02:44', '2024-06-28 11:45:34', 'KTwXNj7yvY', 0);
INSERT INTO `oversight_record` VALUES (14, '王杰宏', '210300', 1, '2024-06-26 11:50:00', '2024-06-27 13:10:59', 'hQvF05VEGt', 0);
INSERT INTO `oversight_record` VALUES (15, '谢震南', '210400', 1, '2024-06-26 14:14:31', '2024-06-28 16:02:11', 'Fwx4KojZC6', 0);
INSERT INTO `oversight_record` VALUES (16, '胡秀英', '210500', 0, '2024-06-26 10:07:23', '2024-06-28 12:46:22', '1Av7gbFukm', 0);
INSERT INTO `oversight_record` VALUES (17, '邓震南', '210600', 0, '2024-06-26 10:28:49', '2024-06-28 11:53:49', 'HUdhL84fh8', 0);
INSERT INTO `oversight_record` VALUES (18, '郭璐', '210700', 0, '2024-06-26 11:21:35', '2024-06-27 16:38:25', 'VTBWF0Cpwm', 0);
INSERT INTO `oversight_record` VALUES (19, '萧晓明', '210800', 1, '2024-06-26 10:03:26', '2024-06-28 09:37:19', 'xoAR37gPDT', 0);
INSERT INTO `oversight_record` VALUES (20, '汪秀英', '210900', 0, '2024-06-26 16:45:58', '2024-06-28 14:15:43', 'lUPRgFN8Ly', 1);
INSERT INTO `oversight_record` VALUES (21, '许睿', '211000', 1, '2024-06-26 16:38:36', '2024-06-28 10:06:51', 'M85gq4gJwy', 1);
INSERT INTO `oversight_record` VALUES (22, '赵秀英', '211100', 0, '2024-06-26 14:19:46', '2024-06-27 12:22:16', 'PDJauArgVm', 0);
INSERT INTO `oversight_record` VALUES (23, '邹致远', '211200', 1, '2024-06-26 12:59:09', '2024-06-28 16:21:02', 'a2yU1QwAMx', 0);
INSERT INTO `oversight_record` VALUES (24, '袁安琪', '211300', 1, '2024-06-26 17:25:39', '2024-06-27 15:54:07', 'tfSP5UIjCz', 1);
INSERT INTO `oversight_record` VALUES (25, '钟震南', '211400', 0, '2024-06-26 09:23:39', '2024-06-27 17:17:59', '5erJY8OPy8', 1);
INSERT INTO `oversight_record` VALUES (26, '邵晓明', '210100', 1, '2024-06-26 09:15:49', '2024-06-28 11:29:12', 'O7lwlkzP9j', 0);
INSERT INTO `oversight_record` VALUES (27, '彭晓明', '210200', 1, '2024-06-26 10:28:09', '2024-06-28 10:45:05', 'U1R3unAowa', 0);
INSERT INTO `oversight_record` VALUES (28, '韩晓明', '210300', 1, '2024-06-26 16:29:40', '2024-06-28 11:13:45', 'YfagaOoYVg', 0);
INSERT INTO `oversight_record` VALUES (29, '陆秀英', '210400', 0, '2024-06-26 17:55:18', '2024-06-27 12:56:44', '8CGkL5FTae', 1);
INSERT INTO `oversight_record` VALUES (30, '韩云熙', '210500', 1, '2024-06-26 15:48:56', '2024-06-27 16:45:05', 'e9uxiQrV4Y', 1);
INSERT INTO `oversight_record` VALUES (31, '江秀英', '210600', 1, '2024-06-26 14:52:32', '2024-06-27 15:05:34', 'A4LCgZo9M2', 1);
INSERT INTO `oversight_record` VALUES (32, '唐子韬', '210700', 1, '2024-06-26 10:58:25', '2024-06-27 17:22:06', 'YZjRvjILQd', 1);
INSERT INTO `oversight_record` VALUES (33, '蒋子韬', '210800', 1, '2024-06-26 14:09:43', '2024-06-27 13:14:12', 'cm2V5wRt9h', 0);
INSERT INTO `oversight_record` VALUES (34, '史秀英', '210900', 1, '2024-06-26 12:59:54', '2024-06-28 15:38:51', '88qlvM3i6d', 0);
INSERT INTO `oversight_record` VALUES (35, '莫璐', '211000', 0, '2024-06-26 15:07:25', '2024-06-28 14:32:34', 'p7pWCvF27m', 0);
INSERT INTO `oversight_record` VALUES (36, '贺子韬', '211100', 1, '2024-06-26 11:38:12', '2024-06-28 10:57:18', 'BdeoIRZlBZ', 1);
INSERT INTO `oversight_record` VALUES (37, '任璐', '211200', 1, '2024-06-26 09:19:40', '2024-06-27 15:53:41', 'KEqFdp8Hzr', 0);
INSERT INTO `oversight_record` VALUES (38, '石子异', '211300', 0, '2024-06-26 09:54:06', '2024-06-28 16:38:33', 'om0XdT8wMO', 1);
INSERT INTO `oversight_record` VALUES (39, '姜嘉伦', '211400', 1, '2024-06-26 09:15:50', '2024-06-27 16:25:58', 'PmJHYU8qOL', 1);
INSERT INTO `oversight_record` VALUES (40, '韩璐', '210100', 1, '2024-06-26 11:50:09', '2024-06-28 10:38:27', 'APBALHfGxq', 0);
INSERT INTO `oversight_record` VALUES (41, '黄杰宏', '210200', 0, '2024-06-26 09:06:51', '2024-06-27 11:10:39', 'NPKQSoLe3y', 1);

-- ----------------------------
-- Table structure for oversight_work_order
-- ----------------------------
DROP TABLE IF EXISTS `oversight_work_order`;
CREATE TABLE `oversight_work_order`  (
  `work_order_id` int NOT NULL AUTO_INCREMENT COMMENT '工单的自增id',
  `state` int NULL DEFAULT NULL COMMENT '工单状态（0->已提交,1->已指派,2->已反馈,3->已取消）',
  `manager_work_number` int NULL DEFAULT NULL COMMENT '负责此工单的管理员的工号（谁指派',
  `grid_watcher_number` int NULL DEFAULT NULL COMMENT '网格观察员的工号（指派给谁',
  `grid_watcher_reply` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网格观察员的回复',
  `if_expedited` int NULL DEFAULT NULL COMMENT '是否加急（0,1）',
  `if_signed` int NULL DEFAULT NULL COMMENT '是否标记（0,1）',
  `record_id` int NULL DEFAULT NULL COMMENT '工单对应的监督信息',
  PRIMARY KEY (`work_order_id`) USING BTREE,
  INDEX `order_to_record`(`record_id` ASC) USING BTREE,
  CONSTRAINT `order_to_record` FOREIGN KEY (`record_id`) REFERENCES `oversight_record` (`record_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oversight_work_order
-- ----------------------------
INSERT INTO `oversight_work_order` VALUES (1, 1, -1, -1, '54xPzM9l4W', 1, 1, 1);
INSERT INTO `oversight_work_order` VALUES (2, 1, -1, -1, 'SVZ4uIHfRE', 0, 0, 2);
INSERT INTO `oversight_work_order` VALUES (3, 1, -1, -1, 'FrgaVYkds3', 0, 1, 3);
INSERT INTO `oversight_work_order` VALUES (4, 2, -1, -1, 'gSogtNQMqv', 0, 1, 4);
INSERT INTO `oversight_work_order` VALUES (5, 1, -1, -1, 'DNzwuFg3Ye', 1, 1, 5);
INSERT INTO `oversight_work_order` VALUES (6, 3, -1, -1, 'lZHPQ3EPBW', 0, 0, 6);
INSERT INTO `oversight_work_order` VALUES (7, 2, -1, -1, 'vckuY0975E', 0, 1, 7);
INSERT INTO `oversight_work_order` VALUES (8, 0, -1, -1, 'NjyEF5XRGz', 1, 0, 8);
INSERT INTO `oversight_work_order` VALUES (9, 3, -1, -1, 'BxsvctoNEi', 1, 1, 9);
INSERT INTO `oversight_work_order` VALUES (10, 3, -1, -1, '2pbllFh1nV', 0, 0, 10);
INSERT INTO `oversight_work_order` VALUES (11, 2, -1, -1, 'zhJSyIkKBG', 1, 0, 11);
INSERT INTO `oversight_work_order` VALUES (12, 3, -1, -1, '5AJ4lcE6xv', 1, 1, 12);
INSERT INTO `oversight_work_order` VALUES (13, 3, -1, -1, 'D13eUpm1Hb', 0, 0, 13);
INSERT INTO `oversight_work_order` VALUES (14, 0, -1, -1, 'SG4eMx8rF3', 1, 0, 14);
INSERT INTO `oversight_work_order` VALUES (15, 3, -1, -1, 'AzCuBQF9Kh', 0, 0, 15);
INSERT INTO `oversight_work_order` VALUES (16, 3, -1, -1, 'we1OE6LiEi', 1, 0, 16);
INSERT INTO `oversight_work_order` VALUES (17, 1, -1, -1, 'Sladn4MQkY', 1, 0, 17);
INSERT INTO `oversight_work_order` VALUES (18, 1, -1, -1, 'Hhq91018h1', 1, 0, 18);
INSERT INTO `oversight_work_order` VALUES (19, 1, -1, -1, 'QTTsyHF8v2', 1, 0, 19);
INSERT INTO `oversight_work_order` VALUES (20, 1, -1, -1, 'Wg5GPdjOs2', 1, 1, 20);
INSERT INTO `oversight_work_order` VALUES (21, 3, -1, -1, 'yZYZ1doVyL', 0, 1, 21);
INSERT INTO `oversight_work_order` VALUES (22, 3, -1, -1, 'jwSk04u5s8', 1, 0, 22);
INSERT INTO `oversight_work_order` VALUES (23, 3, -1, -1, 'T7KGIDBTQU', 1, 0, 23);
INSERT INTO `oversight_work_order` VALUES (24, 0, -1, -1, 'qDMKqF8Iwh', 1, 1, 24);
INSERT INTO `oversight_work_order` VALUES (25, 1, -1, -1, 'q7NVHzmmOF', 1, 1, 25);
INSERT INTO `oversight_work_order` VALUES (26, 1, -1, -1, '8F1U2KOCdp', 1, 0, 26);
INSERT INTO `oversight_work_order` VALUES (27, 3, -1, -1, 'V3aE2CPjur', 1, 0, 27);
INSERT INTO `oversight_work_order` VALUES (28, 1, -1, -1, 'Xw63rbDhDg', 0, 0, 28);
INSERT INTO `oversight_work_order` VALUES (29, 0, -1, -1, 'hCHqRKRm9Z', 1, 1, 29);
INSERT INTO `oversight_work_order` VALUES (30, 2, -1, -1, '5WjbCYuS73', 1, 1, 30);
INSERT INTO `oversight_work_order` VALUES (31, 2, -1, -1, 'pQMCY588nJ', 0, 1, 31);
INSERT INTO `oversight_work_order` VALUES (32, 1, -1, -1, 'LL83RaY0qJ', 1, 1, 32);
INSERT INTO `oversight_work_order` VALUES (33, 1, -1, -1, 'qMHFfirn3M', 1, 0, 33);
INSERT INTO `oversight_work_order` VALUES (34, 1, -1, -1, 'B1Ra9xcTt2', 0, 0, 34);
INSERT INTO `oversight_work_order` VALUES (35, 1, -1, -1, 'JXLmlgtlqP', 1, 0, 35);
INSERT INTO `oversight_work_order` VALUES (36, 3, -1, -1, 'TDivXjyjQo', 0, 1, 36);
INSERT INTO `oversight_work_order` VALUES (37, 3, -1, -1, 'wpUTBsYlfI', 1, 0, 37);
INSERT INTO `oversight_work_order` VALUES (38, 1, -1, -1, 'OPER5PpHzi', 0, 1, 38);
INSERT INTO `oversight_work_order` VALUES (39, 2, -1, -1, 'qPXrQZhfLP', 1, 1, 39);
INSERT INTO `oversight_work_order` VALUES (40, 1, -1, -1, 'KDMVad7Hmj', 0, 0, 40);
INSERT INTO `oversight_work_order` VALUES (41, 0, -1, -1, 'askdhkhaksd', 0, 1, 41);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '使用UUID工具类生成的32位用户编号，主要用于后端查找',
  `user_work_number` int NULL DEFAULT NULL COMMENT '工号，递增，前端封装(1->000001)',
  `user_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址，用户可使用邮箱登录',
  `user_phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码，用户可使用手机号登录',
  `user_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码，目前明文存储，后续会进行加密',
  `user_nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_role` int NULL DEFAULT NULL COMMENT '用户权限',
  `if_active` int NULL DEFAULT NULL COMMENT '此账号是否启用（1为启用，0不启用）',
  `user_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `user_gender` int NULL DEFAULT NULL COMMENT '性别',
  `user_age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_role`(`user_role` ASC) USING BTREE,
  CONSTRAINT `user_to_role` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority`  (
  `authority_id` int NOT NULL AUTO_INCREMENT COMMENT '用户权限的自增id',
  `authority_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `authority_status` int NULL DEFAULT NULL COMMENT '权限是否启用（0->不启用，1->启用）',
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_authority
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '用户角色的自增id',
  `role_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述（这个角色要干啥）',
  `role_status` int NULL DEFAULT NULL COMMENT '该角色是否启用（0->不启用，1->启用）',
  `sort` int NULL DEFAULT NULL COMMENT '角色优先级',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_role_authority_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_role_authority_relation`;
CREATE TABLE `user_role_authority_relation`  (
  `ra_relation_id` int NOT NULL AUTO_INCREMENT COMMENT '用户角色和用户权限关系的自增id',
  `role_id` int NULL DEFAULT NULL COMMENT '用户角色id（外键）',
  `authority_id` int NULL DEFAULT NULL COMMENT '用户权限id（外键）',
  PRIMARY KEY (`ra_relation_id`) USING BTREE,
  INDEX `role`(`role_id` ASC) USING BTREE,
  INDEX `authority`(`authority_id` ASC) USING BTREE,
  CONSTRAINT `authority` FOREIGN KEY (`authority_id`) REFERENCES `user_authority` (`authority_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role_authority_relation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

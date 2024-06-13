/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8.0
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : tadows_weather_system

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 13/06/2024 10:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aqi_data
-- ----------------------------
DROP TABLE IF EXISTS `aqi_data`;
CREATE TABLE `aqi_data`  (
  `aqi_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '某地AQI的id，UUID',
  `member_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录人员的id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `record_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `pm2d5` double NULL DEFAULT NULL COMMENT 'pm2.5含量',
  `pm10` double NULL DEFAULT NULL COMMENT 'pm10含量',
  `so2` double NULL DEFAULT NULL COMMENT '二氧化硫含量',
  `no2` double NULL DEFAULT NULL COMMENT '二氧化氮含量',
  `o3` double NULL DEFAULT NULL COMMENT '臭氧含量',
  PRIMARY KEY (`aqi_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aqi_data
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '使用UUID工具类生成的32位消息编号，主要用于后端查找',
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '该信息是公告中的第n条消息',
  `type` int NULL DEFAULT NULL COMMENT '消息的类型（待确定',
  `message_text` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息的文字内容',
  `message_image_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息附带的图片链接',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '使用UUID工具类生成的32位公告编号，主要用于后端查找',
  `header_image_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告附带的图片的链接，可能是服务器相对路径或者图床',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '公告发布时间（精确到秒）',
  `messages` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息的list，其中内容为该公告包含的所有消息的消息id',
  `type` int NULL DEFAULT NULL COMMENT '公告的类型（通知或动态），1->通知；2->动态',
  `if_important` int NULL DEFAULT NULL COMMENT '公告的位置',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_attachement
-- ----------------------------
DROP TABLE IF EXISTS `oversight_attachement`;
CREATE TABLE `oversight_attachement`  (
  `attachment_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录附件的id，32位UUID',
  `attachment_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件的路径或链接',
  PRIMARY KEY (`attachment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oversight_attachement
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_record
-- ----------------------------
DROP TABLE IF EXISTS `oversight_record`;
CREATE TABLE `oversight_record`  (
  `record_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '使用UUID工具类生成的32位监督记录编号，主要用于后端查找',
  `member_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监督员姓名',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进行记录的地址（监督员所在地址）',
  `type` int NULL DEFAULT NULL COMMENT '监督记录的种类',
  `occurrent_time` datetime NULL DEFAULT NULL COMMENT '记录发生的时间',
  `expect_resoluted_time` datetime NULL DEFAULT NULL COMMENT '期望解决时间',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录描述',
  `attachment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录的附件ID list，存储该记录下的图片（或视频）的链接',
  `if_expedited` int NULL DEFAULT NULL COMMENT '是否加快（？？？',
  `work_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录对应的工单id',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oversight_record
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_work_order
-- ----------------------------
DROP TABLE IF EXISTS `oversight_work_order`;
CREATE TABLE `oversight_work_order`  (
  `work_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '32位工单id，UUID自动生成',
  `state` int NULL DEFAULT NULL COMMENT '工单状态',
  `manager_work_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责此工单的员工的工号',
  `grid_watcher_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网格观察员的工号',
  `grid_watcher_reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网格观察员的回复',
  PRIMARY KEY (`work_order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oversight_work_order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '使用UUID工具类生成的32位用户编号，主要用于后端查找',
  `user_work_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号（varchar长度为255，不知道其含义，需要修改），递增',
  `user_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址，用户可使用邮箱登录',
  `user_phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码，用户可使用手机号登录',
  `user_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码，目前明文存储，后续会进行加密',
  `user_nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户权限',
  `if_active` int NULL DEFAULT NULL COMMENT '此账号是否启用（1为启用，0不启用）',
  `user_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `user_gender` int NULL DEFAULT NULL COMMENT '性别',
  `user_age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

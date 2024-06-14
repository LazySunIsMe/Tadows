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

 Date: 14/06/2024 12:03:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aqi_data
-- ----------------------------
DROP TABLE IF EXISTS `aqi_data`;
CREATE TABLE `aqi_data`  (
  `aqi_id` int NOT NULL COMMENT '某地AQI的自增id',
  `grid_watcher_number` int NULL DEFAULT NULL COMMENT '进行记录的网格员的工号',
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
  `message_id` int NOT NULL AUTO_INCREMENT COMMENT '自增的消息id',
  `notice_id` int NOT NULL COMMENT '该消息对应的公告(notice)id（外键）',
  `order` int NULL DEFAULT NULL COMMENT '该信息是公告中的第n条消息',
  `type` int NULL DEFAULT NULL COMMENT '消息的类型（0->文字,1->图片)，二者只能选其一',
  `message_text` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息的文字内容',
  `message_image_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息附带的图片链接',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `notice_message`(`notice_id` ASC) USING BTREE,
  CONSTRAINT `notice_message` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for oversight_attachement
-- ----------------------------
DROP TABLE IF EXISTS `oversight_attachement`;
CREATE TABLE `oversight_attachement`  (
  `attachment_id` int NOT NULL AUTO_INCREMENT COMMENT '记录监督附件的自增id',
  `record_id` int NOT NULL COMMENT '对应记录的id（外键）',
  `attachment_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件的路径或链接',
  PRIMARY KEY (`attachment_id`) USING BTREE,
  INDEX `record_acctachment`(`record_id` ASC) USING BTREE,
  CONSTRAINT `record_acctachment` FOREIGN KEY (`record_id`) REFERENCES `oversight_record` (`record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oversight_attachement
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
  `work_order_id` int NULL DEFAULT NULL COMMENT '记录对应的工单id',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `record_wo`(`work_order_id` ASC) USING BTREE,
  CONSTRAINT `record_wo` FOREIGN KEY (`work_order_id`) REFERENCES `oversight_work_order` (`work_order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oversight_record
-- ----------------------------

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
  INDEX `user_role`(`user_role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority`  (
  `authority_id` int NOT NULL COMMENT '用户权限的自增id',
  `authority_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `authority_status` int NULL DEFAULT NULL COMMENT '权限是否启用（0->不启用，1->启用）',
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_authority
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role_id` int NOT NULL COMMENT '用户角色的自增id',
  `role_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述（这个角色要干啥）',
  `role_status` int NULL DEFAULT NULL COMMENT '该角色是否启用（0->不启用，1->启用）',
  `sort` int NULL DEFAULT NULL COMMENT '角色优先级',
  PRIMARY KEY (`role_id`) USING BTREE,
  CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `user` (`user_role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_role_authority_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_role_authority_relation`;
CREATE TABLE `user_role_authority_relation`  (
  `ra_relation_id` int NOT NULL COMMENT '用户角色和用户权限关系的自增id',
  `role_id` int NULL DEFAULT NULL COMMENT '用户角色id（外键）',
  `authority_id` int NULL DEFAULT NULL COMMENT '用户权限id（外键）',
  PRIMARY KEY (`ra_relation_id`) USING BTREE,
  INDEX `role`(`role_id` ASC) USING BTREE,
  INDEX `authority`(`authority_id` ASC) USING BTREE,
  CONSTRAINT `authority` FOREIGN KEY (`authority_id`) REFERENCES `user_authority` (`authority_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role_authority_relation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

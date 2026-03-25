/*
 Navicat Premium Data Transfer

 Source Server         : 手拉手教学数据库
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : roomappoint

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/09/2024 09:52:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointrecord
-- ----------------------------
DROP TABLE IF EXISTS `appointrecord`;
CREATE TABLE `appointrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约记录主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `RoomId` int(11) NULL DEFAULT NULL COMMENT '自习室',
  `SeatId` int(11) NULL DEFAULT NULL COMMENT '座位',
  `UserId` int(11) NULL DEFAULT NULL COMMENT '预约人',
  `No` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '流水编号',
  `Phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `BeginTime` datetime(0) NULL DEFAULT NULL COMMENT '起始时间',
  `EndTime` datetime(0) NULL DEFAULT NULL COMMENT '截至时间',
  `CommentScore` double(20, 5) NULL DEFAULT NULL COMMENT '评分',
  `SComment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论',
  `AppointStatus` int(11) NULL DEFAULT NULL COMMENT '预约状态枚举',
  `AppointDateType` int(11) NULL DEFAULT NULL COMMENT '预约时间范围',
  `AppointDate` datetime(0) NULL DEFAULT NULL COMMENT '预约日期',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CreatorId`(`CreatorId`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  INDEX `RoomId`(`RoomId`) USING BTREE,
  INDEX `SeatId`(`SeatId`) USING BTREE,
  CONSTRAINT `appointrecord_ibfk_1` FOREIGN KEY (`CreatorId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `appointrecord_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `appointrecord_ibfk_3` FOREIGN KEY (`RoomId`) REFERENCES `room` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `appointrecord_ibfk_4` FOREIGN KEY (`SeatId`) REFERENCES `seat` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointrecord
-- ----------------------------
INSERT INTO `appointrecord` VALUES (1, '2024-08-15 10:57:06', 2, 1, 136, 2, 'D202408151057056464725', '18574774837', '测试', NULL, NULL, NULL, NULL, 5, 1, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (2, '2024-08-15 13:33:39', 2, 1, 136, 2, 'D202408151333389709036', '18574774833', '李子木', '2024-08-15 13:36:02', '2024-08-15 13:52:48', 5.00000, '这个环境真的是非常好', 3, 2, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (3, '2024-08-15 13:42:09', 2, 1, 137, 2, 'D202408151342092632397', '18574774837', '今昔', NULL, NULL, NULL, NULL, 4, 2, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (4, '2024-08-15 15:15:24', 2, 1, 136, 2, 'D20240815151524429617', '18574774837', '李白', '2024-08-15 15:15:43', '2024-08-15 15:15:53', 5.00000, '很好 下次在来！！！！', 3, 3, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (5, '2024-08-15 15:20:04', 2, 1, 138, 2, 'D20240815152003941644', '18574774833', '测试', NULL, NULL, NULL, NULL, 5, 2, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (6, '2024-08-15 15:20:50', 2, 1, 139, 2, 'D202408151520496043523', '18574774833', '李露露', NULL, NULL, NULL, NULL, 5, 2, '2024-08-15 00:00:00');
INSERT INTO `appointrecord` VALUES (7, '2024-08-16 13:56:47', 2, 1, 147, 2, 'D202408161356467677635', '18574774837', '测试', '2024-08-16 14:36:02', '2024-08-16 19:00:00', NULL, NULL, 6, 2, '2024-08-16 00:00:00');

-- ----------------------------
-- Table structure for appuser
-- ----------------------------
DROP TABLE IF EXISTS `appuser`;
CREATE TABLE `appuser`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `ImageUrls` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `RoleType` int(11) NULL DEFAULT NULL COMMENT '角色',
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `Email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `Birth` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `OverdueTimes` int(11) NULL DEFAULT NULL COMMENT '逾期次数',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appuser
-- ----------------------------
INSERT INTO `appuser` VALUES (1, '2024-08-13 23:00:58', 0, 'admin', '管理员', 'http://localhost:7245/1723603996718/24a7-52a54c327350fe430e27f8b5847a0bf5.jpg', 1, '18574774832', '519278989789@qq.com', 'admin', '2001-07-19 00:00:00', NULL);
INSERT INTO `appuser` VALUES (2, '2024-08-14 15:20:40', 0, 'test0001', '李小璐啊', 'http://localhost:7245/1723712277165/img2.jpg', 2, '18574774833', '896021790@qq.com', 'test0001', '2024-08-20 00:00:00', 0);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '封面主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `Remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CreatorId`(`CreatorId`) USING BTREE,
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`CreatorId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '2024-08-14 10:49:47', 1, 'http://localhost:7245/1723603777883/01e954ce4c2d4a74f6ef6d1c1cfb3617.jpg', '自习室封面');
INSERT INTO `banner` VALUES (2, '2024-08-14 10:50:44', 1, 'http://localhost:7245/1723603840618/126126.jpg', '自习室封面1');
INSERT INTO `banner` VALUES (3, '2024-08-14 10:50:47', 1, 'http://localhost:7245/1723603846466/2067d0f6-0eb7-49d9-93a8-b7a2dd94fe75.jpg', '自习室封面2');

-- ----------------------------
-- Table structure for integral
-- ----------------------------
DROP TABLE IF EXISTS `integral`;
CREATE TABLE `integral`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `UserId` int(11) NULL DEFAULT NULL COMMENT '用户',
  `IntegralValue` int(11) NULL DEFAULT NULL COMMENT '积分值',
  `Source` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '来源',
  `RelativeCode` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联号',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CreatorId`(`CreatorId`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  CONSTRAINT `integral_ibfk_1` FOREIGN KEY (`CreatorId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `integral_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 487 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of integral
-- ----------------------------
INSERT INTO `integral` VALUES (1, '2024-08-15 15:16:11', 2, '自习室评论评分获得积分+2', 2, 2, '自习室评论评分', 'D20240815151524429617');
INSERT INTO `integral` VALUES (2, '2024-08-15 16:43:46', 2, '逾期次数清零-2积分', 2, -2, '逾期次数清零', NULL);
INSERT INTO `integral` VALUES (3, '2024-08-15 16:48:49', 2, '每天登录赠送积分+2积分', 2, 2, '每天登录赠送积分', NULL);
INSERT INTO `integral` VALUES (4, '2024-08-15 17:00:46', 1, '每天登录赠送积分+2积分', 1, 2, '每天登录赠送积分', NULL);
INSERT INTO `integral` VALUES (5, '2024-08-16 13:27:29', 1, '每天登录赠送积分+2积分', 1, 2, '每天登录赠送积分', NULL);
INSERT INTO `integral` VALUES (6, '2024-08-16 13:54:36', 2, '每天登录赠送积分+2积分', 2, 2, '每天登录赠送积分', NULL);
INSERT INTO `integral` VALUES (7, '2024-08-16 17:33:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (133, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (134, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (135, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (136, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (137, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (138, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (139, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (140, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (141, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (142, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (143, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (144, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (145, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (146, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (147, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (148, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (149, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (150, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (151, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (152, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (153, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (154, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (155, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (156, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (157, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (158, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (159, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (160, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (161, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (162, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (163, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (164, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (165, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (166, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (167, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (168, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (169, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (170, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (171, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (172, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (173, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (174, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (175, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (176, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (177, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (178, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (179, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (180, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (181, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (182, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (183, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (184, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (185, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (186, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (187, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (188, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (189, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (190, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (191, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (192, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (193, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (194, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (195, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (196, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (197, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (198, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (199, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (200, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (201, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (202, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (203, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (204, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (205, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (206, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (207, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (208, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (209, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (210, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (211, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (212, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (213, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (214, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (215, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (216, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (217, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (218, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (219, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (220, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (221, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (222, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (223, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (224, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (225, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (226, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (227, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (228, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (229, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (230, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (231, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (232, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (233, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (234, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (235, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (236, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (237, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (238, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (239, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (240, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (241, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (242, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (243, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (244, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (245, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (246, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (247, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (248, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (249, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (250, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (251, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (252, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (253, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (254, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (255, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (256, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (257, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (258, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (259, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (260, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (261, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (262, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (263, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (264, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (265, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (266, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (267, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (268, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (269, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (270, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (271, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (272, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (273, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (274, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (275, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (276, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (277, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (278, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (279, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (280, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (281, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (282, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (283, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (284, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (285, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (286, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (287, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (288, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (289, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (290, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (291, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (292, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (293, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (294, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (295, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (296, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (297, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (298, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (299, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (300, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (301, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (302, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (303, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (304, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (305, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (306, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (307, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (308, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (309, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (310, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (311, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (312, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (313, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (314, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (315, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (316, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (317, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (318, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (319, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (320, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (321, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (322, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (323, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (324, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (325, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (326, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (327, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (328, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (329, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (330, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (331, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (332, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (333, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (334, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (335, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (336, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (337, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (338, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (339, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (340, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (341, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (342, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (343, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (344, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (345, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (346, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (347, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (348, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (349, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (350, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (351, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (352, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (353, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (354, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (355, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (356, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (357, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (358, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (359, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (360, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (361, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (362, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (363, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (364, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (365, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (366, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (367, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (368, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (369, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (370, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (371, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (372, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (373, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (374, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (375, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (376, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (377, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (378, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (379, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (380, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (381, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (382, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (383, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (384, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (385, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (386, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (387, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (388, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (389, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (390, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (391, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (392, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (393, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (394, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (395, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (396, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (397, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (398, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (399, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (400, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (401, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (402, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (403, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (404, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (405, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+10', 1, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (406, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (407, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+5', 1, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (408, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (409, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (410, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (411, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (412, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (413, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (414, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (415, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (416, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (417, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (418, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (419, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (420, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (421, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (422, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (423, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (424, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (425, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (426, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (427, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (428, '2024-08-16 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (429, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (430, '2024-08-15 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (431, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (432, '2024-08-14 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (433, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (434, '2024-08-13 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (435, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (436, '2024-08-12 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (437, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (438, '2024-08-11 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (439, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (440, '2024-08-10 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (441, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (442, '2024-08-09 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (443, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (444, '2024-08-08 00:00:00', NULL, '系统整点在线赠送积分+3', 2, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (445, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (446, '2024-08-07 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (447, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (448, '2024-08-06 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (449, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+7', 1, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (450, '2024-08-05 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (451, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (452, '2024-08-04 00:00:00', NULL, '系统整点在线赠送积分+10', 2, 10, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (453, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (454, '2024-08-03 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (455, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (456, '2024-08-02 00:00:00', NULL, '系统整点在线赠送积分+6', 2, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (457, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (458, '2024-08-01 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (459, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+4', 1, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (460, '2024-07-31 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (461, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (462, '2024-07-30 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (463, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (464, '2024-07-29 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (465, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+3', 1, 3, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (466, '2024-07-28 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (467, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (468, '2024-07-27 00:00:00', NULL, '系统整点在线赠送积分+4', 2, 4, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (469, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+8', 1, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (470, '2024-07-26 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (471, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (472, '2024-07-25 00:00:00', NULL, '系统整点在线赠送积分+9', 2, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (473, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (474, '2024-07-24 00:00:00', NULL, '系统整点在线赠送积分+5', 2, 5, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (475, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (476, '2024-07-23 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (477, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+2', 1, 2, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (478, '2024-07-22 00:00:00', NULL, '系统整点在线赠送积分+8', 2, 8, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (479, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+1', 1, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (480, '2024-07-21 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (481, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (482, '2024-07-20 00:00:00', NULL, '系统整点在线赠送积分+1', 2, 1, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (483, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+6', 1, 6, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (484, '2024-07-19 00:00:00', NULL, '系统整点在线赠送积分+7', 2, 7, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (485, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+9', 1, 9, '系统整点在线赠送积分', NULL);
INSERT INTO `integral` VALUES (486, '2024-07-18 00:00:00', NULL, '系统整点在线赠送积分+2', 2, 2, '系统整点在线赠送积分', NULL);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自习室主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `Address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '介绍',
  `EveryMonCancelCount` int(11) NULL DEFAULT NULL COMMENT '每月可取消次数',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CreatorId`(`CreatorId`) USING BTREE,
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`CreatorId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '2024-08-14 10:26:37', 1, '慧聚书院', 'http://localhost:7245/1723602282297/01e954ce4c2d4a74f6ef6d1c1cfb3617.jpg', '家里蹲大学崇学楼自习室A001', '<p>标题：大学自习室——知识的殿堂与心灵的港湾</p><p>在每所大学中，总有那么一个地方，它既是知识的殿堂，也是心灵的港湾。这个地方就是大学自习室。在这里，书籍的香气与思考的氛围交织在一起，为每一位求知者提供了一个静心学习、深入研究的环境。今天，就让我们一起走进大学自习室，探索它的奥秘与魅力。</p><p>一、环境介绍</p><p>大学自习室通常位于图书馆、教学楼或专门的学习中心内。它们被划分为不同的区域，以满足不同学生的需求。有的自习室注重安静，适合需要高度集中精神的同学；有的则略带一些轻松的氛围，供那些喜欢在轻松环境中学习的同学使用。每个座位都配备了必要的设施，如电源插座、无线网络和舒适的座椅，确保每位同学都能在最佳状态下学习。</p><p>二、功能特点</p><ol><li>学术氛围浓厚：大学自习室是学术交流的重要场所。在这里，你可以遇到志同道合的朋友，共同探讨学术问题，甚至合作完成课题研究。</li><li>资源丰富：自习室内不仅提供各类专业书籍、期刊，还配备有先进的电子设备，如电脑、打印机等，方便同学们查找资料、打印文件。</li><li>灵活自由：自习室通常实行开放管理，同学们可以根据自己的时间安排自由选择学习的地点和时间，充分保障了个人的学习自主权。</li></ol><p>三、使用规则</p><p>尽管自习室为同学们提供了极大的便利，但为了维护良好的学习环境，使用时仍需遵守一定的规则：</p><ol><li>保持安静：在自习室内请尽量保持安静，避免打扰他人学习。</li><li>爱护设施：妥善使用自习室内的各项设施，不随意搬动或损坏。</li><li>整洁卫生：保持个人座位的清洁，不在自习室内吃喝，营造一个整洁、健康的学习环境。</li></ol><p>四、文化意义</p><p>大学自习室不仅是学习的场所，更是校园文化的一部分。它见证了无数学子的成长与奋斗，承载着知识的传承与创新。在这里，每个人都能找到属于自己的位置，沉浸在知识的海洋中，享受学习的乐趣。</p><p>总结来说，大学自习室是一个集学习、交流、探索于一体的多功能空间。它以其独特的魅力吸引着每一位求知者，成为大学生活中不可或缺的一部分。在这里，我们不仅收获知识，更收获成长与友谊，共同书写着属于我们的青春篇章。</p><p><img src=\"http://localhost:7245/1723602395983/01e954ce4c2d4a74f6ef6d1c1cfb3617.jpg\"></p>', 2);
INSERT INTO `room` VALUES (2, '2024-08-15 14:49:25', 1, '静谧学府自习室', 'http://localhost:7245/1723704551903/63251251.jpg', '北京市海淀区学院路38号，蓝海大厦15层', '<p><span style=\"color: rgb(67, 67, 107);\">位于繁华的学院路旁，静谧学府自习室提供了一个安静且舒适的学习环境。内部装修以简洁明亮为主，配备有高速Wi-Fi、空气净化器以及宽敞的书桌。此外，自习室内设有休息区，供应咖啡和茶水，帮助学生在学习间隙放松身心。为了满足不同时间段的学习需求，自习室实行24小时开放制度，并配备了全天候安保监控，确保每位学习者的安全与隐私。无论是准备考试的学生还是寻求安静工作空间的专业人士，静谧学府都是一个理想的选择。</span></p>', 10);
INSERT INTO `room` VALUES (3, '2024-08-15 14:50:20', 1, '悦读空间自习室', 'http://localhost:7245/1723704607312/12612621.jpg', '上海市徐汇区漕溪北路45号，近地铁1号线徐家汇站，交通便利', '<p>悦读空间自习室位于繁华都市中的一片静谧之地，专注于为学生和白领提供集中学习与工作的优质环境。自习室的设计简约现代，室内布局合理，分为静音区与讨论区，满足不同学习需求。每个座位之间都配备了隔板，增加了私密性，同时提供足够的桌面空间，确保使用者可以舒适地展开资料或使用电脑。</p><p>静音区内装备有高效能的降噪材料，确保学习者不被外界噪音干扰。讨论区则略微宽松，允许小组讨论与合作，同时设有投影设备和白板，可用于小型研讨会或工作坊。</p><p>悦读空间自习室不仅提供高速无线网络覆盖，还配备有打印机、复印机等办公设备，方便用户处理紧急工作。此外，自习室内还有自动售卖机，供应简单的饮料与小食，满足长时间学习或工作时的基本需求。</p><p>为了营造良好的学习氛围，自习室还特别设计了绿植装饰，使整个空间更加生动，同时也有助于净化空气，创造一个健康的学习环境。安全方面，自习室安装了24小时监控摄像头，并有专职人员进行管理，确保每位用户的人身和财产安全。</p><p>总之，无论是在考试季加急复习的学生，还是需要安静工作环境的专业人士，悦读空间自习室都能提供一个理想的去处。开放时间灵活，从早上8点至晚上11点，方便各类用户根据自己的时间安排前来学习。</p>', 1);
INSERT INTO `room` VALUES (4, '2024-08-16 18:13:42', 1, '学海无涯自习室', 'http://localhost:7245/1723803213045/12126216.jpg', '广州市天河区珠江新城华夏路56号', '<p><span style=\"color: rgb(67, 67, 107);\">位于广州的商务中心区域，学海无涯自习室提供了多种学习空间选择，包括开放式学习区、私密隔间和可预订的研究室。自习室内部装饰以海洋蓝为主色调，营造出一种宁静深远的学习氛围。此外，定期举办的学术讲座和交流活动，为学习者提供了更广阔的知识视野。</span></p>', 2);
INSERT INTO `room` VALUES (5, '2024-08-16 18:13:56', 1, '智慧之光自习室', 'http://localhost:7245/1723803227881/1251562.jpg', '深圳市南山区科技中一路创新大厦B座', '<p><span style=\"color: rgb(67, 67, 107);\">智慧之光自习室是一个结合了现代科技与舒适环境的高级学习场所。每个座位都配备了智能台灯和人体工学椅，确保使用者的舒适度。自习室内设有咖啡吧和休息区，可供学习间隙放松身心。同时，通过APP预约系统，用户可以方便地预定自己的专属学习空间。</span></p>', 3);
INSERT INTO `room` VALUES (6, '2024-08-16 18:15:43', 1, '笔墨轩自习室', 'http://localhost:7245/1723803334471/23637347.jpg', '成都市锦江区红星路大慈寺街48号', '<p><span style=\"color: rgb(67, 67, 107);\">位于风景如画的成都老城区内，笔墨轩自习室提供了一个结合传统与现代的学习环境。内部装饰以古典文学为灵感，营造出一种温馨而宁静的氛围。自习室特色包括个人学习舱、阅读角和多功能学习区，满足不同学习者的需求。</span></p>', 3);
INSERT INTO `room` VALUES (7, '2024-08-16 18:16:00', 1, '学林小屋', 'http://localhost:7245/1723803347964/34743734.jpg', '杭州市西湖区文三路99号', '<p><span style=\"color: rgb(67, 67, 107);\">学林小屋藏身于杭州的学术氛围中，以其独特的自然元素设计和安静的环境吸引着众多学习爱好者。自习室拥有宽敞的书桌、舒适的椅子和高速的网络连接，为学生和专业人士提供了一个高效学习的空间。</span></p>', 3);
INSERT INTO `room` VALUES (8, '2024-08-16 18:16:14', 1, '筑梦空间', 'http://localhost:7245/1723803365841/34734743.jpg', '重庆市渝中区解放碑步行街2号', '<p><span style=\"color: rgb(67, 67, 107);\">位于繁华的解放碑商圈，筑梦空间自习室提供了一个时尚而舒适的学习环境。自习室内部设计现代，配备了高科技设施，如智能灯光系统和高效空气净化器，确保了访客的舒适和健康。</span></p>', 4);
INSERT INTO `room` VALUES (9, '2024-08-16 18:16:50', 1, '知识绿洲自习室', 'http://localhost:7245/1723803393089/34734734.jpg', '大连市沙河口区软件园路68号', '<p><span style=\"color: rgb(67, 67, 107);\">位于风景优美的软件园区内，知识绿洲自习室提供了一个与大自然紧密相连的学习环境。自习室设计注重环保和可持续性，大量使用自然光和室内植物，创造了一个健康、清新的学习空间。提供多样化的座位选择和快速稳定的网络连接，是追求绿色生活理念学习者的理想选择。</span></p>', 2);

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位主键',
  `CreationTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `No` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编号',
  `SRow` int(11) NULL DEFAULT NULL COMMENT '行',
  `SCol` int(11) NULL DEFAULT NULL COMMENT '列',
  `IsMaintain` tinyint(1) NULL DEFAULT NULL COMMENT '是否维修',
  `RoomId` int(11) NULL DEFAULT NULL COMMENT '自习室',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CreatorId`(`CreatorId`) USING BTREE,
  INDEX `RoomId`(`RoomId`) USING BTREE,
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`CreatorId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`RoomId`) REFERENCES `room` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 519 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES (136, '2024-08-14 16:54:35', 1, 'S-1-1', 1, 1, 0, 1);
INSERT INTO `seat` VALUES (137, '2024-08-14 16:54:35', 1, 'S-1-2', 1, 2, 0, 1);
INSERT INTO `seat` VALUES (138, '2024-08-14 16:54:35', 1, 'S-1-3', 1, 3, 0, 1);
INSERT INTO `seat` VALUES (139, '2024-08-14 16:54:35', 1, 'S-1-4', 1, 4, 0, 1);
INSERT INTO `seat` VALUES (140, '2024-08-14 16:54:35', 1, 'S-1-5', 1, 5, 0, 1);
INSERT INTO `seat` VALUES (141, '2024-08-14 16:54:35', 1, 'S-1-6', 1, 6, 0, 1);
INSERT INTO `seat` VALUES (142, '2024-08-14 16:54:35', 1, 'S-1-7', 1, 7, 0, 1);
INSERT INTO `seat` VALUES (143, '2024-08-14 16:54:35', 1, 'S-1-8', 1, 8, 0, 1);
INSERT INTO `seat` VALUES (144, '2024-08-14 16:54:35', 1, 'S-1-9', 1, 9, 0, 1);
INSERT INTO `seat` VALUES (145, '2024-08-14 16:54:35', 1, 'S-2-1', 2, 1, 0, 1);
INSERT INTO `seat` VALUES (146, '2024-08-14 16:54:35', 1, 'S-2-2', 2, 2, 0, 1);
INSERT INTO `seat` VALUES (147, '2024-08-14 16:54:35', 1, 'S-2-3', 2, 3, 0, 1);
INSERT INTO `seat` VALUES (148, '2024-08-14 16:54:35', 1, 'S-2-4', 2, 4, 0, 1);
INSERT INTO `seat` VALUES (149, '2024-08-14 16:54:35', 1, 'S-2-5', 2, 5, 0, 1);
INSERT INTO `seat` VALUES (151, '2024-08-14 16:54:35', 1, 'S-2-7', 2, 7, 0, 1);
INSERT INTO `seat` VALUES (152, '2024-08-14 16:54:35', 1, 'S-2-8', 2, 8, 0, 1);
INSERT INTO `seat` VALUES (153, '2024-08-14 16:54:35', 1, 'S-2-9', 2, 9, 0, 1);
INSERT INTO `seat` VALUES (154, '2024-08-14 16:54:35', 1, 'S-3-1', 3, 1, 0, 1);
INSERT INTO `seat` VALUES (155, '2024-08-14 16:54:35', 1, 'S-3-2', 3, 2, 0, 1);
INSERT INTO `seat` VALUES (156, '2024-08-14 16:54:35', 1, 'S-3-3', 3, 3, 0, 1);
INSERT INTO `seat` VALUES (157, '2024-08-14 16:54:35', 1, 'S-3-4', 3, 4, 0, 1);
INSERT INTO `seat` VALUES (158, '2024-08-14 16:54:35', 1, 'S-3-5', 3, 5, 0, 1);
INSERT INTO `seat` VALUES (159, '2024-08-14 16:54:35', 1, 'S-3-6', 3, 6, 0, 1);
INSERT INTO `seat` VALUES (160, '2024-08-14 16:54:35', 1, 'S-3-7', 3, 7, 0, 1);
INSERT INTO `seat` VALUES (161, '2024-08-14 16:54:35', 1, 'S-3-8', 3, 8, 0, 1);
INSERT INTO `seat` VALUES (162, '2024-08-14 16:54:35', 1, 'S-3-9', 3, 9, 0, 1);
INSERT INTO `seat` VALUES (163, '2024-08-14 16:54:35', 1, 'S-4-1', 4, 1, 0, 1);
INSERT INTO `seat` VALUES (164, '2024-08-14 16:54:35', 1, 'S-4-2', 4, 2, 0, 1);
INSERT INTO `seat` VALUES (165, '2024-08-14 16:54:35', 1, 'S-4-3', 4, 3, 0, 1);
INSERT INTO `seat` VALUES (166, '2024-08-14 16:54:35', 1, 'S-4-4', 4, 4, 0, 1);
INSERT INTO `seat` VALUES (167, '2024-08-14 16:54:35', 1, 'S-4-5', 4, 5, 0, 1);
INSERT INTO `seat` VALUES (168, '2024-08-14 16:54:35', 1, 'S-4-6', 4, 6, 0, 1);
INSERT INTO `seat` VALUES (169, '2024-08-14 16:54:35', 1, 'S-4-7', 4, 7, 0, 1);
INSERT INTO `seat` VALUES (170, '2024-08-14 16:54:35', 1, 'S-4-8', 4, 8, 0, 1);
INSERT INTO `seat` VALUES (171, '2024-08-14 16:54:35', 1, 'S-4-9', 4, 9, 0, 1);
INSERT INTO `seat` VALUES (172, '2024-08-14 16:54:35', 1, 'S-5-1', 5, 1, 0, 1);
INSERT INTO `seat` VALUES (173, '2024-08-14 16:54:35', 1, 'S-5-2', 5, 2, 0, 1);
INSERT INTO `seat` VALUES (174, '2024-08-14 16:54:35', 1, 'S-5-3', 5, 3, 0, 1);
INSERT INTO `seat` VALUES (175, '2024-08-14 16:54:35', 1, 'S-5-4', 5, 4, 0, 1);
INSERT INTO `seat` VALUES (176, '2024-08-14 16:54:35', 1, 'S-5-5', 5, 5, 0, 1);
INSERT INTO `seat` VALUES (177, '2024-08-14 16:54:35', 1, 'S-5-6', 5, 6, 0, 1);
INSERT INTO `seat` VALUES (178, '2024-08-14 16:54:35', 1, 'S-5-7', 5, 7, 0, 1);
INSERT INTO `seat` VALUES (179, '2024-08-14 16:54:35', 1, 'S-5-8', 5, 8, 0, 1);
INSERT INTO `seat` VALUES (180, '2024-08-14 16:54:35', 1, 'S-5-9', 5, 9, 0, 1);
INSERT INTO `seat` VALUES (181, '2024-08-14 16:54:35', 1, 'S-6-1', 6, 1, 0, 1);
INSERT INTO `seat` VALUES (182, '2024-08-14 16:54:35', 1, 'S-6-2', 6, 2, 0, 1);
INSERT INTO `seat` VALUES (183, '2024-08-14 16:54:35', 1, 'S-6-3', 6, 3, 0, 1);
INSERT INTO `seat` VALUES (184, '2024-08-14 16:54:35', 1, 'S-6-4', 6, 4, 0, 1);
INSERT INTO `seat` VALUES (185, '2024-08-14 16:54:35', 1, 'S-6-5', 6, 5, 0, 1);
INSERT INTO `seat` VALUES (186, '2024-08-14 16:54:35', 1, 'S-6-6', 6, 6, 0, 1);
INSERT INTO `seat` VALUES (187, '2024-08-14 16:54:35', 1, 'S-6-7', 6, 7, 0, 1);
INSERT INTO `seat` VALUES (188, '2024-08-14 16:54:35', 1, 'S-6-8', 6, 8, 0, 1);
INSERT INTO `seat` VALUES (189, '2024-08-14 16:54:35', 1, 'S-6-9', 6, 9, 0, 1);
INSERT INTO `seat` VALUES (190, '2024-08-14 16:54:35', 1, 'S-7-1', 7, 1, 0, 1);
INSERT INTO `seat` VALUES (191, '2024-08-14 16:54:35', 1, 'S-7-2', 7, 2, 0, 1);
INSERT INTO `seat` VALUES (192, '2024-08-14 16:54:35', 1, 'S-7-3', 7, 3, 0, 1);
INSERT INTO `seat` VALUES (193, '2024-08-14 16:54:35', 1, 'S-7-4', 7, 4, 0, 1);
INSERT INTO `seat` VALUES (194, '2024-08-14 16:54:35', 1, 'S-7-5', 7, 5, 0, 1);
INSERT INTO `seat` VALUES (195, '2024-08-14 16:54:35', 1, 'S-7-6', 7, 6, 0, 1);
INSERT INTO `seat` VALUES (196, '2024-08-14 16:54:35', 1, 'S-7-7', 7, 7, 0, 1);
INSERT INTO `seat` VALUES (197, '2024-08-14 16:54:35', 1, 'S-7-8', 7, 8, 0, 1);
INSERT INTO `seat` VALUES (198, '2024-08-14 16:54:35', 1, 'S-7-9', 7, 9, 0, 1);
INSERT INTO `seat` VALUES (199, '2024-08-14 16:54:35', 1, 'S-8-1', 8, 1, 0, 1);
INSERT INTO `seat` VALUES (200, '2024-08-14 16:54:35', 1, 'S-8-2', 8, 2, 0, 1);
INSERT INTO `seat` VALUES (201, '2024-08-14 16:54:35', 1, 'S-8-3', 8, 3, 0, 1);
INSERT INTO `seat` VALUES (202, '2024-08-14 16:54:35', 1, 'S-8-4', 8, 4, 0, 1);
INSERT INTO `seat` VALUES (203, '2024-08-14 16:54:35', 1, 'S-8-5', 8, 5, 0, 1);
INSERT INTO `seat` VALUES (204, '2024-08-14 16:54:35', 1, 'S-8-6', 8, 6, 0, 1);
INSERT INTO `seat` VALUES (205, '2024-08-14 16:54:35', 1, 'S-8-7', 8, 7, 0, 1);
INSERT INTO `seat` VALUES (206, '2024-08-14 16:54:35', 1, 'S-8-8', 8, 8, 0, 1);
INSERT INTO `seat` VALUES (207, '2024-08-14 16:54:35', 1, 'S-8-9', 8, 9, 0, 1);
INSERT INTO `seat` VALUES (208, '2024-08-14 16:54:35', 1, 'S-9-1', 9, 1, 0, 1);
INSERT INTO `seat` VALUES (209, '2024-08-14 16:54:35', 1, 'S-9-2', 9, 2, 0, 1);
INSERT INTO `seat` VALUES (210, '2024-08-14 16:54:35', 1, 'S-9-3', 9, 3, 0, 1);
INSERT INTO `seat` VALUES (211, '2024-08-14 16:54:35', 1, 'S-9-4', 9, 4, 0, 1);
INSERT INTO `seat` VALUES (212, '2024-08-14 16:54:35', 1, 'S-9-5', 9, 5, 0, 1);
INSERT INTO `seat` VALUES (213, '2024-08-14 16:54:35', 1, 'S-9-6', 9, 6, 0, 1);
INSERT INTO `seat` VALUES (214, '2024-08-14 16:54:35', 1, 'S-9-7', 9, 7, 0, 1);
INSERT INTO `seat` VALUES (215, '2024-08-14 16:54:35', 1, 'S-9-8', 9, 8, 0, 1);
INSERT INTO `seat` VALUES (216, '2024-08-14 16:54:35', 1, 'S-9-9', 9, 9, 0, 1);
INSERT INTO `seat` VALUES (217, '2024-08-15 15:24:09', 1, 'S-1-1', 1, 1, 1, 2);
INSERT INTO `seat` VALUES (218, '2024-08-15 15:24:09', 1, 'S-1-2', 1, 2, 1, 2);
INSERT INTO `seat` VALUES (219, '2024-08-15 15:24:09', 1, 'S-1-3', 1, 3, 1, 2);
INSERT INTO `seat` VALUES (220, '2024-08-15 15:24:09', 1, 'S-1-4', 1, 4, 1, 2);
INSERT INTO `seat` VALUES (221, '2024-08-15 15:24:09', 1, 'S-1-5', 1, 5, 1, 2);
INSERT INTO `seat` VALUES (222, '2024-08-15 15:24:09', 1, 'S-1-6', 1, 6, 1, 2);
INSERT INTO `seat` VALUES (223, '2024-08-15 15:24:09', 1, 'S-1-7', 1, 7, 1, 2);
INSERT INTO `seat` VALUES (224, '2024-08-15 15:24:09', 1, 'S-1-8', 1, 8, 1, 2);
INSERT INTO `seat` VALUES (225, '2024-08-15 15:24:09', 1, 'S-1-9', 1, 9, 1, 2);
INSERT INTO `seat` VALUES (226, '2024-08-15 15:24:09', 1, 'S-2-1', 2, 1, 1, 2);
INSERT INTO `seat` VALUES (227, '2024-08-15 15:24:09', 1, 'S-2-2', 2, 2, 1, 2);
INSERT INTO `seat` VALUES (228, '2024-08-15 15:24:09', 1, 'S-2-3', 2, 3, 1, 2);
INSERT INTO `seat` VALUES (229, '2024-08-15 15:24:09', 1, 'S-2-4', 2, 4, 1, 2);
INSERT INTO `seat` VALUES (230, '2024-08-15 15:24:09', 1, 'S-2-5', 2, 5, 1, 2);
INSERT INTO `seat` VALUES (231, '2024-08-15 15:24:09', 1, 'S-2-6', 2, 6, 1, 2);
INSERT INTO `seat` VALUES (232, '2024-08-15 15:24:09', 1, 'S-2-7', 2, 7, 1, 2);
INSERT INTO `seat` VALUES (233, '2024-08-15 15:24:09', 1, 'S-2-8', 2, 8, 1, 2);
INSERT INTO `seat` VALUES (234, '2024-08-15 15:24:09', 1, 'S-2-9', 2, 9, 1, 2);
INSERT INTO `seat` VALUES (235, '2024-08-15 15:24:09', 1, 'S-3-1', 3, 1, 1, 2);
INSERT INTO `seat` VALUES (236, '2024-08-15 15:24:09', 1, 'S-3-2', 3, 2, 1, 2);
INSERT INTO `seat` VALUES (237, '2024-08-15 15:24:09', 1, 'S-3-3', 3, 3, 1, 2);
INSERT INTO `seat` VALUES (238, '2024-08-15 15:24:09', 1, 'S-3-4', 3, 4, 1, 2);
INSERT INTO `seat` VALUES (239, '2024-08-15 15:24:09', 1, 'S-3-5', 3, 5, 1, 2);
INSERT INTO `seat` VALUES (240, '2024-08-15 15:24:09', 1, 'S-3-6', 3, 6, 1, 2);
INSERT INTO `seat` VALUES (241, '2024-08-15 15:24:09', 1, 'S-3-7', 3, 7, 1, 2);
INSERT INTO `seat` VALUES (242, '2024-08-15 15:24:09', 1, 'S-3-8', 3, 8, 1, 2);
INSERT INTO `seat` VALUES (243, '2024-08-15 15:24:09', 1, 'S-3-9', 3, 9, 1, 2);
INSERT INTO `seat` VALUES (244, '2024-08-15 15:24:09', 1, 'S-4-1', 4, 1, 1, 2);
INSERT INTO `seat` VALUES (245, '2024-08-15 15:24:09', 1, 'S-4-2', 4, 2, 1, 2);
INSERT INTO `seat` VALUES (246, '2024-08-15 15:24:09', 1, 'S-4-3', 4, 3, 1, 2);
INSERT INTO `seat` VALUES (247, '2024-08-15 15:24:09', 1, 'S-4-4', 4, 4, 1, 2);
INSERT INTO `seat` VALUES (248, '2024-08-15 15:24:09', 1, 'S-4-5', 4, 5, 1, 2);
INSERT INTO `seat` VALUES (249, '2024-08-15 15:24:09', 1, 'S-4-6', 4, 6, 1, 2);
INSERT INTO `seat` VALUES (250, '2024-08-15 15:24:09', 1, 'S-4-7', 4, 7, 1, 2);
INSERT INTO `seat` VALUES (251, '2024-08-15 15:24:09', 1, 'S-4-8', 4, 8, 1, 2);
INSERT INTO `seat` VALUES (252, '2024-08-15 15:24:09', 1, 'S-4-9', 4, 9, 1, 2);
INSERT INTO `seat` VALUES (253, '2024-08-15 15:24:09', 1, 'S-5-1', 5, 1, 1, 2);
INSERT INTO `seat` VALUES (254, '2024-08-15 15:24:09', 1, 'S-5-2', 5, 2, 1, 2);
INSERT INTO `seat` VALUES (255, '2024-08-15 15:24:09', 1, 'S-5-3', 5, 3, 1, 2);
INSERT INTO `seat` VALUES (256, '2024-08-15 15:24:09', 1, 'S-5-4', 5, 4, 1, 2);
INSERT INTO `seat` VALUES (257, '2024-08-15 15:24:09', 1, 'S-5-5', 5, 5, 1, 2);
INSERT INTO `seat` VALUES (258, '2024-08-15 15:24:09', 1, 'S-5-6', 5, 6, 1, 2);
INSERT INTO `seat` VALUES (259, '2024-08-15 15:24:09', 1, 'S-5-7', 5, 7, 1, 2);
INSERT INTO `seat` VALUES (260, '2024-08-15 15:24:09', 1, 'S-5-8', 5, 8, 1, 2);
INSERT INTO `seat` VALUES (261, '2024-08-15 15:24:09', 1, 'S-5-9', 5, 9, 1, 2);
INSERT INTO `seat` VALUES (262, '2024-08-15 15:24:09', 1, 'S-6-1', 6, 1, 1, 2);
INSERT INTO `seat` VALUES (263, '2024-08-15 15:24:09', 1, 'S-6-2', 6, 2, 1, 2);
INSERT INTO `seat` VALUES (264, '2024-08-15 15:24:09', 1, 'S-6-3', 6, 3, 1, 2);
INSERT INTO `seat` VALUES (265, '2024-08-15 15:24:09', 1, 'S-6-4', 6, 4, 1, 2);
INSERT INTO `seat` VALUES (266, '2024-08-15 15:24:09', 1, 'S-6-5', 6, 5, 1, 2);
INSERT INTO `seat` VALUES (267, '2024-08-15 15:24:09', 1, 'S-6-6', 6, 6, 1, 2);
INSERT INTO `seat` VALUES (268, '2024-08-15 15:24:09', 1, 'S-6-7', 6, 7, 1, 2);
INSERT INTO `seat` VALUES (269, '2024-08-15 15:24:09', 1, 'S-6-8', 6, 8, 1, 2);
INSERT INTO `seat` VALUES (270, '2024-08-15 15:24:09', 1, 'S-6-9', 6, 9, 1, 2);
INSERT INTO `seat` VALUES (271, '2024-08-15 15:24:09', 1, 'S-7-1', 7, 1, 1, 2);
INSERT INTO `seat` VALUES (272, '2024-08-15 15:24:09', 1, 'S-7-2', 7, 2, 1, 2);
INSERT INTO `seat` VALUES (273, '2024-08-15 15:24:09', 1, 'S-7-3', 7, 3, 1, 2);
INSERT INTO `seat` VALUES (274, '2024-08-15 15:24:09', 1, 'S-7-4', 7, 4, 1, 2);
INSERT INTO `seat` VALUES (275, '2024-08-15 15:24:09', 1, 'S-7-5', 7, 5, 1, 2);
INSERT INTO `seat` VALUES (276, '2024-08-15 15:24:09', 1, 'S-7-6', 7, 6, 1, 2);
INSERT INTO `seat` VALUES (277, '2024-08-15 15:24:09', 1, 'S-7-7', 7, 7, 1, 2);
INSERT INTO `seat` VALUES (278, '2024-08-15 15:24:09', 1, 'S-7-8', 7, 8, 1, 2);
INSERT INTO `seat` VALUES (279, '2024-08-15 15:24:09', 1, 'S-7-9', 7, 9, 1, 2);
INSERT INTO `seat` VALUES (280, '2024-08-15 15:24:09', 1, 'S-8-1', 8, 1, 1, 2);
INSERT INTO `seat` VALUES (281, '2024-08-15 15:24:09', 1, 'S-8-2', 8, 2, 1, 2);
INSERT INTO `seat` VALUES (282, '2024-08-15 15:24:09', 1, 'S-8-3', 8, 3, 1, 2);
INSERT INTO `seat` VALUES (283, '2024-08-15 15:24:09', 1, 'S-8-4', 8, 4, 1, 2);
INSERT INTO `seat` VALUES (284, '2024-08-15 15:24:09', 1, 'S-8-5', 8, 5, 1, 2);
INSERT INTO `seat` VALUES (285, '2024-08-15 15:24:09', 1, 'S-8-6', 8, 6, 1, 2);
INSERT INTO `seat` VALUES (286, '2024-08-15 15:24:09', 1, 'S-8-7', 8, 7, 1, 2);
INSERT INTO `seat` VALUES (287, '2024-08-15 15:24:09', 1, 'S-8-8', 8, 8, 1, 2);
INSERT INTO `seat` VALUES (288, '2024-08-15 15:24:09', 1, 'S-8-9', 8, 9, 1, 2);
INSERT INTO `seat` VALUES (289, '2024-08-15 15:24:09', 1, 'S-9-1', 9, 1, 1, 2);
INSERT INTO `seat` VALUES (290, '2024-08-15 15:24:09', 1, 'S-9-2', 9, 2, 1, 2);
INSERT INTO `seat` VALUES (291, '2024-08-15 15:24:09', 1, 'S-9-3', 9, 3, 1, 2);
INSERT INTO `seat` VALUES (292, '2024-08-15 15:24:09', 1, 'S-9-4', 9, 4, 1, 2);
INSERT INTO `seat` VALUES (293, '2024-08-15 15:24:09', 1, 'S-9-5', 9, 5, 1, 2);
INSERT INTO `seat` VALUES (294, '2024-08-15 15:24:09', 1, 'S-9-6', 9, 6, 1, 2);
INSERT INTO `seat` VALUES (295, '2024-08-15 15:24:09', 1, 'S-9-7', 9, 7, 1, 2);
INSERT INTO `seat` VALUES (296, '2024-08-15 15:24:09', 1, 'S-9-8', 9, 8, 1, 2);
INSERT INTO `seat` VALUES (297, '2024-08-15 15:24:09', 1, 'S-9-9', 9, 9, 1, 2);
INSERT INTO `seat` VALUES (298, '2024-08-16 18:17:23', 1, 'S-1-1', 1, 1, 1, 9);
INSERT INTO `seat` VALUES (299, '2024-08-16 18:17:23', 1, 'S-1-2', 1, 2, 1, 9);
INSERT INTO `seat` VALUES (300, '2024-08-16 18:17:23', 1, 'S-1-3', 1, 3, 1, 9);
INSERT INTO `seat` VALUES (301, '2024-08-16 18:17:23', 1, 'S-1-4', 1, 4, 1, 9);
INSERT INTO `seat` VALUES (302, '2024-08-16 18:17:23', 1, 'S-1-5', 1, 5, 1, 9);
INSERT INTO `seat` VALUES (303, '2024-08-16 18:17:23', 1, 'S-1-6', 1, 6, 1, 9);
INSERT INTO `seat` VALUES (304, '2024-08-16 18:17:23', 1, 'S-2-1', 2, 1, 1, 9);
INSERT INTO `seat` VALUES (305, '2024-08-16 18:17:23', 1, 'S-2-2', 2, 2, 1, 9);
INSERT INTO `seat` VALUES (306, '2024-08-16 18:17:23', 1, 'S-2-3', 2, 3, 1, 9);
INSERT INTO `seat` VALUES (307, '2024-08-16 18:17:23', 1, 'S-2-4', 2, 4, 1, 9);
INSERT INTO `seat` VALUES (308, '2024-08-16 18:17:23', 1, 'S-2-5', 2, 5, 1, 9);
INSERT INTO `seat` VALUES (309, '2024-08-16 18:17:23', 1, 'S-2-6', 2, 6, 1, 9);
INSERT INTO `seat` VALUES (310, '2024-08-16 18:17:23', 1, 'S-3-1', 3, 1, 1, 9);
INSERT INTO `seat` VALUES (311, '2024-08-16 18:17:23', 1, 'S-3-2', 3, 2, 1, 9);
INSERT INTO `seat` VALUES (312, '2024-08-16 18:17:23', 1, 'S-3-3', 3, 3, 1, 9);
INSERT INTO `seat` VALUES (313, '2024-08-16 18:17:23', 1, 'S-3-4', 3, 4, 1, 9);
INSERT INTO `seat` VALUES (314, '2024-08-16 18:17:23', 1, 'S-3-5', 3, 5, 1, 9);
INSERT INTO `seat` VALUES (315, '2024-08-16 18:17:23', 1, 'S-3-6', 3, 6, 1, 9);
INSERT INTO `seat` VALUES (316, '2024-08-16 18:17:23', 1, 'S-4-1', 4, 1, 1, 9);
INSERT INTO `seat` VALUES (317, '2024-08-16 18:17:23', 1, 'S-4-2', 4, 2, 1, 9);
INSERT INTO `seat` VALUES (318, '2024-08-16 18:17:23', 1, 'S-4-3', 4, 3, 1, 9);
INSERT INTO `seat` VALUES (319, '2024-08-16 18:17:23', 1, 'S-4-4', 4, 4, 1, 9);
INSERT INTO `seat` VALUES (320, '2024-08-16 18:17:23', 1, 'S-4-5', 4, 5, 1, 9);
INSERT INTO `seat` VALUES (321, '2024-08-16 18:17:23', 1, 'S-4-6', 4, 6, 1, 9);
INSERT INTO `seat` VALUES (322, '2024-08-16 18:17:23', 1, 'S-5-1', 5, 1, 1, 9);
INSERT INTO `seat` VALUES (323, '2024-08-16 18:17:23', 1, 'S-5-2', 5, 2, 1, 9);
INSERT INTO `seat` VALUES (324, '2024-08-16 18:17:23', 1, 'S-5-3', 5, 3, 1, 9);
INSERT INTO `seat` VALUES (325, '2024-08-16 18:17:23', 1, 'S-5-4', 5, 4, 1, 9);
INSERT INTO `seat` VALUES (326, '2024-08-16 18:17:23', 1, 'S-5-5', 5, 5, 1, 9);
INSERT INTO `seat` VALUES (327, '2024-08-16 18:17:23', 1, 'S-5-6', 5, 6, 1, 9);
INSERT INTO `seat` VALUES (328, '2024-08-16 18:17:23', 1, 'S-6-1', 6, 1, 1, 9);
INSERT INTO `seat` VALUES (329, '2024-08-16 18:17:23', 1, 'S-6-2', 6, 2, 1, 9);
INSERT INTO `seat` VALUES (330, '2024-08-16 18:17:23', 1, 'S-6-3', 6, 3, 1, 9);
INSERT INTO `seat` VALUES (331, '2024-08-16 18:17:23', 1, 'S-6-4', 6, 4, 1, 9);
INSERT INTO `seat` VALUES (332, '2024-08-16 18:17:23', 1, 'S-6-5', 6, 5, 1, 9);
INSERT INTO `seat` VALUES (333, '2024-08-16 18:17:23', 1, 'S-6-6', 6, 6, 1, 9);
INSERT INTO `seat` VALUES (334, '2024-08-16 18:17:35', 1, 'S-1-1', 1, 1, 1, 6);
INSERT INTO `seat` VALUES (335, '2024-08-16 18:17:35', 1, 'S-1-2', 1, 2, 1, 6);
INSERT INTO `seat` VALUES (336, '2024-08-16 18:17:35', 1, 'S-1-3', 1, 3, 1, 6);
INSERT INTO `seat` VALUES (337, '2024-08-16 18:17:35', 1, 'S-1-4', 1, 4, 1, 6);
INSERT INTO `seat` VALUES (338, '2024-08-16 18:17:35', 1, 'S-1-5', 1, 5, 1, 6);
INSERT INTO `seat` VALUES (339, '2024-08-16 18:17:35', 1, 'S-2-1', 2, 1, 1, 6);
INSERT INTO `seat` VALUES (340, '2024-08-16 18:17:35', 1, 'S-2-2', 2, 2, 1, 6);
INSERT INTO `seat` VALUES (341, '2024-08-16 18:17:35', 1, 'S-2-3', 2, 3, 1, 6);
INSERT INTO `seat` VALUES (342, '2024-08-16 18:17:35', 1, 'S-2-4', 2, 4, 1, 6);
INSERT INTO `seat` VALUES (343, '2024-08-16 18:17:35', 1, 'S-2-5', 2, 5, 1, 6);
INSERT INTO `seat` VALUES (344, '2024-08-16 18:17:35', 1, 'S-3-1', 3, 1, 1, 6);
INSERT INTO `seat` VALUES (345, '2024-08-16 18:17:35', 1, 'S-3-2', 3, 2, 1, 6);
INSERT INTO `seat` VALUES (346, '2024-08-16 18:17:35', 1, 'S-3-3', 3, 3, 1, 6);
INSERT INTO `seat` VALUES (347, '2024-08-16 18:17:35', 1, 'S-3-4', 3, 4, 1, 6);
INSERT INTO `seat` VALUES (348, '2024-08-16 18:17:35', 1, 'S-3-5', 3, 5, 1, 6);
INSERT INTO `seat` VALUES (349, '2024-08-16 18:17:35', 1, 'S-4-1', 4, 1, 1, 6);
INSERT INTO `seat` VALUES (350, '2024-08-16 18:17:35', 1, 'S-4-2', 4, 2, 1, 6);
INSERT INTO `seat` VALUES (351, '2024-08-16 18:17:35', 1, 'S-4-3', 4, 3, 1, 6);
INSERT INTO `seat` VALUES (352, '2024-08-16 18:17:35', 1, 'S-4-4', 4, 4, 1, 6);
INSERT INTO `seat` VALUES (353, '2024-08-16 18:17:35', 1, 'S-4-5', 4, 5, 1, 6);
INSERT INTO `seat` VALUES (354, '2024-08-16 18:17:35', 1, 'S-5-1', 5, 1, 1, 6);
INSERT INTO `seat` VALUES (355, '2024-08-16 18:17:35', 1, 'S-5-2', 5, 2, 1, 6);
INSERT INTO `seat` VALUES (356, '2024-08-16 18:17:35', 1, 'S-5-3', 5, 3, 1, 6);
INSERT INTO `seat` VALUES (357, '2024-08-16 18:17:35', 1, 'S-5-4', 5, 4, 1, 6);
INSERT INTO `seat` VALUES (358, '2024-08-16 18:17:35', 1, 'S-5-5', 5, 5, 1, 6);
INSERT INTO `seat` VALUES (359, '2024-08-16 18:17:41', 1, 'S-1-1', 1, 1, 1, 4);
INSERT INTO `seat` VALUES (360, '2024-08-16 18:17:41', 1, 'S-1-2', 1, 2, 1, 4);
INSERT INTO `seat` VALUES (361, '2024-08-16 18:17:41', 1, 'S-1-3', 1, 3, 1, 4);
INSERT INTO `seat` VALUES (362, '2024-08-16 18:17:41', 1, 'S-1-4', 1, 4, 1, 4);
INSERT INTO `seat` VALUES (363, '2024-08-16 18:17:41', 1, 'S-2-1', 2, 1, 1, 4);
INSERT INTO `seat` VALUES (364, '2024-08-16 18:17:41', 1, 'S-2-2', 2, 2, 1, 4);
INSERT INTO `seat` VALUES (365, '2024-08-16 18:17:41', 1, 'S-2-3', 2, 3, 1, 4);
INSERT INTO `seat` VALUES (366, '2024-08-16 18:17:41', 1, 'S-2-4', 2, 4, 1, 4);
INSERT INTO `seat` VALUES (367, '2024-08-16 18:17:41', 1, 'S-3-1', 3, 1, 1, 4);
INSERT INTO `seat` VALUES (368, '2024-08-16 18:17:41', 1, 'S-3-2', 3, 2, 1, 4);
INSERT INTO `seat` VALUES (369, '2024-08-16 18:17:41', 1, 'S-3-3', 3, 3, 1, 4);
INSERT INTO `seat` VALUES (370, '2024-08-16 18:17:41', 1, 'S-3-4', 3, 4, 1, 4);
INSERT INTO `seat` VALUES (371, '2024-08-16 18:17:41', 1, 'S-4-1', 4, 1, 1, 4);
INSERT INTO `seat` VALUES (372, '2024-08-16 18:17:41', 1, 'S-4-2', 4, 2, 1, 4);
INSERT INTO `seat` VALUES (373, '2024-08-16 18:17:41', 1, 'S-4-3', 4, 3, 1, 4);
INSERT INTO `seat` VALUES (374, '2024-08-16 18:17:41', 1, 'S-4-4', 4, 4, 1, 4);
INSERT INTO `seat` VALUES (375, '2024-08-16 18:17:50', 1, 'S-1-1', 1, 1, 1, 3);
INSERT INTO `seat` VALUES (376, '2024-08-16 18:17:50', 1, 'S-1-2', 1, 2, 1, 3);
INSERT INTO `seat` VALUES (377, '2024-08-16 18:17:50', 1, 'S-1-3', 1, 3, 1, 3);
INSERT INTO `seat` VALUES (378, '2024-08-16 18:17:50', 1, 'S-1-4', 1, 4, 1, 3);
INSERT INTO `seat` VALUES (379, '2024-08-16 18:17:50', 1, 'S-1-5', 1, 5, 1, 3);
INSERT INTO `seat` VALUES (380, '2024-08-16 18:17:50', 1, 'S-1-6', 1, 6, 1, 3);
INSERT INTO `seat` VALUES (381, '2024-08-16 18:17:50', 1, 'S-1-7', 1, 7, 1, 3);
INSERT INTO `seat` VALUES (382, '2024-08-16 18:17:50', 1, 'S-1-8', 1, 8, 1, 3);
INSERT INTO `seat` VALUES (383, '2024-08-16 18:17:50', 1, 'S-1-9', 1, 9, 1, 3);
INSERT INTO `seat` VALUES (384, '2024-08-16 18:17:50', 1, 'S-1-10', 1, 10, 1, 3);
INSERT INTO `seat` VALUES (385, '2024-08-16 18:17:50', 1, 'S-1-11', 1, 11, 1, 3);
INSERT INTO `seat` VALUES (386, '2024-08-16 18:17:50', 1, 'S-1-12', 1, 12, 1, 3);
INSERT INTO `seat` VALUES (387, '2024-08-16 18:17:50', 1, 'S-2-1', 2, 1, 1, 3);
INSERT INTO `seat` VALUES (388, '2024-08-16 18:17:50', 1, 'S-2-2', 2, 2, 1, 3);
INSERT INTO `seat` VALUES (389, '2024-08-16 18:17:50', 1, 'S-2-3', 2, 3, 1, 3);
INSERT INTO `seat` VALUES (390, '2024-08-16 18:17:50', 1, 'S-2-4', 2, 4, 1, 3);
INSERT INTO `seat` VALUES (391, '2024-08-16 18:17:50', 1, 'S-2-5', 2, 5, 1, 3);
INSERT INTO `seat` VALUES (392, '2024-08-16 18:17:50', 1, 'S-2-6', 2, 6, 1, 3);
INSERT INTO `seat` VALUES (393, '2024-08-16 18:17:50', 1, 'S-2-7', 2, 7, 1, 3);
INSERT INTO `seat` VALUES (394, '2024-08-16 18:17:50', 1, 'S-2-8', 2, 8, 1, 3);
INSERT INTO `seat` VALUES (395, '2024-08-16 18:17:50', 1, 'S-2-9', 2, 9, 1, 3);
INSERT INTO `seat` VALUES (396, '2024-08-16 18:17:50', 1, 'S-2-10', 2, 10, 1, 3);
INSERT INTO `seat` VALUES (397, '2024-08-16 18:17:50', 1, 'S-2-11', 2, 11, 1, 3);
INSERT INTO `seat` VALUES (398, '2024-08-16 18:17:50', 1, 'S-2-12', 2, 12, 1, 3);
INSERT INTO `seat` VALUES (399, '2024-08-16 18:17:50', 1, 'S-3-1', 3, 1, 1, 3);
INSERT INTO `seat` VALUES (400, '2024-08-16 18:17:50', 1, 'S-3-2', 3, 2, 1, 3);
INSERT INTO `seat` VALUES (401, '2024-08-16 18:17:50', 1, 'S-3-3', 3, 3, 1, 3);
INSERT INTO `seat` VALUES (402, '2024-08-16 18:17:50', 1, 'S-3-4', 3, 4, 1, 3);
INSERT INTO `seat` VALUES (403, '2024-08-16 18:17:50', 1, 'S-3-5', 3, 5, 1, 3);
INSERT INTO `seat` VALUES (404, '2024-08-16 18:17:50', 1, 'S-3-6', 3, 6, 1, 3);
INSERT INTO `seat` VALUES (405, '2024-08-16 18:17:50', 1, 'S-3-7', 3, 7, 1, 3);
INSERT INTO `seat` VALUES (406, '2024-08-16 18:17:50', 1, 'S-3-8', 3, 8, 1, 3);
INSERT INTO `seat` VALUES (407, '2024-08-16 18:17:50', 1, 'S-3-9', 3, 9, 1, 3);
INSERT INTO `seat` VALUES (408, '2024-08-16 18:17:50', 1, 'S-3-10', 3, 10, 1, 3);
INSERT INTO `seat` VALUES (409, '2024-08-16 18:17:50', 1, 'S-3-11', 3, 11, 1, 3);
INSERT INTO `seat` VALUES (410, '2024-08-16 18:17:50', 1, 'S-3-12', 3, 12, 1, 3);
INSERT INTO `seat` VALUES (411, '2024-08-16 18:17:50', 1, 'S-4-1', 4, 1, 1, 3);
INSERT INTO `seat` VALUES (412, '2024-08-16 18:17:50', 1, 'S-4-2', 4, 2, 1, 3);
INSERT INTO `seat` VALUES (413, '2024-08-16 18:17:50', 1, 'S-4-3', 4, 3, 1, 3);
INSERT INTO `seat` VALUES (414, '2024-08-16 18:17:50', 1, 'S-4-4', 4, 4, 1, 3);
INSERT INTO `seat` VALUES (415, '2024-08-16 18:17:50', 1, 'S-4-5', 4, 5, 1, 3);
INSERT INTO `seat` VALUES (416, '2024-08-16 18:17:50', 1, 'S-4-6', 4, 6, 1, 3);
INSERT INTO `seat` VALUES (417, '2024-08-16 18:17:50', 1, 'S-4-7', 4, 7, 1, 3);
INSERT INTO `seat` VALUES (418, '2024-08-16 18:17:50', 1, 'S-4-8', 4, 8, 1, 3);
INSERT INTO `seat` VALUES (419, '2024-08-16 18:17:50', 1, 'S-4-9', 4, 9, 1, 3);
INSERT INTO `seat` VALUES (420, '2024-08-16 18:17:50', 1, 'S-4-10', 4, 10, 1, 3);
INSERT INTO `seat` VALUES (421, '2024-08-16 18:17:50', 1, 'S-4-11', 4, 11, 1, 3);
INSERT INTO `seat` VALUES (422, '2024-08-16 18:17:50', 1, 'S-4-12', 4, 12, 1, 3);
INSERT INTO `seat` VALUES (423, '2024-08-16 18:17:50', 1, 'S-5-1', 5, 1, 1, 3);
INSERT INTO `seat` VALUES (424, '2024-08-16 18:17:50', 1, 'S-5-2', 5, 2, 1, 3);
INSERT INTO `seat` VALUES (425, '2024-08-16 18:17:50', 1, 'S-5-3', 5, 3, 1, 3);
INSERT INTO `seat` VALUES (426, '2024-08-16 18:17:50', 1, 'S-5-4', 5, 4, 1, 3);
INSERT INTO `seat` VALUES (427, '2024-08-16 18:17:50', 1, 'S-5-5', 5, 5, 1, 3);
INSERT INTO `seat` VALUES (428, '2024-08-16 18:17:50', 1, 'S-5-6', 5, 6, 1, 3);
INSERT INTO `seat` VALUES (429, '2024-08-16 18:17:50', 1, 'S-5-7', 5, 7, 1, 3);
INSERT INTO `seat` VALUES (430, '2024-08-16 18:17:50', 1, 'S-5-8', 5, 8, 1, 3);
INSERT INTO `seat` VALUES (431, '2024-08-16 18:17:50', 1, 'S-5-9', 5, 9, 1, 3);
INSERT INTO `seat` VALUES (432, '2024-08-16 18:17:50', 1, 'S-5-10', 5, 10, 1, 3);
INSERT INTO `seat` VALUES (433, '2024-08-16 18:17:50', 1, 'S-5-11', 5, 11, 1, 3);
INSERT INTO `seat` VALUES (434, '2024-08-16 18:17:50', 1, 'S-5-12', 5, 12, 1, 3);
INSERT INTO `seat` VALUES (435, '2024-08-16 18:17:50', 1, 'S-6-1', 6, 1, 1, 3);
INSERT INTO `seat` VALUES (436, '2024-08-16 18:17:50', 1, 'S-6-2', 6, 2, 1, 3);
INSERT INTO `seat` VALUES (437, '2024-08-16 18:17:50', 1, 'S-6-3', 6, 3, 1, 3);
INSERT INTO `seat` VALUES (438, '2024-08-16 18:17:50', 1, 'S-6-4', 6, 4, 1, 3);
INSERT INTO `seat` VALUES (439, '2024-08-16 18:17:50', 1, 'S-6-5', 6, 5, 1, 3);
INSERT INTO `seat` VALUES (440, '2024-08-16 18:17:50', 1, 'S-6-6', 6, 6, 1, 3);
INSERT INTO `seat` VALUES (441, '2024-08-16 18:17:50', 1, 'S-6-7', 6, 7, 1, 3);
INSERT INTO `seat` VALUES (442, '2024-08-16 18:17:50', 1, 'S-6-8', 6, 8, 1, 3);
INSERT INTO `seat` VALUES (443, '2024-08-16 18:17:50', 1, 'S-6-9', 6, 9, 1, 3);
INSERT INTO `seat` VALUES (444, '2024-08-16 18:17:50', 1, 'S-6-10', 6, 10, 1, 3);
INSERT INTO `seat` VALUES (445, '2024-08-16 18:17:50', 1, 'S-6-11', 6, 11, 1, 3);
INSERT INTO `seat` VALUES (446, '2024-08-16 18:17:50', 1, 'S-6-12', 6, 12, 1, 3);
INSERT INTO `seat` VALUES (447, '2024-08-16 18:17:50', 1, 'S-7-1', 7, 1, 1, 3);
INSERT INTO `seat` VALUES (448, '2024-08-16 18:17:50', 1, 'S-7-2', 7, 2, 1, 3);
INSERT INTO `seat` VALUES (449, '2024-08-16 18:17:50', 1, 'S-7-3', 7, 3, 1, 3);
INSERT INTO `seat` VALUES (450, '2024-08-16 18:17:50', 1, 'S-7-4', 7, 4, 1, 3);
INSERT INTO `seat` VALUES (451, '2024-08-16 18:17:50', 1, 'S-7-5', 7, 5, 1, 3);
INSERT INTO `seat` VALUES (452, '2024-08-16 18:17:50', 1, 'S-7-6', 7, 6, 1, 3);
INSERT INTO `seat` VALUES (453, '2024-08-16 18:17:50', 1, 'S-7-7', 7, 7, 1, 3);
INSERT INTO `seat` VALUES (454, '2024-08-16 18:17:50', 1, 'S-7-8', 7, 8, 1, 3);
INSERT INTO `seat` VALUES (455, '2024-08-16 18:17:50', 1, 'S-7-9', 7, 9, 1, 3);
INSERT INTO `seat` VALUES (456, '2024-08-16 18:17:50', 1, 'S-7-10', 7, 10, 1, 3);
INSERT INTO `seat` VALUES (457, '2024-08-16 18:17:50', 1, 'S-7-11', 7, 11, 1, 3);
INSERT INTO `seat` VALUES (458, '2024-08-16 18:17:50', 1, 'S-7-12', 7, 12, 1, 3);
INSERT INTO `seat` VALUES (459, '2024-08-16 18:17:50', 1, 'S-8-1', 8, 1, 1, 3);
INSERT INTO `seat` VALUES (460, '2024-08-16 18:17:50', 1, 'S-8-2', 8, 2, 1, 3);
INSERT INTO `seat` VALUES (461, '2024-08-16 18:17:50', 1, 'S-8-3', 8, 3, 1, 3);
INSERT INTO `seat` VALUES (462, '2024-08-16 18:17:50', 1, 'S-8-4', 8, 4, 1, 3);
INSERT INTO `seat` VALUES (463, '2024-08-16 18:17:50', 1, 'S-8-5', 8, 5, 1, 3);
INSERT INTO `seat` VALUES (464, '2024-08-16 18:17:50', 1, 'S-8-6', 8, 6, 1, 3);
INSERT INTO `seat` VALUES (465, '2024-08-16 18:17:50', 1, 'S-8-7', 8, 7, 1, 3);
INSERT INTO `seat` VALUES (466, '2024-08-16 18:17:50', 1, 'S-8-8', 8, 8, 1, 3);
INSERT INTO `seat` VALUES (467, '2024-08-16 18:17:50', 1, 'S-8-9', 8, 9, 1, 3);
INSERT INTO `seat` VALUES (468, '2024-08-16 18:17:50', 1, 'S-8-10', 8, 10, 1, 3);
INSERT INTO `seat` VALUES (469, '2024-08-16 18:17:50', 1, 'S-8-11', 8, 11, 1, 3);
INSERT INTO `seat` VALUES (470, '2024-08-16 18:17:50', 1, 'S-8-12', 8, 12, 1, 3);
INSERT INTO `seat` VALUES (471, '2024-08-16 18:17:50', 1, 'S-9-1', 9, 1, 1, 3);
INSERT INTO `seat` VALUES (472, '2024-08-16 18:17:50', 1, 'S-9-2', 9, 2, 1, 3);
INSERT INTO `seat` VALUES (473, '2024-08-16 18:17:50', 1, 'S-9-3', 9, 3, 1, 3);
INSERT INTO `seat` VALUES (474, '2024-08-16 18:17:50', 1, 'S-9-4', 9, 4, 1, 3);
INSERT INTO `seat` VALUES (475, '2024-08-16 18:17:50', 1, 'S-9-5', 9, 5, 1, 3);
INSERT INTO `seat` VALUES (476, '2024-08-16 18:17:50', 1, 'S-9-6', 9, 6, 1, 3);
INSERT INTO `seat` VALUES (477, '2024-08-16 18:17:50', 1, 'S-9-7', 9, 7, 1, 3);
INSERT INTO `seat` VALUES (478, '2024-08-16 18:17:50', 1, 'S-9-8', 9, 8, 1, 3);
INSERT INTO `seat` VALUES (479, '2024-08-16 18:17:50', 1, 'S-9-9', 9, 9, 1, 3);
INSERT INTO `seat` VALUES (480, '2024-08-16 18:17:50', 1, 'S-9-10', 9, 10, 1, 3);
INSERT INTO `seat` VALUES (481, '2024-08-16 18:17:50', 1, 'S-9-11', 9, 11, 1, 3);
INSERT INTO `seat` VALUES (482, '2024-08-16 18:17:50', 1, 'S-9-12', 9, 12, 1, 3);
INSERT INTO `seat` VALUES (483, '2024-08-16 18:17:50', 1, 'S-10-1', 10, 1, 1, 3);
INSERT INTO `seat` VALUES (484, '2024-08-16 18:17:50', 1, 'S-10-2', 10, 2, 1, 3);
INSERT INTO `seat` VALUES (485, '2024-08-16 18:17:50', 1, 'S-10-3', 10, 3, 1, 3);
INSERT INTO `seat` VALUES (486, '2024-08-16 18:17:50', 1, 'S-10-4', 10, 4, 1, 3);
INSERT INTO `seat` VALUES (487, '2024-08-16 18:17:50', 1, 'S-10-5', 10, 5, 1, 3);
INSERT INTO `seat` VALUES (488, '2024-08-16 18:17:50', 1, 'S-10-6', 10, 6, 1, 3);
INSERT INTO `seat` VALUES (489, '2024-08-16 18:17:50', 1, 'S-10-7', 10, 7, 1, 3);
INSERT INTO `seat` VALUES (490, '2024-08-16 18:17:50', 1, 'S-10-8', 10, 8, 1, 3);
INSERT INTO `seat` VALUES (491, '2024-08-16 18:17:50', 1, 'S-10-9', 10, 9, 1, 3);
INSERT INTO `seat` VALUES (492, '2024-08-16 18:17:50', 1, 'S-10-10', 10, 10, 1, 3);
INSERT INTO `seat` VALUES (493, '2024-08-16 18:17:50', 1, 'S-10-11', 10, 11, 1, 3);
INSERT INTO `seat` VALUES (494, '2024-08-16 18:17:50', 1, 'S-10-12', 10, 12, 1, 3);
INSERT INTO `seat` VALUES (495, '2024-08-16 18:17:50', 1, 'S-11-1', 11, 1, 1, 3);
INSERT INTO `seat` VALUES (496, '2024-08-16 18:17:50', 1, 'S-11-2', 11, 2, 1, 3);
INSERT INTO `seat` VALUES (497, '2024-08-16 18:17:50', 1, 'S-11-3', 11, 3, 1, 3);
INSERT INTO `seat` VALUES (498, '2024-08-16 18:17:50', 1, 'S-11-4', 11, 4, 1, 3);
INSERT INTO `seat` VALUES (499, '2024-08-16 18:17:50', 1, 'S-11-5', 11, 5, 1, 3);
INSERT INTO `seat` VALUES (500, '2024-08-16 18:17:50', 1, 'S-11-6', 11, 6, 1, 3);
INSERT INTO `seat` VALUES (501, '2024-08-16 18:17:50', 1, 'S-11-7', 11, 7, 1, 3);
INSERT INTO `seat` VALUES (502, '2024-08-16 18:17:50', 1, 'S-11-8', 11, 8, 1, 3);
INSERT INTO `seat` VALUES (503, '2024-08-16 18:17:50', 1, 'S-11-9', 11, 9, 1, 3);
INSERT INTO `seat` VALUES (504, '2024-08-16 18:17:50', 1, 'S-11-10', 11, 10, 1, 3);
INSERT INTO `seat` VALUES (505, '2024-08-16 18:17:50', 1, 'S-11-11', 11, 11, 1, 3);
INSERT INTO `seat` VALUES (506, '2024-08-16 18:17:50', 1, 'S-11-12', 11, 12, 1, 3);
INSERT INTO `seat` VALUES (507, '2024-08-16 18:17:50', 1, 'S-12-1', 12, 1, 1, 3);
INSERT INTO `seat` VALUES (508, '2024-08-16 18:17:50', 1, 'S-12-2', 12, 2, 1, 3);
INSERT INTO `seat` VALUES (509, '2024-08-16 18:17:50', 1, 'S-12-3', 12, 3, 1, 3);
INSERT INTO `seat` VALUES (510, '2024-08-16 18:17:50', 1, 'S-12-4', 12, 4, 1, 3);
INSERT INTO `seat` VALUES (511, '2024-08-16 18:17:50', 1, 'S-12-5', 12, 5, 1, 3);
INSERT INTO `seat` VALUES (512, '2024-08-16 18:17:50', 1, 'S-12-6', 12, 6, 1, 3);
INSERT INTO `seat` VALUES (513, '2024-08-16 18:17:50', 1, 'S-12-7', 12, 7, 1, 3);
INSERT INTO `seat` VALUES (514, '2024-08-16 18:17:50', 1, 'S-12-8', 12, 8, 1, 3);
INSERT INTO `seat` VALUES (515, '2024-08-16 18:17:50', 1, 'S-12-9', 12, 9, 1, 3);
INSERT INTO `seat` VALUES (516, '2024-08-16 18:17:50', 1, 'S-12-10', 12, 10, 1, 3);
INSERT INTO `seat` VALUES (517, '2024-08-16 18:17:50', 1, 'S-12-11', 12, 11, 1, 3);
INSERT INTO `seat` VALUES (518, '2024-08-16 18:17:50', 1, 'S-12-12', 12, 12, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;

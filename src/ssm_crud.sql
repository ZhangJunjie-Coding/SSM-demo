/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 29/03/2021 17:51:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `uq_dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES (1, '开发部');
INSERT INTO `tb_dept` VALUES (2, '测试部');
INSERT INTO `tb_dept` VALUES (3, '设计部');

-- ----------------------------
-- Table structure for tb_emp
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp`  (
  `emp_id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '员工性别, 1男2女',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工邮箱',
  `d_id` int NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`emp_id`) USING BTREE,
  UNIQUE INDEX `uq_emp_name`(`emp_name`) USING BTREE,
  INDEX `fk_emp_dept`(`d_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tb_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
INSERT INTO `tb_emp` VALUES (1, 'oneice6c40', 2, 'oneice6c40@qq.com', 1);
INSERT INTO `tb_emp` VALUES (2, 'oneicecd81', 2, 'oneicecd81@qq.com', 3);
INSERT INTO `tb_emp` VALUES (3, 'oneicecc62', 2, 'oneicecc62@qq.com', 2);
INSERT INTO `tb_emp` VALUES (4, 'oneice00f3', 2, 'oneice00f3@qq.com', 3);
INSERT INTO `tb_emp` VALUES (5, 'oneicee644', 2, 'oneicee644@qq.com', 1);
INSERT INTO `tb_emp` VALUES (6, 'oneice23e5', 1, 'oneice23e5@qq.com', 3);
INSERT INTO `tb_emp` VALUES (7, 'oneiceb9b6', 2, 'oneiceb9b6@qq.com', 3);
INSERT INTO `tb_emp` VALUES (8, 'oneice58a7', 2, 'oneice58a7@qq.com', 1);
INSERT INTO `tb_emp` VALUES (9, 'oneiced2d8', 2, 'oneiced2d8@qq.com', 1);
INSERT INTO `tb_emp` VALUES (10, 'oneicebfb9', 2, 'oneicebfb9@qq.com', 2);
INSERT INTO `tb_emp` VALUES (11, 'oneice01510', 1, 'oneice01510@qq.com', 1);
INSERT INTO `tb_emp` VALUES (12, 'oneicebe211', 1, 'oneicebe211@qq.com', 2);
INSERT INTO `tb_emp` VALUES (13, 'oneicef1712', 1, 'oneicef1712@qq.com', 3);
INSERT INTO `tb_emp` VALUES (14, 'oneice2c713', 1, 'oneice2c713@qq.com', 2);
INSERT INTO `tb_emp` VALUES (15, 'oneice6ea14', 1, 'oneice6ea14@qq.com', 3);
INSERT INTO `tb_emp` VALUES (16, 'oneicecc415', 2, 'oneicecc415@qq.com', 2);
INSERT INTO `tb_emp` VALUES (17, 'oneicefac16', 1, 'oneicefac16@qq.com', 1);
INSERT INTO `tb_emp` VALUES (18, 'oneice8d517', 2, 'oneice8d517@qq.com', 3);
INSERT INTO `tb_emp` VALUES (19, 'oneice45618', 2, 'oneice45618@qq.com', 3);
INSERT INTO `tb_emp` VALUES (20, 'oneice79c19', 2, 'oneice79c19@qq.com', 3);
INSERT INTO `tb_emp` VALUES (21, 'oneice6fe20', 1, 'oneice6fe20@qq.com', 2);
INSERT INTO `tb_emp` VALUES (22, 'oneicec5d21', 2, 'oneicec5d21@qq.com', 2);
INSERT INTO `tb_emp` VALUES (23, 'oneice0a322', 1, 'oneice0a322@qq.com', 2);
INSERT INTO `tb_emp` VALUES (24, 'oneice09823', 2, 'oneice09823@qq.com', 3);
INSERT INTO `tb_emp` VALUES (25, 'oneicea0624', 1, 'oneicea0624@qq.com', 1);
INSERT INTO `tb_emp` VALUES (26, 'oneice96825', 1, 'oneice96825@qq.com', 3);
INSERT INTO `tb_emp` VALUES (27, 'oneice43626', 1, 'oneice43626@qq.com', 1);
INSERT INTO `tb_emp` VALUES (28, 'oneicead427', 2, 'oneicead427@qq.com', 1);
INSERT INTO `tb_emp` VALUES (29, 'oneice53f28', 1, 'oneice53f28@qq.com', 2);
INSERT INTO `tb_emp` VALUES (30, 'oneice8fc29', 1, 'oneice8fc29@qq.com', 2);
INSERT INTO `tb_emp` VALUES (31, 'oneice62f30', 2, 'oneice62f30@qq.com', 3);
INSERT INTO `tb_emp` VALUES (32, 'oneicee0831', 2, 'oneicee0831@qq.com', 3);
INSERT INTO `tb_emp` VALUES (33, 'oneicebac32', 2, 'oneicebac32@qq.com', 1);
INSERT INTO `tb_emp` VALUES (34, 'oneicef7d33', 2, 'oneicef7d33@qq.com', 1);
INSERT INTO `tb_emp` VALUES (35, 'oneice4a134', 2, 'oneice4a134@qq.com', 1);
INSERT INTO `tb_emp` VALUES (36, 'oneice7e635', 1, 'oneice7e635@qq.com', 1);
INSERT INTO `tb_emp` VALUES (37, 'oneiceb2a36', 2, 'oneiceb2a36@qq.com', 3);
INSERT INTO `tb_emp` VALUES (38, 'oneice1c237', 1, 'oneice1c237@qq.com', 2);
INSERT INTO `tb_emp` VALUES (39, 'oneice98a38', 1, 'oneice98a38@qq.com', 3);
INSERT INTO `tb_emp` VALUES (40, 'oneice16239', 2, 'oneice16239@qq.com', 1);
INSERT INTO `tb_emp` VALUES (41, 'oneice29e40', 1, 'oneice29e40@qq.com', 2);
INSERT INTO `tb_emp` VALUES (42, 'oneiceeda41', 1, 'oneiceeda41@qq.com', 2);
INSERT INTO `tb_emp` VALUES (43, 'oneicebe742', 2, 'oneicebe742@qq.com', 3);
INSERT INTO `tb_emp` VALUES (44, 'oneice5c143', 1, 'oneice5c143@qq.com', 1);
INSERT INTO `tb_emp` VALUES (45, 'oneicec7044', 1, 'oneicec7044@qq.com', 3);
INSERT INTO `tb_emp` VALUES (46, 'oneice6ac45', 1, 'oneice6ac45@qq.com', 3);
INSERT INTO `tb_emp` VALUES (47, 'oneice2f446', 2, 'oneice2f446@qq.com', 3);
INSERT INTO `tb_emp` VALUES (48, 'oneice7b247', 2, 'oneice7b247@qq.com', 1);
INSERT INTO `tb_emp` VALUES (49, 'oneice71448', 1, 'oneice71448@qq.com', 1);
INSERT INTO `tb_emp` VALUES (50, 'oneice65d49', 2, 'oneice65d49@qq.com', 2);
INSERT INTO `tb_emp` VALUES (51, 'oneicebd250', 1, 'oneicebd250@qq.com', 1);
INSERT INTO `tb_emp` VALUES (52, 'oneice24851', 2, 'oneice24851@qq.com', 1);
INSERT INTO `tb_emp` VALUES (53, 'oneiceeab52', 1, 'oneiceeab52@qq.com', 1);
INSERT INTO `tb_emp` VALUES (54, 'oneice36d53', 1, 'oneice36d53@qq.com', 2);
INSERT INTO `tb_emp` VALUES (55, 'oneice76354', 1, 'oneice76354@qq.com', 2);
INSERT INTO `tb_emp` VALUES (56, 'oneicee4d55', 2, 'oneicee4d55@qq.com', 2);
INSERT INTO `tb_emp` VALUES (57, 'oneicead356', 1, 'oneicead356@qq.com', 2);
INSERT INTO `tb_emp` VALUES (58, 'oneice2d757', 2, 'oneice2d757@qq.com', 2);
INSERT INTO `tb_emp` VALUES (59, 'oneicee8958', 1, 'oneicee8958@qq.com', 3);
INSERT INTO `tb_emp` VALUES (60, 'oneice37359', 1, 'oneice37359@qq.com', 3);
INSERT INTO `tb_emp` VALUES (61, 'oneice06f60', 2, 'oneice06f60@qq.com', 3);
INSERT INTO `tb_emp` VALUES (62, 'oneiceb7c61', 2, 'oneiceb7c61@qq.com', 3);
INSERT INTO `tb_emp` VALUES (63, 'oneice32862', 2, 'oneice32862@qq.com', 1);
INSERT INTO `tb_emp` VALUES (64, 'oneiced3963', 1, 'oneiced3963@qq.com', 1);
INSERT INTO `tb_emp` VALUES (65, 'oneicec3664', 2, 'oneicec3664@qq.com', 2);
INSERT INTO `tb_emp` VALUES (66, 'oneice4bd65', 2, 'oneice4bd65@qq.com', 2);
INSERT INTO `tb_emp` VALUES (67, 'oneicedd566', 1, 'oneicedd566@qq.com', 1);
INSERT INTO `tb_emp` VALUES (68, 'oneicee1367', 2, 'oneicee1367@qq.com', 3);
INSERT INTO `tb_emp` VALUES (69, 'oneicea5068', 2, 'oneicea5068@qq.com', 2);
INSERT INTO `tb_emp` VALUES (70, 'oneicec7e69', 2, 'oneicec7e69@qq.com', 3);
INSERT INTO `tb_emp` VALUES (71, 'oneice7bb70', 1, 'oneice7bb70@qq.com', 2);
INSERT INTO `tb_emp` VALUES (72, 'oneice96a71', 1, 'oneice96a71@qq.com', 1);
INSERT INTO `tb_emp` VALUES (73, 'oneice16572', 1, 'oneice16572@qq.com', 2);
INSERT INTO `tb_emp` VALUES (74, 'oneice20f73', 1, 'oneice20f73@qq.com', 3);
INSERT INTO `tb_emp` VALUES (75, 'oneice05d74', 2, 'oneice05d74@qq.com', 3);
INSERT INTO `tb_emp` VALUES (76, 'oneice3e675', 1, 'oneice3e675@qq.com', 1);
INSERT INTO `tb_emp` VALUES (77, 'oneice2c176', 2, 'oneice2c176@qq.com', 2);
INSERT INTO `tb_emp` VALUES (78, 'oneicec7377', 2, 'oneicec7377@qq.com', 1);
INSERT INTO `tb_emp` VALUES (79, 'oneice3c978', 1, 'oneice3c978@qq.com', 3);
INSERT INTO `tb_emp` VALUES (80, 'oneicea5479', 2, 'oneicea5479@qq.com', 3);
INSERT INTO `tb_emp` VALUES (81, 'oneicef0680', 1, 'oneicef0680@qq.com', 2);
INSERT INTO `tb_emp` VALUES (82, 'oneice94081', 2, 'oneice94081@qq.com', 1);
INSERT INTO `tb_emp` VALUES (83, 'oneicefc382', 1, 'oneicefc382@qq.com', 2);
INSERT INTO `tb_emp` VALUES (84, 'oneice2da83', 2, 'oneice2da83@qq.com', 1);
INSERT INTO `tb_emp` VALUES (85, 'oneice9ed84', 2, 'oneice9ed84@qq.com', 1);
INSERT INTO `tb_emp` VALUES (86, 'oneice80285', 2, 'oneice80285@qq.com', 1);
INSERT INTO `tb_emp` VALUES (87, 'oneice79c86', 1, 'oneice79c86@qq.com', 1);
INSERT INTO `tb_emp` VALUES (88, 'oneicec0987', 2, 'oneicec0987@qq.com', 3);
INSERT INTO `tb_emp` VALUES (89, 'oneiceea188', 2, 'oneiceea188@qq.com', 1);
INSERT INTO `tb_emp` VALUES (90, 'oneicea5089', 2, 'oneicea5089@qq.com', 3);
INSERT INTO `tb_emp` VALUES (91, 'oneice5a890', 2, 'oneice5a890@qq.com', 2);
INSERT INTO `tb_emp` VALUES (92, 'oneice50591', 1, 'oneice50591@qq.com', 2);
INSERT INTO `tb_emp` VALUES (93, 'oneiceff392', 2, 'oneiceff392@qq.com', 1);
INSERT INTO `tb_emp` VALUES (94, 'oneiceeed93', 2, 'oneiceeed93@qq.com', 1);
INSERT INTO `tb_emp` VALUES (95, 'oneicef9294', 2, 'oneicef9294@qq.com', 3);
INSERT INTO `tb_emp` VALUES (96, 'oneice04795', 2, 'oneice04795@qq.com', 1);
INSERT INTO `tb_emp` VALUES (97, 'oneice5e996', 1, 'oneice5e996@qq.com', 2);
INSERT INTO `tb_emp` VALUES (98, 'oneice62f97', 1, 'oneice62f97@qq.com', 3);
INSERT INTO `tb_emp` VALUES (99, 'oneicec9798', 1, 'oneicec9798@qq.com', 3);
INSERT INTO `tb_emp` VALUES (100, 'oneice4a299', 1, 'oneice4a299@qq.com', 1);
INSERT INTO `tb_emp` VALUES (101, 'oneice4cd0', 1, 'oneice4cd0@qq.com', 2);
INSERT INTO `tb_emp` VALUES (102, 'oneice8e21', 2, 'oneice8e21@qq.com', 2);
INSERT INTO `tb_emp` VALUES (103, 'oneice9d52', 1, 'oneice9d52@qq.com', 2);
INSERT INTO `tb_emp` VALUES (104, 'oneicedb33', 2, 'oneicedb33@qq.com', 2);
INSERT INTO `tb_emp` VALUES (105, 'oneice30a4', 1, 'oneice30a4@qq.com', 3);
INSERT INTO `tb_emp` VALUES (106, 'oneicef5d5', 1, 'oneicef5d5@qq.com', 1);
INSERT INTO `tb_emp` VALUES (107, 'oneiced496', 2, 'oneiced496@qq.com', 3);
INSERT INTO `tb_emp` VALUES (108, 'oneiced757', 2, 'oneiced757@qq.com', 2);
INSERT INTO `tb_emp` VALUES (109, 'oneice73a8', 2, 'oneice73a8@qq.com', 1);
INSERT INTO `tb_emp` VALUES (110, 'oneice6779', 1, 'oneice6779@qq.com', 3);
INSERT INTO `tb_emp` VALUES (111, 'oneice78410', 2, 'oneice78410@qq.com', 1);
INSERT INTO `tb_emp` VALUES (112, 'oneice22311', 2, 'oneice22311@qq.com', 2);
INSERT INTO `tb_emp` VALUES (113, 'oneiced3512', 2, 'oneiced3512@qq.com', 2);
INSERT INTO `tb_emp` VALUES (114, 'oneicea1413', 1, 'oneicea1413@qq.com', 3);
INSERT INTO `tb_emp` VALUES (115, 'oneicea8b14', 2, 'oneicea8b14@qq.com', 1);
INSERT INTO `tb_emp` VALUES (116, 'oneicea8215', 2, 'oneicea8215@qq.com', 3);
INSERT INTO `tb_emp` VALUES (117, 'oneice30c16', 2, 'oneice30c16@qq.com', 3);
INSERT INTO `tb_emp` VALUES (118, 'oneice9fc17', 2, 'oneice9fc17@qq.com', 1);
INSERT INTO `tb_emp` VALUES (119, 'oneice7d418', 1, 'oneice7d418@qq.com', 1);
INSERT INTO `tb_emp` VALUES (120, 'oneice63819', 2, 'oneice63819@qq.com', 1);
INSERT INTO `tb_emp` VALUES (121, 'oneice16520', 2, 'oneice16520@qq.com', 3);
INSERT INTO `tb_emp` VALUES (122, 'oneiceaf721', 2, 'oneiceaf721@qq.com', 1);
INSERT INTO `tb_emp` VALUES (123, 'oneicec2322', 2, 'oneicec2322@qq.com', 1);
INSERT INTO `tb_emp` VALUES (124, 'oneicedeb23', 2, 'oneicedeb23@qq.com', 2);
INSERT INTO `tb_emp` VALUES (125, 'oneice8f124', 1, 'oneice8f124@qq.com', 1);
INSERT INTO `tb_emp` VALUES (126, 'oneicec3325', 2, 'oneicec3325@qq.com', 1);
INSERT INTO `tb_emp` VALUES (127, 'oneice6fe26', 2, 'oneice6fe26@qq.com', 1);
INSERT INTO `tb_emp` VALUES (128, 'oneicec4727', 2, 'oneicec4727@qq.com', 1);
INSERT INTO `tb_emp` VALUES (129, 'oneicea0128', 2, 'oneicea0128@qq.com', 1);
INSERT INTO `tb_emp` VALUES (130, 'oneice6c229', 2, 'oneice6c229@qq.com', 1);
INSERT INTO `tb_emp` VALUES (131, 'oneice70d30', 2, 'oneice70d30@qq.com', 1);
INSERT INTO `tb_emp` VALUES (132, 'oneicef1a31', 2, 'oneicef1a31@qq.com', 1);
INSERT INTO `tb_emp` VALUES (133, 'oneice36932', 2, 'oneice36932@qq.com', 1);
INSERT INTO `tb_emp` VALUES (134, 'oneice02133', 2, 'oneice02133@qq.com', 3);
INSERT INTO `tb_emp` VALUES (135, 'oneice08934', 1, 'oneice08934@qq.com', 3);
INSERT INTO `tb_emp` VALUES (136, 'oneice78b35', 1, 'oneice78b35@qq.com', 2);
INSERT INTO `tb_emp` VALUES (137, 'oneice84136', 1, 'oneice84136@qq.com', 3);
INSERT INTO `tb_emp` VALUES (138, 'oneice27e37', 2, 'oneice27e37@qq.com', 3);
INSERT INTO `tb_emp` VALUES (139, 'oneice8b838', 1, 'oneice8b838@qq.com', 1);
INSERT INTO `tb_emp` VALUES (140, 'oneice2c739', 1, 'oneice2c739@qq.com', 3);
INSERT INTO `tb_emp` VALUES (141, 'oneice16540', 1, 'oneice16540@qq.com', 1);
INSERT INTO `tb_emp` VALUES (142, 'oneice52e41', 2, 'oneice52e41@qq.com', 1);
INSERT INTO `tb_emp` VALUES (143, 'oneicee4642', 2, 'oneicee4642@qq.com', 3);
INSERT INTO `tb_emp` VALUES (144, 'oneice8e843', 1, 'oneice8e843@qq.com', 1);
INSERT INTO `tb_emp` VALUES (145, 'oneice38c44', 2, 'oneice38c44@qq.com', 1);
INSERT INTO `tb_emp` VALUES (146, 'oneice8e645', 2, 'oneice8e645@qq.com', 2);
INSERT INTO `tb_emp` VALUES (147, 'oneice3b646', 1, 'oneice3b646@qq.com', 1);
INSERT INTO `tb_emp` VALUES (148, 'oneice22047', 1, 'oneice22047@qq.com', 1);
INSERT INTO `tb_emp` VALUES (149, 'oneiced2b48', 2, 'oneiced2b48@qq.com', 2);
INSERT INTO `tb_emp` VALUES (150, 'oneice75a49', 1, 'oneice75a49@qq.com', 3);
INSERT INTO `tb_emp` VALUES (151, 'oneiceec450', 2, 'oneiceec450@qq.com', 3);
INSERT INTO `tb_emp` VALUES (152, 'oneice5a251', 1, 'oneice5a251@qq.com', 1);
INSERT INTO `tb_emp` VALUES (153, 'oneicec7352', 1, 'oneicec7352@qq.com', 3);
INSERT INTO `tb_emp` VALUES (154, 'oneice7a153', 1, 'oneice7a153@qq.com', 3);
INSERT INTO `tb_emp` VALUES (155, 'oneice7e054', 2, 'oneice7e054@qq.com', 3);
INSERT INTO `tb_emp` VALUES (156, 'oneice55e55', 1, 'oneice55e55@qq.com', 3);
INSERT INTO `tb_emp` VALUES (157, 'oneicea0956', 1, 'oneicea0956@qq.com', 3);
INSERT INTO `tb_emp` VALUES (158, 'oneice7c757', 2, 'oneice7c757@qq.com', 2);
INSERT INTO `tb_emp` VALUES (159, 'oneiceb9a58', 1, 'oneiceb9a58@qq.com', 2);
INSERT INTO `tb_emp` VALUES (160, 'oneiceebd59', 1, 'oneiceebd59@qq.com', 3);
INSERT INTO `tb_emp` VALUES (161, 'oneice99f60', 2, 'oneice99f60@qq.com', 1);
INSERT INTO `tb_emp` VALUES (162, 'oneice31a61', 1, 'oneice31a61@qq.com', 3);
INSERT INTO `tb_emp` VALUES (163, 'oneicef4262', 1, 'oneicef4262@qq.com', 1);
INSERT INTO `tb_emp` VALUES (164, 'oneice1c963', 2, 'oneice1c963@qq.com', 3);
INSERT INTO `tb_emp` VALUES (165, 'oneicefb364', 1, 'oneicefb364@qq.com', 2);
INSERT INTO `tb_emp` VALUES (166, 'oneice05765', 1, 'oneice05765@qq.com', 3);
INSERT INTO `tb_emp` VALUES (167, 'oneice92f66', 1, 'oneice92f66@qq.com', 3);
INSERT INTO `tb_emp` VALUES (168, 'oneice89167', 1, 'oneice89167@qq.com', 3);
INSERT INTO `tb_emp` VALUES (169, 'oneicefd468', 2, 'oneicefd468@qq.com', 1);
INSERT INTO `tb_emp` VALUES (170, 'oneice69469', 2, 'oneice69469@qq.com', 3);
INSERT INTO `tb_emp` VALUES (171, 'oneicea9070', 1, 'oneicea9070@qq.com', 1);
INSERT INTO `tb_emp` VALUES (172, 'oneice5f971', 2, 'oneice5f971@qq.com', 3);
INSERT INTO `tb_emp` VALUES (173, 'oneicef7a72', 1, 'oneicef7a72@qq.com', 3);
INSERT INTO `tb_emp` VALUES (174, 'oneicec6b73', 2, 'oneicec6b73@qq.com', 2);
INSERT INTO `tb_emp` VALUES (175, 'oneice9e774', 2, 'oneice9e774@qq.com', 3);
INSERT INTO `tb_emp` VALUES (176, 'oneiced6c75', 1, 'oneiced6c75@qq.com', 2);
INSERT INTO `tb_emp` VALUES (177, 'oneice8fd76', 2, 'oneice8fd76@qq.com', 3);
INSERT INTO `tb_emp` VALUES (178, 'oneice0a777', 2, 'oneice0a777@qq.com', 1);
INSERT INTO `tb_emp` VALUES (179, 'oneice28178', 1, 'oneice28178@qq.com', 1);
INSERT INTO `tb_emp` VALUES (180, 'oneice47c79', 1, 'oneice47c79@qq.com', 3);
INSERT INTO `tb_emp` VALUES (181, 'oneicecfd80', 2, 'oneicecfd80@qq.com', 2);
INSERT INTO `tb_emp` VALUES (182, 'oneice42f81', 1, 'oneice42f81@qq.com', 3);
INSERT INTO `tb_emp` VALUES (183, 'oneice05e82', 1, 'oneice05e82@qq.com', 1);
INSERT INTO `tb_emp` VALUES (184, 'oneice65583', 2, 'oneice65583@qq.com', 2);
INSERT INTO `tb_emp` VALUES (185, 'oneicec8b84', 2, 'oneicec8b84@qq.com', 3);
INSERT INTO `tb_emp` VALUES (186, 'oneice15c85', 2, 'oneice15c85@qq.com', 1);
INSERT INTO `tb_emp` VALUES (187, 'oneicedbb86', 1, 'oneicedbb86@qq.com', 1);
INSERT INTO `tb_emp` VALUES (188, 'oneice42487', 2, 'oneice42487@qq.com', 2);
INSERT INTO `tb_emp` VALUES (189, 'oneiceb9e88', 1, 'oneiceb9e88@qq.com', 2);
INSERT INTO `tb_emp` VALUES (190, 'oneice41289', 2, 'oneice41289@qq.com', 3);
INSERT INTO `tb_emp` VALUES (191, 'oneice43890', 1, 'oneice43890@qq.com', 3);
INSERT INTO `tb_emp` VALUES (192, 'oneice00a91', 1, 'oneice00a91@qq.com', 3);
INSERT INTO `tb_emp` VALUES (193, 'oneice83892', 2, 'oneice83892@qq.com', 2);
INSERT INTO `tb_emp` VALUES (194, 'oneice23593', 1, 'oneice23593@qq.com', 2);
INSERT INTO `tb_emp` VALUES (195, 'oneice57e94', 1, 'oneice57e94@qq.com', 1);
INSERT INTO `tb_emp` VALUES (196, 'oneice6a695', 1, 'oneice6a695@qq.com', 2);
INSERT INTO `tb_emp` VALUES (197, 'oneice7ee96', 2, 'oneice7ee96@qq.com', 2);
INSERT INTO `tb_emp` VALUES (198, 'oneice29697', 1, 'oneice29697@qq.com', 3);
INSERT INTO `tb_emp` VALUES (199, 'oneicee0b98', 2, 'oneicee0b98@qq.com', 3);
INSERT INTO `tb_emp` VALUES (200, 'oneiceaf499', 1, 'oneiceaf499@qq.com', 3);
INSERT INTO `tb_emp` VALUES (201, 'oneice1ed0', 1, 'oneice1ed0@qq.com', 2);
INSERT INTO `tb_emp` VALUES (202, 'oneicecd11', 1, 'oneicecd11@qq.com', 2);
INSERT INTO `tb_emp` VALUES (203, 'oneice6e82', 1, 'oneice6e82@qq.com', 3);
INSERT INTO `tb_emp` VALUES (204, 'oneice90d3', 1, 'oneice90d3@qq.com', 1);
INSERT INTO `tb_emp` VALUES (205, 'oneiceb1c4', 1, 'oneiceb1c4@qq.com', 3);
INSERT INTO `tb_emp` VALUES (206, 'oneice5025', 2, 'oneice5025@qq.com', 3);
INSERT INTO `tb_emp` VALUES (207, 'oneicea926', 2, 'oneicea926@qq.com', 2);
INSERT INTO `tb_emp` VALUES (208, 'oneiceb037', 2, 'oneiceb037@qq.com', 1);
INSERT INTO `tb_emp` VALUES (209, 'oneice14d8', 1, 'oneice14d8@qq.com', 2);
INSERT INTO `tb_emp` VALUES (210, 'oneice85c9', 2, 'oneice85c9@qq.com', 2);
INSERT INTO `tb_emp` VALUES (211, 'oneice80010', 2, 'oneice80010@qq.com', 1);
INSERT INTO `tb_emp` VALUES (212, 'oneice57211', 1, 'oneice57211@qq.com', 1);
INSERT INTO `tb_emp` VALUES (213, 'oneice2c512', 1, 'oneice2c512@qq.com', 3);
INSERT INTO `tb_emp` VALUES (214, 'oneiceb7513', 1, 'oneiceb7513@qq.com', 2);
INSERT INTO `tb_emp` VALUES (215, 'oneicec5814', 1, 'oneicec5814@qq.com', 3);
INSERT INTO `tb_emp` VALUES (216, 'oneice0ad15', 1, 'oneice0ad15@qq.com', 3);
INSERT INTO `tb_emp` VALUES (217, 'oneice0d616', 2, 'oneice0d616@qq.com', 3);
INSERT INTO `tb_emp` VALUES (218, 'oneicee8317', 1, 'oneicee8317@qq.com', 2);
INSERT INTO `tb_emp` VALUES (219, 'oneice23d18', 1, 'oneice23d18@qq.com', 1);
INSERT INTO `tb_emp` VALUES (220, 'oneiceb2d19', 2, 'oneiceb2d19@qq.com', 1);
INSERT INTO `tb_emp` VALUES (221, 'oneice8a620', 2, 'oneice8a620@qq.com', 1);
INSERT INTO `tb_emp` VALUES (222, 'oneicee5b21', 2, 'oneicee5b21@qq.com', 3);
INSERT INTO `tb_emp` VALUES (223, 'oneice48222', 1, 'oneice48222@qq.com', 3);
INSERT INTO `tb_emp` VALUES (224, 'oneicea7a23', 1, 'oneicea7a23@qq.com', 2);
INSERT INTO `tb_emp` VALUES (225, 'oneiceeae24', 2, 'oneiceeae24@qq.com', 3);
INSERT INTO `tb_emp` VALUES (226, 'oneice01a25', 1, 'oneice01a25@qq.com', 3);
INSERT INTO `tb_emp` VALUES (227, 'oneice60326', 2, 'oneice60326@qq.com', 1);
INSERT INTO `tb_emp` VALUES (228, 'oneice7c627', 1, 'oneice7c627@qq.com', 2);
INSERT INTO `tb_emp` VALUES (229, 'oneiced2028', 2, 'oneiced2028@qq.com', 1);
INSERT INTO `tb_emp` VALUES (230, 'oneice76b29', 2, 'oneice76b29@qq.com', 3);
INSERT INTO `tb_emp` VALUES (231, 'oneicea6530', 2, 'oneicea6530@qq.com', 2);
INSERT INTO `tb_emp` VALUES (232, 'oneicecf331', 1, 'oneicecf331@qq.com', 2);
INSERT INTO `tb_emp` VALUES (233, 'oneiceab332', 2, 'oneiceab332@qq.com', 1);
INSERT INTO `tb_emp` VALUES (234, 'oneice19b33', 2, 'oneice19b33@qq.com', 3);
INSERT INTO `tb_emp` VALUES (235, 'oneicec5734', 1, 'oneicec5734@qq.com', 3);
INSERT INTO `tb_emp` VALUES (236, 'oneice9d235', 1, 'oneice9d235@qq.com', 1);
INSERT INTO `tb_emp` VALUES (237, 'oneicedc536', 2, 'oneicedc536@qq.com', 3);
INSERT INTO `tb_emp` VALUES (238, 'oneicee1e37', 2, 'oneicee1e37@qq.com', 3);
INSERT INTO `tb_emp` VALUES (239, 'oneiced1238', 2, 'oneiced1238@qq.com', 2);
INSERT INTO `tb_emp` VALUES (240, 'oneice01639', 2, 'oneice01639@qq.com', 3);
INSERT INTO `tb_emp` VALUES (241, 'oneice45440', 1, 'oneice45440@qq.com', 2);
INSERT INTO `tb_emp` VALUES (242, 'oneicef4341', 2, 'oneicef4341@qq.com', 1);
INSERT INTO `tb_emp` VALUES (243, 'oneicee2442', 1, 'oneicee2442@qq.com', 2);
INSERT INTO `tb_emp` VALUES (244, 'oneice63843', 1, 'oneice63843@qq.com', 1);
INSERT INTO `tb_emp` VALUES (245, 'oneicee2c44', 2, 'oneicee2c44@qq.com', 2);
INSERT INTO `tb_emp` VALUES (246, 'oneice2d945', 2, 'oneice2d945@qq.com', 1);
INSERT INTO `tb_emp` VALUES (247, 'oneice15346', 2, 'oneice15346@qq.com', 2);
INSERT INTO `tb_emp` VALUES (248, 'oneice27b47', 1, 'oneice27b47@qq.com', 3);
INSERT INTO `tb_emp` VALUES (249, 'oneice10448', 1, 'oneice10448@qq.com', 1);
INSERT INTO `tb_emp` VALUES (250, 'oneiced5149', 2, 'oneiced5149@qq.com', 1);
INSERT INTO `tb_emp` VALUES (251, 'oneiceee750', 2, 'oneiceee750@qq.com', 3);
INSERT INTO `tb_emp` VALUES (252, 'oneice5bf51', 2, 'oneice5bf51@qq.com', 2);
INSERT INTO `tb_emp` VALUES (253, 'oneice37852', 1, 'oneice37852@qq.com', 1);
INSERT INTO `tb_emp` VALUES (254, 'oneicee9853', 2, 'oneicee9853@qq.com', 3);
INSERT INTO `tb_emp` VALUES (255, 'oneiceff354', 1, 'oneiceff354@qq.com', 2);
INSERT INTO `tb_emp` VALUES (256, 'oneicea8b55', 1, 'oneicea8b55@qq.com', 2);
INSERT INTO `tb_emp` VALUES (257, 'oneiceea756', 1, 'oneiceea756@qq.com', 1);
INSERT INTO `tb_emp` VALUES (258, 'oneice06b57', 2, 'oneice06b57@qq.com', 1);
INSERT INTO `tb_emp` VALUES (259, 'oneice38358', 2, 'oneice38358@qq.com', 2);
INSERT INTO `tb_emp` VALUES (260, 'oneice49c59', 2, 'oneice49c59@qq.com', 3);
INSERT INTO `tb_emp` VALUES (261, 'oneice75c60', 2, 'oneice75c60@qq.com', 1);
INSERT INTO `tb_emp` VALUES (262, 'oneicee3f61', 1, 'oneicee3f61@qq.com', 1);
INSERT INTO `tb_emp` VALUES (263, 'oneicead762', 1, 'oneicead762@qq.com', 2);
INSERT INTO `tb_emp` VALUES (264, 'oneice24a63', 2, 'oneice24a63@qq.com', 2);
INSERT INTO `tb_emp` VALUES (265, 'oneice66f64', 2, 'oneice66f64@qq.com', 1);
INSERT INTO `tb_emp` VALUES (266, 'oneiceea465', 2, 'oneiceea465@qq.com', 2);
INSERT INTO `tb_emp` VALUES (267, 'oneicec1766', 1, 'oneicec1766@qq.com', 2);
INSERT INTO `tb_emp` VALUES (268, 'oneice8d667', 2, 'oneice8d667@qq.com', 2);
INSERT INTO `tb_emp` VALUES (269, 'oneice82268', 1, 'oneice82268@qq.com', 2);
INSERT INTO `tb_emp` VALUES (270, 'oneice9c769', 2, 'oneice9c769@qq.com', 1);
INSERT INTO `tb_emp` VALUES (271, 'oneice45c70', 2, 'oneice45c70@qq.com', 2);
INSERT INTO `tb_emp` VALUES (272, 'oneice3d071', 1, 'oneice3d071@qq.com', 2);
INSERT INTO `tb_emp` VALUES (273, 'oneicea1872', 2, 'oneicea1872@qq.com', 1);
INSERT INTO `tb_emp` VALUES (274, 'oneice46973', 2, 'oneice46973@qq.com', 2);
INSERT INTO `tb_emp` VALUES (275, 'oneice2c474', 1, 'oneice2c474@qq.com', 2);
INSERT INTO `tb_emp` VALUES (276, 'oneice12f75', 1, 'oneice12f75@qq.com', 2);
INSERT INTO `tb_emp` VALUES (277, 'oneicec3976', 1, 'oneicec3976@qq.com', 3);
INSERT INTO `tb_emp` VALUES (278, 'oneicee6077', 2, 'oneicee6077@qq.com', 1);
INSERT INTO `tb_emp` VALUES (279, 'oneice02978', 1, 'oneice02978@qq.com', 1);
INSERT INTO `tb_emp` VALUES (280, 'oneiceb7579', 1, 'oneiceb7579@qq.com', 2);
INSERT INTO `tb_emp` VALUES (281, 'oneice96c80', 2, 'oneice96c80@qq.com', 2);
INSERT INTO `tb_emp` VALUES (282, 'oneice5f781', 1, 'oneice5f781@qq.com', 3);
INSERT INTO `tb_emp` VALUES (283, 'oneice45482', 1, 'oneice45482@qq.com', 1);
INSERT INTO `tb_emp` VALUES (284, 'oneice92883', 1, 'oneice92883@qq.com', 2);
INSERT INTO `tb_emp` VALUES (285, 'oneice7b784', 2, 'oneice7b784@qq.com', 2);
INSERT INTO `tb_emp` VALUES (286, 'oneice45f85', 2, 'oneice45f85@qq.com', 3);
INSERT INTO `tb_emp` VALUES (287, 'oneice73786', 1, 'oneice73786@qq.com', 2);
INSERT INTO `tb_emp` VALUES (288, 'oneice3d587', 2, 'oneice3d587@qq.com', 3);
INSERT INTO `tb_emp` VALUES (289, 'oneice7ca88', 2, 'oneice7ca88@qq.com', 2);
INSERT INTO `tb_emp` VALUES (290, 'oneice6ac89', 1, 'oneice6ac89@qq.com', 3);
INSERT INTO `tb_emp` VALUES (291, 'oneice8a490', 1, 'oneice8a490@qq.com', 1);
INSERT INTO `tb_emp` VALUES (292, 'oneice0e891', 2, 'oneice0e891@qq.com', 1);
INSERT INTO `tb_emp` VALUES (293, 'oneice42c92', 2, 'oneice42c92@qq.com', 2);
INSERT INTO `tb_emp` VALUES (294, 'oneicecb493', 2, 'oneicecb493@qq.com', 2);
INSERT INTO `tb_emp` VALUES (295, 'oneiceecb94', 1, 'oneiceecb94@qq.com', 2);
INSERT INTO `tb_emp` VALUES (296, 'oneiced6d95', 2, 'oneiced6d95@qq.com', 1);
INSERT INTO `tb_emp` VALUES (297, 'oneice28996', 1, 'oneice28996@qq.com', 1);
INSERT INTO `tb_emp` VALUES (298, 'oneice87497', 2, 'oneice87497@qq.com', 1);
INSERT INTO `tb_emp` VALUES (299, 'oneice9d398', 1, 'oneice9d398@qq.com', 2);
INSERT INTO `tb_emp` VALUES (300, 'oneice17399', 2, 'oneice17399@qq.com', 2);

SET FOREIGN_KEY_CHECKS = 1;

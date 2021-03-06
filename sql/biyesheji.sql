/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : biyesheji

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 11/05/2019 17:29:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cetgrade
-- ----------------------------
DROP TABLE IF EXISTS `cetgrade`;
CREATE TABLE `cetgrade`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` bigint(20) NOT NULL,
  `levelEaxmCourse` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eaxmTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `listenGrade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `readingGrade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `writingGrade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spokenGrade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cetgrade
-- ----------------------------
INSERT INTO `cetgrade` VALUES ('2017春季', 4225111212, '英语四级', '42539', '515', '42048015140', '197', '158', '160', '0');
INSERT INTO `cetgrade` VALUES ('2018春季', 4225111212, '英语六级', '42539', '515', '42048015140', '197', '158', '160', '0');
INSERT INTO `cetgrade` VALUES ('2018秋季', 4225111212, '英语六级', '42539', '544', '42048451509', '197', '183', '164', '0');
INSERT INTO `cetgrade` VALUES ('2018秋季', 4225111212, '英语六级', '42539', '488', '42004015356', '182', '162', '144', '0');
INSERT INTO `cetgrade` VALUES ('2018春季', 2125101235, '英语六级', '42539', '571', '42478056150', '207', '191', '173', '0');
INSERT INTO `cetgrade` VALUES ('2017秋季', 2125101235, '英语六级', '42539', '521', '42478056150', '172', '170', '179', '0');
INSERT INTO `cetgrade` VALUES ('2018秋季', 2125101235, '英语六级', '42539', '508', '42478056150', '167', '183', '158', '0');

-- ----------------------------
-- Table structure for courseschedule
-- ----------------------------
DROP TABLE IF EXISTS `courseschedule`;
CREATE TABLE `courseschedule`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `week` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weekday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `joint` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classplace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseschedule
-- ----------------------------
INSERT INTO `courseschedule` VALUES ('2017秋季', '4225111212', '第1周', '星期一', '1-2', 'C语言程序设计', '小英', '教1-213');
INSERT INTO `courseschedule` VALUES ('2017秋季', '4225111212', '第1周', '星期二', '3-4', 'C语言程序设计', '小英', '教1-213');
INSERT INTO `courseschedule` VALUES ('2017秋季', '4225111212', '第1周', '星期三', '6-7', 'java程序设计', '小英', '教1-214');
INSERT INTO `courseschedule` VALUES ('2017秋季', '4225111212', '第1周', '星期四', '8-9', '高数', '小王', '教1-215');
INSERT INTO `courseschedule` VALUES ('2017秋季', '4225111212', '第1周', '星期五', '3-4', '大学英语', '小王', '教2-316');
INSERT INTO `courseschedule` VALUES ('2017春季', '4225111212', '第1周', '星期一', '8-9', '马克思主义理论', '小王', '教1-412');
INSERT INTO `courseschedule` VALUES ('2017春季', '4225111212', '第1周', '星期二', '1-2', '近代史', '小王', '教3-310');
INSERT INTO `courseschedule` VALUES ('2017春季', '4225111212', '第1周', '星期三', '10-12', '大学生职业规划', '小王', '教4-219');
INSERT INTO `courseschedule` VALUES ('2017春季', '4225111212', '第1周', '星期四', '3-4', '高数', '小王', '教1-220');
INSERT INTO `courseschedule` VALUES ('2018秋季', '4225111212', '第1周', '星期五', '10-12', '大学物理', '小王', '教1-109');
INSERT INTO `courseschedule` VALUES ('2018秋季', '4225111212', '第1周', '星期一', '6-7', '大学英语', '小王', '教3-222');
INSERT INTO `courseschedule` VALUES ('2018秋季', '4225111212', '第1周', '星期二', '8-9', '高数', '小王', '教1-223');
INSERT INTO `courseschedule` VALUES ('2018秋季', '4225111212', '第1周', '星期三', '3-4', 'C语言程序设计', '小王', '教1-224');
INSERT INTO `courseschedule` VALUES ('2018秋季', '4225111212', '第1周', '星期四', '8-9', '线性代数', '小王', '教2-225');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期五', '1-2', '电路', '小王', '教2-420');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期一', '8-9', '大学物理', '小王', '教1-227');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期二', '1-2', 'java程序设计', '小王', '教1-110');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期三', '1-2', '近代史', '小王', '教1-229');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期四', '6-7', '高数', '小王', '教3-230');
INSERT INTO `courseschedule` VALUES ('2018春季', '4225111212', '第1周', '星期五', '6-7', '大学英语', '小王', '教1-102');

-- ----------------------------
-- Table structure for examarrange
-- ----------------------------
DROP TABLE IF EXISTS `examarrange`;
CREATE TABLE `examarrange`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examCourse` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examWay` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examDate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examWeek` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examCampus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examplace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examSeatNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examarrange
-- ----------------------------
INSERT INTO `examarrange` VALUES ('2017秋季', '4225111212', '小明', 'C语言程序设计', '闭卷', '2017/11/14', '08:30--10:05', '18', '大学城校区', '教3-110', '25');
INSERT INTO `examarrange` VALUES ('2017秋季', '4225111212', '小明', '大学英语', '闭卷', '2017/11/15', '14:00--16:00', '18', '大学城校区', '教3-111', '25');
INSERT INTO `examarrange` VALUES ('2017秋季', '4225111212', '小明', '高数', '闭卷', '2017/11/16', '08:30--10:05', '18', '大学城校区', '教3-112', '25');
INSERT INTO `examarrange` VALUES ('2017秋季', '4225111212', '小明', '计算机组成原理', '闭卷', '2017/11/17', '14:40--16:15', '18', '大学城校区', '教3-113', '25');
INSERT INTO `examarrange` VALUES ('2017秋季', '4225111212', '小明', '自动化控制原理', '闭卷', '2017/11/18', '10:25--12:00', '18', '大学城校区', '教3-114', '25');
INSERT INTO `examarrange` VALUES ('2018秋季', '4225111212', '小明', '大学物理', '闭卷', '2018/11/19', '08:30--10:05', '18', '大学城校区', '教3-115', '25');
INSERT INTO `examarrange` VALUES ('2018秋季', '4225111212', '小明', '线性代数', '闭卷', '2018/11/20', '14:00--16:00', '18', '大学城校区', '教3-116', '25');
INSERT INTO `examarrange` VALUES ('2018秋季', '4225111212', '小明', '近代史', '闭卷', '2018/11/21', '08:30--10:05', '18', '大学城校区', '教3-117', '25');
INSERT INTO `examarrange` VALUES ('2018秋季', '4225111212', '小明', '面向对象程序设计', '闭卷', '2018/11/22', '14:40--16:15', '18', '大学城校区', '教3-118', '25');

-- ----------------------------
-- Table structure for exemptionapply
-- ----------------------------
DROP TABLE IF EXISTS `exemptionapply`;
CREATE TABLE `exemptionapply`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applyReason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exemptionapply
-- ----------------------------
INSERT INTO `exemptionapply` VALUES ('2017秋季', '4225111212', '高数', '考试对我来说太简单了');
INSERT INTO `exemptionapply` VALUES ('2017秋季', '4225111212', '', '');
INSERT INTO `exemptionapply` VALUES ('2017秋季', '4225111212', 'C语言程序设计	', '生病');

-- ----------------------------
-- Table structure for levelexam
-- ----------------------------
DROP TABLE IF EXISTS `levelexam`;
CREATE TABLE `levelexam`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applyTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examCost` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of levelexam
-- ----------------------------
INSERT INTO `levelexam` VALUES ('2017秋季', 'CET6-123', '英语六级', '2017-03-09 00:01:14', '2017-06-16', '36元');
INSERT INTO `levelexam` VALUES ('2017春季', 'CET6-124', '英语六级', '2017-03-09 00:01:15', '2017-06-17', '36元');
INSERT INTO `levelexam` VALUES ('2018秋季', 'CET6-125', '英语六级', '2018-03-09 00:01:16', '2017-06-18', '36元');
INSERT INTO `levelexam` VALUES ('2018春季', 'CET6-126', '英语六级', '2018-03-09 00:01:17', '2017-06-19', '36元');
INSERT INTO `levelexam` VALUES ('2018秋季', 'CET4-257', '英语四级', '2018-03-09 00:01:18', '2017-06-20', '36元');
INSERT INTO `levelexam` VALUES ('2018春季', 'CET4-258', '英语四级', '2018-03-09 00:01:19', '2017-06-21', '36元');
INSERT INTO `levelexam` VALUES ('2017秋季', 'CET4-259', '英语四级', '2017-03-09 00:01:20', '2017-06-22', '36元');
INSERT INTO `levelexam` VALUES ('2017春季', 'CET4-260', '英语四级', '2017-03-09 00:01:21', '2017-06-23', '36元');
INSERT INTO `levelexam` VALUES ('2017春季', 'MPL1799', '计算机水平考试二级(C语言)', '2017-03-09 00:01:22', '2017-06-24', '44元');
INSERT INTO `levelexam` VALUES ('2017春季', 'MPL1800', '计算机水平考试二级(office应用)', '2017-03-09 00:01:23', '2017-06-25', '45元');
INSERT INTO `levelexam` VALUES ('2017春季', 'MPL1799', '计算机水平考试二级java程序设计)', '2017-03-09 00:01:24', '2017-06-26', '46元');
INSERT INTO `levelexam` VALUES ('2017秋季', 'MPL1799', '计算机水平考试二级(C语言)', '2017-03-09 00:01:22', '2017-06-24', '44元');
INSERT INTO `levelexam` VALUES ('2017秋季', 'MPL1800', '计算机水平考试二级(office应用)', '2017-03-09 00:01:23', '2017-06-25', '45元');
INSERT INTO `levelexam` VALUES ('2017秋季', 'MPL1799', '计算机水平考试二级java程序设计)', '2017-03-09 00:01:24', '2017-06-26', '46元');

-- ----------------------------
-- Table structure for levelexamlist
-- ----------------------------
DROP TABLE IF EXISTS `levelexamlist`;
CREATE TABLE `levelexamlist`  (
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of levelexamlist
-- ----------------------------
INSERT INTO `levelexamlist` VALUES ('4225111212', 'CET4-259');

-- ----------------------------
-- Table structure for optionalcourse
-- ----------------------------
DROP TABLE IF EXISTS `optionalcourse`;
CREATE TABLE `optionalcourse`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classWay` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of optionalcourse
-- ----------------------------
INSERT INTO `optionalcourse` VALUES ('2017秋季', 'MPL1791', '世界文学名著欣赏', '1.5', '人文社会科学类', '小英', '慕课', '第2-9周 周二 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017秋季', 'MPL1792', '市场营销学', '1.5', '人文社会科学类', '小风', '正常上课', '第10-18周 周二 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017秋季', 'MPL1793', '影视鉴赏', '2.0', '人文社会科学类', '大王', '正常上课', '第2-9周 周一 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017秋季', 'MPL1794', '生物细胞科学', '1.5', '工程技术基础类', '大佬', '正常上课', '第2-10周 周二 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018秋季', 'MPL1795', '探秘自动化', '1.5', '人文社会科学类', '小华', '正常上课', '第2-9周 周四 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018秋季', 'MPL1796', '神奇的润滑', '2.0', '人文社会科学类', '小哥', '正常上课', '第10-18周 周二 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018秋季', 'MPL1797', '中华诗词', '1.5', '人文社会科学类', '老大', '正常上课', '第2-9周 周三 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017春季', 'MPL1798', 'C++图形用户界面', '1.5', '工程技术基础类', '小黑', '正常上课', '第2-9周 周一10-12节');
INSERT INTO `optionalcourse` VALUES ('2017春季', 'MPL1799', '现代公司企业法', '1.5', '人文社会科学类', '大哥', '正常上课', '第2-9周 周五 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017春季', 'MPL1800', '法论', '1.5', '人文社会科学类', '龙大', '慕课', '第10-18周 周二 10-12节');
INSERT INTO `optionalcourse` VALUES ('2017秋季', 'MKL885', '高等数学', '3', '公共基础', '王老师', '面授', '第2-9周 周四 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018秋季', 'MKL885', '高等数学', '3', '公共基础', '王老师', '面授', '第2-9周 周四 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018春季', 'MKL885', 'C语言程序设计', '3', '专业课', '王老师', '面授', '第2-9周 周四 10-12节');
INSERT INTO `optionalcourse` VALUES ('2018春季', 'MKL886', '计算机', '2', '专业课', '王老师', '机房', '第2-9周 周四 10-12节');

-- ----------------------------
-- Table structure for postponeexamapply
-- ----------------------------
DROP TABLE IF EXISTS `postponeexamapply`;
CREATE TABLE `postponeexamapply`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applyReason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of postponeexamapply
-- ----------------------------
INSERT INTO `postponeexamapply` VALUES ('2017秋季', '4225111212', '电路', '我不想考试');
INSERT INTO `postponeexamapply` VALUES ('2017春季', '4225111212', '高数', '老子特么不想学习');
INSERT INTO `postponeexamapply` VALUES ('2017秋季', '4225111212', '大学英语', '太难了，我还需要再学一下');
INSERT INTO `postponeexamapply` VALUES ('2017秋季', '4225111212', 'C语言程序设计	', '生病');
INSERT INTO `postponeexamapply` VALUES ('2017秋季', '4225111212', 'C语言程序设计	', '生病');

-- ----------------------------
-- Table structure for studentbasicinformation
-- ----------------------------
DROP TABLE IF EXISTS `studentbasicinformation`;
CREATE TABLE `studentbasicinformation`  (
  `studentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `className` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `academy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `campus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homeAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4225111213 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentbasicinformation
-- ----------------------------
INSERT INTO `studentbasicinformation` VALUES (4225111212, '小明', '男', '2015级', '电子15(1)', '电子信息学院', '电子信息工程', '大学城校区', '19712345423', '广东省广州市');

-- ----------------------------
-- Table structure for studentgrade
-- ----------------------------
DROP TABLE IF EXISTS `studentgrade`;
CREATE TABLE `studentgrade`  (
  `yearTerm` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentId` bigint(20) NOT NULL,
  `studentName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gradePoint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseClass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studyWay` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examWay` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gradeWay` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `effectivity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentgrade
-- ----------------------------
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1256', '电磁场与微波技术', '88', '3.8', '2', '专业基础课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1786', '常用EDA系统设计', '95', '4.5', '1.5', '公共选修课', '选修', '正常考试', '百分制', '1', ',工程技术基础类');
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1787', '通信原理', '87', '3.7', '3', '专业基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1788', '通信原理实验', '85', '3.5', '0.5', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1789', '微机原理与单片机技术', '85', '3.5', '3', '专业基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017秋季', 4225111212, '小明', 'HFP1790', '微机原理与单片机技术实验', '86', '3.6', '1', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1791', '通信系统', '82', '3.2', '2', '专业基础课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1792', '专业英语', '94', '4.4', '2', '专业基础课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1793', '数字信号处理', '83', '3.3', '2', '专业课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1794', 'VHDL设计实验', '95', '4.5', '1', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1795', 'EDA电子技术实训', '95', '4.5', '2', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1796', '电子技术综合设计与实践', '85', '3.5', '1', '设计(论文)', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2017春季', 4225111212, '小明', 'HFP1797', 'VHDL设计基础', '95', '4.5', '1.5', '专业方向课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1798', '线性代数', '90', '4', '2', '专业基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1799', '世界文学名著欣赏', '85', '3.5', '1.5', '公共选修课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1800', '信号与系统实验', '95', '4.5', '0.5', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1801', '应用文写作', '95', '4.5', '1.5', '公共选修课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1802', '信号与系统', '95', '4.5', '3', '专业基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1803', '市场营销学', '88', '3.8', '1.5', '公共选修课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1804', '复变函数与积分变换', '96', '4.6', '2', '专业基础课', '选修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018秋季', 4225111212, '小明', 'HFP1805', '马克思主义基本原理', '91', '4.1', '3', '公共基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1806', '大学物理实验(2)', '85', '3.5', '1.5', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1807', '大学英语(3)', '93', '4.3', '4', '公共基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1808', '模拟电子技术', '92', '4.2', '3.5', '专业基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1809', '模拟电子技术实验', '85', '3.5', '1', '实验实习实训', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1810', '体育(3)', '90', '4', '2', '公共基础课', '必修', '正常考试', '百分制', '1', '');
INSERT INTO `studentgrade` VALUES ('2018春季', 4225111212, '小明', 'HFP1811', '大学物理(2)', '77', '2.7', '4', '公共基础课', '必修', '正常考试', '百分制', '1', '');

-- ----------------------------
-- Table structure for studentoptcourse
-- ----------------------------
DROP TABLE IF EXISTS `studentoptcourse`;
CREATE TABLE `studentoptcourse`  (
  `studentId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `courseId`(`courseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentoptcourse
-- ----------------------------
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1791');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1792');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1794');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MKL885');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1796');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1795');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1797');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1798');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MPL1799');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MKL886');
INSERT INTO `studentoptcourse` VALUES ('4225111212', 'MKL768');
INSERT INTO `studentoptcourse` VALUES ('123456', 'HFP1798');

-- ----------------------------
-- Table structure for teacherinformation
-- ----------------------------
DROP TABLE IF EXISTS `teacherinformation`;
CREATE TABLE `teacherinformation`  (
  `teacherId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacherName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `politicstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nativeplace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `academy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profession` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacherinformation
-- ----------------------------
INSERT INTO `teacherinformation` VALUES ('123456', '小英', '女', '党员', '汉族', '广东广州', '计算机学院', '计算机科学与技术', '123456', '江苏南京', '123@qq.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123');
INSERT INTO `user` VALUES (2, '123456', '123456');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `findMMproof` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_last_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password_last_changed` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('123456', '123456', '小英            ', '教师', '123456', '2019-05-11 13:52:27', '2019-05-11 13:52:27');
INSERT INTO `users` VALUES ('4225111212', '123456', '小明    ', '学生', '123456 ', '2019-05-11 13:54:57', '2019-05-11 13:54:57');
INSERT INTO `users` VALUES ('admin', 'admin', '管理员   ', '管理员', '123456', '2019-05-11 13:52:55', '2019-05-11 13:52:55');

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : effort1

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-05-22 10:57:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_type
-- ----------------------------
DROP TABLE IF EXISTS `data_type`;
CREATE TABLE `data_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Data_Type` varchar(500) DEFAULT NULL,
  `Data_N_Type` varchar(500) DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of data_type
-- ----------------------------
INSERT INTO `data_type` VALUES ('1', '01', '登录帧', '2021-05-21 16:30:47', null);
INSERT INTO `data_type` VALUES ('2', '02', 'heartbeat帧', '2021-05-21 16:30:47', null);
INSERT INTO `data_type` VALUES ('3', '03', '控制帧', '2021-05-21 16:30:47', null);
INSERT INTO `data_type` VALUES ('4', '04', '状态帧', '2021-05-21 16:30:47', null);

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `Device_ID` varchar(500) DEFAULT NULL,
  `IP` varchar(500) DEFAULT NULL,
  `Device_Type` bigint DEFAULT NULL,
  `Station_ID` bigint DEFAULT NULL,
  `Parameters_ID` bigint DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  `FGC_CreateDate` datetime DEFAULT NULL,
  `FGC_LastModifier` varchar(500) DEFAULT NULL,
  `FGC_LastModifyDate` datetime DEFAULT NULL,
  `FGC_Creator` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('12345678', '192.168.0.88', '1', '1', '1', '2021-05-21 16:30:47', null, null, null, null, null);
INSERT INTO `device` VALUES ('12345679', '192.168.0.89', '5', '1', '1', '2021-05-21 16:30:47', null, null, null, null, null);

-- ----------------------------
-- Table structure for device_info
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `IP` varchar(500) DEFAULT NULL,
  `Frame_Header` varchar(500) DEFAULT NULL,
  `Device_Type` varchar(500) DEFAULT NULL,
  `Device_ID` varchar(500) NOT NULL,
  `Data_Type` varchar(500) DEFAULT NULL,
  `Command` varchar(500) DEFAULT NULL,
  `Parameter_Length` varchar(500) DEFAULT NULL,
  `Parameters` varchar(500) DEFAULT NULL,
  `Check_Word` varchar(500) NOT NULL,
  `Frame_Tail` varchar(500) DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Create_time` datetime DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_info
-- ----------------------------

-- ----------------------------
-- Table structure for device_info_translation
-- ----------------------------
DROP TABLE IF EXISTS `device_info_translation`;
CREATE TABLE `device_info_translation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `IP` varchar(500) DEFAULT NULL,
  `Device_Type` varchar(500) DEFAULT NULL,
  `Device_ID` varchar(500) NOT NULL,
  `Data_Type` varchar(500) DEFAULT NULL,
  `Command` varchar(500) DEFAULT NULL,
  `Parameter_Length` varchar(500) DEFAULT NULL,
  `Parameters` varchar(500) DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Create_time` datetime DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_info_translation
-- ----------------------------
INSERT INTO `device_info_translation` VALUES ('90', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作正常\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:24', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('91', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作异常\",\n\"工作异常时故障类型\":\"电池故障\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:28', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('92', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作正常\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:30', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('93', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作异常\",\n\"工作异常时故障类型\":\"电池故障\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:40', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('94', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作正常\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:42', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('95', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作异常\",\n\"工作异常时故障类型\":\"电池故障\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:44', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('96', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作正常\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:46', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('97', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作异常\",\n\"工作异常时故障类型\":\"电池故障\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:53', '2021-05-21 16:30:36', null);
INSERT INTO `device_info_translation` VALUES ('98', '192.168.0.88', '应急灯具', '12345678', '状态帧', '应急电源状态', '13', '{\"工作状态\":\"工作正常\",\n\"电池剩余应急时间提示\":\"0\",\n\"电池剩余寿命提示\":\"0\",\n\"电池电压\":\"6000\",\n\"LED负载输出电压\":\"0\",\n\"当前工作状态\":\"充电状态\",\n\"市电情况下，LED灯的属性\":\"nomaintain模式\",\n\"充电时灯的状态\":\"充电亮灯\"}', null, '2021-04-22 14:30:59', '2021-05-21 16:30:36', null);

-- ----------------------------
-- Table structure for device_parameters_new
-- ----------------------------
DROP TABLE IF EXISTS `device_parameters_new`;
CREATE TABLE `device_parameters_new` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Device_ID` varchar(500) NOT NULL,
  `Work_status` varchar(500) DEFAULT NULL,
  `Time_Remaining_emergency` datetime DEFAULT NULL,
  `Time_Remaining_Life` datetime DEFAULT NULL,
  `Battery_Voltage` varchar(500) DEFAULT NULL,
  `LED_LoadOutputVoltage` varchar(500) DEFAULT NULL,
  `Battery_status` varchar(500) DEFAULT NULL,
  `LED_property` varchar(500) DEFAULT NULL,
  `is_start` varchar(20) DEFAULT NULL,
  `ChargingLight_status` varchar(500) DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  `FGC_CreateDate` datetime DEFAULT NULL,
  `FGC_LastModifier` varchar(500) DEFAULT NULL,
  `FGC_LastModifyDate` datetime DEFAULT NULL,
  `FGC_Creator` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_parameters_new
-- ----------------------------
INSERT INTO `device_parameters_new` VALUES ('1', '12345678', '工作正常', '1899-12-30 00:00:00', '1899-12-30 00:00:00', '6000', '0', '充电状态', 'nomaintain模式', '开启', '充电亮灯', '2021-05-21 16:45:01', 'c8d9a5ff-ba80-4296-9708-06fefa041bbf', null, 'Administrator', '2021-05-21 16:45:02', null);
INSERT INTO `device_parameters_new` VALUES ('2', '12345679', '工作异常', '1899-12-30 00:00:00', '1899-12-30 00:00:00', '5000', '0', '应急状态', 'maintain模式', '开启', '充电灭灯', '2021-05-21 16:45:06', '53fc6d17-fe75-4b96-8e05-10c6e8e3c45c', null, 'Administrator', '2021-05-21 16:45:07', null);

-- ----------------------------
-- Table structure for device_status
-- ----------------------------
DROP TABLE IF EXISTS `device_status`;
CREATE TABLE `device_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Device_Type` varchar(500) DEFAULT NULL,
  `Command` varchar(500) DEFAULT NULL,
  `Command_N` varchar(500) DEFAULT NULL,
  `Parameter_Length` bigint DEFAULT NULL,
  `Parameters_index` varchar(500) DEFAULT NULL,
  `Parameters_N_index` varchar(500) DEFAULT NULL,
  `Parameter` varchar(500) DEFAULT NULL,
  `Parameter_N` varchar(500) DEFAULT NULL,
  `Parameter_type` bigint DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_status
-- ----------------------------
INSERT INTO `device_status` VALUES ('15', '01', '01', '寿命测试状态', '1', '1', '寿命测试状态', '00', '停止测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('16', '01', '01', '寿命测试状态', '1', '1', '寿命测试状态', '01', '测试开始', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('17', '01', '01', '寿命测试状态', '1', '1', '寿命测试状态', '02', '电池非充满状态，现在不能进行测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('18', '01', '02', '应急电源开关状态', '2', '1', '应急电源开关状态', '01', '打开', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('19', '01', '02', '应急电源开关状态', '2', '1', '应急电源开关状态', '02', '闪烁', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('20', '01', '02', null, '2', '2', '方向标志', '00', '左', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('21', '01', '02', null, '2', '2', '方向标志', '01', '右', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('22', '01', '03', '应急灯具闪烁测试\r\n状态', '1', '1', '闪烁次数', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('23', '01', '04', '应急电源状态', '13', '1', '工作状态', '00', '工作正常', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('24', '01', '04', '应急电源状态', '13', '1', '工作状态', '01', '工作异常', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('25', '01', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '01', '电池容量不足', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('26', '01', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '02', '电池故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('27', '01', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '03', '充放电管理系统故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('28', '01', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '05', 'LED负载故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('29', '01', '04', '应急电源状态', '13', '3', '电池剩余应急时间提示', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('30', '01', '04', '应急电源状态', '13', '4', '电池剩余应急时间提示', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('31', '01', '04', '应急电源状态', '13', '5', '电池剩余寿命提示', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('32', '01', '04', '应急电源状态', '13', '6', '电池剩余寿命提示', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('33', '01', '04', '应急电源状态', '13', '7', '电池电压', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('34', '01', '04', '应急电源状态', '13', '8', '电池电压', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('35', '01', '04', '应急电源状态', '13', '9', 'LED负载输出电压', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('36', '01', '04', '应急电源状态', '13', '10', 'LED负载输出电压', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('37', '01', '04', '应急电源状态', '13', '11', '当前工作状态', '00', '电池满电状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('38', '01', '04', '应急电源状态', '13', '11', '当前工作状态', '01', '充电状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('39', '01', '04', '应急电源状态', '13', '11', '当前工作状态', '02', '应急状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('40', '01', '04', '应急电源状态', '13', '11', '当前工作状态', '03', '应急休止状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('41', '01', '04', '应急电源状态', '13', '12', '市电情况下，LED灯的属性', '00', 'maintain模式', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('42', '01', '04', '应急电源状态', '13', '12', '市电情况下，LED灯的属性', '01', 'nomaintain模式', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('43', '01', '04', '应急电源状态', '13', '13', '充电时灯的状态', '00', '充电亮灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('44', '01', '04', '应急电源状态', '13', '13', '充电时灯的状态', '01', '充电灭灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('45', '01', '05', '功能测试状态', '1', '1', '开关标志', '00', '测试停止', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('46', '01', '05', '功能测试状态', '1', '1', '开关标志', '01', '测试中', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('47', '01', '06', '初始ZigBee设备', '0', null, '恢复zigbee设备至初始化状态', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('48', '01', '07', '检测过程中发现断电，设备退出检测', '0', null, '主机从测试过程中退出，等待断电恢复', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('49', '01', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '00', '断电恢复，但条件不允许进入任何测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('50', '01', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '01', '断电恢复，条件允许进入功能检测', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('51', '01', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '02', '断电恢复，条件允许进入寿命检测', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('52', '01', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '00', '充电亮灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('53', '01', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '01', '充电灭灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status` VALUES ('54', '01', '02', '应急电源开关', '2', '1', '开关标志', '00', '关闭', '1', '2021-05-21 16:30:36', null);

-- ----------------------------
-- Table structure for device_status_copy
-- ----------------------------
DROP TABLE IF EXISTS `device_status_copy`;
CREATE TABLE `device_status_copy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Device_Type` varchar(500) DEFAULT NULL,
  `Data_Type` varchar(500) DEFAULT NULL,
  `Command` varchar(500) DEFAULT NULL,
  `Command_N` varchar(500) DEFAULT NULL,
  `Parameter_Length` bigint DEFAULT NULL,
  `Parameters_index` varchar(500) DEFAULT NULL,
  `Parameters_N_index` varchar(500) DEFAULT NULL,
  `is_End` bigint DEFAULT NULL,
  `Parameter` varchar(500) DEFAULT NULL,
  `Parameter_N` varchar(500) DEFAULT NULL,
  `Parameter_type` bigint DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_status_copy
-- ----------------------------
INSERT INTO `device_status_copy` VALUES ('1', '01', '01', 'FF', null, null, null, null, '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('2', '01', '02', 'FF', null, null, null, null, '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('3', '01', '03', '01', '寿命测试开始开关\r\n返回状态', '1', '1', '寿命测试返回状态', '1', '00', '停止测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('4', '01', '03', '01', '寿命测试开始开关\r\n返回状态', '1', '1', '寿命测试返回状态', '1', '01', '开始测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('5', '01', '03', '02', '应急电源开关', '2', '1', '开关标志', '0', '00', '关闭', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('6', '01', '03', '02', '应急电源开关', '2', '1', '开关标志', '0', '01', '打开', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('7', '01', '03', '02', '应急电源开关', '2', '2', '方向标志', '0', '00', '左', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('8', '01', '03', '02', '应急电源开关', '2', '2', '方向标志', '0', '01', '右', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('9', '01', '03', '03', '应急灯具闪烁测试', '1', '1', '闪烁次数', '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('10', '01', '03', '04', '查询应急设备状态', '0', null, null, '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('11', '01', '03', '05', '开始功能测试', '1', '1', '开关标志', '1', '00', '停止功能测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('12', '01', '03', '05', '开始功能测试', '1', '1', '开关标志', '1', '01', '开始功能测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('13', '01', '03', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '1', '00', '充电亮灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('14', '01', '03', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '1', '01', '充电灭灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('15', '01', '04', '01', '寿命测试状态', '1', '1', '寿命测试状态', '1', '00', '停止测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('16', '01', '04', '01', '寿命测试状态', '1', '1', '寿命测试状态', '1', '01', '测试开始', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('17', '01', '04', '01', '寿命测试状态', '1', '1', '寿命测试状态', '1', '02', '电池非充满状态，现在不能进行测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('18', '01', '04', '02', '应急电源开关状态', '2', '1', '应急电源开关状态', '0', '01', '打开', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('19', '01', '04', '02', '应急电源开关状态', '2', '1', '应急电源开关状态', '0', '02', '闪烁', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('20', '01', '04', '02', null, '2', '2', '方向标志', '0', '00', '左', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('21', '01', '04', '02', null, '2', '2', '方向标志', '0', '01', '右', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('22', '01', '04', '03', '应急灯具闪烁测试\r\n状态', '1', '1', '闪烁次数', '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('23', '01', '04', '04', '应急电源状态', '13', '1', '工作状态', '0', '00', '工作正常', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('24', '01', '04', '04', '应急电源状态', '13', '1', '工作状态', '0', '01', '工作异常', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('25', '01', '04', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '0', '01', '电池容量不足', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('26', '01', '04', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '0', '02', '电池故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('27', '01', '04', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '0', '03', '充放电管理系统故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('28', '01', '04', '04', '应急电源状态', '13', '2', '工作异常时故障类型', '0', '05', 'LED负载故障', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('29', '01', '04', '04', '应急电源状态', '13', '3', '电池剩余应急时间提示', '0', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('30', '01', '04', '04', '应急电源状态', '13', '4', '电池剩余应急时间提示', '0', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('31', '01', '04', '04', '应急电源状态', '13', '5', '电池剩余寿命提示', '0', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('32', '01', '04', '04', '应急电源状态', '13', '6', '电池剩余寿命提示', '0', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('33', '01', '04', '04', '应急电源状态', '13', '7', '电池电压', '0', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('34', '01', '04', '04', '应急电源状态', '13', '8', '电池电压', '0', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('35', '01', '04', '04', '应急电源状态', '13', '9', 'LED负载输出电压', '0', null, '高8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('36', '01', '04', '04', '应急电源状态', '13', '10', 'LED负载输出电压', '0', null, '低8位', '2', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('37', '01', '04', '04', '应急电源状态', '13', '11', '当前工作状态', '0', '00', '电池满电状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('38', '01', '04', '04', '应急电源状态', '13', '11', '当前工作状态', '0', '01', '充电状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('39', '01', '04', '04', '应急电源状态', '13', '11', '当前工作状态', '0', '02', '应急状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('40', '01', '04', '04', '应急电源状态', '13', '11', '当前工作状态', '0', '03', '应急休止状态', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('41', '01', '04', '04', '应急电源状态', '13', '12', '市电情况下，LED灯的属性', '0', '00', 'maintain模式', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('42', '01', '04', '04', '应急电源状态', '13', '12', '市电情况下，LED灯的属性', '0', '01', 'nomaintain模式', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('43', '01', '04', '04', '应急电源状态', '13', '13', '充电时灯的状态', '0', '00', '充电亮灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('44', '01', '04', '04', '应急电源状态', '13', '13', '充电时灯的状态', '0', '01', '充电灭灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('45', '01', '04', '05', '功能测试状态', '1', '1', '开关标志', '1', '00', '测试停止', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('46', '01', '04', '05', '功能测试状态', '1', '1', '开关标志', '1', '01', '测试中', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('47', '01', '04', '06', '初始ZigBee设备', '0', null, '恢复zigbee设备至初始化状态', '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('48', '01', '04', '07', '检测过程中发现断电，设备退出检测', '0', null, '主机从测试过程中退出，等待断电恢复', '1', null, null, '0', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('49', '01', '04', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '1', '00', '断电恢复，但条件不允许进入任何测试', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('50', '01', '04', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '1', '01', '断电恢复，条件允许进入功能检测', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('51', '01', '04', '08', '断电恢复', '1', '1', '是否可以进入推迟的检测', '1', '02', '断电恢复，条件允许进入寿命检测', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('52', '01', '04', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '1', '00', '充电亮灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('53', '01', '04', '09', '充电时亮灯或灭灯', '1', '1', '充电时灯的开关', '1', '01', '充电灭灯', '1', '2021-05-21 16:30:36', null);
INSERT INTO `device_status_copy` VALUES ('54', '01', '04', '02', '应急电源开关', '2', '1', '开关标志', '0', '00', '关闭', '1', '2021-05-21 16:30:36', null);

-- ----------------------------
-- Table structure for device_test
-- ----------------------------
DROP TABLE IF EXISTS `device_test`;
CREATE TABLE `device_test` (
  `Test_ID` bigint NOT NULL AUTO_INCREMENT,
  `Test_Name` varchar(500) DEFAULT NULL,
  `Device_ID` bigint DEFAULT NULL,
  `Test_Date` datetime DEFAULT NULL,
  `Test_Time` time DEFAULT NULL,
  `Test_Type` varchar(500) DEFAULT NULL,
  `Test_Time_Length` varchar(500) DEFAULT NULL,
  `Test_Frequency` varchar(500) DEFAULT NULL,
  `Test_Repeat_Time` varchar(500) DEFAULT NULL,
  `Running state` varchar(500) DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `FGC_Creator` varchar(500) DEFAULT NULL,
  `FGC_CreateDate` datetime DEFAULT NULL,
  `FGC_LastModifier` varchar(500) DEFAULT NULL,
  `FGC_LastModifyDate` datetime DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Test_ID`),
  UNIQUE KEY `Test_ID` (`Test_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_test
-- ----------------------------
INSERT INTO `device_test` VALUES ('10', '功能检测', '12345678', '2021-04-20 00:00:00', '10:00:00', '功能测试', 'True', null, null, null, null, 'Administrator', '2021-04-20 14:55:32', 'Administrator', '2021-04-20 14:55:32', '2021-05-21 16:30:36', null);
INSERT INTO `device_test` VALUES ('11', '功能检测0.2', '12345678', '2021-04-20 00:00:00', '09:30:00', '功能测试', 'True', null, null, null, null, 'Administrator', '2021-04-20 14:57:03', 'Administrator', '2021-04-20 14:57:03', '2021-05-21 16:30:36', null);
INSERT INTO `device_test` VALUES ('12', '功能检测0.3', '12345678', '2021-04-20 00:00:00', '10:00:00', '功能测试', '50', null, null, null, null, 'Administrator', '2021-04-20 14:59:54', 'Administrator', '2021-04-20 14:59:54', '2021-05-21 16:30:36', null);
INSERT INTO `device_test` VALUES ('13', '反对和嘎哈', '12345678', '2021-04-20 00:00:00', '16:19:59', '功能测试', '50', '  重复天数', '50', '运行正常', null, null, null, null, null, '2021-05-21 16:30:36', null);

-- ----------------------------
-- Table structure for device_type
-- ----------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Device_Type` varchar(500) DEFAULT NULL,
  `Device_N_Type` varchar(500) DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  `FGC_CreateDate` datetime DEFAULT NULL,
  `FGC_LastModifier` varchar(500) DEFAULT NULL,
  `FGC_LastModifyDate` datetime DEFAULT NULL,
  `FGC_Creator` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of device_type
-- ----------------------------
INSERT INTO `device_type` VALUES ('1', '01', '应急灯具', '2021-05-21 16:30:37', null, null, null, null, null);
INSERT INTO `device_type` VALUES ('2', '02', '逃生标识', '2021-05-21 16:30:37', null, null, null, null, null);
INSERT INTO `device_type` VALUES ('3', '03', '烟雾报警器', '2021-05-21 16:30:37', null, null, null, null, null);
INSERT INTO `device_type` VALUES ('4', '55', '网关', '2021-05-21 16:30:37', null, null, null, null, null);
INSERT INTO `device_type` VALUES ('5', '04', '疏散指示灯', '2021-05-21 16:30:37', null, null, null, null, null);

-- ----------------------------
-- Table structure for fgc_usd_ps2020xziueqja
-- ----------------------------
DROP TABLE IF EXISTS `fgc_usd_ps2020xziueqja`;
CREATE TABLE `fgc_usd_ps2020xziueqja` (
  `FGC_UserName` varchar(100) NOT NULL,
  `FGC_FullName` varchar(100) DEFAULT NULL,
  `FGC_Email` varchar(100) DEFAULT NULL,
  `FGC_Role` varchar(500) DEFAULT NULL,
  `FGC_OrganizationBelongsTo` varchar(500) DEFAULT NULL,
  `FGC_RootOrganizationCanAccess` varchar(500) DEFAULT NULL,
  `FGC_OrganizationQueryCache` varchar(500) DEFAULT NULL,
  `FGC_OrganizationSuperior` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`FGC_UserName`),
  UNIQUE KEY `FGC_UserName` (`FGC_UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fgc_usd_ps2020xziueqja
-- ----------------------------
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('Admin', 'Admin', 'test@example.com', '系统管理员', '5', '', '>5>1>', '|Administrator|');
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('Administrator', 'Administrator', 'example@example.com', 'Administrator', '1', '1', '>1>', '||');
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('张三', '张三', 'test@example.com', '财务部', '2', '', '>2>1>', '|Administrator|');
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('李四', '李四', 'test@example.com', '维修部', '3', '3', '>3>1>', '|Administrator|');
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('王五', '王五', 'test@example.com', '维修部', '3', '', '>3>1>', '|Administrator|李四|');
INSERT INTO `fgc_usd_ps2020xziueqja` VALUES ('赵六', '赵六', 'test@example.com', '生产部', '4', '', '>4>1>', '|Administrator|');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Station_Name` varchar(500) DEFAULT NULL,
  `Map` varchar(500) DEFAULT NULL,
  `FGC_Rowversion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FGC_UpdateHelp` varchar(500) DEFAULT NULL,
  `FGC_CreateDate` datetime DEFAULT NULL,
  `FGC_LastModifier` varchar(500) DEFAULT NULL,
  `FGC_LastModifyDate` datetime DEFAULT NULL,
  `FGC_Creator` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('1', '二楼301', null, '2021-05-21 16:30:37', null, null, null, null, null);

# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: 101.201.147.38    Database: dn2
# ------------------------------------------------------
# Server version 5.5.35

DROP DATABASE IF EXISTS `dn2`;
CREATE DATABASE `dn2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dn2`;

#
# Source for table tb_aqistation_info
#

DROP TABLE IF EXISTS `tb_aqistation_info`;
CREATE TABLE `tb_aqistation_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL COMMENT '所属城市id',
  `station_sn` varchar(20) DEFAULT NULL COMMENT '监测点编号',
  `station_name` varchar(50) DEFAULT NULL COMMENT '监测点名称',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '是否收集0否1是',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8;

#
# Source for table tb_area_info
#

DROP TABLE IF EXISTS `tb_area_info`;
CREATE TABLE `tb_area_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份id',
  `area_sn` varchar(20) DEFAULT NULL COMMENT '城市编号（市、区、县）',
  `area_name` varchar(50) DEFAULT NULL COMMENT '城市名称',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '是否收集0否1是',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2380 DEFAULT CHARSET=utf8;

#
# Source for table tb_audit_log
#

DROP TABLE IF EXISTS `tb_audit_log`;
CREATE TABLE `tb_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `obj_type` int(11) NOT NULL DEFAULT '0' COMMENT '审核对象类型',
  `obj_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核对象ID',
  `obj_xml` text COMMENT '对象XML',
  `is_approved` bit(1) DEFAULT NULL COMMENT '是否批准',
  `comment` mediumtext COMMENT '审核备注',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别',
  `auditor_user_id` int(11) DEFAULT NULL COMMENT '审核者ID',
  `auditor_name` varchar(255) DEFAULT NULL COMMENT '审核者姓名',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核日志表';

#
# Source for table tb_charge_actual_play_bill
#

DROP TABLE IF EXISTS `tb_charge_actual_play_bill`;
CREATE TABLE `tb_charge_actual_play_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `play_info_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '播放单id',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `play_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '播放日期',
  `start_time` time NOT NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `end_time` time NOT NULL DEFAULT '00:00:00' COMMENT '结束时间',
  `charge` double(24,2) DEFAULT '0.00' COMMENT ' 收费',
  `play_count` double(16,2) DEFAULT '0.00' COMMENT '播放次数',
  `single_play_during` double(16,2) DEFAULT '0.00' COMMENT '单次播放时间',
  `chargenote` varchar(400) DEFAULT NULL COMMENT '收费公式',
  PRIMARY KEY (`id`),
  KEY `fk_charge_play_bill_play_info_id` (`play_info_id`),
  KEY `fk_charge_play_bill_terminal_id` (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='播放实际明细单';

#
# Source for table tb_charge_bb_actual_day
#

DROP TABLE IF EXISTS `tb_charge_bb_actual_day`;
CREATE TABLE `tb_charge_bb_actual_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `play_info_id` bigint(20) DEFAULT NULL COMMENT '播放单id',
  `play_date` date DEFAULT NULL COMMENT '播放日期',
  `play_count` int(11) DEFAULT '0' COMMENT '播放次数',
  `terminal_count` int(11) DEFAULT '0' COMMENT '播放终端数量（在多少终端播放）',
  `charge` double(16,2) DEFAULT '0.00' COMMENT '费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table tb_charge_bb_plan_day
#

DROP TABLE IF EXISTS `tb_charge_bb_plan_day`;
CREATE TABLE `tb_charge_bb_plan_day` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `play_info_id` bigint(20) DEFAULT NULL COMMENT '播放单id',
  `play_date` date DEFAULT NULL COMMENT '播放日期',
  `play_count` int(11) DEFAULT '0' COMMENT '播放次数',
  `terminal_count` int(11) DEFAULT '0' COMMENT '播放终端数量（在多少终端播放）',
  `charge` double(16,2) DEFAULT '0.00' COMMENT '费用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Source for table tb_charge_customer_groups
#

DROP TABLE IF EXISTS `tb_charge_customer_groups`;
CREATE TABLE `tb_charge_customer_groups` (
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `user_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户组ID',
  PRIMARY KEY (`customer_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户和组关系';

#
# Source for table tb_charge_customer_info
#

DROP TABLE IF EXISTS `tb_charge_customer_info`;
CREATE TABLE `tb_charge_customer_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户Id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `company_name` varchar(80) NOT NULL DEFAULT '' COMMENT '公司中文名称',
  `company_ename` varchar(80) DEFAULT '' COMMENT '公司英文名',
  `link_man` varchar(80) DEFAULT '' COMMENT '联系人',
  `link_phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `fax` varchar(20) DEFAULT '' COMMENT '传真',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `email` varchar(80) DEFAULT '' COMMENT '邮件',
  `zip` varchar(6) DEFAULT '' COMMENT '邮编',
  `bank` varchar(80) DEFAULT '' COMMENT '银行名称',
  `bank_code` varchar(80) DEFAULT '' COMMENT '银行账户',
  `audit_status` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `dicount` double(3,2) NOT NULL DEFAULT '1.00' COMMENT '打折',
  `customer_type` int(11) NOT NULL DEFAULT '0' COMMENT '客户类型，普通，vip',
  `comments` mediumtext COMMENT '备注',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_charge_customer_info_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息';

#
# Source for table tb_charge_customer_users
#

DROP TABLE IF EXISTS `tb_charge_customer_users`;
CREATE TABLE `tb_charge_customer_users` (
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`customer_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户用户关系';

#
# Source for table tb_charge_date_weight
#

DROP TABLE IF EXISTS `tb_charge_date_weight`;
CREATE TABLE `tb_charge_date_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `special_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '特殊日期',
  `weight` double(3,2) NOT NULL DEFAULT '1.00' COMMENT '系数，比重',
  `comments` mediumtext COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日期系数';

#
# Source for table tb_charge_order_info
#

DROP TABLE IF EXISTS `tb_charge_order_info`;
CREATE TABLE `tb_charge_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '订单名称',
  `sequence_no` varchar(255) NOT NULL DEFAULT '' COMMENT '流水号',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '预定时间',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '预定状态',
  `audit_status` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `comments` mediumtext COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

#
# Source for table tb_charge_order_report
#

DROP TABLE IF EXISTS `tb_charge_order_report`;
CREATE TABLE `tb_charge_order_report` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `charge` double(20,2) NOT NULL DEFAULT '0.00' COMMENT '总费用',
  `is_plan` int(11) NOT NULL DEFAULT '0' COMMENT '计划/实际费用',
  `video_percent` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '视频比例',
  `audio_percent` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '音频比例',
  `pic_percent` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '图片比例',
  `txt_percent` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '文字比例',
  `bg_percent` double(3,2) NOT NULL DEFAULT '0.00' COMMENT '背景比例',
  `report_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '报表日期',
  `week_report` smallint(4) DEFAULT NULL COMMENT '周报表1-52',
  `month_report` smallint(6) DEFAULT NULL COMMENT '月报表1-12',
  `square_report` smallint(6) DEFAULT NULL COMMENT '季度报表1-4',
  `year_report` smallint(6) DEFAULT NULL COMMENT '年度报表',
  PRIMARY KEY (`Id`),
  KEY `fk_order_report_customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单计费报表';

#
# Source for table tb_charge_order_weight
#

DROP TABLE IF EXISTS `tb_charge_order_weight`;
CREATE TABLE `tb_charge_order_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type` int(11) NOT NULL DEFAULT '0' COMMENT '资源类型',
  `charge` double(20,2) NOT NULL DEFAULT '0.00' COMMENT '收费标准',
  `comments` mediumtext COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单计费标准';

#
# Source for table tb_charge_plan_play_bill
#

DROP TABLE IF EXISTS `tb_charge_plan_play_bill`;
CREATE TABLE `tb_charge_plan_play_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `play_info_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '播放单id',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `play_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '播放日期',
  `start_time` time NOT NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `end_time` time NOT NULL DEFAULT '00:00:00' COMMENT '结束时间',
  `charge` double(24,2) DEFAULT '0.00' COMMENT ' 收费',
  `play_count` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `single_play_during` int(11) NOT NULL DEFAULT '0' COMMENT '单次播放时间',
  `chargenote` varchar(400) DEFAULT NULL COMMENT '收费公式',
  PRIMARY KEY (`id`),
  KEY `fk_charge_play_bill_play_info_id` (`play_info_id`),
  KEY `fk_charge_play_bill_terminal_id` (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='播放计划明细单';

#
# Source for table tb_charge_play_info
#

DROP TABLE IF EXISTS `tb_charge_play_info`;
CREATE TABLE `tb_charge_play_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `charge_type` int(11) NOT NULL DEFAULT '0' COMMENT '收费标准类型',
  `media_info_id` int(11) NOT NULL DEFAULT '0' COMMENT '播放资源ID ，tb_media_info',
  `comments` mediumtext COMMENT '备注',
  `single_play_during` bigint(20) NOT NULL DEFAULT '0' COMMENT '时长',
  PRIMARY KEY (`id`),
  KEY `fk_charge_order_info_order_id` (`order_id`),
  KEY `fk_charge_order_info_media_info_id` (`media_info_id`),
  KEY `fk_charge_order_info_charge_type` (`charge_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='播放请求单';

#
# Source for table tb_charge_tag_weight
#

DROP TABLE IF EXISTS `tb_charge_tag_weight`;
CREATE TABLE `tb_charge_tag_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `weight` double(8,2) DEFAULT '1.00',
  `comments` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='标签权重表';

#
# Source for table tb_charge_terminal_weight
#

DROP TABLE IF EXISTS `tb_charge_terminal_weight`;
CREATE TABLE `tb_charge_terminal_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_group_id` int(11) DEFAULT NULL COMMENT '终端组ID',
  `weight` double(8,2) NOT NULL DEFAULT '1.00' COMMENT '系数',
  `comments` mediumtext COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_charge_terminal_weight_terminal_group_id` (`terminal_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端系数';

#
# Source for table tb_charge_time_weight
#

DROP TABLE IF EXISTS `tb_charge_time_weight`;
CREATE TABLE `tb_charge_time_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `end_time` time NOT NULL DEFAULT '00:00:00' COMMENT '结束时间',
  `weight` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '系数',
  `comments` mediumtext COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时间系数';

#
# Source for table tb_corp_info
#

DROP TABLE IF EXISTS `tb_corp_info`;
CREATE TABLE `tb_corp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业ID',
  `no` varchar(50) NOT NULL DEFAULT '' COMMENT '企业编号',
  `name` varchar(400) DEFAULT NULL COMMENT '企业名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_corp_info_no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业信息表';

#
# Source for table tb_customer_group_info
#

DROP TABLE IF EXISTS `tb_customer_group_info`;
CREATE TABLE `tb_customer_group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户分组ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级客户分组ID',
  `name` varchar(200) DEFAULT NULL COMMENT '客户分组名称',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '客户分组类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '客户分组属性标志位',
  `comment` text COMMENT '客户分组备注',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `fk_customer_group_info_corp_id` (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户分组信息表';

#
# Source for table tb_customer_group_relations
#

DROP TABLE IF EXISTS `tb_customer_group_relations`;
CREATE TABLE `tb_customer_group_relations` (
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父组ID',
  `level_no` int(11) NOT NULL DEFAULT '0' COMMENT '距离父级分组层次间隔',
  PRIMARY KEY (`group_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户分组关系结构表';

#
# Source for table tb_media_export_task
#

DROP TABLE IF EXISTS `tb_media_export_task`;
CREATE TABLE `tb_media_export_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导出计划id',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '任务状态',
  `progress` int(11) DEFAULT NULL COMMENT '任务执行进度百分比',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '媒体ID',
  `media_rev` int(11) NOT NULL DEFAULT '0' COMMENT '媒体版本',
  `media_name` varchar(400) DEFAULT NULL COMMENT '媒体名称',
  `export_file_path` varchar(400) DEFAULT 'null' COMMENT '导出文件路径',
  `export_file_size` bigint(20) DEFAULT NULL COMMENT '导出文件大小',
  `create_date` datetime DEFAULT NULL COMMENT '建创日期',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  PRIMARY KEY (`id`),
  KEY `program_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体导出任务表';

#
# Source for table tb_media_file_info
#

DROP TABLE IF EXISTS `tb_media_file_info`;
CREATE TABLE `tb_media_file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '媒体文件ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '文件名',
  `display_name` varchar(400) NOT NULL DEFAULT '' COMMENT '文件友好名',
  `path` varchar(300) NOT NULL DEFAULT '' COMMENT '文件存储路径',
  `checksum` varchar(50) DEFAULT NULL COMMENT '文件校验码',
  `length` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件长度',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '文件类型',
  `format` varchar(50) NOT NULL DEFAULT '' COMMENT '文件格式',
  `video_format` varchar(50) DEFAULT NULL COMMENT '视频格式',
  `audio_format` varchar(50) DEFAULT NULL COMMENT '音频格式',
  `width` int(11) DEFAULT NULL COMMENT '图像宽度',
  `height` int(11) DEFAULT NULL COMMENT '图像高度',
  `duration` decimal(10,2) DEFAULT NULL COMMENT '播放持续时长(秒)',
  `rotation` int(11) NOT NULL DEFAULT '0' COMMENT '画面逆时针旋转角度',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='媒体文件信息表';

#
# Source for table tb_media_files
#

DROP TABLE IF EXISTS `tb_media_files`;
CREATE TABLE `tb_media_files` (
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '媒体ID',
  `file_id` int(11) NOT NULL DEFAULT '0' COMMENT '文件ID',
  `sort_index` int(11) NOT NULL DEFAULT '0' COMMENT '排序序列',
  `display_name` varchar(400) DEFAULT NULL COMMENT '文件显示名称',
  PRIMARY KEY (`media_id`,`file_id`,`sort_index`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体文件对应表';

#
# Source for table tb_media_folder_info
#

DROP TABLE IF EXISTS `tb_media_folder_info`;
CREATE TABLE `tb_media_folder_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源文件夹ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级资源文件夹ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹属性',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '资源文件夹名称',
  `comment` mediumtext COMMENT '资源文件夹备注',
  `physical_path` mediumtext COMMENT '对应的物理路径',
  `owner_id` int(11) DEFAULT NULL COMMENT '所有者ID',
  `owner` varchar(50) DEFAULT NULL COMMENT '所有者',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `fk_media_folder_info_corp_info_id` (`corp_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='媒体文件夹信息表';

#
# Source for table tb_media_folder_relations
#

DROP TABLE IF EXISTS `tb_media_folder_relations`;
CREATE TABLE `tb_media_folder_relations` (
  `folder_id` int(11) NOT NULL DEFAULT '0' COMMENT '文件夹ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级文件夹ID',
  `level_no` int(11) NOT NULL DEFAULT '0' COMMENT '距离上级文件夹的层次',
  PRIMARY KEY (`folder_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体文件夹关系表';

#
# Source for table tb_media_info
#

DROP TABLE IF EXISTS `tb_media_info`;
CREATE TABLE `tb_media_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '媒体ID',
  `corp_id` int(11) DEFAULT '0' COMMENT '企业ID',
  `folder_id` int(11) DEFAULT '0' COMMENT '媒体文件夹ID',
  `name` varchar(400) NOT NULL DEFAULT '' COMMENT '媒体名称',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '媒体类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '媒体属性',
  `width` int(11) DEFAULT NULL COMMENT '媒体宽度',
  `height` int(11) DEFAULT NULL COMMENT '媒体高度',
  `duration` decimal(10,2) DEFAULT NULL COMMENT '媒体持续时间',
  `rotation` int(11) NOT NULL DEFAULT '0' COMMENT '媒体顺时旋转角度',
  `valid_date` datetime DEFAULT NULL COMMENT '媒体有效日期',
  `expired_date` datetime DEFAULT NULL COMMENT '媒体过期日期',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '媒体状态',
  `checksum` varchar(50) DEFAULT NULL COMMENT '信息效验码',
  `ref_count` int(11) DEFAULT NULL COMMENT '当前被引用数量',
  `content_count` int(11) NOT NULL DEFAULT '0' COMMENT '内容数量',
  `content_length` bigint(20) NOT NULL DEFAULT '0' COMMENT '内容总长度',
  `preview_file` varchar(200) DEFAULT NULL COMMENT '预览文件名',
  `thumbnail_file` varchar(200) DEFAULT NULL COMMENT '缩略图文件',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator_user_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `audit_state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `audit_level` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `auditor_user_id` int(11) DEFAULT NULL COMMENT '审核者用户ID',
  `edit_date` datetime DEFAULT NULL COMMENT '编辑修改日期',
  `editor_user_id` int(11) DEFAULT NULL COMMENT '编辑者ID',
  `xml` mediumtext COMMENT 'XML序列化',
  `xml1` mediumtext COMMENT '翻译后的xml',
  `is_reusable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否可以再使用',
  `comment` mediumtext COMMENT '备注信息',
  `cascade_update` int(11) NOT NULL DEFAULT '0' COMMENT '是否级联更新',
  `revision` int(11) NOT NULL DEFAULT '0' COMMENT '修订版号',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='媒体信息表';

#
# Source for table tb_media_relations
#

DROP TABLE IF EXISTS `tb_media_relations`;
CREATE TABLE `tb_media_relations` (
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '媒体ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属媒体ID',
  `usage` int(11) NOT NULL DEFAULT '0' COMMENT '媒体被使用的用途',
  `target` varchar(200) NOT NULL DEFAULT '' COMMENT '媒体被使用的目标',
  `sort_index` int(11) NOT NULL DEFAULT '0' COMMENT '所属排序序列',
  PRIMARY KEY (`media_id`,`owner_id`,`usage`,`target`,`sort_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体关系对应表';

#
# Source for table tb_playbill_info
#

DROP TABLE IF EXISTS `tb_playbill_info`;
CREATE TABLE `tb_playbill_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '节目单ID',
  `prev_id` int(11) DEFAULT NULL COMMENT '修改前ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(400) NOT NULL DEFAULT '' COMMENT '节目单名称',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '节目单类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '节目单属性标志位',
  `play_pri` int(11) NOT NULL DEFAULT '0' COMMENT '播放优先级',
  `valid_date` datetime DEFAULT NULL COMMENT '有效日期',
  `expired_date` datetime DEFAULT NULL COMMENT '过期日期',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '节目ID',
  `xml` mediumtext NOT NULL COMMENT 'XML描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator_user_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `audit_state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `audit_level` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `auditor_user_id` int(11) DEFAULT NULL COMMENT '审核者用户ID',
  `edit_date` datetime DEFAULT NULL COMMENT '编辑修改日期',
  `editor_user_id` int(11) DEFAULT NULL COMMENT '编辑者ID',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `fk_playbill_info_corp_id` (`corp_id`),
  KEY `fk_media_info_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目单信息表';

#
# Source for table tb_playbill_periods
#

DROP TABLE IF EXISTS `tb_playbill_periods`;
CREATE TABLE `tb_playbill_periods` (
  `playbill_id` int(11) NOT NULL DEFAULT '0' COMMENT '节目单ID',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `period_type` int(11) NOT NULL DEFAULT '0' COMMENT '周期类型',
  `period_value` int(11) NOT NULL DEFAULT '0' COMMENT '周期值',
  `is_exclude` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否是排除的周期',
  `pri` int(11) NOT NULL DEFAULT '0' COMMENT '生效优先级',
  PRIMARY KEY (`playbill_id`,`start_time`,`end_time`,`period_type`,`period_value`,`is_exclude`,`pri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目单周期时间表';

#
# Source for table tb_playbill_schedule_info
#

DROP TABLE IF EXISTS `tb_playbill_schedule_info`;
CREATE TABLE `tb_playbill_schedule_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编排ID',
  `prev_id` int(11) DEFAULT NULL COMMENT '修改前ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '编排类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '编排属性',
  `name` varchar(400) DEFAULT NULL COMMENT '编排名称',
  `preload_date` datetime DEFAULT NULL COMMENT '预下载日期',
  `valid_date` datetime NOT NULL COMMENT '有效日期',
  `expired_date` datetime NOT NULL COMMENT '过期日期',
  `xml` mediumtext COMMENT 'XML描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `audit_state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `audit_level` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `auditor_user_id` int(11) DEFAULT NULL COMMENT '审核者用户ID',
  `edit_date` datetime DEFAULT NULL COMMENT '编辑修改日期',
  `editor_user_id` int(11) DEFAULT NULL COMMENT '编辑者ID',
  `ignore_term_fdt` int(11) NOT NULL DEFAULT '0' COMMENT '是否忽略终端禁止下载时间表',
  `pri_idx` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `次索引` (`type`,`audit_level`,`audit_state`,`valid_date`,`preload_date`,`expired_date`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='节目编排单表';

#
# Source for table tb_playbill_schedule_play
#

DROP TABLE IF EXISTS `tb_playbill_schedule_play`;
CREATE TABLE `tb_playbill_schedule_play` (
  `schedule_id` int(11) NOT NULL DEFAULT '0' COMMENT '编排单ID',
  `play_pri` int(11) NOT NULL DEFAULT '0' COMMENT '播放优先级',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '播放开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '播放结束时间',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '节目ID',
  `playbill_id` int(11) DEFAULT NULL COMMENT '节目单ID',
  `sort_index` int(11) NOT NULL DEFAULT '0' COMMENT '排序序列',
  PRIMARY KEY (`schedule_id`,`sort_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目编排单与节目对应表';

#
# Source for table tb_playbill_schedule_targets
#

DROP TABLE IF EXISTS `tb_playbill_schedule_targets`;
CREATE TABLE `tb_playbill_schedule_targets` (
  `schedule_id` int(11) NOT NULL DEFAULT '0' COMMENT '编排ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `sort_index` int(11) NOT NULL DEFAULT '0' COMMENT '排序序列',
  `mask_schedule_id` int(11) DEFAULT NULL COMMENT '屏蔽编排单ID(针对发布给终端的节目单屏蔽分组上的,以避免重复)',
  PRIMARY KEY (`schedule_id`,`group_id`,`terminal_id`,`sort_index`),
  KEY `index_terminal_id` (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目编排单与发布对象对应表';

#
# Source for table tb_playbill_schedulelist_checksum
#

DROP TABLE IF EXISTS `tb_playbill_schedulelist_checksum`;
CREATE TABLE `tb_playbill_schedulelist_checksum` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_id` int(11) DEFAULT NULL COMMENT '终端id',
  `group_id` int(11) DEFAULT NULL COMMENT '分组id',
  `schedule_type` int(11) DEFAULT NULL COMMENT '0: Normal 1:E',
  `checksum` varchar(255) DEFAULT NULL COMMENT 'checksum',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='播放计划列表checksum';

#
# Source for table tb_playbill_schedulexml
#

DROP TABLE IF EXISTS `tb_playbill_schedulexml`;
CREATE TABLE `tb_playbill_schedulexml` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `schedulexml` mediumtext,
  PRIMARY KEY (`Id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

#
# Source for table tb_playbill_targets
#

DROP TABLE IF EXISTS `tb_playbill_targets`;
CREATE TABLE `tb_playbill_targets` (
  `playbill_id` int(11) NOT NULL DEFAULT '0' COMMENT '节目单ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `sort_index` int(11) NOT NULL DEFAULT '0' COMMENT '排序序列',
  `mask_playbill_id` int(11) DEFAULT NULL COMMENT '屏蔽节目单ID(针对发布给终端的节目单屏蔽分组上的,以避免重复)',
  PRIMARY KEY (`playbill_id`,`group_id`,`terminal_id`,`sort_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节目单发布对象对应表';

#
# Source for table tb_province_info
#

DROP TABLE IF EXISTS `tb_province_info`;
CREATE TABLE `tb_province_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `province_sn` varchar(20) DEFAULT NULL COMMENT '省份编号',
  `province_name` varchar(50) DEFAULT NULL COMMENT '省份名称',
  `collection` int(11) NOT NULL DEFAULT '0' COMMENT '是否收集0否1是',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Source for table tb_server_task
#

DROP TABLE IF EXISTS `tb_server_task`;
CREATE TABLE `tb_server_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '任务状态',
  `progress` int(11) NOT NULL DEFAULT '0' COMMENT '完成进度',
  `params` mediumtext COMMENT '任务参数',
  `desc` mediumtext COMMENT '任务描述',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '执行结果',
  `result_desc` mediumtext COMMENT '执行结果描述',
  `creator_type` int(11) DEFAULT NULL COMMENT '发起者类型',
  `creator_id` int(11) DEFAULT NULL COMMENT '发起者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `execute_time` datetime DEFAULT NULL COMMENT '执行时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `server_id` int(11) DEFAULT NULL COMMENT '执行服务器ID',
  `pri` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器任务表';

#
# Source for table tb_system_config
#

DROP TABLE IF EXISTS `tb_system_config`;
CREATE TABLE `tb_system_config` (
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `param_type` int(11) NOT NULL DEFAULT '0' COMMENT '参数类型',
  `param_name` varchar(50) NOT NULL DEFAULT '' COMMENT '参数名称',
  `param_val` varchar(500) DEFAULT NULL COMMENT '参数值',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`corp_id`,`param_type`,`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

#
# Source for table tb_system_log
#

DROP TABLE IF EXISTS `tb_system_log`;
CREATE TABLE `tb_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件时间',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `sys_type` int(11) NOT NULL DEFAULT '0' COMMENT '系统类型',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '日志级别',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '日志类型',
  `desc` varchar(400) NOT NULL DEFAULT '' COMMENT '日志描述',
  `extra_data` mediumtext COMMENT '额外信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

#
# Source for table tb_tag_index
#

DROP TABLE IF EXISTS `tb_tag_index`;
CREATE TABLE `tb_tag_index` (
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  `index_value` varchar(500) NOT NULL DEFAULT '' COMMENT '索引值',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签索引表';

#
# Source for table tb_tag_info
#

DROP TABLE IF EXISTS `tb_tag_info`;
CREATE TABLE `tb_tag_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签信息表';

#
# Source for table tb_tag_objects
#

DROP TABLE IF EXISTS `tb_tag_objects`;
CREATE TABLE `tb_tag_objects` (
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  `obj_type` int(11) NOT NULL DEFAULT '0' COMMENT '对象类型',
  `obj_id` int(11) NOT NULL DEFAULT '0' COMMENT '对象ID',
  PRIMARY KEY (`tag_id`,`obj_type`,`obj_id`),
  KEY `obj_id` (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签对象对应表';

#
# Source for table tb_terminal_command
#

DROP TABLE IF EXISTS `tb_terminal_command`;
CREATE TABLE `tb_terminal_command` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '指令ID',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT '指令分类',
  `command` int(11) NOT NULL DEFAULT '0' COMMENT '具体指令',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '指令执行状态',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '指令执行结果',
  `retry_times` int(11) NOT NULL DEFAULT '0' COMMENT '已重试次数',
  `command_raw` mediumtext COMMENT '指令原始内容',
  `feedback_raw` mediumtext COMMENT '反馈原始内容',
  `creator` int(11) DEFAULT NULL COMMENT '指令发出者',
  `create_time` datetime DEFAULT NULL COMMENT '指令生成时间',
  `schedule_time` datetime DEFAULT NULL COMMENT '计划发送时间',
  `send_time` datetime DEFAULT NULL COMMENT '指令发出时间',
  `feedback_time` datetime DEFAULT NULL COMMENT '指令反馈时间',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '执行优先级',
  PRIMARY KEY (`id`),
  KEY `terminal_id` (`terminal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='终端指令队列表';

#
# Source for table tb_terminal_config
#

DROP TABLE IF EXISTS `tb_terminal_config`;
CREATE TABLE `tb_terminal_config` (
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `display_type` int(11) NOT NULL DEFAULT '0' COMMENT '终端显示器类型',
  `display_scale` varchar(10) DEFAULT NULL COMMENT '显示器比例',
  `display_res_h` int(11) NOT NULL DEFAULT '0' COMMENT '显示器水平分辨率',
  `display_res_v` int(11) NOT NULL DEFAULT '0' COMMENT '显示器垂直分辨率',
  `output_type` int(11) NOT NULL DEFAULT '0' COMMENT '信号输出类型',
  `output_mode` varchar(10) DEFAULT NULL COMMENT '信号输出模式',
  `output_res_h` int(11) NOT NULL DEFAULT '0' COMMENT '信号输出水平分辨率',
  `output_res_v` int(11) NOT NULL DEFAULT '0' COMMENT '信号输出垂直分辨率',
  `output_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT '信号输出X偏移',
  `output_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT '信号输出Y偏移',
  `heartbeat_interval` int(11) NOT NULL DEFAULT '60' COMMENT '心跳间隔时间(秒)',
  `enable_telnet` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允许Telnet控制',
  `telnet_password` varchar(255) DEFAULT NULL COMMENT 'Telnet密码',
  `system_password` varchar(255) DEFAULT NULL COMMENT '系统密码',
  `enable_web` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允许Web访问',
  `enable_rc` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允许遥控器',
  `time_zone` int(11) DEFAULT NULL COMMENT '时区',
  `osd_lang` varchar(50) DEFAULT NULL COMMENT 'OSD语言',
  `default_volumn` int(11) NOT NULL DEFAULT '0' COMMENT '默认音量值',
  `default_brightness` int(11) NOT NULL DEFAULT '0' COMMENT '默认亮度值',
  `network_connect_type` int(11) NOT NULL DEFAULT '0' COMMENT '网络连接类型',
  `dhcp_server` varchar(50) DEFAULT NULL COMMENT 'DHCP服务器地址',
  `network_ip` varchar(50) DEFAULT NULL COMMENT '静态IP地址',
  `network_mask` varchar(50) DEFAULT NULL COMMENT '子网掩码',
  `network_gateway` varchar(50) DEFAULT NULL COMMENT '网络网关',
  `network_dns1` varchar(50) DEFAULT NULL COMMENT '网络DNS1',
  `network_dns2` varchar(50) DEFAULT NULL COMMENT '网络DNS2',
  `network_user` varchar(50) DEFAULT NULL COMMENT '网络连接用户名',
  `network_password` varchar(50) DEFAULT NULL COMMENT '网络连接密码',
  `network_down_rate` int(11) NOT NULL DEFAULT '0' COMMENT '网络下载速率',
  `file_keep_days` int(11) NOT NULL DEFAULT '7' COMMENT '不使用的文件保留天数(0为永久保留)',
  `extra_config` mediumtext COMMENT '额外配置信息',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间戳',
  `redisplay_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '重显率',
  PRIMARY KEY (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端配置表';

#
# Source for table tb_terminal_download_log
#

DROP TABLE IF EXISTS `tb_terminal_download_log`;
CREATE TABLE `tb_terminal_download_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `medianame` varchar(255) DEFAULT NULL COMMENT '下载文件名称（包含路径）',
  `mediaid` int(11) DEFAULT '0',
  `terminalid` int(11) DEFAULT '0' COMMENT '终端id',
  `status` int(1) DEFAULT '0' COMMENT '下载状态：0、开始下载：1、下载中：2、下载完成',
  `try_count` int(2) DEFAULT '0' COMMENT '尝试下载次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`),
  KEY `idx_for_termid` (`terminalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端文件下载日志';

#
# Source for table tb_terminal_group_info
#

DROP TABLE IF EXISTS `tb_terminal_group_info`;
CREATE TABLE `tb_terminal_group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分组名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级分组ID',
  `castmsg` mediumtext COMMENT '分组组播设置',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `fk_terminal_group_info_corp_id` (`corp_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='终端分组信息表';

#
# Source for table tb_terminal_group_relations
#

DROP TABLE IF EXISTS `tb_terminal_group_relations`;
CREATE TABLE `tb_terminal_group_relations` (
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父组ID',
  `level_no` int(11) NOT NULL DEFAULT '0' COMMENT '距离父级分组层次间隔',
  PRIMARY KEY (`group_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端分组关系结构表';

#
# Source for table tb_terminal_info
#

DROP TABLE IF EXISTS `tb_terminal_info`;
CREATE TABLE `tb_terminal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '终端ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `group_id` int(11) DEFAULT NULL COMMENT '分组ID',
  `no` varchar(10) NOT NULL DEFAULT '' COMMENT '终端编号',
  `mac` bigint(20) DEFAULT NULL COMMENT '终端MAC号',
  `mac_text` varchar(12) DEFAULT NULL COMMENT '终端MAC地址(文本)',
  `sn` varchar(50) DEFAULT NULL COMMENT '终端序列号',
  `name` varchar(200) DEFAULT NULL COMMENT '终端名称',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '终端类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '终端属性标志位',
  `model` varchar(50) DEFAULT NULL COMMENT '终端型号',
  `hw_version` varchar(50) DEFAULT NULL COMMENT '终端硬件版本',
  `location` varchar(500) DEFAULT NULL COMMENT '终端安装位置',
  `city` varchar(50) DEFAULT NULL COMMENT '终端所在城市',
  `province_id` int(11) DEFAULT '29' COMMENT '所在省份ID',
  `area_id` int(11) DEFAULT '2302' COMMENT '所在城市ID',
  `expired_date` datetime DEFAULT NULL COMMENT '终端过期日期',
  `coordinatex` double(10,5) DEFAULT '0.00000' COMMENT '精度',
  `coordinatey` double(10,5) DEFAULT '0.00000' COMMENT '纬度',
  `comment` mediumtext COMMENT '终端备注信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `audit_state` int(11) NOT NULL DEFAULT '0' COMMENT '终端状态',
  `audit_level` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `auditor_user_id` int(11) DEFAULT NULL COMMENT '审核者ID',
  `edit_date` datetime DEFAULT NULL COMMENT '编辑日期',
  `editor_user_id` int(11) DEFAULT NULL COMMENT '修改者ID',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_mac` (`mac`),
  KEY `uq_terminal_info_no` (`corp_id`,`no`),
  KEY `fk_terminal_info_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='终端信息表';

#
# Source for table tb_terminal_log
#

DROP TABLE IF EXISTS `tb_terminal_log`;
CREATE TABLE `tb_terminal_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `sid` bigint(20) DEFAULT NULL COMMENT '终端内部流水号',
  `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
  `last_event_time` datetime DEFAULT NULL COMMENT '最后事件发生时间',
  `repeat_times` int(11) NOT NULL DEFAULT '1' COMMENT '重复次数',
  `last_sid` bigint(20) DEFAULT NULL COMMENT '最后事件终端内部流水号',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '日志级别',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '日志类型',
  `desc` varchar(400) NOT NULL DEFAULT '' COMMENT '日志描述',
  `extra_data` mediumtext COMMENT '额外信息',
  PRIMARY KEY (`id`),
  KEY `idx_for_log_import` (`terminal_id`,`sid`,`last_sid`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='终端日志表';

#
# Source for table tb_terminal_mac
#

DROP TABLE IF EXISTS `tb_terminal_mac`;
CREATE TABLE `tb_terminal_mac` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `old_mac` varchar(20) DEFAULT '' COMMENT '终端原MAC地址',
  `term_sn` varchar(50) DEFAULT '' COMMENT '终端序列号',
  `ip_addr` varchar(20) DEFAULT '' COMMENT '终端IP地址',
  `sw_version` varchar(100) DEFAULT '' COMMENT '终端软件版本',
  `insert_time` datetime DEFAULT NULL COMMENT '记录插入时间',
  `conn_count` int(11) NOT NULL DEFAULT '0' COMMENT 'MAC冲突计数',
  `new_mac` varchar(20) DEFAULT '' COMMENT '终端新MAC地址',
  `update_flag` int(11) NOT NULL DEFAULT '0' COMMENT 'MAC更新标志',
  `update_time` datetime DEFAULT NULL COMMENT 'MAC更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_terminal_mac` (`old_mac`,`term_sn`,`update_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='MAC冲突信息表';

#
# Source for table tb_terminal_periods
#

DROP TABLE IF EXISTS `tb_terminal_periods`;
CREATE TABLE `tb_terminal_periods` (
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `period_type` int(11) NOT NULL DEFAULT '0' COMMENT '周期类型',
  `period_value` int(11) NOT NULL DEFAULT '0' COMMENT '周期值',
  `is_exclude` int(1) NOT NULL DEFAULT '0',
  `pri` int(11) NOT NULL DEFAULT '0' COMMENT '生效优先级',
  `setting_type` int(11) NOT NULL DEFAULT '0' COMMENT '设置类型',
  `setting_value` int(11) DEFAULT NULL COMMENT '设置值',
  `week` int(11) NOT NULL DEFAULT '127' COMMENT '应用周期（周六~周一）',
  PRIMARY KEY (`setting_type`,`terminal_id`,`group_id`,`start_time`,`end_time`,`period_type`,`period_value`,`is_exclude`,`pri`),
  KEY `terminal_id` (`terminal_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端周期设置表';

#
# Source for table tb_terminal_play_log
#

DROP TABLE IF EXISTS `tb_terminal_play_log`;
CREATE TABLE `tb_terminal_play_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `sid` bigint(20) DEFAULT NULL COMMENT '终端内部流水号',
  `last_sid` bigint(20) DEFAULT NULL COMMENT '最后终端内部流水号',
  `begin_time` datetime NOT NULL DEFAULT '0001-01-01 00:00:00' COMMENT '播放开始时间',
  `end_time` datetime NOT NULL DEFAULT '0001-01-01 00:00:00' COMMENT '播放结束时间',
  `terminal_mac` bigint(20) NOT NULL DEFAULT '0' COMMENT '终端MAC编号',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '播放的媒体ID',
  `media_type` int(11) DEFAULT NULL COMMENT '媒体类型',
  `media_name` varchar(400) DEFAULT NULL COMMENT '媒体名称',
  `media_duration` int(11) DEFAULT NULL COMMENT '媒体时长',
  `play_times` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `play_area` varchar(100) NOT NULL DEFAULT '' COMMENT '播放区域',
  PRIMARY KEY (`id`),
  KEY `idx_for_select` (`media_id`,`terminal_mac`,`begin_time`),
  KEY `idx_for_log_import` (`terminal_mac`,`sid`,`last_sid`,`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='终端播放日志表';

#
# Source for table tb_terminal_status
#

DROP TABLE IF EXISTS `tb_terminal_status`;
CREATE TABLE `tb_terminal_status` (
  `terminal_id` int(11) NOT NULL DEFAULT '0' COMMENT '终端ID',
  `is_online` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否在线',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '终端状态',
  `hw_version` varchar(200) DEFAULT NULL COMMENT '硬件版本',
  `sw_version` varchar(200) DEFAULT NULL COMMENT '软件版本',
  `connect_ip` bigint(20) DEFAULT '0' COMMENT '终端连接IP',
  `lan_ip` bigint(20) DEFAULT NULL COMMENT '终端内网IP',
  `storage_capacity` bigint(20) DEFAULT NULL COMMENT '存储器总容量(字节)',
  `storage_usage` bigint(20) DEFAULT NULL COMMENT '存储器已使用容量(字节)',
  `cpu_load` int(11) DEFAULT NULL COMMENT '终端CPU负载量',
  `mem_load` int(11) DEFAULT NULL COMMENT '终端内存负载量',
  `upload_speed` int(11) DEFAULT NULL COMMENT '终端上传速率(Byte/S)',
  `download_speed` int(11) DEFAULT NULL COMMENT '终端下载速率(Byte/S)',
  `curr_volumn` int(11) DEFAULT NULL COMMENT '终端当前音量',
  `curr_param` mediumtext COMMENT '当前终端参数',
  `curr_download` mediumtext COMMENT '当前下载信息',
  `curr_upload` mediumtext COMMENT '当前终端上传内容',
  `curr_play` mediumtext COMMENT '当前播放内容',
  `last_auth_time` datetime DEFAULT NULL COMMENT '最后验证时间',
  `auth_id` varchar(100) DEFAULT NULL COMMENT '验证ID',
  `heartb_count` int(11) NOT NULL DEFAULT '0' COMMENT '心跳次数(从最后验证开始)',
  `last_heartb_time` bigint(20) DEFAULT NULL COMMENT '最后一次心跳时间(精确到微秒)',
  `curr_heartb_interval` bigint(20) NOT NULL DEFAULT '0' COMMENT '当前心跳间隔(精确到微秒)',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端状态表';

#
# Source for table tb_terminal_upgrade_pkg
#

DROP TABLE IF EXISTS `tb_terminal_upgrade_pkg`;
CREATE TABLE `tb_terminal_upgrade_pkg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '升级包ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `version` varchar(50) NOT NULL COMMENT '版本号',
  `name` varchar(400) DEFAULT NULL COMMENT '文件名',
  `length` bigint(20) NOT NULL COMMENT '长度',
  `available` int(11) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `checksum` varchar(50) DEFAULT NULL COMMENT '校验值',
  `uploader` int(11) DEFAULT NULL COMMENT '上传者ID',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `apply_models` varchar(200) NOT NULL COMMENT '适用终端型号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端升级包表';

#
# Source for table tb_terminal_upgrade_schedule
#

DROP TABLE IF EXISTS `tb_terminal_upgrade_schedule`;
CREATE TABLE `tb_terminal_upgrade_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '升级计划ID',
  `name` varchar(200) DEFAULT NULL COMMENT '计划名称',
  `creator` int(11) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端升级计划表';

#
# Source for table tb_terminal_upgrade_schedule_cmds
#

DROP TABLE IF EXISTS `tb_terminal_upgrade_schedule_cmds`;
CREATE TABLE `tb_terminal_upgrade_schedule_cmds` (
  `schedule_id` int(11) NOT NULL COMMENT '升级计划ID',
  `command_id` int(11) NOT NULL COMMENT '对应命令ID',
  PRIMARY KEY (`schedule_id`,`command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端升级计划与终端命令对应表';

#
# Source for table tb_terminal_upgrade_schedule_pkgs
#

DROP TABLE IF EXISTS `tb_terminal_upgrade_schedule_pkgs`;
CREATE TABLE `tb_terminal_upgrade_schedule_pkgs` (
  `schedule_id` int(11) NOT NULL COMMENT '计划ID',
  `pkg_id` int(11) NOT NULL COMMENT '升级包ID',
  `execute_pri` int(11) NOT NULL COMMENT '升级执行顺序',
  PRIMARY KEY (`schedule_id`,`pkg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端升级计划与升级包对应表';

#
# Source for table tb_terminal_upgrade_schedule_targets
#

DROP TABLE IF EXISTS `tb_terminal_upgrade_schedule_targets`;
CREATE TABLE `tb_terminal_upgrade_schedule_targets` (
  `schedule_id` int(11) NOT NULL DEFAULT '0',
  `target_type` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端升级计划与升级对象对应表';

#
# Source for table tb_user_config
#

DROP TABLE IF EXISTS `tb_user_config`;
CREATE TABLE `tb_user_config` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `param_type` int(11) NOT NULL DEFAULT '0' COMMENT '参数类型',
  `param_name` varchar(50) NOT NULL DEFAULT '' COMMENT '参数名称',
  `param_val` varchar(500) DEFAULT NULL COMMENT '参数值',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `user_id` (`user_id`,`param_type`,`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户配置表';

#
# Source for table tb_user_group_info
#

DROP TABLE IF EXISTS `tb_user_group_info`;
CREATE TABLE `tb_user_group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户分组ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级用户分组ID',
  `name` varchar(200) DEFAULT NULL COMMENT '用户分组名称',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '用户分组类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '用户分组属性标志位',
  `comment` text COMMENT '用户分组备注',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  KEY `fk_user_group_info_corp_id` (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分组信息表';

#
# Source for table tb_user_group_relations
#

DROP TABLE IF EXISTS `tb_user_group_relations`;
CREATE TABLE `tb_user_group_relations` (
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父组ID',
  `level_no` int(11) NOT NULL DEFAULT '0' COMMENT '距离父级分组层次间隔',
  PRIMARY KEY (`group_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户分组关系结构表';

#
# Source for table tb_user_groups
#

DROP TABLE IF EXISTS `tb_user_groups`;
CREATE TABLE `tb_user_groups` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户分组ID',
  PRIMARY KEY (`user_id`,`user_group_id`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与用户分组对应表';

#
# Source for table tb_user_info
#

DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属企业ID',
  `user_role_id` int(11) DEFAULT NULL COMMENT '所属角色ID',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '用户属性标志位',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `no` varchar(20) DEFAULT '' COMMENT '用户编号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `password_salt` varchar(20) NOT NULL DEFAULT '' COMMENT '用户密码加权',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `comment` mediumtext COMMENT '用户信息备注',
  `storage_usage` bigint(20) NOT NULL DEFAULT '0' COMMENT '已使用磁盘空间',
  `storage_limit` bigint(20) NOT NULL DEFAULT '0' COMMENT '允许使用磁盘空间',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期时间',
  `creator_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_info_name` (`corp_id`,`name`),
  KEY `idx_user_info_no` (`corp_id`,`no`),
  KEY `fk_user_info_user_role_id` (`user_role_id`),
  KEY `fk_user_info_creator_user_id` (`creator_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

#
# Source for table tb_user_log
#

DROP TABLE IF EXISTS `tb_user_log`;
CREATE TABLE `tb_user_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件时间',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '日志级别',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '日志类型',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '日志描述',
  `op_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型',
  `op_result` int(11) NOT NULL DEFAULT '0' COMMENT '操作结果',
  `op_entity_type` int(11) DEFAULT NULL COMMENT '操作对象类型',
  `op_entity_id` bigint(20) DEFAULT NULL COMMENT '操作对象ID',
  `op_entity_xml` mediumtext COMMENT '操作对象XML序列化',
  `extra_data` mediumtext COMMENT '额外数据',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=utf8 COMMENT='用户日志表';

#
# Source for table tb_user_online
#

DROP TABLE IF EXISTS `tb_user_online`;
CREATE TABLE `tb_user_online` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `session_id` varchar(100) DEFAULT NULL COMMENT '客户端会话ID',
  `client_env` varchar(500) DEFAULT NULL COMMENT '客户端环境信息',
  `login_times` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `first_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次登陆时间',
  `prev_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '前次登陆时间',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登陆时间',
  `first_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '首次登陆IP',
  `prev_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '前次登陆IP',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登陆IP',
  `is_online` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否在线',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户在线状态表';

#
# Source for table tb_user_possession
#

DROP TABLE IF EXISTS `tb_user_possession`;
CREATE TABLE `tb_user_possession` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `obj_type` int(11) NOT NULL DEFAULT '0' COMMENT '对象类型',
  `obj_id` int(11) NOT NULL DEFAULT '0' COMMENT '对象ID',
  PRIMARY KEY (`user_id`,`obj_type`,`obj_id`),
  KEY `obj_id` (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户持有对象对应表';

#
# Source for table tb_user_properties
#

DROP TABLE IF EXISTS `tb_user_properties`;
CREATE TABLE `tb_user_properties` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `prop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名称',
  `prop_val` varchar(500) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`user_id`,`prop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

#
# Source for table tb_user_relations
#

DROP TABLE IF EXISTS `tb_user_relations`;
CREATE TABLE `tb_user_relations` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级用户ID',
  `level_no` int(11) NOT NULL DEFAULT '0' COMMENT '距离上级用户层次间隔',
  PRIMARY KEY (`user_id`,`parent_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关系结构表';

#
# Source for table tb_user_role_info
#

DROP TABLE IF EXISTS `tb_user_role_info`;
CREATE TABLE `tb_user_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `corp_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `attrib` int(11) NOT NULL DEFAULT '0' COMMENT '角色属性标志位',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_role_name` (`corp_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色信息表';

#
# Source for table tb_user_role_privileges
#

DROP TABLE IF EXISTS `tb_user_role_privileges`;
CREATE TABLE `tb_user_role_privileges` (
  `user_role_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户角色ID',
  `privilege_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`user_role_id`,`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色与权限对应表';

#
# Source for table tb_weather_forecast
#

DROP TABLE IF EXISTS `tb_weather_forecast`;
CREATE TABLE `tb_weather_forecast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(50) DEFAULT NULL COMMENT '省市',
  `issueTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `area` varchar(50) DEFAULT NULL COMMENT '城市（地区）',
  `forecastDate` date DEFAULT NULL COMMENT '预报日期',
  `weatherType1` varchar(50) DEFAULT '未知' COMMENT '天气状况1',
  `weatherType2` varchar(50) DEFAULT '未知' COMMENT '天气状况2',
  `tempHi` int(11) DEFAULT NULL COMMENT '最高温',
  `tempLow` int(11) DEFAULT NULL COMMENT '最低温',
  `wind` varchar(50) DEFAULT NULL COMMENT '风力',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='天气预报';

#
# Source for view v_charge_bb_actual_day
#

DROP VIEW IF EXISTS `v_charge_bb_actual_day`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_charge_bb_actual_day` AS select `c`.`customer_id` AS `customer_id`,`b`.`order_id` AS `order_id`,`t`.`play_info_id` AS `play_info_id`,`t`.`play_date` AS `play_date`,sum(`t`.`play_count`) AS `play_count`,count(`t`.`terminal_id`) AS `terminal_count`,sum(`t`.`charge`) AS `charge` from ((`tb_charge_actual_play_bill` `t` left join `tb_charge_play_info` `b` on((`t`.`play_info_id` = `b`.`id`))) left join `tb_charge_order_info` `c` on((`b`.`order_id` = `c`.`id`))) group by `c`.`customer_id`,`b`.`order_id`,`t`.`play_info_id`,`t`.`play_date`;

#
# Source for view v_charge_bb_plan_day
#

DROP VIEW IF EXISTS `v_charge_bb_plan_day`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_charge_bb_plan_day` AS select `c`.`customer_id` AS `customer_id`,`b`.`order_id` AS `order_id`,`t`.`play_info_id` AS `play_info_id`,`t`.`play_date` AS `play_date`,sum(`t`.`play_count`) AS `play_count`,count(`t`.`terminal_id`) AS `terminal_count`,sum(`t`.`charge`) AS `charge` from ((`tb_charge_plan_play_bill` `t` left join `tb_charge_play_info` `b` on((`t`.`play_info_id` = `b`.`id`))) left join `tb_charge_order_info` `c` on((`b`.`order_id` = `c`.`id`))) where (`c`.`order_status` in (1,2)) group by `c`.`customer_id`,`b`.`order_id`,`t`.`play_info_id`,`t`.`play_date`;

#
# Source for view v_customer_medias
#

DROP VIEW IF EXISTS `v_customer_medias`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_customer_medias` AS select `rd`.`customer_id` AS `customer_id`,`c`.`company_name` AS `company_name`,count(0) AS `count`,(select count(0) AS `count(*)` from (((`tb_charge_play_info` `p` join `tb_charge_order_weight` `w`) join `tb_media_info` `m`) join `tb_charge_order_info` `r`) where ((`w`.`id` = `p`.`charge_type`) and (`m`.`id` = `p`.`media_info_id`) and (`r`.`id` = `p`.`order_id`) and (`m`.`type` = 0) and (`r`.`customer_id` = `rd`.`customer_id`) and (`r`.`order_status` <> 4)) group by `r`.`customer_id`) AS `type_default`,(select count(0) AS `count(*)` from (((`tb_charge_play_info` `p` join `tb_charge_order_weight` `w`) join `tb_media_info` `m`) join `tb_charge_order_info` `r`) where ((`w`.`id` = `p`.`charge_type`) and (`m`.`id` = `p`.`media_info_id`) and (`r`.`id` = `p`.`order_id`) and (`m`.`type` = 1) and (`r`.`customer_id` = `rd`.`customer_id`) and (`r`.`order_status` <> 4)) group by `r`.`customer_id`) AS `type_video`,(select count(0) AS `count(*)` from (((`tb_charge_play_info` `p` join `tb_charge_order_weight` `w`) join `tb_media_info` `m`) join `tb_charge_order_info` `r`) where ((`w`.`id` = `p`.`charge_type`) and (`m`.`id` = `p`.`media_info_id`) and (`r`.`id` = `p`.`order_id`) and (`m`.`type` = 2) and (`r`.`customer_id` = `rd`.`customer_id`) and (`r`.`order_status` <> 4)) group by `r`.`customer_id`) AS `type_pic`,(select count(0) AS `count(*)` from (((`tb_charge_play_info` `p` join `tb_charge_order_weight` `w`) join `tb_media_info` `m`) join `tb_charge_order_info` `r`) where ((`w`.`id` = `p`.`charge_type`) and (`m`.`id` = `p`.`media_info_id`) and (`r`.`id` = `p`.`order_id`) and (`m`.`type` = 3) and (`r`.`customer_id` = `rd`.`customer_id`) and (`r`.`order_status` <> 4)) group by `r`.`customer_id`) AS `type_audio`,(select count(0) AS `count(*)` from (((`tb_charge_play_info` `p` join `tb_charge_order_weight` `w`) join `tb_media_info` `m`) join `tb_charge_order_info` `r`) where ((`w`.`id` = `p`.`charge_type`) and (`m`.`id` = `p`.`media_info_id`) and (`r`.`id` = `p`.`order_id`) and (`m`.`type` = 4) and (`r`.`customer_id` = `rd`.`customer_id`) and (`r`.`order_status` <> 4)) group by `r`.`customer_id`) AS `type_txt` from (((`tb_charge_play_info` `p1` join `tb_media_info` `m1`) join `tb_charge_order_info` `rd`) join `tb_charge_customer_info` `c`) where ((`m1`.`id` = `p1`.`media_info_id`) and (`rd`.`id` = `p1`.`order_id`) and (`c`.`id` = `rd`.`customer_id`) and (`rd`.`order_status` <> 4)) group by `rd`.`customer_id`;

#
# Source for view v_customer_order
#

DROP VIEW IF EXISTS `v_customer_order`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_customer_order` AS select `u`.`id` AS `customer_id`,`u`.`company_name` AS `company_name`,`c`.`id` AS `order_id`,`c`.`name` AS `order_name`,`c`.`sequence_no` AS `sequence_no`,`c`.`order_time` AS `order_time`,`c`.`order_status` AS `order_status`,`c`.`audit_status` AS `audit_status` from (`tb_charge_order_info` `c` join `tb_charge_customer_info` `u`) where ((`u`.`id` = `c`.`customer_id`) and (`c`.`order_status` <> 4)) group by `c`.`id`;

#
# Source for view v_order_count
#

DROP VIEW IF EXISTS `v_order_count`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_order_count` AS select `c`.`customer_id` AS `customer_id`,`c`.`company_name` AS `company_name`,count(0) AS `totle_orders`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`order_status` = 0) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `orderings`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`order_status` = 1) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `Valid`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`order_status` = 2) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `end`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`order_status` = 3) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `cancel`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`audit_status` = 0) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `audit_edit`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`audit_status` = 1) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `audit_waiting`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`audit_status` = 3) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `audit_ok`,(select count(0) AS `count(*)` from `v_customer_order` `t` where ((`t`.`audit_status` = 4) and (`t`.`company_name` = `c`.`company_name`)) group by `t`.`company_name`) AS `audit_cancel` from `v_customer_order` `c` group by `c`.`company_name`;

#
# Source for view vw_terminal_play_log_for_charge
#

DROP VIEW IF EXISTS `vw_terminal_play_log_for_charge`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_terminal_play_log_for_charge` AS select `tb_terminal_play_log`.`terminal_mac` AS `terminal_mac`,cast(`tb_terminal_play_log`.`begin_time` as date) AS `date`,sec_to_time(((time_to_sec(cast(`tb_terminal_play_log`.`begin_time` as time)) DIV 1800) * 1800)) AS `begin_span`,sec_to_time((((time_to_sec(cast(`tb_terminal_play_log`.`end_time` as time)) DIV 1800) + 1) * 1800)) AS `end_span`,`tb_terminal_play_log`.`media_id` AS `media_id`,`tb_terminal_play_log`.`media_name` AS `media_name`,sum(`tb_terminal_play_log`.`play_times`) AS `play_times` from `tb_terminal_play_log` group by `tb_terminal_play_log`.`terminal_mac`,`tb_terminal_play_log`.`media_id`,sec_to_time(((time_to_sec(cast(`tb_terminal_play_log`.`begin_time` as time)) DIV 1800) * 1800));

#
# Source for procedure pc_charge_actual_dayall
#

DROP PROCEDURE IF EXISTS `pc_charge_actual_dayall`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_actual_dayall`(in begindate date,in enddate date)
    COMMENT '计算从开始日期到截止日期的计划数据费用，更新入表tb_charge_actual_play_bill'
BEGIN
 
declare minid int;
declare maxid int;
declare num int default 1;
select min(id) into minid from tb_charge_actual_play_bill t where t.play_date >= begindate and t.play_date <= enddate;
select max(id) into maxid from tb_charge_actual_play_bill t where t.play_date >= begindate and t.play_date <= enddate;

 
start transaction; 
if minid is not null then 
    set num = minid; 
    while num <= maxid do
        call pc_charge_actual_play_bill(num);
        set num = num+1;        
    end while;  
end if; 
commit;    

END;


#
# Source for procedure pc_charge_actual_play_bill
#

DROP PROCEDURE IF EXISTS `pc_charge_actual_play_bill`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_actual_play_bill`(in playBillId int(11))
    COMMENT '计算实际播放单的费用'
top:BEGIN


declare dateWeight double default 1; 
declare timeWeight double default 1; 
declare tagWeight  double default 1; 
declare terminalGroupWeight double default 1; 
declare charOrderWeight double default 1; 


declare playInfoId int; 
declare terminal_id int; 
declare playDate date;   
declare time_start time; 
declare time_end time;   
declare playCount double(16,2);   
declare singleDuration double(16,2); 

declare mediaInfoId int; 
declare chargeType int; 

declare terminal_group_id int; 

declare num int default 0;


select count(*) into num from tb_charge_actual_play_bill t where t.id = playBillId;
if num = 0 then
leave top;
end if;

select t.play_info_id into playInfoId from tb_charge_actual_play_bill t where t.id = playBillId;
select t.terminal_id into terminal_id from tb_charge_actual_play_bill t where t.id = playBillId;
select t.play_date into playDate from tb_charge_actual_play_bill t where t.id = playBillId;
select t.start_time into time_start from tb_charge_actual_play_bill t where t.id = playBillId;
select t.end_time into time_end from tb_charge_actual_play_bill t where t.id = playBillId;
select t.play_count into playCount from tb_charge_actual_play_bill t where t.id = playBillId;
select t.single_play_during into singleDuration from tb_charge_actual_play_bill t where t.id = playBillId;

select media_info_id into mediaInfoId from tb_charge_play_info where id = playInfoId;
select charge_type into chargeType from tb_charge_play_info where id = playInfoId;



select t.weight into dateWeight from tb_charge_date_weight t where t.special_date = playDate;
if dateWeight = null then
set dateWeight = 1;
end if ;


select t.weight into timeWeight from tb_charge_time_weight t where t.start_time <= time_start and t.end_time >= time_end;
if timeWeight = null then
set timeWeight = 1;
end if ;


select t.group_id into terminal_group_id from tb_terminal_info t where t.id = terminal_id;
select t.weight into terminalGroupWeight from tb_charge_terminal_weight t where t.terminal_group_id = terminal_group_id;
if terminalGroupWeight = null then
set terminalGroupWeight = 1;
end if ;



select count(*) into num from tb_tag_objects join tb_charge_tag_weight on tb_tag_objects.tag_id=tb_charge_tag_weight.tag_id 
where tb_tag_objects.obj_type= 21 and tb_tag_objects.obj_id= terminal_id ;
if num >0 then 
    select max(tb_charge_tag_weight.weight) into tagWeight from tb_tag_objects join tb_charge_tag_weight on tb_tag_objects.tag_id=tb_charge_tag_weight.tag_id 
    where tb_tag_objects.obj_type= 21 and tb_tag_objects.obj_id= terminal_id ;
else
    set tagWeight = 1;
end if ;



select t.charge into charOrderWeight from tb_charge_order_weight t where t.id = chargeType ;
if charOrderWeight = null  then
set charOrderWeight =1;
end if;


update tb_charge_actual_play_bill t 
set t.charge = dateWeight * timeWeight * terminalGroupWeight * tagWeight *  playCount * singleDuration * charOrderWeight,
    t.chargenote = concat(FORMAT(t.charge,2),' = ',FORMAT(dateWeight,2),' * ',FORMAT(timeWeight,2),' * ',FORMAT(tagWeight,2),' * ',FORMAT(terminalGroupWeight,2),' * ',FORMAT(charOrderWeight,2),' * ',FORMAT(playCount,2),' * ',FORMAT(singleDuration,2),'')
where t.id = playBillId ;


END;;


#
# Source for procedure pc_charge_actual_play_bill_all
#

DROP PROCEDURE IF EXISTS `pc_charge_actual_play_bill_all`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_actual_play_bill_all`(in beginid int(11),in endid int(11))
    COMMENT '批量计算实际播放单的费用'
BEGIN
declare num int default 1;
set num = beginid;
        
start transaction;
    while num <= endid do
        call pc_charge_actual_play_bill(num);
        set num = num+1;
    end while;    
commit;

END;


#
# Source for procedure pc_charge_bb_actual_day
#

DROP PROCEDURE IF EXISTS `pc_charge_bb_actual_day`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_bb_actual_day`(p_date date)
    COMMENT '从实际播放情况表处理数据，存入实际播放情况日报表tb_charge_bb_actual_day'
BEGIN
 
declare minid int;
declare maxid int;
select min(id) into minid from tb_charge_actual_play_bill t where t.play_date = p_date;
select max(id) into maxid from tb_charge_actual_play_bill t where t.play_date = p_date;
call pc_charge_actual_play_bill_all(minid,maxid);

insert into tb_charge_bb_actual_day(customer_id,order_id,play_info_id,play_date,play_count,terminal_count,charge)
select c.customer_id,b.order_id,a.play_info_id,a.play_date,a.play_count,a.terminal_count,a.charge from
(
    select t.play_info_id,t.play_date,    
           sum( t.play_count) as play_count,
           count(terminal_id) as terminal_count,
           sum(t.charge) as charge  
    from tb_charge_actual_play_bill t    
    where t.play_date = p_date
    group by t.play_info_id,t.play_date    
) a left join tb_charge_play_info b on a.play_info_id = b.id
    left join tb_charge_order_info c on b.order_id = c.id
;
END;


#
# Source for procedure pc_charge_bb_customer_month
#

DROP PROCEDURE IF EXISTS `pc_charge_bb_customer_month`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_bb_customer_month`()
    COMMENT '返回所有用户每个月的费用报表'
BEGIN

select a.customer_id,
       b.company_name,
       a.order_id,
       c.name as order_name,
       a.play_info_id,
       e.id as media_info_id,
       e.name as media_name,       
       a.play_month,       
       a.play_count,       
       a.charge       
from
(
    select customer_id,order_id,play_info_id,
           count(*) as num,
           date_format(play_date,'%Y-%m') as play_month,
           sum(play_count) as play_count,
           sum(terminal_count) as terminal_count,
           sum(charge) as charge       
    from tb_charge_bb_actual_day
    group by customer_id,order_id,play_info_id,date_format(play_date,'%Y-%m')
    union 
    select customer_id,order_id,'dingdanxiaojie',
           count(*)+1 as num,
           date_format(play_date,'%Y-%m') as play_month,
           sum(play_count) as play_count,
           sum(terminal_count) as terminal_count,
           sum(charge) as charge
    from tb_charge_bb_actual_day
    group by customer_id,order_id,date_format(play_date,'%Y-%m')
    union 
    select customer_id,'kehuxiaojie','kehuxiaojie',
           count(*)+2 as num,
           date_format(play_date,'%Y-%m') as play_month,
           sum(play_count) as play_count,
           sum(terminal_count) as terminal_count,
           sum(charge) as charge
    from tb_charge_bb_actual_day
    group by customer_id,date_format(play_date,'%Y-%m')
) a 
left join tb_charge_customer_info b on a.customer_id = b.id
left join tb_charge_order_info c on a.order_id = c.id
left join tb_charge_play_info d on a.play_info_id = d.id
left join tb_media_info e on d.media_info_id = e.id
order by a.play_month,a.order_id,a.num
;
END;


#
# Source for procedure pc_charge_bb_plan_day
#

DROP PROCEDURE IF EXISTS `pc_charge_bb_plan_day`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_bb_plan_day`(p_date date)
    COMMENT '从实际播放情况表处理数据，存入实际播放情况日报表tb_charge_bb_plan_day'
BEGIN

insert into tb_charge_bb_plan_day(customer_id,order_id,play_info_id,play_date,play_count,terminal_count,charge)
select c.customer_id,b.order_id,a.play_info_id,a.play_date,a.play_count,a.terminal_count,a.charge from
(
    select t.play_info_id,t.play_date,    
           sum( t.play_count) as play_count,
           count(terminal_id) as terminal_count,
           sum(t.charge) as charge  
    from tb_charge_plan_play_bill t    
    where t.play_date = p_date
    group by t.play_info_id,t.play_date    
) a left join tb_charge_play_info b on a.play_info_id = b.id
    left join tb_charge_order_info c on b.order_id = c.id
;
END;


#
# Source for procedure pc_charge_plan_dayall
#

DROP PROCEDURE IF EXISTS `pc_charge_plan_dayall`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_plan_dayall`(in begindate date,in enddate date)
    COMMENT '计算从开始日期到截止日期的计划数据费用，更新入表tb_charge_plan_play_bill'
BEGIN
 
declare minid int;
declare maxid int;
declare num int default 1;
select min(id) into minid from tb_charge_plan_play_bill t where t.play_date >= begindate and t.play_date <= enddate;
select max(id) into maxid from tb_charge_plan_play_bill t where t.play_date >= begindate and t.play_date <= enddate;

 
start transaction; 
if minid is not null then 
    set num = minid; 
    while num <= maxid do
        call pc_charge_plan_play_bill(num);
        set num = num+1;        
    end while;  
end if; 
commit;    

END;


#
# Source for procedure pc_charge_plan_play_bill
#

DROP PROCEDURE IF EXISTS `pc_charge_plan_play_bill`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pc_charge_plan_play_bill`(in playBillId int(11))
    COMMENT '计算计划播放单的费用'
top:BEGIN

declare dateWeight double default 1; 
declare timeWeight double default 1; 
declare tagWeight  double default 1; 
declare terminalGroupWeight double default 1; 
declare charOrderWeight double default 1; 


declare playInfoId int; 
declare terminal_id int; 
declare playDate date;   
declare time_start time; 
declare time_end time;   
declare playCount int;   
declare singleDuration int; 

declare mediaInfoId int; 
declare chargeType int; 

declare terminal_group_id int; 

declare num int default 0;


select count(*) into num from tb_charge_plan_play_bill t where t.id = playBillId;
if num = 0 then
leave top;
end if;

select t.play_info_id into playInfoId from tb_charge_plan_play_bill t where t.id = playBillId;
select t.terminal_id into terminal_id from tb_charge_plan_play_bill t where t.id = playBillId;
select t.play_date into playDate from tb_charge_plan_play_bill t where t.id = playBillId;
select t.start_time into time_start from tb_charge_plan_play_bill t where t.id = playBillId;
select t.end_time into time_end from tb_charge_plan_play_bill t where t.id = playBillId;
select t.play_count into playCount from tb_charge_plan_play_bill t where t.id = playBillId;
select t.single_play_during into singleDuration from tb_charge_plan_play_bill t where t.id = playBillId;

select media_info_id into mediaInfoId from tb_charge_play_info where id = playInfoId;
select charge_type into chargeType from tb_charge_play_info where id = playInfoId;



select t.weight into dateWeight from tb_charge_date_weight t where t.special_date = playDate;
if dateWeight = null then
set dateWeight = 1;
end if ;


select t.weight into timeWeight from tb_charge_time_weight t where t.start_time <= time_start and t.end_time >= time_end;
if timeWeight = null then
set timeWeight = 1;
end if ;


select t.group_id into terminal_group_id from tb_terminal_info t where t.id = terminal_id;
select t.weight into terminalGroupWeight from tb_charge_terminal_weight t where t.terminal_group_id = terminal_group_id;
if terminalGroupWeight = null then
set terminalGroupWeight = 1;
end if ;




select count(*) into num from tb_tag_objects join tb_charge_tag_weight on tb_tag_objects.tag_id=tb_charge_tag_weight.tag_id 
where tb_tag_objects.obj_type= 21 and tb_tag_objects.obj_id= terminal_id ;
if num >0 then 
    select max(tb_charge_tag_weight.weight) into tagWeight from tb_tag_objects join tb_charge_tag_weight on tb_tag_objects.tag_id=tb_charge_tag_weight.tag_id 
    where tb_tag_objects.obj_type= 21 and tb_tag_objects.obj_id= terminal_id ;
else
    set tagWeight = 1;
end if ;


select t.charge into charOrderWeight from tb_charge_order_weight t where t.id = chargeType ;
if charOrderWeight = null  then
set charOrderWeight =1;
end if;


update tb_charge_plan_play_bill t 
set t.charge = dateWeight * timeWeight * terminalGroupWeight * tagWeight *  playCount * singleDuration * charOrderWeight,
    t.chargenote = concat(t.charge,' = ',dateWeight,' * ',timeWeight,' * ',tagWeight,' * ',terminalGroupWeight,' * ',charOrderWeight,' * ',playCount,' * ',singleDuration,'')
where t.id = playBillId ;

END;;


#
# Source for procedure pc_charge_terminal_play_log
#

DROP PROCEDURE IF EXISTS `pc_charge_terminal_play_log`;
CREATE DEFINER=`root`@`%` PROCEDURE `pc_charge_terminal_play_log`(in begindate date,in enddate date)
BEGIN


DECLARE TIME_SPAN_SEC INT DEFAULT 1800;
DECLARE curTerminalMac BIGINT;
DECLARE curMediaId INT;
DECLARE curBeginTime DATETIME;
DECLARE curEndTime DATETIME;
DECLARE curTimeSpanIdx INT;
DECLARE curPlayTimes DOUBLE;
DECLARE curPlayDuration DOUBLE;

declare inputTime TimeStamp ;


DECLARE cur CURSOR FOR select terminal_mac, media_id, min(begin_time), max(end_time), 
time_to_sec(time(begin_time)) div TIME_SPAN_SEC begin_span, sum(play_times), sum(play_times * media_duration) / sum(play_times)
from tb_terminal_play_log 
where date_format(begin_time,'%Y-%m-%d') >= begindate
and date_format(end_time,'%Y-%m-%d') <= enddate
and media_id in (select media_info_id from tb_charge_play_info  )
group by terminal_mac, media_id, begin_span;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET curMediaId = NULL;

DROP TABLE IF EXISTS tmp_terminal_play_log;
CREATE TEMPORARY TABLE tmp_terminal_play_log(
    terminal_mac bigint,    
    media_id int,
    date date,
    begin_span time,
    end_span time, 
    play_times double,    
    play_duration double
);



OPEN cur;
      
     FETCH cur INTO curTerminalMac,curMediaId,curBeginTime,curEndTime,curTimeSpanIdx,curPlayTimes,curPlayDuration;
     WHILE (curMediaId IS NOT NULL) DO
           SET @beginTimeSec = time_to_sec(time(curBeginTime));
           SET @endTimeSec = time_to_sec(time(curEndTime));
           IF (@beginTimeSec < @endTimeSec) THEN     
               SET @beginSpan = curTimeSpanIdx;
               SET @endSpan = @endTimeSec div TIME_SPAN_SEC;                          

               IF (@beginSpan = @endSpan) THEN
                  insert into tmp_terminal_play_log values (curTerminalMac, curMediaId, date(curBeginTime), 
                    sec_to_time(@beginSpan * TIME_SPAN_SEC), sec_to_time((@beginSpan + 1) * TIME_SPAN_SEC), curPlayTimes, curPlayDuration);
               ELSE
                    SET @playTimesPerSec = curPlayTimes / (@endTimeSec - @beginTimeSec);                 
                    SET @currSpan = @beginSpan;                   
                    WHILE (@currSpan <= @endSpan) DO
                         IF (@currSpan = @beginSpan) THEN                         
                            SET curPlayTimes = @playTimesPerSec * ((@beginSpan + 1) * TIME_SPAN_SEC - @beginTimeSec);                            
                         ELSEIF (@currSpan = @endSpan) THEN 
                            SET curPlayTimes = @playTimesPerSec * (@endTimeSec - @currSpan * TIME_SPAN_SEC);                           
                         ELSE                         
                            SET curPlayTimes = @playTimesPerSec * TIME_SPAN_SEC;                         
                         END IF;
                                    
                         insert into tmp_terminal_play_log values (curTerminalMac, curMediaId, date(curBeginTime), 
                                sec_to_time(@currSpan * TIME_SPAN_SEC), sec_to_time((@currSpan + 1) * TIME_SPAN_SEC), curPlayTimes, curPlayDuration);               
                         
                         SET @currSpan = @currSpan + 1;
                    END WHILE; 
               END IF;  
            END IF;
                          
            FETCH cur INTO curTerminalMac,curMediaId,curBeginTime,curEndTime,curTimeSpanIdx,curPlayTimes,curPlayDuration;        
     END WHILE;     
CLOSE cur;





delete from tb_charge_actual_play_bill
where play_date >= begindate
and play_date <= enddate ;

set inputTime = now() ;

insert into tb_charge_actual_play_bill(play_info_id,terminal_id,create_time,play_date,start_time,end_time,play_count,single_play_during)
    select b.id as play_info_id,a.id as terminal_id,inputTime,tmp.date,tmp.begin_span,tmp.end_span,tmp.play_times,tmp.play_duration as single_play_during
           from (select terminal_mac, media_id, date, begin_span, end_span, sum(play_times) as play_times, sum(play_times * play_duration) / sum(play_times) as play_duration 
                from tmp_terminal_play_log
                group by terminal_mac, media_id, date, begin_span, end_span
                ) tmp 
           left join tb_terminal_info a on tmp.terminal_mac = a.mac
           join tb_charge_play_info b on tmp.media_id = b.media_info_id;


call pc_charge_actual_dayall(begindate,enddate);

END;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

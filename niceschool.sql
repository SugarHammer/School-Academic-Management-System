# Host: localhost  (Version: 5.7.26)
# Date: 2023-04-17 13:32:30
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "course_type"
#

DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `ctname` varchar(100) NOT NULL,
  PRIMARY KEY (`ctid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "course_type"
#

INSERT INTO `course_type` VALUES (1,'专业基础课'),(2,'公共课'),(3,'任选课');

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL,
  `dcount` int(11) NOT NULL DEFAULT '0',
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "department"
#

INSERT INTO `department` VALUES (1,'1',0,0),(7,'计算机',2,0),(8,'电子信息系',0,0),(9,'代码系',0,0);

#
# Structure for table "evaluate_list"
#

DROP TABLE IF EXISTS `evaluate_list`;
CREATE TABLE `evaluate_list` (
  `elid` int(11) NOT NULL AUTO_INCREMENT,
  `elcontent` varchar(500) NOT NULL,
  PRIMARY KEY (`elid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "evaluate_list"
#

INSERT INTO `evaluate_list` VALUES (1,'讲师是否能坚持进行随堂测试，及时激励和督促学生的学习'),(2,'讲师是否能提前五分钟入班并准时上课？'),(3,'讲师的授课内容是否条理清晰、表达准确、操作熟练、逻辑性强？'),(4,'课堂气氛是否活跃，你对所学知识是否感兴趣并能积极参与？'),(5,'在做练习或项目时讲师是否保持在班内巡视，随时监督学生进度并及时发现和解决问题？'),(6,'讲师是否能在课程结束时及时总结，便于我对知识点的理解和掌握？'),(7,'讲师是否能对作业或练习中的问题进行集中讲解或单个点评？'),(8,'讲师是否能够严格要求学生并积极耐心的解答学生疑问？'),(9,'讲师是否能够诚实讲授知识，从不诱导我为其授课结果虚高打分？'),(10,'讲师是否能对学生认真负责，责任心强？'),(11,'111');

#
# Structure for table "evaluate_record"
#

DROP TABLE IF EXISTS `evaluate_record`;
CREATE TABLE `evaluate_record` (
  `erid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) NOT NULL,
  `tchid` varchar(20) NOT NULL,
  `erexam` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`erid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "evaluate_record"
#


#
# Structure for table "major"
#

DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) NOT NULL,
  `mcount` int(11) NOT NULL DEFAULT '0',
  `did` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`) USING BTREE,
  KEY `did` (`did`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "major"
#

INSERT INTO `major` VALUES (13,'软件工程',2,7,0),(14,'电子信息工程',0,8,0),(15,'电子科学与技术',0,8,0);

#
# Structure for table "grade"
#

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) NOT NULL,
  `gcount` int(5) unsigned zerofill NOT NULL DEFAULT '00000',
  `mid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "grade"
#

INSERT INTO `grade` VALUES (33,'1502',00002,13,0),(34,'电科1501\n',00000,15,0),(35,'电子15级',00000,14,0);

#
# Structure for table "classinfo"
#

DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `begintime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `ccount` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`classid`) USING BTREE,
  KEY `gid` (`gid`) USING BTREE,
  CONSTRAINT `classinfo_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "classinfo"
#

INSERT INTO `classinfo` VALUES (112,'软件工程2班',NULL,NULL,2,33,0),(113,'xxxxxxxxxxx',NULL,NULL,0,34,0),(114,'电子1501\n',NULL,NULL,0,35,0),(115,'代码java班',NULL,NULL,0,33,0);

#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) NOT NULL,
  `ccredit` decimal(9,2) NOT NULL,
  `cperiod` decimal(9,2) NOT NULL,
  `cstate` int(11) NOT NULL DEFAULT '0',
  `cselcount` int(11) NOT NULL DEFAULT '0',
  `cmaxcount` int(11) NOT NULL DEFAULT '0',
  `studytype` varchar(10) NOT NULL,
  `ctid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`) USING BTREE,
  KEY `ctid` (`ctid`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`ctid`) REFERENCES `course_type` (`ctid`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "course"
#

INSERT INTO `course` VALUES (1,'java 基础',4.00,64.00,0,0,100,'必修',2,13,0),(2,'代码代码',9.00,100.00,0,0,100,'选修',2,14,0),(3,'c++',5.00,50.00,0,1,100,'选修',1,13,0);

#
# Structure for table "newsinfo"
#

DROP TABLE IF EXISTS `newsinfo`;
CREATE TABLE `newsinfo` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` text NOT NULL,
  `ncontent` longtext NOT NULL,
  `nauthor` varchar(100) NOT NULL,
  `ntime` datetime DEFAULT CURRENT_TIMESTAMP,
  `nimg` varchar(500) DEFAULT 'https://tse3-mm.cn.bing.net/th/id/OIP-C.2FmnkYLCguEsJPfsEUAC5wAAAA?pid=ImgDet&rs=1',
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "newsinfo"
#

INSERT INTO `newsinfo` VALUES (1,'学校教务管理系统上线','双学位招生管理高调上线！！！','admin','2023-04-05 16:24:26','https://tse3-mm.cn.bing.net/th/id/OIP-C.2FmnkYLCguEsJPfsEUAC5wAAAA?pid=ImgDet&rs=1'),(2,'我校下半年招生开始啦！！！','各位考生：\n\n重庆大学2023年面向港澳台招收研究生将进入考试阶段，相关事宜通知如下：\n\n一、考试\n\n考试分初试、复试两个阶段。\n\n（一）初试\n\n1.初试内容与形式\n\n初试考试科目为英语、专业基础、专业综合，采取现场笔试的形式。\n\n2.初试时间与地点\n\n考生凭《准考证》(“面向港澳台招生信息网”下载打印)和个人有效身份证件参加初试。\n\n3.初试成绩\n\n初试成绩在重庆大学研究生招生信息网公示，公示时间不少于3个工作日。\n\n（二）复试\n\n1.复试资格\n\n报考重庆大学2023年面向港澳台招收研究生且初试各科考试成绩合格的考生。初试合格线在重庆大学研究生招生信息网公布。\n\n2.复试内容与形式\n\n复试考核包括但不限于道德品质、科学精神、诚实守信、遵纪守法、创新能力、专业素养和综合素质，以及外语听力及口语等外语能力的测试。\n\n复试采取现场面试的形式，每个考生面试时长不少于20分钟。','admin','2023-04-17 13:18:25','https://tse3-mm.cn.bing.net/th/id/OIP-C.2FmnkYLCguEsJPfsEUAC5wAAAA?pid=ImgDet&rs=1');

#
# Structure for table "politics_type"
#

DROP TABLE IF EXISTS `politics_type`;
CREATE TABLE `politics_type` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "politics_type"
#

INSERT INTO `politics_type` VALUES (1,'中共党员'),(2,'中共预备党员'),(3,'共青团员'),(4,'民革党员'),(5,'民盟盟员'),(6,'民建会员'),(7,'民进会员'),(8,'农工党党员'),(9,'致公党会员'),(10,'九三学社社员'),(11,'台盟盟员'),(12,'无党派人士'),(13,'群众');

#
# Structure for table "schedule"
#

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schid` int(11) NOT NULL AUTO_INCREMENT,
  `timeinterval` varchar(100) NOT NULL,
  `schname` varchar(100) NOT NULL,
  `summer` varchar(100) NOT NULL,
  `winter` varchar(100) NOT NULL,
  PRIMARY KEY (`schid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "schedule"
#

INSERT INTO `schedule` VALUES (1,'早上','起床','6:00','6:30'),(2,'早上','早操','6:10-7:00','6:40-7:00'),(3,'早上','早饭','7:10','7:10'),(4,'上午','预备','8:00','8:00'),(5,'上午','第一节','8:10-8:55','8:10-8:55'),(6,'上午','第二节','9:05-9:50','9:05-9:50'),(7,'上午','课间操','9:50-10:10','9:50-10:10'),(8,'上午','第三节','10:10-10:55','10:10-10:55'),(9,'上午','第四节','11:05-11:50','11:05-11:50'),(10,'中午','午饭','12:00','12:00'),(11,'下午','预备','14:30','14:00'),(12,'下午','第五节','14:40-15:25','14:10-14:55'),(13,'下午','第六节','15:35-16:20','15:05-15:50'),(14,'下午','课外活动','16:30-18:00','16:00-17:30');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sgender` varchar(20) NOT NULL,
  `sbirthday` date NOT NULL,
  `pid` int(11) NOT NULL,
  `snation` varchar(50) NOT NULL,
  `scardid` varchar(50) NOT NULL,
  `sphone` varchar(50) NOT NULL,
  `saddress` varchar(200) NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date DEFAULT NULL,
  `stustate` int(11) NOT NULL DEFAULT '0',
  `classid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  `mim` varchar(20) NOT NULL DEFAULT '111111',
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `classid` (`classid`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=15020004 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (15020000,'15020000','年份过渡数据','年份过渡数据','2020-06-27',1,'年份过渡数据','年份过渡数据','年份过渡数据','年份过渡数据','2020-06-27','2020-06-27',1,112,1,'111111'),(15020001,'15020001','morty','男','1996-01-23',1,'汉族','412365199601236544','13744444444','','1502-09-01','2020-06-27',2,112,1,'111111'),(15020002,'15020002','morty','女','1996-01-23',1,'汉族','412365199601236544','13974444444','xxx','1502-09-01',NULL,1,112,0,'111111'),(15020003,'15020003','zs','男','1999-12-12',1,'汉族','140303199912120014','13811112222','李家村','1502-09-01',NULL,0,112,0,'111111');

#
# Structure for table "stu_course"
#

DROP TABLE IF EXISTS `stu_course`;
CREATE TABLE `stu_course` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scid`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  CONSTRAINT `stu_course_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `stu_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "stu_course"
#

INSERT INTO `stu_course` VALUES (1,15020003,1,0),(2,15020003,3,0);

#
# Structure for table "stu_exam"
#

DROP TABLE IF EXISTS `stu_exam`;
CREATE TABLE `stu_exam` (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `normalexam` decimal(9,2) DEFAULT NULL,
  `testexam` decimal(9,2) DEFAULT NULL,
  `sumexam` decimal(9,2) DEFAULT NULL,
  `stime` int(11) NOT NULL,
  `studynature` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seid`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  KEY `scid` (`scid`) USING BTREE,
  CONSTRAINT `stu_exam_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `stu_exam_ibfk_2` FOREIGN KEY (`scid`) REFERENCES `stu_course` (`scid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "stu_exam"
#

INSERT INTO `stu_exam` VALUES (1,15020003,1,60.00,60.00,60.00,1,0,0);

#
# Structure for table "dropout"
#

DROP TABLE IF EXISTS `dropout`;
CREATE TABLE `dropout` (
  `drid` int(11) NOT NULL AUTO_INCREMENT,
  `drreason` longtext NOT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`drid`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  CONSTRAINT `dropout_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "dropout"
#

INSERT INTO `dropout` VALUES (12,'xxxxxxxxxxxxxxxxxx',15020001);

#
# Structure for table "sys_menu"
#

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "sys_menu"
#

INSERT INTO `sys_menu` VALUES ('0127fd90587d43c2846f0b6aa563f35c','教师授课管理','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,0127fd90587d43c2846f0b6aa563f35c,',4,'/tchcoursemanage/tchcoursemanage',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 11:18:28','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 11:18:28',NULL,0),('0516eff241b7418a9ead2111187f9d75','辍学信息','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,0516eff241b7418a9ead2111187f9d75,',4,'/dropoutPage',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 16:45:52','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 16:45:52',NULL,0),('0ad281e996484506b0064e647bfb1e1c','成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,0ad281e996484506b0064e647bfb1e1c,',1,'/selectGrade',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:15:53','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:16:56',NULL,0),('118126c2a71141858ec667c104d7cd3d','发布招生','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,118126c2a71141858ec667c104d7cd3d,',1,'/news/addnews',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 01:22:30','0684935cb2ae4cd5994155a32603d195','2019-11-04 01:22:30',NULL,0),('16da2b1c1fa14182816f05850515bdce','课表查询','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,16da2b1c1fa14182816f05850515bdce,',1,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:17:02','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 17:17:13',NULL,1),('19c96fa92510436196066c4d529ddd65','课目管理','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,19c96fa92510436196066c4d529ddd65,',3,'/selCou',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:20:03','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 13:00:38',NULL,0),('1b84b70acfbd4b12ac3bad1fee892330','选课管理',NULL,1,'1b84b70acfbd4b12ac3bad1fee892330,',13,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:51','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:51',NULL,0),('32e652d6788d471196683ca53b948c63','成绩管理',NULL,1,'32e652d6788d471196683ca53b948c63,',4,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:15:10','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:30:17',NULL,0),('346bee7d3f7741b58e01ee062c3aba73','学生管理',NULL,1,'346bee7d3f7741b58e01ee062c3aba73,',7,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:23:25','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:32:03',NULL,0),('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb','用户管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,',9,'/admin/system/user/list',NULL,'','#47e69c',1,'sys:user:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:31:18','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 05:59:20',NULL,0),('3b58e01e-9adb-11e8-aebe-1368d4ec24eb','角色管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,',10,'/admin/system/role/list',NULL,'','#c23ab9',1,'sys:role:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:32:33','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 05:58:58',NULL,0),('3b5cb607-9adb-11e8-aebe-1368d4ec24eb','权限管理','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb',2,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,',20,'/admin/system/menu/list',NULL,'','#d4573b',1,'sys:menu:list','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:33:19','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:28',NULL,0),('3d2bbd52a26344e59c2b25d615614d44','班级管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,3d2bbd52a26344e59c2b25d615614d44,',4,'/schoolmanage/classmanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:28:18','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:28:19',NULL,0),('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb','新增用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:user:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:10:32','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:10:32',NULL,0),('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb','编辑用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:user:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:11:49','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:11:49',NULL,0),('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb','删除用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:user:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:12:43','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 10:12:43',NULL,0),('42ff87aec13c409da75b6c7b5ee333ec','课程管理',NULL,1,'42ff87aec13c409da75b6c7b5ee333ec,',5,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:16:44','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:30:30',NULL,0),('45076bf2dbb5443db49c062994d0fb4b','专业管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,45076bf2dbb5443db49c062994d0fb4b,',2,'/schoolmanage/majormanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:19','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:19',NULL,0),('4d457c31f4fc4e0595c5c6448fe7630a','招生管理','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,4d457c31f4fc4e0595c5c6448fe7630a,',3,'/news/newscontrol',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:13','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:13',NULL,0),('4e833c1bd3e8485ab12d4d19269de739','系部管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,4e833c1bd3e8485ab12d4d19269de739,',1,'/schoolmanage/dpmmanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:26:32','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:26:33',NULL,0),('4f1451598a344744b0d225790f52aa19','退课','4f8ead47ab25421f85f27af3db60a84e',2,'4f8ead47ab25421f85f27af3db60a84e,4f1451598a344744b0d225790f52aa19,',2,'/seledCourse',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:55','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:55',NULL,0),('4f8ead47ab25421f85f27af3db60a84e','网上选课',NULL,1,'4f8ead47ab25421f85f27af3db60a84e,',11,'/',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:16:04','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:12:07',NULL,0),('5178554598814a239475716ed4fef474','查询学生','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,5178554598814a239475716ed4fef474,',5,'/selAllStudent',NULL,NULL,'',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-22 13:43:20','054a2cd6369c48d8a52d62e0084d4527','2019-11-22 13:51:08',NULL,0),('54b74a2152674cbdbdf63c32daf840c5','网上教评',NULL,1,'54b74a2152674cbdbdf63c32daf840c5,',6,'/appraise/seltch',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:18:47','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:31:12',NULL,0),('5940b85334e54463a557f9d7b57f883f','教师信息修改','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,5940b85334e54463a557f9d7b57f883f,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:34:24','054a2cd6369c48d8a52d62e0084d4527','2019-11-11 09:48:39',NULL,1),('69b1c803b1a14a8989cf79c4465c0c7e','录入教师','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,69b1c803b1a14a8989cf79c4465c0c7e,',3,'/addTeacherPage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:34:37','0684935cb2ae4cd5994155a32603d195','2019-11-06 20:01:58',NULL,0),('72cfb92b47584cf499624dba63cc553a','教师成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,72cfb92b47584cf499624dba63cc553a,',4,'/tchExam',NULL,'','',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 17:35:29','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 17:35:29',NULL,0),('7a3b765260f5422c8d0a22e8d5ea8d05','教师信息查询','832e289e4a4d49a68eea3441979ff703',2,'832e289e4a4d49a68eea3441979ff703,7a3b765260f5422c8d0a22e8d5ea8d05,',1,'/selectTeacher',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:54','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:25:38',NULL,0),('7ab4c00ce86f4ef8808a16a25625919d','学生选课管理','1b84b70acfbd4b12ac3bad1fee892330',2,'1b84b70acfbd4b12ac3bad1fee892330,7ab4c00ce86f4ef8808a16a25625919d,',1,'/selCourses',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:27:04','054a2cd6369c48d8a52d62e0084d4527','2019-11-07 13:01:45',NULL,0),('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb','系统管理',NULL,1,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,',1,'',NULL,'',NULL,1,'','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-16 11:29:46','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-01-20 03:09:26',NULL,0),('832e289e4a4d49a68eea3441979ff703','教师管理',NULL,1,'832e289e4a4d49a68eea3441979ff703,',8,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:23:46','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:32:13',NULL,0),('894cc49337bf49cb83b91f859e471349','新闻查询','bb86050a4b4b498b977f93cccd5b2bec',2,'bb86050a4b4b498b977f93cccd5b2bec,894cc49337bf49cb83b91f859e471349,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:11:00','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:29:06',NULL,1),('8c4743e9a38446e7b13f7e0b6b97a28e','年级管理','d04edab30f5b4df4af28254e375c2ff6',2,'d04edab30f5b4df4af28254e375c2ff6,8c4743e9a38446e7b13f7e0b6b97a28e,',3,'/schoolmanage/grademanage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:52','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:27:52',NULL,0),('93979ed945b94fee9a53dbdc184a8eee','教评问题管理','c457ebb1ad6f47afa69ccc32d6b73b1a',2,'c457ebb1ad6f47afa69ccc32d6b73b1a,93979ed945b94fee9a53dbdc184a8eee,',1,'/appraise/evlistcontrol',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:29','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:29',NULL,0),('95273203460543e8942174ec460a6f12','正选','4f8ead47ab25421f85f27af3db60a84e',2,'4f8ead47ab25421f85f27af3db60a84e,95273203460543e8942174ec460a6f12,',1,'/course/sel',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:11:26','0684935cb2ae4cd5994155a32603d195','2019-11-07 14:11:26',NULL,0),('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb','新增权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:menu:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:15','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:49:38',NULL,0),('9703ccf2-9adb-11e8-aebe-1368d4ec24eb','编辑权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:menu:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:50:16','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:50:25',NULL,0),('9707cf58-9adb-11e8-aebe-1368d4ec24eb','删除权限','3b5cb607-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:menu:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:51:53','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:53:42',NULL,0),('ad13ddd195e147b7a7e8c3bd20f05cea','录入学生','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,ad13ddd195e147b7a7e8c3bd20f05cea,',3,'/addStudentPage',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:38','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:20:28',NULL,0),('b85b2b42c1cd4281b6e3884cc1a53327','成绩录入','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,b85b2b42c1cd4281b6e3884cc1a53327,',2,'/selstudentExam',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:16:14','0684935cb2ae4cd5994155a32603d195','2019-11-17 19:18:42',NULL,0),('bb86050a4b4b498b977f93cccd5b2bec','校园招生',NULL,1,'bb86050a4b4b498b977f93cccd5b2bec,',14,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-03 20:15:53','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:29:54',NULL,0),('c0ae0cc7e86c45b7a7d6c276a4400a80','选课管理',NULL,1,'c0ae0cc7e86c45b7a7d6c276a4400a80,',12,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:09','0684935cb2ae4cd5994155a32603d195','2019-11-07 08:22:18',NULL,1),('c457ebb1ad6f47afa69ccc32d6b73b1a','教评管理',NULL,1,'c457ebb1ad6f47afa69ccc32d6b73b1a,',10,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 13:58:00','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:33:59',NULL,0),('c6d5768068f1401bad9f24a5a5b33a92','学生成绩','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,c6d5768068f1401bad9f24a5a5b33a92,',2,'/tchSelExam',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:25','054a2cd6369c48d8a52d62e0084d4527','2019-11-11 09:27:53',NULL,0),('d024c4836bc941208ae2f2ad00bf630e','调换课程','42ff87aec13c409da75b6c7b5ee333ec',2,'42ff87aec13c409da75b6c7b5ee333ec,d024c4836bc941208ae2f2ad00bf630e,',2,'',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:17:24','054a2cd6369c48d8a52d62e0084d4527','2019-11-20 17:17:19',NULL,1),('d04edab30f5b4df4af28254e375c2ff6','校建管理',NULL,1,'d04edab30f5b4df4af28254e375c2ff6,',9,'',NULL,'','',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-05 09:24:09','0684935cb2ae4cd5994155a32603d195','2019-11-05 15:33:34',NULL,0),('dadca40757374e38a46c9901876febb9','学生成绩查询','32e652d6788d471196683ca53b948c63',2,'32e652d6788d471196683ca53b948c63,dadca40757374e38a46c9901876febb9,',3,'/selStuAllExam',NULL,'','',1,'','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 10:23:04','054a2cd6369c48d8a52d62e0084d4527','2019-11-14 10:23:04',NULL,0),('ed63866b30cf46bfb6797a1d31ae930c','锁定用户','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,',21,'',NULL,NULL,'',0,'sys:user:lock','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-08-21 17:44:05','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-08-21 17:44:05',NULL,0),('fd3b5d6130dc496fadbb33cca4737863','学生信息查询','346bee7d3f7741b58e01ee062c3aba73',2,'346bee7d3f7741b58e01ee062c3aba73,fd3b5d6130dc496fadbb33cca4737863,',1,'/selectStudent',NULL,NULL,'',1,'','0684935cb2ae4cd5994155a32603d195','2019-11-04 15:33:08','0684935cb2ae4cd5994155a32603d195','2019-11-06 19:20:41',NULL,0),('ff619e04-9adb-11e8-aebe-1368d4ec24eb','新增角色','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,',0,'',NULL,NULL,NULL,0,'sys:role:add','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:58:11','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:58:11',NULL,0),('ff9477c9-9adb-11e8-aebe-1368d4ec24eb','编辑权限','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,',10,'',NULL,NULL,NULL,0,'sys:role:edit','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:01','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:01',NULL,0),('ff9ad846-9adb-11e8-aebe-1368d4ec24eb','删除角色','3b58e01e-9adb-11e8-aebe-1368d4ec24eb',3,'7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,',20,'',NULL,NULL,NULL,0,'sys:role:delete','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:56','18b8b543-9ad7-11e8-aebe-1368d4ec24eb','2018-02-08 09:59:56',NULL,0);

#
# Structure for table "sys_role"
#

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES ('1893c63a307b44709c643d60324ed3de','教师','2019-11-27 23:18:13','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:18:13','054a2cd6369c48d8a52d62e0084d4527','教师',0),('4212d47f61944d3e9f797598102ea67b','学生','2019-11-27 23:17:37','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:17:37','054a2cd6369c48d8a52d62e0084d4527','学生',0),('6619c0ed9452430e9ea23a6542d884a2','管理员','2019-11-27 23:09:05','054a2cd6369c48d8a52d62e0084d4527','2019-11-27 23:09:05','054a2cd6369c48d8a52d62e0084d4527','管理员',0);

#
# Structure for table "sys_role_menu"
#

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "sys_role_menu"
#

INSERT INTO `sys_role_menu` VALUES ('1893c63a307b44709c643d60324ed3de','32e652d6788d471196683ca53b948c63'),('1893c63a307b44709c643d60324ed3de','346bee7d3f7741b58e01ee062c3aba73'),('1893c63a307b44709c643d60324ed3de','b85b2b42c1cd4281b6e3884cc1a53327'),('1893c63a307b44709c643d60324ed3de','c6d5768068f1401bad9f24a5a5b33a92'),('4212d47f61944d3e9f797598102ea67b','0ad281e996484506b0064e647bfb1e1c'),('4212d47f61944d3e9f797598102ea67b','32e652d6788d471196683ca53b948c63'),('4212d47f61944d3e9f797598102ea67b','4f1451598a344744b0d225790f52aa19'),('4212d47f61944d3e9f797598102ea67b','4f8ead47ab25421f85f27af3db60a84e'),('4212d47f61944d3e9f797598102ea67b','54b74a2152674cbdbdf63c32daf840c5'),('4212d47f61944d3e9f797598102ea67b','95273203460543e8942174ec460a6f12'),('6619c0ed9452430e9ea23a6542d884a2','0127fd90587d43c2846f0b6aa563f35c'),('6619c0ed9452430e9ea23a6542d884a2','0516eff241b7418a9ead2111187f9d75'),('6619c0ed9452430e9ea23a6542d884a2','118126c2a71141858ec667c104d7cd3d'),('6619c0ed9452430e9ea23a6542d884a2','19c96fa92510436196066c4d529ddd65'),('6619c0ed9452430e9ea23a6542d884a2','1b84b70acfbd4b12ac3bad1fee892330'),('6619c0ed9452430e9ea23a6542d884a2','32e652d6788d471196683ca53b948c63'),('6619c0ed9452430e9ea23a6542d884a2','346bee7d3f7741b58e01ee062c3aba73'),('6619c0ed9452430e9ea23a6542d884a2','3b54e2a2-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3b58e01e-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3b5cb607-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3d2bbd52a26344e59c2b25d615614d44'),('6619c0ed9452430e9ea23a6542d884a2','3e0b86a3-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','3e36cf2f-9adc-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','42ff87aec13c409da75b6c7b5ee333ec'),('6619c0ed9452430e9ea23a6542d884a2','45076bf2dbb5443db49c062994d0fb4b'),('6619c0ed9452430e9ea23a6542d884a2','4d457c31f4fc4e0595c5c6448fe7630a'),('6619c0ed9452430e9ea23a6542d884a2','4e833c1bd3e8485ab12d4d19269de739'),('6619c0ed9452430e9ea23a6542d884a2','69b1c803b1a14a8989cf79c4465c0c7e'),('6619c0ed9452430e9ea23a6542d884a2','72cfb92b47584cf499624dba63cc553a'),('6619c0ed9452430e9ea23a6542d884a2','7a3b765260f5422c8d0a22e8d5ea8d05'),('6619c0ed9452430e9ea23a6542d884a2','7ab4c00ce86f4ef8808a16a25625919d'),('6619c0ed9452430e9ea23a6542d884a2','7d1020ee-9ad9-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','832e289e4a4d49a68eea3441979ff703'),('6619c0ed9452430e9ea23a6542d884a2','8c4743e9a38446e7b13f7e0b6b97a28e'),('6619c0ed9452430e9ea23a6542d884a2','93979ed945b94fee9a53dbdc184a8eee'),('6619c0ed9452430e9ea23a6542d884a2','96fd6a5a-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','9703ccf2-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','9707cf58-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ad13ddd195e147b7a7e8c3bd20f05cea'),('6619c0ed9452430e9ea23a6542d884a2','bb86050a4b4b498b977f93cccd5b2bec'),('6619c0ed9452430e9ea23a6542d884a2','c457ebb1ad6f47afa69ccc32d6b73b1a'),('6619c0ed9452430e9ea23a6542d884a2','d04edab30f5b4df4af28254e375c2ff6'),('6619c0ed9452430e9ea23a6542d884a2','dadca40757374e38a46c9901876febb9'),('6619c0ed9452430e9ea23a6542d884a2','ed63866b30cf46bfb6797a1d31ae930c'),('6619c0ed9452430e9ea23a6542d884a2','fd3b5d6130dc496fadbb33cca4737863'),('6619c0ed9452430e9ea23a6542d884a2','ff619e04-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ff9477c9-9adb-11e8-aebe-1368d4ec24eb'),('6619c0ed9452430e9ea23a6542d884a2','ff9ad846-9adb-11e8-aebe-1368d4ec24eb');

#
# Structure for table "sys_user"
#

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES ('0063a5c260fb41848f0b4e9b1fe93427','2020001','王老师',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','13986744231',NULL,0,'2020-07-09 18:38:47','054a2cd6369c48d8a52d62e0084d4527','2020-07-09 18:38:47','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1),('01327995b1c24866b584a1376ea5763c','15020003','zs',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','13811112222','123@qq.com',0,'2023-04-05 16:50:58','054a2cd6369c48d8a52d62e0084d4527','2023-04-05 16:58:48','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1),('054a2cd6369c48d8a52d62e0084d4527','admin','管理员','','ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','10101010101','gly@gly.com',0,'2019-11-06 17:42:56','0684935cb2ae4cd5994155a32603d195','2020-07-08 14:49:25','054a2cd6369c48d8a52d62e0084d4527','',0,1),('990a9f41852f4edd9974d8f4400094ce','15020002','morty',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','13974444444',NULL,0,'2020-06-27 14:37:34','054a2cd6369c48d8a52d62e0084d4527','2020-06-27 14:37:34','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1),('c317c2c0058143609bc3b0199193f093','15020001','morty',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','13744444444',NULL,1,'2020-06-27 14:37:09','054a2cd6369c48d8a52d62e0084d4527','2020-06-27 14:37:09','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1),('dfcc397dafe04c10943629f8d1237c5b','代码','代码',NULL,'ab44fda09e0872c39d6feb181a79b3840ba541b6','b5d007f4b2f7542e','13520109204','daima@qq.com',0,'2020-07-13 23:45:23','054a2cd6369c48d8a52d62e0084d4527','2022-03-16 14:43:31','054a2cd6369c48d8a52d62e0084d4527',NULL,0,1);

#
# Structure for table "sys_user_role"
#

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "sys_user_role"
#

INSERT INTO `sys_user_role` VALUES ('0063a5c260fb41848f0b4e9b1fe93427','1893c63a307b44709c643d60324ed3de'),('01327995b1c24866b584a1376ea5763c','4212d47f61944d3e9f797598102ea67b'),('054a2cd6369c48d8a52d62e0084d4527','6619c0ed9452430e9ea23a6542d884a2'),('990a9f41852f4edd9974d8f4400094ce','4212d47f61944d3e9f797598102ea67b'),('c317c2c0058143609bc3b0199193f093','4212d47f61944d3e9f797598102ea67b'),('dfcc397dafe04c10943629f8d1237c5b','1893c63a307b44709c643d60324ed3de'),('dfcc397dafe04c10943629f8d1237c5b','4212d47f61944d3e9f797598102ea67b'),('dfcc397dafe04c10943629f8d1237c5b','6619c0ed9452430e9ea23a6542d884a2');

#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tchid` varchar(20) NOT NULL,
  `tname` varchar(20) NOT NULL,
  `tgender` varchar(20) NOT NULL,
  `tbirthday` date NOT NULL,
  `pid` int(11) NOT NULL,
  `tnation` varchar(50) NOT NULL,
  `tcardid` varchar(50) NOT NULL,
  `tphone` varchar(50) NOT NULL,
  `taddress` varchar(200) NOT NULL,
  `entertime` date NOT NULL,
  `leavetime` date DEFAULT NULL,
  `tchstate` int(11) NOT NULL DEFAULT '0',
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `politics_type` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2020002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES (2020000,'2020000','年份过渡数据','年份过渡数据','2020-07-09',1,'年份过渡数据','年份过渡数据','年份过渡数据','年份过渡数据','2020-07-09','2020-07-09',1,1),(2020001,'2020001','王老师','男','1997-08-13',1,'汉族','420984199708133614','13986744231','xxxxxxxxx','2020-07-09',NULL,0,0);

#
# Structure for table "tch_exam"
#

DROP TABLE IF EXISTS `tch_exam`;
CREATE TABLE `tch_exam` (
  `teid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `exam` decimal(9,2) DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `tetime` date NOT NULL,
  `semester` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  CONSTRAINT `tch_exam_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tch_exam"
#


#
# Structure for table "weeks"
#

DROP TABLE IF EXISTS `weeks`;
CREATE TABLE `weeks` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wname` varchar(20) NOT NULL,
  `walias` varchar(20) NOT NULL,
  PRIMARY KEY (`wid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "weeks"
#

INSERT INTO `weeks` VALUES (1,'星期一','周一'),(2,'星期二','周二'),(3,'星期三','周三'),(4,'星期四','周四'),(5,'星期五','周五'),(6,'星期六','周六'),(7,'星期日','周日');

#
# Structure for table "tch_course"
#

DROP TABLE IF EXISTS `tch_course`;
CREATE TABLE `tch_course` (
  `tcid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `schid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tcid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `wid` (`wid`) USING BTREE,
  KEY `schid` (`schid`) USING BTREE,
  KEY `gid` (`gid`) USING BTREE,
  CONSTRAINT `tch_course_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`),
  CONSTRAINT `tch_course_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `tch_course_ibfk_3` FOREIGN KEY (`wid`) REFERENCES `weeks` (`wid`),
  CONSTRAINT `tch_course_ibfk_4` FOREIGN KEY (`schid`) REFERENCES `schedule` (`schid`),
  CONSTRAINT `tch_course_ibfk_5` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tch_course"
#

INSERT INTO `tch_course` VALUES (1,2020001,1,1,1,33,0),(2,2020001,3,1,1,33,0);

#
# Structure for table "tch_class"
#

DROP TABLE IF EXISTS `tch_class`;
CREATE TABLE `tch_class` (
  `tcsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `tcid` int(11) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tcsid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `classid` (`classid`) USING BTREE,
  KEY `tch_class_ibfk_3` (`tcid`) USING BTREE,
  CONSTRAINT `tch_class_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`),
  CONSTRAINT `tch_class_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classinfo` (`classid`),
  CONSTRAINT `tch_class_ibfk_3` FOREIGN KEY (`tcid`) REFERENCES `tch_course` (`tcid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "tch_class"
#

INSERT INTO `tch_class` VALUES (1,2020001,112,1,0),(2,2020001,112,2,0);

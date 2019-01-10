/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.0.22-community-nt : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hospital`;

/*Table structure for table `chufang` */

DROP TABLE IF EXISTS `chufang`;

CREATE TABLE `chufang` (
  `c_id` int(50) NOT NULL auto_increment,
  `chu_date` date default NULL,
  `diagnosis` varchar(100) default NULL,
  `content` varchar(300) default NULL,
  PRIMARY KEY  (`c_id`),
  KEY `fk_patient_b` (`chu_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3;

/*Data for the table `chufang` */

insert  into `chufang`(`c_id`,`chu_date`,`diagnosis`,`content`) values 
(1,'2019-01-03','乙肝','阿莫西林胶囊'),
(2,'2019-01-01','甲肝','999感冒灵');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `d_id` int(50) NOT NULL,
  `d_name` varchar(20) default NULL,
  PRIMARY KEY  (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`d_id`,`d_name`) values 
(10,'门诊部'),
(20,'急诊部'),
(30,'住院部'),
(40,'药房'),
(50,'收费室'),
(60,'手术室'),
(70,'化验室'),
(80,'后勤');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(50) NOT NULL auto_increment,
  `Username` varchar(100) default NULL,
  `UserLogin` varchar(100) default NULL,
  `UserPwd` varchar(100) default NULL,
  `did` int(50) default NULL,
  `Isoperate` int(50) default NULL,
  `Usertype` varchar(20) default NULL,
  `hiredate` date default NULL,
  `sex` char(2) default NULL,
  `age` int(50) default NULL,
  `Education` varchar(50) default NULL,
  `pos` varchar(50) default NULL,
  `addr` varchar(100) default NULL,
  `iphone` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `doctor` */

insert  into `doctor`(`id`,`Username`,`UserLogin`,`UserPwd`,`did`,`Isoperate`,`Usertype`,`hiredate`,`sex`,`age`,`Education`,`pos`,`addr`,`iphone`) values 
(10001,'杨云','yang','123',3,0,'doctor','2015-03-21','男',23,'研究生','主任医师','兰州','17235469824'),
(10002,'杨超越','yue','123',2,1,'nurse','2016-06-16','女',26,'本科','初级护士','延安','174269824'),
(10003,'张三丰','zhang','123',4,0,'doctor','2010-05-10','男',30,'博士','主任医师','成都','18352689354'),
(10004,'花满楼','hua','123',3,0,'doctor','2016-03-17','男',25,'研究生','副主任医师','西安','19654302681'),
(10005,'金毛狮王','jin','123',5,0,'doctor','2011-07-07','男',35,'研究生','副主任医师','东莞','173465826548'),
(10006,'小龙女','xiao','123',3,1,'nurse','2015-08-19','女',28,'本科','高级护工','北京','17895456215');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `e_id` int(50) NOT NULL auto_increment,
  `username` varchar(100) default NULL,
  `userlogin` varchar(100) default NULL,
  `userpwd` varchar(100) default NULL,
  `hiredate` date default NULL,
  `sex` char(2) default NULL,
  `age` int(50) default NULL,
  `education` varchar(50) default NULL,
  `addr` varchar(100) default NULL,
  `iphon` varchar(50) default NULL,
  `k_id` int(50) default NULL,
  `q_id` int(50) default NULL,
  `usertype` varchar(50) default NULL,
  `pos` varchar(100) default NULL,
  PRIMARY KEY  (`e_id`),
  KEY `fk_dept_b` (`k_id`),
  KEY `fk_quanxian_a` (`q_id`),
  CONSTRAINT `fk_waijian_b` FOREIGN KEY (`k_id`) REFERENCES `keshi` (`k_id`),
  CONSTRAINT `fk_quanxian_a` FOREIGN KEY (`q_id`) REFERENCES `quanxian` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4;

/*Data for the table `emp` */

insert  into `emp`(`e_id`,`username`,`userlogin`,`userpwd`,`hiredate`,`sex`,`age`,`education`,`addr`,`iphon`,`k_id`,`q_id`,`usertype`,`pos`) values 
(1001,'杨云','yn','123','2017-07-10','男',23,'本科','兰州','18892881122',1,3,'医生','主任医师'),
(1002,'小龙女','wwg','123','2015-12-25','女',22,'大专','青海','15202484403',2,3,'医生','副主任医师'),
(1003,'明明','mm','123','2016-02-05','女',26,'本科','北京','1502484406',3,3,'护士','护士长'),
(1004,'杨超越','ycy','123','2014-01-20','男',23,'本科','成都','13325301456',1,3,'医生','主治医生'),
(1005,'马腾','mt','123','2019-01-01','男',26,'本科','宝鸡市','15647896541',7,3,'医生','副主治医生');

/*Table structure for table `guahao` */

DROP TABLE IF EXISTS `guahao`;

CREATE TABLE `guahao` (
  `g_id` int(50) NOT NULL auto_increment,
  `gh_date` date default NULL,
  `status` varchar(50) default NULL,
  `grade` varchar(50) default NULL,
  `visit` int(50) default NULL,
  PRIMARY KEY  (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6;

/*Data for the table `guahao` */

insert  into `guahao`(`g_id`,`gh_date`,`status`,`grade`,`visit`) values 
(201901,'2019-01-18','是','专家',1),
(201902,'2019-01-21','否','普通',2),
(201903,'2019-01-16','是','教授',3);

/*Table structure for table `keshi` */

DROP TABLE IF EXISTS `keshi`;

CREATE TABLE `keshi` (
  `k_id` int(50) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `d_id` int(50) default NULL,
  PRIMARY KEY  (`k_id`),
  KEY `fk_keshi` (`d_id`),
  CONSTRAINT `fk_dept_a` FOREIGN KEY (`d_id`) REFERENCES `dept` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `keshi` */

insert  into `keshi`(`k_id`,`name`,`d_id`) values 
(1,'耳鼻喉科',10),
(2,'儿科',10),
(3,'口腔科',10),
(4,'皮肤科',10),
(5,'骨科',10),
(6,'眼科',10),
(7,'内科',10),
(8,'外科',10),
(9,'内科',20),
(10,'外科',20),
(11,'妇产科',20),
(13,'儿科',20),
(14,'呼吸内科',30),
(15,'消化内科',30),
(16,'骨科',30),
(17,'门诊药房',40),
(18,'急诊药房',40),
(19,'住院药房',40),
(20,'药房仓库',40),
(21,'门诊收费室',50),
(22,'住院收费室',50),
(23,'急诊收费室',50),
(26,'1号手术间',60),
(27,'2号手术间',60),
(28,'生化室',70),
(29,'检验室',70),
(30,'病理室',70),
(31,'衣被室',80),
(32,'电脑技术室',80),
(33,'设备',80);

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` varchar(10) default NULL,
  `message` varchar(1000) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`message`) values 
('1','你好'),
('2','见到你真高兴');

/*Table structure for table `medicine` */

DROP TABLE IF EXISTS `medicine`;

CREATE TABLE `medicine` (
  `m_id` int(50) NOT NULL auto_increment,
  `drugName` varchar(100) default NULL,
  `num` int(50) default NULL,
  `unit` varchar(100) default NULL,
  `descp` varchar(300) default NULL,
  `price` decimal(18,2) default NULL,
  PRIMARY KEY  (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `medicine` */

insert  into `medicine`(`m_id`,`drugName`,`num`,`unit`,`descp`,`price`) values 
(1,'心痛定',100,'盒','止痛',50.00),
(2,'咳必清',100,'盒','咳嗽',20.00),
(4,'牛黄解毒片',100,'盒','消炎',15.00),
(5,'云南白药',100,'瓶','止血',30.00),
(6,'板蓝根',100,'盒','发烧',15.00),
(8,'天山雪莲',10,'朵','包治百病',100000.00),
(10,'开塞露',80,'瓶','导泻药',10.00),
(11,'庆大霉素',40,'瓶','杀菌',20.00),
(12,'甘露醇',40,'盒','利尿',40.00),
(13,'复方古参',40,'盒','清热利湿',25.00),
(14,'参脉',30,'瓶','益气养阴',60.00),
(15,'安乃静',200,'盒','发烧',10.00),
(16,'eqw',20,'个','烧鹅饭',12.00),
(17,'三黄片',200,'盒','清火',10.00),
(18,'通天丸',10,'粒','提升魂力',100000.00),
(19,'tom',234,'个','恩爱狗',244.00),
(20,'tom',12,'个','123',123.00);

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `p_id` int(50) NOT NULL auto_increment,
  `username` varchar(100) default NULL,
  `userlogin` varchar(100) default NULL,
  `userpwd` varchar(100) default NULL,
  `sex` char(2) default NULL,
  `age` int(50) default NULL,
  `education` varchar(50) default NULL,
  `addr` varchar(100) default NULL,
  `iphone` varchar(50) default NULL,
  `zhuyuan` varchar(10) default NULL,
  `g_id` int(50) default NULL,
  `c_id` int(50) default NULL,
  PRIMARY KEY  (`p_id`),
  KEY `fk_chufang_a` (`c_id`),
  KEY `fk_guahao_a` (`g_id`),
  CONSTRAINT `fk_chufang_a` FOREIGN KEY (`c_id`) REFERENCES `chufang` (`c_id`),
  CONSTRAINT `fk_guahao_a` FOREIGN KEY (`g_id`) REFERENCES `guahao` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `patient` */

insert  into `patient`(`p_id`,`username`,`userlogin`,`userpwd`,`sex`,`age`,`education`,`addr`,`iphone`,`zhuyuan`,`g_id`,`c_id`) values 
(1,'马小明','mxm','123','男',26,'本科','西安','16602901122','',201901,1),
(2,'王华峰','whf','123','男',25,'本科','宝鸡','15466304789','',201902,2),
(3,'陈小花','cxh','123','女',23,'本科','宝鸡','15466304789','',201903,2);

/*Table structure for table `quanxian` */

DROP TABLE IF EXISTS `quanxian`;

CREATE TABLE `quanxian` (
  `q_id` int(50) NOT NULL auto_increment,
  `quanxian` varchar(50) default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `quanxian` */

insert  into `quanxian`(`q_id`,`quanxian`) values 
(1,'增加,查询'),
(2,'修改,删除,增加,查询'),
(3,'修改,查询'),
(4,'查询'),
(5,'删除'),
(6,'修改');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

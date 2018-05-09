-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: dailyfresh
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add type info',8,'add_typeinfo'),(23,'Can change type info',8,'change_typeinfo'),(24,'Can delete type info',8,'delete_typeinfo'),(25,'Can add goods info',9,'add_goodsinfo'),(26,'Can change goods info',9,'change_goodsinfo'),(27,'Can delete goods info',9,'delete_goodsinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$FuKz8OrRAZ6n$EPAHgkTFrB9Uggg260Rs6zGLozWiXOYKaJtlqY9aeCs=','2018-05-09 08:50:51.461086',1,'huangxu','','','123@163.com',1,1,'2018-05-08 15:38:58.481181');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodsinfo`
--

DROP TABLE IF EXISTS `df_goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) NOT NULL,
  `gimage` varchar(100) NOT NULL,
  `gprice` decimal(10,2) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int(11) NOT NULL,
  `gbrief_introduction` varchar(200) NOT NULL,
  `ginventory` int(11) NOT NULL,
  `gdetailed_introduction` longtext NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_3204e418` (`gtype_id`),
  CONSTRAINT `df_goods_goodsi_gtype_id_36acf5bdedbbbe8_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodsinfo`
--

LOCK TABLES `df_goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `df_goods_goodsinfo` VALUES (1,'大兴大棚草莓','df_goods/goods003.jpg',16.80,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</p>',0,1),(2,'葡萄','df_goods/goods002.jpg',5.50,'500g',0,'葡萄浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p>葡萄采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</p>',0,1),(3,'柠檬','df_goods/goods001.jpg',3.90,'500g',0,'nm草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p>nm草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</p>',0,1),(4,'奇异果','df_goods/goods012.jpg',25.80,'500g',0,'qyg草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择</p>',0,1),(5,'青岛野生海捕大青虾','df_goods/goods018.jpg',48.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,2),(6,'扇贝','df_goods/goods019.jpg',46.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,2),(7,'冷冻秋刀鱼','df_goods/goods020.jpg',19.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,2),(8,'基围虾','df_goods/goods021.jpg',25.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,2),(9,'维多利亚葡萄','df_goods/goods001_JhLTtRr.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,3),(10,'维多利亚葡萄','df_goods/goods001_6VgIjMs.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,3),(11,'维多利亚葡萄','df_goods/goods001_nmMcLAK.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,3),(12,'维多利亚葡萄','df_goods/goods001_ghJCTzf.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,3),(13,'土鸡蛋','df_goods/goods002_seemHz9.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,4),(14,'土鸡蛋','df_goods/goods002_0okiKoU.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,4),(15,'土鸡蛋','df_goods/goods002_o4afS8t.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,4),(16,'土鸡蛋','df_goods/goods002_LAMkdUg.jpg',38.00,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,4),(17,'四季豆','df_goods/goods003_yBU2DEu.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,5),(18,'四季豆','df_goods/goods003_uTT5LIi.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,5),(19,'四季豆','df_goods/goods003_IgeFLnM.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,5),(20,'四季豆','df_goods/goods003_UqoWzMQ.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,5),(21,'湾仔码头水饺','df_goods/goods004.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,6),(22,'湾仔码头水饺','df_goods/goods005.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,6),(23,'湾仔码头水饺','df_goods/goods009.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,6),(24,'湾仔码头水饺','df_goods/goods016.jpg',3.50,'500g',0,'草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。',9999,'<p><span style=\"font-size: 10px;\">草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。</span></p>',0,6);
/*!40000 ALTER TABLE `df_goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_typeinfo`
--

DROP TABLE IF EXISTS `df_goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `timage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_typeinfo`
--

LOCK TABLES `df_goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_typeinfo` DISABLE KEYS */;
INSERT INTO `df_goods_typeinfo` VALUES (1,'新鲜水果',0,'df_types/banner01.jpg'),(2,'海鲜水产',0,'df_types/banner02.jpg'),(3,'猪牛羊肉',0,'df_types/banner03.jpg'),(4,'禽类蛋品',0,'df_types/banner04.jpg'),(5,'新鲜蔬菜',0,'df_types/banner05.jpg'),(6,'速冻食品',0,'df_types/banner06.jpg');
/*!40000 ALTER TABLE `df_goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `uaddressee` varchar(20) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `upostcode` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'huangxu','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','123@163.com','','','',''),(2,'huangxu1','f638e2789006da9bb337fd5689e37a265a70f359','123@163.com','','','',''),(11,'huangxu2','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','123@163.com','','','','');
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-08 15:41:14.393944','1','TypeInfo object',1,'',8,1),(2,'2018-05-08 15:41:46.493374','2','TypeInfo object',1,'',8,1),(3,'2018-05-08 15:43:09.691344','3','猪牛羊肉',1,'',8,1),(4,'2018-05-08 15:43:21.460123','4','禽类蛋品',1,'',8,1),(5,'2018-05-08 15:43:30.907287','5','新鲜蔬菜',1,'',8,1),(6,'2018-05-08 15:43:39.681182','6','速冻食品',1,'',8,1),(7,'2018-05-09 08:58:52.993495','1','GoodsInfo object',1,'',9,1),(8,'2018-05-09 09:09:48.172659','2','葡萄',1,'',9,1),(9,'2018-05-09 09:20:08.169559','3','柠檬',1,'',9,1),(10,'2018-05-09 09:22:03.400523','4','奇异果',1,'',9,1),(11,'2018-05-09 09:28:05.778636','1','大兴大棚草莓',2,'已修改 gimage 和 gdetailed_introduction 。',9,1),(12,'2018-05-09 09:28:54.088448','2','葡萄',2,'已修改 gimage 和 gdetailed_introduction 。',9,1),(13,'2018-05-09 09:29:00.075806','3','柠檬',2,'已修改 gimage 和 gdetailed_introduction 。',9,1),(14,'2018-05-09 09:29:07.275696','4','奇异果',2,'已修改 gimage 和 gdetailed_introduction 。',9,1),(15,'2018-05-09 09:34:07.897746','5','青岛野生海捕大青虾',1,'',9,1),(16,'2018-05-09 09:34:58.020589','6','扇贝',1,'',9,1),(17,'2018-05-09 09:35:35.235542','7','冷冻秋刀鱼',1,'',9,1),(18,'2018-05-09 09:36:19.983012','8','基围虾',1,'',9,1),(19,'2018-05-09 09:39:13.777766','9','维多利亚葡萄',1,'',9,1),(20,'2018-05-09 09:39:28.850972','10','维多利亚葡萄',1,'',9,1),(21,'2018-05-09 09:39:54.291745','11','维多利亚葡萄',1,'',9,1),(22,'2018-05-09 09:40:05.724442','12','维多利亚葡萄',1,'',9,1),(23,'2018-05-09 09:40:53.199144','13','土鸡蛋',1,'',9,1),(24,'2018-05-09 09:41:06.109015','14','土鸡蛋',1,'',9,1),(25,'2018-05-09 09:41:17.346744','15','土鸡蛋',1,'',9,1),(26,'2018-05-09 09:41:28.112077','16','土鸡蛋',1,'',9,1),(27,'2018-05-09 09:42:16.584216','17','四季豆',1,'',9,1),(28,'2018-05-09 09:42:36.896716','18','四季豆',1,'',9,1),(29,'2018-05-09 09:42:49.306145','19','四季豆',1,'',9,1),(30,'2018-05-09 09:43:02.239587','20','四季豆',1,'',9,1),(31,'2018-05-09 09:43:40.254184','21','湾仔码头水饺',1,'',9,1),(32,'2018-05-09 09:43:50.404826','22','湾仔码头水饺',1,'',9,1),(33,'2018-05-09 09:44:05.630155','23','湾仔码头水饺',1,'',9,1),(34,'2018-05-09 09:44:15.298904','24','湾仔码头水饺',1,'',9,1),(35,'2018-05-09 14:15:07.470623','1','新鲜水果',2,'已修改 timage 。',8,1),(36,'2018-05-09 14:15:14.085461','2','海鲜水产',2,'已修改 timage 。',8,1),(37,'2018-05-09 14:15:19.296134','3','猪牛羊肉',2,'已修改 timage 。',8,1),(38,'2018-05-09 14:15:25.095736','4','禽类蛋品',2,'已修改 timage 。',8,1),(39,'2018-05-09 14:15:30.228925','5','新鲜蔬菜',2,'已修改 timage 。',8,1),(40,'2018-05-09 14:15:35.292382','6','速冻食品',2,'已修改 timage 。',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'df_goods','goodsinfo'),(8,'df_goods','typeinfo'),(7,'df_user','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-06 10:30:11.802641'),(2,'auth','0001_initial','2018-05-06 10:30:11.973725'),(3,'admin','0001_initial','2018-05-06 10:30:12.022943'),(4,'contenttypes','0002_remove_content_type_name','2018-05-06 10:30:12.172719'),(5,'auth','0002_alter_permission_name_max_length','2018-05-06 10:30:12.199091'),(6,'auth','0003_alter_user_email_max_length','2018-05-06 10:30:12.253732'),(7,'auth','0004_alter_user_username_opts','2018-05-06 10:30:12.264619'),(8,'auth','0005_alter_user_last_login_null','2018-05-06 10:30:12.286669'),(9,'auth','0006_require_contenttypes_0002','2018-05-06 10:30:12.288965'),(10,'df_user','0001_initial','2018-05-06 10:30:12.301748'),(11,'sessions','0001_initial','2018-05-06 10:30:12.319865'),(12,'df_goods','0001_initial','2018-05-08 15:31:53.094240'),(13,'df_user','0002_auto_20180508_1531','2018-05-08 15:31:53.131036'),(14,'df_goods','0002_auto_20180509_2213','2018-05-09 14:13:45.119902');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('x2wg81dr7v6zjsxn7gj8akt8tqxdb32q','NTkwMzkxMGUyNGRlODk5Y2RmMmM5OTU5YTdkNGFkMDRkNzY0NGU5ODp7InVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjViYjJiN2M4OTQwYmNhMGE3NDQ3YTZmZWYyMzQ4MWU3Y2NjMGJjNmQiLCJ1c2VyX25hbWUiOiJodWFuZ3h1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2018-05-22 15:39:37.122604'),('y7ge3giaw5jax7n0ew8jmhts21pn0j7x','NWU2MjY0NjdiNDQ0YjZiOWE4MjdkMzAxMTk0MjVlZmMxNjJhMzVlNzp7InVzZXJfbmFtZSI6Imh1YW5neHUiLCJfYXV0aF91c2VyX2hhc2giOiI1YmIyYjdjODk0MGJjYTBhNzQ0N2E2ZmVmMjM0ODFlN2NjYzBiYzZkIiwidXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2018-05-23 08:50:51.473414');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-10  0:11:14

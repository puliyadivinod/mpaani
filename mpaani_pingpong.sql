-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mpaani
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Players');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45);
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add api access',7,'add_apiaccess'),(20,'Can change api access',7,'change_apiaccess'),(21,'Can delete api access',7,'delete_apiaccess'),(22,'Can add api key',8,'add_apikey'),(23,'Can change api key',8,'change_apikey'),(24,'Can delete api key',8,'delete_apikey'),(25,'Can add ChampionShip',9,'add_pingpongchampionship'),(26,'Can change ChampionShip',9,'change_pingpongchampionship'),(27,'Can delete ChampionShip',9,'delete_pingpongchampionship'),(28,'Can add Player',10,'add_pingpongplayer'),(29,'Can change Player',10,'change_pingpongplayer'),(30,'Can delete Player',10,'delete_pingpongplayer'),(31,'Can add Participant',11,'add_pingpongchampionshipplayer'),(32,'Can change Participant',11,'change_pingpongchampionshipplayer'),(33,'Can delete Participant',11,'delete_pingpongchampionshipplayer'),(34,'Can add Referee',12,'add_pingpongreferee'),(35,'Can change Referee',12,'change_pingpongreferee'),(36,'Can delete Referee',12,'delete_pingpongreferee'),(37,'Can add Game Draw',13,'add_pingpongrefereegamedraw'),(38,'Can change Game Draw',13,'change_pingpongrefereegamedraw'),(39,'Can delete Game Draw',13,'delete_pingpongrefereegamedraw'),(40,'Can add Transaction',14,'add_pingpongrefereegametransaction'),(41,'Can change Transaction',14,'change_pingpongrefereegametransaction'),(42,'Can delete Transaction',14,'delete_pingpongrefereegametransaction'),(43,'Can add Score',15,'add_pingpongrefereescore'),(44,'Can change Score',15,'change_pingpongrefereescore'),(45,'Can delete Score',15,'delete_pingpongrefereescore');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$0q5LvqgnhUWu$bA24pOxwDC1yUCYV1BY+dKiUCvlFHUgEAcEQpRoaXms=','2015-12-13 20:55:25',1,'admin','','','puliyadivinod@gmail.com',1,1,'2015-12-13 12:50:45'),(2,'pbkdf2_sha256$24000$P93J3eNr3xxh$Y3ND98tYrE7U1b404C5Wo/07elC54JeXa9iacJ/rgAQ=',NULL,0,'joey','Joey','','',1,1,'2015-12-13 16:35:16'),(3,'pbkdf2_sha256$24000$LdOrQsKpMC6b$+tFibzXEBvc4Tocp6hlCA3ZsX0AHMRrs8N3sETRKaRo=',NULL,0,'nick','Nick','','',1,1,'2015-12-13 16:35:49'),(4,'pbkdf2_sha256$24000$ICJrSoOwviZj$Ncxwkva5BJLdm4+McI1Ug9PxsoAk8LsMwqJKI7xf1nA=',NULL,0,'russel','Russel','','',1,1,'2015-12-13 16:36:39'),(5,'pbkdf2_sha256$24000$LwSibPoj343a$0iHLXO7ehoFncZMZ8rRf5JnsZa9rJ7H+Z6FhaqAQWVE=',NULL,0,'vivek','Vivek','','',1,1,'2015-12-13 16:37:01'),(6,'pbkdf2_sha256$24000$lkTXi0A7UnGN$nJvQWNFkcLf/UQVjhsGIVo7B3UPYnj/y8OZl2tJ/l3I=',NULL,0,'pritam','Pritam','','',1,1,'2015-12-13 16:37:20'),(7,'pbkdf2_sha256$24000$HENmUEJQxEcg$JpMeqw4RkipYrhX3dK7HOV5g0lhzvb+Itqm/9b1DK2w=',NULL,0,'amit','Amit','','',1,1,'2015-12-13 16:37:40'),(8,'pbkdf2_sha256$24000$3QHbsERPM7ml$0KXX7aUytkgzpKs+jiKkIcpMKICm1dYuFk41NNxEjXw=',NULL,0,'chandler','Chandler','','',1,1,'2015-12-13 16:38:00'),(9,'pbkdf2_sha256$24000$k0Z3sIlCGYrz$Lk/YJtsekkvVEc5Zw3HpOWYhhezPLFetOIWP0T1/XEI=',NULL,0,'colwin','Colwin','','',1,1,'2015-12-13 16:38:19');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,1),(7,8,1),(8,9,1);
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-12-13 16:34:05','1','Players',1,'Added.',3,1),(2,'2015-12-13 16:35:17','2','joey',1,'Added.',4,1),(3,'2015-12-13 16:35:33','2','joey',2,'Changed is_staff.',4,1),(4,'2015-12-13 16:35:49','3','nick',1,'Added.',4,1),(5,'2015-12-13 16:36:00','3','nick',2,'Changed is_staff.',4,1),(6,'2015-12-13 16:36:14','2','joey',2,'Changed groups.',4,1),(7,'2015-12-13 16:36:22','3','nick',2,'Changed groups.',4,1),(8,'2015-12-13 16:36:39','4','russel',1,'Added.',4,1),(9,'2015-12-13 16:36:47','4','russel',2,'Changed is_staff and groups.',4,1),(10,'2015-12-13 16:37:01','5','vivek',1,'Added.',4,1),(11,'2015-12-13 16:37:08','5','vivek',2,'Changed is_staff and groups.',4,1),(12,'2015-12-13 16:37:20','6','pritam',1,'Added.',4,1),(13,'2015-12-13 16:37:26','6','pritam',2,'Changed is_staff and groups.',4,1),(14,'2015-12-13 16:37:40','7','amit',1,'Added.',4,1),(15,'2015-12-13 16:37:47','7','amit',2,'Changed is_staff and groups.',4,1),(16,'2015-12-13 16:38:00','8','chandler',1,'Added.',4,1),(17,'2015-12-13 16:38:06','8','chandler',2,'Changed is_staff and groups.',4,1),(18,'2015-12-13 16:38:19','9','colwin',1,'Added.',4,1),(19,'2015-12-13 16:38:26','9','colwin',2,'Changed is_staff and groups.',4,1),(20,'2015-12-13 16:38:37','7','amit',2,'Changed first_name.',4,1),(21,'2015-12-13 16:38:43','8','chandler',2,'Changed first_name.',4,1),(22,'2015-12-13 16:38:48','9','colwin',2,'Changed first_name.',4,1),(23,'2015-12-13 16:38:55','2','joey',2,'Changed first_name.',4,1),(24,'2015-12-13 16:39:00','3','nick',2,'Changed first_name.',4,1),(25,'2015-12-13 16:39:06','6','pritam',2,'Changed first_name.',4,1),(26,'2015-12-13 16:39:12','4','russel',2,'Changed first_name.',4,1),(27,'2015-12-13 16:39:19','5','vivek',2,'Changed first_name.',4,1),(28,'2015-12-13 16:39:42','1','PingpongPlayer object',1,'Added.',10,1),(29,'2015-12-13 16:39:57','2','PingpongPlayer object',1,'Added.',10,1),(30,'2015-12-13 16:40:10','3','PingpongPlayer object',1,'Added.',10,1),(31,'2015-12-13 16:40:24','4','PingpongPlayer object',1,'Added.',10,1),(32,'2015-12-13 16:40:36','5','PingpongPlayer object',1,'Added.',10,1),(33,'2015-12-13 16:40:51','6','PingpongPlayer object',1,'Added.',10,1),(34,'2015-12-13 16:41:02','7','PingpongPlayer object',1,'Added.',10,1),(35,'2015-12-13 16:41:13','8','PingpongPlayer object',1,'Added.',10,1),(36,'2015-12-13 16:55:06','1','PingpongChampionship object',1,'Added.',9,1),(37,'2015-12-13 16:56:42','1','PingpongReferee object',1,'Added.',12,1),(38,'2015-12-13 20:55:37','30','Winter 1450040050.98',3,'',9,1),(39,'2015-12-13 20:55:37','29','Winter 1450038602.34',3,'',9,1),(40,'2015-12-13 20:55:37','28','Winter 1450038592.69',3,'',9,1),(41,'2015-12-13 20:55:37','27','Winter 1450038571.27',3,'',9,1),(42,'2015-12-13 20:55:37','26','Winter 1450038547.5',3,'',9,1),(43,'2015-12-13 20:55:37','25','Winter 1450038460.19',3,'',9,1),(44,'2015-12-13 20:55:37','24','Winter 1450038145.76',3,'',9,1),(45,'2015-12-13 20:55:37','23','Winter 1450038142.11',3,'',9,1),(46,'2015-12-13 20:55:37','22','Winter 1450038074.58',3,'',9,1),(47,'2015-12-13 20:55:38','21','Winter 1450037461.08',3,'',9,1),(48,'2015-12-13 20:55:38','20','Winter 1450037452.13',3,'',9,1),(49,'2015-12-13 20:55:38','19','Winter 1450037441.4',3,'',9,1),(50,'2015-12-13 20:55:38','18','Winter 1450037414.63',3,'',9,1),(51,'2015-12-13 20:55:38','17','Winter 1450037400.1',3,'',9,1),(52,'2015-12-13 20:55:38','16','Winter 1450037317.13',3,'',9,1),(53,'2015-12-13 20:55:38','15','Winter 1450037237.34',3,'',9,1),(54,'2015-12-13 20:55:38','14','Winter 1450037214.87',3,'',9,1),(55,'2015-12-13 20:55:38','13','Winter 1450037204.32',3,'',9,1),(56,'2015-12-13 20:55:38','12','Winter 1450037154.5',3,'',9,1),(57,'2015-12-13 20:55:38','11','Winter 1450037123.79',3,'',9,1),(58,'2015-12-13 20:55:38','10','Winter 1450037121.79',3,'',9,1),(59,'2015-12-13 20:55:38','9','Winter 1450037088.24',3,'',9,1),(60,'2015-12-13 20:55:38','8','Winter 1450037081.13',3,'',9,1),(61,'2015-12-13 20:55:38','7','Winter 1450037060.89',3,'',9,1),(62,'2015-12-13 20:55:38','6','Winter 1450036941.97',3,'',9,1),(63,'2015-12-13 20:55:38','5','Winter 1450036907.59',3,'',9,1),(64,'2015-12-13 20:55:38','4','Winter 1450036817.78',3,'',9,1),(65,'2015-12-13 20:55:38','3','Winter 1450036814.32',3,'',9,1),(66,'2015-12-13 20:55:38','2','hello world',3,'',9,1),(67,'2015-12-13 20:55:39','1','Winter Yahoo',3,'',9,1),(68,'2015-12-13 21:06:29','32','Winter 1450040754.0',3,'',9,1),(69,'2015-12-13 21:06:29','31','Winter 1450040143.75',3,'',9,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'pingpong','pingpongchampionship'),(11,'pingpong','pingpongchampionshipplayer'),(10,'pingpong','pingpongplayer'),(12,'pingpong','pingpongreferee'),(13,'pingpong','pingpongrefereegamedraw'),(14,'pingpong','pingpongrefereegametransaction'),(15,'pingpong','pingpongrefereescore'),(6,'sessions','session'),(7,'tastypie','apiaccess'),(8,'tastypie','apikey');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-12-13 12:49:17'),(2,'auth','0001_initial','2015-12-13 12:49:21'),(3,'admin','0001_initial','2015-12-13 12:49:22'),(4,'admin','0002_logentry_remove_auto_add','2015-12-13 12:49:22'),(5,'contenttypes','0002_remove_content_type_name','2015-12-13 12:49:23'),(6,'auth','0002_alter_permission_name_max_length','2015-12-13 12:49:23'),(7,'auth','0003_alter_user_email_max_length','2015-12-13 12:49:23'),(8,'auth','0004_alter_user_username_opts','2015-12-13 12:49:23'),(9,'auth','0005_alter_user_last_login_null','2015-12-13 12:49:24'),(10,'auth','0006_require_contenttypes_0002','2015-12-13 12:49:24'),(11,'auth','0007_alter_validators_add_error_messages','2015-12-13 12:49:24'),(12,'sessions','0001_initial','2015-12-13 12:49:24'),(13,'tastypie','0001_initial','2015-12-13 12:49:25'),(14,'pingpong','0001_initial','2015-12-13 16:33:16');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2b0l068uxtjrybdotavbhz47omrdkvcn','NTkxODMzMmExYmY0YWI3NGVhNjFhNDM4ZGZiODE5Y2ZhYjIxNmMyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBhNTE5ZmYwNDZiOTliNTE4OTE2Njg0MzgzYjBmMmE3YTRmYWVkYjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-27 20:55:25');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_championship`
--

DROP TABLE IF EXISTS `pingpong_championship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_championship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_name` varchar(64) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_championship`
--

LOCK TABLES `pingpong_championship` WRITE;
/*!40000 ALTER TABLE `pingpong_championship` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_championship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_championship_player`
--

DROP TABLE IF EXISTS `pingpong_championship_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_championship_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championship_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championship_id` (`championship_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `pingpong_championship_player_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `pingpong_player` (`id`),
  CONSTRAINT `pingpong_championship_player_ibfk_1` FOREIGN KEY (`championship_id`) REFERENCES `pingpong_championship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_championship_player`
--

LOCK TABLES `pingpong_championship_player` WRITE;
/*!40000 ALTER TABLE `pingpong_championship_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_championship_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_player`
--

DROP TABLE IF EXISTS `pingpong_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nick_name` varchar(32) NOT NULL,
  `defence_length` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pingpong_player_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_player`
--

LOCK TABLES `pingpong_player` WRITE;
/*!40000 ALTER TABLE `pingpong_player` DISABLE KEYS */;
INSERT INTO `pingpong_player` VALUES (1,2,'Joey',8,'2015-12-13 16:39:42','2015-12-13 16:39:42'),(2,3,'Nick',8,'2015-12-13 16:39:57','2015-12-13 16:39:57'),(3,4,'Russel',7,'2015-12-13 16:40:10','2015-12-13 16:40:10'),(4,5,'Vivek',7,'2015-12-13 16:40:24','2015-12-13 16:40:24'),(5,6,'Pritam',6,'2015-12-13 16:40:36','2015-12-13 16:40:36'),(6,7,'Amit',6,'2015-12-13 16:40:51','2015-12-13 16:40:51'),(7,8,'Chandler',5,'2015-12-13 16:41:02','2015-12-13 16:41:02'),(8,9,'Colwin',5,'2015-12-13 16:41:13','2015-12-13 16:41:13');
/*!40000 ALTER TABLE `pingpong_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_referee`
--

DROP TABLE IF EXISTS `pingpong_referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_referee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championship_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championship_id` (`championship_id`),
  CONSTRAINT `pingpong_referee_ibfk_1` FOREIGN KEY (`championship_id`) REFERENCES `pingpong_championship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_referee`
--

LOCK TABLES `pingpong_referee` WRITE;
/*!40000 ALTER TABLE `pingpong_referee` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_referee_game_draw`
--

DROP TABLE IF EXISTS `pingpong_referee_game_draw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_referee_game_draw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championship_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `opponent_id` int(11) NOT NULL,
  `order_of_play` tinyint(4) NOT NULL,
  `round` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championship_id` (`championship_id`),
  KEY `player_id` (`player_id`),
  KEY `opponent_id` (`opponent_id`),
  CONSTRAINT `pingpong_referee_game_draw_ibfk_1` FOREIGN KEY (`championship_id`) REFERENCES `pingpong_championship` (`id`),
  CONSTRAINT `pingpong_referee_game_draw_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `pingpong_player` (`id`),
  CONSTRAINT `pingpong_referee_game_draw_ibfk_3` FOREIGN KEY (`opponent_id`) REFERENCES `pingpong_player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_referee_game_draw`
--

LOCK TABLES `pingpong_referee_game_draw` WRITE;
/*!40000 ALTER TABLE `pingpong_referee_game_draw` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_referee_game_draw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_referee_game_transaction`
--

DROP TABLE IF EXISTS `pingpong_referee_game_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_referee_game_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championship_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `offending_player_id` int(11) NOT NULL,
  `defending_player_id` int(11) NOT NULL,
  `guess_number` int(11) NOT NULL,
  `suggested_numbers` varchar(32) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championship_id` (`championship_id`),
  KEY `game_id` (`game_id`),
  KEY `offensive_player_id` (`offending_player_id`),
  KEY `defensive_player_id` (`defending_player_id`),
  CONSTRAINT `pingpong_referee_game_transaction_ibfk_4` FOREIGN KEY (`defending_player_id`) REFERENCES `pingpong_player` (`id`),
  CONSTRAINT `pingpong_referee_game_transaction_ibfk_1` FOREIGN KEY (`championship_id`) REFERENCES `pingpong_championship` (`id`),
  CONSTRAINT `pingpong_referee_game_transaction_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `pingpong_referee_game_draw` (`id`),
  CONSTRAINT `pingpong_referee_game_transaction_ibfk_3` FOREIGN KEY (`offending_player_id`) REFERENCES `pingpong_player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_referee_game_transaction`
--

LOCK TABLES `pingpong_referee_game_transaction` WRITE;
/*!40000 ALTER TABLE `pingpong_referee_game_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_referee_game_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingpong_referee_score`
--

DROP TABLE IF EXISTS `pingpong_referee_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingpong_referee_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championship_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championship_id` (`championship_id`),
  KEY `game_id` (`game_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `pingpong_referee_score_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `pingpong_player` (`id`),
  CONSTRAINT `pingpong_referee_score_ibfk_1` FOREIGN KEY (`championship_id`) REFERENCES `pingpong_championship` (`id`),
  CONSTRAINT `pingpong_referee_score_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `pingpong_referee_game_draw` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingpong_referee_score`
--

LOCK TABLES `pingpong_referee_score` WRITE;
/*!40000 ALTER TABLE `pingpong_referee_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingpong_referee_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_3c6e0b8a` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_8c8fa920_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
INSERT INTO `tastypie_apikey` VALUES (1,'9c4e6922abf1fb532e252af35bc172fa31e70641','2015-12-13 17:21:28',1),(2,'12d83f81b57a1fc3791c6655f6df898dbbcde927','2015-12-13 17:21:28',2),(3,'bb6b6788454073050605d842fa2cd5abca775276','2015-12-13 17:21:28',3),(4,'2fbec1494009a74a843ae1d42b968f0c5c5db17f','2015-12-13 17:21:28',4),(5,'497d4a55d560aab15e3791077afd27c1c1155895','2015-12-13 17:21:28',5),(6,'acee4a18b4724109df3df53fdc53d86ebe8e9e49','2015-12-13 17:21:28',6),(7,'ee1077bf0a11a6bcb80a0e8be784fc328da22ba8','2015-12-13 17:21:28',7),(8,'945ca5a6e9259c21522e99c37106eceec1b6ee24','2015-12-13 17:21:28',8),(9,'e485dec803fc9c12024ae5a39eb047e13561f912','2015-12-13 17:21:28',9);
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-14  2:43:21

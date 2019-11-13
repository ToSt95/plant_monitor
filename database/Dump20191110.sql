-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: tp_database
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `air_measurement`
--

DROP TABLE IF EXISTS `air_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `air_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `humidity` double DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air_measurement`
--

LOCK TABLES `air_measurement` WRITE;
/*!40000 ALTER TABLE `air_measurement` DISABLE KEYS */;
INSERT INTO `air_measurement` VALUES (1,30,33,'2019-02-03 12:00:00'),(2,67,51,'2019-02-03 12:00:00'),(3,14,34,'2019-02-03 12:00:00'),(4,87,24,'2019-02-03 12:00:00'),(5,48,26,'2019-02-03 12:00:00'),(6,30,30,'2019-02-03 12:00:00'),(7,24,22,'2019-10-28 21:28:35'),(8,20,21,'2019-10-28 21:30:32'),(9,20,21,'2019-10-28 21:31:35'),(10,25,22,'2019-10-28 21:31:50'),(11,20,21,'2019-10-28 21:32:05'),(12,20,21,'2019-10-28 21:32:21'),(13,21,20,'2019-10-28 21:32:35'),(14,21,20,'2019-10-28 21:32:50'),(15,21,20,'2019-10-28 21:33:06'),(16,20,21,'2019-10-28 21:39:30'),(17,20,21,'2019-10-28 21:44:30'),(18,19,23,'2019-10-28 21:49:30'),(19,20,22,'2019-10-28 21:54:31'),(20,20,22,'2019-10-28 21:59:30'),(21,20,22,'2019-10-28 22:04:30'),(22,19,23,'2019-10-28 22:09:30'),(23,19,23,'2019-10-28 22:14:30'),(24,19,23,'2019-10-28 22:19:31'),(25,20,22,'2019-10-29 18:53:11'),(26,20,22,'2019-10-29 18:58:11'),(27,20,22,'2019-10-29 19:03:11'),(28,20,22,'2019-10-29 19:08:10'),(29,20,22,'2019-10-29 19:13:11'),(30,20,22,'2019-10-29 19:18:11'),(31,20,22,'2019-10-29 19:23:11'),(32,20,22,'2019-10-29 19:28:10'),(33,21,23,'2019-10-29 20:01:56'),(34,20,21,'2019-10-29 20:02:27'),(35,21,23,'2019-10-29 20:03:26'),(36,21,23,'2019-10-29 20:03:56'),(37,21,23,'2019-10-29 20:04:27'),(38,21,23,'2019-10-29 20:04:57'),(39,21,23,'2019-10-29 20:05:57'),(40,21,23,'2019-10-29 20:06:26'),(41,21,23,'2019-10-29 20:06:56'),(42,21,23,'2019-10-29 20:07:26'),(43,20,21,'2019-10-29 20:07:57'),(44,21,23,'2019-10-29 20:08:27'),(45,21,23,'2019-10-29 20:08:57'),(46,21,23,'2019-10-29 20:09:27'),(47,21,23,'2019-10-29 20:09:57'),(48,21,23,'2019-10-29 20:10:27'),(49,21,23,'2019-10-29 20:10:56'),(50,21,23,'2019-10-29 20:11:26'),(51,21,23,'2019-10-29 20:11:56'),(52,21,23,'2019-10-29 20:12:27'),(53,21,23,'2019-10-29 20:12:57'),(54,21,23,'2019-10-29 20:13:27'),(55,21,23,'2019-10-29 20:13:57'),(56,21,23,'2019-10-29 20:14:27'),(57,21,23,'2019-10-29 20:14:57'),(58,21,23,'2019-10-29 20:15:26'),(59,21,23,'2019-10-29 20:15:56'),(60,21,23,'2019-10-29 20:16:26'),(61,21,23,'2019-10-29 20:16:57'),(62,20,21,'2019-10-29 20:17:27'),(63,21,23,'2019-10-29 20:17:57'),(64,20,21,'2019-10-29 20:18:27'),(65,21,23,'2019-10-29 20:18:57'),(66,21,23,'2019-10-29 20:19:26'),(67,21,23,'2019-10-29 20:19:56'),(68,21,23,'2019-10-29 20:20:26'),(69,21,26,'2019-10-29 20:20:56'),(70,21,23,'2019-10-29 20:21:27'),(71,21,23,'2019-10-29 20:21:57'),(72,21,23,'2019-10-29 20:22:27'),(73,21,23,'2019-10-29 20:22:57'),(74,21,23,'2019-10-29 20:23:27'),(75,21,23,'2019-10-29 20:23:56'),(76,20,21,'2019-10-29 20:24:26'),(77,21,23,'2019-10-29 20:24:56'),(78,20,21,'2019-10-29 20:25:27'),(79,21,23,'2019-10-29 20:25:57'),(80,20,21,'2019-10-29 20:26:27'),(81,21,23,'2019-10-29 20:26:57'),(82,20,21,'2019-10-29 20:27:27'),(83,21,25,'2019-10-29 20:27:56'),(84,20,21,'2019-10-29 20:28:26'),(85,21,23,'2019-10-29 20:28:56'),(86,20,21,'2019-10-29 20:29:26'),(87,21,23,'2019-10-29 20:29:57'),(88,21,23,'2019-10-29 20:30:27'),(89,21,23,'2019-10-29 20:30:57'),(90,20,21,'2019-10-29 20:31:27'),(91,21,23,'2019-10-29 20:31:57'),(92,20,21,'2019-10-29 20:32:26'),(93,21,23,'2019-10-29 20:32:56'),(94,21,23,'2019-10-29 20:33:26'),(95,21,23,'2019-10-29 20:33:56'),(96,20,21,'2019-10-29 20:34:27'),(97,21,23,'2019-10-29 20:34:57'),(98,21,23,'2019-10-29 20:35:27'),(99,20,21,'2019-10-29 20:35:57'),(100,21,23,'2019-10-29 20:36:27'),(101,21,23,'2019-10-29 20:36:56'),(102,21,23,'2019-10-29 20:37:26'),(103,20,21,'2019-10-29 20:37:56'),(104,21,23,'2019-10-29 20:38:27'),(105,21,23,'2019-10-29 20:38:57'),(106,21,23,'2019-10-29 20:39:27'),(107,20,21,'2019-10-29 20:39:57'),(108,20,21,'2019-10-29 20:40:27'),(109,20,21,'2019-10-29 20:40:56'),(110,21,24,'2019-10-29 20:41:26'),(111,21,24,'2019-10-29 20:41:56'),(112,20,21,'2019-10-29 20:42:56'),(113,21,23,'2019-10-29 20:43:27'),(114,21,23,'2019-10-29 20:43:57'),(115,21,24,'2019-10-29 20:44:27'),(116,21,23,'2019-10-29 20:44:57'),(117,21,23,'2019-10-29 20:45:27'),(118,21,23,'2019-10-29 20:45:57'),(119,21,24,'2019-10-29 20:46:26'),(120,21,24,'2019-10-29 20:46:56'),(121,21,23,'2019-10-29 20:47:26'),(122,20,21,'2019-10-29 20:47:57'),(123,21,23,'2019-10-29 20:48:27'),(124,20,21,'2019-10-29 20:48:56'),(125,21,23,'2019-10-29 20:50:26'),(126,21,23,'2019-10-29 20:50:56'),(127,20,21,'2019-10-29 20:51:26'),(128,20,21,'2019-10-29 20:51:57'),(129,21,23,'2019-10-29 20:53:27'),(130,20,21,'2019-10-29 20:53:57'),(131,20,21,'2019-10-29 20:54:27'),(132,21,23,'2019-10-29 20:54:56'),(133,20,21,'2019-10-29 20:55:26'),(134,21,24,'2019-10-29 20:55:56'),(135,21,24,'2019-10-29 20:56:27'),(136,20,21,'2019-10-29 20:56:57'),(137,20,21,'2019-10-29 20:57:27'),(138,21,24,'2019-10-29 20:57:57'),(139,20,21,'2019-10-29 20:58:27'),(140,21,24,'2019-10-29 20:58:57'),(141,21,23,'2019-10-29 20:59:26'),(142,21,24,'2019-10-29 20:59:56'),(143,21,23,'2019-10-29 21:00:26'),(144,21,24,'2019-10-29 21:00:57'),(145,20,21,'2019-10-29 21:01:27'),(146,21,23,'2019-10-29 21:01:57'),(147,21,24,'2019-10-29 21:02:27'),(148,21,24,'2019-10-29 21:02:57'),(149,21,24,'2019-10-29 21:03:26'),(150,21,24,'2019-10-29 21:03:56'),(151,21,24,'2019-10-29 21:04:26'),(152,21,21,'2019-10-29 21:04:57'),(153,21,23,'2019-10-29 21:05:27'),(154,21,22,'2019-10-29 21:05:57'),(155,21,23,'2019-10-29 21:06:27'),(156,21,23,'2019-10-29 21:06:57'),(157,21,23,'2019-10-29 21:07:26'),(158,21,23,'2019-10-29 21:07:56'),(159,21,23,'2019-10-29 21:08:26'),(160,22,22,'2019-10-29 21:08:57'),(161,21,23,'2019-10-29 21:09:27'),(162,22,23,'2019-10-29 21:09:57'),(163,21,23,'2019-10-29 21:10:27'),(164,21,23,'2019-10-29 21:10:57'),(165,21,23,'2019-10-29 21:11:27'),(166,21,23,'2019-10-29 21:11:56'),(167,21,23,'2019-10-29 21:12:26'),(168,21,23,'2019-10-29 21:12:56'),(169,21,23,'2019-10-29 21:13:27'),(170,21,21,'2019-10-29 21:13:57'),(171,21,21,'2019-10-29 21:14:27'),(172,21,20,'2019-10-29 21:14:57'),(173,21,21,'2019-10-29 21:15:27'),(174,21,21,'2019-10-29 21:15:57'),(175,21,21,'2019-10-29 21:16:26'),(176,21,21,'2019-10-29 21:16:56'),(177,21,21,'2019-10-29 21:17:27'),(178,21,21,'2019-10-29 21:17:57'),(179,21,21,'2019-10-29 21:18:27'),(180,21,21,'2019-10-29 21:18:57'),(181,21,21,'2019-10-29 21:19:27'),(182,21,21,'2019-10-29 21:19:56'),(183,21,22,'2019-10-29 21:20:26'),(184,60,2,'2019-11-04 19:02:10'),(185,54,4,'2019-11-04 19:02:51'),(186,46,8,'2019-11-04 19:03:20'),(187,41,10,'2019-11-04 19:03:50'),(188,37,45,'2019-11-04 19:04:20'),(189,33,14,'2019-11-04 19:04:51'),(190,30,16,'2019-11-04 19:05:21'),(191,29,16,'2019-11-04 19:05:51'),(192,28,17,'2019-11-04 19:06:21'),(193,27,17,'2019-11-04 19:06:51'),(194,26,18,'2019-11-04 19:07:21'),(195,25,18,'2019-11-04 19:07:50'),(196,25,18,'2019-11-04 19:08:20'),(197,24,19,'2019-11-04 19:08:50'),(198,24,19,'2019-11-04 19:09:21'),(199,24,19,'2019-11-04 19:09:51'),(200,24,19,'2019-11-04 19:10:21'),(201,23,19,'2019-11-04 19:10:51'),(202,23,19,'2019-11-04 19:11:21'),(203,23,19,'2019-11-04 19:11:51'),(204,23,19,'2019-11-04 19:12:20'),(205,23,19,'2019-11-04 19:12:50'),(206,23,19,'2019-11-04 19:13:21'),(207,22,20,'2019-11-04 19:13:51'),(208,22,20,'2019-11-04 19:14:21'),(209,22,20,'2019-11-04 19:14:51'),(210,22,20,'2019-11-04 19:15:20'),(211,22,20,'2019-11-04 19:15:50'),(212,22,20,'2019-11-04 19:16:20'),(213,22,20,'2019-11-04 19:16:51'),(214,22,20,'2019-11-04 19:17:21'),(215,22,20,'2019-11-04 19:17:51'),(216,22,20,'2019-11-04 19:18:21'),(217,22,20,'2019-11-04 19:18:50'),(218,22,20,'2019-11-04 19:19:20'),(219,22,20,'2019-11-04 19:19:50'),(220,22,20,'2019-11-04 19:20:21'),(221,22,20,'2019-11-04 19:20:51'),(222,22,20,'2019-11-04 19:21:20'),(223,22,20,'2019-11-04 19:21:50'),(224,22,20,'2019-11-04 19:22:20'),(225,22,20,'2019-11-04 19:22:51'),(226,22,20,'2019-11-04 19:23:21'),(227,22,20,'2019-11-04 19:23:51'),(228,22,20,'2019-11-04 19:24:20'),(229,22,20,'2019-11-04 19:24:51'),(230,22,20,'2019-11-04 19:25:21'),(231,22,20,'2019-11-04 19:25:51'),(232,22,20,'2019-11-04 19:26:21'),(233,22,20,'2019-11-04 19:26:50'),(234,22,20,'2019-11-04 19:27:20'),(235,22,20,'2019-11-04 19:27:51'),(236,22,20,'2019-11-04 19:28:21'),(237,22,20,'2019-11-04 19:28:51'),(238,22,20,'2019-11-04 19:29:21'),(239,22,20,'2019-11-04 19:29:51'),(240,22,20,'2019-11-04 19:30:21'),(241,22,20,'2019-11-04 19:30:51'),(242,22,20,'2019-11-04 19:31:21'),(243,22,20,'2019-11-04 19:31:51'),(244,22,20,'2019-11-04 19:32:21'),(245,22,20,'2019-11-04 19:32:51'),(246,22,20,'2019-11-04 19:33:21'),(247,22,20,'2019-11-04 19:33:51'),(248,22,20,'2019-11-04 19:34:20'),(249,22,20,'2019-11-04 19:34:50'),(250,22,20,'2019-11-04 19:35:20'),(251,22,20,'2019-11-04 19:35:51'),(252,22,20,'2019-11-04 19:36:21'),(253,22,20,'2019-11-04 19:36:51'),(254,22,20,'2019-11-04 19:37:21'),(255,22,20,'2019-11-04 19:37:51'),(256,22,20,'2019-11-04 19:38:21'),(257,22,20,'2019-11-04 19:38:50'),(258,22,20,'2019-11-04 19:39:20'),(259,22,20,'2019-11-04 19:39:50'),(260,22,20,'2019-11-04 19:40:21'),(261,22,20,'2019-11-04 19:40:51'),(262,22,20,'2019-11-04 19:41:21'),(263,22,20,'2019-11-04 19:41:51'),(264,22,20,'2019-11-04 19:42:21'),(265,22,20,'2019-11-04 19:42:51'),(266,22,20,'2019-11-04 19:43:20'),(267,22,20,'2019-11-04 19:43:50'),(268,22,20,'2019-11-04 19:44:20'),(269,22,20,'2019-11-04 19:44:51'),(270,22,20,'2019-11-04 19:45:21'),(271,22,20,'2019-11-04 19:45:51'),(272,22,20,'2019-11-04 19:46:21'),(273,22,20,'2019-11-04 19:46:51'),(274,22,20,'2019-11-04 19:47:21'),(275,22,20,'2019-11-04 19:47:50'),(276,22,20,'2019-11-04 19:48:20'),(277,22,20,'2019-11-04 19:48:51'),(278,22,20,'2019-11-04 19:49:21'),(279,22,20,'2019-11-04 19:49:51'),(280,22,20,'2019-11-04 19:50:21'),(281,22,20,'2019-11-04 19:50:51'),(282,22,20,'2019-11-04 19:51:21'),(283,22,20,'2019-11-04 19:51:51'),(284,22,20,'2019-11-04 19:52:20'),(285,22,20,'2019-11-04 19:52:50'),(286,22,20,'2019-11-04 19:53:20'),(287,22,20,'2019-11-04 19:53:51'),(288,22,20,'2019-11-04 19:54:21'),(289,22,20,'2019-11-04 19:54:51'),(290,22,20,'2019-11-04 19:55:21'),(291,22,20,'2019-11-04 19:55:51'),(292,22,20,'2019-11-04 19:56:21'),(293,22,20,'2019-11-04 19:56:50'),(294,22,20,'2019-11-04 19:57:20'),(295,22,20,'2019-11-04 19:57:51'),(296,22,20,'2019-11-04 19:58:21'),(297,22,20,'2019-11-04 19:58:51'),(298,22,20,'2019-11-04 19:59:21'),(299,22,20,'2019-11-04 19:59:51'),(300,22,20,'2019-11-04 20:00:21'),(301,22,20,'2019-11-04 20:00:51'),(302,22,20,'2019-11-04 20:01:20'),(303,22,20,'2019-11-04 20:01:50'),(304,22,20,'2019-11-04 20:02:21'),(305,22,20,'2019-11-04 20:02:51'),(306,22,20,'2019-11-04 20:03:21'),(307,22,20,'2019-11-04 20:03:51'),(308,22,20,'2019-11-04 20:04:21'),(309,22,20,'2019-11-04 20:04:51'),(310,22,20,'2019-11-04 20:05:21'),(311,22,20,'2019-11-04 20:05:50'),(312,22,20,'2019-11-04 20:06:20'),(313,22,20,'2019-11-04 20:06:51'),(314,22,20,'2019-11-04 20:07:21'),(315,22,20,'2019-11-04 20:07:51'),(316,22,20,'2019-11-04 20:08:21'),(317,22,20,'2019-11-04 20:08:51'),(318,22,20,'2019-11-04 20:09:21'),(319,22,20,'2019-11-04 20:09:50'),(320,22,20,'2019-11-04 20:10:20'),(321,22,20,'2019-11-04 20:10:50'),(322,22,20,'2019-11-04 20:11:21'),(323,22,20,'2019-11-04 20:11:51'),(324,22,20,'2019-11-04 20:12:21'),(325,22,20,'2019-11-04 20:12:51'),(326,22,20,'2019-11-04 20:13:21'),(327,22,20,'2019-11-04 20:13:51'),(328,22,20,'2019-11-04 20:14:20'),(329,22,20,'2019-11-04 20:14:50'),(330,22,20,'2019-11-04 20:15:20'),(331,22,20,'2019-11-04 20:15:51'),(332,22,20,'2019-11-04 20:16:21'),(333,22,20,'2019-11-04 20:16:51'),(334,22,20,'2019-11-04 20:17:21'),(335,22,20,'2019-11-04 20:17:51'),(336,22,20,'2019-11-04 20:18:21'),(337,22,20,'2019-11-04 20:18:51'),(338,22,20,'2019-11-04 20:19:20'),(339,22,20,'2019-11-04 20:19:50'),(340,22,20,'2019-11-04 20:20:21'),(341,22,20,'2019-11-04 20:20:51'),(342,22,20,'2019-11-04 20:21:21'),(343,22,20,'2019-11-04 20:21:51'),(344,21,20,'2019-11-04 20:22:21'),(345,21,20,'2019-11-04 20:22:51'),(346,21,20,'2019-11-04 20:23:21'),(347,22,20,'2019-11-04 20:23:50'),(348,21,20,'2019-11-04 20:24:20'),(349,21,20,'2019-11-04 20:24:50'),(350,21,20,'2019-11-04 20:25:21'),(351,21,20,'2019-11-04 20:25:51'),(352,21,20,'2019-11-04 20:26:21'),(353,21,20,'2019-11-04 20:26:51'),(354,21,20,'2019-11-04 20:27:21'),(355,22,20,'2019-11-04 20:27:51'),(356,22,20,'2019-11-04 20:28:20'),(357,22,20,'2019-11-04 20:28:50'),(358,22,20,'2019-11-04 20:29:20'),(359,22,20,'2019-11-04 20:29:51'),(360,21,20,'2019-11-04 20:49:21'),(361,21,20,'2019-11-04 21:02:51'),(362,21,20,'2019-11-04 21:03:50'),(363,21,20,'2019-11-04 21:04:21'),(364,21,20,'2019-11-04 21:04:51'),(365,22,20,'2019-11-04 21:05:51'),(366,22,20,'2019-11-04 21:06:21'),(367,22,20,'2019-11-04 21:06:51'),(368,22,20,'2019-11-04 21:07:21'),(369,22,20,'2019-11-04 21:07:51'),(370,22,20,'2019-11-04 21:08:21'),(371,22,20,'2019-11-04 21:08:50'),(372,22,20,'2019-11-04 21:09:21'),(373,22,20,'2019-11-04 21:10:21'),(374,22,20,'2019-11-04 21:11:20'),(375,22,20,'2019-11-04 21:11:51'),(376,22,20,'2019-11-04 21:12:21'),(377,22,20,'2019-11-04 21:12:51'),(378,22,20,'2019-11-04 21:13:21'),(379,22,20,'2019-11-04 21:13:51'),(380,22,20,'2019-11-04 21:14:21'),(381,22,20,'2019-11-04 21:14:50'),(382,22,20,'2019-11-04 21:15:20'),(383,22,20,'2019-11-04 21:15:50'),(384,22,20,'2019-11-04 21:16:21'),(385,22,20,'2019-11-04 21:16:51'),(386,22,20,'2019-11-04 21:17:21'),(387,22,20,'2019-11-04 21:17:51'),(388,22,20,'2019-11-04 21:18:21'),(389,22,20,'2019-11-04 21:18:51'),(390,22,20,'2019-11-04 21:19:20'),(391,22,20,'2019-11-04 21:19:50'),(392,22,20,'2019-11-04 21:20:20'),(393,22,20,'2019-11-04 21:20:51'),(394,22,20,'2019-11-04 21:21:21'),(395,21,20,'2019-11-04 21:21:51'),(396,21,20,'2019-11-04 21:22:21'),(397,21,20,'2019-11-04 21:22:51'),(398,21,20,'2019-11-05 19:13:49'),(399,21,20,'2019-11-05 19:14:19'),(400,21,20,'2019-11-05 19:14:50'),(401,21,20,'2019-11-05 19:15:20'),(402,21,20,'2019-11-05 19:17:37'),(403,21,20,'2019-11-05 19:18:07'),(404,21,20,'2019-11-05 19:18:37'),(405,21,20,'2019-11-05 19:19:08'),(406,21,20,'2019-11-05 19:19:38'),(407,21,20,'2019-11-05 19:20:08'),(408,21,20,'2019-11-05 19:20:37'),(409,21,20,'2019-11-05 19:21:07'),(410,21,20,'2019-11-05 19:21:37'),(411,21,20,'2019-11-05 19:22:07'),(412,21,20,'2019-11-05 19:22:37'),(413,21,20,'2019-11-05 19:23:07'),(414,21,20,'2019-11-05 19:23:38'),(415,21,20,'2019-11-05 19:24:08'),(416,21,20,'2019-11-05 19:24:37'),(417,21,20,'2019-11-05 19:25:07'),(418,21,20,'2019-11-05 19:25:37'),(419,21,20,'2019-11-05 19:26:07'),(420,21,20,'2019-11-05 19:26:37'),(421,21,20,'2019-11-05 19:27:07'),(422,21,20,'2019-11-05 19:27:37'),(423,21,20,'2019-11-05 19:28:08'),(424,21,20,'2019-11-05 19:28:38'),(425,21,20,'2019-11-05 19:29:27'),(426,21,20,'2019-11-05 19:29:57'),(427,21,20,'2019-11-05 19:30:27'),(428,21,20,'2019-11-05 19:32:07'),(429,21,20,'2019-11-05 19:32:37'),(430,21,20,'2019-11-05 19:33:07'),(431,21,20,'2019-11-05 19:33:37'),(432,21,20,'2019-11-05 19:34:29'),(433,21,20,'2019-11-05 19:34:59'),(434,21,20,'2019-11-05 19:35:29'),(435,21,20,'2019-11-05 19:35:59'),(436,21,20,'2019-11-05 19:36:59'),(437,21,20,'2019-11-05 19:38:03'),(438,21,20,'2019-11-05 19:38:32'),(439,21,20,'2019-11-05 19:39:02'),(440,21,20,'2019-11-05 19:39:32'),(441,21,20,'2019-11-05 19:40:38'),(442,21,20,'2019-11-05 19:41:08'),(443,21,20,'2019-11-05 19:41:38'),(444,21,20,'2019-11-05 19:42:08'),(445,21,20,'2019-11-05 19:42:38'),(446,21,20,'2019-11-05 19:43:08'),(447,21,20,'2019-11-05 19:44:13'),(448,21,20,'2019-11-05 19:44:43'),(449,21,20,'2019-11-05 19:45:13'),(450,21,20,'2019-11-05 19:45:42'),(451,24,19,'2019-11-05 19:46:12'),(452,32,27,'2019-11-05 19:46:42'),(453,30,27,'2019-11-05 19:47:12'),(454,27,17,'2019-11-05 19:47:42'),(455,25,18,'2019-11-05 19:48:12'),(456,24,19,'2019-11-05 19:48:43'),(457,24,19,'2019-11-05 19:49:13'),(458,23,19,'2019-11-05 19:49:42'),(459,23,19,'2019-11-05 19:50:12'),(460,22,20,'2019-11-05 19:50:42'),(461,22,20,'2019-11-05 19:51:12'),(462,22,20,'2019-11-05 19:51:42'),(463,22,20,'2019-11-05 19:52:12'),(464,22,20,'2019-11-05 19:52:42'),(465,22,20,'2019-11-05 19:53:13'),(466,22,20,'2019-11-05 19:53:43'),(467,21,20,'2019-11-05 19:54:12'),(468,21,20,'2019-11-05 19:54:42'),(469,21,20,'2019-11-05 19:55:12'),(470,21,20,'2019-11-05 19:55:42'),(471,21,20,'2019-11-05 19:56:12'),(472,21,20,'2019-11-05 19:56:42'),(473,21,20,'2019-11-05 19:57:13'),(474,21,20,'2019-11-05 19:57:43'),(475,21,20,'2019-11-05 19:58:13'),(476,21,20,'2019-11-05 19:58:42'),(477,21,20,'2019-11-05 19:59:12'),(478,21,20,'2019-11-05 19:59:42'),(479,21,20,'2019-11-05 20:00:12'),(480,21,20,'2019-11-05 20:15:33'),(481,21,20,'2019-11-05 20:16:04'),(482,21,20,'2019-11-05 20:16:34'),(483,21,20,'2019-11-05 20:17:04'),(484,21,20,'2019-11-05 20:17:33'),(485,21,20,'2019-11-05 20:18:03'),(486,21,20,'2019-11-05 20:18:33'),(487,21,20,'2019-11-05 20:19:03'),(488,21,20,'2019-11-05 20:19:33'),(489,21,20,'2019-11-05 20:20:03'),(490,21,20,'2019-11-05 20:20:34'),(491,21,20,'2019-11-05 20:21:04'),(492,21,20,'2019-11-05 20:21:34'),(493,21,20,'2019-11-05 20:22:03'),(494,21,20,'2019-11-05 20:22:33'),(495,21,20,'2019-11-05 20:23:53'),(496,21,20,'2019-11-05 20:24:23'),(497,21,20,'2019-11-05 20:24:54'),(498,21,20,'2019-11-05 20:25:45'),(499,21,20,'2019-11-05 20:26:16'),(500,21,20,'2019-11-05 20:26:46'),(501,21,20,'2019-11-05 20:27:16'),(502,21,20,'2019-11-05 20:27:45'),(503,21,20,'2019-11-05 20:28:15'),(504,21,20,'2019-11-05 20:29:23'),(505,21,20,'2019-11-05 20:29:53'),(506,21,20,'2019-11-05 20:30:22'),(507,21,20,'2019-11-05 20:33:43'),(508,21,20,'2019-11-05 20:36:22'),(509,21,20,'2019-11-05 20:39:21'),(510,21,20,'2019-11-05 20:41:35'),(511,21,20,'2019-11-05 20:42:05'),(512,21,20,'2019-11-05 20:44:27'),(513,21,20,'2019-11-05 20:44:57'),(514,21,20,'2019-11-05 20:45:27'),(515,21,20,'2019-11-05 20:45:57'),(516,21,20,'2019-11-05 20:46:28'),(517,21,20,'2019-11-05 20:46:58'),(518,21,20,'2019-11-05 20:47:28'),(519,21,20,'2019-11-05 20:47:57'),(520,21,20,'2019-11-05 20:48:27'),(521,21,20,'2019-11-05 20:49:48'),(522,21,20,'2019-11-05 20:50:18'),(523,21,20,'2019-11-05 20:50:48'),(524,21,20,'2019-11-05 20:51:19'),(525,21,20,'2019-11-05 20:51:49'),(526,21,20,'2019-11-05 20:52:19'),(527,21,20,'2019-11-05 20:52:48'),(528,21,20,'2019-11-05 20:53:18'),(529,21,20,'2019-11-05 20:53:48'),(530,21,20,'2019-11-05 20:54:18'),(531,21,20,'2019-11-05 20:54:48'),(532,21,20,'2019-11-05 20:55:18'),(533,21,20,'2019-11-05 20:57:29'),(534,21,20,'2019-11-05 20:58:00'),(535,21,20,'2019-11-05 20:58:30'),(536,21,20,'2019-11-05 20:59:00'),(537,21,20,'2019-11-05 20:59:29'),(538,21,20,'2019-11-05 21:40:19'),(539,21,20,'2019-11-05 21:40:49'),(540,21,20,'2019-11-05 21:41:19'),(541,21,20,'2019-11-05 21:42:19'),(542,21,20,'2019-11-05 21:42:49'),(543,21,20,'2019-11-05 21:43:19'),(544,21,20,'2019-11-05 21:43:49'),(545,21,20,'2019-11-05 21:44:19'),(546,21,20,'2019-11-05 21:44:49'),(547,21,20,'2019-11-05 21:45:20'),(548,21,20,'2019-11-05 21:45:50'),(549,21,20,'2019-11-05 21:46:19'),(550,21,20,'2019-11-05 21:46:49'),(551,21,20,'2019-11-05 21:47:19'),(552,21,20,'2019-11-05 21:47:49'),(553,21,20,'2019-11-05 21:48:19'),(554,21,20,'2019-11-05 21:48:49'),(555,21,20,'2019-11-05 21:49:20'),(556,21,20,'2019-11-05 21:49:50'),(557,21,20,'2019-11-05 21:50:20'),(558,21,20,'2019-11-05 21:50:49'),(559,21,20,'2019-11-05 21:51:19'),(560,21,20,'2019-11-05 21:51:49'),(561,21,20,'2019-11-05 21:52:19'),(562,21,20,'2019-11-05 21:52:49'),(563,21,20,'2019-11-05 21:53:19'),(564,21,20,'2019-11-05 21:53:50'),(565,21,20,'2019-11-05 21:54:20'),(566,21,20,'2019-11-06 19:30:19'),(567,21,20,'2019-11-06 19:30:49'),(568,21,20,'2019-11-06 19:31:18'),(569,21,20,'2019-11-06 19:31:48'),(570,21,20,'2019-11-06 19:32:19'),(571,21,20,'2019-11-06 19:32:49'),(572,21,20,'2019-11-06 19:33:19'),(573,21,20,'2019-11-06 19:33:49'),(574,20,21,'2019-11-06 19:34:19'),(575,21,20,'2019-11-06 19:34:49'),(576,20,21,'2019-11-06 19:35:18'),(577,20,21,'2019-11-06 19:35:48'),(578,21,20,'2019-11-06 19:36:18'),(579,21,20,'2019-11-06 19:36:49'),(580,21,20,'2019-11-06 19:37:19'),(581,21,20,'2019-11-06 19:37:49'),(582,21,20,'2019-11-06 19:38:19'),(583,21,20,'2019-11-06 19:38:49'),(584,21,20,'2019-11-06 19:39:19'),(585,21,20,'2019-11-06 19:39:48'),(586,21,20,'2019-11-06 19:40:18'),(587,21,20,'2019-11-06 19:40:48'),(588,21,20,'2019-11-06 19:41:19'),(589,21,20,'2019-11-06 19:41:49'),(590,21,20,'2019-11-06 19:42:48'),(591,21,20,'2019-11-06 19:43:18'),(592,21,20,'2019-11-06 19:43:49'),(593,21,20,'2019-11-06 19:44:19'),(594,21,20,'2019-11-06 19:44:49'),(595,21,20,'2019-11-06 19:45:19'),(596,21,20,'2019-11-06 19:45:49'),(597,21,20,'2019-11-06 19:46:19'),(598,21,20,'2019-11-06 19:46:48'),(599,21,20,'2019-11-06 19:47:18'),(600,21,20,'2019-11-06 19:47:48'),(601,21,20,'2019-11-06 19:48:19'),(602,21,20,'2019-11-06 19:48:49'),(603,21,20,'2019-11-06 19:49:19'),(604,21,20,'2019-11-06 19:49:48'),(605,21,20,'2019-11-06 19:50:19'),(606,21,20,'2019-11-06 19:50:49'),(607,21,20,'2019-11-06 19:51:19'),(608,21,20,'2019-11-06 19:51:49'),(609,21,20,'2019-11-06 19:52:18'),(610,21,20,'2019-11-06 19:52:48'),(611,21,20,'2019-11-06 19:53:18'),(612,21,20,'2019-11-06 19:53:49'),(613,21,20,'2019-11-06 19:54:19'),(614,21,20,'2019-11-06 19:54:49'),(615,21,20,'2019-11-06 19:55:19'),(616,21,20,'2019-11-06 19:55:49'),(617,21,20,'2019-11-06 19:56:19'),(618,21,20,'2019-11-06 19:56:48'),(619,21,20,'2019-11-06 19:57:18'),(620,21,20,'2019-11-06 19:57:48'),(621,21,20,'2019-11-06 19:58:49'),(622,21,20,'2019-11-06 19:59:19'),(623,21,20,'2019-11-06 19:59:49'),(624,21,20,'2019-11-06 20:00:19'),(625,21,20,'2019-11-06 20:00:48'),(626,21,20,'2019-11-06 20:01:18'),(627,21,20,'2019-11-06 20:01:48'),(628,21,20,'2019-11-06 20:02:19'),(629,21,20,'2019-11-06 20:02:49'),(630,21,20,'2019-11-06 20:03:19'),(631,21,20,'2019-11-06 20:03:49'),(632,21,20,'2019-11-06 20:04:19'),(633,21,20,'2019-11-06 20:04:49'),(634,21,20,'2019-11-06 20:05:18'),(635,21,20,'2019-11-06 20:05:48'),(636,21,20,'2019-11-06 20:06:18'),(637,20,21,'2019-11-06 20:06:49'),(638,21,20,'2019-11-06 20:07:19'),(639,21,20,'2019-11-06 20:07:49'),(640,21,20,'2019-11-06 20:08:19'),(641,21,20,'2019-11-06 20:08:49'),(642,21,20,'2019-11-06 20:09:19'),(643,21,20,'2019-11-06 20:09:48'),(644,21,20,'2019-11-06 20:10:18'),(645,21,20,'2019-11-06 20:10:48'),(646,20,21,'2019-11-06 20:11:19'),(647,20,21,'2019-11-06 20:11:49'),(648,20,21,'2019-11-06 20:12:19'),(649,21,20,'2019-11-06 20:12:49'),(650,20,21,'2019-11-06 20:13:19'),(651,20,21,'2019-11-06 20:13:49'),(652,21,20,'2019-11-06 20:14:18'),(653,21,20,'2019-11-06 20:14:48'),(654,20,21,'2019-11-06 20:15:18'),(655,20,21,'2019-11-06 20:15:49'),(656,21,20,'2019-11-06 20:16:19'),(657,20,21,'2019-11-06 20:16:49'),(658,20,21,'2019-11-06 20:17:19'),(659,20,21,'2019-11-06 20:17:49'),(660,20,21,'2019-11-06 20:18:19'),(661,20,21,'2019-11-06 20:18:48'),(662,20,21,'2019-11-06 20:19:18'),(663,20,21,'2019-11-06 20:19:49'),(664,21,20,'2019-11-06 20:20:19'),(665,20,21,'2019-11-06 20:20:49'),(666,21,20,'2019-11-06 20:21:19'),(667,20,21,'2019-11-06 20:21:49'),(668,20,21,'2019-11-06 20:22:19'),(669,20,21,'2019-11-06 20:22:49'),(670,20,21,'2019-11-06 20:23:18'),(671,20,21,'2019-11-06 20:23:48'),(672,20,21,'2019-11-06 20:24:19'),(673,20,21,'2019-11-06 20:24:49'),(674,20,21,'2019-11-06 20:25:19'),(675,20,21,'2019-11-06 20:25:49'),(676,20,21,'2019-11-06 20:26:19'),(677,21,20,'2019-11-06 20:26:48'),(678,21,20,'2019-11-06 20:27:18'),(679,21,20,'2019-11-06 20:27:48'),(680,21,20,'2019-11-06 20:28:19'),(681,21,20,'2019-11-06 20:28:49'),(682,21,20,'2019-11-06 20:29:19'),(683,21,20,'2019-11-06 20:29:49'),(684,21,20,'2019-11-06 20:30:19'),(685,21,20,'2019-11-06 20:30:48'),(686,20,21,'2019-11-06 20:31:18'),(687,21,20,'2019-11-06 20:31:48'),(688,20,21,'2019-11-06 20:32:19'),(689,20,21,'2019-11-06 20:32:49'),(690,20,21,'2019-11-06 20:33:19'),(691,20,21,'2019-11-06 20:33:49'),(692,20,21,'2019-11-06 20:34:19'),(693,20,21,'2019-11-06 20:34:49'),(694,20,21,'2019-11-06 20:35:18'),(695,20,21,'2019-11-06 20:35:48'),(696,20,21,'2019-11-06 20:36:19'),(697,20,21,'2019-11-06 20:36:49'),(698,20,21,'2019-11-06 20:37:19'),(699,20,21,'2019-11-06 20:37:49'),(700,20,21,'2019-11-06 20:38:19'),(701,20,21,'2019-11-06 20:38:48'),(702,20,21,'2019-11-06 20:39:18'),(703,20,21,'2019-11-06 20:39:48'),(704,20,21,'2019-11-06 20:40:19'),(705,20,21,'2019-11-06 20:40:49'),(706,20,21,'2019-11-06 20:41:19'),(707,20,21,'2019-11-06 20:41:49'),(708,20,21,'2019-11-06 20:42:19'),(709,20,21,'2019-11-06 20:42:49'),(710,20,21,'2019-11-06 20:43:18'),(711,21,20,'2019-11-06 20:43:48'),(712,20,21,'2019-11-06 20:44:18'),(713,21,20,'2019-11-06 20:44:49'),(714,20,21,'2019-11-06 20:45:19'),(715,20,21,'2019-11-06 20:45:49'),(716,21,20,'2019-11-06 20:46:19'),(717,20,21,'2019-11-06 20:46:48'),(718,20,21,'2019-11-06 20:47:18'),(719,20,21,'2019-11-06 20:47:48'),(720,20,21,'2019-11-06 20:48:19'),(721,20,21,'2019-11-06 20:48:49'),(722,20,21,'2019-11-06 20:49:19'),(723,20,21,'2019-11-06 20:49:49'),(724,20,21,'2019-11-06 20:50:19'),(725,20,21,'2019-11-06 20:50:49'),(726,20,21,'2019-11-06 20:51:18'),(727,20,21,'2019-11-06 20:51:48'),(728,21,20,'2019-11-06 20:52:48'),(729,20,21,'2019-11-06 20:53:18'),(730,20,21,'2019-11-06 20:53:49'),(731,20,21,'2019-11-06 20:54:19'),(732,20,21,'2019-11-06 20:54:49'),(733,20,21,'2019-11-06 20:55:19'),(734,20,21,'2019-11-06 20:55:48'),(735,20,21,'2019-11-06 20:56:18'),(736,20,21,'2019-11-06 20:56:49'),(737,20,21,'2019-11-06 20:57:19'),(738,21,20,'2019-11-06 20:57:49'),(739,21,20,'2019-11-06 20:58:19'),(740,20,21,'2019-11-06 20:58:49'),(741,20,21,'2019-11-06 20:59:19'),(742,20,21,'2019-11-06 20:59:48'),(743,21,20,'2019-11-06 21:00:18'),(744,20,21,'2019-11-06 21:00:49'),(745,20,21,'2019-11-06 21:01:19'),(746,20,21,'2019-11-06 21:01:49'),(747,20,21,'2019-11-06 21:02:19'),(748,21,20,'2019-11-06 21:02:49'),(749,20,21,'2019-11-06 21:03:19'),(750,20,21,'2019-11-06 21:03:48'),(751,20,21,'2019-11-06 21:04:18'),(752,20,21,'2019-11-06 21:04:49'),(753,20,21,'2019-11-06 21:05:19'),(754,20,21,'2019-11-06 21:05:49'),(755,20,21,'2019-11-06 21:06:19'),(756,20,21,'2019-11-06 21:06:49'),(757,20,21,'2019-11-06 21:07:19'),(758,20,21,'2019-11-06 21:07:48'),(759,20,21,'2019-11-06 21:08:18'),(760,20,21,'2019-11-06 21:08:48'),(761,20,21,'2019-11-06 21:09:19'),(762,20,21,'2019-11-06 21:09:49'),(763,20,21,'2019-11-06 21:10:19'),(764,20,21,'2019-11-06 21:10:49'),(765,20,21,'2019-11-06 21:11:19'),(766,20,21,'2019-11-06 21:11:49'),(767,20,21,'2019-11-06 21:12:18'),(768,20,21,'2019-11-06 21:12:48'),(769,20,21,'2019-11-06 21:13:18'),(770,20,21,'2019-11-06 21:13:49'),(771,20,21,'2019-11-06 21:14:19'),(772,20,21,'2019-11-06 21:14:49'),(773,20,21,'2019-11-06 21:15:19'),(774,20,21,'2019-11-06 21:15:49'),(775,20,21,'2019-11-06 21:16:18'),(776,20,21,'2019-11-06 21:16:48'),(777,20,21,'2019-11-06 21:17:18'),(778,20,21,'2019-11-06 21:17:49'),(779,20,21,'2019-11-06 21:18:49'),(780,20,21,'2019-11-06 21:19:19'),(781,20,21,'2019-11-06 21:19:49'),(782,20,21,'2019-11-06 21:20:19'),(783,20,21,'2019-11-06 21:20:48'),(784,20,21,'2019-11-06 21:21:18'),(785,20,21,'2019-11-06 21:21:48'),(786,20,21,'2019-11-06 21:22:19'),(787,20,21,'2019-11-06 21:22:49'),(788,21,20,'2019-11-06 21:23:19'),(789,19,21,'2019-11-10 08:55:35'),(790,19,21,'2019-11-10 08:56:06'),(791,19,21,'2019-11-10 08:56:36'),(792,19,21,'2019-11-10 08:57:06'),(793,19,21,'2019-11-10 08:57:36'),(794,19,21,'2019-11-10 08:58:05'),(795,19,21,'2019-11-10 08:58:35'),(796,19,21,'2019-11-10 08:59:06'),(797,19,21,'2019-11-10 08:59:36'),(798,19,21,'2019-11-10 09:00:06'),(799,19,21,'2019-11-10 09:00:36'),(800,19,21,'2019-11-10 09:01:06'),(801,19,21,'2019-11-10 09:01:36'),(802,19,21,'2019-11-10 09:02:06'),(803,19,21,'2019-11-10 09:02:35'),(804,19,21,'2019-11-10 09:03:05'),(805,19,21,'2019-11-10 09:03:36'),(806,19,21,'2019-11-10 09:04:06'),(807,19,21,'2019-11-10 09:04:36'),(808,19,21,'2019-11-10 09:05:06'),(809,19,21,'2019-11-10 09:05:36'),(810,19,21,'2019-11-10 09:06:06'),(811,19,21,'2019-11-10 09:06:36'),(812,19,21,'2019-11-10 09:07:05'),(813,19,21,'2019-11-10 09:07:35'),(814,19,21,'2019-11-10 09:08:05'),(815,19,21,'2019-11-10 09:08:36'),(816,19,21,'2019-11-10 09:09:06'),(817,19,21,'2019-11-10 09:09:36'),(818,19,21,'2019-11-10 09:10:06'),(819,19,21,'2019-11-10 09:10:36'),(820,19,21,'2019-11-10 09:11:06'),(821,19,21,'2019-11-10 09:11:35'),(822,19,21,'2019-11-10 09:12:05'),(823,19,21,'2019-11-10 09:12:35'),(824,19,21,'2019-11-10 09:13:06'),(825,19,21,'2019-11-10 09:13:36'),(826,19,21,'2019-11-10 09:14:06'),(827,19,21,'2019-11-10 09:14:36'),(828,19,21,'2019-11-10 09:15:06'),(829,19,21,'2019-11-10 09:15:36');
/*!40000 ALTER TABLE `air_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light_measurement`
--

DROP TABLE IF EXISTS `light_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `light_measurement` (
  `id` int(11) NOT NULL,
  `intensity` double DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light_measurement`
--

LOCK TABLES `light_measurement` WRITE;
/*!40000 ALTER TABLE `light_measurement` DISABLE KEYS */;
INSERT INTO `light_measurement` VALUES (1,76,'2019-03-03 12:00:00'),(2,65,'2019-03-03 12:00:00'),(3,87,'2019-03-03 12:00:00'),(4,55,'2019-03-03 12:00:00'),(5,68,'2019-03-03 12:00:00');
/*!40000 ALTER TABLE `light_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soil_measurement`
--

DROP TABLE IF EXISTS `soil_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soil_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moisture` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soil_measurement`
--

LOCK TABLES `soil_measurement` WRITE;
/*!40000 ALTER TABLE `soil_measurement` DISABLE KEYS */;
INSERT INTO `soil_measurement` VALUES (1,45,'2019-06-03 12:00:00'),(2,34,'2019-06-03 12:00:00'),(3,23,'2019-06-03 12:00:00'),(4,43,'2019-06-03 12:00:00'),(5,43,'2019-06-03 12:00:00');
/*!40000 ALTER TABLE `soil_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@gmail.com','a'),(2,'a','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-10  9:15:55
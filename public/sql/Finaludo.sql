-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ludo
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actors` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_type` varchar(45) NOT NULL COMMENT 'I for Individual, T for Team, B for Bot',
  `actor_name` varchar(45) NOT NULL,
  `role_type_id` int(11) DEFAULT NULL COMMENT 'The actor''s in-game role.',
  `person_id` int(11) DEFAULT NULL COMMENT 'The Player Name, Username, etc.',
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `person_id` (`person_id`),
  KEY `instance_id` (`instance_id`),
  KEY `role_type_id` (`role_type_id`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `people` (`person_id`),
  CONSTRAINT `actors_ibfk_2` FOREIGN KEY (`instance_id`) REFERENCES `game_instances` (`instance_id`),
  CONSTRAINT `actors_ibfk_3` FOREIGN KEY (`role_type_id`) REFERENCES `role_types` (`role_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'I','Bob Brown: Database Administrator',1,1,1),(2,'I','Red Eye: Civic Officer',2,2,1),(3,'I','Corona Virus: IT Associate',3,3,1),(4,'I','Warrior: Emergency Response Specialist',4,4,1),(5,'T','Blue Team',NULL,NULL,1),(6,'I','Adam Applin: Database Administrator',1,5,1),(7,'I','Cinder Crash: Civic Officer',2,7,1),(8,'I','Draymond DK: IT Associate',3,8,1),(9,'I','Buster Boost: Emergency Response Specialist',4,6,1),(10,'T','Red Team',NULL,NULL,1),(11,'I','Mordecai Simple: Database Administrator',1,12,1),(12,'I','Contra Ease: Civic Officer',2,10,1),(13,'I','Kei Kaku: IT Associate',3,11,1),(14,'I','Eve Olve: Emergency Response Specialist',4,9,1),(15,'T','Green Team',NULL,NULL,1),(16,'I','Hannibal Broly: Civic Officer',2,13,1),(17,'I','Rena Logan: IT Associate',3,16,1),(18,'I','Barney Miles: Database Administrator',1,14,1),(19,'I','Kim Hines: Emergency Response Specialist',4,15,1),(20,'T','Magenta Team',NULL,NULL,1),(21,'I','Ariel: Emergency Response Specialist',4,20,1),(22,'I','Kevin Thorn: Database Administrator',1,18,1),(23,'I','Gangrel: IT Associate',3,17,1),(24,'I','Vampiro: Civic Officer',2,19,1),(25,'T','Crimson Team',NULL,NULL,1),(26,'I','Charles Wright: Database Administrator',1,21,1),(27,'I','Manfred Von Karma: Civic Officer',2,22,1),(28,'I','Speed Racer: IT Associate',3,23,1),(29,'I','Harold Jordan: Emergency Response Specialist',4,24,1),(30,'T','Purple Team',NULL,NULL,1),(31,'B','The Big Bad Boss',5,NULL,1);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `day_five_summary`
--

DROP TABLE IF EXISTS `day_five_summary`;
/*!50001 DROP VIEW IF EXISTS `day_five_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `day_five_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `day_four_summary`
--

DROP TABLE IF EXISTS `day_four_summary`;
/*!50001 DROP VIEW IF EXISTS `day_four_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `day_four_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `day_one_summary`
--

DROP TABLE IF EXISTS `day_one_summary`;
/*!50001 DROP VIEW IF EXISTS `day_one_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `day_one_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `day_three_summary`
--

DROP TABLE IF EXISTS `day_three_summary`;
/*!50001 DROP VIEW IF EXISTS `day_three_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `day_three_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `day_two_summary`
--

DROP TABLE IF EXISTS `day_two_summary`;
/*!50001 DROP VIEW IF EXISTS `day_two_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `day_two_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_instances`
--

DROP TABLE IF EXISTS `game_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_instances` (
  `instance_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_name` varchar(45) NOT NULL COMMENT 'Season and year.',
  `section` varchar(45) NOT NULL COMMENT 'Which section?',
  `course_code` varchar(45) NOT NULL COMMENT 'Which school course is playing this game?',
  `institution_name` varchar(45) NOT NULL COMMENT 'The institution the player represents.',
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`instance_id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `game_instances_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `game_versions` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_instances`
--

LOCK TABLES `game_instances` WRITE;
/*!40000 ALTER TABLE `game_instances` DISABLE KEYS */;
INSERT INTO `game_instances` VALUES (1,'Spring 2020','0101','INST201','UMD',1);
/*!40000 ALTER TABLE `game_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_versions`
--

DROP TABLE IF EXISTS `game_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `game_versions` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(45) NOT NULL COMMENT 'Which version of the game are we playing?',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_versions`
--

LOCK TABLES `game_versions` WRITE;
/*!40000 ALTER TABLE `game_versions` DISABLE KEYS */;
INSERT INTO `game_versions` VALUES (1,'CIP 1');
/*!40000 ALTER TABLE `game_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupings`
--

DROP TABLE IF EXISTS `groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `groupings` (
  `grouping_id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) NOT NULL COMMENT 'Represents the individuals being put into groups.',
  `team_id` int(11) NOT NULL COMMENT 'Represents the teams individuals are being put into.',
  PRIMARY KEY (`grouping_id`),
  KEY `actor_id` (`actor_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `groupings_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  CONSTRAINT `groupings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `actors` (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings`
--

LOCK TABLES `groupings` WRITE;
/*!40000 ALTER TABLE `groupings` DISABLE KEYS */;
INSERT INTO `groupings` VALUES (1,1,5),(2,2,5),(3,3,5),(4,4,5),(5,6,10),(6,7,10),(7,8,10),(8,9,10),(9,11,15),(10,12,15),(11,13,15),(12,14,15),(13,16,20),(14,17,20),(15,18,20),(16,19,20),(17,21,25),(18,22,25),(19,23,25),(20,24,25),(21,26,30),(22,27,30),(23,28,30),(24,29,30);
/*!40000 ALTER TABLE `groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `individual_workers`
--

DROP TABLE IF EXISTS `individual_workers`;
/*!50001 DROP VIEW IF EXISTS `individual_workers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `individual_workers` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `role_type_id`,
 1 AS `role_type`,
 1 AS `game_position`,
 1 AS `action_type`,
 1 AS `action_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `message_action_detail`
--

DROP TABLE IF EXISTS `message_action_detail`;
/*!50001 DROP VIEW IF EXISTS `message_action_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `message_action_detail` AS SELECT 
 1 AS `actor_id`,
 1 AS `action_type`,
 1 AS `game_position`,
 1 AS `actor_name`,
 1 AS `role_type_id`,
 1 AS `person_id`,
 1 AS `role_type`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `message_actions`
--

DROP TABLE IF EXISTS `message_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message_actions` (
  `message_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(10) NOT NULL COMMENT 'This holds the type of the action. Ex: Send, Receive, CC, BCC, Forward',
  `action_time` int(11) NOT NULL COMMENT 'The date and time the message action is performed',
  `game_position` varchar(45) NOT NULL COMMENT 'The virtual day in-game.',
  `message_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`message_action_id`),
  KEY `message_id` (`message_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `message_actions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`),
  CONSTRAINT `message_actions_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_actions`
--

LOCK TABLES `message_actions` WRITE;
/*!40000 ALTER TABLE `message_actions` DISABLE KEYS */;
INSERT INTO `message_actions` VALUES (1,'Sent',1588743610,'Day 1',1,2),(2,'Received',1588743611,'Day 1',1,1),(3,'Received',1588743611,'Day 1',1,3),(4,'Received',1588743611,'Day 1',1,4),(5,'Sent',1588743611,'Day 1',2,1),(6,'Received',1588743611,'Day 1',2,2),(7,'Sent',1588743612,'Day 1',3,3),(8,'Received',1588743612,'Day 1',3,4),(9,'Sent',1588743612,'Day 2',4,1),(10,'Received',1588743612,'Day 2',4,3),(11,'Sent',1588743612,'Day 2',5,4),(12,'Received',1588743612,'Day 2',5,2),(13,'Sent',1588743613,'Day 3',6,3),(14,'Received',1588743613,'Day 3',6,2),(15,'Sent',1588743613,'Day 3',6,4),(16,'Received',1588743613,'Day 3',6,1),(17,'Sent',1588743613,'Day 4',8,3),(18,'Received',1588743613,'Day 4',8,2),(19,'Received',1588743613,'Day 4',8,4),(20,'Received',1588743613,'Day 4',8,1),(21,'Sent',1588743613,'Day 4',6,4),(22,'Received',1588743614,'Day 4',6,2),(23,'Sent',1588743614,'Day 5',10,3),(24,'Received',1588743614,'Day 5',10,2),(25,'Received',1588743614,'Day 5',10,4),(26,'Received',1588743614,'Day 5',10,1),(27,'Sent',1588743617,'Day 1',11,6),(28,'Received',1588743617,'Day 1',11,9),(29,'Received',1588743617,'Day 1',11,7),(30,'Received',1588743617,'Day 1',11,8),(31,'Sent',1588743617,'Day 1',12,6),(32,'Received',1588743618,'Day 1',12,9),(33,'Sent',1588743618,'Day 1',13,6),(34,'Received',1588743618,'Day 1',13,9),(35,'Received',1588743618,'Day 1',11,7),(36,'Received',1588743618,'Day 1',11,8),(37,'Sent',1588743619,'Day 2',14,7),(38,'Received',1588743619,'Day 2',14,6),(39,'Sent',1588743619,'Day 2',15,7),(40,'Received',1588743619,'Day 2',15,9),(41,'Sent',1588743619,'Day 2',16,9),(42,'Received',1588743619,'Day 2',16,7),(43,'Sent',1588743620,'Day 3',17,9),(44,'Received',1588743620,'Day 3',17,6),(45,'Sent',1588743620,'Day 3',18,6),(46,'Received',1588743620,'Day 3',18,9),(47,'Sent',1588743620,'Day 3',19,8),(48,'Received',1588743620,'Day 3',19,7),(49,'Sent',1588743621,'Day 4',20,8),(50,'Received',1588743621,'Day 4',20,7),(51,'Received',1588743621,'Day 4',20,6),(52,'Received',1588743621,'Day 4',20,9),(53,'Sent',1588743621,'Day 4',21,9),(54,'Received',1588743621,'Day 4',21,8),(55,'Received',1588743621,'Day 4',21,7),(56,'Received',1588743621,'Day 4',21,6),(57,'Sent',1588743621,'Day 4',22,8),(58,'Received',1588743622,'Day 4',22,9),(59,'Sent',1588743622,'Day 5',23,7),(60,'Received',1588743622,'Day 5',23,8),(61,'Received',1588743622,'Day 5',23,9),(62,'Received',1588743622,'Day 5',23,6),(63,'Sent',1588743624,'Day 2',24,14),(64,'Received',1588743624,'Day 2',24,11),(65,'Sent',1588743624,'Day 4',25,13),(66,'Received',1588743624,'Day 4',25,12),(67,'Sent',1588743624,'Day 3',26,13),(68,'Received',1588743624,'Day 3',26,11),(69,'Forward',1588743624,'Day 3',26,11),(70,'Received',1588743624,'Day 3',26,12),(71,'Sent',1588743625,'Day 2',27,14),(72,'Received',1588743625,'Day 2',27,11),(73,'Sent',1588743625,'Day 1',28,12),(74,'Received',1588743625,'Day 1',28,11),(75,'Received',1588743625,'Day 1',28,13),(76,'Received',1588743625,'Day 1',28,14),(77,'Sent',1588743625,'Day 5',29,13),(78,'Received',1588743625,'Day 5',29,11),(79,'Received',1588743626,'Day 5',29,12),(80,'Received',1588743626,'Day 5',29,14),(81,'Sent',1588743626,'Day 5',30,14),(82,'Received',1588743626,'Day 5',30,13),(83,'Sent',1588743627,'Day 4',31,14),(84,'Received',1588743627,'Day 4',31,11),(85,'Sent',1588743629,'Day 1',32,19),(86,'Received',1588743629,'Day 1',32,17),(87,'Received',1588743629,'Day 1',32,18),(88,'Received',1588743629,'Day 1',32,16),(89,'Sent',1588743629,'Day 1',33,19),(90,'Received',1588743629,'Day 1',33,17),(91,'Received',1588743629,'Day 1',33,18),(92,'Received',1588743630,'Day 1',33,16),(93,'Sent',1588743630,'Day 2',34,19),(94,'Received',1588743630,'Day 2',34,17),(95,'Received',1588743630,'Day 2',34,18),(96,'Received',1588743630,'Day 2',34,16),(97,'Sent',1588743631,'Day 3',35,19),(98,'Received',1588743631,'Day 3',35,17),(99,'Received',1588743631,'Day 3',35,18),(100,'Received',1588743631,'Day 3',35,16),(101,'Sent',1588743634,'Day 1',36,29),(102,'Received',1588743635,'Day 1',36,28),(103,'Received',1588743635,'Day 1',36,27),(104,'Received',1588743635,'Day 1',36,26),(105,'Sent',1588743635,'Day 1',37,28),(106,'Received',1588743635,'Day 1',37,29),(107,'Sent',1588743635,'Day 1',38,27),(108,'Received',1588743635,'Day 1',38,29),(109,'Sent',1588743636,'Day 1',38,29),(110,'Received',1588743636,'Day 1',38,27),(111,'Sent',1588743636,'Day 1',36,27),(112,'Received',1588743636,'Day 1',36,28),(113,'Received',1588743636,'Day 1',36,29),(114,'Received',1588743637,'Day 1',36,26),(115,'Sent',1588743637,'Day 2',41,27),(116,'Received',1588743637,'Day 2',41,29),(117,'Sent',1588743637,'Day 2',42,29),(118,'Received',1588743637,'Day 2',42,27),(119,'Sent',1588743637,'Day 3',43,27),(120,'Received',1588743637,'Day 3',43,29),(121,'Sent',1588743638,'Day 3',44,29),(122,'Received',1588743638,'Day 3',44,27),(123,'Sent',1588743638,'Day 4',45,27),(124,'Received',1588743638,'Day 4',45,29),(125,'Sent',1588743639,'Day 4',46,29),(126,'Received',1588743639,'Day 4',46,27),(127,'Sent',1588743639,'Day 5',36,28),(128,'Received',1588743639,'Day 5',36,27),(129,'Received',1588743639,'Day 5',36,29),(130,'Received',1588743640,'Day 5',36,26),(131,'Sent',1588743640,'Day 1',48,31),(132,'Received',1588743640,'Day 1',48,5),(133,'Received',1588743640,'Day 1',48,10),(134,'Received',1588743640,'Day 1',48,15),(135,'Received',1588743641,'Day 1',48,20),(136,'Received',1588743641,'Day 1',48,25),(137,'Received',1588743641,'Day 1',48,30),(138,'Sent',1588743641,'Day 3',49,31),(139,'Received',1588743641,'Day 3',49,25),(140,'Sent',1588743641,'Day 5',50,31),(141,'Received',1588743641,'Day 5',50,17),(142,'Received',1588743642,'Day 5',50,18),(143,'Received',1588743642,'Day 5',50,16),(144,'Sent',1588743642,'Day 5',51,31),(145,'Received',1588743642,'Day 5',51,5),(146,'Received',1588743642,'Day 5',51,10),(147,'Received',1588743642,'Day 5',51,15),(148,'Received',1588743642,'Day 5',51,20),(149,'Received',1588743643,'Day 5',51,25),(150,'Received',1588743643,'Day 5',51,30),(151,'Sent',1588743643,'Day 5',52,31),(152,'Received',1588743643,'Day 5',52,25),(153,'Sent',1588743643,'Day 1',53,5),(154,'Received',1588743643,'Day 1',53,31),(155,'Sent',1588743644,'Day 1',54,10),(156,'Received',1588743644,'Day 1',54,31),(157,'Sent',1588743644,'Day 1',55,15),(158,'Received',1588743644,'Day 1',55,31),(159,'Sent',1588743644,'Day 1',56,30),(160,'Received',1588743644,'Day 1',56,31),(161,'Sent',1588743644,'Day 1',57,19),(162,'Received',1588743645,'Day 1',57,31),(163,'Sent',1588743645,'Day 2',58,5),(164,'Received',1588743645,'Day 2',58,31),(165,'Sent',1588743645,'Day 2',59,10),(166,'Received',1588743645,'Day 2',59,31),(167,'Sent',1588743645,'Day 2',60,15),(168,'Received',1588743646,'Day 2',60,31),(169,'Sent',1588743646,'Day 2',61,30),(170,'Received',1588743646,'Day 2',61,31),(171,'Sent',1588743646,'Day 2',62,19),(172,'Received',1588743646,'Day 2',62,31),(173,'Sent',1588743646,'Day 2',63,31),(174,'Received',1588743646,'Day 2',63,19),(175,'Sent',1588743647,'Day 2',64,19),(176,'Received',1588743647,'Day 2',64,31),(177,'Sent',1588743647,'Day 3',65,5),(178,'Received',1588743647,'Day 3',65,31),(179,'Sent',1588743647,'Day 3',66,10),(180,'Received',1588743647,'Day 3',66,31),(181,'Sent',1588743647,'Day 3',67,15),(182,'Received',1588743647,'Day 3',67,31),(183,'Sent',1588743648,'Day 3',68,30),(184,'Received',1588743648,'Day 3',68,31),(185,'Sent',1588743648,'Day 3',69,19),(186,'Received',1588743648,'Day 3',69,31),(187,'Sent',1588743648,'Day 3',70,31),(188,'Received',1588743648,'Day 3',70,19),(189,'Sent',1588743649,'Day 3',71,31),(190,'Received',1588743649,'Day 3',71,17),(191,'Received',1588743649,'Day 3',71,18),(192,'Received',1588743649,'Day 3',71,16),(193,'Sent',1588743649,'Day 4',72,5),(194,'Received',1588743650,'Day 4',72,31),(195,'Sent',1588743650,'Day 4',73,10),(196,'Received',1588743650,'Day 4',73,31),(197,'Sent',1588743650,'Day 4',74,15),(198,'Received',1588743650,'Day 4',74,31),(199,'Sent',1588743650,'Day 4',75,30),(200,'Received',1588743650,'Day 4',75,31),(201,'Sent',1588743651,'Day 4',76,19),(202,'Received',1588743651,'Day 4',76,31),(203,'Sent',1588743651,'Day 4',77,31),(204,'Received',1588743651,'Day 4',77,19),(205,'Sent',1588743651,'Day 1',78,31),(206,'Received',1588743651,'Day 1',78,25),(207,'Sent',1588743651,'Day 2',79,31),(208,'Received',1588743652,'Day 2',79,25),(209,'Sent',1588743652,'Day 4',80,31),(210,'Received',1588743652,'Day 4',80,25),(211,'Sent',1588743652,'Day 5',81,5),(212,'Received',1588743652,'Day 5',81,31),(213,'Sent',1588743652,'Day 5',82,10),(214,'Received',1588743652,'Day 5',82,31),(215,'Sent',1588743652,'Day 5',83,15),(216,'Received',1588743652,'Day 5',83,31),(217,'Sent',1588743653,'Day 5',84,30),(218,'Received',1588743653,'Day 5',84,31),(219,'Sent',1588743653,'Day 5',85,19),(220,'Received',1588743653,'Day 5',85,31),(221,'Sent',1588743653,'Day 5',86,31),(222,'Received',1588743653,'Day 5',86,19),(223,'Sent',1588743654,'Day 2',87,5),(224,'Received',1588743654,'Day 2',87,10),(225,'Received',1588743654,'Day 2',87,30),(226,'Sent',1588743654,'Day 3',88,5),(227,'Received',1588743654,'Day 3',88,25),(228,'Sent',1588743655,'Day 3',89,20),(229,'Received',1588743655,'Day 3',89,25),(230,'Sent',1588743655,'Day 3',90,10),(231,'Received',1588743655,'Day 3',90,19),(232,'Sent',1588743655,'Day 4',91,10),(233,'Received',1588743655,'Day 4',91,30),(234,'Sent',1588743655,'Day 4',92,30),(235,'Received',1588743656,'Day 4',92,10),(236,'Sent',1588743656,'Day 5',93,19),(237,'Received',1588743656,'Day 5',93,5),(238,'Received',1588743656,'Day 5',93,15),(239,'Received',1588743656,'Day 5',93,10),(240,'Received',1588743656,'Day 5',93,30),(241,'Received',1588743656,'Day 5',93,31);
/*!40000 ALTER TABLE `message_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `message_gameday_summary`
--

DROP TABLE IF EXISTS `message_gameday_summary`;
/*!50001 DROP VIEW IF EXISTS `message_gameday_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `message_gameday_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `message_actions`,
 1 AS `game_position`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_subject` varchar(45) NOT NULL COMMENT 'The topic of the message.',
  `message_text` varchar(200) NOT NULL COMMENT 'The content of the message.',
  `game_position` varchar(45) NOT NULL COMMENT 'The virtual day in-game.',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Emergency Action Needed for Leak','There is a leak on the North side of town that is flooding the street.','Day 1'),(2,'Emergency Action Needed for Leak - Response','Sent someone. Plumber on his way.','Day 1'),(3,'Sushi Time','I want fish, team. Let us get sushi.','Day 1'),(4,'Improve Firewalls','Help me find a guy to improve our firewalls.','Day 2'),(5,'Keep the peace.','Calm the people','Day 2'),(6,'Here, have these docs.','Use this data.','Day 3'),(7,'Document these, dude.','Dude! Here you go!','Day 3'),(8,'We almost good!','Right to da end, babies!','Day 4'),(9,'Liberty.','Almost free to be me!','Day 4'),(10,'Done! We did it!','Time to send this to the boss!','Day 5'),(11,'Break Plans','Let\'s meet up for lunch!','Day 1'),(12,'Send the plans','I need the emergency plans.','Day 1'),(13,'Encouragement','We can.','Day 1'),(14,'Four Score...','I hate history.','Day 2'),(15,'Gossip','Look at Magenta and Crimson','Day 2'),(16,'Gossip 2','I know, right?','Day 2'),(17,'DB','How is it looking, Adam?','Day 3'),(18,'DB 2','Fine, Buster. More data came in.','Day 3'),(19,'Hotel Plans','Let\'s make some money.','Day 3'),(20,'We got it.','Let\'s make some money.','Day 4'),(21,'Coincidence?','Anyone notice that our names are all alliterative and go ABCD?','Day 4'),(22,'We noticed.','Yes, Buster. We noticed. Boss did it on purpose.','Day 4'),(23,'We defeated this project.','It\'s game over. We WIN!','Day 5'),(24,'Future Reference','Please document the emergency I fixed for future reference.','Day 2'),(25,'Overheated Words','I need help calming a debate in the lobby.','Day 4'),(26,'I am bored.','Give me something to do.','Day 3'),(27,'Another Emergency?!','Emergency worst, same as the first.','Day 2'),(28,'Day One Ish','Let us do our best!','Day 1'),(29,'All According to Cake','Cake Means Keikaku. Keikaku Means Plan','Day 5'),(30,'All According to Cake - Response','Must you? Must you really?','Day 5'),(31,'Money in the budget?','I need money to pay for new defenses.','Day 4'),(32,'Talk to me.','Please respond to my emails. We need to talk about future plans.','Day 1'),(33,'Why is no one responding?','Hannibal, Rena, Barney, I need to communicate with you three if we are to succeed. Reply back if you read this.','Day 1'),(34,'Stop ignoring me.','Why am I being ignored?','Day 2'),(35,'I told the boss.','Screw it, I told DA MAN and he about to fire ya\'ll','Day 3'),(36,'What Now?','Does anyone know what we are supposed to do?','Day 1'),(37,'What Now? - Response','Hal, you have to save the people\'s data, then tell us what happens.','Day 1'),(38,'Nuisance','You are a nuisance. Do what I say and we will achieve victory.','Day 1'),(39,'Never!','Green Lantern stands his ground.','Day 1'),(40,'Keep secrets','No one tell the boss that we have internal issues. We will look perfect.','Day 1'),(41,'Fool','Give me your loyalty.','Day 2'),(42,'Nah.','Nah.','Day 2'),(43,'Failure','Give me your soul.','Day 3'),(44,'You can be so stupid.','You have lovely charisma. s','Day 3'),(45,'Perfection','Give me the evidence for the guilty verdict. Also, thank you for the compliment','Day 4'),(46,'Fine.','You do not have to be so demanding. Also, you must not know what s means...','Day 4'),(47,'Thank God, it\'s over.','That tension was unbearable. Let us submit and be done with it.','Day 5'),(48,'Get to work','Start the projects. Send me a message every day.','Day 1'),(49,'Start working together!','Talk to each other!','Day 3'),(50,'YOU\'RE FIRED!','Only one of you is trying, so I\'ll pass her and FIRE YOU!','Day 5'),(51,'Submit!','Give me what you have done.','Day 5'),(52,'No teamwork. Goodbye','I do not see your work. Did you even do it? Crimson Team is also FIRED!!! No work no collaboration','Day 5'),(53,'Day One is done.','Day 1 is done.','Day 1'),(54,'Day One.','Dia Uno.','Day 1'),(55,'Divide the Day One.','See you tomorrow.','Day 1'),(56,'Perfect Day One.','Not a second wasted.','Day 1'),(57,'Not So Perfect Day One.','Just got it!','Day 1'),(58,'Day Two is done.','Day 2 is done.','Day 2'),(59,'Day Two.','Dia Dos.','Day 2'),(60,'Twoday is here.','Here.','Day 2'),(61,'Perfect Day Two.','Please.','Day 2'),(62,'Forever alone.','Just got it!','Day 2'),(63,'Forever alone - Response.','Are you okay?','Day 2'),(64,':}','Never better?','Day 2'),(65,'Day Three is done.','Day 3 is done.','Day 3'),(66,'Day Three.','Dia Tres.','Day 3'),(67,'R.E.S.P.E.C.THREE.','Halfway done.','Day 3'),(68,'Perfect Day Three.','As expected','Day 3'),(69,'Help.','I am done for the day. But I need your help. My group is not talking or working with me or showing up. Please do something.','Day 3'),(70,'On the way.','I will do what I can','Day 3'),(71,'Help Kim','Only one of you is working. Help her now.','Day 3'),(72,'Day Four is done.','Day 4 is done.','Day 4'),(73,'Day Four.','Dia Cuatro.','Day 4'),(74,'Press F to Signal Day Four\'s End','Almost done.','Day 4'),(75,'Perfect Day Four.','We are great.','Day 4'),(76,'No response from them.','I am overworking myself, boss. But today is done.','Day 4'),(77,'Last one more day','Just finish, Kim. I will give you their salaries if they do not help tomorrow.','Day 4'),(78,'Warning','I got nothing from you, today. Why?','Day 1'),(79,'Second warning','Still nothing. Do not ignore me.','Day 2'),(80,'No hope for you.','You cannot pass at this point. This shall be my last message to you. Well, besides your pink slip.','Day 4'),(81,'Day Five is done.','Day 5 is done.','Day 5'),(82,'Day Five.','Dia Cinco.','Day 5'),(83,'Return of the Five','It is done','Day 5'),(84,'Perfect Day Five.','Perfectly finished, as is all things we do.','Day 5'),(85,'I\'m done...','I finished finally. Can I go home and sleep?','Day 5'),(86,'Take five, soldier.','You will have their money, their jobs, and their praise.','Day 5'),(87,'Data Transfer','Send us the data, please.','Day 1'),(88,'Communicate','You all should really speak to each other.','Day 3'),(89,'Help each other!','You have to work together.','Day 3'),(90,'Your account','Kim, just use your individual account. We know your team is not helping you.','Day 3'),(91,'Deadline incoming','Send us the papers. We got the rest.','Day 4'),(92,'Take these.','Here. It was nice working with you.','Day 4'),(93,'Until We Meet Again','Here. It was nice working with you.','Day 5');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `people` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(45) NOT NULL COMMENT 'The name of the person playing.',
  `institution_name` varchar(45) NOT NULL COMMENT 'The institution the player represents.',
  `username` varchar(45) NOT NULL COMMENT 'The in-game username the person is using.',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Bob Brown','UMD','princesspeach12'),(2,'Red Eye','UMD','luigiman45'),(3,'Corona Virus','UMD','wariorules'),(4,'Warrior','UMD','mariomain1'),(5,'Adam Applin','UMD','catchemall890'),(6,'Buster Boost','UMD','pokemart21'),(7,'Cinder Crash','UMD','gymbattler32'),(8,'Draymond DK','UMD','dynamaximum'),(9,'Eve Olve','UMD','metroidfan22'),(10,'Contra Ease','UMD','zerosuit09'),(11,'Kei Kaku','UMD','ridleyistoobig'),(12,'Mordecai Simple','UMD','samuswins365'),(13,'Hannibal Broly','UMD','kingofevil1'),(14,'Barney Miles','UMD','windwaker45'),(15,'Kim Hines','UMD','mastersword22'),(16,'Rena Logan','UMD','triforce100'),(17,'Gangrel','UMD','blooddrinker4'),(18,'Kevin Thorn','UMD','edwardecai'),(19,'Vampiro','UMD','creepydeepy'),(20,'Ariel','UMD','notbellaswan010'),(21,'Charles Wright','UMD','chaoscontroller7'),(22,'Manfred Von Karma','UMD','worldrings7'),(23,'Speed Racer','UMD','superemerald7'),(24,'Harold Jordan','UMD','solemeralds7');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_types`
--

DROP TABLE IF EXISTS `role_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_types` (
  `role_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(45) NOT NULL,
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`role_type_id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `role_types_ibfk_1` FOREIGN KEY (`version_id`) REFERENCES `game_versions` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_types`
--

LOCK TABLES `role_types` WRITE;
/*!40000 ALTER TABLE `role_types` DISABLE KEYS */;
INSERT INTO `role_types` VALUES (1,'Database Administrator',1),(2,'Civic Officer',1),(3,'IT Associate',1),(4,'Emergency Response Specialist',1),(5,'Big Bad Boss',1);
/*!40000 ALTER TABLE `role_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `whole_summary`
--

DROP TABLE IF EXISTS `whole_summary`;
/*!50001 DROP VIEW IF EXISTS `whole_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `whole_summary` AS SELECT 
 1 AS `actor_id`,
 1 AS `actor_name`,
 1 AS `game_position`,
 1 AS `message_participation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `day_five_summary`
--

/*!50001 DROP VIEW IF EXISTS `day_five_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `day_five_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`message_actions`.`game_position` = 'Day 5'))) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`game_position` = 'Day 5') group by `actors`.`actor_id` order by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `day_four_summary`
--

/*!50001 DROP VIEW IF EXISTS `day_four_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `day_four_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`message_actions`.`game_position` = 'Day 4'))) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`game_position` = 'Day 4') group by `actors`.`actor_id` order by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `day_one_summary`
--

/*!50001 DROP VIEW IF EXISTS `day_one_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `day_one_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`message_actions`.`game_position` = 'Day 1'))) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`game_position` = 'Day 1') group by `actors`.`actor_id` order by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `day_three_summary`
--

/*!50001 DROP VIEW IF EXISTS `day_three_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `day_three_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`message_actions`.`game_position` = 'Day 3'))) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`game_position` = 'Day 3') group by `actors`.`actor_id` order by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `day_two_summary`
--

/*!50001 DROP VIEW IF EXISTS `day_two_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `day_two_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`message_actions`.`game_position` = 'Day 2'))) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`game_position` = 'Day 2') group by `actors`.`actor_id` order by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `individual_workers`
--

/*!50001 DROP VIEW IF EXISTS `individual_workers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `individual_workers` AS select `actors`.`person_id` AS `person_id`,`people`.`person_name` AS `person_name`,`actors`.`role_type_id` AS `role_type_id`,`role_types`.`role_type` AS `role_type`,`message_actions`.`game_position` AS `game_position`,`message_actions`.`action_type` AS `action_type`,`message_actions`.`action_time` AS `action_time` from (((`actors` join `people`) join `role_types`) join `message_actions`) where ((`actors`.`person_id` = `people`.`person_id`) and (`actors`.`role_type_id` = `role_types`.`role_type_id`) and (`message_actions`.`actor_id` = `actors`.`actor_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `message_action_detail`
--

/*!50001 DROP VIEW IF EXISTS `message_action_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `message_action_detail` AS select `message_actions`.`actor_id` AS `actor_id`,`message_actions`.`action_type` AS `action_type`,`message_actions`.`game_position` AS `game_position`,`actors`.`actor_name` AS `actor_name`,`actors`.`role_type_id` AS `role_type_id`,`actors`.`person_id` AS `person_id`,`role_types`.`role_type` AS `role_type`,`people`.`username` AS `username` from (((`message_actions` join `actors`) join `role_types`) join `people`) where ((`message_actions`.`actor_id` = `actors`.`actor_id`) and (`actors`.`role_type_id` = `role_types`.`role_type_id`) and (`people`.`person_id` = `actors`.`person_id`)) order by `message_actions`.`actor_id`,`message_actions`.`game_position`,`actors`.`person_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `message_gameday_summary`
--

/*!50001 DROP VIEW IF EXISTS `message_gameday_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `message_gameday_summary` AS select `message_action_detail`.`actor_id` AS `actor_id`,`message_action_detail`.`actor_name` AS `actor_name`,count(0) AS `message_actions`,`message_action_detail`.`game_position` AS `game_position` from `message_action_detail` group by `message_action_detail`.`actor_id`,`message_action_detail`.`game_position` order by `message_action_detail`.`game_position`,`message_action_detail`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `whole_summary`
--

/*!50001 DROP VIEW IF EXISTS `whole_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `whole_summary` AS select `actors`.`actor_id` AS `actor_id`,`actors`.`actor_name` AS `actor_name`,`message_actions`.`game_position` AS `game_position`,(select count(0) from `message_actions` where (`message_actions`.`actor_id` = `actors`.`actor_id`)) AS `message_participation_count` from (`actors` join `message_actions`) where (`message_actions`.`actor_id` = `actors`.`actor_id`) group by `actors`.`actor_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06  1:49:47

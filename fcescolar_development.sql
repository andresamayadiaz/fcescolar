-- MySQL dump 10.13  Distrib 5.6.25, for osx10.9 (x86_64)
--
-- Host: localhost    Database: fcescolar_development
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `approved_subjects`
--

DROP TABLE IF EXISTS `approved_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_dictamination_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_approved_subjects_on_subject_id` (`subject_id`),
  KEY `teacher_dict_id` (`teacher_dictamination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_subjects`
--

LOCK TABLES `approved_subjects` WRITE;
/*!40000 ALTER TABLE `approved_subjects` DISABLE KEYS */;
INSERT INTO `approved_subjects` VALUES (1,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13'),(2,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13'),(3,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13'),(4,3,4,'2015-06-11 18:03:09','2015-06-11 18:03:09'),(5,3,5,'2015-06-11 18:03:09','2015-06-11 18:03:09'),(6,5,7,'2015-06-12 22:09:11','2015-06-12 22:09:11'),(7,5,8,'2015-06-12 22:09:11','2015-06-12 22:09:11'),(8,6,10,'2015-06-12 22:09:50','2015-06-12 22:09:50'),(9,6,9,'2015-06-12 22:09:50','2015-06-12 22:09:50'),(10,4,3,'2015-06-17 13:31:09','2015-06-17 13:31:09'),(11,7,7,'2015-08-27 22:55:40','2015-08-27 22:55:40'),(12,7,8,'2015-08-27 22:55:40','2015-08-27 22:55:40'),(13,7,9,'2015-08-27 22:55:40','2015-08-27 22:55:40'),(14,7,10,'2015-08-27 22:55:40','2015-08-27 22:55:40'),(15,7,11,'2015-08-27 22:55:40','2015-08-27 22:55:40');
/*!40000 ALTER TABLE `approved_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `associated_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audited_changes` text COLLATE utf8_unicode_ci,
  `version` int(11) DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditable_index` (`auditable_id`,`auditable_type`),
  KEY `associated_index` (`associated_id`,`associated_type`),
  KEY `user_index` (`user_id`,`user_type`),
  KEY `index_audits_on_request_uuid` (`request_uuid`),
  KEY `index_audits_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,1,'PersonLivingAddress',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet: testing street 1\nnum_ext: 1234567-5\nnum_int: 1234567-9\ncolonia: Chihuahua\ncp: 555-555\nmunicipio: test\nstate_id: 1\ncountry_id: 1\nphone_emergency: 911-911-911\nperson_id: 1\n',1,NULL,NULL,'8a3d0a0c-bd7c-457e-b2c0-3165a2721f49','2015-06-10 02:12:51'),(2,1,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail: user@example.com\nencrypted_password: \"$2a$10$aaOPeF10aZq8BWs/bimRzO7Nn8j/6YhdAfyC617LwLNktqkYQ06NS\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 21467be58972f7c41e905b1326a0a1fc52a635d182812bdd3c483a250b89ec2c\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 02:12:51.846116385 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,NULL,'8d0ad13c-da44-4165-8cfc-d57f618ed3df','2015-06-10 02:12:51'),(3,1,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nperson_id:\n- \n- 1\n',2,NULL,NULL,'cf6f214e-900d-4eaa-bf44-aa270bb39929','2015-06-10 02:12:51'),(4,1,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nconfirmation_token:\n- 21467be58972f7c41e905b1326a0a1fc52a635d182812bdd3c483a250b89ec2c\n- \nconfirmed_at:\n- \n- 2015-06-10 02:12:52.034360694 Z\n',3,NULL,NULL,'130c4b17-16e7-488c-89c4-e04745595066','2015-06-10 02:12:52'),(5,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- \n- &1 2015-06-10 02:17:23.380788122 Z\ncurrent_sign_in_at:\n- \n- *1\nlast_sign_in_ip:\n- \n- 127.0.0.1\ncurrent_sign_in_ip:\n- \n- 127.0.0.1\nsign_in_count:\n- 0\n- 1\n',4,NULL,'127.0.0.1','8c75273a-3cef-4546-89b9-cdeb5de12a7a','2015-06-10 02:17:23'),(6,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',5,NULL,'127.0.0.1','ed2b7063-f386-4cda-95c6-1abe27080393','2015-06-10 02:17:23'),(7,2,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Test Street I\nnum_ext: \'001\'\nnum_int: \'002\'\ncolonia: Chihuahua\ncp: \'003\'\nmunicipio: Chihuahua\nstate_id: 1\ncountry_id: 1\nphone_emergency: \'004\'\nperson_id: 2\n',1,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:52'),(8,2,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: humberto@gmail.com\nencrypted_password: \"$2a$10$zH7o2WYfK1BXhJxvpCJ.c.cId/sUOKqJKT3P6zB21gwDxSssyY7ja\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 1ffbe1b4b58e4f84342ba43d9d855a09e8b6480229338caaee91ec2ca1f091d6\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 02:54:54.054713210 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:54'),(9,2,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 2\n',2,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:54'),(11,4,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Test Street II\nnum_ext: \'005\'\nnum_int: \'006\'\ncolonia: Chihuahua\ncp: \'007\'\nmunicipio: Chihuahua\nstate_id: 1\ncountry_id: 1\nphone_emergency: \'911\'\nperson_id: 4\n',1,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(12,3,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: julia@teacher.com\nencrypted_password: \"$2a$10$S7hnpWxiZX71tqHHUYTTFOVYVj.txvghguE3lQ4iu85yLg8rgXVSi\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 8167a2058afa03fd2d364caf1e02ccc4705d99aa178a06db530443e5fd1cf972\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 03:07:05.588880006 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(13,3,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 4\n',2,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(14,1,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'create','---\nempresa: \npuesto: \ncalle: \nmunicipio: \nnum_ext: \nnum_int: \ncolonia: \ncp: \nstate_id: \ncountry_id: \nperson_id: 1\n',1,NULL,'127.0.0.1','634c6336-9087-45e5-810a-670141e7f97e','2015-06-10 03:09:40'),(15,1,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'update','---\nempresa:\n- \n- \'\'\npuesto:\n- \n- \'\'\ncalle:\n- \n- \'\'\nmunicipio:\n- \n- \'\'\nnum_ext:\n- \n- \'\'\nnum_int:\n- \n- \'\'\ncolonia:\n- \n- \'\'\n',2,NULL,'127.0.0.1','4cea366c-787a-47b3-8677-0be99b15642a','2015-06-10 03:10:05'),(16,1,'User',NULL,NULL,1,'User',NULL,'update','---\ncurrent_sign_in_at:\n- 2015-06-10 02:17:23.000000000 Z\n- 2015-06-10 13:50:10.210536000 Z\nsign_in_count:\n- 1\n- 2\n',6,NULL,'127.0.0.1','d29d672b-542a-49cf-ad10-18e489b1a541','2015-06-10 13:50:10'),(17,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',7,NULL,'127.0.0.1','1b66ea36-5edb-4dc6-acb9-e40b8a523ba7','2015-06-10 15:04:04'),(18,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-10 02:17:23.000000000 Z\n- &1 2015-06-10 13:50:10.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-11 16:57:41.278204000 Z\nsign_in_count:\n- 2\n- 3\n',8,NULL,'127.0.0.1','9434ce7f-955b-49b6-9f69-d26631d5479f','2015-06-11 16:57:41'),(19,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',9,NULL,'127.0.0.1','1c5cf296-3f75-4540-aac1-3d8b5b2b786b','2015-06-11 16:57:41'),(20,2,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'create','---\nempresa: Piloto Automático SA de CV\npuesto: Director Comercial\ncalle: \'\'\nmunicipio: \'\'\nnum_ext: \'\'\nnum_int: \'\'\ncolonia: \'\'\ncp: \nstate_id: 1\ncountry_id: 1\nperson_id: 2\n',1,NULL,'127.0.0.1','b6c795eb-aac8-48a3-9e83-f96baa80c227','2015-06-11 16:59:12'),(21,1,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'update','---\nstreet:\n- testing street 1\n- testing street 2\n',2,NULL,'127.0.0.1','2ea4a247-409f-45fb-82ec-3cae7f8cc038','2015-06-11 17:20:58'),(22,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',10,NULL,'127.0.0.1','580a1568-4816-40a6-9d50-6781d5766e4d','2015-06-11 18:24:28'),(23,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-10 13:50:10.000000000 Z\n- &1 2015-06-11 16:57:41.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-12 13:40:36.324384000 Z\nsign_in_count:\n- 3\n- 4\n',11,NULL,'127.0.0.1','949362c7-da25-4bec-9286-627a783a05c1','2015-06-12 13:40:36'),(24,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',12,NULL,'127.0.0.1','a2ada98b-9721-4f8e-bb22-90213412d275','2015-06-12 13:40:36'),(25,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',13,NULL,'127.0.0.1','2d0cf8dc-dc7f-44f2-be8b-958ec72b3797','2015-06-12 15:08:57'),(26,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-11 16:57:41.000000000 Z\n- &1 2015-06-12 13:40:36.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-12 19:58:50.325251000 Z\nsign_in_count:\n- 4\n- 5\n',14,NULL,'127.0.0.1','b5e0f8ce-2ac4-450d-a36b-a2151d7cf81e','2015-06-12 19:58:50'),(27,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',15,NULL,'127.0.0.1','20ca08a9-4661-4a8f-8732-07da9606f304','2015-06-12 19:58:50'),(28,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-12 13:40:36.000000000 Z\n- &1 2015-06-12 19:58:50.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-15 13:49:54.161219000 Z\nsign_in_count:\n- 5\n- 6\n',16,NULL,'127.0.0.1','21f56f27-55fa-43e2-835b-d71afb34e5cb','2015-06-15 13:49:54'),(29,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-12 19:58:50.000000000 Z\n- &1 2015-06-15 13:49:54.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-16 13:37:41.380029000 Z\nsign_in_count:\n- 6\n- 7\n',17,NULL,'127.0.0.1','8fa928e8-9ec5-4771-a2a7-f95c3975ec25','2015-06-16 13:37:41'),(30,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-15 13:49:54.000000000 Z\n- &1 2015-06-16 13:37:41.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-17 13:26:51.061223000 Z\nsign_in_count:\n- 7\n- 8\n',18,NULL,'127.0.0.1','9e1e169f-0211-4e15-b9f2-b1b08bb78a4e','2015-06-17 13:26:51'),(31,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',19,NULL,'127.0.0.1','15a362db-5791-4871-831e-c8194328d6c2','2015-06-17 13:52:12'),(32,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-16 13:37:41.000000000 Z\n- &1 2015-06-17 13:26:51.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-19 13:53:58.728239000 Z\nsign_in_count:\n- 8\n- 9\n',20,NULL,'127.0.0.1','608a2516-83fe-433b-b4e3-85f4a0fae81c','2015-06-19 13:53:58'),(33,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',21,NULL,'127.0.0.1','9acf9887-3501-4d44-9d7a-805a41eb5ea0','2015-06-19 13:53:58'),(34,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-17 13:26:51.000000000 Z\n- &1 2015-06-19 13:53:58.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-22 14:40:07.823534000 Z\nsign_in_count:\n- 9\n- 10\n',22,NULL,'127.0.0.1','c81caac9-e9b0-49c2-88c1-7c007f2c686a','2015-06-22 14:40:07'),(35,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-19 13:53:58.000000000 Z\n- &1 2015-06-22 14:40:07.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-23 13:53:00.815518000 Z\nsign_in_count:\n- 10\n- 11\n',23,NULL,'127.0.0.1','dc9cd679-130c-4098-989d-81059dfc5d5f','2015-06-23 13:53:00'),(36,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',24,NULL,'127.0.0.1','8a316348-f34b-4301-a3f2-3d7d2dcf5755','2015-06-23 14:00:40'),(37,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-22 14:40:07.000000000 Z\n- &1 2015-06-23 13:53:00.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-24 13:29:51.626617000 Z\nsign_in_count:\n- 11\n- 12\n',25,NULL,'127.0.0.1','08cb58e5-041d-44e3-8add-ef10f87eed5c','2015-06-24 13:29:51'),(38,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',26,NULL,'127.0.0.1','30d42d3e-4f24-4202-9222-5d8accbafcbd','2015-06-24 13:29:51'),(39,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-23 13:53:00.000000000 Z\n- &1 2015-06-24 13:29:51.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-25 13:37:28.160299000 Z\nsign_in_count:\n- 12\n- 13\n',27,NULL,'127.0.0.1','e576735d-6c5b-4f1d-a284-08b81789f2b8','2015-06-25 13:37:28'),(40,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-24 13:29:51.000000000 Z\n- &1 2015-06-25 13:37:28.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-30 13:55:34.608711000 Z\nsign_in_count:\n- 13\n- 14\n',28,NULL,'127.0.0.1','6aa2b33c-2110-41f5-9e51-0b9a7d8bfd1f','2015-06-30 13:55:34'),(41,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-25 13:37:28.000000000 Z\n- &1 2015-06-30 13:55:34.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-06-30 15:37:27.408025000 Z\nsign_in_count:\n- 14\n- 15\n',29,NULL,'127.0.0.1','c38299d6-be72-4ece-86e1-bfc9e95fbddd','2015-06-30 15:37:27'),(42,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-30 13:55:34.000000000 Z\n- &1 2015-06-30 15:37:27.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-01 13:54:56.321187000 Z\nsign_in_count:\n- 15\n- 16\n',30,NULL,'127.0.0.1','f8f96d50-52cb-402e-b75c-73eda319ee25','2015-07-01 13:54:56'),(43,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',31,NULL,'127.0.0.1','689e02d9-2a23-4aa7-965c-01b1efa0eb55','2015-07-01 14:24:43'),(44,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-06-30 15:37:27.000000000 Z\n- &1 2015-07-01 13:54:56.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-01 14:24:49.755834000 Z\nsign_in_count:\n- 16\n- 17\n',32,NULL,'127.0.0.1','fbf465c5-074d-4487-a672-b5f30695b5d3','2015-07-01 14:24:49'),(45,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\nactive_franchise:\n- \n- 2\n',33,NULL,'127.0.0.1','d51eda02-da18-4af2-8e67-5ea93a1c8e1e','2015-07-01 14:24:56'),(46,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-01 13:54:56.000000000 Z\n- &1 2015-07-01 14:24:49.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-03 13:47:56.703415000 Z\nsign_in_count:\n- 17\n- 18\n',34,NULL,'127.0.0.1','511f3d04-09bd-446e-aaab-9fdca2fe71c7','2015-07-03 13:47:56'),(47,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',35,NULL,'127.0.0.1','cc892ba3-8689-4d8f-9220-a8d366f881a2','2015-07-03 13:48:45'),(48,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-01 14:24:49.000000000 Z\n- &1 2015-07-03 13:47:56.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-03 13:50:56.943984000 Z\nsign_in_count:\n- 18\n- 19\n',36,NULL,'127.0.0.1','a3165ecc-79a1-49ac-a283-5e4ab85b8945','2015-07-03 13:50:56'),(49,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',37,NULL,'127.0.0.1','2b32d3c5-991e-4169-92e9-8f586a8dff6a','2015-07-03 13:51:03'),(50,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-03 13:47:56.000000000 Z\n- &1 2015-07-03 13:50:56.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-06 13:55:29.680015000 Z\nsign_in_count:\n- 19\n- 20\n',38,NULL,'127.0.0.1','23618783-e4f9-4838-90f6-9ed06ce26489','2015-07-06 13:55:29'),(51,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',39,NULL,'127.0.0.1','a6d82170-bb7c-47f3-99f5-43e6d2c09c3e','2015-07-06 14:08:23'),(52,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-03 13:50:56.000000000 Z\n- &1 2015-07-06 13:55:29.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-09 13:54:01.530663000 Z\nsign_in_count:\n- 20\n- 21\n',40,NULL,'127.0.0.1','853a3976-268f-4fd8-87aa-9981b61833e6','2015-07-09 13:54:01'),(53,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',41,NULL,'127.0.0.1','60d50390-d788-4c4c-b173-ba19a9d97145','2015-07-09 13:54:07'),(54,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-06 13:55:29.000000000 Z\n- &1 2015-07-09 13:54:01.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-10 14:02:33.260500000 Z\nsign_in_count:\n- 21\n- 22\n',42,NULL,'127.0.0.1','475c2a23-e40e-4ae8-b100-667385bbb3b2','2015-07-10 14:02:33'),(55,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',43,NULL,'127.0.0.1','5c87a599-fd9c-45ab-9b8b-5c0a1a398abd','2015-07-10 14:02:58'),(56,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-09 13:54:01.000000000 Z\n- &1 2015-07-10 14:02:33.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-20 13:33:39.831738000 Z\nsign_in_count:\n- 22\n- 23\n',44,NULL,'127.0.0.1','85b6dc2b-316a-4ea4-9c85-970e21939dea','2015-07-20 13:33:39'),(57,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',45,NULL,'127.0.0.1','fe1c03c9-972a-4cea-bf1b-282699c05041','2015-07-20 13:33:45'),(58,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-10 14:02:33.000000000 Z\n- &1 2015-07-20 13:33:39.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-07-26 21:09:09.880481000 Z\nsign_in_count:\n- 23\n- 24\n',46,NULL,'127.0.0.1','00a37759-2258-4647-b13c-9e552cc53ecb','2015-07-26 21:09:09'),(59,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-20 13:33:39.000000000 Z\n- &1 2015-07-26 21:09:09.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-01 21:34:46.322154000 Z\nsign_in_count:\n- 24\n- 25\n',47,NULL,'127.0.0.1','caa6f785-e773-45c8-adf3-2cde81e4bf3b','2015-08-01 21:34:46'),(60,5,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Calle\nnum_ext: \'1234\'\nnum_int: \'\'\ncolonia: Centro\ncp: \'64000\'\nmunicipio: Municipio\nstate_id: 3\ncountry_id: 1\nphone_emergency: \'456789098765\'\nperson_id: 5\n',1,NULL,'127.0.0.1','b63210f7-ca4e-4ac3-ad34-13e0c930ba7e','2015-08-01 22:17:47'),(61,4,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: hola@hola.com\nencrypted_password: \"$2a$10$kuNy4Qvw3WMiIz7QrzVleeQiPlL7gsTbssmDXdLJgBCHkuU1krNwm\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 8656862ace0ef8f09d8baacd758e9ce53574423cea7afe85395f0447151e5984\nconfirmed_at: \nconfirmation_sent_at: 2015-08-01 22:17:47.491124000 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','b63210f7-ca4e-4ac3-ad34-13e0c930ba7e','2015-08-01 22:17:47'),(62,4,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 5\n',2,NULL,'127.0.0.1','b63210f7-ca4e-4ac3-ad34-13e0c930ba7e','2015-08-01 22:17:47'),(63,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-07-26 21:09:09.000000000 Z\n- &1 2015-08-01 21:34:46.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-08 15:58:29.243376000 Z\nsign_in_count:\n- 25\n- 26\n',48,NULL,'127.0.0.1','3fb67728-c1e4-400d-8ae5-e58f439984b8','2015-08-08 15:58:29'),(64,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',49,NULL,'127.0.0.1','45b43ef5-bc69-432f-b84a-b941a213b8ac','2015-08-08 16:06:18'),(65,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-01 21:34:46.000000000 Z\n- &1 2015-08-08 15:58:29.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-08 16:06:25.275590000 Z\nsign_in_count:\n- 26\n- 27\n',50,NULL,'127.0.0.1','67e35eb4-1f7d-4b4f-830d-6728b07f2f31','2015-08-08 16:06:25'),(66,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- teacher\n',51,NULL,'127.0.0.1','97072091-7ac6-4eac-9f46-ddf83d7cf7bf','2015-08-08 16:06:34'),(67,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-08 15:58:29.000000000 Z\n- &1 2015-08-08 16:06:25.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-20 14:14:40.404874000 Z\nsign_in_count:\n- 27\n- 28\n',52,NULL,'127.0.0.1','7a561fdf-ea28-485e-b4ab-1c59ec062b0e','2015-08-20 14:14:40'),(68,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- teacher\n- \n',53,NULL,'127.0.0.1','ecfcdd73-e975-4134-b5ab-13618cc32b77','2015-08-20 14:17:45'),(69,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-08 16:06:25.000000000 Z\n- &1 2015-08-20 14:14:40.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-20 14:17:52.454467000 Z\nsign_in_count:\n- 28\n- 29\n',54,NULL,'127.0.0.1','8cbe6701-d7a6-47c3-b40a-1425bbd25625','2015-08-20 14:17:52'),(70,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',55,NULL,'127.0.0.1','a642489a-1392-407b-83fd-a07fa0d6f77a','2015-08-20 14:17:57'),(71,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',56,NULL,'127.0.0.1','12585d34-da06-4224-bd33-2da7a35177bc','2015-08-20 14:26:10'),(72,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-20 14:14:40.000000000 Z\n- &1 2015-08-20 14:17:52.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-21 13:43:48.103550000 Z\nsign_in_count:\n- 29\n- 30\n',57,NULL,'127.0.0.1','c6d5ee1b-4b53-424f-a2ac-39314b362d32','2015-08-21 13:43:48'),(73,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',58,NULL,'127.0.0.1','5c24a28b-9d03-4549-82fb-1a6e537812e0','2015-08-21 13:43:52'),(74,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-20 14:17:52.000000000 Z\n- &1 2015-08-21 13:43:48.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-27 13:43:39.047986000 Z\nsign_in_count:\n- 30\n- 31\n',59,NULL,'127.0.0.1','d2480972-45cb-4179-bc53-dd5011091368','2015-08-27 13:43:39'),(75,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',60,NULL,'127.0.0.1','2164dbe8-e83f-4a65-a978-85ced1f8e8f4','2015-08-27 13:44:47'),(76,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-21 13:43:48.000000000 Z\n- &1 2015-08-27 13:43:39.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-27 13:44:53.136013000 Z\nsign_in_count:\n- 31\n- 32\n',61,NULL,'127.0.0.1','833591af-c11f-4b43-ada6-2134c890ad4c','2015-08-27 13:44:53'),(77,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',62,NULL,'127.0.0.1','059977af-e2a7-4ee9-a975-8d350fecc16b','2015-08-27 13:50:15'),(78,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-27 13:43:39.000000000 Z\n- &1 2015-08-27 13:44:53.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-27 20:30:50.283495000 Z\nsign_in_count:\n- 32\n- 33\n',63,NULL,'127.0.0.1','87b239b4-f062-4010-b8b7-ed3f53afaec6','2015-08-27 20:30:50'),(79,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',64,NULL,'127.0.0.1','f83a3a39-7ede-425e-8545-b233090f5777','2015-08-27 21:08:39'),(80,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-27 13:44:53.000000000 Z\n- &1 2015-08-27 20:30:50.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-27 21:12:20.713851000 Z\nsign_in_count:\n- 33\n- 34\n',65,NULL,'127.0.0.1','21d22fec-d75a-42a9-8bd6-a21f128b888c','2015-08-27 21:12:20'),(81,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',66,NULL,'127.0.0.1','fb78ebb6-6534-4871-97a4-a438de20c8c0','2015-08-27 21:13:00'),(82,6,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Lomas del Valle\nnum_ext: \'445\'\nnum_int: \'\'\ncolonia: Del Valle\ncp: \'66280\'\nmunicipio: San Pedro Garza García\nstate_id: 1\ncountry_id: 1\nphone_emergency: \'8115315854\'\nperson_id: 6\n',1,NULL,'127.0.0.1','3392878c-e97a-4b9c-b920-70c71443a57c','2015-08-27 22:37:17'),(83,3,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'create','---\nempresa: FOCIM MTY CENTRO\npuesto: \'\'\ncalle: \'\'\nmunicipio: \'\'\nnum_ext: \'\'\nnum_int: \'\'\ncolonia: \'\'\ncp: \nstate_id: \ncountry_id: \nperson_id: 6\n',1,NULL,'127.0.0.1','3392878c-e97a-4b9c-b920-70c71443a57c','2015-08-27 22:37:17'),(84,5,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: obed@focim.edu.mx\nencrypted_password: \"$2a$10$A4efGqseSwlDcsRnmqj/z.JcyqogpD2C9rSWJ5kmcYOQy08yQJHiC\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 166d65ef7355da09118c2fa503e0fb4b3e6df32997245e6b767f48cd4616e9e5\nconfirmed_at: \nconfirmation_sent_at: 2015-08-27 22:37:18.214528000 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','3392878c-e97a-4b9c-b920-70c71443a57c','2015-08-27 22:37:18'),(85,5,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 6\n',2,NULL,'127.0.0.1','3392878c-e97a-4b9c-b920-70c71443a57c','2015-08-27 22:37:18'),(86,6,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'update','---\nnum_ext:\n- \'445\'\n- \'447\'\nmunicipio:\n- San Pedro Garza García\n- San Pedro\n',2,NULL,'127.0.0.1','fe2b0ab3-f0e2-46aa-89ad-b22e1e2e984c','2015-08-27 22:38:45'),(87,6,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'update','---\nphone_emergency:\n- \'8115315854\'\n- \'8115315855\'\n',3,NULL,'127.0.0.1','f2205085-55f4-4584-9a3e-c54c18c0a16b','2015-08-27 22:39:46'),(88,5,'User',NULL,NULL,1,'User',NULL,'update','---\nconfirmation_token:\n- 166d65ef7355da09118c2fa503e0fb4b3e6df32997245e6b767f48cd4616e9e5\n- b8db58c98e7e4e203da1ac6f3137e96ab622baac9dd663496b8e78901632b85c\nconfirmation_sent_at:\n- 2015-08-27 22:37:18.000000000 Z\n- 2015-08-27 22:52:03.126708000 Z\n',3,NULL,'127.0.0.1','06539f26-96bb-46ea-abc8-4b905d7d1f1e','2015-08-27 22:52:03'),(89,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',67,NULL,'127.0.0.1','5abfb9a0-5767-4680-a840-ef8c5534fec6','2015-08-27 23:02:03'),(90,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-27 20:30:50.000000000 Z\n- &1 2015-08-27 21:12:20.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-27 23:02:24.126480000 Z\nsign_in_count:\n- 34\n- 35\n',68,NULL,'127.0.0.1','2147862b-8e2f-4713-a051-6219620d9370','2015-08-27 23:02:24'),(91,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',69,NULL,'127.0.0.1','cff8a737-9ad0-4006-b911-0ecbb7eb5e60','2015-08-27 23:02:36'),(92,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-27 21:12:20.000000000 Z\n- &1 2015-08-27 23:02:24.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-28 16:19:52.778133000 Z\nsign_in_count:\n- 35\n- 36\n',70,NULL,'127.0.0.1','184baaf3-58b9-4405-a921-57f0a3ccf06f','2015-08-28 16:19:52'),(93,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',71,NULL,'127.0.0.1','4b815832-8bbd-4571-a78d-724c0a6ad3f4','2015-08-28 16:36:38'),(94,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-27 23:02:24.000000000 Z\n- &1 2015-08-28 16:19:52.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-28 16:36:43.901701000 Z\nsign_in_count:\n- 36\n- 37\n',72,NULL,'127.0.0.1','ce7c87ab-e87d-4b8c-b557-46e7b9d3b6c4','2015-08-28 16:36:43'),(95,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- teacher\n',73,NULL,'127.0.0.1','3b2b6ff2-ffae-468a-a935-609a23a01bc7','2015-08-28 16:36:47'),(96,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- teacher\n- super_administrator\n',74,NULL,'127.0.0.1','0ab43164-b0a4-4de5-89ec-9e2f27dd0ede','2015-08-28 16:37:56'),(97,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-28 16:19:52.000000000 Z\n- &1 2015-08-28 16:36:43.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-31 14:01:10.689293000 Z\nsign_in_count:\n- 37\n- 38\n',75,NULL,'127.0.0.1','c1c3feda-62e7-48c9-ae27-ac4469f31315','2015-08-31 14:01:10'),(98,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- super_administrator\n- \n',76,NULL,'127.0.0.1','9cd71ad4-0aaa-48b0-ba7d-f56f3eb8e9f0','2015-08-31 14:02:18'),(99,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- 2015-08-28 16:36:43.000000000 Z\n- &1 2015-08-31 14:01:10.000000000 Z\ncurrent_sign_in_at:\n- *1\n- 2015-08-31 14:02:23.651561000 Z\nsign_in_count:\n- 38\n- 39\n',77,NULL,'127.0.0.1','7b4432a7-3d72-48f3-b668-97fce9724b75','2015-08-31 14:02:23'),(100,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- teacher\n',78,NULL,'127.0.0.1','28284081-15cc-4cad-8ee9-f6368ab7c391','2015-08-31 14:02:28'),(101,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- teacher\n- \n',79,NULL,'127.0.0.1','8e070236-4cf5-45e3-9154-278e18017463','2015-08-31 14:04:04');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_official_docs`
--

DROP TABLE IF EXISTS `background_official_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background_official_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsive_letter` text COLLATE utf8_unicode_ci,
  `responsive_due_days` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_background_official_docs_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_official_docs`
--

LOCK TABLES `background_official_docs` WRITE;
/*!40000 ALTER TABLE `background_official_docs` DISABLE KEYS */;
INSERT INTO `background_official_docs` VALUES (1,NULL,'Acta de Nacimiento','<p><span style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 19.999979019165px; white-space: nowrap; background-color: rgb(249, 249, 249);\">Acta de Nacimiento:&nbsp;</span>@@person_fullname@@</p>\r\n',30,1,'2015-06-10 02:26:18','2015-06-10 02:27:53'),(2,NULL,'CURP','<p>CURP:&nbsp;<span style=\"line-height: 20.7999992370605px;\">@@person_fullname@@</span><span style=\"line-height: 20.7999992370605px;\">​</span></p>\r\n',90,1,'2015-06-10 02:28:10','2015-06-10 02:28:10'),(3,NULL,'Titulo de Licenciatura','<p>@@usuario_nombre@@</p>\r\n',120,1,'2015-06-12 22:03:05','2015-06-12 22:03:05');
/*!40000 ALTER TABLE `background_official_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_official_docs_schedules`
--

DROP TABLE IF EXISTS `background_official_docs_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background_official_docs_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `background_official_doc_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_background_official_docs_schedules_on_schedule_id` (`schedule_id`),
  KEY `official_doc_id` (`background_official_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_official_docs_schedules`
--

LOCK TABLES `background_official_docs_schedules` WRITE;
/*!40000 ALTER TABLE `background_official_docs_schedules` DISABLE KEYS */;
INSERT INTO `background_official_docs_schedules` VALUES (1,1,1),(2,2,1),(3,1,2),(4,1,3),(5,1,4),(6,3,5),(7,3,6);
/*!40000 ALTER TABLE `background_official_docs_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campuses`
--

DROP TABLE IF EXISTS `campuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `number_of_classrooms` int(11) DEFAULT NULL,
  `franchise_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_campuses_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campuses`
--

LOCK TABLES `campuses` WRITE;
/*!40000 ALTER TABLE `campuses` DISABLE KEYS */;
INSERT INTO `campuses` VALUES (1,'Delicias Matriz','Calle #123, Col. Centro, C.P. 64000, Delicias, Chih., México',12,1,'2015-06-10 02:21:19','2015-06-10 02:21:19'),(2,'Centro Xicotencatl','Centro de Monterrey',20,2,'2015-07-06 14:02:40','2015-07-06 14:02:40'),(3,'Monterrey Centro','Xicotencatl 975 bla bla bla',20,3,'2015-08-27 21:16:44','2015-08-27 21:16:44'),(4,'Apodaca','Apodaca, N.L.',5,3,'2015-08-28 16:36:33','2015-08-28 16:36:33');
/*!40000 ALTER TABLE `campuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `rvoe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `study_level_id` int(11) DEFAULT NULL,
  `serie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clave_estadistica` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clave_dgp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auth_file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_file_file_size` int(11) DEFAULT NULL,
  `auth_file_updated_at` datetime DEFAULT NULL,
  `franchise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_careers_on_study_level_id` (`study_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'MATH DOCTOR',1,'MATDRVOE',1,'MATD','MATHDOC','MATHDOC','2015-06-10 02:44:49','2015-06-10 02:44:49','blank.pdf','application/pdf',8848,'2015-06-10 02:44:49',NULL),(2,'Ing. Desarrollo Software',1,'RVOE123',1,'SERIE','CLAVEEST-','CLAVEDGP-','2015-06-11 17:01:41','2015-06-11 17:01:41','GRUPO_SIERRA_PRESENTACION_red.pdf','application/pdf',254559,'2015-06-11 17:01:41',NULL),(3,'Maestria XYZ',1,'AM-II 050/2007',1,'1','B417518U2','B417124BB40','2015-06-12 21:54:12','2015-08-27 21:26:44','ArticuloIndizadoISI-ScopusArbor2013-libre.pdf','application/pdf',236089,'2015-06-12 21:54:12',NULL),(4,'Maestria Test 123',1,'RVOE123',1,'SERIE','CLAVE1','CLAVE2','2015-06-19 13:57:01','2015-06-19 13:57:01','Getting_Started.pdf','application/pdf',127748,'2015-06-19 13:57:01',NULL),(5,'Maestría en Educación con Orientación en Didáctica Constructivista',1,'6789098',1,'MTYP1A','34567876','234567654','2015-08-27 21:29:48','2015-08-27 21:29:48','PyMEs__las_ventajas_de_tener_un_ERP_en_la_nube___Palermonline_Noticias.pdf','application/pdf',173855,'2015-08-27 21:29:48',NULL);
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_subjects`
--

DROP TABLE IF EXISTS `careers_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers_subjects` (
  `career_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  KEY `index_careers_subjects_on_career_id` (`career_id`),
  KEY `index_careers_subjects_on_subject_id` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers_subjects`
--

LOCK TABLES `careers_subjects` WRITE;
/*!40000 ALTER TABLE `careers_subjects` DISABLE KEYS */;
INSERT INTO `careers_subjects` VALUES (1,3),(2,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(3,10),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,10),(5,7),(5,8),(5,9),(5,10),(5,11);
/*!40000 ALTER TABLE `careers_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `consecutive` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_classrooms_on_franchise_id` (`franchise_id`),
  KEY `index_classrooms_on_campus_id` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,1,1,'MATH CLASS',20,1,1,'2015-06-10 02:40:16','2015-06-10 02:40:16'),(2,1,1,'HISTORY CLASS',20,2,1,'2015-06-10 02:40:46','2015-06-10 02:40:46'),(3,1,1,'1',32,3,1,'2015-06-12 21:34:00','2015-06-12 21:34:00'),(4,1,1,'2',32,4,1,'2015-06-12 21:34:09','2015-06-12 21:34:09'),(5,1,1,'3',32,5,1,'2015-06-12 21:34:18','2015-06-12 21:34:18'),(6,2,2,'Sala 8',10,1,1,'2015-07-06 14:07:31','2015-07-06 14:07:31'),(7,2,2,'Sala 9',5,2,1,'2015-07-06 14:07:45','2015-07-06 14:07:45'),(8,2,2,'Laboratorio de Robótica',10,3,1,'2015-07-06 14:07:59','2015-07-06 14:07:59'),(9,3,3,'Sala de Juntas',10,1,1,'2015-08-27 23:34:37','2015-08-27 23:34:37');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms_schedules`
--

DROP TABLE IF EXISTS `classrooms_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classrooms_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_classrooms_schedules_on_classroom_id` (`classroom_id`),
  KEY `index_classrooms_schedules_on_schedule_id` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms_schedules`
--

LOCK TABLES `classrooms_schedules` WRITE;
/*!40000 ALTER TABLE `classrooms_schedules` DISABLE KEYS */;
INSERT INTO `classrooms_schedules` VALUES (1,1,1),(2,1,2),(3,2,2),(4,1,3),(5,3,4),(6,4,4),(7,5,4),(8,3,5),(9,4,5),(10,5,5),(11,3,6),(12,4,6),(13,5,6);
/*!40000 ALTER TABLE `classrooms_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_telephones`
--

DROP TABLE IF EXISTS `contact_telephones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_telephones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contact_telephones_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_telephones`
--

LOCK TABLES `contact_telephones` WRITE;
/*!40000 ALTER TABLE `contact_telephones` DISABLE KEYS */;
INSERT INTO `contact_telephones` VALUES (1,1,'8115315854','Celular','2015-06-11 17:13:38','2015-06-11 17:13:38'),(2,6,'5351632','Trabajo','2015-08-27 22:37:17','2015-08-27 22:37:17');
/*!40000 ALTER TABLE `contact_telephones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_template_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contracts_on_contracts_template_id` (`contracts_template_id`),
  KEY `index_contracts_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,1,'2015-06-24 13:51:47','2015-06-24 13:51:47',NULL),(2,1,6,'2015-08-28 16:24:35','2015-08-28 16:24:35','2015-08-31');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts_templates`
--

DROP TABLE IF EXISTS `contracts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `serie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consecutive_init` int(11) DEFAULT NULL,
  `consecutive_next` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contracts_templates_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_templates`
--

LOCK TABLES `contracts_templates` WRITE;
/*!40000 ALTER TABLE `contracts_templates` DISABLE KEYS */;
INSERT INTO `contracts_templates` VALUES (1,NULL,'Contrato de Crédito Licenciatura Tipo A','<p>&nbsp;das das das</p>\r\n\r\n<p>d <strong>as dasdasdas</strong></p>\r\n\r\n<p>sdsdasd&nbsp;</p>\r\n\r\n<p>CRLA: @@person_fullname@@</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','CRLA',805,806,1,'2015-06-10 02:30:59','2015-08-28 16:24:35');
/*!40000 ALTER TABLE `contracts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'México',NULL,'2015-06-10 02:12:50','2015-08-27 20:31:46');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricular_lines`
--

DROP TABLE IF EXISTS `curricular_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricular_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curricular_lines_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricular_lines`
--

LOCK TABLES `curricular_lines` WRITE;
/*!40000 ALTER TABLE `curricular_lines` DISABLE KEYS */;
INSERT INTO `curricular_lines` VALUES (1,NULL,'ABC',NULL,'2015-06-10 02:34:19','2015-06-10 02:34:19'),(2,NULL,'Didáctica Constructivista',NULL,'2015-06-12 21:44:07','2015-06-12 21:44:07'),(3,NULL,'Metodología',NULL,'2015-06-12 21:44:14','2015-06-12 21:44:14'),(4,NULL,'Investigación',NULL,'2015-06-12 21:44:20','2015-06-12 21:44:20');
/*!40000 ALTER TABLE `curricular_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_achievements_categories`
--

DROP TABLE IF EXISTS `degree_achievements_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_achievements_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `franchise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_achievements_categories`
--

LOCK TABLES `degree_achievements_categories` WRITE;
/*!40000 ALTER TABLE `degree_achievements_categories` DISABLE KEYS */;
INSERT INTO `degree_achievements_categories` VALUES (1,'Prácticas Profesionales',1,'2015-06-10 02:24:51','2015-06-10 02:24:51',NULL),(2,'Tesis de Maestría',1,'2015-06-12 22:03:49','2015-06-12 22:03:49',NULL),(3,'Programa de Excelencia Académica',1,'2015-08-27 21:58:18','2015-08-27 21:58:18',NULL);
/*!40000 ALTER TABLE `degree_achievements_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_achievements_categories_schedules`
--

DROP TABLE IF EXISTS `degree_achievements_categories_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_achievements_categories_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_achievements_category_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_degree_achievements_categories_schedules_on_schedule_id` (`schedule_id`),
  KEY `degree_category_id` (`degree_achievements_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_achievements_categories_schedules`
--

LOCK TABLES `degree_achievements_categories_schedules` WRITE;
/*!40000 ALTER TABLE `degree_achievements_categories_schedules` DISABLE KEYS */;
INSERT INTO `degree_achievements_categories_schedules` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,3,6);
/*!40000 ALTER TABLE `degree_achievements_categories_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci NOT NULL,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_students`
--

DROP TABLE IF EXISTS `enrolled_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_detail_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enrolled_students_on_group_detail_id` (`group_detail_id`),
  KEY `index_enrolled_students_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_students`
--

LOCK TABLES `enrolled_students` WRITE;
/*!40000 ALTER TABLE `enrolled_students` DISABLE KEYS */;
INSERT INTO `enrolled_students` VALUES (1,1,2,NULL,'2015-06-10 03:19:43','2015-06-10 03:19:43');
/*!40000 ALTER TABLE `enrolled_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franchises`
--

DROP TABLE IF EXISTS `franchises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franchises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clave_dgp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchises`
--

LOCK TABLES `franchises` WRITE;
/*!40000 ALTER TABLE `franchises` DISABLE KEYS */;
INSERT INTO `franchises` VALUES (1,'Chihuahua FOCIM 1','CHIDGP838383','-','2015-06-10 02:12:50','2015-06-10 02:12:50'),(2,'Monterrey','MTY123','Xicotencatl 123','2015-06-25 13:41:59','2015-06-25 13:41:59'),(3,'MTY 2','MTYFOCIM','Xicotencatls 97790','2015-08-27 21:14:15','2015-08-27 21:14:15');
/*!40000 ALTER TABLE `franchises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_details`
--

DROP TABLE IF EXISTS `group_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `weekday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `time_slot_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer_id` int(11) DEFAULT NULL,
  `closed_at` date DEFAULT NULL,
  `custom_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_details_on_group_id` (`group_id`),
  KEY `index_group_details_on_subject_id` (`subject_id`),
  KEY `index_group_details_on_classroom_id` (`classroom_id`),
  KEY `index_group_details_on_time_slot_id` (`time_slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_details`
--

LOCK TABLES `group_details` WRITE;
/*!40000 ALTER TABLE `group_details` DISABLE KEYS */;
INSERT INTO `group_details` VALUES (1,1,'2013','Jan - Apr',3,'Monday',1,1,'2015-07-01 13:55:22','2015-07-01 13:55:22',4,'Open',NULL,NULL,'2013-1'),(2,1,'2013','May - Aug',3,'Tuesday',2,2,'2015-07-01 13:55:22','2015-07-01 13:55:22',2,'Open',NULL,NULL,'2013-2'),(3,1,'2013','Sep - Dec',3,'Wednesday',3,3,'2015-07-01 13:55:22','2015-07-01 13:55:22',4,'Open',NULL,NULL,'2013-3'),(4,2,'2010','Feb - May',7,'Monday',3,3,'2015-08-27 23:10:20','2015-08-27 23:10:20',6,'Open',NULL,NULL,'2010-4'),(5,2,'2010','Feb - May',8,'Tuesday',4,4,'2015-08-27 23:10:20','2015-08-27 23:10:20',6,'Open',NULL,NULL,'2010-5'),(6,2,'2010','Jun - Sep',9,'Wednesday',3,3,'2015-08-27 23:10:20','2015-08-27 23:10:20',6,'Open',NULL,NULL,'2010-6'),(7,2,'2010','Jun - Sep',10,'Thursday',5,4,'2015-08-27 23:10:20','2015-08-27 23:10:20',6,'Open',NULL,NULL,'2010-7'),(8,2,'2010','Oct - Jan',11,'Friday',3,3,'2015-08-27 23:10:20','2015-08-27 23:10:20',6,'Open',NULL,NULL,'2010-8');
/*!40000 ALTER TABLE `group_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_plan_id` int(11) DEFAULT NULL,
  `start_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_on_study_plan_id` (`study_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,1,'2013','Jan','2015-07-01 13:55:22','2015-07-01 13:55:22',1),(2,5,'2010','Feb','2015-08-27 23:10:20','2015-08-27 23:10:20',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `destination_role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `read_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_franchise_id` (`franchise_id`),
  KEY `index_notifications_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,2,1,'NOT MTY','ESTE ES UN MENSAJE MUY IMPORTANTE!!!',NULL,'2015-07-06 13:55:59','2015-08-08 16:00:22',NULL,1,'2015-08-08'),(2,1,1,'NOT CHIHUAHUA','otro mensaje muy importante',NULL,'2015-07-06 13:57:54','2015-07-06 13:57:54',NULL,0,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependency_level_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependency_level_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependency_level_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependency_level_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependency_level_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
INSERT INTO `officers` VALUES (1,'Lic.','Vallejo Hinojosa','Gobernador Bla Bla','Nivel 1','Nivel 2','Nivel 3','Nivel 4','Nivel 5','2015-06-17 13:27:32','2015-06-17 13:27:32','Fausto'),(2,'Ing.','Medina Lopez','CEO','1','2','','','','2015-06-25 13:49:05','2015-06-25 13:49:05','Alberto');
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers_study_plans`
--

DROP TABLE IF EXISTS `officers_study_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officers_study_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officer_id` int(11) DEFAULT NULL,
  `study_plan_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_officers_study_plans_on_officer_id` (`officer_id`),
  KEY `index_officers_study_plans_on_study_plan_id` (`study_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers_study_plans`
--

LOCK TABLES `officers_study_plans` WRITE;
/*!40000 ALTER TABLE `officers_study_plans` DISABLE KEYS */;
INSERT INTO `officers_study_plans` VALUES (1,1,5,1,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(2,2,5,2,'2015-08-27 22:22:41','2015-08-27 22:22:41');
/*!40000 ALTER TABLE `officers_study_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official_domains`
--

DROP TABLE IF EXISTS `official_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_official_domains_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official_domains`
--

LOCK TABLES `official_domains` WRITE;
/*!40000 ALTER TABLE `official_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `official_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rfc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_maiden_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mothers_maiden_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `profile_picture_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_picture_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_picture_file_size` int(11) DEFAULT NULL,
  `profile_picture_updated_at` datetime DEFAULT NULL,
  `last_academic_degree` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `franchise_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_people_on_country_id` (`country_id`),
  KEY `index_people_on_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'','','user@example.com','Andres','Amaya','Diaz',1,1,NULL,'2015-06-10 02:12:51','2015-08-27 23:30:46','avatar.jpeg','image/jpeg',5937,'2015-08-27 23:30:46','Phd',1,1,1),(2,'CF101','CF101','humberto@example.com','Humberto','De La','Fuente',1,1,'1980-06-01','2015-06-10 02:54:52','2015-06-10 02:55:29','images.jpg','image/jpeg',1317,'2015-06-10 02:54:52',NULL,1,1,1),(4,'CF102','CF102','julia@teacher.com','Yosef','Gabriel','Maria',1,1,'1960-06-01','2015-06-10 03:07:05','2015-06-10 03:07:05',NULL,NULL,NULL,NULL,NULL,1,1,1),(5,'curpo','rfc','hola@hola.com','Juan','Perez','Pablo',1,1,'1986-08-28','2015-08-01 22:17:47','2015-08-01 22:17:47',NULL,NULL,NULL,NULL,NULL,1,1,1),(6,'CURP010203','RFC789','obed@focim.edu.mx','Obed','Razo','Guevara',1,1,'1991-09-18','2015-08-27 22:37:17','2015-08-27 22:37:17','avatar.jpeg','image/jpeg',5937,'2015-08-27 22:37:17',NULL,3,3,1);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_details`
--

DROP TABLE IF EXISTS `period_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `initial_month` date DEFAULT NULL,
  `end_month` date DEFAULT NULL,
  `year` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`initial_month`,`end_month`,`year`,`period_id`),
  KEY `index_period_details_on_period_id` (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_details`
--

LOCK TABLES `period_details` WRITE;
/*!40000 ALTER TABLE `period_details` DISABLE KEYS */;
INSERT INTO `period_details` VALUES (4,1,'2016-01-01','2016-04-01','2016-01-01',NULL,NULL),(5,1,'2016-05-01','2016-08-01','2016-05-01',NULL,NULL),(6,1,'2016-09-01','2016-12-01','2016-09-01',NULL,NULL),(7,2,'2016-01-01','2016-04-01','2016-01-01',NULL,NULL),(8,2,'2016-05-01','2016-08-01','2016-05-01',NULL,NULL),(9,2,'2016-09-01','2016-12-01','2016-09-01',NULL,NULL),(10,2,'2017-01-01','2017-04-01','2017-01-01',NULL,NULL),(11,2,'2017-05-01','2017-08-01','2017-05-01',NULL,NULL),(12,2,'2017-09-01','2017-12-01','2017-09-01',NULL,NULL),(13,2,'2018-01-01','2018-04-01','2018-01-01',NULL,NULL),(14,2,'2018-05-01','2018-08-01','2018-05-01',NULL,NULL),(15,2,'2018-09-01','2018-12-01','2018-09-01',NULL,NULL),(16,3,'2010-01-01','2010-04-01','2010-01-01',NULL,NULL),(17,3,'2010-05-01','2010-08-01','2010-05-01',NULL,NULL),(18,3,'2010-09-01','2010-12-01','2010-09-01',NULL,NULL),(19,3,'2011-01-01','2011-04-01','2011-01-01',NULL,NULL),(20,3,'2011-05-01','2011-08-01','2011-05-01',NULL,NULL),(21,3,'2011-09-01','2011-12-01','2011-09-01',NULL,NULL),(22,3,'2012-01-01','2012-04-01','2012-01-01',NULL,NULL),(23,3,'2012-05-01','2012-08-01','2012-05-01',NULL,NULL),(24,3,'2012-09-01','2012-12-01','2012-09-01',NULL,NULL),(25,3,'2013-01-01','2013-04-01','2013-01-01',NULL,NULL),(26,3,'2013-05-01','2013-08-01','2013-05-01',NULL,NULL),(27,3,'2013-09-01','2013-12-01','2013-09-01',NULL,NULL),(28,4,'2010-06-01','2010-09-01','2010-06-01',NULL,NULL),(29,4,'2010-10-01','2011-01-01','2010-10-01',NULL,NULL),(30,4,'2011-02-01','2011-05-01','2011-02-01',NULL,NULL),(31,5,'2011-02-01','2011-04-01','2011-02-01',NULL,NULL),(32,3,'2014-01-01','2014-04-01','2014-01-01',NULL,NULL),(33,3,'2014-05-01','2014-08-01','2014-05-01',NULL,NULL),(34,3,'2014-09-01','2014-12-01','2014-09-01',NULL,NULL),(35,4,'0001-12-31','0004-12-31','2010-12-31','2015-08-01 21:52:04','2015-08-01 21:52:04'),(36,6,'2010-02-01','2010-05-01','2010-02-01',NULL,NULL),(37,6,'2010-06-01','2010-09-01','2010-06-01',NULL,NULL),(38,6,'2010-10-01','2011-01-01','2010-10-01',NULL,NULL),(39,6,'0001-12-31','0004-12-31','2010-12-31','2015-08-28 16:40:44','2015-08-28 16:40:44');
/*!40000 ALTER TABLE `period_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `initial_month` date DEFAULT NULL,
  `month_length` int(11) DEFAULT NULL,
  `number_of_blocks` int(11) DEFAULT NULL,
  `start_year` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_periods_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (3,1,'2015-01-01',4,12,'2010-06-01','Tetramestral','2015-06-12 20:13:46','2015-06-12 20:13:46'),(4,1,'2015-06-01',4,3,'2010-06-01','Tetramestral VIEJO','2015-06-12 20:24:51','2015-06-12 20:24:51'),(5,1,'2015-02-01',3,1,'2011-06-01','Trimestral','2015-06-12 20:25:19','2015-06-12 20:25:19'),(6,3,'2015-02-01',4,3,'2010-08-01','Antes del Trimestral','2015-08-27 21:49:08','2015-08-27 21:49:08');
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_emails`
--

DROP TABLE IF EXISTS `person_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_person_emails_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_emails`
--

LOCK TABLES `person_emails` WRITE;
/*!40000 ALTER TABLE `person_emails` DISABLE KEYS */;
INSERT INTO `person_emails` VALUES (1,1,'bowikaxu@gmail.com','2015-06-11 17:13:38','2015-06-11 17:13:38');
/*!40000 ALTER TABLE `person_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_living_addresses`
--

DROP TABLE IF EXISTS `person_living_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_living_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_int` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `phone_emergency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_person_living_addresses_on_state_id` (`state_id`),
  KEY `index_person_living_addresses_on_country_id` (`country_id`),
  KEY `index_person_living_addresses_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_living_addresses`
--

LOCK TABLES `person_living_addresses` WRITE;
/*!40000 ALTER TABLE `person_living_addresses` DISABLE KEYS */;
INSERT INTO `person_living_addresses` VALUES (1,'testing street 2','1234567-5','1234567-9','Chihuahua','555-555','test',1,1,'911-911-911',1,'2015-06-10 02:12:51','2015-06-11 17:20:58'),(2,'Test Street I','001','002','Chihuahua','003','Chihuahua',1,1,'004',2,'2015-06-10 02:54:52','2015-06-10 02:54:52'),(4,'Test Street II','005','006','Chihuahua','007','Chihuahua',1,1,'911',4,'2015-06-10 03:07:05','2015-06-10 03:07:05'),(5,'Calle','1234','','Centro','64000','Municipio',3,1,'456789098765',5,'2015-08-01 22:17:47','2015-08-01 22:17:47'),(6,'Lomas del Valle','447','','Del Valle','66280','San Pedro',1,1,'8115315855',6,'2015-08-27 22:37:17','2015-08-27 22:39:46');
/*!40000 ALTER TABLE `person_living_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_work_places`
--

DROP TABLE IF EXISTS `person_work_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_work_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puesto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_int` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_person_work_places_on_state_id` (`state_id`),
  KEY `index_person_work_places_on_country_id` (`country_id`),
  KEY `index_person_work_places_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_work_places`
--

LOCK TABLES `person_work_places` WRITE;
/*!40000 ALTER TABLE `person_work_places` DISABLE KEYS */;
INSERT INTO `person_work_places` VALUES (1,'','','','','','','',NULL,NULL,NULL,1,'2015-06-10 03:09:40','2015-06-10 03:10:05'),(2,'Piloto Automático SA de CV','Director Comercial','','','','','',NULL,1,1,2,'2015-06-11 16:59:12','2015-06-11 16:59:12'),(3,'FOCIM MTY CENTRO','','','','','','',NULL,NULL,NULL,6,'2015-08-27 22:37:17','2015-08-27 22:37:17');
/*!40000 ALTER TABLE `person_work_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_record_files`
--

DROP TABLE IF EXISTS `personal_record_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_record_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `document_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_official_doc_id` int(11) DEFAULT NULL,
  `attach_user_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `is_responsive_letter` tinyint(1) DEFAULT NULL,
  `motive` text COLLATE utf8_unicode_ci,
  `match_date` date DEFAULT NULL,
  `match_user_id` int(11) DEFAULT NULL,
  `has_been_matched` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_personal_record_files_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_record_files`
--

LOCK TABLES `personal_record_files` WRITE;
/*!40000 ALTER TABLE `personal_record_files` DISABLE KEYS */;
INSERT INTO `personal_record_files` VALUES (1,2,'2015-06-10 03:11:13','2015-06-10 03:18:44','Acta de Nacimiento 2.pdf','application/pdf',8848,'2015-06-10 03:11:12',NULL,1,1,NULL,0,NULL,'2015-06-10',1,1),(2,2,'2015-06-10 03:19:01','2015-06-10 03:19:08','CURP 2.pdf','application/pdf',8848,'2015-06-10 03:19:00',NULL,2,1,NULL,0,NULL,'2015-06-10',1,1),(3,1,'2015-06-11 17:14:46','2015-06-11 17:17:15','Acta de Nacimiento 1.pdf','application/pdf',236089,'2015-06-11 17:14:46',NULL,1,1,NULL,0,NULL,'2015-06-11',1,1),(4,1,'2015-06-12 14:10:11','2015-06-24 13:55:21','CURP 1.pdf','application/pdf',134108,'2015-06-12 14:10:11',NULL,2,1,NULL,0,NULL,'2015-06-24',1,1),(5,1,'2015-06-24 13:54:42','2015-06-24 13:54:42','Acta de Nacimiento 1.pdf',NULL,NULL,NULL,NULL,1,NULL,'2015-07-24',1,'COMENTARIOS Andrés Amaya Díaz HÉLLO héllo',NULL,NULL,NULL),(6,6,'2015-08-27 22:44:11','2015-08-27 22:44:11','Acta de Nacimiento 6.pdf',NULL,NULL,NULL,NULL,1,NULL,'2015-09-26',1,'aslkhdas kldjlsakj dlaksjd lka',NULL,NULL,NULL),(7,6,'2015-08-27 22:45:13','2015-08-27 22:45:27','Acta de Nacimiento 6.pdf','application/pdf',236089,'2015-08-27 22:45:13',NULL,1,1,NULL,0,NULL,'2015-08-27',1,1),(8,6,'2015-08-27 22:46:43','2015-08-27 22:46:50','Acta de Nacimiento 6.pdf','application/pdf',173855,'2015-08-27 22:46:43',NULL,1,1,NULL,0,NULL,'2015-08-27',1,1),(9,6,'2015-08-27 22:48:05','2015-08-27 22:50:38','Acta de Nacimiento 6.pdf','application/pdf',173855,'2015-08-27 22:48:05',NULL,1,1,'2015-09-26',1,NULL,'2015-08-27',1,0);
/*!40000 ALTER TABLE `personal_record_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_people`
--

DROP TABLE IF EXISTS `related_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `relation_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_related_people_on_person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_people`
--

LOCK TABLES `related_people` WRITE;
/*!40000 ALTER TABLE `related_people` DISABLE KEYS */;
INSERT INTO `related_people` VALUES (1,2,'Jorge de la Fuente','2015-06-11 16:58:41','2015-06-11 16:58:41','Padre'),(2,2,'Georgina Guajardo','2015-06-11 16:58:41','2015-06-11 16:58:41','Madre'),(3,6,'Juan Perez','2015-08-27 22:37:17','2015-08-27 22:37:17','Papa'),(4,6,'Ma. Gabriela','2015-08-27 22:37:17','2015-08-27 22:37:17','Mama'),(5,6,'Jorge ','2015-08-27 22:37:17','2015-08-27 22:37:17','Primo');
/*!40000 ALTER TABLE `related_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_types`
--

DROP TABLE IF EXISTS `relationship_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_relationship_types_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_types`
--

LOCK TABLES `relationship_types` WRITE;
/*!40000 ALTER TABLE `relationship_types` DISABLE KEYS */;
INSERT INTO `relationship_types` VALUES (1,NULL,'Hijo',NULL,'2015-06-10 02:32:35','2015-06-10 02:32:35'),(2,NULL,'Madre',NULL,'2015-06-10 02:32:47','2015-06-10 02:32:47'),(3,NULL,'Padre',NULL,'2015-06-10 02:32:56','2015-06-10 02:32:56');
/*!40000 ALTER TABLE `relationship_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super_administrator',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(2,'franchise_director',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(3,'academic_coordinator',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(4,'finance',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(5,'head_of_school_control',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(6,'support_executive',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(7,'salesman',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(8,'teacher',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(9,'student',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52'),(10,'system_daemon',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_plan_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schedules_on_study_plan_id` (`study_plan_id`),
  KEY `index_schedules_on_campus_id` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,1,'2015-06-10 02:51:16','2015-06-10 02:51:16'),(2,2,1,'2015-06-11 17:23:03','2015-06-11 17:23:03'),(3,2,1,'2015-06-11 17:23:43','2015-06-11 17:23:43'),(4,3,1,'2015-06-12 22:01:18','2015-06-12 22:01:18'),(5,3,1,'2015-06-12 22:04:20','2015-06-12 22:04:20'),(6,5,1,'2015-08-27 22:27:14','2015-08-27 22:27:14');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_time_slots`
--

DROP TABLE IF EXISTS `schedules_time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_slot_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schedules_time_slots_on_time_slot_id` (`time_slot_id`),
  KEY `index_schedules_time_slots_on_schedule_id` (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_time_slots`
--

LOCK TABLES `schedules_time_slots` WRITE;
/*!40000 ALTER TABLE `schedules_time_slots` DISABLE KEYS */;
INSERT INTO `schedules_time_slots` VALUES (1,1,1),(2,2,1),(3,1,2),(4,2,2),(5,1,3),(6,2,3),(7,3,4),(8,4,4),(9,3,5),(10,4,5),(11,3,6),(12,4,6);
/*!40000 ALTER TABLE `schedules_time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141217161927'),('20141217161928'),('20141217161930'),('20141217161933'),('20150206053934'),('20150206081250'),('20150209053553'),('20150209062415'),('20150209072647'),('20150209113346'),('20150209115415'),('20150210092656'),('20150210170133'),('20150210170134'),('20150210170135'),('20150210170136'),('20150211022101'),('20150211042211'),('20150211044314'),('20150211044556'),('20150212072607'),('20150213005207'),('20150216063140'),('20150216073210'),('20150218025421'),('20150218100822'),('20150223090854'),('20150224152317'),('20150225082926'),('20150226042443'),('20150226114653'),('20150227040345'),('20150228072651'),('20150302062850'),('20150302073002'),('20150302074024'),('20150302143507'),('20150303082450'),('20150303144920'),('20150304004109'),('20150304004942'),('20150304005015'),('20150304040915'),('20150305040805'),('20150305042506'),('20150305043510'),('20150305043944'),('20150305044626'),('20150305123551'),('20150306063204'),('20150306081154'),('20150313065955'),('20150313074756'),('20150320055748'),('20150320071039'),('20150323024732'),('20150323111936'),('20150324161949'),('20150324162258'),('20150325022239'),('20150326020740'),('20150326024533'),('20150326024858'),('20150326030312'),('20150326103424'),('20150401031540'),('20150401040604'),('20150406040702'),('20150406113015'),('20150407120358'),('20150408064344'),('20150420050933'),('20150421071210'),('20150421083319'),('20150421105642'),('20150421113411'),('20150422085354'),('20150423044355'),('20150424084207'),('20150428031255'),('20150429103837'),('20150429124502'),('20150429164737'),('20150430132431'),('20150503043119'),('20150505050223'),('20150512124530'),('20150513073129'),('20150513092321'),('20150517134907'),('20150522091718'),('20150522101128'),('20150522101242'),('20150526111925'),('20150526112532'),('20150603070403'),('20150617022440'),('20150617035244'),('20150617083545'),('20150617091612'),('20150617093310'),('20150624042042'),('20150625031522'),('20150625071203'),('20150629063125'),('20150630044911'),('20150701042022'),('20150703030112'),('20150720061930'),('20150720063110'),('20150802085611'),('20150805091715'),('20150806102940'),('20150808135441');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Nuevo León',1,'2015-06-10 02:12:50','2015-06-12 14:07:50'),(2,'Michoacán',1,'2015-06-12 14:07:57','2015-06-12 14:07:57'),(3,'Durango',1,'2015-06-12 14:08:04','2015-06-12 14:08:04'),(4,'Chihuahua.',1,'2015-08-27 20:31:35','2015-08-27 20:38:26');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_levels`
--

DROP TABLE IF EXISTS `study_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_study_levels_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_levels`
--

LOCK TABLES `study_levels` WRITE;
/*!40000 ALTER TABLE `study_levels` DISABLE KEYS */;
INSERT INTO `study_levels` VALUES (1,NULL,'Maestria',NULL,'2015-06-10 02:22:27','2015-06-10 02:22:27'),(2,NULL,'Licenciatura',NULL,'2015-06-10 02:22:40','2015-06-10 02:22:40'),(4,NULL,'Doctorado',NULL,'2015-06-12 21:43:36','2015-06-12 21:43:36');
/*!40000 ALTER TABLE `study_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_levels_users_roles`
--

DROP TABLE IF EXISTS `study_levels_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_levels_users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_level_id` int(11) DEFAULT NULL,
  `users_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_study_levels_users_roles_on_study_level_id` (`study_level_id`),
  KEY `index_study_levels_users_roles_on_users_role_id` (`users_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_levels_users_roles`
--

LOCK TABLES `study_levels_users_roles` WRITE;
/*!40000 ALTER TABLE `study_levels_users_roles` DISABLE KEYS */;
INSERT INTO `study_levels_users_roles` VALUES (1,1,5),(2,2,5),(3,1,6),(4,2,6),(5,4,6);
/*!40000 ALTER TABLE `study_levels_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plan_periods`
--

DROP TABLE IF EXISTS `study_plan_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plan_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curricular_line_id` int(11) DEFAULT NULL,
  `study_plan_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_study_plan_periods_on_curricular_line_id` (`curricular_line_id`),
  KEY `index_study_plan_periods_on_study_plan_id` (`study_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan_periods`
--

LOCK TABLES `study_plan_periods` WRITE;
/*!40000 ALTER TABLE `study_plan_periods` DISABLE KEYS */;
INSERT INTO `study_plan_periods` VALUES (1,'Trimestral I',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(2,'Trimestral II',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(3,'Trimestral III',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(4,'PER1',NULL,2,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(5,'PER2',NULL,2,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(6,'PER3',NULL,2,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(7,'Primer Tetramestre',NULL,3,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(8,'Segundo Tetramestre',NULL,3,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(9,'Tercer Tetramestre',NULL,3,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(10,'PERIODO 1',NULL,4,'2015-06-25 13:43:17','2015-06-25 13:43:17'),(11,'PERIODO 2',NULL,4,'2015-06-25 13:43:17','2015-06-25 13:43:17'),(12,'TETRAMESTRE',NULL,5,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(13,'TETRAMESTRE',NULL,5,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(14,'TETRAMESTRE',NULL,5,'2015-08-27 22:22:41','2015-08-27 22:22:41');
/*!40000 ALTER TABLE `study_plan_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plan_subjects`
--

DROP TABLE IF EXISTS `study_plan_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plan_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_plan_period_id` int(11) DEFAULT NULL,
  `curricular_line_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekly_frequency` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_study_plan_subjects_on_study_plan_period_id` (`study_plan_period_id`),
  KEY `index_study_plan_subjects_on_curricular_line_id` (`curricular_line_id`),
  KEY `index_study_plan_subjects_on_subject_id` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan_subjects`
--

LOCK TABLES `study_plan_subjects` WRITE;
/*!40000 ALTER TABLE `study_plan_subjects` DISABLE KEYS */;
INSERT INTO `study_plan_subjects` VALUES (1,1,1,3,NULL,3,30,'2015-06-10 02:50:40','2015-06-30 15:42:53'),(2,2,1,3,NULL,4,40,'2015-06-10 02:50:40','2015-06-30 15:42:53'),(3,3,1,3,NULL,3,30,'2015-06-10 02:50:40','2015-06-30 15:42:53'),(4,4,1,3,NULL,1,2,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(5,5,1,4,NULL,2,4,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(6,6,1,5,NULL,3,6,'2015-06-11 17:22:42','2015-06-11 17:22:42'),(7,7,2,7,NULL,1,6,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(8,8,2,8,NULL,1,6,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(9,9,3,10,NULL,1,6,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(10,9,3,9,NULL,2,6,'2015-06-12 21:59:51','2015-06-12 21:59:51'),(11,10,2,8,NULL,1,4,'2015-06-25 13:43:17','2015-06-25 13:43:17'),(12,11,1,3,NULL,1,5,'2015-06-25 13:43:17','2015-06-25 13:43:17'),(13,12,2,7,NULL,1,7,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(14,12,2,8,NULL,1,7,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(15,13,3,9,NULL,1,7,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(16,13,3,10,NULL,1,7,'2015-08-27 22:22:41','2015-08-27 22:22:41'),(17,14,3,11,NULL,1,7,'2015-08-27 22:22:41','2015-08-27 22:22:41');
/*!40000 ALTER TABLE `study_plan_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plans`
--

DROP TABLE IF EXISTS `study_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `number_of_periods` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance_rate` int(11) DEFAULT NULL,
  `extra_opportunities` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_study_plans_on_career_id` (`career_id`),
  KEY `index_study_plans_on_period_id` (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plans`
--

LOCK TABLES `study_plans` WRITE;
/*!40000 ALTER TABLE `study_plans` DISABLE KEYS */;
INSERT INTO `study_plans` VALUES (1,1,3,3,'MATH DOCTOR Tetramestral 2015',91,5,1,'2015-06-10 02:50:40','2015-06-30 15:38:32'),(2,2,2,3,'Ing. Desarrollo Software Tetramestral (2016) 2015',90,1,1,'2015-06-11 17:22:42','2015-06-11 17:55:45'),(4,4,5,2,'Maestria Test 123 Trimestral 2015',90,1,1,'2015-06-25 13:43:17','2015-06-25 13:43:17'),(5,5,6,3,'Maestría en Educación con Orientación en Didáctica Constructivista Antes del Trimestral 2015',75,2,1,'2015-08-27 22:22:41','2015-08-27 22:22:41');
/*!40000 ALTER TABLE `study_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `study_level_id` int(11) DEFAULT NULL,
  `curricular_line_id` int(11) DEFAULT NULL,
  `clave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subjects_on_study_level_id` (`study_level_id`),
  KEY `index_subjects_on_curricular_line_id` (`curricular_line_id`),
  KEY `index_subjects_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Matemáticas II',2,1,'MAT02',NULL,'2015-06-10 02:38:33','2015-06-10 02:38:33'),(2,'História de México',2,1,'HMEX',NULL,'2015-06-10 02:39:05','2015-06-10 02:39:05'),(3,'Matemáticas Avanzadas',1,1,'MAT08',NULL,'2015-06-10 02:39:33','2015-06-10 02:39:33'),(4,'Programación 1',1,1,'PRG01',NULL,'2015-06-11 17:02:14','2015-06-11 17:02:14'),(5,'Programación Avanzada 02',1,1,'PRG02',NULL,'2015-06-11 17:02:29','2015-06-11 17:02:29'),(6,'Análisis y Diseño',1,1,'CV123',NULL,'2015-06-12 14:18:03','2015-06-12 14:18:03'),(7,'Introducción al Constructivismo',1,2,'MEDC01',NULL,'2015-06-12 21:46:50','2015-06-12 21:46:50'),(8,'Constructivismo y Modelos Instruccionales',1,2,'MEDC03',NULL,'2015-06-12 21:47:41','2015-06-12 21:47:41'),(9,'Introducción a la Investigación Educativa',1,3,'MEDC02',NULL,'2015-06-12 21:48:17','2015-06-12 21:48:17'),(10,'Filosofía de la Ciencia',1,3,'MEDC04',NULL,'2015-06-12 21:48:33','2015-06-12 21:48:33'),(11,'Metodología de la Investigación 3',1,3,'METIVNES123',NULL,'2015-08-27 21:26:01','2015-08-27 21:26:01');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects_teacher_dictaminations`
--

DROP TABLE IF EXISTS `subjects_teacher_dictaminations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects_teacher_dictaminations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_dictamination_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subjects_teacher_dictaminations_on_subject_id` (`subject_id`),
  KEY `teacher_dict_id` (`teacher_dictamination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects_teacher_dictaminations`
--

LOCK TABLES `subjects_teacher_dictaminations` WRITE;
/*!40000 ALTER TABLE `subjects_teacher_dictaminations` DISABLE KEYS */;
INSERT INTO `subjects_teacher_dictaminations` VALUES (1,3,1),(2,3,1),(3,3,1),(4,3,2),(5,3,2),(6,4,3),(7,5,3),(8,3,4),(9,7,5),(10,8,5),(11,10,6),(12,9,6),(13,7,7),(14,8,7),(15,9,7),(16,10,7),(17,11,7);
/*!40000 ALTER TABLE `subjects_teacher_dictaminations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_dictaminations`
--

DROP TABLE IF EXISTS `teacher_dictaminations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_dictaminations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `study_plan_id` int(11) DEFAULT NULL,
  `witness_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `witness_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Pending',
  `evidence_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evidence_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evidence_file_size` int(11) DEFAULT NULL,
  `evidence_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teacher_dictaminations_on_person_id` (`person_id`),
  KEY `index_teacher_dictaminations_on_study_plan_id` (`study_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_dictaminations`
--

LOCK TABLES `teacher_dictaminations` WRITE;
/*!40000 ALTER TABLE `teacher_dictaminations` DISABLE KEYS */;
INSERT INTO `teacher_dictaminations` VALUES (1,4,1,'Andres Amaya Diaz','Andres Amaya Diaz','2015-06-10 03:12:22','2015-06-10 03:16:13','Accepted','blank.pdf','application/pdf',8848,'2015-06-10 03:16:12'),(2,4,1,'','','2015-06-10 15:03:02','2015-06-10 15:03:02','Pending',NULL,NULL,NULL,NULL),(3,2,2,'TESTIGO 1','testigo 2','2015-06-11 17:59:45','2015-06-11 18:03:09','Accepted',NULL,NULL,NULL,NULL),(4,2,2,'','','2015-06-12 14:13:20','2015-06-17 13:31:09','Accepted','Getting_Started.pdf','application/pdf',127748,'2015-06-17 13:31:09'),(5,2,3,'testigo','testgo2','2015-06-12 22:08:26','2015-06-12 22:09:11','Accepted','ArticuloIndizadoISI-ScopusArbor2013-libre.pdf','application/pdf',236089,'2015-06-12 22:09:11'),(6,4,3,'3','2','2015-06-12 22:09:34','2015-06-12 22:09:50','Accepted','ArticuloIndizadoISI-ScopusArbor2013-libre.pdf','application/pdf',236089,'2015-06-12 22:09:50'),(7,6,5,'Juan Perez','Juan Martinez','2015-08-27 22:54:28','2015-08-27 22:55:40','Accepted','managing-a-project-using-an-agile-approach-and-the-pmbokc2ae-guide.pdf','application/pdf',313915,'2015-08-27 22:55:40');
/*!40000 ALTER TABLE `teacher_dictaminations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_time_slots_on_franchise_id` (`franchise_id`),
  KEY `index_time_slots_on_campus_id` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,1,1,'15:00 – 17:00','15:00:00','17:00:00',1,'2015-06-10 02:41:29','2015-06-10 02:42:20'),(2,1,1,'13:00 – 14:00','13:00:00','14:00:00',1,'2015-06-10 02:41:57','2015-06-10 02:41:57'),(3,1,1,'18:15 – 20:15','18:15:00','20:15:00',1,'2015-06-12 21:35:57','2015-06-12 21:35:57'),(4,1,1,'20:30 – 22:30','20:30:00','22:30:00',1,'2015-06-12 21:36:17','2015-06-12 21:36:17'),(5,2,2,'07:00 – 08:50','07:00:00','08:50:00',1,'2015-07-06 14:03:56','2015-07-06 14:03:56'),(6,3,3,'18:15 – 20:15','18:15:00','20:15:00',1,'2015-08-27 21:35:22','2015-08-27 21:38:54'),(7,3,3,'20:30 – 22:15','20:30:00','22:15:00',1,'2015-08-27 21:35:46','2015-08-28 16:32:15');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `active_role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','$2a$10$aaOPeF10aZq8BWs/bimRzO7Nn8j/6YhdAfyC617LwLNktqkYQ06NS',NULL,NULL,NULL,39,'2015-08-31 14:02:23','2015-08-31 14:01:10','127.0.0.1','127.0.0.1','2015-06-10 02:12:51','2015-08-31 14:04:04',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:51',NULL,NULL,NULL,1),(2,'humberto@gmail.com','$2a$10$zH7o2WYfK1BXhJxvpCJ.c.cId/sUOKqJKT3P6zB21gwDxSssyY7ja',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-06-10 02:54:53','2015-06-10 02:54:54',NULL,'1ffbe1b4b58e4f84342ba43d9d855a09e8b6480229338caaee91ec2ca1f091d6',NULL,'2015-06-10 02:54:54',NULL,NULL,NULL,2),(3,'julia@teacher.com','$2a$10$S7hnpWxiZX71tqHHUYTTFOVYVj.txvghguE3lQ4iu85yLg8rgXVSi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-06-10 03:07:05','2015-06-10 03:07:05',NULL,'8167a2058afa03fd2d364caf1e02ccc4705d99aa178a06db530443e5fd1cf972',NULL,'2015-06-10 03:07:05',NULL,NULL,NULL,4),(4,'hola@hola.com','$2a$10$kuNy4Qvw3WMiIz7QrzVleeQiPlL7gsTbssmDXdLJgBCHkuU1krNwm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-08-01 22:17:47','2015-08-01 22:17:47',NULL,'8656862ace0ef8f09d8baacd758e9ce53574423cea7afe85395f0447151e5984',NULL,'2015-08-01 22:17:47',NULL,NULL,NULL,5),(5,'obed@focim.edu.mx','$2a$10$A4efGqseSwlDcsRnmqj/z.JcyqogpD2C9rSWJ5kmcYOQy08yQJHiC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-08-27 22:37:18','2015-08-27 22:52:03',NULL,'b8db58c98e7e4e203da1ac6f3137e96ab622baac9dd663496b8e78901632b85c',NULL,'2015-08-27 22:52:03',NULL,NULL,NULL,6);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contract_sign_date` date NOT NULL,
  `date_of_receipt` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1,1,1,'Admin Contract I','2015-06-10','2015-06-10'),(3,8,1,2,'Contrato Maestro I','2015-06-10','2015-06-10'),(2,9,1,3,'Student Contrato I','2015-06-10','2015-06-10'),(2,8,1,4,'12345','2015-06-10','2015-06-11'),(1,8,1,5,'123','2015-06-22','2015-06-24'),(5,8,1,6,'8765','2015-08-26','2015-08-27'),(5,9,1,7,'3456','2015-08-26','2015-08-27');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31  9:05:28

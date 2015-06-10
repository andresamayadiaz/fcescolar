-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fcescolar_development
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_subjects`
--

LOCK TABLES `approved_subjects` WRITE;
/*!40000 ALTER TABLE `approved_subjects` DISABLE KEYS */;
INSERT INTO `approved_subjects` VALUES (1,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13'),(2,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13'),(3,1,3,'2015-06-10 03:16:13','2015-06-10 03:16:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,1,'PersonLivingAddress',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet: testing street 1\nnum_ext: 1234567-5\nnum_int: 1234567-9\ncolonia: Chihuahua\ncp: 555-555\nmunicipio: test\nstate_id: 1\ncountry_id: 1\nphone_emergency: 911-911-911\nperson_id: 1\n',1,NULL,NULL,'8a3d0a0c-bd7c-457e-b2c0-3165a2721f49','2015-06-10 02:12:51'),(2,1,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail: user@example.com\nencrypted_password: \"$2a$10$aaOPeF10aZq8BWs/bimRzO7Nn8j/6YhdAfyC617LwLNktqkYQ06NS\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 21467be58972f7c41e905b1326a0a1fc52a635d182812bdd3c483a250b89ec2c\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 02:12:51.846116385 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,NULL,'8d0ad13c-da44-4165-8cfc-d57f618ed3df','2015-06-10 02:12:51'),(3,1,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nperson_id:\n- \n- 1\n',2,NULL,NULL,'cf6f214e-900d-4eaa-bf44-aa270bb39929','2015-06-10 02:12:51'),(4,1,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nconfirmation_token:\n- 21467be58972f7c41e905b1326a0a1fc52a635d182812bdd3c483a250b89ec2c\n- \nconfirmed_at:\n- \n- 2015-06-10 02:12:52.034360694 Z\n',3,NULL,NULL,'130c4b17-16e7-488c-89c4-e04745595066','2015-06-10 02:12:52'),(5,1,'User',NULL,NULL,1,'User',NULL,'update','---\nlast_sign_in_at:\n- \n- &1 2015-06-10 02:17:23.380788122 Z\ncurrent_sign_in_at:\n- \n- *1\nlast_sign_in_ip:\n- \n- 127.0.0.1\ncurrent_sign_in_ip:\n- \n- 127.0.0.1\nsign_in_count:\n- 0\n- 1\n',4,NULL,'127.0.0.1','8c75273a-3cef-4546-89b9-cdeb5de12a7a','2015-06-10 02:17:23'),(6,1,'User',NULL,NULL,1,'User',NULL,'update','---\nactive_role:\n- \n- super_administrator\n',5,NULL,'127.0.0.1','ed2b7063-f386-4cda-95c6-1abe27080393','2015-06-10 02:17:23'),(7,2,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Test Street I\nnum_ext: \'001\'\nnum_int: \'002\'\ncolonia: Chihuahua\ncp: \'003\'\nmunicipio: Chihuahua\nstate_id: 1\ncountry_id: 1\nphone_emergency: \'004\'\nperson_id: 2\n',1,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:52'),(8,2,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: humberto@gmail.com\nencrypted_password: \"$2a$10$zH7o2WYfK1BXhJxvpCJ.c.cId/sUOKqJKT3P6zB21gwDxSssyY7ja\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 1ffbe1b4b58e4f84342ba43d9d855a09e8b6480229338caaee91ec2ca1f091d6\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 02:54:54.054713210 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:54'),(9,2,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 2\n',2,NULL,'127.0.0.1','98940469-b403-4a17-80f4-4f270403e5a2','2015-06-10 02:54:54'),(11,4,'PersonLivingAddress',NULL,NULL,1,'User',NULL,'create','---\nstreet: Test Street II\nnum_ext: \'005\'\nnum_int: \'006\'\ncolonia: Chihuahua\ncp: \'007\'\nmunicipio: Chihuahua\nstate_id: 1\ncountry_id: 1\nphone_emergency: \'911\'\nperson_id: 4\n',1,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(12,3,'User',NULL,NULL,1,'User',NULL,'create','---\nemail: julia@teacher.com\nencrypted_password: \"$2a$10$S7hnpWxiZX71tqHHUYTTFOVYVj.txvghguE3lQ4iu85yLg8rgXVSi\"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 0\ncurrent_sign_in_at: \nlast_sign_in_at: \ncurrent_sign_in_ip: \nlast_sign_in_ip: \nname: \nconfirmation_token: 8167a2058afa03fd2d364caf1e02ccc4705d99aa178a06db530443e5fd1cf972\nconfirmed_at: \nconfirmation_sent_at: 2015-06-10 03:07:05.588880006 Z\nunconfirmed_email: \nrole: \nactive_role: \nperson_id: \n',1,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(13,3,'User',NULL,NULL,1,'User',NULL,'update','---\nperson_id:\n- \n- 4\n',2,NULL,'127.0.0.1','7d1d6382-307e-44b2-961a-6dd0dd1fa0c4','2015-06-10 03:07:05'),(14,1,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'create','---\nempresa: \npuesto: \ncalle: \nmunicipio: \nnum_ext: \nnum_int: \ncolonia: \ncp: \nstate_id: \ncountry_id: \nperson_id: 1\n',1,NULL,'127.0.0.1','634c6336-9087-45e5-810a-670141e7f97e','2015-06-10 03:09:40'),(15,1,'PersonWorkPlace',NULL,NULL,1,'User',NULL,'update','---\nempresa:\n- \n- \'\'\npuesto:\n- \n- \'\'\ncalle:\n- \n- \'\'\nmunicipio:\n- \n- \'\'\nnum_ext:\n- \n- \'\'\nnum_int:\n- \n- \'\'\ncolonia:\n- \n- \'\'\n',2,NULL,'127.0.0.1','4cea366c-787a-47b3-8677-0be99b15642a','2015-06-10 03:10:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_official_docs`
--

LOCK TABLES `background_official_docs` WRITE;
/*!40000 ALTER TABLE `background_official_docs` DISABLE KEYS */;
INSERT INTO `background_official_docs` VALUES (1,NULL,'Acta de Nacimiento','<p><span style=\"font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 19.999979019165px; white-space: nowrap; background-color: rgb(249, 249, 249);\">Acta de Nacimiento:&nbsp;</span>@@person_fullname@@</p>\r\n',30,1,'2015-06-10 02:26:18','2015-06-10 02:27:53'),(2,NULL,'CURP','<p>CURP:&nbsp;<span style=\"line-height: 20.7999992370605px;\">@@person_fullname@@</span><span style=\"line-height: 20.7999992370605px;\">​</span></p>\r\n',90,1,'2015-06-10 02:28:10','2015-06-10 02:28:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_official_docs_schedules`
--

LOCK TABLES `background_official_docs_schedules` WRITE;
/*!40000 ALTER TABLE `background_official_docs_schedules` DISABLE KEYS */;
INSERT INTO `background_official_docs_schedules` VALUES (1,1,1),(2,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campuses`
--

LOCK TABLES `campuses` WRITE;
/*!40000 ALTER TABLE `campuses` DISABLE KEYS */;
INSERT INTO `campuses` VALUES (1,'Delicias Matriz','Calle #123, Col. Centro, C.P. 64000, Delicias, Chih., México',12,1,'2015-06-10 02:21:19','2015-06-10 02:21:19');
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
  `franchise_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_careers_on_franchise_id` (`franchise_id`),
  KEY `index_careers_on_study_level_id` (`study_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,1,'MATH DOCTOR',1,'MATDRVOE',1,'MATD','MATHDOC','MATHDOC','2015-06-10 02:44:49','2015-06-10 02:44:49','blank.pdf','application/pdf',8848,'2015-06-10 02:44:49');
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
INSERT INTO `careers_subjects` VALUES (1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,1,1,'MATH CLASS',20,1,1,'2015-06-10 02:40:16','2015-06-10 02:40:16'),(2,1,1,'HISTORY CLASS',20,2,1,'2015-06-10 02:40:46','2015-06-10 02:40:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms_schedules`
--

LOCK TABLES `classrooms_schedules` WRITE;
/*!40000 ALTER TABLE `classrooms_schedules` DISABLE KEYS */;
INSERT INTO `classrooms_schedules` VALUES (1,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_telephones`
--

LOCK TABLES `contact_telephones` WRITE;
/*!40000 ALTER TABLE `contact_telephones` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `index_contracts_on_contracts_template_id` (`contracts_template_id`),
  KEY `index_contracts_on_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
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
INSERT INTO `contracts_templates` VALUES (1,NULL,'Contrato de Crédito Licenciatura Tipo A','<p>CRLA: @@person_fullname@@</p>\r\n','CRLA',805,NULL,1,'2015-06-10 02:30:59','2015-06-10 02:30:59');
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
INSERT INTO `countries` VALUES (1,'Mexico',NULL,'2015-06-10 02:12:50','2015-06-10 02:12:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricular_lines`
--

LOCK TABLES `curricular_lines` WRITE;
/*!40000 ALTER TABLE `curricular_lines` DISABLE KEYS */;
INSERT INTO `curricular_lines` VALUES (1,NULL,'ABC',NULL,'2015-06-10 02:34:19','2015-06-10 02:34:19');
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
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_degree_achievements_categories_on_franchise_id` (`franchise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_achievements_categories`
--

LOCK TABLES `degree_achievements_categories` WRITE;
/*!40000 ALTER TABLE `degree_achievements_categories` DISABLE KEYS */;
INSERT INTO `degree_achievements_categories` VALUES (1,1,'Prácticas Profesionales',1,'2015-06-10 02:24:51','2015-06-10 02:24:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_achievements_categories_schedules`
--

LOCK TABLES `degree_achievements_categories_schedules` WRITE;
/*!40000 ALTER TABLE `degree_achievements_categories_schedules` DISABLE KEYS */;
INSERT INTO `degree_achievements_categories_schedules` VALUES (1,1,1);
/*!40000 ALTER TABLE `degree_achievements_categories_schedules` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchises`
--

LOCK TABLES `franchises` WRITE;
/*!40000 ALTER TABLE `franchises` DISABLE KEYS */;
INSERT INTO `franchises` VALUES (1,'Chihuahua FOCIM 1','CHIDGP838383','-','2015-06-10 02:12:50','2015-06-10 02:12:50');
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
  PRIMARY KEY (`id`),
  KEY `index_group_details_on_group_id` (`group_id`),
  KEY `index_group_details_on_subject_id` (`subject_id`),
  KEY `index_group_details_on_classroom_id` (`classroom_id`),
  KEY `index_group_details_on_time_slot_id` (`time_slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_details`
--

LOCK TABLES `group_details` WRITE;
/*!40000 ALTER TABLE `group_details` DISABLE KEYS */;
INSERT INTO `group_details` VALUES (1,1,'2016','Jan - Apr',3,'Monday',1,2,'2015-06-10 03:16:52','2015-06-10 03:16:52',4,'Open',NULL,NULL),(2,1,'2016','May - Aug',3,'Tuesday',1,2,'2015-06-10 03:16:52','2015-06-10 03:16:52',4,'Open',NULL,NULL),(3,1,'2016','Sep - Dec',3,'Wednesday',1,1,'2015-06-10 03:16:52','2015-06-10 03:16:52',4,'Open',NULL,NULL);
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
  `group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_on_study_plan_id` (`study_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,1,'2016','Jan','2015-06-10 03:16:51','2015-06-10 03:16:51','2016-1',1);
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
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_franchise_id` (`franchise_id`),
  KEY `index_notifications_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'','','user@example.com','Andres','Amaya','Diaz',1,1,NULL,'2015-06-10 02:12:51','2015-06-10 03:10:05','images.jpg','image/jpeg',1317,'2015-06-10 03:10:03','Phd',1,1,1),(2,'CF101','CF101','humberto@example.com','Humberto','De La','Fuente',1,1,'1980-06-01','2015-06-10 02:54:52','2015-06-10 02:55:29','images.jpg','image/jpeg',1317,'2015-06-10 02:54:52',NULL,1,1,1),(4,'CF102','CF102','julia@teacher.com','Yosef','Gabriel','Maria',1,1,'1960-06-01','2015-06-10 03:07:05','2015-06-10 03:07:05',NULL,NULL,NULL,NULL,NULL,1,1,1);
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
  KEY `index_period_details_on_period_id` (`period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_details`
--

LOCK TABLES `period_details` WRITE;
/*!40000 ALTER TABLE `period_details` DISABLE KEYS */;
INSERT INTO `period_details` VALUES (1,1,'2016-01-01','2016-04-01','2016-01-01',NULL,NULL),(2,1,'2016-05-01','2016-08-01','2016-05-01',NULL,NULL),(3,1,'2016-09-01','2016-12-01','2016-09-01',NULL,NULL),(4,1,'2016-01-01','2016-04-01','2016-01-01',NULL,NULL),(5,1,'2016-05-01','2016-08-01','2016-05-01',NULL,NULL),(6,1,'2016-09-01','2016-12-01','2016-09-01',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (1,1,'2015-01-01',4,3,'2016-06-01','Trimestral','2015-06-10 02:46:34','2015-06-10 02:49:01');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_emails`
--

LOCK TABLES `person_emails` WRITE;
/*!40000 ALTER TABLE `person_emails` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_living_addresses`
--

LOCK TABLES `person_living_addresses` WRITE;
/*!40000 ALTER TABLE `person_living_addresses` DISABLE KEYS */;
INSERT INTO `person_living_addresses` VALUES (1,'testing street 1','1234567-5','1234567-9','Chihuahua','555-555','test',1,1,'911-911-911',1,'2015-06-10 02:12:51','2015-06-10 02:12:51'),(2,'Test Street I','001','002','Chihuahua','003','Chihuahua',1,1,'004',2,'2015-06-10 02:54:52','2015-06-10 02:54:52'),(4,'Test Street II','005','006','Chihuahua','007','Chihuahua',1,1,'911',4,'2015-06-10 03:07:05','2015-06-10 03:07:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_work_places`
--

LOCK TABLES `person_work_places` WRITE;
/*!40000 ALTER TABLE `person_work_places` DISABLE KEYS */;
INSERT INTO `person_work_places` VALUES (1,'','','','','','','',NULL,NULL,NULL,1,'2015-06-10 03:09:40','2015-06-10 03:10:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_record_files`
--

LOCK TABLES `personal_record_files` WRITE;
/*!40000 ALTER TABLE `personal_record_files` DISABLE KEYS */;
INSERT INTO `personal_record_files` VALUES (1,2,'2015-06-10 03:11:13','2015-06-10 03:18:44','Acta de Nacimiento 2.pdf','application/pdf',8848,'2015-06-10 03:11:12',NULL,1,1,NULL,0,NULL,'2015-06-10',1,1),(2,2,'2015-06-10 03:19:01','2015-06-10 03:19:08','CURP 2.pdf','application/pdf',8848,'2015-06-10 03:19:00',NULL,2,1,NULL,0,NULL,'2015-06-10',1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_people`
--

LOCK TABLES `related_people` WRITE;
/*!40000 ALTER TABLE `related_people` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,1,'2015-06-10 02:51:16','2015-06-10 02:51:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_time_slots`
--

LOCK TABLES `schedules_time_slots` WRITE;
/*!40000 ALTER TABLE `schedules_time_slots` DISABLE KEYS */;
INSERT INTO `schedules_time_slots` VALUES (1,1,1),(2,2,1);
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
INSERT INTO `schema_migrations` VALUES ('20141217161927'),('20141217161928'),('20141217161930'),('20141217161933'),('20150206053934'),('20150206081250'),('20150209053553'),('20150209062415'),('20150209072647'),('20150209113346'),('20150209115415'),('20150210092656'),('20150210170133'),('20150210170134'),('20150210170135'),('20150210170136'),('20150211022101'),('20150211042211'),('20150211044314'),('20150211044556'),('20150212072607'),('20150213005207'),('20150216063140'),('20150216073210'),('20150218025421'),('20150218100822'),('20150223090854'),('20150224152317'),('20150225082926'),('20150226042443'),('20150226114653'),('20150227040345'),('20150228072651'),('20150302062850'),('20150302073002'),('20150302074024'),('20150302143507'),('20150303082450'),('20150303144920'),('20150304004109'),('20150304004942'),('20150304005015'),('20150304040915'),('20150305040805'),('20150305042506'),('20150305043510'),('20150305043944'),('20150305044626'),('20150305123551'),('20150306063204'),('20150306081154'),('20150313065955'),('20150313074756'),('20150320055748'),('20150320071039'),('20150323024732'),('20150323111936'),('20150324161949'),('20150324162258'),('20150325022239'),('20150326020740'),('20150326024533'),('20150326024858'),('20150326030312'),('20150326103424'),('20150401031540'),('20150401040604'),('20150406040702'),('20150406113015'),('20150407120358'),('20150408064344'),('20150420050933'),('20150421071210'),('20150421083319'),('20150421105642'),('20150421113411'),('20150422085354'),('20150423044355'),('20150424084207'),('20150428031255'),('20150429103837'),('20150429124502'),('20150429164737'),('20150430132431'),('20150503043119'),('20150505050223'),('20150512124530'),('20150513073129'),('20150513092321'),('20150517134907'),('20150522091718'),('20150522101128'),('20150522101242'),('20150526111925'),('20150526112532'),('20150603070403');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Mexico',1,'2015-06-10 02:12:50','2015-06-10 03:07:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_levels`
--

LOCK TABLES `study_levels` WRITE;
/*!40000 ALTER TABLE `study_levels` DISABLE KEYS */;
INSERT INTO `study_levels` VALUES (1,NULL,'Maestria',NULL,'2015-06-10 02:22:27','2015-06-10 02:22:27'),(2,NULL,'Licenciatura',NULL,'2015-06-10 02:22:40','2015-06-10 02:22:40'),(3,NULL,'Educación Básica',NULL,'2015-06-10 02:22:50','2015-06-10 02:22:50');
/*!40000 ALTER TABLE `study_levels` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan_periods`
--

LOCK TABLES `study_plan_periods` WRITE;
/*!40000 ALTER TABLE `study_plan_periods` DISABLE KEYS */;
INSERT INTO `study_plan_periods` VALUES (1,'Trimestral I',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(2,'Trimestral II',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(3,'Trimestral III',NULL,1,'2015-06-10 02:50:40','2015-06-10 02:50:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan_subjects`
--

LOCK TABLES `study_plan_subjects` WRITE;
/*!40000 ALTER TABLE `study_plan_subjects` DISABLE KEYS */;
INSERT INTO `study_plan_subjects` VALUES (1,1,1,3,NULL,3,30,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(2,2,1,3,NULL,4,40,'2015-06-10 02:50:40','2015-06-10 02:50:40'),(3,3,1,3,NULL,3,30,'2015-06-10 02:50:40','2015-06-10 02:50:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plans`
--

LOCK TABLES `study_plans` WRITE;
/*!40000 ALTER TABLE `study_plans` DISABLE KEYS */;
INSERT INTO `study_plans` VALUES (1,1,1,3,'MATH DOCTOR Trimestral 2015',90,5,1,'2015-06-10 02:50:40','2015-06-10 02:50:40');
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
  `franchise_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `study_level_id` int(11) DEFAULT NULL,
  `curricular_line_id` int(11) DEFAULT NULL,
  `clave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subjects_on_franchise_id` (`franchise_id`),
  KEY `index_subjects_on_study_level_id` (`study_level_id`),
  KEY `index_subjects_on_curricular_line_id` (`curricular_line_id`),
  KEY `index_subjects_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,1,'Matemáticas II',2,1,'MAT02',NULL,'2015-06-10 02:38:33','2015-06-10 02:38:33'),(2,1,'História de México',2,1,'HMEX',NULL,'2015-06-10 02:39:05','2015-06-10 02:39:05'),(3,1,'Matemáticas Avanzadas',1,1,'MAT08',NULL,'2015-06-10 02:39:33','2015-06-10 02:39:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects_teacher_dictaminations`
--

LOCK TABLES `subjects_teacher_dictaminations` WRITE;
/*!40000 ALTER TABLE `subjects_teacher_dictaminations` DISABLE KEYS */;
INSERT INTO `subjects_teacher_dictaminations` VALUES (1,3,1),(2,3,1),(3,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_dictaminations`
--

LOCK TABLES `teacher_dictaminations` WRITE;
/*!40000 ALTER TABLE `teacher_dictaminations` DISABLE KEYS */;
INSERT INTO `teacher_dictaminations` VALUES (1,4,1,'Andres Amaya Diaz','Andres Amaya Diaz','2015-06-10 03:12:22','2015-06-10 03:16:13','Accepted','blank.pdf','application/pdf',8848,'2015-06-10 03:16:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,1,1,'15:00 – 17:00','15:00:00','17:00:00',1,'2015-06-10 02:41:29','2015-06-10 02:42:20'),(2,1,1,'13:00 – 14:00','13:00:00','14:00:00',1,'2015-06-10 02:41:57','2015-06-10 02:41:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','$2a$10$aaOPeF10aZq8BWs/bimRzO7Nn8j/6YhdAfyC617LwLNktqkYQ06NS',NULL,NULL,NULL,1,'2015-06-10 02:17:23','2015-06-10 02:17:23','127.0.0.1','127.0.0.1','2015-06-10 02:12:51','2015-06-10 02:17:23',NULL,NULL,'2015-06-10 02:12:52','2015-06-10 02:12:51',NULL,NULL,'super_administrator',1),(2,'humberto@gmail.com','$2a$10$zH7o2WYfK1BXhJxvpCJ.c.cId/sUOKqJKT3P6zB21gwDxSssyY7ja',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-06-10 02:54:53','2015-06-10 02:54:54',NULL,'1ffbe1b4b58e4f84342ba43d9d855a09e8b6480229338caaee91ec2ca1f091d6',NULL,'2015-06-10 02:54:54',NULL,NULL,NULL,2),(3,'julia@teacher.com','$2a$10$S7hnpWxiZX71tqHHUYTTFOVYVj.txvghguE3lQ4iu85yLg8rgXVSi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-06-10 03:07:05','2015-06-10 03:07:05',NULL,'8167a2058afa03fd2d364caf1e02ccc4705d99aa178a06db530443e5fd1cf972',NULL,'2015-06-10 03:07:05',NULL,NULL,NULL,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1,1,1,'Admin Contract I','2015-06-10','2015-06-10'),(3,8,1,2,'Contrato Maestro I','2015-06-10','2015-06-10'),(2,9,1,3,'Student Contrato I','2015-06-10','2015-06-10');
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

-- Dump completed on 2015-06-10 10:21:31

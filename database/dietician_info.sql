-- ****************************************************************************************************************************** 

-- FILENAME             ::::  dietician_info.sql
-- AUTHOR               ::::  Keerthana K H
-- CREATED ON           ::::  26/11/2024
-- *******************************************************************************************************************************/



-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: dietician_info
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_dietician_role`
--

DROP TABLE IF EXISTS `audit_dietician_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_dietician_role` (
  `audit_dr_id` int NOT NULL AUTO_INCREMENT,
  `audit_dr_action` varchar(250) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_role` varchar(100) DEFAULT NULL,
  `audit_dr_created_datetime` timestamp NULL DEFAULT NULL,
  `audit_dr_updated_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`audit_dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_dietician_role`
--

LOCK TABLES `audit_dietician_role` WRITE;
/*!40000 ALTER TABLE `audit_dietician_role` DISABLE KEYS */;
INSERT INTO `audit_dietician_role` VALUES (6,'Delete',1,'Admin','2024-11-27 11:15:00','2024-11-27 11:15:00'),(7,'Delete',2,'Dietcian','2024-11-27 11:15:00','2024-11-27 11:15:00'),(8,'Insert',1,'Admin','2024-11-27 11:15:26','2024-11-27 11:15:26'),(9,'Insert',2,'Dietician','2024-11-27 11:15:26','2024-11-27 11:15:26');
/*!40000 ALTER TABLE `audit_dietician_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_nutri_register`
--

DROP TABLE IF EXISTS `audit_nutri_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_nutri_register` (
  `audit_nr_id` int NOT NULL AUTO_INCREMENT,
  `audit_nr_action` varchar(250) DEFAULT NULL,
  `nutri_id` varchar(100) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `user_role_id` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone_num` varchar(50) DEFAULT NULL,
  `mail_id` varchar(200) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `audit_nr_created_datetime` timestamp NULL DEFAULT NULL,
  `audit_nr_updated_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`audit_nr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_nutri_register`
--

LOCK TABLES `audit_nutri_register` WRITE;
/*!40000 ALTER TABLE `audit_nutri_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_nutri_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietician_role`
--

DROP TABLE IF EXISTS `dietician_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietician_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `user_role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietician_role`
--

LOCK TABLES `dietician_role` WRITE;
/*!40000 ALTER TABLE `dietician_role` DISABLE KEYS */;
INSERT INTO `dietician_role` VALUES (1,'Admin'),(2,'Dietician');
/*!40000 ALTER TABLE `dietician_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usertype_audit_insert` AFTER INSERT ON `dietician_role` FOR EACH ROW BEGIN
  INSERT INTO audit_dietician_role
  SET
    audit_dr_action = 'Insert',
    role_id = NEW.role_id,
    user_role = NEW.user_role,
    audit_dr_created_datetime = NOW(),
    audit_dr_updated_datetime = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usertype_audit_update` BEFORE UPDATE ON `dietician_role` FOR EACH ROW BEGIN
  IF  
    (NOT (OLD.role_id<=>NEW.role_id)) OR (NOT (OLD.user_role<=>NEW.user_role))
  THEN
    INSERT INTO audit_dietician_role
    SET
        audit_dr_action = 'Update',
        role_id = OLD.role_id,
        user_role = IF(OLD.user_role=NEW.user_role, NULL, NEW.user_role),
        audit_dr_created_datetime = NOW(),
        audit_dr_updated_datetime = NOW();
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usertype_audit_delete` BEFORE DELETE ON `dietician_role` FOR EACH ROW BEGIN
    INSERT INTO audit_dietician_role
    SET
        audit_dr_action = 'Delete',
        role_id = OLD.role_id,
        user_role = OLD.user_role,
        audit_dr_created_datetime = NOW(),
        audit_dr_updated_datetime = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nutri_register`
--

DROP TABLE IF EXISTS `nutri_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutri_register` (
  `nutri_id` varchar(100) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `user_role_id` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone_num` varchar(50) DEFAULT NULL,
  `mail_id` varchar(200) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nutri_id`),
  KEY `idx_user_role_id` (`user_role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_role_id`) REFERENCES `dietician_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutri_register`
--

LOCK TABLES `nutri_register` WRITE;
/*!40000 ALTER TABLE `nutri_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutri_register` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nutri_register_audit_insert` AFTER INSERT ON `nutri_register` FOR EACH ROW BEGIN
  INSERT INTO audit_nutri_register
  SET
    audit_nr_action = 'Insert',
    nutri_id = NEW.nutri_id,
    password = NEW.password,
    user_role_id = NEW.user_role_id,
    name = NEW.name,
    phone_num = NEW.phone_num,
    mail_id = NEW.mail_id,
    gender = NEW.gender,
    audit_nr_created_datetime = NOW(),
    audit_nr_updated_datetime = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nutri_register_audit_update` BEFORE UPDATE ON `nutri_register` FOR EACH ROW BEGIN
  IF  
    (NOT (OLD.nutri_id<=>NEW.nutri_id)) OR (NOT (OLD.password<=>NEW.password)) OR 
    (NOT (OLD.user_role_id<=>NEW.user_role_id)) OR (NOT (OLD.name<=>NEW.name)) OR 
    (NOT (OLD.phone_num<=>NEW.phone_num)) OR (NOT (OLD.mail_id<=>NEW.mail_id)) OR 
    (NOT (OLD.gender<=>NEW.gender)) 
  THEN
    INSERT INTO audit_nutri_register
    SET
	  audit_nr_action = 'Update',
	  nutri_id = OLD.nutri_id,
      password = IF(OLD.password=NEW.password, NULL, NEW.password),
      user_role_id = IF(OLD.user_role_id=NEW.user_role_id, NULL, NEW.user_role_id),
      name = IF(OLD.name=NEW.name, NULL, NEW.name),
      phone_num = IF(OLD.phone_num=NEW.phone_num, NULL, NEW.phone_num),
      mail_id = IF(OLD.mail_id=NEW.mail_id, NULL, NEW.mail_id),
      gender = IF(OLD.gender=NEW.gender, NULL, NEW.gender),
        audit_nr_created_datetime = NOW(),
        audit_nr_updated_datetime = NOW();
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nutri_register_audit_delete` BEFORE DELETE ON `nutri_register` FOR EACH ROW BEGIN
  INSERT INTO audit_nutri_register
  SET
	  audit_nr_action = 'Delete',
      nutri_id = OLD.nutri_id,
      password = OLD.password,
      user_role_id = OLD.user_role_id,
      name = OLD.name,
      phone_num = OLD.phone_num,
      mail_id = OLD.mail_id,
      gender = OLD.gender,
	  audit_nr_created_datetime = NOW(),
	  audit_nr_updated_datetime = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 17:01:11

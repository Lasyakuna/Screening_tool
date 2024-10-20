-- ****************************************************************************************************************************** 

-- FILENAME             ::::  screening_tool.sql
-- AUTHOR               ::::  Keerthana K H
-- CREATED ON           ::::  20/10/2024
-- *******************************************************************************************************************************/



-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: screening_tool
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
-- Table structure for table `audit_conclusion_table`
--

DROP TABLE IF EXISTS `audit_conclusion_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_conclusion_table` (
  `audit_ct_id` int NOT NULL AUTO_INCREMENT,
  `audit_ns_action` varchar(250) DEFAULT NULL,
  `ct_id` int NOT NULL,
  `patient_id` varchar(250) NOT NULL,
  `ns_id` int NOT NULL,
  `total_score` int DEFAULT NULL,
  `assessment_plan` varchar(250) DEFAULT NULL,
  `dietitian_note` text,
  `intervention_plan` text,
  `audit_ns_created_datetime` timestamp NULL DEFAULT NULL,
  `audit_ns_updated_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`audit_ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_conclusion_table`
--

LOCK TABLES `audit_conclusion_table` WRITE;
/*!40000 ALTER TABLE `audit_conclusion_table` DISABLE KEYS */;
INSERT INTO `audit_conclusion_table` VALUES (1,'insert',1,'1',1,NULL,NULL,NULL,NULL,'2024-10-19 17:03:55','2024-10-19 17:03:55'),(2,'update',1,'1',1,2,NULL,NULL,NULL,'2024-10-19 17:04:05','2024-10-19 17:04:05'),(3,'delete',1,'1',1,2,NULL,NULL,NULL,'2024-10-19 17:04:34','2024-10-19 17:04:34');
/*!40000 ALTER TABLE `audit_conclusion_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_nutritional_screening`
--

DROP TABLE IF EXISTS `audit_nutritional_screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_nutritional_screening` (
  `audit_ns_id` int NOT NULL AUTO_INCREMENT,
  `audit_ns_action` varchar(250) DEFAULT NULL,
  `ns_id` int DEFAULT NULL,
  `patient_id` varchar(250) DEFAULT NULL,
  `height` varchar(250) DEFAULT NULL,
  `weight` varchar(250) DEFAULT NULL,
  `bmi` varchar(250) DEFAULT NULL,
  `bmi_score` int DEFAULT NULL,
  `weight_loss` text,
  `chronic_disease` text,
  `reduced_food` text,
  `biochemical_parameter` text,
  `audit_ns_created_datetime` timestamp NULL DEFAULT NULL,
  `audit_ns_updated_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`audit_ns_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_nutritional_screening`
--

LOCK TABLES `audit_nutritional_screening` WRITE;
/*!40000 ALTER TABLE `audit_nutritional_screening` DISABLE KEYS */;
INSERT INTO `audit_nutritional_screening` VALUES (1,'delete',1,'1','124',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 08:45:29','2024-10-19 08:45:29'),(2,'insert',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 08:45:58','2024-10-19 08:45:58'),(3,'update',1,'1','124',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 08:46:17','2024-10-19 08:46:17');
/*!40000 ALTER TABLE `audit_nutritional_screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_patientprofile`
--

DROP TABLE IF EXISTS `audit_patientprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_patientprofile` (
  `audit_pp_id` int NOT NULL AUTO_INCREMENT,
  `audit_pp_action` varchar(250) DEFAULT NULL,
  `patient_id` varchar(250) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(250) DEFAULT NULL,
  `date_of_admission` varchar(250) DEFAULT NULL,
  `date_of_discharge` varchar(250) DEFAULT NULL,
  `date_of_evaluation` varchar(250) DEFAULT NULL,
  `medical_diagnosis` varchar(250) DEFAULT NULL,
  `lifestyle` varchar(250) DEFAULT NULL,
  `audit_pp_created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `audit_pp_updated_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_pp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_patientprofile`
--

LOCK TABLES `audit_patientprofile` WRITE;
/*!40000 ALTER TABLE `audit_patientprofile` DISABLE KEYS */;
INSERT INTO `audit_patientprofile` VALUES (1,'insert','1',21,'f',NULL,NULL,NULL,NULL,NULL,'2024-10-19 05:40:35','2024-10-19 05:40:35'),(2,'update','1',NULL,'Female',NULL,NULL,NULL,NULL,NULL,'2024-10-19 05:41:13','2024-10-19 05:41:13'),(3,NULL,'1',21,'Female',NULL,NULL,NULL,NULL,NULL,'2024-10-19 05:41:41','2024-10-19 05:41:41'),(4,'insert','1',21,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 05:46:46','2024-10-19 05:46:46'),(5,'delete','1',21,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 05:46:57','2024-10-19 05:46:57'),(6,'insert','1',21,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-19 06:07:46','2024-10-19 06:07:46');
/*!40000 ALTER TABLE `audit_patientprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conclusion_table`
--

DROP TABLE IF EXISTS `conclusion_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conclusion_table` (
  `ct_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(250) DEFAULT NULL,
  `ns_id` int NOT NULL,
  `total_score` int DEFAULT NULL,
  `assessment_plan` varchar(250) DEFAULT NULL,
  `dietitian_note` text,
  `intervention_plan` text,
  PRIMARY KEY (`ct_id`),
  KEY `idx_ns_id` (`ns_id`),
  CONSTRAINT `fk_nutritional_screening` FOREIGN KEY (`ns_id`) REFERENCES `nutritional_screening` (`ns_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conclusion_table`
--

LOCK TABLES `conclusion_table` WRITE;
/*!40000 ALTER TABLE `conclusion_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `conclusion_table` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_conclusion_table_insert` AFTER INSERT ON `conclusion_table` FOR EACH ROW BEGIN
  INSERT INTO `audit_conclusion_table` 
  SET
    `audit_ns_action` = 'insert',
    `ct_id` = NEW.ct_id,
    `patient_id` = NEW.patient_id,
    `ns_id` = NEW.ns_id,
    `total_score` = NEW.total_score,
    `assessment_plan` = NEW.assessment_plan,
    `dietitian_note` = NEW.dietitian_note,
    `intervention_plan` = NEW.intervention_plan,
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_conclusion_table_update` AFTER UPDATE ON `conclusion_table` FOR EACH ROW BEGIN
  INSERT INTO `audit_conclusion_table` 
  SET
    `audit_ns_action` = 'update',
    `ct_id` = OLD.ct_id,
    `patient_id` = NEW.patient_id,
    `ns_id` = NEW.ns_id,
    `total_score` = IF(OLD.total_score = NEW.total_score, OLD.total_score, NEW.total_score),
    `assessment_plan` = IF(OLD.assessment_plan = NEW.assessment_plan, OLD.assessment_plan, NEW.assessment_plan),
    `dietitian_note` = IF(OLD.dietitian_note = NEW.dietitian_note, OLD.dietitian_note, NEW.dietitian_note),
    `intervention_plan` = IF(OLD.intervention_plan = NEW.intervention_plan, OLD.intervention_plan, NEW.intervention_plan),
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_conclusion_table_delete` AFTER DELETE ON `conclusion_table` FOR EACH ROW BEGIN
  INSERT INTO `audit_conclusion_table` 
  SET
    `audit_ns_action` = 'delete',
    `ct_id` = OLD.ct_id,
    `patient_id` = OLD.patient_id,
    `ns_id` = OLD.ns_id,
    `total_score` = OLD.total_score,
    `assessment_plan` = OLD.assessment_plan,
    `dietitian_note` = OLD.dietitian_note,
    `intervention_plan` = OLD.intervention_plan,
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nutritional_screening`
--

DROP TABLE IF EXISTS `nutritional_screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutritional_screening` (
  `ns_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(250) DEFAULT NULL,
  `height` varchar(250) DEFAULT NULL,
  `weight` varchar(250) DEFAULT NULL,
  `bmi` varchar(250) DEFAULT NULL,
  `bmi_score` int DEFAULT NULL,
  `weight_loss` text,
  `chronic_disease` text,
  `reduced_food` text,
  `biochemical_parameter` text,
  PRIMARY KEY (`ns_id`),
  KEY `nutritional_screening` (`patient_id`),
  CONSTRAINT `nutritional_screening` FOREIGN KEY (`patient_id`) REFERENCES `patientprofile` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritional_screening`
--

LOCK TABLES `nutritional_screening` WRITE;
/*!40000 ALTER TABLE `nutritional_screening` DISABLE KEYS */;
INSERT INTO `nutritional_screening` VALUES (1,'1','124',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nutritional_screening` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_nutritional_screening_insert` AFTER INSERT ON `nutritional_screening` FOR EACH ROW BEGIN
  INSERT INTO `audit_nutritional_screening` 
  SET
    `audit_ns_action` = 'insert',
    `ns_id` = NEW.ns_id,
    `patient_id` = NEW.patient_id,
    `height` = NEW.height,
    `weight` = NEW.weight,
    `bmi` = NEW.bmi,
    `bmi_score` = NEW.bmi_score,
    `weight_loss` = NEW.weight_loss,
    `chronic_disease` = NEW.chronic_disease,
    `reduced_food` = NEW.reduced_food,
    `biochemical_parameter` = NEW.biochemical_parameter,
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_nutritional_screening_update` AFTER UPDATE ON `nutritional_screening` FOR EACH ROW BEGIN
  INSERT INTO `audit_nutritional_screening` 
  SET
    `audit_ns_action` = 'update',
    `ns_id` = OLD.ns_id,
    `patient_id` = NEW.patient_id,
    `height` = IF(OLD.height = NEW.height, OLD.height, NEW.height),
    `weight` = IF(OLD.weight = NEW.weight, OLD.weight, NEW.weight),
    `bmi` = IF(OLD.bmi = NEW.bmi, OLD.bmi, NEW.bmi),
    `bmi_score` = IF(OLD.bmi_score = NEW.bmi_score, OLD.bmi_score, NEW.bmi_score),
    `weight_loss` = IF(OLD.weight_loss = NEW.weight_loss, OLD.weight_loss, NEW.weight_loss),
    `chronic_disease` = IF(OLD.chronic_disease = NEW.chronic_disease, OLD.chronic_disease, NEW.chronic_disease),
    `reduced_food` = IF(OLD.reduced_food = NEW.reduced_food, OLD.reduced_food, NEW.reduced_food),
    `biochemical_parameter` = IF(OLD.biochemical_parameter = NEW.biochemical_parameter, OLD.biochemical_parameter, NEW.biochemical_parameter),
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audit_nutritional_screening_delete` AFTER DELETE ON `nutritional_screening` FOR EACH ROW BEGIN
  INSERT INTO `audit_nutritional_screening` 
  SET
    `audit_ns_action` = 'delete',
    `ns_id` = OLD.ns_id,
    `patient_id` = OLD.patient_id,
    `height` = OLD.height,
    `weight` = OLD.weight,
    `bmi` = OLD.bmi,
    `bmi_score` = OLD.bmi_score,
    `weight_loss` = OLD.weight_loss,
    `chronic_disease` = OLD.chronic_disease,
    `reduced_food` = OLD.reduced_food,
    `biochemical_parameter` = OLD.biochemical_parameter,
    `audit_ns_created_datetime` = NOW(),
    `audit_ns_updated_datetime` = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patientprofile`
--

DROP TABLE IF EXISTS `patientprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientprofile` (
  `patient_id` varchar(250) NOT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(250) DEFAULT NULL,
  `date_of_admission` varchar(250) DEFAULT NULL,
  `date_of_discharge` varchar(250) DEFAULT NULL,
  `date_of_evaluation` varchar(250) DEFAULT NULL,
  `medical_diagnosis` varchar(250) DEFAULT NULL,
  `lifestyle` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientprofile`
--

LOCK TABLES `patientprofile` WRITE;
/*!40000 ALTER TABLE `patientprofile` DISABLE KEYS */;
INSERT INTO `patientprofile` VALUES ('1',21,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `patientprofile` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patientprofile_audit_insert` AFTER INSERT ON `patientprofile` FOR EACH ROW BEGIN
  INSERT INTO audit_patientprofile 
  SET
    audit_pp_action = 'insert',
    patient_id = NEW.patient_id,
    age = NEW.age,
    sex = NEW.sex,
    date_of_admission = NEW.date_of_admission,
    date_of_discharge = NEW.date_of_discharge,
    date_of_evaluation = NEW.date_of_evaluation,
    medical_diagnosis = NEW.medical_diagnosis,
    lifestyle = NEW.lifestyle,
    audit_pp_created_datetime = NOW(),
    audit_pp_updated_datetime = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patientprofile_audit_update` BEFORE UPDATE ON `patientprofile` FOR EACH ROW BEGIN 
  IF (NOT (OLD.patient_id <=> NEW.patient_id)) OR 
     (NOT (OLD.age <=> NEW.age)) OR 
     (NOT (OLD.sex <=> NEW.sex)) OR 
     (NOT (OLD.date_of_admission <=> NEW.date_of_admission)) OR
     (NOT (OLD.date_of_discharge <=> NEW.date_of_discharge)) OR 
     (NOT (OLD.date_of_evaluation <=> NEW.date_of_evaluation)) OR 
     (NOT (OLD.medical_diagnosis <=> NEW.medical_diagnosis)) OR 
     (NOT (OLD.lifestyle <=> NEW.lifestyle))
  THEN
    INSERT INTO audit_patientprofile
    SET 
       audit_pp_action = 'update',
       patient_id = OLD.patient_id,
       age = IF(OLD.age = NEW.age, NULL, NEW.age),
       sex = IF(OLD.sex = NEW.sex, NULL, NEW.sex),
       date_of_admission = IF(OLD.date_of_admission = NEW.date_of_admission, NULL, NEW.date_of_admission),
       date_of_discharge = IF(OLD.date_of_discharge = NEW.date_of_discharge, NULL, NEW.date_of_discharge),
       date_of_evaluation = IF(OLD.date_of_evaluation = NEW.date_of_evaluation, NULL, NEW.date_of_evaluation),
       medical_diagnosis = IF(OLD.medical_diagnosis = NEW.medical_diagnosis, NULL, NEW.medical_diagnosis),
       lifestyle = IF(OLD.lifestyle = NEW.lifestyle, NULL, NEW.lifestyle),
       audit_pp_created_datetime = NOW(),
       audit_pp_updated_datetime = NOW();
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patientprofile_audit_delete` BEFORE DELETE ON `patientprofile` FOR EACH ROW BEGIN 
  INSERT INTO audit_patientprofile
  SET
    audit_pp_action = 'delete',
    patient_id = OLD.patient_id,
    age = OLD.age,
    sex = OLD.sex,
    date_of_admission = OLD.date_of_admission,
    date_of_discharge = OLD.date_of_discharge,
    date_of_evaluation = OLD.date_of_evaluation,
    medical_diagnosis = OLD.medical_diagnosis,
    lifestyle = OLD.lifestyle,
    audit_pp_created_datetime = NOW(),
    audit_pp_updated_datetime = NOW();
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

-- Dump completed on 2024-10-20  9:01:13

CREATE DATABASE  IF NOT EXISTS `adyapana_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adyapana_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: adyapana_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_user`
--

DROP TABLE IF EXISTS `academic_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_user` (
  `user_id` varchar(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name_title_id` int NOT NULL,
  `surname` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `tel_no` varchar(10) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `gender_id` int NOT NULL,
  `marital_status_id` int NOT NULL,
  `no` varchar(10) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_student_name_title_idx` (`name_title_id`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  KEY `fk_academic_user_marital_status1_idx` (`marital_status_id`),
  KEY `fk_academic_user_district1_idx` (`district_id`),
  CONSTRAINT `fk_academic_user_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_academic_user_marital_status1` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status` (`id`),
  CONSTRAINT `fk_student_gender10` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_student_name_title0` FOREIGN KEY (`name_title_id`) REFERENCES `name_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_user`
--

LOCK TABLES `academic_user` WRITE;
/*!40000 ALTER TABLE `academic_user` DISABLE KEYS */;
INSERT INTO `academic_user` VALUES ('ACD20230001','123',1,'Samara','Sahan','Sankalpa','Silva','780820693V',NULL,'0774757689','0114214578','sahan@gmail.com',1,1,'21','liyanagemulla','Seeduwa','Seeduwa',1);
/*!40000 ALTER TABLE `academic_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_status`
--

DROP TABLE IF EXISTS `attendance_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_status`
--

LOCK TABLES `attendance_status` WRITE;
/*!40000 ALTER TABLE `attendance_status` DISABLE KEYS */;
INSERT INTO `attendance_status` VALUES (1,'present'),(2,'absent');
/*!40000 ALTER TABLE `attendance_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('CL20230001','Aurora'),('CL20230002','Cluster'),('CL20230003','Volga'),('CL20230004','Nebula');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_subjects`
--

DROP TABLE IF EXISTS `class_has_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_has_subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_class_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `subjects_subject_id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_has_subjects_subjects1_idx` (`subjects_subject_id`),
  KEY `fk_class_has_subjects_class1_idx` (`class_class_id`),
  CONSTRAINT `fk_class_has_subjects_class1` FOREIGN KEY (`class_class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fk_class_has_subjects_subjects1` FOREIGN KEY (`subjects_subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_subjects`
--

LOCK TABLES `class_has_subjects` WRITE;
/*!40000 ALTER TABLE `class_has_subjects` DISABLE KEYS */;
INSERT INTO `class_has_subjects` VALUES (1,'CL20230004','S0001'),(2,'CL20230003','S0002');
/*!40000 ALTER TABLE `class_has_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Colombo'),(2,'Gampaha'),(3,'Kalutara'),(4,'Kandy'),(5,'Matale'),(6,'Nuwara Eliya'),(7,'Galle'),(8,'Matara'),(9,'Hambantota'),(10,'Jaffna'),(11,'Kilinochchi'),(12,'Mannar'),(13,'Vavuniya'),(14,'Mullaitivu'),(15,'Batticaloa'),(16,'Ampara'),(17,'Trincomalee'),(18,'Kurunegala'),(19,'Puttalam'),(20,'Anuradhapura'),(21,'Polonnaruwa'),(22,'Badulla'),(23,'Moneragala'),(24,'Ratnapura'),(25,'Kegalle');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'male'),(2,'female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_status`
--

LOCK TABLES `marital_status` WRITE;
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` VALUES (1,'Unmarried'),(2,'Married');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_title`
--

DROP TABLE IF EXISTS `name_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name_title` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_title`
--

LOCK TABLES `name_title` WRITE;
/*!40000 ALTER TABLE `name_title` DISABLE KEYS */;
INSERT INTO `name_title` VALUES (1,'Mr.'),(2,'Ms.'),(3,'Mrs.'),(4,'Rev.');
/*!40000 ALTER TABLE `name_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` date DEFAULT NULL,
  `subjects_subject_id` varchar(5) NOT NULL,
  `student_student_id` varchar(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_subjects1_idx` (`subjects_subject_id`),
  KEY `fk_payment_student1_idx` (`student_student_id`),
  CONSTRAINT `fk_payment_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_payment_subjects1` FOREIGN KEY (`subjects_subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='8+4+3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PYM202307070001','2023-07-07','S0001','STU20230002');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` varchar(11) NOT NULL,
  `name_title_id` int NOT NULL,
  `surname` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `tel_no` varchar(10) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `gender_id` int NOT NULL,
  `class_class_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `no` varchar(10) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `fk_student_name_title_idx` (`name_title_id`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  KEY `fk_student_class1_idx` (`class_class_id`),
  KEY `fk_student_district1_idx` (`district_id`),
  CONSTRAINT `fk_student_class1` FOREIGN KEY (`class_class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fk_student_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_student_name_title` FOREIGN KEY (`name_title_id`) REFERENCES `name_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('STU20230001',1,'Jaya','Kalindu','Karunathilaka','Karunathilaka','199912485012',NULL,'0774754556','0112545756','kalindu@gmail.com',1,'CL20230001','20','jayamawatha','','Rajagahapura',19),('STU20230002',1,'Hewage','Sahan','Sandeepa','Rajakaruna','200129061805',NULL,'0775415698','0112457457','sahan@gmail.com',1,'CL20230004','23','Liyanagemulla','Seeduwa','Seeduwa',22);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_student_id` varchar(11) NOT NULL,
  `subjects_subject_id` varchar(5) NOT NULL,
  `attendance_status_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_has_subjects_subjects1_idx` (`subjects_subject_id`),
  KEY `fk_student_has_subjects_student1_idx` (`student_student_id`),
  KEY `fk_student_attendance_attendance_status1_idx` (`attendance_status_id`),
  CONSTRAINT `fk_student_attendance_attendance_status1` FOREIGN KEY (`attendance_status_id`) REFERENCES `attendance_status` (`id`),
  CONSTRAINT `fk_student_has_subjects_student1` FOREIGN KEY (`student_student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `fk_student_has_subjects_subjects1` FOREIGN KEY (`subjects_subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendance`
--

LOCK TABLES `student_attendance` WRITE;
/*!40000 ALTER TABLE `student_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `hours` varchar(4) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('S0001','Human Anatomy','360',120000),('S0002','Physiology','370',130000),('S0003','Biological Science','370',150000);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` varchar(11) NOT NULL,
  `name_title_id` int NOT NULL,
  `surname` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `tel_no` varchar(10) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `other_subjects` varchar(100) DEFAULT NULL,
  `marital_status_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `subjects_subject_id` varchar(5) NOT NULL,
  `no` varchar(10) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `fk_teacher_marital_status1_idx` (`marital_status_id`),
  KEY `fk_teacher_gender1_idx` (`gender_id`),
  KEY `fk_teacher_name_title1_idx` (`name_title_id`),
  KEY `fk_teacher_subjects1_idx` (`subjects_subject_id`),
  KEY `fk_teacher_district1_idx` (`district_id`),
  CONSTRAINT `fk_teacher_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_teacher_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_teacher_marital_status1` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status` (`id`),
  CONSTRAINT `fk_teacher_name_title1` FOREIGN KEY (`name_title_id`) REFERENCES `name_title` (`id`),
  CONSTRAINT `fk_teacher_subjects1` FOREIGN KEY (`subjects_subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('TEA20230001',1,'Don','Tashya','','De Silva','800265210V','1980-07-15','0751542365','','tashya@gmail.com','',1,2,'S0001','ee','Gampaha Rd','Kotugoda','Kotugoda',1),('TEA20230002',2,'Harana','Sama','Kanthi','Siriwardana','750620145V','1975-07-15','0774521547','0112145785','kanthi@gmail.com','',2,2,'S0002','21','Seeduwa Rd','','Seeduwa',2);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16  0:04:03

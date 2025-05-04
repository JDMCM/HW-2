CREATE DATABASE  IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `ingredients_table`
--

DROP TABLE IF EXISTS `ingredients_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients_table` (
  `iname` varchar(45) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`iname`),
  UNIQUE KEY `iname_UNIQUE` (`iname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients_table`
--

LOCK TABLES `ingredients_table` WRITE;
/*!40000 ALTER TABLE `ingredients_table` DISABLE KEYS */;
INSERT INTO `ingredients_table` VALUES ('beef','its beef'),('chicken','it is chicken'),('grains','you know what this is'),('other key ingredient','could be anything'),('tofu','you get it');
/*!40000 ALTER TABLE `ingredients_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junct`
--

DROP TABLE IF EXISTS `junct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `junct` (
  `rname` varchar(45) NOT NULL,
  `iname` varchar(45) NOT NULL,
  KEY `iname_idx` (`rname`),
  KEY `iname_idx1` (`iname`),
  CONSTRAINT `iname` FOREIGN KEY (`iname`) REFERENCES `ingredients_table` (`iname`),
  CONSTRAINT `rname` FOREIGN KEY (`rname`) REFERENCES `recipes_table` (`rname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junct`
--

LOCK TABLES `junct` WRITE;
/*!40000 ALTER TABLE `junct` DISABLE KEYS */;
INSERT INTO `junct` VALUES ('Beef Stew','beef'),('Beef Stew','other key ingredient'),('Beef Stew2','beef');
/*!40000 ALTER TABLE `junct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_table`
--

DROP TABLE IF EXISTS `recipes_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes_table` (
  `rname` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `instructions` mediumtext NOT NULL,
  `ingredients` mediumtext NOT NULL,
  `descript` mediumtext,
  PRIMARY KEY (`rname`),
  UNIQUE KEY `name_UNIQUE` (`rname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_table`
--

LOCK TABLES `recipes_table` WRITE;
/*!40000 ALTER TABLE `recipes_table` DISABLE KEYS */;
INSERT INTO `recipes_table` VALUES ('Beef Stew','jd','test','test','test'),('Beef Stew2','jd','no','beef, waater','BEEF STEW 2'),('BEEFER STEW','JD','NO','Beef, Water','Just beef and water'),('BEEFER STEW1','JD','NO','Beef, Water','Just beef and water');
/*!40000 ALTER TABLE `recipes_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recipes'
--

--
-- Dumping routines for database 'recipes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-04  0:27:32

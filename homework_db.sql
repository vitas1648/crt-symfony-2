-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: homework
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `animal_classes`
--

DROP TABLE IF EXISTS `animal_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `can_flying` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_classes`
--

LOCK TABLES `animal_classes` WRITE;
/*!40000 ALTER TABLE `animal_classes` DISABLE KEYS */;
INSERT INTO `animal_classes` VALUES (1,'Беспанцерные',0),(2,'Млекопитающие',0),(3,'Завропсиды',0),(4,'Двоякодышащие',0);
/*!40000 ALTER TABLE `animal_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `can_flying` tinyint(1) DEFAULT '0',
  `legs_count` int unsigned DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `animal_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (1,'Саламандра',0,4,1),(2,'Тритон',0,4,1),(3,'Лягушка',0,4,1),(4,'Заяц',0,4,2),(5,'Бобр',0,4,2),(6,'Летучая мышь',1,2,2),(7,'Кит',0,0,2),(8,'Человек',0,2,2),(9,'Черепаха',0,4,3),(10,'Крокодил',0,4,3),(11,'Фазан',0,2,3),(12,'Гадюка',0,0,3),(13,'Рогозуб',0,0,4),(14,'Чешуйчатник',0,0,4);
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `founded_at` datetime DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Moscow','1147-09-11 00:00:00',1),(2,'Saint Peterbsburg','1703-05-16 00:00:00',1),(3,'Tyumen','1586-06-29 00:00:00',1),(4,'Raduzhnyy','1991-12-25 00:00:00',1),(5,'New York','1624-01-01 00:00:00',2),(6,'Los Angeles','1781-09-04 00:00:00',2),(7,'Chicago','1833-01-01 00:00:00',2),(8,'Houston','1837-06-05 00:00:00',2),(9,'Kiev','0930-01-01 00:00:00',3),(10,'Kharkov','1654-01-01 00:00:00',3),(11,'Odessa','1794-09-02 00:00:00',3),(12,'Odessa','1991-08-24 00:00:00',3),(13,'Kaskinen','1785-01-01 00:00:00',4),(14,'Pyhajarvi','1866-01-01 00:00:00',4),(15,'Helsinki','1550-01-01 00:00:00',4),(16,'Espoo','1458-01-01 00:00:00',4),(17,'London','0043-01-01 00:00:00',5),(18,'Birmingham','1166-01-01 00:00:00',5),(19,'Leeds','1086-01-01 00:00:00',5),(20,'Glasgow','0543-01-01 00:00:00',5);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Russia','RUS'),(2,'Unated States of America','USA'),(3,'Ukraine','UKR'),(4,'Finland','FIN'),(5,'United Kingdom','GBR');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-28 14:20:15

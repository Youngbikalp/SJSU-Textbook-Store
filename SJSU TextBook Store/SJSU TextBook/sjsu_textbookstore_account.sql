-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sjsu_textbookstore
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `sjsu_id` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `salt1` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`account_id`,`sjsu_id`),
  UNIQUE KEY `account_id_UNIQUE` (`account_id`),
  UNIQUE KEY `sjsu_id_UNIQUE` (`sjsu_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'1003265746','King','King','King','552973589','1ad9ad935a98d1ccc783a4c59a46aa1bd722836e0bfa3403bc7fa18d8b308f2c'),(2,'1003256454','Natsu','Natsu','Dragneel','618531137','cae9f4c8a371f16ca105f8ca1d0430f265bd3483c112a457d578a8a6d6fa033a'),(3,'1005623232','Lucy','Lucy','Heartgilia','41019831','d573e8b8f6d24a1a15aee4c741c9458a8cbbbd1e9efd891145e8da1fbbdb2eed'),(4,'1009876545','John','John','Cena','763061970','e2c567243a1d77f6472fc8055ab75b9afbfb787bf241be4477d3e15ae9e5fa27'),(5,'1005646854','Jo','Jo','Stewart','393108051','4ac8b4b603208f3d716b3b687025de6802ebee97b7806a9532c1404eec7afbfc'),(6,'1006546546','Humphrey','Humphrey','Manning','990296907','af6ec5ef05ce477f3a8a3400befe1a5b70c7d65c0abf08725e23066183ade536'),(7,'1006573545','Reef','Reef','Corted','645112129','26dad7f8b5cefb06bc777a6d906b2da29aa2d53fc266b35d0f186505f170f5ef'),(8,'1006576854','Erin','Erin','Ho','435689532','a2ef7c70b1cfb9a9821f372d010991d9c323f3542942d05f50a739590643afe7'),(9,'1006576584','Ella','Ella','Mcdermott','977259056','ae5b91f14e49ed46b6f6ee57195cc9bd598b038d227c53a46ae8a40008f96589'),(10,'1004345615','Davina','Davina','Atkinson','146955068','27dfa310374faf05582cfbc638fd95a7f8a69fd4f70c8d279d7752aae6df8ff2'),(11,'1006547654','Yasser','Yasser','Guthrie','30303045','c5865457c5e8796dcc7dd0f8552f4c3d49d3d166ac065f0c6fc8f6485c845684'),(12,'1006546875','Valentina','Valentina','Whittaker','619375957','c9c7cca2b7462d02f38a5ee6806a6e2e42231648bac24867cbb6839a6c43a62a'),(13,'1002343545','Robin','Robin','Nico','243634916','072026960585396afe5c122c93517b8a6c17c262818d211088ea10d0db981f7b'),(14,'1005673326','Sanji','Sanji','Vinsmoke','66317255','520a9296aaa1d519c5dfe2a734d9da8b91c465569f4f101688c616c31904acac'),(15,'1003554654','Doflamingo','Doflamingo','Donquixote','579845303','f96731430314db1dbbf5581c4f1ba1030055c589067b02ce5be6ad72198c3295'),(16,'1005646512','Sky','Sky','Woodson','740290531','523e35cb0ba6bf705be28d16ae342486d4f5690d89faa73826deb4b4b9b620a4');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 17:16:39

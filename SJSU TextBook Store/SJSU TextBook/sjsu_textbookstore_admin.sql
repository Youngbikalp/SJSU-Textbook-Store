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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) NOT NULL,
  `salt1` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'John','aadsf43523','e810f5170bd2fa70cf5ce5f609448ee9ea514270f6150005edef71622a0289ce'),(2,'Kite','313a1dsfa','e242f043caac8954a3eb6899cf4c145662960198f3d9b8468e6093cf356689eb'),(3,'Silvya','4645afdsf','c39ebdef4c7eda44e36f8dddab329ae0b757cfcea02c300cfdb0f5f85662ee45'),(4,'Blue','1324qererasdf','b2d5429cd2f1686b1f95390c772f1fb009137216350a630dd3106e847c1f5e3c'),(5,'Green','asdfasdfa2324','0fa21c9f297dc4c4827b06d0df6e0b604edb6e3a384b2138583438790a81b8b1'),(6,'Apple','asdf234','4ed36068fc960acfdde41141928c4400633234428e0fb4806f6ca850efa77f5b'),(7,'August','253132a1sdf','9efe546b85e349ab809dfa11937d31fd53d576581e8daacac4d03dc5d8649f44'),(8,'September','asdf234243','2ec6d3a9251059839883a671238f7a19eec403700db8f50427e1ff52bd16228e'),(9,'Tommy','asdfafd345345345','a2c208e79c1d503130a4e608a815553ea0c14f4abda2c61cb2e6a0d4881ba6dc'),(10,'Bob','3123213132qer','4dd1d6a14582d49a3a668c204a1fe1eceef7eae731357dd5aacaae70104189db'),(11,'Syam','asdfa453545435','fb68222ccaf1f49f03b5faecbea9da3d52e77442eae012b23a05409bfb6d1b91'),(12,'Krish','654a65sdf16afd','56c35e33e1ef308be824974242df3c7946b0ec732b63d615218854d454658028'),(13,'Jack','54654bjkhabdf','c37770502587af3aa0a9b2d916f81ed08b47276a98edded7455d8b0a7e72e823'),(14,'Daniel','45465asdfasdf','827383c7d4b4522cadd4c91c1a63082c3207261f8ec24e51402cf0df30aa316f'),(15,'Regular','asdrtyryt','ef236b5d08c735c331e707723b37a10c3c532ba869123f78af0603335e9a7054');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `author` varchar(250) NOT NULL,
  `isbn` varchar(250) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Inland','The origins of Inland date back to the late 1940s when founder Lloyd Parker launched Parker Pacific Equipment, selling US war surplus ...','2020-08-02','Joseph Heller','3002165165',20),(2,'The Passion of New','The book is set in a dystopian United States where civil war has broken out between different political, racial and gendered groups.','2020-08-02','Angela Carter','3004564654',50),(3,'The Path to the Spiders\' Nests','The Path to the Nest of Spiders is a 1947 novel by the Italian writer Italo Calvino. The narrative is a coming-of-age story, set against the backdrop of World War II. It was Calvino\'s first novel.','2020-08-02','Italo Calvino','3005465456',50),(4,'Introduction to Algorithms','Introduction to Algorithms','2020-08-02','Thomas H. Cormen','3002136456',100),(5,'Artificial Intelligence: A Modern Approach',' A Modern Approach is a university textbook on artificial intelligence','2020-08-02','Stuart J. Russell','3005684654',200),(6,'Database Management Systems','Database Management Systems (DBMS), based on the introductory database course','2020-08-02','Johannes Gehrke','3005468765',200),(7,'Thinking, Fast and Slow','Thinking, Fast and Slow is a best-selling book published in 2011 by Nobel Memorial Prize in Economic Sciences laureate Daniel Kahneman','2020-08-02','Daniel Kahneman','3001565465',150),(8,'The Presentation of Self in Everyday Life','The Presentation of Self in Everyday Life is a 1956 sociology book by Erving Goffman, in which the author uses the imagery of the theatre in order to portray the importance of human social interaction','2020-08-02','Erving Goffman','3004968798',100),(9,'Yes Please','Yes Please is a 2014 book by American actress and television writer Amy Poehler. Poehler announced the book in January 2013.','2020-08-02','Amy Poehler','3004878454',30),(10,'Mary Barton',' The story is set in the English city of Manchester between 1839 and 1842, and deals with the difficulties faced by the Victorian working class.','2020-08-02','Elizabeth Gaskell','3004564867',50),(11,'The Elegant Universe',' Introduces string and superstring theory, and provides a comprehensive though non-technical assessment of the theory and some of its shortcomings.','2020-08-02','Brian Greene','3007894651',250),(12,'Six easy pieces','Atoms, basic physics, energy, gravitation, quantum mechanics, and the relationship of physics to other topics. With his dazzling and inimitable wit','2020-08-02',' Richard Feynman','3004567864',150),(13,'Structures : Or Why Things Don\'t Fall Down','Engineers will of course understand why the Greeks took the wheels off their chariots at night, why we get lumbago, why birds have feathers and how much science is involved in dressmaking','2020-08-02','J. E. Gordon','3007789945',120),(14,'To engineer is human','How did a simple design error cause one of the great disasters of the 1980s - the collapse of the walkways at the Kansas City Hyatt Regency Hotel?','2020-08-02','Henry Petroski','3008979845',80),(15,'Nicomachean Ethics',' The work, which plays a pre-eminent role in defining Aristotelian ethics, consists of ten books, originally separate scrolls, and is understood to be based on notes from his lectures at the Lyceum.','2020-08-02','Aristotle','3007651591',100);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 17:16:40

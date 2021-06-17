-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: backend_2021
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `idlocation` int NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`idlocation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Bandung'),(2,'Jakarta'),(3,'Serpong');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_status`
--

DROP TABLE IF EXISTS `movie_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_status` (
  `idmovie_status` int NOT NULL AUTO_INCREMENT,
  `movie_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idmovie_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_status`
--

LOCK TABLES `movie_status` WRITE;
/*!40000 ALTER TABLE `movie_status` DISABLE KEYS */;
INSERT INTO `movie_status` VALUES (1,'upcoming'),(2,'on show'),(3,'has shown');
/*!40000 ALTER TABLE `movie_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `idmovie` int NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `release_date` int NOT NULL,
  `release_month` int NOT NULL,
  `release_year` int NOT NULL,
  `duration_min` int NOT NULL,
  `genre` varchar(45) NOT NULL,
  `description` varchar(425) NOT NULL,
  `idmovie_status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmovie`),
  KEY `fk_movies_idmovie_status_idx` (`idmovie_status`),
  CONSTRAINT `fk_movies_idmovie_status` FOREIGN KEY (`idmovie_status`) REFERENCES `movie_status` (`idmovie_status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Avengers: Endgame',24,4,2019,182,'Action','After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.',3),(2,'Frozen 2',20,11,2019,113,'Fantasy','Queen Elsa starts hearing a mysterious melodic voice calling to her. Unsettled, she answers it and that awakens the elemental spirits that lead her to a quest to restore an old injustice.',2),(3,'Demon Slayer: Kimetsu no Yaiba the Movie: Mugen Train',6,1,2021,129,'Anime','A youth begins a quest to fight demons and save his sister after finding his family slaughtered and his sister turned into a demon.',1),(4,'Weathering with You',21,8,2019,111,'Romance','A boy runs away to Tokyo and befriends a girl who appears to be able to manipulate the weather.',2),(5,'The Nun',5,9,2018,96,'Horror','When a young nun at a cloistered abbey in Romania takes her own life, a priest with a haunted past and a novitiate on the threshold of her final vows are sent by the Vatican to investigate. Together, they uncover the order\'s unholy secret. Risking not only their lives but their faith and their very souls, they confront a malevolent force in the form of a demonic nun.',3),(6,'Spider-Man: Far From Home',3,7,2019,129,'Action','As Spider-Man, a beloved superhero, Peter Parker faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.',2),(8,'Black Widow',4,29,2021,133,'Action','At birth the Black Widow (aka Natasha Romanova) is given to the KGB, which grooms her to become its ultimate operative. When the U.S.S.R. breaks up, the government tries to kill her as the action moves to present-day New York, where she is a freelance operative.',1),(9,'Mulan',25,3,2020,120,'Fantasy','A girl disguises as a male warrior and joins the imperial army in order to prevent her sick father from being forced to enlist as he has no male heir.',2),(10,'Mulan',25,3,2020,120,'Fantasy','A girl disguises ...',1),(11,'Harry Potter',25,3,2020,120,'Fantasy','A boy disguises ...',1),(12,'Finding Nemo',25,3,2020,120,'Fantasy','A girl disguises ...',1),(13,'Captain Marvel',25,3,2020,120,'Fantasy','A girl disguises ...',1),(14,'Hobbs and Shaw',25,3,2020,120,'Fantasy','A girl disguises ...',1),(15,'Dilan',25,3,2020,120,'Romance','A girl disguises ...',1),(16,'Habibie dan Ainun',25,3,2020,120,'Romance','A girl disguises ...',1),(17,'Dora',25,3,2020,120,'Animation','A girl disguises ...',1),(18,'Dora',25,3,2020,120,'Animation','A girl disguises ...',1);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `idschedules` int NOT NULL AUTO_INCREMENT,
  `idmovie` int NOT NULL,
  `idlocation` int NOT NULL,
  `idtime` int NOT NULL,
  PRIMARY KEY (`idschedules`),
  KEY `fk_sch_idmovie_idx` (`idmovie`),
  KEY `fk_sch_idlocation_idx` (`idlocation`),
  KEY `fk_sch_idtime_idx` (`idtime`),
  CONSTRAINT `fk_sch_idlocation` FOREIGN KEY (`idlocation`) REFERENCES `locations` (`idlocation`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sch_idmovie` FOREIGN KEY (`idmovie`) REFERENCES `movies` (`idmovie`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sch_idtime` FOREIGN KEY (`idtime`) REFERENCES `show_times` (`idtime`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,1,3),(2,1,1,4),(3,1,1,5),(4,1,2,1),(5,1,2,5),(6,1,2,6),(7,1,3,1),(8,1,3,2),(9,1,3,3),(10,2,2,2),(11,2,2,4),(12,2,2,6),(13,3,1,3),(14,3,3,5),(15,3,3,6),(16,4,1,1),(17,4,2,2),(18,4,2,4),(19,4,3,3),(20,5,1,5),(21,5,2,5),(22,5,3,5),(23,6,1,1),(24,6,2,2),(25,6,3,3),(26,8,1,4),(27,8,1,6),(28,9,1,1),(29,9,1,2),(31,9,1,3),(32,1,2,3),(33,10,3,3),(34,10,3,2),(35,11,2,3);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_times`
--

DROP TABLE IF EXISTS `show_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_times` (
  `idtime` int NOT NULL AUTO_INCREMENT,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`idtime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_times`
--

LOCK TABLES `show_times` WRITE;
/*!40000 ALTER TABLE `show_times` DISABLE KEYS */;
INSERT INTO `show_times` VALUES (1,'9 AM'),(2,'11 AM'),(3,'1 PM'),(4,'3 PM'),(5,'7 PM'),(6,'9 PM');
/*!40000 ALTER TABLE `show_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'active'),(2,'not-active'),(3,'closed');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(225) NOT NULL,
  `idrole` int NOT NULL DEFAULT '2',
  `idstatus` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_user_idrole_idx` (`idrole`),
  KEY `fk_user_idstatus_idx` (`idstatus`),
  CONSTRAINT `fk_user_idrole` FOREIGN KEY (`idrole`) REFERENCES `roles` (`idrole`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_idstatus` FOREIGN KEY (`idstatus`) REFERENCES `status` (`idstatus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1623898171299','allysarh','allysa@mail.com','abc123@',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'backend_2021'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-17 12:35:55

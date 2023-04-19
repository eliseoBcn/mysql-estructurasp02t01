CREATE DATABASE  IF NOT EXISTS `ModeloYoutube` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ModeloYoutube`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: modeloyoutube
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `idvideo` int NOT NULL,
  `idusuario` int DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tamano` int DEFAULT NULL,
  `nombrearchivo` varchar(100) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `thumbnail` blob,
  `reproducciones` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `dislikes` int DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `fechapublicacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idvideo`),
  UNIQUE KEY `idvideo_UNIQUE` (`idvideo`),
  KEY `usuario_idx` (`idusuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (100,10,'Soft Rock 70s 80s 90s Hits','Lionel Richie, Eric Clapton, Michael Bolton, Phil Collins, Rod Stewart - Soft Rock 70s 80s 90s Hits',10000,'recopilatorio2020','01:10:20',NULL,3000,50,100,'PUBLICADO','2023-02-01 09:30:00'),(101,10,'Madonna - La isla bonita e (Official Video)','l álbum \'True Blue\' de Madonna lanzado en Sire Records en 1986. ',20000,'madonaislabonita','00:05:30',NULL,6000,30,3,'PUBLICADO','2021-04-05 20:30:10'),(102,10,'Madonna - Borderline (Official Video)','directed by Mary Lambert. Original song taken from the \'Madonna\' album released on Sire Records in 1983.',68888,'borderlineaA1','00:07:12',NULL,3333,41,0,'PUBLICADO','1998-07-05 10:30:10'),(103,30,'Human nature, Thriller (1982)','Esta balada fue escrita originalmente por el teclista Steve Porcaro,',333333,'humananature','00:04:05',NULL,334,33,3,'PUBICADO','2000-04-23 15:30:01');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-19 11:40:27

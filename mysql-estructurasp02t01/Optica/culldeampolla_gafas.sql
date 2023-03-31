CREATE DATABASE  IF NOT EXISTS `culldeampolla` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `culldeampolla`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: culldeampolla
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
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafas` (
  `Marca` varchar(46) NOT NULL,
  `graduacion1` decimal(4,2) DEFAULT NULL,
  `graduacion2` decimal(4,2) DEFAULT NULL,
  `TipoMontura` varchar(45) DEFAULT NULL,
  `ColorMontura` varchar(40) DEFAULT NULL,
  `ColorVidrio1` varchar(25) DEFAULT NULL COMMENT '\n\n',
  `ColorVidrio2` varchar(45) DEFAULT NULL,
  `Precio` decimal(8,2) DEFAULT NULL COMMENT '\n',
  `IdProveedor` int NOT NULL,
  `Idgafas` int NOT NULL,
  PRIMARY KEY (`Marca`,`Idgafas`),
  UNIQUE KEY `Marca_UNIQUE` (`Marca`),
  KEY `IdGadas_idx` (`IdProveedor`),
  KEY `idgafas` (`Idgafas`),
  CONSTRAINT `IdProveedor` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES ('ADIDAS',2.00,2.00,'RECTANGULAR','GRIS','GRIS','GRIS',312.00,10,1010),('ARMANI',1.00,1.00,'OVALADA','MARRON ','TRASPARENTE','TRASPARENTE',112.00,10,1000),('CELINE',2.20,2.50,'REDONDA','AZUL ','PLATEADOS','PLATEADOS',221.00,20,1020);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31 10:46:43

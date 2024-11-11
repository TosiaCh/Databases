-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: spk-www    Database: DB24_CHWALA
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `Dostawcy`
--

DROP TABLE IF EXISTS `Dostawcy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dostawcy` (
  `Id_dostawcy` int NOT NULL,
  `Imię` varchar(40) COLLATE latin2_bin DEFAULT NULL,
  `Nazwisko` varchar(40) COLLATE latin2_bin DEFAULT NULL,
  `Nr_telefonu` varchar(40) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`Id_dostawcy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dostawcy`
--

LOCK TABLES `Dostawcy` WRITE;
/*!40000 ALTER TABLE `Dostawcy` DISABLE KEYS */;
INSERT INTO `Dostawcy` VALUES (1,'Artur','Kura','789133999'),(2,'Ada','Skóra','777888999');
/*!40000 ALTER TABLE `Dostawcy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Klienci`
--

DROP TABLE IF EXISTS `Klienci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Klienci` (
  `Id_klienta` int NOT NULL,
  `Imię` varchar(40) COLLATE latin2_bin DEFAULT NULL,
  `Nazwisko` varchar(40) COLLATE latin2_bin DEFAULT NULL,
  `Adres` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`Id_klienta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Klienci`
--

LOCK TABLES `Klienci` WRITE;
/*!40000 ALTER TABLE `Klienci` DISABLE KEYS */;
INSERT INTO `Klienci` VALUES (1,'Antonina','Chwała','ul.Iwona Odrowąża 8, Kraków'),(2,'Amelia','Szymańska','ul.Kluczborska 50, Kraków');
/*!40000 ALTER TABLE `Klienci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produkty`
--

DROP TABLE IF EXISTS `Produkty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produkty` (
  `Id_Produktu` int NOT NULL,
  `Produkt` varchar(60) COLLATE latin2_bin DEFAULT NULL,
  `Cena` decimal(10,2) DEFAULT NULL,
  `Ilość_sztuk` int DEFAULT NULL,
  PRIMARY KEY (`Id_Produktu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produkty`
--

LOCK TABLES `Produkty` WRITE;
/*!40000 ALTER TABLE `Produkty` DISABLE KEYS */;
INSERT INTO `Produkty` VALUES (1,'Długopis',5.99,60),(2,'Zeszyt',7.99,30);
/*!40000 ALTER TABLE `Produkty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zamówienia`
--

DROP TABLE IF EXISTS `Zamówienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zamówienia` (
  `Id_zamówienia` int NOT NULL,
  `Id_klienta` int DEFAULT NULL,
  `Id_Produktu` int DEFAULT NULL,
  `Ilość_sztuk` int DEFAULT NULL,
  `Id_dostawcy` int DEFAULT NULL,
  `Cena` decimal(10,2) DEFAULT NULL,
  `Status_Zamówienia` enum('Wysłane','Nowe','W trakcie realizacji','Anulowane','Dostarczone','Zwrócone','Zakończone') COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`Id_zamówienia`),
  KEY `Id_klienta` (`Id_klienta`),
  KEY `Id_Produktu` (`Id_Produktu`),
  KEY `Id_dostawcy` (`Id_dostawcy`),
  CONSTRAINT `Zamówienia_ibfk_1` FOREIGN KEY (`Id_klienta`) REFERENCES `Klienci` (`Id_klienta`),
  CONSTRAINT `Zamówienia_ibfk_2` FOREIGN KEY (`Id_Produktu`) REFERENCES `Produkty` (`Id_Produktu`),
  CONSTRAINT `Zamówienia_ibfk_3` FOREIGN KEY (`Id_dostawcy`) REFERENCES `Dostawcy` (`Id_dostawcy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zamówienia`
--

LOCK TABLES `Zamówienia` WRITE;
/*!40000 ALTER TABLE `Zamówienia` DISABLE KEYS */;
INSERT INTO `Zamówienia` VALUES (1,1,1,3,1,17.97,'Nowe'),(2,2,2,4,1,31.97,'Dostarczone');
/*!40000 ALTER TABLE `Zamówienia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-04 20:49:23

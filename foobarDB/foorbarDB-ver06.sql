-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: foobar_booksop
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cartID` int(10) unsigned NOT NULL,
  `customerID` int(10) unsigned NOT NULL,
  `totalQuantity` int(10) unsigned NOT NULL,
  `totalAmount` double unsigned NOT NULL,
  `status` enum('open','closed') NOT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_cards` (
  `creditcardID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `cardNum` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 NOT NULL,
  `expDate` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`creditcardID`),
  UNIQUE KEY `creditcardID_UNIQUE` (`creditcardID`),
  UNIQUE KEY `cardNum_UNIQUE` (`cardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES (1,'MCS','$2a$10$cwAB8EKjNpkFrTqPHwv/4e8Ptpf1ewKm3XN37qFuWsdg9B07bjwj6','mastercard','12 / 2024'),(2,'Mark Christian Sanchez','$2a$10$e2sLG4.B7XMnVXCj7DmTh.m/wMDEuDIA7v6z5p34q7IvMbU8y54Bi','mastercard','12 / 2024'),(3,'MCCS','$2a$10$Fme4.9ih77tSK/5NSPe.2emMA.RSLvhhcPPeFow7GNJM1xuOmq0zW','mastercard','12 / 2024'),(4,'MCCS','$2a$10$JOkd0SFVGDfHjHV4ODkfFesbS4hO5Zg1BvTtNVaja2x6/7i8adNma','mastercard','12 / 2024'),(5,'Mark Christian Sanchez','$2a$10$UCHf0mE24EIV0SvbaHEHUOt0A5kEKSmcTFLklexqdIhZDcmYcxyIO','mastercard','12 / 2024'),(6,'Mark Christian Sanchez','$2a$10$5IotXDwhUd0vV9M6OVWBEeZel5fwR09eRM/m8unm39CxswMukJB8S','mastercard','12 / 2024'),(7,'MCS','$2a$10$KD7o6ShRVSJaga4MoZ5GLulQ3lK2ZPv7iooWbLxmSuIET2LOvzDjO','mastercard','12 / 2024'),(8,'Random Person','$2a$10$4D4MTiStJjM3yHfgsVAgUu5JcxejH/UH/ae.9KkVnM9jnQT22lHwG','mastercard','10 / 20'),(9,'Jane Doe','$2a$10$LFkCn1Qisx02L/MNuLnFherXohAjPvykKjl9nQqLzPKo/PRcrzpDO','mastercard','10 / 20'),(10,'1234','$2a$10$n3Xu6ODH3szFfA8heVQnKuADRKBScqgyd2sJ4Rtrf.YoV1VR0yz1C','visa','12 / 91'),(11,'Mark Christian Sanchez','$2a$10$b7McmcvTR0hwNZZwXvSI2u6L.dXmwrb4RvM5wJiS9wxxVIRpmk2bi','mastercard','12 / 2024'),(12,'Mark Christian Sanchez','$2a$10$bV5a3U8fuYoGWiOLRP50jOzde0oxb4A5ueF1GLCfFH/KYjWqe0p06','mastercard','12 / 2024');
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `customerID` int(11) NOT NULL,
  `addressType` enum('billing','delivery') NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,'billing','billing','OO','1234','REGION','COUNTRY'),(18,'billing','hehehe','fdfdfd','1121','fdfdfdf','AZ'),(18,'delivery','hehehe','fdfdfd','1121','fdfdfdf','AZ'),(19,'billing','THE','D','1211','L','AF'),(19,'delivery','THE','D','1211','L','AF'),(20,'billing','asdasdasdasdas','asdasads','1211','asdasd','AU'),(20,'delivery','asdasdasdasdas','asdasads','1211','asdasd','AU'),(21,'billing','fdsfsdfsdf','sdfsdfsdfsd','1211','sdfsdf','BH'),(21,'delivery','fdsfsdfsdf','sdfsdfsdfsd','1211','sdfsdf','BH'),(22,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(22,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(25,'billing','sdsdsd','sdsdsd','1211','sdsd','AU'),(25,'delivery','sdsdsd','sdsdsd','1211','sdsd','AU'),(26,'billing','DLLSUU','DDLSSU','12211','DDLSSU','PW'),(26,'delivery','DLLSUU','DDLSSU','12211','DDLSSU','PW'),(27,'billing','Good job','Manela','1311','Tixxxas','BH'),(27,'delivery','Good job','Manela','1311','Tixxxas','BH'),(28,'billing','CantAffordanerror','tassscore','3232','departments2','DZ'),(28,'delivery','CantAffordanerror','tassscore','3232','departments2','DZ'),(29,'billing','pons','ez','1234','peasey','AT'),(29,'delivery','pons','ez','1234','peasey','AT'),(30,'billing','Resurging','Menal','1234','hehehe','AU'),(30,'delivery','Resurging','Menal','1234','hehehe','AU'),(31,'billing','Immortals','TSM','1211','IMT','PA'),(31,'delivery','Immortals','TSM','1211','IMT','PA'),(-1,'billing','Immortals','TSM','1211','IMT','PA'),(-1,'delivery','Immortals','TSM','1211','IMT','PA'),(32,'billing','Manila','Manila','1004','NCR','PH'),(32,'delivery','Manila','Manila','1004','NCR','PH'),(-1,'billing','Manila','Manila','1004','NCR','PH'),(-1,'delivery','Manila','Manila','1004','NCR','PH'),(33,'billing','yeah','yesds','121','ssds','AF'),(34,'billing','2401 Malate','Manila','1255','NCR','AW'),(35,'billing','221 B Baker St.','Marylebone','12345','Marylebone','GB'),(36,'billing','123','123','123','123','AF'),(-1,'billing','Somewhere','Manila','1004','NCR','PH'),(-1,'delivery','Somewhere','Manila','1004','NCR','PH'),(38,'billing','Somewhere','Manila','1004','NCR','PH'),(38,'delivery','Somewhere','Manila','1004','NCR','PH');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cards`
--

DROP TABLE IF EXISTS `customer_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_cards` (
  `customerID` int(10) unsigned NOT NULL,
  `creditcardID` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cards`
--

LOCK TABLES `customer_cards` WRITE;
/*!40000 ALTER TABLE `customer_cards` DISABLE KEYS */;
INSERT INTO `customer_cards` VALUES (30,2),(31,3),(32,5),(33,7),(34,8),(35,9),(36,10),(36,12);
/*!40000 ALTER TABLE `customer_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `dateRegistered` datetime NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customerID_UNIQUE` (`customerID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,-1,'2017-02-01 15:12:09'),(3,4,'2017-02-01 15:48:45'),(4,5,'2017-02-04 17:06:17'),(6,7,'2017-02-04 18:19:31'),(7,8,'2017-02-04 18:29:12'),(11,9,'2017-02-05 13:38:43'),(12,10,'2017-02-05 13:46:55'),(13,11,'2017-02-05 14:00:08'),(14,12,'2017-02-05 14:28:38'),(15,13,'2017-02-05 14:49:50'),(16,14,'2017-02-05 14:52:06'),(17,15,'2017-02-05 14:57:47'),(18,16,'2017-02-05 15:02:17'),(19,17,'2017-02-05 15:21:49'),(20,18,'2017-02-05 15:46:08'),(21,19,'2017-02-05 15:49:45'),(22,20,'2017-02-05 15:56:10'),(25,23,'2017-02-05 16:15:15'),(26,24,'2017-02-05 17:03:19'),(27,25,'2017-02-05 17:08:25'),(28,26,'2017-02-05 17:10:10'),(29,27,'2017-02-05 17:39:06'),(30,28,'2017-02-05 18:03:18'),(31,29,'2017-02-06 08:44:37'),(32,30,'2017-02-08 15:08:31'),(33,31,'2017-02-14 23:15:06'),(34,32,'2017-02-15 13:03:34'),(35,33,'2017-02-15 13:30:01'),(36,34,'2017-02-15 15:13:58'),(38,36,'2017-03-14 02:21:27');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employeeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `dateHired` date NOT NULL,
  `employeeType` enum('Product Manager','Administrator','Account Manager') NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `employeeID_UNIQUE` (`employeeID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,0,'1996-09-10','Administrator');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `loginID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`loginID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,1,'failed','2017-02-01 15:49:45'),(2,1,'failed','2017-02-01 15:50:45'),(3,1,'failed','2017-02-01 15:48:45'),(4,1,'passed','2017-02-01 14:48:45'),(5,1,'failed','2017-02-01 01:48:45');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double unsigned NOT NULL,
  `avgRating` double unsigned DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`),
  UNIQUE KEY `avgRating_UNIQUE` (`avgRating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_list` (
  `cartID` int(10) unsigned NOT NULL,
  `productID` int(10) unsigned NOT NULL,
  `productQuantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_list`
--

LOCK TABLES `product_list` WRITE;
/*!40000 ALTER TABLE `product_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
  `typeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `managerID` int(10) unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`typeID`),
  UNIQUE KEY `typeID_UNIQUE` (`typeID`),
  UNIQUE KEY `type_UNIQUE` (`type`),
  UNIQUE KEY `managerID_UNIQUE` (`managerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `customerID` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `message` varchar(45) NOT NULL,
  `dateReviewed` datetime NOT NULL,
  PRIMARY KEY (`reviewID`),
  UNIQUE KEY `reviewID_UNIQUE` (`reviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `tokenID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `isActive` varchar(45) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`tokenID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,36,'6913f3c9-dc0a-4951-bd2b-81926fcec9f8','Yes'),(2,36,'84184a97-359c-484b-a3fb-abebbdfcff46','Yes'),(3,36,'9d827e23-08bf-11e7-b4b2-162f68b511e3','Yes'),(4,36,'dd3f2c94-08bf-11e7-a6b6-162f68b511e3','Yes'),(5,36,'2f4bf6ae-08c0-11e7-a330-162f68b511e3','Yes'),(6,36,'a4050a5f-08c6-11e7-b1e6-162f68b511e3','No');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transactionID` int(10) unsigned NOT NULL,
  `cartID` int(10) unsigned NOT NULL,
  `datePurchased` datetime NOT NULL,
  `totalAmount` double unsigned NOT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `transactionID_UNIQUE` (`transactionID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_events`
--

DROP TABLE IF EXISTS `user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_events` (
  `userID` int(11) unsigned NOT NULL,
  `alertType` varchar(15) NOT NULL,
  `description` varchar(128) NOT NULL,
  `dateTriggered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_events`
--

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(35) NOT NULL,
  `lastname` varchar(35) NOT NULL,
  `middleinitial` varchar(5) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` enum('active','banned') NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Mark','Sanchez','C','0007-07-10','$2a$10$NCrllngJfgm5nrM595nMlO4S5pimHPn6TiRx5Fwwn1QBEhAX5EQaG','meeerk','$2a$10$K0.DGKwnO0c7U.lA.S/ia.OZSf4.I0xDC4/XL26ul3qIB66Kx.tQ6','active'),(10,'hey','heyey','h','0007-08-10','$2a$10$7K6DiWBaKGsEx7mjm.3xROSCdNEug9sGKKFACgql2Cpn71EilkGm6','akoakoako','$2a$10$A/BTfnH8RaMb0yhcZWwoU.9ESCq1n0MBTXABIgdozDYASbJgMrvWC','active'),(11,'And','she','C','0007-09-07','$2a$10$MSTScyXcfzAfJwAXFxrDWuRus4qvG4QsyT3bd/3IhZ1GE2JIKWtIi','WEHHH','$2a$10$xf9.6p03v8qIszG9kRa06ODl9eopuc0YYB0LPZgw844tpbBq1o0vC','active'),(12,'gangplank','plank','C','0007-07-10','$2a$10$qdAUzZHiVAU.rcztMGX6GuU0HWwAOWY61.YrvM1Bd0Ix2m9tAW8mu','gangplank','$2a$10$qjN40iWw/nFEEaUHygJSvePH5AOGhY86NsNS1g.qdAE38V8xJAQD6','active'),(13,'ghahah','hahah','C','0007-09-07','$2a$10$O1OzlYOL5CpkCqJHVWnbeeX9xLVRsvkn70Fxtk.R9GHerS3J1.Orm','asad123','$2a$10$SI4wM8dhcuCpXEleR6YPW.7qshftaH82s89wttWmzkfSTA9f1q41K','active'),(14,'acl','mcl','u','0007-07-10','$2a$10$xiqAvpthh4qH5LlyOAlkYejPXtIwD4mbIq2gYRtqlkq.72TzNONJC','gaggggs','$2a$10$0WM5BWJzuSNDTmRUjZp.leJwsPbibl0ggWOD6LQvCATYVAIrOGa3W','active'),(15,'Hello','Isitme','Y','0007-08-10','$2a$10$tLydYwYf7ANC8TcAIELrQurtKqHsbyQyc4cMm4ieHSmBGl685Blxi','hehehehehe','$2a$10$cX8BQFjBVbeS/r4mx1Ln.e2o77YOTU/sbpGabQf36V61fNi7QKvVm','active'),(16,'negro','poso','n','0007-09-07','$2a$10$xfHe76q8HEpXSpTb0iYlcOkL7wn8Ge3vC0OW0XjnYKi1mX7dxbJd6','hehexD','$2a$10$1u.yx2gzGyWLBXI6cPco2eMKUEldAZIoYy4iwY6Xo5kl4mPRluTM.','active'),(17,'Molds','threads','T','0007-07-10','$2a$10$mb78qfUkDVnOOyjkyINbiuv81fHULLTY8cbAEPcPXAI84jbQM8n9W','tiam','$2a$10$VhZHPlb3JCQ1qijgb1g1H.QGC7wcOO6LvDuEOZBb3sDreK5Z/OkaS','active'),(18,'Hello','ITsame','m','0007-09-07','$2a$10$4EyJvG2iz7Ry3eaDLqnBxeQm.97moxF/o.yF.Yz2uO29G6TQHq9wK','akoakoakoooo','$2a$10$VL7FY.McF5rP31Qv2NrQzuOgxAP94SVCBHSSZr8YYCvXmeGggetzO','active'),(19,'happy','to','s','0018-08-09','$2a$10$kbhMxAw66nsIfY/hfHZZjOewvhB2BmdOSWbgxAh9.hHs/8ookzwK.','wehhvol','$2a$10$TdEXL/p.BUwaP6ME471MC.QSGaDlhNt9MPR/q2YMCkTA18L6YXFW2','active'),(20,'hhee','heeee','c','0007-08-10','$2a$10$wSCd57jte5tFc3jkSqMyIexX49geotmKTmtfdXAW6bpnrMz4JpVu6','seasn79','$2a$10$jX4rYjyX2UGxUGl807O6oekJwn1A6XIkSNC7u/Jn6m9kKRPk2TasG','active'),(23,'She','Wants','D','0008-09-06','$2a$10$2Oex313fwdKFjCPVxYOdf.yRxSkk1PCz7edXcg3qH8Hk5iU63EcR2','markkkere','$2a$10$DENUdX/jy84R8cLxjrbx9OOuFANciab5ireHAdRYy2Bkt0a9qiPqy','active'),(24,'Foo','Barr','F','0007-07-10','$2a$10$sKJBw4C85Q9TlDCUTrZlReKdQOXx/P7m.BDNMWzSHekcIekYrHzbC','sdfsdfsdfsddd','$2a$10$b3qKXk7.qm6gjsv.Cy0x6O4rgNYWZCJB/yGdl14O0Vv/nULHoSsSK','active'),(25,'Kick','KickMe','W','0007-08-10','$2a$10$RSTrcSN38rzVS/ePssFDGuZGsIuruWQ6rY0hD7O2nPws3UatgdfZS','acrcher','$2a$10$50w8mQ3LEkA3eB9/YAebYuz/eUHijuvmMJcx1RXFo3go2XV4yY.dy','active'),(26,'Good','Jobb','J','0007-08-10','$2a$10$ecEtMkBKnkC9PgdYhcGUC.UVMy2TWzWKQhrt/Yp8gc9zW8fNPOvuu','setpoint','$2a$10$G8fte0JZBfazjLaqMToRLeC5qHtvGzO/JvHIvg77DuGTZnkdYdRde','active'),(27,'Down','The','W','0007-09-07','$2a$10$y14RSZuYnj8k/4lxfA1.Dea1/iRbUApQuBArZDzk1z5220Q.o6sa6','heheheheheee','$2a$10$9ABi5CiVtwbryE6xAceKR.gJmnWCnM.FdCmHWDNyvgdyLuiw36B9q','active'),(28,'Team','Dignitas','D','0007-08-10','$2a$10$9jchGtDOLlAN54qQRzc78.ZTWx3EjVtIDzRuiCy/5kC1gAG4JdxYC','dignitas','$2a$10$VPhVCid3lJT1EM4SR5Joie/KIrDWuEeGgTPrGvWq1r.LiQ6g/0pju','active'),(36,'Mark','Sanchez','C','0015-03-19','$2a$10$A.kvz2jOhCNGFXMqsb3H4.aSJLKJGXrGtKJKyiN60ShQU75zebVQi','merksachii','$2a$10$J0bwI9bpRVGdHSWvoCf0.e2yhPv5eiC0a/cH28z53GrBLZHGA3xIu','active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-15  1:50:46

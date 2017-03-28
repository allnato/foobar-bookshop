CREATE DATABASE  IF NOT EXISTS `foobar_booksop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `foobar_booksop`;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES (1,'MCS','$2a$10$cwAB8EKjNpkFrTqPHwv/4e8Ptpf1ewKm3XN37qFuWsdg9B07bjwj6','mastercard','12 / 2024'),(2,'Mark Christian Sanchez','$2a$10$e2sLG4.B7XMnVXCj7DmTh.m/wMDEuDIA7v6z5p34q7IvMbU8y54Bi','mastercard','12 / 2024'),(3,'MCCS','$2a$10$Fme4.9ih77tSK/5NSPe.2emMA.RSLvhhcPPeFow7GNJM1xuOmq0zW','mastercard','12 / 2024'),(4,'MCCS','$2a$10$JOkd0SFVGDfHjHV4ODkfFesbS4hO5Zg1BvTtNVaja2x6/7i8adNma','mastercard','12 / 2024'),(5,'Mark Christian Sanchez','$2a$10$UCHf0mE24EIV0SvbaHEHUOt0A5kEKSmcTFLklexqdIhZDcmYcxyIO','mastercard','12 / 2024'),(6,'Mark Christian Sanchez','$2a$10$5IotXDwhUd0vV9M6OVWBEeZel5fwR09eRM/m8unm39CxswMukJB8S','mastercard','12 / 2024'),(7,'MCS','$2a$10$KD7o6ShRVSJaga4MoZ5GLulQ3lK2ZPv7iooWbLxmSuIET2LOvzDjO','mastercard','12 / 2024'),(8,'Random Person','$2a$10$4D4MTiStJjM3yHfgsVAgUu5JcxejH/UH/ae.9KkVnM9jnQT22lHwG','mastercard','10 / 20'),(9,'Jane Doe','$2a$10$LFkCn1Qisx02L/MNuLnFherXohAjPvykKjl9nQqLzPKo/PRcrzpDO','mastercard','10 / 20'),(10,'1234','$2a$10$n3Xu6ODH3szFfA8heVQnKuADRKBScqgyd2sJ4Rtrf.YoV1VR0yz1C','visa','12 / 91'),(11,'Wil Smith','$2a$10$oQfUVxY4SsWqDLnxs6mP.e33iMb1CV5xL5rZfK7kv6opByUdMvQCu','mastercard','03 / 2017'),(12,'Wil Smith','$2a$10$AHTwGHAXHry4CTaorE1TMuoFmf8vU.bzdNuSjoIbWrrJQkpmr/.RS','mastercard','03 / 2017'),(13,'Wil Smith','$2a$10$hR4JkTxiLV16E7NTjqHtN.R2xIVFB9FEoA0cm74M1yqfwsIn3PJTW','mastercard','01 / 2017'),(14,'Wil Smith','$2a$10$DCdzisLBg4IAkmRxSgbJq.ODDScPkqXwp4hpw4LQcle/S5ZxBuRwm','mastercard','01 / 2017'),(15,'Wil Smith','$2a$10$z2rEHsHd2YsvOQ2R4SYkkODK4FP8VRY6zoZYbvCaH15cnO/4K8USC','mastercard','01 / 2017'),(16,'Erik Cartman','$2a$10$SlClSrX1hyeEgHruYTBB3et/unJ6J1RHVZrJ.gnDKNdCnGKRQn79u','visa','01 / 0101'),(17,'Erik Cartman','$2a$10$4szhOLP4xVLZ3OZ9xeJMde1PVMnJbFzNgaNclwpoIkkUbBjksJ5Rm','visa','10 / 1010'),(18,'Timmy Timmy','$2a$10$fPRROHZPAKpdOSqxwK1hwONyC0tYhv0lOZt.BJ4YTGi3exCbzwmdK','visa','11 / 1111'),(19,'Mark Christian C Sanchez','$2a$10$BMJGkuUSC/QTFysBXnsvkOTXnYVQ.MvwdR3rXMeYtKA7w461.y85i','mastercard','12 / 24'),(20,'Wortherscheriers','$2a$10$MAiA6/nimCnvnv9j1gtnduusudNs7ZplcNPaF4ggD2f61upNPZjli','visa','12 / 24'),(21,'sdfsdfsdf','$2a$10$2WVf38twPtzPP2VrfYd5xuy6Hr18gJWsgliKRvwp/QNWF0GRPOJbe','visa','12 / 24'),(22,'Vovo On Hand','$2a$10$E/JkVuSd5PjRbUx2tD6a1.Htr2.HqICbxXw2KjnBQtzaAA8ccSoWm','visa','12 / 99'),(23,'OLLS','$2a$10$k3vkn.UlNDZRTJxPjSvf/O3zpW20yFaraHqcxxKSF4Ttp.TKRUKFe','visa','12 / 2024');
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
  `address` varchar(255) NOT NULL,
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
INSERT INTO `customer_address` VALUES (1,'billing','billing','OO','1234','REGION','COUNTRY'),(18,'billing','hehehe','fdfdfd','1121','fdfdfdf','AZ'),(18,'delivery','hehehe','fdfdfd','1121','fdfdfdf','AZ'),(19,'billing','THE','D','1211','L','AF'),(19,'delivery','THE','D','1211','L','AF'),(20,'billing','asdasdasdasdas','asdasads','1211','asdasd','AU'),(20,'delivery','asdasdasdasdas','asdasads','1211','asdasd','AU'),(21,'billing','fdsfsdfsdf','sdfsdfsdfsd','1211','sdfsdf','BH'),(21,'delivery','fdsfsdfsdf','sdfsdfsdfsd','1211','sdfsdf','BH'),(22,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(22,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'billing','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(-1,'delivery','asdasdasdas','dasdasdasd','1211','asdasda','AW'),(25,'billing','sdsdsd','sdsdsd','1211','sdsd','AU'),(25,'delivery','sdsdsd','sdsdsd','1211','sdsd','AU'),(26,'billing','DLLSUU','DDLSSU','12211','DDLSSU','PW'),(26,'delivery','DLLSUU','DDLSSU','12211','DDLSSU','PW'),(27,'billing','Good job','Manela','1311','Tixxxas','BH'),(27,'delivery','Good job','Manela','1311','Tixxxas','BH'),(28,'billing','CantAffordanerror','tassscore','3232','departments2','DZ'),(28,'delivery','CantAffordanerror','tassscore','3232','departments2','DZ'),(29,'billing','pons','ez','1234','peasey','AT'),(29,'delivery','pons','ez','1234','peasey','AT'),(30,'billing','Resurging','Menal','1234','hehehe','AU'),(30,'delivery','Resurging','Menal','1234','hehehe','AU'),(31,'billing','Immortals','TSM','1211','IMT','PA'),(31,'delivery','Immortals','TSM','1211','IMT','PA'),(-1,'billing','Immortals','TSM','1211','IMT','PA'),(-1,'delivery','Immortals','TSM','1211','IMT','PA'),(32,'billing','Manila','Manila','1004','NCR','PH'),(32,'delivery','Manila','Manila','1004','NCR','PH'),(-1,'billing','Manila','Manila','1004','NCR','PH'),(-1,'delivery','Manila','Manila','1004','NCR','PH'),(33,'billing','yeah','yesds','121','ssds','AF'),(34,'billing','2401 Malate','Manila','1255','NCR','AW'),(35,'billing','221 B Baker St.','Marylebone','12345','Marylebone','GB'),(36,'billing','123','123','123','123','AF'),(-1,'billing','none','none','1234','none','AF'),(-1,'billing','none','none','1234','none','AF'),(-1,'billing','none','none','1234','none','US'),(40,'billing','none','none','1234','none','KE'),(-1,'billing','none','none','1234','none','KE'),(41,'billing','none','none','1234','none','AF'),(42,'billing','none','none','1234','none','AE'),(44,'billing','none','none','1234','none','AR'),(44,'delivery','none','none','1234','none','AR'),(45,'billing','Unit 3416, The Manila Residences Tower 2, Taft Avenue','Malate','1004','Metro Manila~Manila','PH'),(45,'delivery','Unit 3416, The Manila Residences Tower 2, Taft Avenue','Malate','1004','Metro Manila~Manila','PH'),(46,'billing','sdfsdf','sfdsdfsdf','1233','sdfsdfsdf','AF'),(46,'delivery','dfsdfsdf','sdfsdf','1211','sdfsdfs','CU'),(47,'billing','asdfsdfsdf','sdfsdfsdf','1211','sdfsfsdf','AF'),(47,'delivery','sdfsdfsdf','sdfsdf','1211','sdfsdfsd','AF'),(48,'billing','Joe','Pakistan','1004','Pak','UZ'),(48,'delivery','ghgh','ghghg','1211','ghgh','BB'),(49,'billing','Foobs gago','fafafa','1004','fafafa','PH'),(49,'delivery','f414141','fafaf','1004','fafafa','PH');
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
INSERT INTO `customer_cards` VALUES (30,2),(31,3),(32,5),(33,7),(34,8),(35,9),(36,10),(40,14),(41,16),(42,17),(39,18),(40,19),(41,20),(42,21),(48,22),(49,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,-1,'2017-02-01 15:12:09'),(3,4,'2017-02-01 15:48:45'),(4,5,'2017-02-04 17:06:17'),(6,7,'2017-02-04 18:19:31'),(7,8,'2017-02-04 18:29:12'),(11,9,'2017-02-05 13:38:43'),(12,10,'2017-02-05 13:46:55'),(13,11,'2017-02-05 14:00:08'),(14,12,'2017-02-05 14:28:38'),(15,13,'2017-02-05 14:49:50'),(16,14,'2017-02-05 14:52:06'),(17,15,'2017-02-05 14:57:47'),(18,16,'2017-02-05 15:02:17'),(19,17,'2017-02-05 15:21:49'),(20,18,'2017-02-05 15:46:08'),(21,19,'2017-02-05 15:49:45'),(22,20,'2017-02-05 15:56:10'),(25,23,'2017-02-05 16:15:15'),(26,24,'2017-02-05 17:03:19'),(27,25,'2017-02-05 17:08:25'),(28,26,'2017-02-05 17:10:10'),(29,27,'2017-02-05 17:39:06'),(30,28,'2017-02-05 18:03:18'),(31,29,'2017-02-06 08:44:37'),(32,30,'2017-02-08 15:08:31'),(33,31,'2017-02-14 23:15:06'),(34,32,'2017-02-15 13:03:34'),(35,33,'2017-02-15 13:30:01'),(36,34,'2017-02-15 15:13:58'),(40,35,'2017-03-05 23:37:02'),(41,36,'2017-03-07 23:00:12'),(42,37,'2017-03-07 23:07:37'),(43,38,'2017-03-07 23:16:30'),(44,39,'2017-03-15 13:39:30'),(45,40,'2017-03-26 15:01:19'),(46,41,'2017-03-26 17:08:44'),(47,42,'2017-03-26 17:16:22'),(48,43,'2017-03-28 02:14:12'),(49,44,'2017-03-28 02:28:47');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwords` (
  `passID` int(11) NOT NULL AUTO_INCREMENT,
  `hashed` varchar(256) NOT NULL,
  `encrypted` varbinary(256) NOT NULL,
  `vector` varbinary(100) NOT NULL,
  `timestamp` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`passID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES (2,'$2a$10$OUYz9I1vucc6j4chqc8I2eILgVDTyFv4lvws9Um0Tu6sJaJfEfJ0i','\n√ä5Y√ß%√Ö√é~√°k¬Ñ','¬©√π7fQ¬µ¬≥√†Q¬∏¬î√µ√ú√ü√è','2017-03-05 23:37:09',35),(3,'$2a$10$61RSU7cIjWOogiggSTP9duxyPum7oBcffONhLtjPk0WLS0xAi6h7K','√ß√≠C¬û¬òX4Bi¬ö6A¬±P)','nq¬ÖuGzm,$@¬•¬õ¬ñ¬©`','2017-03-05 23:48:47',35),(4,'$2a$10$aSvGKE1OVJg6GzBN5xJWRe/6ZfeYGLt0nggykYdatvksjtkm1xejO','¬±√¨(y¬êG}¬£7¬°X√ñ`S','vaW¬à¬ß^+¬ê√∂h¬ì.¬Ñ','2017-03-07 23:00:18',36),(5,'$2a$10$DbRe6n7kbQgPMEkARyex1.I9nRncfcgZ5TvkNYjYbcxqGTPCB5A9u','¬än√ç-√¢√ß√®√º¬¥√≥√≥	¬ó¬®¬Ü\0','x¬µc=√™√ß¬õN¬∞¬º\Z\0√úO√π','2017-03-07 23:07:40',37),(6,'$2a$10$yBQhFOyrFOJ/fLU6yS3WCuZ63S.ulMIrxYwnaBZp9zbdicyffC8ma','l\Z5Os$¬Ø¬∑√ô\Z¬æ\r√å¬†¬¨','√©G¬∞dJ	Yu¬±~¬öLa\r','2017-03-15 13:39:34',39),(7,'$2a$10$TBo9xkSs40wDmwTjI4M/IeCjSfhEa3lDKjWyUnyllPrAUsAaS98xG','ZV\„∑Ió8\È-(2Ì∫â\ÍµD\Ÿx{ÉΩz§àˆ∞ÜH','Üb\\\‘¡X\r.™R¥lWî','2017-03-26 15:01:21',40),(8,'$2a$10$74lt6Cd9krfIlJfZcMwj3ujO6BOu/lbDOJo3zQvvUB.3LJrbtjNT.','ù\Î\Ápâ\—U\∆\‘\‚›µq∂ΩM','3Ñ1YE˜Gõ∂S¨Có\Á◊©','2017-03-26 17:16:24',42),(9,'$2a$10$uUKholA6sBTBeU7LJplE4.v1M7f5cPvNZpDVG67l9ldgWZG7zrcsi','™∞LqıY¯\ÍBåïvO','(ã#8\⁄w83C1Ñvn8','2017-03-28 04:50:40',43),(10,'$2a$10$wD2dL8hBk1R51db0I8vvweoweq60jVGoia5EI0cCW5Sly8SJWoZdO','ãE∞6DZ\\\÷r0\‘q¿^','œßbo\Ãıf¸u-n˛7Eû•','2017-03-28 02:28:49',44);
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
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
  `avgRating` double unsigned DEFAULT '0',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`),
  UNIQUE KEY `avgRating_UNIQUE` (`avgRating`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Star Wars','In the long long ago',500,5);
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
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `reviewID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
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
  `tokenID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `isActive` varchar(45) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`tokenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
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
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `alertType` varchar(15) NOT NULL,
  `responseCode` int(11) NOT NULL,
  `serviceSource` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_events`
--

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;
INSERT INTO `user_events` VALUES (18,0,'Error',0,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-15 14:33:32'),(19,0,'Error: 500',0,'edu.secprog.services.AccountService','Sql Exception','2017-03-15 14:38:09'),(20,0,'Error',0,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-15 14:38:09'),(21,0,'Error: 500',0,'edu.secprog.services.AccountService','Sql Exception','2017-03-15 18:34:36'),(22,0,'Error',0,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-15 18:34:36'),(23,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 17:50:34'),(24,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 18:45:34'),(25,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 19:02:18'),(26,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 19:57:22'),(27,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 20:05:47'),(28,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 20:14:40'),(29,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 20:31:16'),(30,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 20:52:27'),(31,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-25 23:32:52'),(32,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:19:25'),(33,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:26:12'),(34,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:27:35'),(35,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:28:36'),(36,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:29:42'),(37,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:30:14'),(38,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:36:04'),(39,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 00:37:51'),(40,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 01:05:13'),(41,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 01:06:32'),(42,39,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 01:21:44'),(43,40,'Info',200,'edu.secprog.servlets.RegisterServlet','A New User Registered','2017-03-26 15:01:21'),(44,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 15:01:55'),(45,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 15:55:35'),(46,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 15:57:11'),(47,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-26 15:58:26'),(48,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 15:58:34'),(49,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:00:06'),(50,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:01:55'),(51,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:16:37'),(52,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:30:22'),(53,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:31:13'),(54,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:31:58'),(55,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 16:44:17'),(56,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 17:02:46'),(57,42,'Info',200,'edu.secprog.servlets.RegisterServlet','A New User Registered','2017-03-26 17:16:24'),(58,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 17:20:22'),(59,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 21:24:42'),(60,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-26 21:25:58'),(61,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 12:55:35'),(62,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:12:38'),(63,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:25:56'),(64,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:28:46'),(65,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:50:03'),(66,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:53:06'),(67,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:55:51'),(68,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 15:57:19'),(69,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-27 22:14:53'),(70,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 01:52:16'),(71,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 01:54:35'),(72,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 01:58:16'),(73,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:02:15'),(74,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:07:16'),(75,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:08:24'),(76,43,'Info',200,'edu.secprog.servlets.RegisterServlet','A New User Registered','2017-03-28 02:14:15'),(77,40,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:15:13'),(78,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 02:15:29'),(79,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:15:34'),(80,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 02:21:09'),(81,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:21:17'),(82,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 02:23:08'),(83,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:23:13'),(84,44,'Info',200,'edu.secprog.servlets.RegisterServlet','A New User Registered','2017-03-28 02:28:49'),(85,44,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 02:29:49'),(86,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 03:26:29'),(87,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:10:53'),(88,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:12:24'),(89,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:13:42'),(90,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:15:15'),(91,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:16:22'),(92,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:17:30'),(93,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:22:13'),(94,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:24:09'),(95,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:25:44'),(96,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:27:55'),(97,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:29:10'),(98,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 04:29:51'),(99,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 04:30:06'),(100,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:30:12'),(101,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:33:22'),(102,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:33:41'),(103,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 04:33:48'),(104,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:50:24'),(105,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 04:50:45'),(106,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 21:52:15'),(107,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 21:52:30'),(108,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 21:53:56'),(109,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 22:52:05'),(110,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:29:57'),(111,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:31:38'),(112,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:34:43'),(113,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:35:00'),(114,0,'Error',599,'edu.secprog.servlets.LoginServlet','Invalid username or password','2017-03-28 23:36:58'),(115,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:37:12'),(116,43,'Info',200,'edu.secprog.servlets.LoginServlet','Successful user log in','2017-03-28 23:37:46');
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
  `status` enum('active','banned') NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gago','Hehe','C',NULL,'mark@dlsu','hehe','active'),(4,'Mark','Sanchez','C','0006-10-08','dlsuuu.sachii@gmail.com','sdfsdf','active'),(5,'Lefty','Hefty','H','0007-07-10','lf@gmail.com','asdasdd','active'),(7,'You say','Im Crazy','I','0017-11-04','youdontthink@gmail.com','qwertplp','active'),(8,'confidence','confidence','c','0007-07-10','confidence@g.com','ww121ww','active'),(9,'Mark','Sanchez','C','0007-07-10','$2a$10$NCrllngJfgm5nrM595nMlO4S5pimHPn6TiRx5Fwwn1QBEhAX5EQaG','meeerk','active'),(10,'hey','heyey','h','0007-08-10','$2a$10$7K6DiWBaKGsEx7mjm.3xROSCdNEug9sGKKFACgql2Cpn71EilkGm6','akoakoako','active'),(11,'And','she','C','0007-09-07','$2a$10$MSTScyXcfzAfJwAXFxrDWuRus4qvG4QsyT3bd/3IhZ1GE2JIKWtIi','WEHHH','active'),(12,'gangplank','plank','C','0007-07-10','$2a$10$qdAUzZHiVAU.rcztMGX6GuU0HWwAOWY61.YrvM1Bd0Ix2m9tAW8mu','gangplank','active'),(13,'ghahah','hahah','C','0007-09-07','$2a$10$O1OzlYOL5CpkCqJHVWnbeeX9xLVRsvkn70Fxtk.R9GHerS3J1.Orm','asad123','active'),(14,'acl','mcl','u','0007-07-10','$2a$10$xiqAvpthh4qH5LlyOAlkYejPXtIwD4mbIq2gYRtqlkq.72TzNONJC','gaggggs','active'),(15,'Hello','Isitme','Y','0007-08-10','$2a$10$tLydYwYf7ANC8TcAIELrQurtKqHsbyQyc4cMm4ieHSmBGl685Blxi','hehehehehe','active'),(16,'negro','poso','n','0007-09-07','$2a$10$xfHe76q8HEpXSpTb0iYlcOkL7wn8Ge3vC0OW0XjnYKi1mX7dxbJd6','hehexD','active'),(17,'Molds','threads','T','0007-07-10','$2a$10$mb78qfUkDVnOOyjkyINbiuv81fHULLTY8cbAEPcPXAI84jbQM8n9W','tiam','active'),(18,'Hello','ITsame','m','0007-09-07','$2a$10$4EyJvG2iz7Ry3eaDLqnBxeQm.97moxF/o.yF.Yz2uO29G6TQHq9wK','akoakoakoooo','active'),(19,'happy','to','s','0018-08-09','$2a$10$kbhMxAw66nsIfY/hfHZZjOewvhB2BmdOSWbgxAh9.hHs/8ookzwK.','wehhvol','active'),(20,'hhee','heeee','c','0007-08-10','$2a$10$wSCd57jte5tFc3jkSqMyIexX49geotmKTmtfdXAW6bpnrMz4JpVu6','seasn79','active'),(23,'She','Wants','D','0008-09-06','$2a$10$2Oex313fwdKFjCPVxYOdf.yRxSkk1PCz7edXcg3qH8Hk5iU63EcR2','markkkere','active'),(24,'Foo','Barr','F','0007-07-10','$2a$10$sKJBw4C85Q9TlDCUTrZlReKdQOXx/P7m.BDNMWzSHekcIekYrHzbC','sdfsdfsdfsddd','active'),(25,'Kick','KickMe','W','0007-08-10','$2a$10$RSTrcSN38rzVS/ePssFDGuZGsIuruWQ6rY0hD7O2nPws3UatgdfZS','acrcher','active'),(26,'Good','Jobb','J','0007-08-10','$2a$10$ecEtMkBKnkC9PgdYhcGUC.UVMy2TWzWKQhrt/Yp8gc9zW8fNPOvuu','setpoint','active'),(27,'Down','The','W','0007-09-07','$2a$10$y14RSZuYnj8k/4lxfA1.Dea1/iRbUApQuBArZDzk1z5220Q.o6sa6','heheheheheee','active'),(28,'Team','Dignitas','D','0007-08-10','$2a$10$9jchGtDOLlAN54qQRzc78.ZTWx3EjVtIDzRuiCy/5kC1gAG4JdxYC','dignitas','active'),(29,'Lee','Sin','B','0007-09-07','$2a$10$.rmWjPUgeil7QoQw4xcIvu10hiecqCGM6Y83jZEMrbFniuzphYQHK','leesin','active'),(30,'Mark','Sanchez','C','0015-03-19','$2a$10$oZeMP/SAN.k6wfXX17a4WeHqD9ZM4y8AgMi0IPIm2usITdJ4wrjoq','msanchez','active'),(31,'Mark','Sachii','C','2017-02-09','$2a$10$3etqbgma9SH8XB3IWcg0nuRCK7nzZ1DVwSaPbE90XXZheco99c5Im','merksachii','active'),(32,'random','person','R','0009-06-12','$2a$10$2W9TQ5cUX/EAVGvB8ATd5utBhA4A6H6IwswFPqbDCVU4d3I55wqgi','random','active'),(33,'Jane','Doe','M','2017-02-28','$2a$10$c9IihqQQbLvK8EI5sLN4U.YxDuVF8q2fJvj2uolTRdB8pWmy2CrjW','janedoe','active'),(34,'e','e','e','2015-12-02','$2a$10$r1Z4xuPAkB04CcoeJlVuGeAPXhKFIC1TzzLN7.ef1DqTGQeoTiX2u','1234','active'),(35,'Wil','Smith','S','2017-03-02','$2a$10$nIef9NhXAMbQRX8dmyy3rOOz31lseTOsTG7Y0g6NKXOYtMV796ZNK','smith','active'),(36,'Erik','Cartman','J','2017-03-02','$2a$10$NArAGW5rqtajE/iOvAIz0uxlJS8qgTVplC4NIC5lUc2oFnSi./3lq','erik','active'),(37,'Erik','Cartman','J','2017-02-27','$2a$10$B6AMax3ObTUkcHdVHtJb.uL4/A766BcHMz8lsl.M1HvfOuiylRX7G','cartman','active'),(38,'Kyle','Brof','H','2017-02-27','$2a$10$PuMS1hvApacIZCdPdne7zOo4KeZ2O87r86KTk.ePklK35bg7Uk9S6','kyle','active'),(39,'Timmy','Timmy','T','0009-10-08','$2a$10$w544sTxc2XD4aZp7kYGw7u2v8FgC8SKD7UVh1GV5I4qHVhbOciTuK','timmy','active'),(40,'Mark','Sanchez','C','1996-09-10','$2a$10$jcpLwJK1gOASEw2AmdCpD.PLrWId7PSU01lNPT4cS7Qe8kUwxf1v2','dlsusachii','active'),(41,'dsfsdfds','sdfsdfsdf','s','2017-03-07','$2a$10$uV0aovnyG1eqQNAVrY47LeEfkuSb9pVHOgeG1QvP4CA/MSLRVUUCC','asdfsdfsdf','active'),(42,'Gags','Gags','G','2017-03-03','$2a$10$wMx8GaOm.Kq0cVniDm0E2ONJ71Dzsj1hN0ZwuNo9qDhJvkyYDw.dm','oooooooooo','active'),(43,'Joe','Pakistan','U','1999-03-04','$2a$10$vFF6qsozkXPbuglbqxQ58OSWSVYTjRGnFb65/sfKrGG.IVg5aFEge','joepakistani','active'),(44,'ollen','nello','o','2017-03-18','dlsu.sachii@gmail.com','ollen','active');
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

-- Dump completed on 2017-03-28 23:55:28

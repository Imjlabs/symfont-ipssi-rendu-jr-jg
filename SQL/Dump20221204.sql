-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: symfony_ipssi_rendu
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E66F675F31B` (`author_id`),
  CONSTRAINT `FK_23A0E66F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,2,'Article 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet nisi urna, a venenatis erat blandit ac. Nam nec ex quis nisl fringilla tristique eget vitae nisi. Pellentesque et feugiat est. Aenean aliquet consectetur ultrices. Cras sollicitudin tortor urna, ut laoreet orci tempus et. Fusce vitae purus lorem. Praesent eget ultrices elit. Suspendisse ac cursus dui, ut dictum libero. Cras venenatis nulla ac velit sollicitudin pharetra. Vestibulum non est eget tellus accumsan accumsan eget vel est. Duis at nunc nibh. Etiam eget nulla quis dui sagittis finibus.','2022-12-01 17:11:46','2022-12-01 17:11:46',NULL),(2,2,'Article 2','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec elementum consequat euismod. Vestibulum nulla mi, euismod et mattis sit amet, consequat sit amet lacus. Vivamus urna lacus, vehicula sed elit et, varius vestibulum lacus. Duis varius urna enim, ut tincidunt purus condimentum non. Pellentesque condimentum purus non diam fermentum, sit amet rutrum orci posuere. Nulla ullamcorper, mi ut pretium tempor, leo urna condimentum nisi, id venenatis dui velit tristique orci. Etiam et lobortis elit. Mauris molestie diam in velit ultrices, sit amet venenatis lorem facilisis. Nullam turpis sem, varius et nulla quis, congue rhoncus turpis. Sed porta venenatis purus, vitae vestibulum diam consequat eu. Etiam sollicitudin mattis elementum. Etiam nisi nisi, tristique at metus non, finibus posuere risus. Proin pretium rhoncus felis sit amet mattis. Suspendisse non arcu nec nisi varius vulputate.','2022-12-01 17:11:54','2022-12-01 17:11:54',NULL),(3,2,'Article 3','Aliquam non consectetur metus, in lobortis est. Nam placerat ante eu erat sagittis, vitae aliquam odio laoreet. Fusce vel commodo ipsum, at laoreet enim. Duis pulvinar rutrum mauris, id aliquam odio cursus sit amet. Sed in laoreet odio, in gravida dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris porta tristique neque eget faucibus. Ut at sem at risus porta porta ut viverra ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec dolor eget arcu scelerisque dictum ac id ante. Donec nec turpis lorem. Nunc sed dignissim leo, et vulputate purus. Praesent id lobortis justo.','2022-12-01 17:11:56','2022-12-01 17:11:56',NULL),(4,2,'Article 4','Quisque eget ante euismod, vehicula eros et, pellentesque risus. Quisque viverra, risus a sodales malesuada, nunc magna posuere magna, at auctor diam orci vitae odio. Nam vestibulum commodo quam. Ut ultrices eget leo vitae condimentum. Morbi quis velit quis purus posuere sagittis. Duis sed gravida purus. Nullam non nisi auctor, faucibus quam a, venenatis nunc. Aenean mi orci, facilisis at lorem et, tincidunt viverra neque. Mauris scelerisque, velit sit amet tristique fermentum, leo mi cursus sapien, ac feugiat velit massa ut sem. Curabitur augue enim, lacinia non condimentum at, mollis non arcu. Vivamus aliquet nibh in libero tincidunt laoreet. Donec pretium id est nec maximus. Integer nec libero elit. Praesent fringilla hendrerit massa, nec lacinia libero iaculis vel. Fusce bibendum sem vel ultrices faucibus. Donec elementum risus semper congue dictum.','2022-12-01 17:14:55','2022-12-01 17:14:55',NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA388B7A76ED395` (`user_id`),
  CONSTRAINT `FK_BA388B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,'notValidate'),(2,2,'notValidate'),(3,3,'notValidate'),(4,4,'notValidate'),(5,5,'notValidate');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2890CCAA4584665A` (`product_id`),
  KEY `IDX_2890CCAA1AD5CDBF` (`cart_id`),
  CONSTRAINT `FK_2890CCAA1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK_2890CCAA4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_product`
--

LOCK TABLES `cart_product` WRITE;
/*!40000 ALTER TABLE `cart_product` DISABLE KEYS */;
INSERT INTO `cart_product` VALUES (9,2,1,3);
/*!40000 ALTER TABLE `cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Catégorie 1'),(2,'Catégorie 2');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `seller_id` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  KEY `IDX_D34A04AD8DE820D9` (`seller_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_D34A04AD8DE820D9` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Produit 1','Description du produit 1',10,NULL,'2022-12-01 17:43:16','2022-12-01 17:43:16',1,0,'active'),(2,2,'Produit 2','Description du produit 2',30,NULL,'2022-12-01 17:43:25','2022-12-01 17:43:25',1,5,'active'),(3,1,'Produit 3','Description du produit 3',60,NULL,'2022-12-01 17:43:25','2022-12-01 17:43:25',1,9,'inactive'),(4,1,'Produit 4','Description du produit 4',100,NULL,'2022-12-01 17:43:25','2022-12-01 17:43:25',1,0,'inactive'),(5,2,'Produit 5','Description du produit 5',50,NULL,'2022-12-01 17:43:25','2022-12-01 17:43:25',1,0,'active'),(6,1,'Produit 6','Description du produit 6',10,NULL,'2022-12-02 09:57:14','2022-12-02 09:57:14',1,8,'active'),(7,1,'Produit 7','Description du produit 7',80,NULL,'2022-12-02 09:57:14','2022-12-02 09:57:14',1,9,'active'),(8,1,'Produit 8','Description du produit 8',60,NULL,'2022-12-02 09:57:14','2022-12-02 09:57:14',1,3,'active'),(9,2,'Produit 9','Description du produit 9',50,NULL,'2022-12-02 09:57:14','2022-12-02 09:57:14',1,3,'inactive'),(10,1,'Produit 10','Description du produit 10',50,NULL,'2022-12-02 09:57:14','2022-12-02 09:57:14',1,8,'inactive');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user@gmail.com','[]','$2y$13$qTJzGNwwYkfTzAN1VmxToO58O5swFqCd/VlqlzdNck/z3gIq8HjBK','user','user'),(2,'admin@gmail.com','[\"ROLE_USER\", \"ROLE_ADMIN\"]','$2y$13$xjw1uIJg/Jt7x6Zgop5ire8oPKszODT9rpKiRRKEHlVqiuXuf2LJy','admin','admin'),(3,'jonathanguerpillon@gmail.com','[]','$2y$13$.qThqabF1F0wdIX2KCnhournWT/.cC42psxKHceW1VPm/ndqDta0q','Jonathan','Guerpillon'),(4,'user2@gmail.com','[]','$2y$13$nRM53r5qjs8.BfgfMR2EgeSfx3hLZmu2JZoGvCrvOjqBvABpNy8i6','Jonathan','Guerpillon'),(5,'user3@gmail.com','[]','$2y$13$oJhtfKsRInPUwZTlM6TRi.h3PLV3bMavGmpfiGel.5dEkj41RNyFC','user','user3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 23:53:42

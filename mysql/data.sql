-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_item_id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  `variant_id` bigint NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FK3fx72yo9k5xauka8mlto7a8bf` (`variant_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FK3fx72yo9k5xauka8mlto7a8bf` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Clothing'),(2,'Electronics'),(3,'Footwear'),(4,'Accessories'),(5,'Furniture'),(6,'Beauty'),(7,'Books'),(8,'Toys'),(9,'Jewelry'),(10,'Groceries');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Red'),(2,'Black'),(3,'White'),(4,'Blue'),(5,'Green'),(6,'Beige'),(7,'Yellow'),(8,'Purple'),(9,'Silver'),(10,'Pink');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `style_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKaxirndytmbaluis7f80e5h53h` (`style_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKaxirndytmbaluis7f80e5h53h` FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Comfortable cotton t-shirt','T-shirt',800,1,1),(2,'15-inch gaming laptop','Laptop',45,2,5),(3,'Lightweight running shoes','Running Shoes',215,3,3),(4,'Polarized sunglasses','Sunglasses',532.3,4,7),(5,'3-seater sofa','Sofa',54.2,5,5),(6,'Matte liquid foundation','Foundation',98.9,6,6),(7,'Best-selling novel','Novel',98.3,7,5),(8,'Superhero action figure','Action Figure',67,8,10),(9,'Gold plated necklace','Necklace',39.9,9,7),(10,'Fresh organic apples','Organic Apple',49.9,10,6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `product_image_id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'tshirt_image.jpg',1),(2,'laptop_image.jpg',2),(3,'shoes_image.jpg',3),(4,'sunglasses_image.jpg',4),(5,'sofa_image.jpg',5),(6,'foundation_image.jpg',6),(7,'novel_image.jpg',7),(8,'action_figure_image.jpg',8),(9,'necklace_image.jpg',9),(10,'apple_image.jpg',10);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `variant_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `FK7ic0arew3txgoctacehy5nal9` (`color_id`),
  KEY `FKgrbbs9t374m9gg43l6tq1xwdj` (`product_id`),
  KEY `FKn1veiq5y5r3fb6qw0n030o7mh` (`size_id`),
  CONSTRAINT `FK7ic0arew3txgoctacehy5nal9` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  CONSTRAINT `FKgrbbs9t374m9gg43l6tq1xwdj` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKn1veiq5y5r3fb6qw0n030o7mh` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES (1,19.99,50,1,1,2),(2,999.99,30,2,2,2),(3,59.99,100,3,3,3),(4,29.99,75,4,4,4),(5,299.99,10,5,5,5),(6,15.99,200,6,6,1),(7,9.99,500,7,7,8),(8,24.99,150,8,8,8),(9,49.99,40,9,9,9),(10,2.99,300,10,10,6),(11,100,123,1,2,3);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` bigint NOT NULL AUTO_INCREMENT,
  `discount_percent` double DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`promotion_id`),
  KEY `FKiapjua98u0ltg8nuw9s84iyme` (`product_id`),
  CONSTRAINT `FKiapjua98u0ltg8nuw9s84iyme` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,15,'2026-07-31 23:59:59.000000','Summer Sale','2024-07-01 00:00:00.000000',1),(2,10,'2025-12-15 23:59:59.000000','Back to School','2024-08-15 00:00:00.000000',2),(3,50,'2025-11-26 23:59:59.000000','Black Friday','2024-11-25 00:00:00.000000',3),(4,20,'2024-12-25 23:59:59.000000','Christmas Sale','2024-12-01 00:00:00.000000',4),(5,25,'2025-01-05 23:59:59.000000','New Year Sale','2024-12-30 00:00:00.000000',5),(6,30,'2024-02-14 23:59:59.000000','Valentine\'s Day','2024-02-10 00:00:00.000000',9),(7,15,'2024-09-29 23:59:59.000000','Spring Sale','2024-03-01 00:00:00.000000',6),(8,10,'2024-04-20 23:59:59.000000','Easter Sale','2024-04-15 00:00:00.000000',7),(9,20,'2024-10-12 23:59:59.000000','Mother\'s Day Sale','2024-05-05 00:00:00.000000',8),(10,30,'2024-12-04 23:59:59.000000','Independence Day','2024-07-04 00:00:00.000000',10);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `rating` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `variant_id` bigint NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FKiyf57dy48lyiftdrf7y87rnxi` (`user_id`),
  KEY `FK8rawixufdifbwwueivdf92v06` (`variant_id`),
  CONSTRAINT `FK8rawixufdifbwwueivdf92v06` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`),
  CONSTRAINT `FKiyf57dy48lyiftdrf7y87rnxi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Excellent quality!',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',1),(2,'Very good laptop',4,'22e01fe0-6777-4dd6-95cb-96677e4c3326',2),(3,'Great shoes for running',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',3),(4,'Nice sunglasses but fragile',3,'22e01fe0-6777-4dd6-95cb-96677e4c3326',4),(5,'Super comfortable sofa',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',5),(6,'Good foundation but a bit dry',4,'22e01fe0-6777-4dd6-95cb-96677e4c3326',6),(7,'Loved the book!',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',7),(8,'Action figure is well made',4,'22e01fe0-6777-4dd6-95cb-96677e4c3326',8),(9,'Beautiful necklace, highly recommend',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',9),(10,'Fresh and delicious apples',5,'22e01fe0-6777-4dd6-95cb-96677e4c3326',10);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `size_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Small'),(2,'Medium'),(3,'Large'),(4,'X-Large'),(5,'XX-Large'),(6,'One Size'),(7,'6.5'),(8,'7'),(9,'8'),(10,'9');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `style_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'Casual'),(2,'Formal'),(3,'Sporty'),(4,'Vintage'),(5,'Modern'),(6,'Minimalist'),(7,'Luxury'),(8,'Streetwear'),(9,'Bohemian'),(10,'Retro');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0ae3c2a9-252a-4158-8f07-6c499d8618d3','tidumong789@gmail.com','Duong Van Bao','$2a$10$dcCGMq9FCYHODsFY.ol4SOpJujMlABgz1Dsuc0lfh2PsiLMCmUVqO','USER'),('22e01fe0-6777-4dd6-95cb-96677e4c3326','jerrynamic@gmail.com','Dufsd sdfdsfdsf dson','$2a$10$qR7z1RErg8tfB7JJxp6sduIuxBWBu/HSeo1GV3BE/noIN/cN40uBy','USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `FKd4r80jm8s41fgoa0xv9yy5lo8` (`user_id`),
  CONSTRAINT `FKd4r80jm8s41fgoa0xv9yy5lo8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(2,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(3,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(4,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(5,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(6,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(7,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(8,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(9,'22e01fe0-6777-4dd6-95cb-96677e4c3326'),(10,'22e01fe0-6777-4dd6-95cb-96677e4c3326');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `wishlist_id` bigint NOT NULL,
  PRIMARY KEY (`wishlist_item_id`),
  KEY `FK5s5jxai41c8tqklyy111ngqh7` (`product_id`),
  KEY `FK5iw5sajivrxnt4qjxqlgo8yb1` (`wishlist_id`),
  CONSTRAINT `FK5iw5sajivrxnt4qjxqlgo8yb1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`),
  CONSTRAINT `FK5s5jxai41c8tqklyy111ngqh7` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
INSERT INTO `wishlist_item` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 22:45:32

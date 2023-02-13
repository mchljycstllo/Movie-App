-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (x86_64)
--
-- Host: localhost    Database: db_movie_app
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2023-01-19 06:15:59.914845','2023-01-19 06:18:06.877102'),('schema_sha1','c6acdde2ea9d6959e6a9297cebee2fd9ffee9165','2023-01-19 06:15:59.919343','2023-01-19 06:15:59.919343');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Juan Dela Cruz',0,'2023-02-13 00:45:20.753197','2023-02-13 00:45:20.753197'),(2,'John Doe',0,'2023-02-13 00:45:31.469452','2023-02-13 00:45:31.469452');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `content` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_movie_id` (`movie_id`),
  CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_56963e5c80` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,2,2,0,'test comment 1','2023-02-09 06:44:49.697909','2023-02-09 07:24:47.682905'),(7,2,2,0,'test comment 2','2023-02-11 14:39:10.579974','2023-02-11 14:39:10.579974');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_favorites_on_user_id` (`user_id`),
  KEY `index_favorites_on_movie_id` (`movie_id`),
  CONSTRAINT `fk_rails_2f96619ba3` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `fk_rails_d15744e438` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,2,2,1,'2023-02-11 12:54:23.806529','2023-02-11 14:56:26.131178'),(3,2,3,1,'2023-02-11 14:36:15.914627','2023-02-11 14:56:31.587857'),(4,2,3,1,'2023-02-11 14:49:54.778915','2023-02-11 14:53:33.944768'),(5,2,3,0,'2023-02-11 14:56:37.543390','2023-02-11 14:56:37.543390');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action',0,'2023-01-19 07:00:38.540165','2023-02-11 14:44:14.511264'),(2,'Bollywood',0,'2023-01-19 07:00:49.493984','2023-02-11 15:37:33.219248'),(3,'Comedy',0,'2023-01-19 07:00:54.360782','2023-02-11 15:39:45.441112'),(4,'Documentary',0,'2023-01-19 07:01:00.422084','2023-01-19 07:01:00.422084'),(5,'Fantasy',0,'2023-01-19 07:01:10.564839','2023-01-19 07:01:10.564839'),(6,'Horror',0,'2023-01-19 07:01:24.429924','2023-01-19 07:01:24.429924'),(7,'K-Drama',0,'2023-01-19 07:01:29.836046','2023-01-19 07:01:29.836046');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  `description` text,
  `artists_id` text,
  `deleted` tinyint(1) DEFAULT '0',
  `image` text,
  `image_alt` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `trailer_link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_movies_on_genre_id` (`genre_id`),
  CONSTRAINT `fk_rails_0a6710c65a` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,1,'Spider Man 5',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',1,'05.webp','movie cover','2023-01-20 01:49:19.334286','2023-01-20 06:53:41.071610','spiderman-5','GP--HMACnO8'),(2,2,'Spider Man 6',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'01.webp','movie cover','2023-01-20 01:52:40.463383','2023-02-12 21:39:14.223202','spiderman-6','GP--HMACnO8'),(3,1,'Spider Man 2',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'01.webp','movie cover','2023-01-20 04:12:20.053406','2023-01-20 04:12:20.053406','spiderman-2','GP--HMACnO8'),(4,1,'Spider Man 3',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'01.webp','movie cover','2023-01-20 04:12:25.420000','2023-01-20 04:12:25.420000','spiderman-3','GP--HMACnO8'),(5,1,'Spider Man 7',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'01.webp','movie cover','2023-01-20 04:17:08.638038','2023-01-20 04:17:08.638038','spiderman-7','GP--HMACnO8'),(6,3,'Spider Man 8',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:28:23.738065','2023-02-11 17:28:23.738065','spider-man-8','GP--HMACnO8'),(7,3,'Spider Man 8',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:29:07.673931','2023-02-11 17:29:07.673931','spider-man-8','GP--HMACnO8'),(8,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:29:16.857785','2023-02-11 17:29:16.857785','spider-man-9','GP--HMACnO8'),(13,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:37:39.206756','2023-02-11 17:37:39.206756','spider-man-9-v-8','GP--HMACnO8'),(14,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:46.653660','2023-02-11 17:42:46.653660','spider-man-9-v-89','GP--HMACnO8'),(15,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:50.312028','2023-02-11 17:42:50.312028','spider-man-9-v-90','GP--HMACnO8'),(16,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:52.872885','2023-02-11 17:42:52.872885','spider-man-9-v-4','GP--HMACnO8'),(17,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:55.213232','2023-02-11 17:42:55.213232','spider-man-9-v-71','GP--HMACnO8'),(18,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:57.388750','2023-02-11 17:42:57.388750','spider-man-9-v-59','GP--HMACnO8'),(19,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:42:59.422136','2023-02-11 17:42:59.422136','spider-man-9-v-44','GP--HMACnO8'),(20,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:43:01.452262','2023-02-11 17:43:01.452262','spider-man-9-v-47','GP--HMACnO8'),(21,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-11 17:43:03.544462','2023-02-11 17:43:03.544462','spider-man-9-v-82','GP--HMACnO8'),(22,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-12 21:17:42.134638','2023-02-12 21:17:42.134638','spider-man-9-v-97','GP--HMACnO8'),(23,3,'Spider Man 9',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-12 21:52:21.966406','2023-02-12 21:52:21.966406','spider-man-9-v-39','GP--HMACnO8'),(24,3,'Spider Man 10',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-12 21:52:54.091026','2023-02-12 21:52:54.091026','spider-man-10-v-17','GP--HMACnO8'),(25,3,'Test Movie',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-12 21:54:28.017923','2023-02-12 21:54:28.017923','test-movie-v-78','GP--HMACnO8'),(26,3,'Test Movie Cast',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-13 01:17:38.185202','2023-02-13 01:17:38.185202','test-movie-cast-v-60','GP--HMACnO8'),(27,3,'Test Movie Cast',2023,NULL,'\"[{\"id\":1},{\"id\":2}]\"',0,'02.webp','movie cover','2023-02-13 01:23:24.096851','2023-02-13 01:23:24.096851','test-movie-cast-v-1','GP--HMACnO8');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `score` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ratings_on_user_id` (`user_id`),
  KEY `index_ratings_on_movie_id` (`movie_id`),
  CONSTRAINT `fk_rails_62d9686c7c` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `fk_rails_a7dfeb9f5f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,2,2,0,5,'2023-02-11 14:47:02.110856','2023-02-11 14:47:02.110856');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20230119052235'),('20230119064826'),('20230119090024'),('20230119090025'),('202301200733191'),('20230120093206'),('20230126021132'),('20230126040823'),('20230130141733'),('20230130141734'),('20230130141735'),('20230209042006'),('20230209154436'),('20230211124255'),('20230211154559'),('20230212213606'),('20230213003548'),('20230213004855'),('20230213011406'),('20230213011407');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) NOT NULL DEFAULT 'email',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `allow_password_change` tinyint(1) DEFAULT '0',
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  `tokens` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_uid_and_provider` (`uid`,`provider`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'email','jaycastillo@movieapp.com','$2a$12$PUWXb0P6U8ZjgoIeg/apWebzZWk4H8SVpGuzeYR1prcRBHRAWrfrS',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo',NULL,'jaycastillo@movieapp.com','admin','{\"_6ul1FHTjU4A6iJ03sQixw\":{\"token\":\"$2a$10$HQd1Y4AsAJ5o6ac.5OP54ujMub.RJJW.qp1IS2SJFytdYEoEJJFNu\",\"expiry\":1677113038},\"IabaCLbGJgmKnMzjf284-A\":{\"token\":\"$2a$10$RvIEU/JQH4Gx78jGgubiw.pxZWr3OUqIAuMAiozWoArzUqmEYcdPa\",\"expiry\":1677113208},\"5s16s1PEVv43KL2aMPq1Qg\":{\"token\":\"$2a$10$YB52KJoQSXx0OwSIiM8Yq.h2MBHwRnmxhSW7swAPmygMe6KNCTu8u\",\"expiry\":1677113210},\"EKU-H_WX7wzpD_yRWsEPdw\":{\"token\":\"$2a$10$AOGLKzKjUWsZS72hqLnfHO3zu8Yp2sbwczvNHe0MGAFhtOF74JN1y\",\"expiry\":1677113213},\"f7mak4JCVFZW1IzXkmO9ww\":{\"token\":\"$2a$10$HzPIvQd69eOtReAqWPXkwOTd2szoyKnfOJDHXAf81iPtpC0l6yqv.\",\"expiry\":1677113218},\"BZ5YVfhPYEMI8H0ng_L6xA\":{\"token\":\"$2a$10$uFcmrrOhELmw1Yjkgar0xecBX7/U06tOgzZIj.S3HPiPFimrUqHIa\",\"expiry\":1677117024},\"Knhlqr8BE-XCCk5UQlPf-w\":{\"token\":\"$2a$10$p/zTKMEvoPop2f31VQ/jru4/BzDS.EfREj6/GFQ1EAXlSM7IMch3i\",\"expiry\":1677124464},\"5PF9qgW3QrhHVdYt0sGZlA\":{\"token\":\"$2a$10$TwwlPquEncLcoREu3bp7EOu7lbCzO/rYJeR4cmpRHu5cSFibVYoU6\",\"expiry\":1677325873},\"qsh7-Ph6JZnOo-QZH-QiVA\":{\"token\":\"$2a$10$ceIJy5R9iB8LSaY5G.vjBuL7zRyg.ml9a62eKBy0/dZtmcEn5OV/i\",\"expiry\":1677326667},\"8pfB-D0y31nMdekbqMBTTQ\":{\"token\":\"$2a$10$17mlnV1crvw1yTnKyBpgf.CXRBtf5hk3AJskgnlcATyStUcgUvejy\",\"expiry\":1677327046}}','2023-01-30 14:58:13.041444','2023-02-11 12:10:46.509911'),(2,'email','jaycastillo_user@movieapp.com','$2a$12$BKLkinijRlzvq/7QcZVZr.oz1NKIl3FzHlUBsj3t9FHV9kfniqFhm',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo',NULL,'jaycastillo_user@movieapp.com','user','{\"gGAQz_guVR0tbkkUWNSKLw\":{\"token\":\"$2a$10$okn9St8p8zrcW1Zf7UIu6eSMt7RbE6sP3ICJHOnOmyFwcC7eWZ0ne\",\"expiry\":1677126753},\"DLJF88EzdoKlTsqIff6LCg\":{\"token\":\"$2a$10$P9LDSYKfjSdV5Bi0oisr0eIVLZUauh3RG9HklIV1SSJAjAz/n8/FC\",\"expiry\":1677126787},\"1Tp931thSmSNMfWfWBgsFQ\":{\"token\":\"$2a$10$8zZG6h/L1.7hcoIIK4Hl0OC6EV8tYqKuEnkWGTmuCCI3J2wFFg1Hm\",\"expiry\":1677327067},\"dBNibCEgI2OZeLGMMHN25Q\":{\"token\":\"$2a$10$8dPC0slQ/JXVtxozS7b3B.FCujh1xc5vPC4Z/UIIVMqbg6kKZTOiK\",\"expiry\":1677327072}}','2023-02-09 04:32:33.359087','2023-02-11 12:11:12.359998');
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

-- Dump completed on 2023-02-13 10:09:58

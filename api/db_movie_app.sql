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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,2,2,1,'test comment 1','2023-02-09 06:44:49.697909','2023-02-09 07:24:47.682905');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
INSERT INTO `genres` VALUES (1,'Action',0,'2023-01-19 07:00:38.540165','2023-01-19 07:00:38.540165'),(2,'Bollywood',0,'2023-01-19 07:00:49.493984','2023-01-19 07:00:49.493984'),(3,'Comedy',0,'2023-01-19 07:00:54.360782','2023-01-19 07:00:54.360782'),(4,'Documentary',0,'2023-01-19 07:01:00.422084','2023-01-19 07:01:00.422084'),(5,'Fantasy',0,'2023-01-19 07:01:10.564839','2023-01-19 07:01:10.564839'),(6,'Horror',0,'2023-01-19 07:01:24.429924','2023-01-19 07:01:24.429924'),(7,'K-Drama',0,'2023-01-19 07:01:29.836046','2023-01-19 07:01:29.836046');
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
  `casts` text,
  `deleted` tinyint(1) DEFAULT '0',
  `image` text,
  `image_alt` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_movies_on_genre_id` (`genre_id`),
  CONSTRAINT `fk_rails_0a6710c65a` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,1,'Spider Man 5',2023,NULL,'\"{[\'SimuLiu\',\'Awkwafina\']}\"',1,'05.webp','movie cover','2023-01-20 01:49:19.334286','2023-01-20 06:53:41.071610'),(2,2,'Spider Man 5',2023,NULL,'\"{[\'SimuLiu\',\'Awkwafina\']}\"',0,'01.webp','movie cover','2023-01-20 01:52:40.463383','2023-01-26 22:39:47.832234'),(3,1,'Spider Man 2',2023,NULL,'\"{[\'SimuLiu\',\'Awkwafina\']}\"',0,'01.webp','movie cover','2023-01-20 04:12:20.053406','2023-01-20 04:12:20.053406'),(4,1,'Spider Man 3',2023,NULL,'\"{[\'SimuLiu\',\'Awkwafina\']}\"',0,'01.webp','movie cover','2023-01-20 04:12:25.420000','2023-01-20 04:12:25.420000'),(5,1,'Spider Man 7',2023,NULL,'\"{[\'SimuLiu\',\'Awkwafina\']}\"',0,'01.webp','movie cover','2023-01-20 04:17:08.638038','2023-01-20 04:17:08.638038');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20230119052235'),('20230119064826'),('20230119090024'),('20230119090025'),('202301200733191'),('20230120093206'),('20230126021132'),('20230126040823'),('20230130141733'),('20230130141734'),('20230130141735'),('20230209042006');
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
INSERT INTO `users` VALUES (1,'email','jaycastillo@movieapp.com','$2a$12$PUWXb0P6U8ZjgoIeg/apWebzZWk4H8SVpGuzeYR1prcRBHRAWrfrS',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo',NULL,'jaycastillo@movieapp.com','admin','{\"ylahsun9GIvlr0s8iS1Cng\":{\"token\":\"$2a$10$JzCMRF144Z61dqPLCwfXNuClnCOndWZtdFaSJSA43LsnsyFZEcLfa\",\"expiry\":1677112903},\"RMyF1oQiz7RLbCwDUtf7zA\":{\"token\":\"$2a$10$.l/qZY2aKCAJFnP18NynY.VQcuzvHJ.iqrj9YnxysUIE289RmYZkm\",\"expiry\":1677112923},\"WMWBtDC_J5OEW6V-L10hiw\":{\"token\":\"$2a$10$MNHCqZZ9pRMNrZL0DWdeIOPYziTTym.F7HJ.UwsDD0jgmB9ggSNHK\",\"expiry\":1677113037},\"_6ul1FHTjU4A6iJ03sQixw\":{\"token\":\"$2a$10$HQd1Y4AsAJ5o6ac.5OP54ujMub.RJJW.qp1IS2SJFytdYEoEJJFNu\",\"expiry\":1677113038},\"IabaCLbGJgmKnMzjf284-A\":{\"token\":\"$2a$10$RvIEU/JQH4Gx78jGgubiw.pxZWr3OUqIAuMAiozWoArzUqmEYcdPa\",\"expiry\":1677113208},\"5s16s1PEVv43KL2aMPq1Qg\":{\"token\":\"$2a$10$YB52KJoQSXx0OwSIiM8Yq.h2MBHwRnmxhSW7swAPmygMe6KNCTu8u\",\"expiry\":1677113210},\"EKU-H_WX7wzpD_yRWsEPdw\":{\"token\":\"$2a$10$AOGLKzKjUWsZS72hqLnfHO3zu8Yp2sbwczvNHe0MGAFhtOF74JN1y\",\"expiry\":1677113213},\"f7mak4JCVFZW1IzXkmO9ww\":{\"token\":\"$2a$10$HzPIvQd69eOtReAqWPXkwOTd2szoyKnfOJDHXAf81iPtpC0l6yqv.\",\"expiry\":1677113218},\"BZ5YVfhPYEMI8H0ng_L6xA\":{\"token\":\"$2a$10$uFcmrrOhELmw1Yjkgar0xecBX7/U06tOgzZIj.S3HPiPFimrUqHIa\",\"expiry\":1677117024},\"Knhlqr8BE-XCCk5UQlPf-w\":{\"token\":\"$2a$10$p/zTKMEvoPop2f31VQ/jru4/BzDS.EfREj6/GFQ1EAXlSM7IMch3i\",\"expiry\":1677124464}}','2023-01-30 14:58:13.041444','2023-02-09 03:54:24.694001'),(2,'email','jaycastillo_user@movieapp.com','$2a$12$BKLkinijRlzvq/7QcZVZr.oz1NKIl3FzHlUBsj3t9FHV9kfniqFhm',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo',NULL,'jaycastillo_user@movieapp.com','user','{\"gGAQz_guVR0tbkkUWNSKLw\":{\"token\":\"$2a$10$okn9St8p8zrcW1Zf7UIu6eSMt7RbE6sP3ICJHOnOmyFwcC7eWZ0ne\",\"expiry\":1677126753},\"DLJF88EzdoKlTsqIff6LCg\":{\"token\":\"$2a$10$P9LDSYKfjSdV5Bi0oisr0eIVLZUauh3RG9HklIV1SSJAjAz/n8/FC\",\"expiry\":1677126787}}','2023-02-09 04:32:33.359087','2023-02-09 04:33:07.715548');
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

-- Dump completed on 2023-02-09 15:39:58

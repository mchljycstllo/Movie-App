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
-- Table structure for table `artist_movies`
--

DROP TABLE IF EXISTS `artist_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_movies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `artist_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_artist_movies_on_artist_id` (`artist_id`),
  KEY `index_artist_movies_on_movie_id` (`movie_id`),
  CONSTRAINT `fk_rails_86bfde1076` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `fk_rails_c0d06f708c` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_movies`
--

LOCK TABLES `artist_movies` WRITE;
/*!40000 ALTER TABLE `artist_movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist_movies` ENABLE KEYS */;
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
  `image` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20230119052235'),('20230119064826'),('20230119090024'),('20230119090025'),('202301200733191'),('20230120093206'),('20230126021132'),('20230126040823'),('20230130141733'),('20230130141734'),('20230130141735'),('20230209042006'),('20230209154436'),('20230211124255'),('20230211154559'),('20230212213606'),('20230213003548'),('20230213004855'),('20230213011406'),('20230213011407'),('20230214225830'),('20230214230337'),('20230214230851'),('20230214233011'),('20230215174835'),('20230216095938');
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
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_uid_and_provider` (`uid`,`provider`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'email','jaycastillo_admin@movieapp.com','$2a$12$4YXUkOknWWQp3Y0kPgMlk.eJ2Mgh2SyGnQizqqRXtBOptGUd1Ep4K',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo','actor.png','jaycastillo_admin@movieapp.com','admin','{\"VpnYnm1PLSdo8UP5nb75KA\":{\"token\":\"$2a$10$aCm4cmL9J.ZZ6enkgdlLS..PNV6.cSBCu1molHnugrssGuLuZTsjC\",\"expiry\":1677749310},\"bMnCGKc5oK7PWGV--Li3xg\":{\"token\":\"$2a$10$56IkYIntw7aPsVnfPe33ruadMoquJzTT13n9kZ1w2TjIIoQE3KDFO\",\"expiry\":1677749325},\"TXkFGaCzHFLWbe-VhKAv_g\":{\"token\":\"$2a$10$.NN9XKn203SdkYfS0gvuBuny2rv4yKWDOW.EgFIXR9AMTerz516bG\",\"expiry\":1677749353},\"wvsLteN8Zvx2fsvXvLWPoQ\":{\"token\":\"$2a$10$EGNZwGsAtEkEzeLIpoPAXeIpRe4EHwX83HRdOpIC2ZtHX5uaBvepi\",\"expiry\":1677751768},\"D2Tl5o1fg8QzR3VRDT8O0A\":{\"token\":\"$2a$10$XupRcRtoNuWDW.72wELl8O4sJDVghxIGrJFijfQnrTB2O.H/tlima\",\"expiry\":1677751782},\"rvmpkoXIPmLrh9akqYsczg\":{\"token\":\"$2a$10$7NOdLiIOUZDIQzRPUcm2fusZO7OB1G8.g5MyhaQIjpMHJuq7/0lUC\",\"expiry\":1677771102},\"MMFDrk1gPu1VmRDNOzGmJQ\":{\"token\":\"$2a$10$GTS18jHX8oJXPb0TTd0DUe7ZJvpFhFchoemuqbgNkHUhr7kXQSUsS\",\"expiry\":1677771171},\"OWofnmsqGegZuuDedjZMtA\":{\"token\":\"$2a$10$NuMQFU.xZD8zlAE4.JZIieMmq0fJmOrxuezFSqPbvcWFw6W8K9LRC\",\"expiry\":1677809601},\"DKe8uBJFi2sqJnDvh2kQIQ\":{\"token\":\"$2a$10$vt1olRJ8hUwAFReHmphRQuyzp08OZbhjM/FCg3dfBUvlxCB7VMNZS\",\"expiry\":1677809606},\"sns9AY7H53sW7Ymp0bq9Dw\":{\"token\":\"$2a$10$c/MUEC3FprBaOxwrpcbXn.ZTWwtyX/NYREURpJdu8CSAvkn13FXQC\",\"expiry\":1677809665}}','2023-02-16 09:28:26.196159','2023-02-17 02:14:25.019336',0),(7,'email','defaultadmin@movieapp.com','$2a$12$wWEJEMqSBai9D/RPH2ME3usucGYaRDm/NOJ97AOGB66u0oD5eutOq',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Default Admin','defaultadmin','zuck.jpeg','defaultadmin@movieapp.com','admin','{\"aLNCg-FO6FvtId7NDZ4v2Q\":{\"token\":\"$2a$10$1gNr.dKEn1ZWxDUsIPwwJ.hqVsS2gcx2tzrKuctBJTg9tcVbiQvXm\",\"expiry\":1677749385}}','2023-02-16 09:29:45.810094','2023-02-16 09:29:45.916578',0),(8,'email','user@gmail.coms','$2a$12$qTi36hBnafiwpYeN6I4/k.jmie8zoohsGLCu6EMT2X8VxyraI8/0a',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay1','user123','zuck.jpeg','user@gmail.coms','user','{\"5PKZ-95YLjg7A2gEIdM3EA\":{\"token\":\"$2a$10$sqFT0FYFDK1.VPuHMstNye9lkcNnYaqdkKjclBkpp8TSmUwKs7io.\",\"expiry\":1677749533},\"Cxs0y61yj0HwSsyBSQ432A\":{\"token\":\"$2a$10$KBJKvj1A8nxXQVDME05dG.LFJNTswx/j45p0FwrMxzTaX21/.9Bom\",\"expiry\":1677750199},\"CuPRMPAdEksoTnSWul780g\":{\"token\":\"$2a$10$YlQMyCTd5HsRdmUPEt6tLuQMPy2b5TSbDtVeBWxTRSCQiBp22rrFi\",\"expiry\":1677770492},\"zpTzM249sr3r7zt0oG5PVw\":{\"token\":\"$2a$10$8UV7Xv8qjMwjOc9bokjFe.Rkhk3A1QlKMUnVv5quglR5lFJlDnFem\",\"expiry\":1677770773},\"yKOy2tBhWg86V33n-eyS4g\":{\"token\":\"$2a$10$U/Q6XYLghU5DLTn13R2BGOUkMkXa4/qRmDOS5hqJP287FURut6lFK\",\"expiry\":1677770903},\"J0qNvgbTuYknilk8Q_Edjw\":{\"token\":\"$2a$10$Xw1Ica2AM.hmBZOs.9zYLOfX6yEqO0nh3ovi9kMUcpxyXTi5ErOq2\",\"expiry\":1677770915},\"3_ICt0zkMDe3pQa6CzvqLg\":{\"token\":\"$2a$10$NTCjDCNTqT4FH9hlN5rqt.xa5xO7QSnvt.cTpXtj5hPeMbrQjKIrq\",\"expiry\":1677770970},\"eimkqWiPRLNke2d76TApPA\":{\"token\":\"$2a$10$XzBr8zGnRWXEEjJWVk9gV.s3tuB7vNA7JZrwEpcIkcqDGwqhV/zEK\",\"expiry\":1677770991},\"A5ds6kyOoqf4BmU4OmlpNg\":{\"token\":\"$2a$10$a4iizvWlE1N6ctZwkCljW.FEVGkUS8UG0R0CZhb4oZN78LB0K5QvC\",\"expiry\":1677771068},\"wK9U07pGCMMW8gToWhTXgQ\":{\"token\":\"$2a$10$BfMKnExKfbMfGuZfVGvh0erx1O3O2XOPiLfs4797QQoo1W1SOjbwi\",\"expiry\":1677771123}}','2023-02-16 09:30:10.728337','2023-02-17 02:18:06.148762',0);
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

-- Dump completed on 2023-02-17 10:25:37

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
INSERT INTO `artist_movies` VALUES (40,10,54,0,'2023-02-15 17:12:11.228446','2023-02-15 17:12:11.228446'),(41,9,54,0,'2023-02-15 17:12:11.239303','2023-02-15 17:12:11.239303'),(42,10,55,0,'2023-02-15 17:14:14.267781','2023-02-15 17:14:14.267781'),(43,9,55,0,'2023-02-15 17:14:14.272992','2023-02-15 17:14:14.272992'),(44,11,55,0,'2023-02-15 17:14:14.277539','2023-02-15 17:14:14.277539'),(45,9,56,0,'2023-02-15 17:16:32.678863','2023-02-15 17:16:32.678863'),(46,10,56,0,'2023-02-15 17:16:32.713168','2023-02-15 17:16:32.713168'),(47,9,57,0,'2023-02-15 17:18:16.725493','2023-02-15 17:18:16.725493'),(48,10,57,0,'2023-02-15 17:18:16.736256','2023-02-15 17:18:16.736256'),(49,11,57,0,'2023-02-15 17:18:16.782975','2023-02-15 17:18:16.782975'),(50,9,58,0,'2023-02-15 17:19:58.813995','2023-02-15 17:19:58.813995'),(51,10,58,0,'2023-02-15 17:19:58.826419','2023-02-15 17:19:58.826419'),(52,11,58,0,'2023-02-15 17:19:58.863418','2023-02-15 17:19:58.863418'),(53,9,59,0,'2023-02-15 17:21:19.882755','2023-02-15 17:21:19.882755'),(54,10,59,0,'2023-02-15 17:21:19.911718','2023-02-15 17:21:19.911718'),(55,10,60,0,'2023-02-15 17:22:39.260847','2023-02-15 17:22:39.260847'),(56,11,60,0,'2023-02-15 17:22:39.292780','2023-02-15 17:22:39.292780'),(57,10,61,0,'2023-02-15 17:24:16.136471','2023-02-15 17:24:16.136471'),(58,9,61,0,'2023-02-15 17:24:16.151814','2023-02-15 17:24:16.151814'),(59,9,62,0,'2023-02-15 17:25:37.436574','2023-02-15 17:25:37.436574'),(60,10,62,0,'2023-02-15 17:25:37.468170','2023-02-15 17:25:37.468170'),(61,9,63,0,'2023-02-15 17:27:10.665258','2023-02-15 17:27:10.665258'),(62,10,63,0,'2023-02-15 17:27:10.682905','2023-02-15 17:27:10.682905');
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
INSERT INTO `artists` VALUES (9,'Vin Diesel',0,'2023-02-15 17:07:29.043939','2023-02-15 17:07:29.043939','02.webp','Vin Diesel thumbnail'),(10,'John Cena',0,'2023-02-15 17:07:42.446424','2023-02-15 17:07:42.446424','03.webp','John Cena thumbnail'),(11,'Dwayne Johnson',0,'2023-02-15 17:08:04.834558','2023-02-15 17:08:04.834558','10.webp','Dwayne Johnson thumbnail'),(12,'Kate Winslet',0,'2023-02-16 01:44:12.159112','2023-02-16 01:44:12.159112','04.webp','Kate Winslet thumbnail');
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
INSERT INTO `genres` VALUES (13,'Comedy',0,'2023-02-15 09:42:26.863615','2023-02-15 09:42:26.863615'),(14,'Action',0,'2023-02-15 09:42:32.826782','2023-02-15 09:42:32.826782'),(15,'Horror',0,'2023-02-15 09:42:38.034641','2023-02-15 09:42:38.034641'),(16,'Sci-Fi',0,'2023-02-15 09:42:43.940846','2023-02-15 09:42:43.940846'),(17,'Drama',0,'2023-02-15 17:10:54.732239','2023-02-15 17:10:54.732239'),(18,'Romantic',0,'2023-02-15 17:12:00.991463','2023-02-15 17:12:00.991463'),(19,'Fantasy',0,'2023-02-15 17:15:40.588836','2023-02-15 17:15:40.588836'),(20,'Thriller',0,'2023-02-15 17:23:28.099825','2023-02-15 17:23:28.099825');
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
INSERT INTO `movies` VALUES (54,18,'Fant G Spot',2022,'Considered by many to be a warm, friendly, considerate person, Son Hee Jae is surrounded by people who claim to know and love her. While having friends is always nice, the problem for Hee Jae is that she isn’t really sure if she really knows or understands herself. Which is why, when she suddenly finds herself in charge of a love and romance podcast, Hee Jae feels more than a little lost. Having never really experienced an intimate relationship before, Hee Jae isn’t the most qualified person to be hosting a romance podcast, but with no one else able to run it, she really doesn’t have a choice.',0,'01.webp','Fant G Spot thumbnail','2023-02-15 17:10:15.023185','2023-02-15 17:12:11.201222','fant-g-spot-v-97','GP--HMACnO8'),(55,17,'Red Balloon',2022,'A story of four people attempting to quench their desires and appease their heartbreaks. Jo Eun Gang wants to become a school teacher, but she has failed to pass her teaching examination. She now works as a private tutor. She appears calm, but she holds something hot within her heart. She is a person who will do anything to get what she wants. ',0,'02.webp','Red Balloon thumbnail','2023-02-15 17:14:14.220448','2023-02-15 17:14:14.220448','red-balloon-v-33','-stC4DqLCVI'),(56,16,'Missing: The Other Side Season 2',2022,'3 Gongdan is a village where missing deceased people, including Kang Eun Sil and Oh Il Yong, stay. Meanwhile, Kim Wook, Jang Pan Seok, Lee Jong A, and Detective Shin Joon Ho try to find the bodies of missing people and chase after the truth behind their deaths.',0,'03.webp','Missing: The Other Side Season 2 thumbnail','2023-02-15 17:16:32.640101','2023-02-15 17:16:32.640101','missing-the-other-side-season-2-v-11','NCxcMxbrFbA'),(57,13,'Crash Course in Romance',2022,'Nam Haeng Sun used to be a national athlete. She now runs a side dish store. She has a super positive personality and unlimited like stamina. She takes another turn and enters the private education field, which is for students preparing for their university entrance exam. Unexpectedly, Nam Haeng Sun gets involved with Choi Chi Yeol.',0,'04.webp','Crash Course in Romance thumbnail','2023-02-15 17:18:16.669232','2023-02-15 17:18:16.669232','crash-course-in-romance-v-38','M0roNIisQ5w'),(58,18,'The Interests of Love',2021,'Four men and women working at the same bank get entangled in a complicated romance as they discover how far they\'re willing to go for love.',0,'05.webp','The Interests of Love thumbnail','2023-02-15 17:19:58.760529','2023-02-15 17:19:58.760529','the-interests-of-love-v-68','WVnDuEx-Je0'),(59,18,'Single\'s Inferno Season 2',2021,'The gates of Single\'s Inferno are open again! Get caught up in the excitement and tension of an all new group. Where one decision can change everything. The hottest inferno returns for another winter.',0,'07.webp','Single\'s Inferno Season 2 thumbnail','2023-02-15 17:21:19.843448','2023-02-15 17:21:19.843448','single-s-inferno-season-2-v-79','N-QI4XU_Tys'),(60,13,'The Forbidden Marriage',2021,'Lee Heon is the king of Joseon. 7 years ago, when he was a crown prince, his beloved wife died. To this day, he has not been able to get over her death. For the past 7 years, the royal family and government members have tried to get King Lee Heon remarried without success. The nation has also implemented a geumhonryung edict, which is a ban on all single women marrying during this time when the king has not married.',0,'08.webp','The Forbidden Marriage thumbnail','2023-02-15 17:22:39.207674','2023-02-15 17:22:39.207674','the-forbidden-marriage-v-47','TW5I0E5bxFE'),(61,20,'Payback',2022,'Law Money follows the revenge story of a group of people—including Eun Yong, a money trader—who refuse to remain silent in the face of unjust authorities and fight against a cartel conspiring with the law.',0,'09.webp','Payback thumbnail','2023-02-15 17:24:16.107706','2023-02-15 17:24:16.107706','payback-v-58','BcDK7lkzzsU'),(62,18,'Eden Season 2',2022,'Passions spilled over and couples were formed in the beachside EDEN house in season one: “EDEN, Descendants of Instinct.” But now the heat will be turned up yet another notch as a new set of male and female singletons heads to the EDEN house – in search of love. In EDEN, social norms and customs are done away with: Contestants speak to each other informally and without the honorifics usually used in everyday Korean language.',0,'10.webp','Eden Season 2 thumbnail','2023-02-15 17:25:37.419843','2023-02-15 17:25:37.419843','eden-season-2-v-90','mAvcZs8Iz9M'),(63,20,'The Glory',2022,'It\'s a sad revenge story that begins with a high school student who dreamed of becoming an architect. However, she had to drop out of school after suffering from brutal school violence. Years later, the perpetrator gets married and has a kid. Once the kid is in elementary school, the former victim becomes their homeroom teacher and starts her thorough revenge towards the perpetrators and bystanders of her bullying days.',0,'11.webp','The Glory thumbnail','2023-02-15 17:27:10.628857','2023-02-16 00:54:43.591649','the-glory-v-94','tqVVrTvrI8U');
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
INSERT INTO `users` VALUES (6,'email','jaycastillo_admin@movieapp.com','$2a$12$4YXUkOknWWQp3Y0kPgMlk.eJ2Mgh2SyGnQizqqRXtBOptGUd1Ep4K',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo','zuck.jpeg','jaycastillo_admin@movieapp.com','admin','{\"XOl6kfo9Gad_cuf9cRdw-g\":{\"token\":\"$2a$10$dh9k1sXTgYBIFXl1qRd6iu.8PsxiuhFDy3Gd55uLV1XqBg91XkROa\",\"expiry\":1677749306},\"VpnYnm1PLSdo8UP5nb75KA\":{\"token\":\"$2a$10$aCm4cmL9J.ZZ6enkgdlLS..PNV6.cSBCu1molHnugrssGuLuZTsjC\",\"expiry\":1677749310},\"bMnCGKc5oK7PWGV--Li3xg\":{\"token\":\"$2a$10$56IkYIntw7aPsVnfPe33ruadMoquJzTT13n9kZ1w2TjIIoQE3KDFO\",\"expiry\":1677749325},\"TXkFGaCzHFLWbe-VhKAv_g\":{\"token\":\"$2a$10$.NN9XKn203SdkYfS0gvuBuny2rv4yKWDOW.EgFIXR9AMTerz516bG\",\"expiry\":1677749353},\"wvsLteN8Zvx2fsvXvLWPoQ\":{\"token\":\"$2a$10$EGNZwGsAtEkEzeLIpoPAXeIpRe4EHwX83HRdOpIC2ZtHX5uaBvepi\",\"expiry\":1677751768},\"D2Tl5o1fg8QzR3VRDT8O0A\":{\"token\":\"$2a$10$XupRcRtoNuWDW.72wELl8O4sJDVghxIGrJFijfQnrTB2O.H/tlima\",\"expiry\":1677751782}}','2023-02-16 09:28:26.196159','2023-02-16 10:09:42.821991',0),(7,'email','defaultadmin@movieapp.com','$2a$12$wWEJEMqSBai9D/RPH2ME3usucGYaRDm/NOJ97AOGB66u0oD5eutOq',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Default Admin','defaultadmin','zuck.jpeg','defaultadmin@movieapp.com','admin','{\"aLNCg-FO6FvtId7NDZ4v2Q\":{\"token\":\"$2a$10$1gNr.dKEn1ZWxDUsIPwwJ.hqVsS2gcx2tzrKuctBJTg9tcVbiQvXm\",\"expiry\":1677749385}}','2023-02-16 09:29:45.810094','2023-02-16 09:29:45.916578',0),(8,'email','user@gmail.coms','$2a$12$4YXUkOknWWQp3Y0kPgMlk.eJ2Mgh2SyGnQizqqRXtBOptGUd1Ep4K',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay1','user123','zuck.jpeg','user@gmail.coms','user','{\"kIBnHKhslzlAIOFMca9-PA\":{\"token\":\"$2a$10$LJqc.DW2AbMaRBjp9GC/Su7JslWzSh24PERo9amvGfQZIUqG8h4Gi\",\"expiry\":1677749410},\"5PKZ-95YLjg7A2gEIdM3EA\":{\"token\":\"$2a$10$sqFT0FYFDK1.VPuHMstNye9lkcNnYaqdkKjclBkpp8TSmUwKs7io.\",\"expiry\":1677749533},\"Cxs0y61yj0HwSsyBSQ432A\":{\"token\":\"$2a$10$KBJKvj1A8nxXQVDME05dG.LFJNTswx/j45p0FwrMxzTaX21/.9Bom\",\"expiry\":1677750199}}','2023-02-16 09:30:10.728337','2023-02-16 10:09:58.684729',0);
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

-- Dump completed on 2023-02-16 23:19:16

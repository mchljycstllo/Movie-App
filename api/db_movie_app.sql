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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_movies`
--

LOCK TABLES `artist_movies` WRITE;
/*!40000 ALTER TABLE `artist_movies` DISABLE KEYS */;
INSERT INTO `artist_movies` VALUES (42,10,55,0,'2023-02-15 17:14:14.267781','2023-02-15 17:14:14.267781'),(43,9,55,0,'2023-02-15 17:14:14.272992','2023-02-15 17:14:14.272992'),(44,11,55,0,'2023-02-15 17:14:14.277539','2023-02-15 17:14:14.277539'),(45,9,56,0,'2023-02-15 17:16:32.678863','2023-02-15 17:16:32.678863'),(46,10,56,0,'2023-02-15 17:16:32.713168','2023-02-15 17:16:32.713168'),(47,9,57,0,'2023-02-15 17:18:16.725493','2023-02-15 17:18:16.725493'),(48,10,57,0,'2023-02-15 17:18:16.736256','2023-02-15 17:18:16.736256'),(49,11,57,0,'2023-02-15 17:18:16.782975','2023-02-15 17:18:16.782975'),(50,9,58,0,'2023-02-15 17:19:58.813995','2023-02-15 17:19:58.813995'),(51,10,58,0,'2023-02-15 17:19:58.826419','2023-02-15 17:19:58.826419'),(52,11,58,0,'2023-02-15 17:19:58.863418','2023-02-15 17:19:58.863418'),(53,9,59,0,'2023-02-15 17:21:19.882755','2023-02-15 17:21:19.882755'),(54,10,59,0,'2023-02-15 17:21:19.911718','2023-02-15 17:21:19.911718'),(55,10,60,0,'2023-02-15 17:22:39.260847','2023-02-15 17:22:39.260847'),(56,11,60,0,'2023-02-15 17:22:39.292780','2023-02-15 17:22:39.292780'),(57,10,61,0,'2023-02-15 17:24:16.136471','2023-02-15 17:24:16.136471'),(58,9,61,0,'2023-02-15 17:24:16.151814','2023-02-15 17:24:16.151814'),(59,9,62,0,'2023-02-15 17:25:37.436574','2023-02-15 17:25:37.436574'),(60,10,62,0,'2023-02-15 17:25:37.468170','2023-02-15 17:25:37.468170'),(61,9,63,0,'2023-02-15 17:27:10.665258','2023-02-15 17:27:10.665258'),(62,10,63,0,'2023-02-15 17:27:10.682905','2023-02-15 17:27:10.682905'),(63,10,54,0,'2023-02-17 21:13:00.891816','2023-02-17 21:13:00.891816'),(64,9,54,0,'2023-02-17 21:13:00.901492','2023-02-17 21:13:00.901492'),(78,13,64,0,'2023-02-27 03:43:52.261996','2023-02-27 03:43:52.261996'),(79,12,64,0,'2023-02-27 03:43:52.291781','2023-02-27 03:43:52.291781'),(80,14,65,0,'2023-02-27 03:48:31.866201','2023-02-27 03:48:31.866201');
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
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (9,'Vin Diesel',0,'2023-02-15 17:07:29.043939','2023-02-23 05:56:06.547711','vin_diesel.jpeg','Vin Diesel thumbnail','Mark Sinclair, known professionally as Vin Diesel, is an American actor and producer. One of the world\'s highest-grossing actors, he is best known for playing Dominic Toretto in the Fast & Furious franchise.'),(10,'John Cena',0,'2023-02-15 17:07:42.446424','2023-02-23 05:56:23.897084','john_cena.jpeg','John Cena thumbnail','John Felix Anthony Cena is an American professional wrestler, actor, and former rapper currently signed to WWE. With the most world championship reigns in WWE history, Cena is regarded as one of the greatest professional wrestlers of all time.'),(11,'Dwayne Johnson',0,'2023-02-15 17:08:04.834558','2023-02-23 05:56:41.041940','the_rock.jpeg','Dwayne Johnson thumbnail','Dwayne Douglas Johnson, also known by his ring name The Rock, is an American actor and former professional wrestler.'),(12,'Kate Winslet',0,'2023-02-16 01:44:12.159112','2023-02-23 05:57:30.160489','kate_winslet.webp','Kate Winslet thumbnail','Kate Elizabeth Winslet CBE, born 5 October 1975, is an English actress. Known for her work in independent films, particularly period dramas, and for her portrayals of headstrong and complicated women, she has received numerous accolades, including an Academy Award, a Grammy Award, two Primetime Emmy Awards, three BAFTA Awards, and five Golden Globe Awards. Time magazine named Winslet one of the 100 most influential people in the world in 2009 and 2021. She was appointed Commander of the Order of the British Empire (CBE) in 2012.'),(13,'Leonardo DiCaprio',0,'2023-02-20 04:17:04.393465','2023-02-23 05:57:45.902932','leonardo.jpeg','Leonardo DiCaprio thumbnail','Leonardo Wilhelm DiCaprio is an American actor and film producer. Known for his work as a leading man in biopics and period films, he is the recipient of numerous accolades, including an Academy Award, a British Academy Film Award, and three Golden Globe Awards.'),(14,'Sylvester Stallone',0,'2023-02-23 05:55:40.064667','2023-02-23 05:55:40.064667','sylvester.jpeg','Sylvester Stallone thumbnail','Sylvester Gardenzio Stallone is an American actor and filmmaker. After his beginnings as a struggling actor for a number of years upon arriving to New York City in 1969 and later Hollywood in 1974, he won his first critical acclaim as an actor for his co-starring role as Stanley Rosiello in The Lords of Flatbush.');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (69,11,64,0,'this movie reminds me of my childhood','2023-02-23 02:24:24.061360','2023-02-23 02:24:24.061360'),(70,11,65,1,'best action movie.','2023-02-27 15:15:50.646932','2023-02-27 15:17:16.623779'),(71,11,65,0,'best action movie.','2023-02-27 15:17:39.031707','2023-02-27 15:17:39.031707'),(72,10,64,0,'one of the best movies','2023-02-27 15:25:46.119040','2023-02-27 15:25:46.119040');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (6,11,54,1,'2023-02-17 22:02:21.092009','2023-02-17 22:38:31.727031'),(7,11,55,1,'2023-02-17 22:32:57.671558','2023-02-17 22:38:24.033138'),(8,11,56,1,'2023-02-17 22:33:00.461963','2023-02-17 22:38:25.801548'),(9,11,57,1,'2023-02-17 22:33:02.352845','2023-02-17 22:38:26.798919'),(10,11,58,1,'2023-02-17 22:33:03.595869','2023-02-20 09:27:45.093609'),(11,11,57,1,'2023-02-17 22:38:27.670943','2023-02-20 20:48:31.411473'),(12,11,56,1,'2023-02-17 22:38:28.957886','2023-02-20 20:48:38.487146'),(13,11,55,1,'2023-02-17 22:38:29.940118','2023-02-17 22:38:30.670025'),(14,11,54,1,'2023-02-17 22:38:32.138834','2023-02-17 22:38:32.395615'),(15,11,54,1,'2023-02-17 22:38:32.623556','2023-02-17 22:38:32.865846'),(16,11,54,1,'2023-02-17 22:38:33.129177','2023-02-17 22:38:33.387055'),(17,11,61,1,'2023-02-17 22:38:37.156434','2023-02-17 22:38:37.632337'),(18,11,62,1,'2023-02-17 22:38:38.620806','2023-02-17 22:38:38.822635'),(19,11,59,1,'2023-02-17 22:39:44.972204','2023-02-17 22:39:45.792674'),(20,11,60,1,'2023-02-17 22:39:49.945471','2023-02-20 20:49:42.436012'),(21,11,61,1,'2023-02-17 22:39:52.143485','2023-02-20 20:49:38.758294'),(22,10,54,1,'2023-02-17 22:41:05.631450','2023-02-18 22:07:19.820528'),(23,10,55,1,'2023-02-17 22:41:07.013528','2023-02-18 22:07:20.307794'),(24,10,56,1,'2023-02-17 22:41:08.352229','2023-02-18 22:02:29.645592'),(25,10,57,1,'2023-02-18 21:56:09.428820','2023-02-18 21:56:10.867912'),(26,10,58,1,'2023-02-18 21:56:12.036656','2023-02-18 21:56:13.512884'),(27,10,57,1,'2023-02-18 21:56:13.017749','2023-02-18 21:56:14.000944'),(28,10,57,1,'2023-02-18 21:56:22.112479','2023-02-18 21:56:22.549004'),(29,10,58,1,'2023-02-18 21:56:23.173595','2023-02-18 21:56:23.662840'),(30,10,56,1,'2023-02-18 22:02:30.639310','2023-02-18 22:07:20.817976'),(31,10,61,1,'2023-02-18 22:07:01.554693','2023-02-18 22:07:24.096130'),(32,10,59,1,'2023-02-18 22:07:04.176842','2023-02-18 22:07:25.217646'),(33,10,63,1,'2023-02-18 22:07:09.840963','2023-02-18 22:07:23.015299'),(34,10,58,1,'2023-02-18 22:07:13.047218','2023-02-18 22:07:21.882631'),(35,10,57,1,'2023-02-18 22:07:13.622223','2023-02-18 22:07:21.374608'),(36,10,62,1,'2023-02-18 22:07:15.041779','2023-02-18 22:07:23.550995'),(37,10,60,1,'2023-02-18 22:07:15.933642','2023-02-18 22:07:24.648134'),(38,10,62,1,'2023-02-18 22:10:45.137160','2023-02-18 22:10:46.274839'),(39,10,63,1,'2023-02-18 22:10:47.869981','2023-02-18 22:10:48.939842'),(40,10,55,1,'2023-02-18 22:10:51.159657','2023-02-18 22:11:25.393063'),(41,10,57,1,'2023-02-18 22:10:52.200188','2023-02-20 01:42:00.079031'),(42,10,61,1,'2023-02-18 22:10:55.176006','2023-02-18 22:11:27.844417'),(43,10,59,1,'2023-02-18 22:10:58.440323','2023-02-20 01:42:04.264657'),(44,10,54,1,'2023-02-18 22:11:00.146679','2023-02-18 22:11:26.223440'),(45,10,58,1,'2023-02-18 22:11:22.864844','2023-02-18 22:11:24.360747'),(46,10,61,1,'2023-02-18 22:11:30.685147','2023-02-20 01:42:03.469823'),(47,10,58,1,'2023-02-20 01:38:43.581073','2023-02-20 01:42:00.550977'),(48,10,62,1,'2023-02-20 01:38:50.274740','2023-02-20 01:42:02.923427'),(49,10,55,1,'2023-02-20 01:38:55.998100','2023-02-20 01:41:59.331619'),(50,10,54,1,'2023-02-20 01:38:57.083506','2023-02-20 01:41:58.835036'),(51,10,54,1,'2023-02-20 01:42:15.776102','2023-02-20 01:43:42.870636'),(52,10,59,1,'2023-02-20 01:42:17.923354','2023-02-20 01:43:42.087870'),(53,10,62,1,'2023-02-20 01:42:18.843418','2023-02-20 01:43:40.103833'),(54,10,62,0,'2023-02-20 01:45:10.012824','2023-02-20 01:45:10.012824'),(55,10,54,0,'2023-02-20 01:45:13.599120','2023-02-20 01:45:13.599120'),(56,10,59,1,'2023-02-20 01:45:16.512116','2023-02-20 01:45:16.939134'),(57,10,59,1,'2023-02-20 01:54:36.477337','2023-02-20 01:54:37.599788'),(58,10,56,0,'2023-02-20 03:17:34.113094','2023-02-20 03:17:34.113094'),(59,10,60,1,'2023-02-20 03:17:38.742719','2023-02-22 08:37:32.728134'),(60,10,58,1,'2023-02-20 03:19:05.081179','2023-02-21 02:06:55.304960'),(61,10,55,1,'2023-02-20 03:45:27.061374','2023-02-20 03:45:30.659645'),(62,11,54,1,'2023-02-20 09:24:03.112111','2023-02-20 20:48:04.900348'),(63,11,62,1,'2023-02-20 09:25:00.782956','2023-02-20 09:27:36.859990'),(65,11,59,1,'2023-02-20 09:27:34.326675','2023-02-20 09:27:35.477942'),(66,11,59,1,'2023-02-20 20:22:46.692208','2023-02-20 20:49:43.458913'),(68,11,58,1,'2023-02-20 20:22:49.364518','2023-02-20 20:48:02.145599'),(69,11,57,1,'2023-02-20 20:49:49.393400','2023-02-20 21:16:43.080090'),(70,11,55,1,'2023-02-20 20:49:50.475803','2023-02-20 21:16:55.812419'),(71,11,54,1,'2023-02-20 20:49:51.508920','2023-02-20 20:50:02.150845'),(72,11,54,1,'2023-02-20 21:04:37.089990','2023-02-21 23:08:43.935491'),(73,11,62,1,'2023-02-20 21:07:26.120313','2023-02-20 21:14:23.709987'),(74,11,60,0,'2023-02-20 21:07:27.805602','2023-02-20 21:07:27.805602'),(75,11,56,1,'2023-02-20 21:17:00.748254','2023-02-21 23:08:37.916142'),(76,11,58,1,'2023-02-20 21:17:02.717683','2023-02-21 01:14:56.226016'),(77,11,62,1,'2023-02-20 21:17:06.258429','2023-02-21 01:14:54.536534'),(78,11,57,1,'2023-02-21 01:02:35.860866','2023-02-21 17:46:54.248833'),(80,11,61,1,'2023-02-21 01:20:39.711741','2023-02-21 01:24:30.899940'),(81,11,61,1,'2023-02-21 01:24:33.538793','2023-02-21 01:24:36.124446'),(82,11,61,1,'2023-02-21 01:24:39.219775','2023-02-21 01:25:04.028737'),(83,11,61,1,'2023-02-21 01:25:06.898908','2023-02-21 23:09:31.988271'),(84,11,63,0,'2023-02-21 01:25:09.497982','2023-02-21 01:25:09.497982'),(87,6,55,0,'2023-02-21 18:08:30.239886','2023-02-21 18:08:30.239886'),(88,11,61,0,'2023-02-21 23:09:33.314381','2023-02-21 23:09:33.314381'),(89,11,56,1,'2023-02-22 01:39:44.847085','2023-02-22 01:39:45.832504'),(90,11,55,0,'2023-02-22 02:03:28.812879','2023-02-22 02:03:28.812879'),(91,11,57,1,'2023-02-22 02:08:30.882204','2023-02-27 15:24:20.343983'),(92,11,54,1,'2023-02-22 02:08:32.389321','2023-02-22 02:12:06.206655'),(94,11,54,1,'2023-02-22 02:12:07.438061','2023-02-22 02:24:25.803998'),(96,11,65,1,'2023-02-27 04:04:44.632352','2023-02-27 04:04:55.342188'),(97,11,62,1,'2023-02-27 04:41:58.185038','2023-02-27 04:41:59.281736'),(98,6,62,0,'2023-02-27 15:18:16.806511','2023-02-27 15:18:16.806511'),(99,6,64,0,'2023-02-27 15:18:31.456828','2023-02-27 15:18:31.456828'),(100,11,57,0,'2023-02-27 15:24:27.420776','2023-02-27 15:24:27.420776'),(101,10,65,0,'2023-02-27 15:26:58.678309','2023-02-27 15:26:58.678309');
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
INSERT INTO `genres` VALUES (13,'Comedy',0,'2023-02-15 09:42:26.863615','2023-02-15 09:42:26.863615'),(14,'Action',0,'2023-02-15 09:42:32.826782','2023-02-27 03:44:16.083117'),(15,'Horror',0,'2023-02-15 09:42:38.034641','2023-02-15 09:42:38.034641'),(16,'Sci-Fi',0,'2023-02-15 09:42:43.940846','2023-02-15 09:42:43.940846'),(17,'Drama',0,'2023-02-15 17:10:54.732239','2023-02-15 17:10:54.732239'),(18,'Romantic',0,'2023-02-15 17:12:00.991463','2023-02-15 17:12:00.991463'),(19,'Fantasy',0,'2023-02-15 17:15:40.588836','2023-02-15 17:15:40.588836'),(20,'Thriller',0,'2023-02-15 17:23:28.099825','2023-02-27 08:19:38.603985');
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (54,18,'Fanta G Spot',2022,'Considered by many to be a warm, friendly, considerate person, Son Hee Jae is surrounded by people who claim to know and love her. While having friends is always nice, the problem for Hee Jae is that she isn’t really sure if she really knows or understands herself. Which is why, when she suddenly finds herself in charge of a love and romance podcast, Hee Jae feels more than a little lost. Having never really experienced an intimate relationship before, Hee Jae isn’t the most qualified person to be hosting a romance podcast, but with no one else able to run it, she really doesn’t have a choice.',0,'01.webp','Fanta G Spot thumbnail','2023-02-15 17:10:15.023185','2023-02-17 21:13:00.857718','fant-g-spot-v-97','GP--HMACnO8'),(55,17,'Red Balloon',2022,'A story of four people attempting to quench their desires and appease their heartbreaks. Jo Eun Gang wants to become a school teacher, but she has failed to pass her teaching examination. She now works as a private tutor. She appears calm, but she holds something hot within her heart. She is a person who will do anything to get what she wants. ',0,'02.webp','Red Balloon thumbnail','2023-02-15 17:14:14.220448','2023-02-15 17:14:14.220448','red-balloon-v-33','-stC4DqLCVI'),(56,16,'Missing: The Other Side Season 2',2022,'3 Gongdan is a village where missing deceased people, including Kang Eun Sil and Oh Il Yong, stay. Meanwhile, Kim Wook, Jang Pan Seok, Lee Jong A, and Detective Shin Joon Ho try to find the bodies of missing people and chase after the truth behind their deaths.',0,'03.webp','Missing: The Other Side Season 2 thumbnail','2023-02-15 17:16:32.640101','2023-02-15 17:16:32.640101','missing-the-other-side-season-2-v-11','NCxcMxbrFbA'),(57,13,'Crash Course in Romance',2022,'Nam Haeng Sun used to be a national athlete. She now runs a side dish store. She has a super positive personality and unlimited like stamina. She takes another turn and enters the private education field, which is for students preparing for their university entrance exam. Unexpectedly, Nam Haeng Sun gets involved with Choi Chi Yeol.',0,'04.webp','Crash Course in Romance thumbnail','2023-02-15 17:18:16.669232','2023-02-15 17:18:16.669232','crash-course-in-romance-v-38','M0roNIisQ5w'),(58,18,'The Interests of Love',2021,'Four men and women working at the same bank get entangled in a complicated romance as they discover how far they\'re willing to go for love.',0,'05.webp','The Interests of Love thumbnail','2023-02-15 17:19:58.760529','2023-02-15 17:19:58.760529','the-interests-of-love-v-68','WVnDuEx-Je0'),(59,18,'Single\'s Inferno Season 2',2021,'The gates of Single\'s Inferno are open again! Get caught up in the excitement and tension of an all new group. Where one decision can change everything. The hottest inferno returns for another winter.',0,'07.webp','Single\'s Inferno Season 2 thumbnail','2023-02-15 17:21:19.843448','2023-02-15 17:21:19.843448','single-s-inferno-season-2-v-79','N-QI4XU_Tys'),(60,13,'The Forbidden Marriage',2021,'Lee Heon is the king of Joseon. 7 years ago, when he was a crown prince, his beloved wife died. To this day, he has not been able to get over her death. For the past 7 years, the royal family and government members have tried to get King Lee Heon remarried without success. The nation has also implemented a geumhonryung edict, which is a ban on all single women marrying during this time when the king has not married.',0,'08.webp','The Forbidden Marriage thumbnail','2023-02-15 17:22:39.207674','2023-02-15 17:22:39.207674','the-forbidden-marriage-v-47','TW5I0E5bxFE'),(61,20,'Payback',2022,'Law Money follows the revenge story of a group of people—including Eun Yong, a money trader—who refuse to remain silent in the face of unjust authorities and fight against a cartel conspiring with the law.',0,'09.webp','Payback thumbnail','2023-02-15 17:24:16.107706','2023-02-15 17:24:16.107706','payback-v-58','BcDK7lkzzsU'),(62,18,'Eden Season 2',2022,'Passions spilled over and couples were formed in the beachside EDEN house in season one: “EDEN, Descendants of Instinct.” But now the heat will be turned up yet another notch as a new set of male and female singletons heads to the EDEN house – in search of love. In EDEN, social norms and customs are done away with: Contestants speak to each other informally and without the honorifics usually used in everyday Korean language.',0,'10.webp','Eden Season 2 thumbnail','2023-02-15 17:25:37.419843','2023-02-15 17:25:37.419843','eden-season-2-v-90','mAvcZs8Iz9M'),(63,20,'The Glory',2022,'It\'s a sad revenge story that begins with a high school student who dreamed of becoming an architect. However, she had to drop out of school after suffering from brutal school violence. Years later, the perpetrator gets married and has a kid. Once the kid is in elementary school, the former victim becomes their homeroom teacher and starts her thorough revenge towards the perpetrators and bystanders of her bullying days.',0,'11.webp','The Glory thumbnail','2023-02-15 17:27:10.628857','2023-02-16 00:54:43.591649','the-glory-v-94','tqVVrTvrI8U'),(64,18,'Titanic',1998,'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.',0,'titanic.jpeg','Titanic thumbnail','2023-02-20 04:15:49.048691','2023-02-23 04:11:07.317868','titanic-v-87','kVrqfYjkTdQ'),(65,14,'First Blood',1983,'John J. Rambo is a former United States Special Forces soldier who fought in Vietnam and won the Congressional Medal of Honor, but his time in Vietnam still haunts him. As he came to Hope, Washington to visit a friend, he was guided out of town by the Sheriff William Teasel who insults Rambo, but what Teasel does not know that his insult angered Rambo to the point where Rambo became violent and was arrested.',0,'first_blood.webp','First Blood thumbnail','2023-02-27 03:48:31.847844','2023-02-27 03:48:31.847844','first-blood-v-54','IAqLKlxY3Eo');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (20,11,64,0,5,'2023-02-23 02:24:24.118153','2023-02-23 02:24:24.118153'),(21,11,65,1,5,'2023-02-27 15:15:50.697936','2023-02-27 15:17:16.637862'),(22,11,65,0,5,'2023-02-27 15:17:39.078518','2023-02-27 15:17:39.078518'),(23,10,64,0,4,'2023-02-27 15:25:46.151646','2023-02-27 15:26:02.360012');
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
INSERT INTO `schema_migrations` VALUES ('20230119052235'),('20230119064826'),('20230119090024'),('20230119090025'),('202301200733191'),('20230120093206'),('20230126021132'),('20230126040823'),('20230130141733'),('20230130141734'),('20230130141735'),('20230209042006'),('20230209154436'),('20230211124255'),('20230211154559'),('20230212213606'),('20230213003548'),('20230213004855'),('20230213011406'),('20230213011407'),('20230214225830'),('20230214230337'),('20230214230851'),('20230214233011'),('20230215174835'),('20230216095938'),('20230220032755'),('20230220032756'),('20230223053816'),('20230223053817');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'email','jaycastillo_admin@movieapp.com','$2a$12$4YXUkOknWWQp3Y0kPgMlk.eJ2Mgh2SyGnQizqqRXtBOptGUd1Ep4K',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo','actor.png','jaycastillo_admin@movieapp.com','admin','{\"_N3dTToPWOX4UrGaF37g5Q\":{\"token\":\"$2a$10$OgxlBhFDnof2c57C2QVuqOuiQnb39nrbuoOJFV5i665l43AFKaxYq\",\"expiry\":1678323928},\"v6-45qVm__4MzZMJnRbjGA\":{\"token\":\"$2a$10$UP/Ew0WVHWKRMaZc2RBH4e0GeToZApPSxkZ3WdgNT4f32VpAz/vVy\",\"expiry\":1678327806},\"CBsRRxaC3yTjo_rmwuX23Q\":{\"token\":\"$2a$10$CeyfaK2xw2zNd00Z.XvxQOQABf3OZ1Egji45nZIrA4kMBG.ogpdBq\",\"expiry\":1678327985},\"CC_ftOxfUp2BIV9-A_TQsg\":{\"token\":\"$2a$10$DUpRGbZekhUnPHuVbpxLE.t6DoH33a8Qe28pA68AHdaTcuJEoAxVi\",\"expiry\":1678328862},\"TPOWcI6SKN3iORMH2CmduA\":{\"token\":\"$2a$10$OeI6VpoWRgz7nRu30W6ZReyVGP8pkT.O/JqjuCxgvoW95CsIsKosu\",\"expiry\":1678682322},\"Z3EKqMNPK3pw5q-1yZ_X5w\":{\"token\":\"$2a$10$1ZuRMjHOyGxEiV8R3E3iquM4mbPnOZPTaoE8Z/S7oQ81ZY06Fr6lW\",\"expiry\":1678682585},\"itqeFQSydN-vOIYPm73z3g\":{\"token\":\"$2a$10$WCEYhNHJby6xy1CnWY8A1.d13bG9UeuTy7AyKl53XhqJWKY4x1w2S\",\"expiry\":1678720358},\"Uib17wVX8gqFiwiwCSllhQ\":{\"token\":\"$2a$10$pzOHowwVvli/aaAb4L8n4uys/nRYq209IWRFxf.giv8XTXIJu5y46\",\"expiry\":1678720607},\"9sZVL2LHcIsxslKuyum55g\":{\"token\":\"$2a$10$MB70.cvNI6RZWSKCgRFMsOYb9xNQa/xo8FmroDa4UKdIdfaCUKXOW\",\"expiry\":1678769279},\"h8FRBQBDTGcg24jkRdn0fg\":{\"token\":\"$2a$10$p9ng0ZKEa8ojJIEy9v5Xge89P544DjKDVPS.8a/YQe/fH63pNnaB2\",\"expiry\":1678769383}}','2023-02-16 09:28:26.196159','2023-02-28 04:49:43.199745',0),(7,'email','defaultadmin@movieapp.com','$2a$12$wWEJEMqSBai9D/RPH2ME3usucGYaRDm/NOJ97AOGB66u0oD5eutOq',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Default Admin','defaultadmin','zuck.jpeg','defaultadmin@movieapp.com','admin','{\"v8mJDNs1pSr1O1ZXMrZ0dw\":{\"token\":\"$2a$10$TQH2qyRafLbPD8yYvZvEY.21tf6vDWX5Ju/97o2/xhItg73mzavP6\",\"expiry\":1677969095},\"M3EwCzEom5r7DYpcqD2l1w\":{\"token\":\"$2a$10$8JoddWjyop/jknQ0R8Z8e./eqb523B9qh7Rp3WAVBySJ0.G2uYWNe\",\"expiry\":1678074770},\"aOXui2WTqA9UM_MxlpgqsQ\":{\"token\":\"$2a$10$8Z1RvchfHZtPD94i5xSR6u8/vsSzJeAaLkqtMbLUqb1piTgiZxqM2\",\"expiry\":1678074803},\"Zqvr7XAB2E-GCxoX_4ihYg\":{\"token\":\"$2a$10$L5fG/Wk3MRrovTQpZLgLU.A4JYYzg1LqmijB.R87pqMbenSWHLxry\",\"expiry\":1678074830},\"4pM_yo2lBHlxctBc6MQfqA\":{\"token\":\"$2a$10$KpkZV2Vq/u2VFjTqQRiZKuOMa6YOVx8vypeeu5/d/Hnjw9DxtNzwW\",\"expiry\":1678074837},\"dCIQpSgH5FuYqkihXGEQ1Q\":{\"token\":\"$2a$10$spuu5Mg/PsUmoqeGbZ5Tr.NBpHXq34Q..ggti66zjmK0IQLJ3bt5m\",\"expiry\":1678074862},\"SD8ISv1B1REmUFG9Wm9hDg\":{\"token\":\"$2a$10$6.2kz.wqLeyX6Y5tETbAdeQhqsBOHgqZZIUlLaniXCujO4R4fQu4K\",\"expiry\":1678074943},\"oCtSO0IEBFz69uxmCDvq8g\":{\"token\":\"$2a$10$Sp9qw8r4HIbdMunMHH6aAOgHYg0kxzBbwRsVcz00.tP/E0zbFm0B.\",\"expiry\":1678074984},\"_5JcpDe1TAR8pASfzAEuCQ\":{\"token\":\"$2a$10$KGjaj0Lg9nA3eyQP3LdRcOieyKL5vl2ifkKktuGfegDnD7nOjQ4.q\",\"expiry\":1678075005},\"M0ioaGJAK5VYCUn3pHssTA\":{\"token\":\"$2a$10$LakkQ9pOZsNLnHvYpe4mtOgOabjM8DUr2grXucPveRY4Rdg/FZOHK\",\"expiry\":1678756263}}','2023-02-16 09:29:45.810094','2023-02-28 01:11:03.520469',0),(8,'email','user@gmail.com','$2a$12$bpC549C9QulaSxcWU40LweC8/Hix6nNNpl4Wzoj4YcLIAzk7A5WeG',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'User123','user123','zuck.jpeg','user@gmail.com','user','{\"f5Fz2U3XMo7k-dbkcPWThQ\":{\"token\":\"$2a$10$l4ylGPVyAG6Q6f4YACiGiOtfMuUyp5nVUADbfm62JZrTN.H8r9DCO\",\"expiry\":1677819282},\"weuEXJOMH2VII1qxKZo8OQ\":{\"token\":\"$2a$10$l2KbN58xZQBwPflUv9YfBu3HIIkuSNH6XghiZE6OilcK0ATEb.hQS\",\"expiry\":1677819282},\"WZ2jzP1hNSPFC_wSonZ21w\":{\"token\":\"$2a$10$nvXTPzIAfxd7GuWGmMNr5uu7p3NX0pM0IOn.Q1WvwwRQC2FaGFQaK\",\"expiry\":1677819491},\"oBgbxHP1qHoz6FDdfB7WzQ\":{\"token\":\"$2a$10$UkIRrz.fHRRsSkz8DDwc8.snbMCHyYofJQ9GtKEPrAF0cxDh3CjDS\",\"expiry\":1677819491},\"zxQN8sSn8gf6QF80d4s-Dg\":{\"token\":\"$2a$10$/j98LQY50KiL9cOnS10t7euV9GwKQCgaDYh677eL4pr0yERK4jBc.\",\"expiry\":1677820244},\"Y6XVUGovVjDIcLJsrpmx7g\":{\"token\":\"$2a$10$59C.FvW/AiG3RJxXFH9.sekQfk2IS7u2kE.tB8rp0uawjh3O6CReG\",\"expiry\":1677820244},\"vwjlnE1k4H46AbfM3-M6Ag\":{\"token\":\"$2a$10$zMK32l0lsklQse5ia9yTZOW6dKLX8dJpgEiYdecQFmFLy8LpHUCIi\",\"expiry\":1677823338},\"y4A8tcZO5OySuhHW5UeJYQ\":{\"token\":\"$2a$10$nIfPKbVQvATiAbZWoeRsQOoEYiZaz5DgA6Aj.c6AvWMhsKUpoRLIS\",\"expiry\":1677823424},\"uAUzRgc09fqZheDSn0JRrw\":{\"token\":\"$2a$10$f7t603cFjeB8OsxdUHpijuyLPnHLfua9sNvJtUioW9PR/DoOWxTLu\",\"expiry\":1677823514},\"Y6wo1-qfov3Mo41OaF9a1Q\":{\"token\":\"$2a$10$qUDYsd2giUMYIStu4pg13eonP9XhvsJ227Ppe4Hmy1/M7NTAXYR62\",\"expiry\":1677878578}}','2023-02-16 09:30:10.728337','2023-02-20 04:05:38.014515',0),(9,'email','yeahboy2798@movieapp.com','$2a$12$Ry15ThHhPQdtqWi9e.Ym/.DsldAwf0r9MEQB6y5TB94ZlTxt78OF6',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay Castillo','michaeljay',NULL,'yeahboy2798@movieapp.com','user','{\"C1ni41l81KbJocio0NngSQ\":{\"token\":\"$2a$10$9DRfonBuH.ZKoCGQ6xhzuO.efI4YtBJACoTBRGYp6LPitYabfJxN2\",\"expiry\":1677822921},\"M7RoePl1kWdKnBAneb148w\":{\"token\":\"$2a$10$DsTaI8BHe3geSnIWFN6fc.EUtwq9TfBJafOk0R3fgpjoWr2AtAz7y\",\"expiry\":1678074096}}','2023-02-17 05:55:21.387653','2023-02-20 03:42:08.789410',0),(10,'email','bustinejieber@movieapp.com','$2a$12$TzXSHV9t889qCbYbfZoXlumcj9qBjt.Mz0muJhRTuokjyckWwE98.',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Bustine Jieber','bustinejieber','download.jpeg','bustinejieber@movieapp.com','user','{\"ssfot_3RHT1GeQWv8Ml_zw\":{\"token\":\"$2a$10$B8X8JIcg6cUR4dB3kcO7quhh/ZJ73rj.NrDeMNXTU7MuPjksJd76m\",\"expiry\":1678075679},\"98tEaszNiV5U7MXLeslecQ\":{\"token\":\"$2a$10$05cy3ybuOUwHR7FSDgZc2OA3a9OQvBPlAlUdPGzxwEyzN7S/9P0TK\",\"expiry\":1678091115},\"wy2coJ6EE_qIZ083XWLH5Q\":{\"token\":\"$2a$10$oohjbiB8PaYWQvl1XNl6IOl4LvzNz/a6kmFUgJ5JCHlveQbvP6CSW\",\"expiry\":1678091418},\"TXB80jvBLwdHNWucDISFEQ\":{\"token\":\"$2a$10$2K6eEiOE24LY5dbPw10KU.GexXDnyad9LBleToV4ojthD.XR4Wxwu\",\"expiry\":1678153223},\"uQclFPpNDzkseZeIyLBtqQ\":{\"token\":\"$2a$10$hEqx/U2Wp3lZfez0fJYfe.sDyQVxvABFLBTRV8widL5/3fdIMrxgO\",\"expiry\":1678154751},\"QXtyIjnXoQqdVT6TD0wdqA\":{\"token\":\"$2a$10$TLmGlnKFOGNyo8Uueg6Bn.95W7pMBreqqG9hjq85jw1J.hDhPj9t2\",\"expiry\":1678155954},\"iLWUrmy0Nx39KmZixa341A\":{\"token\":\"$2a$10$39Gwg.6QMnYFJpOVAgOLU.C50L4/KGE9JUjM32pyRZ4Mt8yCsM1sy\",\"expiry\":1678264094},\"t-Kgx32LSnsvTwd8oXpS3w\":{\"token\":\"$2a$10$g9iZZ1Waekg.6ZwoD4Wzue9oT2QT/Czb7gnIa.uh.rfDdpO4DfCDG\",\"expiry\":1678264566},\"f6-7O8u-irkNedWT34DWbQ\":{\"token\":\"$2a$10$tCXbyhbagJoNmUsAbtTOGuL8/r5p.bjHD3qb6aQP1pXksQglCkKYC\",\"expiry\":1678264836},\"6tP3numSunVS6Sqy6LZ6iw\":{\"token\":\"$2a$10$JTprWgyMwpoaZHzHloEpXe9MzIBdZCwruYXeMWsAHV5x8uENXFUtS\",\"expiry\":1678721119}}','2023-02-17 05:56:46.266241','2023-02-27 15:25:19.425314',0),(11,'email','gilbates@movieapp.com','$2a$12$rNron5ntAkEmf5ASxJMkRec4K2HKalX0U2cW2OlGwnKV1DgpsqRwK',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Gil Bates','gilbates','Bill-Gates-2011.webp','gilbates@movieapp.com','user','{\"R09nDKhCsNR21_90f7aU7w\":{\"token\":\"$2a$10$u.Qn/ZJgE7QXtdHfZ0Cdb.LYPppa/IQRKsSNZzOh6M.EQgFHoJkau\",\"expiry\":1678213556},\"qOvqFVj0-xdqv6mNkyXENQ\":{\"token\":\"$2a$10$rV95Abcfc.Q5TyB5GB76D.mjwRgZmZ6jltanDZnMlmW7svXD85Wdy\",\"expiry\":1678213604},\"lpmDl8btzyOXjfQTWHIDwg\":{\"token\":\"$2a$10$Wj0eay29.zH0P3RrF2GnvOBVpaP2aw/mOnLy/P/psvyz3fegXlSSG\",\"expiry\":1678328641},\"t34upJWZQ1HFweUsoYSJZA\":{\"token\":\"$2a$10$y2AjwYjpcFwl/T1eTpRm.ertEjEp5S9oCMhEKLHs8RnrbsIk4QU0a\",\"expiry\":1678328757},\"J_ck767NWYLdVsTIaWj4Vw\":{\"token\":\"$2a$10$ejfNz7cfKyGRmiFXmTe1kuzGsNguEvvVCdZJH1YFsvEig2WDZ9Jii\",\"expiry\":1678328906},\"X7PMccqKgQxAoHuO8Da5VQ\":{\"token\":\"$2a$10$oDLdl/1YMZ4zmxoSlVcNy.1GGN4yZr3SbKSzVv4de49ijbhXFECMu\",\"expiry\":1678680275},\"Cf5jP5QDPn4JvUurCYSHqA\":{\"token\":\"$2a$10$LfrXS4cMkkwBn1Ezw3G4PuJLOcNgDe8ilwOqCJwGacds5vKrAzxye\",\"expiry\":1678682355},\"KuEDCgP8RJvcXYloZ64WBg\":{\"token\":\"$2a$10$uER8nGkF2Qt.DN7Ra0jO/OBTRFmIXMqlQnh4eJwUamdOyGy0hZYhy\",\"expiry\":1678682395},\"zDAKX_FH1rD3DHuu6tcpSQ\":{\"token\":\"$2a$10$2q7d7YG/lujVG1nT2Eb4I.Mn0Z4OrneD0x3L2tRSHXuDOEKUNPwvu\",\"expiry\":1678720498},\"GjKGYgJfNabpa0u-Ogjdpg\":{\"token\":\"$2a$10$pRzYuM1g8FIQnclfXr40zeATR6pfyyaHVa6/rZo4qKIIHMq9kavci\",\"expiry\":1678769364}}','2023-02-17 09:33:31.093163','2023-02-28 04:49:24.915148',0),(12,'email','jichaelmackson@movieapp.com','$2a$12$VaWK20EzYQP7EZ5jPKjp3.wBMOmPvEdc85ezS8gdCet4fWwfaIioK',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Jichael Mackson','jichaelmackson','jichael_mackson.webp','jichaelmackson@movieapp.com','user','{\"abQuk8feaRqGBv6zV2Nzjg\":{\"token\":\"$2a$10$aZl9OwwrjIDo1N.21Lo1geDoTd6L0LGRVkTNMAHQUcRdxd1jBVezC\",\"expiry\":1678073999},\"vxjW94Yi3xCWk6SKGpuHdw\":{\"token\":\"$2a$10$ko1e.ccHtk048cXHL1EgPe/d8UZ2/Cdcg8OiKNebZqwa.mZgWaKGa\",\"expiry\":1678074012},\"QC63gWNDz7TyEVQ066yQyg\":{\"token\":\"$2a$10$GcTwtSes9BgbimCTDt19W.0Ux78oSPEslGhefX5unHOE8apMo/9mG\",\"expiry\":1678091365},\"kml-bUnmPt6OxZLYJYm5mg\":{\"token\":\"$2a$10$k1it8JT4L/ORgenbnFHSIe9dDe/4l2Y4atvqKP8uODze/UO5HBjMq\",\"expiry\":1678094385}}','2023-02-20 03:39:59.417877','2023-02-20 09:19:45.131577',0),(13,'email','gilbatess@movieapp.com','$2a$12$DMqEU2OR78GRsgpYEp0HZ.d0RW1jCitThCAbqU33qBkrLc0Y6KtKa',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay Castillo','gilbatess',NULL,'gilbatess@movieapp.com','user','{\"ZUdgHQ8uhXxeqq5cbRo7Jw\":{\"token\":\"$2a$10$p4/oJaAT8kD.EcAVPyVVg.CMLnwCNyr.WH0Vu90QzY2dT/25aTfOK\",\"expiry\":1678209201},\"09A503j6T-4bMkAFF1gn6w\":{\"token\":\"$2a$10$6Rj66ALpWF3E7yzLNxiXBe2PXtMmOO1sKZzxxDqB4HQU8Y6yeIvqy\",\"expiry\":1678209207}}','2023-02-21 17:13:21.703852','2023-02-21 18:26:34.600114',1),(14,'email','gilbatesss@movieapp.com','$2a$12$MjXFzGdi2/wyC2itP85rt..UNxM9GZr4mIdWDEhlsqKiotOH28b.K',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Gil Bates','gilbatesss','user_active.png','gilbatesss@movieapp.com','user','{\"fP886__HSAdjr6I69J1PpQ\":{\"token\":\"$2a$10$ye9FxUZXqGaljcevB08NRuZRcJfHy5TdnB3KEAWz42RcR10jBdnFm\",\"expiry\":1678210529}}','2023-02-21 17:35:29.833910','2023-02-21 18:26:29.697583',1),(15,'email','jaycastillo@movieapp.com','$2a$12$bbi/VfuN0XMN9KtTF6sTJuK6zIkSbNsPTyqwXdE6PVqY6c1oTIbRK',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Michael Jay','jaycastillo2798','heart_active.png','jaycastillo@movieapp.com','admin','{\"PSb36QJkClEhVTPqkpiyQg\":{\"token\":\"$2a$10$OLHg.uWNjfHYL4zrh9Xy..0Ttf5U31malH3MuhHeVl274on5TeXoG\",\"expiry\":1678210759},\"pWychSDd30hCXWRuVYLYyw\":{\"token\":\"$2a$10$HTvonaZqlcxD7sFeMDFwfe1PRSSVvpWXYeJFxA96Yj6xfGgDMrdQa\",\"expiry\":1678756091},\"gahBk1YQYIhbvUf09wOD7g\":{\"token\":\"$2a$10$BSGvg7U49bAnpqYKCtKVIO1zuTMwqSM2H7.Vv2ox/KUCnKldtcU5K\",\"expiry\":1678756101},\"JtKVgaYwWQymFJtFyQ-_sQ\":{\"token\":\"$2a$10$ALVQVqPT4WWIZK./CUdZK.KJWqMETUONMFEAzEKVipL9c6dPm9PmC\",\"expiry\":1678756172},\"2-SmKr-jaMO1clpdpjZxew\":{\"token\":\"$2a$10$yyUS.5mBUoeXMRtLanGKiOeikERmmU.OvsP84/.49ob.Kq59TwcCW\",\"expiry\":1678756195}}','2023-02-21 17:39:19.200148','2023-02-28 01:09:55.803783',1);
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

-- Dump completed on 2023-02-28 16:21:27

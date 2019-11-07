-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: strategic
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fancy_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CNPJ` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_slug_unique` (`slug`),
  KEY `companies_user_id_foreign` (`user_id`),
  CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,1,'Agro 4.0','Agro',NULL,'020547865541454','2019-11-05 22:04:47','2019-11-05 22:04:47'),(2,1,'assa','sas',NULL,'sas','2019-11-06 02:30:57','2019-11-06 02:30:57');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_profile`
--

DROP TABLE IF EXISTS `company_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `mission` text COLLATE utf8mb4_unicode_ci,
  `vision` text COLLATE utf8mb4_unicode_ci,
  `values` text COLLATE utf8mb4_unicode_ci,
  `strategic_plan` text COLLATE utf8mb4_unicode_ci,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_profile_company_id_foreign` (`company_id`),
  CONSTRAINT `company_profile_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_profile`
--

LOCK TABLES `company_profile` WRITE;
/*!40000 ALTER TABLE `company_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'um',NULL,NULL),(2,'dois',NULL,NULL),(3,'tres',NULL,NULL),(4,'quatro',NULL,NULL),(5,'cinco',NULL,NULL),(6,'seis',NULL,NULL),(7,'sete',NULL,NULL),(8,'oito',NULL,NULL),(9,'nove',NULL,NULL),(10,'dez',NULL,NULL),(11,'onze',NULL,NULL),(12,'doze',NULL,NULL),(13,'treze',NULL,NULL);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_09_02_003528_create_table_companies',1),(4,'2019_09_07_222015_create_table_swot',1),(5,'2019_09_08_181731_create_table_company_profile',1),(6,'2019_09_08_181803_create_table_fields',1),(7,'2019_09_08_181913_create_table_pillars',1),(8,'2019_09_08_181945_create_table_sub_frases',1),(9,'2019_09_08_182014_create_table_sub_frases_has_fields_and_pillars',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pillars`
--

DROP TABLE IF EXISTS `pillars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pillars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pillars`
--

LOCK TABLES `pillars` WRITE;
/*!40000 ALTER TABLE `pillars` DISABLE KEYS */;
INSERT INTO `pillars` VALUES (1,'missao',NULL,NULL),(2,'visao',NULL,NULL),(3,'valores',NULL,NULL);
/*!40000 ALTER TABLE `pillars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_frases`
--

DROP TABLE IF EXISTS `sub_frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_frases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expression` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_frases`
--

LOCK TABLES `sub_frases` WRITE;
/*!40000 ALTER TABLE `sub_frases` DISABLE KEYS */;
INSERT INTO `sub_frases` VALUES (1,'Ser',NULL,NULL),(2,'Estar',NULL,NULL),(3,'Ter',NULL,NULL),(4,'Proporcionar',NULL,NULL),(5,'Tornar-se',NULL,NULL),(6,'a empresa',NULL,NULL),(7,'lider',NULL,NULL),(8,'o grupo',NULL,NULL),(9,'referencia',NULL,NULL),(10,'simplesmente',NULL,NULL),(11,'uma empresa',NULL,NULL),(12,'a melhor',NULL,NULL),(13,'de melhor',NULL,NULL),(14,'entre as maiores',NULL,NULL),(15,'entre as melhores',NULL,NULL),(16,'entre os melhores',NULL,NULL),(17,'que melhor',NULL,NULL),(18,'reconhecida(o)',NULL,NULL),(19,'referencia',NULL,NULL),(20,'uma das melhores',NULL,NULL),(22,'o grupo',NULL,NULL),(23,'a empresa',NULL,NULL),(24,'empresa',NULL,NULL),(25,'empresas',NULL,NULL),(26,'um grupo',NULL,NULL),(27,'uma empresa',NULL,NULL),(28,'a melhor',NULL,NULL),(29,'alegria',NULL,NULL),(30,'como a mmelhor',NULL,NULL),(31,'como o melhor',NULL,NULL),(32,'desempenha',NULL,NULL),(33,'desempenho',NULL,NULL),(34,'empresas',NULL,NULL),(35,'excelencia',NULL,NULL),(36,'grupos',NULL,NULL),(37,'grupos',NULL,NULL),(38,'lider',NULL,NULL),(39,'mais competitiva',NULL,NULL),(40,'mais competitivo',NULL,NULL),(41,'mais eficiente',NULL,NULL),(42,'o melhor',NULL,NULL),(43,'pela excelencia',NULL,NULL),(44,'reconhecida',NULL,NULL),(45,'referencia',NULL,NULL),(46,'satisfacao',NULL,NULL),(47,'grupo',NULL,NULL),(48,'empresa',NULL,NULL),(49,'na area',NULL,NULL),(50,'na atividade',NULL,NULL),(51,'no ramo',NULL,NULL),(52,'no uso',NULL,NULL),(53,'da tecnologia',NULL,NULL),(54,'de saude',NULL,NULL),(55,'de servicos',NULL,NULL),(56,'de tecnologia',NULL,NULL),(57,'economicos',NULL,NULL),(58,'em saude',NULL,NULL),(59,'em servicos',NULL,NULL),(60,'em tecnologia',NULL,NULL),(61,'energia',NULL,NULL),(62,'financeiro',NULL,NULL),(63,'financeiros',NULL,NULL),(64,'nos negocios',NULL,NULL),(65,'presta servicos',NULL,NULL),(66,'que aja',NULL,NULL),(67,'que opere',NULL,NULL),(68,'varejista',NULL,NULL),(69,'de forma',NULL,NULL),(70,'de maneira',NULL,NULL),(71,'de tecnologia',NULL,NULL),(72,'e reconhecida',NULL,NULL),(73,'em inovacao',NULL,NULL),(74,'em qualidade',NULL,NULL),(75,'pela inovacao',NULL,NULL),(76,'tecnologia',NULL,NULL),(77,'com flexibilidade',NULL,NULL),(78,'com flexibilidade e inovacao',NULL,NULL),(79,'com inovacao e tecnologia',NULL,NULL),(80,'global',NULL,NULL),(81,'globalmente',NULL,NULL),(82,'local',NULL,NULL),(83,'na mente',NULL,NULL),(84,'total',NULL,NULL),(85,'no segmento',NULL,NULL),(86,'no mercado',NULL,NULL),(87,'na area',NULL,NULL),(88,'alimenticio',NULL,NULL),(89,'automotivo',NULL,NULL),(90,'comunicacoes',NULL,NULL),(91,'energia',NULL,NULL),(92,'financeiro',NULL,NULL),(93,'financeiros',NULL,NULL),(94,'informatica',NULL,NULL),(95,'metal-mecanico',NULL,NULL),(96,'metalurgico',NULL,NULL),(97,'moveleiro',NULL,NULL),(98,'textil',NULL,NULL),(99,'em que atua',NULL,NULL),(100,'da america latina',NULL,NULL),(101,'de atuacao',NULL,NULL),(102,'do mundo',NULL,NULL),(103,'do pais',NULL,NULL),(104,'dos clientes',NULL,NULL),(105,'na area de abrangencia',NULL,NULL),(106,'na area de atuacao',NULL,NULL),(107,'no mercado em que atua',NULL,NULL),(108,'no pais',NULL,NULL),(109,'no ser humano',NULL,NULL),(110,'pelos clientes',NULL,NULL);
/*!40000 ALTER TABLE `sub_frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_frases_has_fields_and_pillars`
--

DROP TABLE IF EXISTS `sub_frases_has_fields_and_pillars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_frases_has_fields_and_pillars` (
  `field_id` bigint(20) unsigned NOT NULL,
  `sub_frase_id` bigint(20) unsigned NOT NULL,
  `pillar_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `sub_frases_has_fields_and_pillars_field_id_foreign` (`field_id`),
  KEY `sub_frases_has_fields_and_pillars_sub_frase_id_foreign` (`sub_frase_id`),
  KEY `sub_frases_has_fields_and_pillars_pillar_id_foreign` (`pillar_id`),
  CONSTRAINT `sub_frases_has_fields_and_pillars_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`),
  CONSTRAINT `sub_frases_has_fields_and_pillars_pillar_id_foreign` FOREIGN KEY (`pillar_id`) REFERENCES `pillars` (`id`),
  CONSTRAINT `sub_frases_has_fields_and_pillars_sub_frase_id_foreign` FOREIGN KEY (`sub_frase_id`) REFERENCES `sub_frases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_frases_has_fields_and_pillars`
--

LOCK TABLES `sub_frases_has_fields_and_pillars` WRITE;
/*!40000 ALTER TABLE `sub_frases_has_fields_and_pillars` DISABLE KEYS */;
INSERT INTO `sub_frases_has_fields_and_pillars` VALUES (1,1,2,NULL,NULL),(1,2,2,NULL,NULL),(1,3,2,NULL,NULL),(1,4,2,NULL,NULL),(1,5,2,NULL,NULL),(2,6,2,NULL,NULL),(2,7,2,NULL,NULL),(2,8,2,NULL,NULL),(2,9,2,NULL,NULL),(2,10,2,NULL,NULL),(2,11,2,NULL,NULL),(3,12,2,NULL,NULL),(3,13,2,NULL,NULL),(3,14,2,NULL,NULL),(3,15,2,NULL,NULL),(3,16,2,NULL,NULL),(3,17,2,NULL,NULL),(3,18,2,NULL,NULL),(3,19,2,NULL,NULL),(3,20,2,NULL,NULL),(3,7,2,NULL,NULL),(4,22,2,NULL,NULL),(4,23,2,NULL,NULL),(4,24,2,NULL,NULL),(4,25,2,NULL,NULL),(4,26,2,NULL,NULL),(4,27,2,NULL,NULL),(5,28,2,NULL,NULL),(5,29,2,NULL,NULL),(5,30,2,NULL,NULL),(5,31,2,NULL,NULL),(5,31,2,NULL,NULL),(5,32,2,NULL,NULL),(5,33,2,NULL,NULL),(5,34,2,NULL,NULL),(5,35,2,NULL,NULL),(5,36,2,NULL,NULL),(5,37,2,NULL,NULL),(5,38,2,NULL,NULL),(5,39,2,NULL,NULL),(5,40,2,NULL,NULL),(5,41,2,NULL,NULL),(5,42,2,NULL,NULL),(5,43,2,NULL,NULL),(5,44,2,NULL,NULL),(5,45,2,NULL,NULL),(5,46,2,NULL,NULL),(6,47,2,NULL,NULL),(6,48,2,NULL,NULL),(7,49,2,NULL,NULL),(7,50,2,NULL,NULL),(7,51,2,NULL,NULL),(7,52,2,NULL,NULL),(8,53,2,NULL,NULL),(8,54,2,NULL,NULL),(8,55,2,NULL,NULL),(8,56,2,NULL,NULL),(8,57,2,NULL,NULL),(8,58,2,NULL,NULL),(8,59,2,NULL,NULL),(8,60,2,NULL,NULL),(8,61,2,NULL,NULL),(8,62,2,NULL,NULL),(8,63,2,NULL,NULL),(8,64,2,NULL,NULL),(8,65,2,NULL,NULL),(8,66,2,NULL,NULL),(8,67,2,NULL,NULL),(8,68,2,NULL,NULL),(9,69,2,NULL,NULL),(9,70,2,NULL,NULL),(9,71,2,NULL,NULL),(9,72,2,NULL,NULL),(9,73,2,NULL,NULL),(9,74,2,NULL,NULL),(9,75,2,NULL,NULL),(9,76,2,NULL,NULL),(9,77,2,NULL,NULL),(9,78,2,NULL,NULL),(9,79,2,NULL,NULL),(10,80,2,NULL,NULL),(10,81,2,NULL,NULL),(10,82,2,NULL,NULL),(10,83,2,NULL,NULL),(10,84,2,NULL,NULL),(11,85,2,NULL,NULL),(11,86,2,NULL,NULL),(11,87,2,NULL,NULL),(12,88,2,NULL,NULL),(12,89,2,NULL,NULL),(12,90,2,NULL,NULL),(12,91,2,NULL,NULL),(12,92,2,NULL,NULL),(12,93,2,NULL,NULL),(12,94,2,NULL,NULL),(12,95,2,NULL,NULL),(12,96,2,NULL,NULL),(12,97,2,NULL,NULL),(12,98,2,NULL,NULL),(13,99,2,NULL,NULL),(13,100,2,NULL,NULL),(13,101,2,NULL,NULL),(13,102,2,NULL,NULL),(13,104,2,NULL,NULL),(13,105,2,NULL,NULL),(13,106,2,NULL,NULL),(13,107,2,NULL,NULL),(13,108,2,NULL,NULL),(13,109,2,NULL,NULL),(13,110,2,NULL,NULL),(13,103,2,NULL,NULL);
/*!40000 ALTER TABLE `sub_frases_has_fields_and_pillars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swot`
--

DROP TABLE IF EXISTS `swot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swot` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swot`
--

LOCK TABLES `swot` WRITE;
/*!40000 ALTER TABLE `swot` DISABLE KEYS */;
/*!40000 ALTER TABLE `swot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Gabriel Doyle Balk','gbalk@inf.ufsm.br',NULL,'$2y$10$JXbSYlLlDMfzdwVtf3VDdOMe4WOS/JWS/m4hHJxzRsUraO5TEiYIi',NULL,'2019-11-05 21:56:13','2019-11-05 21:56:13');
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

-- Dump completed on 2019-11-07  2:41:16

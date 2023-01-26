-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: freescout
-- ------------------------------------------------------
-- Server version	8.0.32-0buntu0.20.04.1

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int unsigned DEFAULT NULL,
  `causer_type` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `file_dir` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int unsigned NOT NULL,
  `size` int unsigned DEFAULT NULL,
  `embedded` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attachments_thread_id_embedded_index` (`thread_id`,`embedded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_folder`
--

DROP TABLE IF EXISTS `conversation_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_folder` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned NOT NULL,
  `conversation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_folder_folder_id_conversation_id_unique` (`folder_id`,`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_folder`
--

LOCK TABLES `conversation_folder` WRITE;
/*!40000 ALTER TABLE `conversation_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL,
  `threads_count` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL,
  `folder_id` int unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `subject` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci,
  `bcc` text COLLATE utf8mb4_unicode_ci,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  `has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `created_by_user_id` int unsigned DEFAULT NULL,
  `created_by_customer_id` int unsigned DEFAULT NULL,
  `source_via` tinyint unsigned NOT NULL,
  `source_type` tinyint unsigned NOT NULL,
  `closed_by_user_id` int unsigned DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NULL DEFAULT NULL,
  `last_reply_from` tinyint unsigned DEFAULT NULL,
  `read_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `channel` tinyint unsigned DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `conversations_folder_id_status_index` (`folder_id`,`status`),
  KEY `conversations_mailbox_id_customer_id_index` (`mailbox_id`,`customer_id`),
  KEY `conversations_user_id_mailbox_id_state_status_index` (`user_id`,`mailbox_id`,`state`,`status`),
  KEY `conversations_folder_id_state_index` (`folder_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo_type` tinyint unsigned DEFAULT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phones` text COLLATE utf8mb4_unicode_ci,
  `websites` text COLLATE utf8mb4_unicode_ci,
  `social_profiles` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `channel` tinyint unsigned DEFAULT NULL,
  `channel_id` text COLLATE utf8mb4_unicode_ci,
  `meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `customers_first_name(80)_last_name(80)_index` (`first_name`(80),`last_name`(80))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_email_unique` (`email`),
  KEY `emails_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` tinyint unsigned NOT NULL,
  `total_count` int NOT NULL DEFAULT '0',
  `active_count` int NOT NULL DEFAULT '0',
  `meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `folders_mailbox_id_user_id_type_index` (`mailbox_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `user_id` int NOT NULL,
  `added_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `followers_conversation_id_user_id_unique` (`conversation_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltm_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ltm_translations_hash_unique` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox_user`
--

DROP TABLE IF EXISTS `mailbox_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailbox_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `after_send` tinyint unsigned NOT NULL DEFAULT '2',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `mute` tinyint(1) NOT NULL DEFAULT '0',
  `access` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailbox_user_user_id_mailbox_id_unique` (`user_id`,`mailbox_id`),
  KEY `mailbox_user_mailbox_id_index` (`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox_user`
--

LOCK TABLES `mailbox_user` WRITE;
/*!40000 ALTER TABLE `mailbox_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbox_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxes`
--

DROP TABLE IF EXISTS `mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aliases` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` tinyint unsigned NOT NULL DEFAULT '1',
  `from_name_custom` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_status` tinyint unsigned NOT NULL DEFAULT '2',
  `ticket_assignee` tinyint unsigned NOT NULL DEFAULT '2',
  `template` tinyint unsigned NOT NULL DEFAULT '1',
  `signature` text COLLATE utf8mb4_unicode_ci,
  `out_method` tinyint unsigned NOT NULL DEFAULT '1',
  `out_server` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `out_username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_password` text COLLATE utf8mb4_unicode_ci,
  `out_port` int unsigned DEFAULT NULL,
  `out_encryption` tinyint unsigned NOT NULL DEFAULT '1',
  `in_server` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `in_port` int unsigned NOT NULL DEFAULT '143',
  `in_username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_password` text COLLATE utf8mb4_unicode_ci,
  `in_protocol` tinyint unsigned NOT NULL DEFAULT '1',
  `in_encryption` tinyint unsigned NOT NULL DEFAULT '1',
  `auto_reply_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `auto_reply_subject` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_reply_message` text COLLATE utf8mb4_unicode_ci,
  `office_hours_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ratings` tinyint(1) NOT NULL DEFAULT '0',
  `ratings_placement` tinyint unsigned NOT NULL DEFAULT '1',
  `ratings_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_validate_cert` tinyint(1) NOT NULL DEFAULT '1',
  `in_imap_folders` text COLLATE utf8mb4_unicode_ci,
  `auto_bcc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_reply` text COLLATE utf8mb4_unicode_ci,
  `imap_sent_folder` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailboxes_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxes`
--

LOCK TABLES `mailboxes` WRITE;
/*!40000 ALTER TABLE `mailboxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_02_193005_create_translations_table',1),(2,'2018_06_10_000000_create_users_table',1),(3,'2018_06_10_100000_create_password_resets_table',1),(4,'2018_06_25_065719_create_mailboxes_table',1),(5,'2018_06_29_041002_create_mailbox_user_table',1),(6,'2018_07_07_071443_create_activity_logs_table',1),(7,'2018_07_09_052314_create_emails_table',1),(8,'2018_07_09_053559_create_customers_table',1),(9,'2018_07_11_010333_create_conversations_table',1),(10,'2018_07_11_074558_create_folders_table',1),(11,'2018_07_11_081928_create_conversation_folder_table',1),(12,'2018_07_12_003318_create_threads_table',1),(13,'2018_07_30_153206_create_jobs_table',1),(14,'2018_07_30_165237_create_failed_jobs_table',1),(15,'2018_08_04_063414_create_attachments_table',1),(16,'2018_08_05_045458_create_options_table',1),(17,'2018_08_05_153518_create_subscriptions_table',1),(18,'2018_08_06_114901_create_send_logs_table',1),(19,'2018_09_05_024109_create_notifications_table',1),(20,'2018_09_05_033609_create_polycast_events_table',1),(21,'2018_11_04_113009_create_modules_table',1),(22,'2018_11_13_143000_encrypt_mailbox_password',1),(23,'2018_11_26_122617_add_locale_column_to_users_table',1),(24,'2018_12_11_130728_add_status_column_to_users_table',1),(25,'2018_12_15_151003_add_send_status_data_column_to_threads_table',1),(26,'2019_06_16_124000_add_in_validate_cert_column_to_mailboxes_table',1),(27,'2019_06_21_130200_add_meta_subtype_columns_to_threads_table',1),(28,'2019_06_25_105200_change_status_message_column_in_send_logs_table',1),(29,'2019_07_05_370100_add_in_imap_folders_column_to_mailboxes_table',1),(30,'2019_10_06_123000_add_auto_bcc_column_to_mailboxes_table',1),(31,'2019_12_10_0856000_add_before_reply_column_to_mailboxes_table',1),(32,'2019_12_19_183015_add_meta_column_to_folders_table',1),(33,'2019_12_22_111025_change_passwords_types_in_mailboxes_table',1),(34,'2019_12_24_155120_create_followers_table',1),(35,'2020_02_06_103815_add_hide_column_to_mailbox_user_table',1),(36,'2020_02_16_121001_add_mute_column_to_mailbox_user_table',1),(37,'2020_03_06_100100_add_public_column_to_attachments_table',1),(38,'2020_03_29_095201_update_in_imap_folders_in_mailboxes_table',1),(39,'2020_04_16_122803_add_imap_sent_folder_column_to_mailboxes_table',1),(40,'2020_05_28_095100_drop_slug_column_in_mailboxes_table',1),(41,'2020_06_26_080258_add_email_history_column_to_conversations_table',1),(42,'2020_09_18_123314_add_access_column_to_mailbox_user_table',1),(43,'2020_09_20_010000_drop_email_history_column_in_conversations_table',1),(44,'2020_11_04_140000_change_foreign_keys_types',1),(45,'2020_11_19_070000_update_customers_table',1),(46,'2020_12_22_070000_move_user_permissions_to_env',1),(47,'2020_12_22_080000_add_permissions_column_to_users_table',1),(48,'2020_12_30_010000_add_imported_column_to_threads_table',1),(49,'2021_02_06_010101_add_meta_column_to_mailboxes_table',1),(50,'2021_02_09_010101_add_hash_column_to_ltm_translations_table',1),(51,'2021_02_17_010101_change_string_columns_in_mailboxes_table',1),(52,'2021_03_01_010101_add_channel_column_to_conversations_table',1),(53,'2021_03_01_010101_add_channel_columns_to_customers_table',1),(54,'2021_04_15_010101_add_meta_column_to_customers_table',1),(55,'2021_05_21_090000_encrypt_mailbox_out_password',1),(56,'2021_05_21_105200_encrypt_mail_password',1),(57,'2021_09_21_010101_add_indexes_to_conversations_table',1),(58,'2021_11_30_010101_remove_unique_index_in_folders_table',1),(59,'2021_12_25_010101_change_emails_column_in_users_table',1),(60,'2022_12_17_010101_add_meta_column_to_conversations_table',1),(61,'2022_12_18_010101_set_user_type_field',1),(62,'2022_12_25_010101_set_numeric_phones_in_customers_table',1),(63,'2023_01_14_010101_change_deleted_folder_index',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `license` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_alias_unique` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `options_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'fetch_emails_last_run','1674719692');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `polycast_events`
--

DROP TABLE IF EXISTS `polycast_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polycast_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channels` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `polycast_events_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polycast_events`
--

LOCK TABLES `polycast_events` WRITE;
/*!40000 ALTER TABLE `polycast_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `polycast_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_logs`
--

DROP TABLE IF EXISTS `send_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `send_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `message_id` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_type` tinyint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `status_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `send_logs_message_id_index` (`message_id`(191)),
  KEY `send_logs_customer_id_mail_type_created_at_index` (`customer_id`,`mail_type`,`created_at`),
  KEY `send_logs_thread_id_index` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_logs`
--

LOCK TABLES `send_logs` WRITE;
/*!40000 ALTER TABLE `send_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `medium` tinyint unsigned NOT NULL,
  `event` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_user_id_medium_event_unique` (`user_id`,`medium`,`event`),
  KEY `subscriptions_user_id_event_index` (`user_id`,`event`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,1,2),(3,1,1,3),(4,1,1,5),(2,1,1,13),(5,1,2,2),(7,1,2,3),(8,1,2,5),(6,1,2,13);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` tinyint unsigned NOT NULL,
  `subtype` tinyint unsigned DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `action_type` tinyint unsigned DEFAULT NULL,
  `action_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8mb4_unicode_ci,
  `cc` text COLLATE utf8mb4_unicode_ci,
  `bcc` text COLLATE utf8mb4_unicode_ci,
  `has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `message_id` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_via` tinyint unsigned NOT NULL,
  `source_type` tinyint unsigned NOT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `created_by_user_id` int unsigned DEFAULT NULL,
  `created_by_customer_id` int unsigned DEFAULT NULL,
  `edited_by_user_id` int DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT NULL,
  `body_original` longtext COLLATE utf8mb4_unicode_ci,
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `saved_reply_id` int DEFAULT NULL,
  `send_status` tinyint unsigned DEFAULT NULL,
  `send_status_data` text COLLATE utf8mb4_unicode_ci,
  `opened_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `threads_message_id_index` (`message_id`(191)),
  KEY `threads_conversation_id_type_from_customer_id_index` (`conversation_id`,`type`,`from`,`customer_id`),
  KEY `threads_conversation_id_created_at_index` (`conversation_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `invite_state` tinyint unsigned NOT NULL DEFAULT '3',
  `invite_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emails` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` tinyint unsigned NOT NULL DEFAULT '2',
  `enable_kb_shortcuts` tinyint(1) NOT NULL DEFAULT '1',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_index` (`role`),
  KEY `users_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Toni','Test','test@webfactory.de','$2y$10$jc4IbxrAlwS7yZsSBFfXgetPiCToZmPPqMVClkHz5NuBsDEVtk7Oe',2,'UTC',NULL,1,1,3,NULL,NULL,NULL,NULL,2,1,0,NULL,NULL,'2023-01-26 08:31:06','2023-01-26 08:31:06',NULL);
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

-- Dump completed on 2023-01-26  8:00:49

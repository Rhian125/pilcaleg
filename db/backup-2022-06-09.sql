-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_pilcaleg
CREATE DATABASE IF NOT EXISTS `db_pilcaleg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_pilcaleg`;

-- Dumping structure for table db_pilcaleg.activity_log
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.activity_log: ~69 rows (approximately)
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
	(1, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-02-28 13:24:28', '2023-02-28 13:24:28'),
	(2, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-02-28 14:20:52', '2023-02-28 14:20:52'),
	(3, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 05:58:10', '2023-03-01 05:58:10'),
	(4, 'default', 'Hapus Data Menu dengan ID = 19', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:56:55', '2023-03-01 06:56:55'),
	(5, 'default', 'Hapus Data Menu dengan ID = 18', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:01', '2023-03-01 06:57:01'),
	(6, 'default', 'Hapus Data Menu dengan ID = 14', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:06', '2023-03-01 06:57:06'),
	(7, 'default', 'Hapus Data Menu dengan ID = 13', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:11', '2023-03-01 06:57:11'),
	(8, 'default', 'Hapus Data Menu dengan ID = 17', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:18', '2023-03-01 06:57:18'),
	(9, 'default', 'Hapus Data Menu dengan ID = 16', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:22', '2023-03-01 06:57:22'),
	(10, 'default', 'Hapus Data Menu dengan ID = 15', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:29', '2023-03-01 06:57:29'),
	(11, 'default', 'Hapus Data Menu dengan ID = 6', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:34', '2023-03-01 06:57:34'),
	(12, 'default', 'Hapus Data Menu dengan ID = 7', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 06:57:38', '2023-03-01 06:57:38'),
	(13, 'default', 'Tambah Data Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:05:00', '2023-03-01 07:05:00'),
	(14, 'default', 'Ubah Data Menu dengan ID = 20', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:05:10', '2023-03-01 07:05:10'),
	(15, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:05:45', '2023-03-01 07:05:45'),
	(16, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:06:44', '2023-03-01 07:06:44'),
	(17, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:07:11', '2023-03-01 07:07:11'),
	(18, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:14:50', '2023-03-01 07:14:50'),
	(19, 'default', 'Hapus Data Sub Menu dengan ID = 18', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:14:58', '2023-03-01 07:14:58'),
	(20, 'default', 'Hapus Data Sub Menu dengan ID = 19', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:15:01', '2023-03-01 07:15:01'),
	(21, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:16:40', '2023-03-01 07:16:40'),
	(22, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:16:56', '2023-03-01 07:16:56'),
	(23, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:17:19', '2023-03-01 07:17:19'),
	(24, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:17:50', '2023-03-01 07:17:50'),
	(25, 'default', 'Ubah Data Sub Menu dengan ID = 22', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:18:01', '2023-03-01 07:18:01'),
	(26, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:18:42', '2023-03-01 07:18:42'),
	(27, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:19:38', '2023-03-01 07:19:38'),
	(28, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:19:53', '2023-03-01 07:19:53'),
	(29, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:20:09', '2023-03-01 07:20:09'),
	(30, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:21:03', '2023-03-01 07:21:03'),
	(31, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:21:17', '2023-03-01 07:21:17'),
	(32, 'default', 'Ubah Data Sub Menu Akses dengan ID = 51', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:21:22', '2023-03-01 07:21:22'),
	(33, 'default', 'Tambah Data Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:22:13', '2023-03-01 07:22:13'),
	(34, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:22:38', '2023-03-01 07:22:38'),
	(35, 'default', 'Ubah Data Profil dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:25:44', '2023-03-01 07:25:44'),
	(36, 'default', 'Ubah Data Profil dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:26:01', '2023-03-01 07:26:01'),
	(37, 'default', 'Ubah Data User dengan ID = 504', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:26:38', '2023-03-01 07:26:38'),
	(38, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:26:43', '2023-03-01 07:26:43'),
	(39, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 504, '[]', NULL, '2023-03-01 07:26:48', '2023-03-01 07:26:48'),
	(40, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 504, '[]', NULL, '2023-03-01 07:27:01', '2023-03-01 07:27:01'),
	(41, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:27:06', '2023-03-01 07:27:06'),
	(42, 'default', 'Ubah Data User dengan ID = 483', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:27:32', '2023-03-01 07:27:32'),
	(43, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:27:39', '2023-03-01 07:27:39'),
	(44, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 483, '[]', NULL, '2023-03-01 07:27:41', '2023-03-01 07:27:41'),
	(45, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:28:34', '2023-03-01 07:28:34'),
	(46, 'default', 'Hapus Data User dengan ID = 483', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:28:45', '2023-03-01 07:28:45'),
	(47, 'default', 'Hapus Data User dengan ID = 482', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:28:49', '2023-03-01 07:28:49'),
	(48, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:29:23', '2023-03-01 07:29:23'),
	(49, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:29:28', '2023-03-01 07:29:28'),
	(50, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 505, '[]', NULL, '2023-03-01 07:29:31', '2023-03-01 07:29:31'),
	(51, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 504, '[]', NULL, '2023-03-01 07:29:42', '2023-03-01 07:29:42'),
	(52, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 504, '[]', NULL, '2023-03-01 07:29:48', '2023-03-01 07:29:48'),
	(53, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:29:51', '2023-03-01 07:29:51'),
	(54, 'default', 'Hapus Data User dengan ID = 505', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:29:59', '2023-03-01 07:29:59'),
	(55, 'default', 'Ubah Data User dengan ID = 504', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:30:19', '2023-03-01 07:30:19'),
	(56, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:30:51', '2023-03-01 07:30:51'),
	(57, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:31:05', '2023-03-01 07:31:05'),
	(58, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:31:16', '2023-03-01 07:31:16'),
	(59, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:31:52', '2023-03-01 07:31:52'),
	(60, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:32:16', '2023-03-01 07:32:16'),
	(61, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:32:36', '2023-03-01 07:32:36'),
	(62, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:32:54', '2023-03-01 07:32:54'),
	(63, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:33:05', '2023-03-01 07:33:05'),
	(64, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:33:08', '2023-03-01 07:33:08'),
	(65, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 504, '[]', NULL, '2023-03-01 07:33:27', '2023-03-01 07:33:27'),
	(66, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:34:03', '2023-03-01 07:34:03'),
	(67, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:34:23', '2023-03-01 07:34:23'),
	(68, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:38:33', '2023-03-01 07:38:33'),
	(69, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:38:47', '2023-03-01 07:38:47'),
	(70, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:38:58', '2023-03-01 07:38:58'),
	(71, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:39:08', '2023-03-01 07:39:08'),
	(72, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:39:33', '2023-03-01 07:39:33'),
	(73, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 07:39:38', '2023-03-01 07:39:38'),
	(74, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 08:24:07', '2023-03-01 08:24:07'),
	(75, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 08:26:46', '2023-03-01 08:26:46'),
	(76, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 08:26:59', '2023-03-01 08:26:59'),
	(77, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 08:27:04', '2023-03-01 08:27:04'),
	(78, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 08:30:11', '2023-03-01 08:30:11'),
	(79, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 14:17:46', '2023-03-01 14:17:46'),
	(80, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 14:17:50', '2023-03-01 14:17:50'),
	(81, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 14:17:53', '2023-03-01 14:17:53'),
	(82, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 17:39:30', '2023-03-01 17:39:30'),
	(83, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 17:39:35', '2023-03-01 17:39:35'),
	(84, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-01 17:40:09', '2023-03-01 17:40:09'),
	(85, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 17:40:13', '2023-03-01 17:40:13');

-- Dumping structure for table db_pilcaleg.election_results
CREATE TABLE IF NOT EXISTS `election_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tps` int DEFAULT NULL,
  `number_of_ballots` int DEFAULT NULL,
  `number_of_valid_documents` int DEFAULT NULL,
  `number_of_invalid_letters` int DEFAULT NULL,
  `number_of_ohers` int DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `election_results_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `election_results_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `election_results_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `election_results_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.election_results: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.events: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.groups: ~3 rows (approximately)
INSERT INTO `groups` (`id`, `group_name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 0, 1, '2022-01-11 05:01:48', '2022-01-11 05:01:48'),
	(2, 'Operator', 0, 1, '2022-01-11 05:01:57', '2022-01-11 05:01:57'),
	(3, 'Kasir', 0, 1, '2022-01-18 02:38:17', '2022-01-18 02:41:41');

-- Dumping structure for table db_pilcaleg.image_uploads
CREATE TABLE IF NOT EXISTS `image_uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.image_uploads: ~11 rows (approximately)
INSERT INTO `image_uploads` (`id`, `filename`, `created_at`, `updated_at`) VALUES
	(1, '1653344319104DSC_5410 copy2.jpg', '2022-05-23 22:18:39', '2022-05-23 22:18:39'),
	(2, '1653344321784DSC_0410.JPG', '2022-05-23 22:18:42', '2022-05-23 22:18:42'),
	(3, '1653344324688photo_2.jpg', '2022-05-23 22:18:45', '2022-05-23 22:18:45'),
	(4, '1653344427962banner.png', '2022-05-23 22:20:28', '2022-05-23 22:20:28'),
	(8, '1653344596999DSC_5410 copy2.jpg', '2022-05-23 22:23:17', '2022-05-23 22:23:17'),
	(12, '1653344747149DSC_5410 copy2.jpg', '2022-05-23 22:25:47', '2022-05-23 22:25:47'),
	(13, '1653344749990Untitled-2.jpg', '2022-05-23 22:25:50', '2022-05-23 22:25:50'),
	(15, '1653344802347WhatsApp Image 2021-11-06 at 19.37.12.jpeg', '2022-05-23 22:26:42', '2022-05-23 22:26:42'),
	(16, '1653344853634photo_2.jpg', '2022-05-23 22:27:34', '2022-05-23 22:27:34'),
	(17, '1653344856062DSC_5410 copy2.jpg', '2022-05-23 22:27:36', '2022-05-23 22:27:36'),
	(22, '16533526167503167995-min.jpg', '2022-05-24 00:36:57', '2022-05-24 00:36:57');

-- Dumping structure for table db_pilcaleg.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `desc` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `category` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.menus: ~5 rows (approximately)
INSERT INTO `menus` (`id`, `menu_name`, `link`, `attribute`, `position`, `desc`, `category`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(4, 'Pengaturan', '#', 'fa fa-cogs', 15, NULL, 1, 1, 1, '2022-01-12 03:05:31', '2022-06-03 03:00:35'),
	(5, 'Log Activity', 'log', 'fa fa-circle-notch', 14, NULL, 2, 1, 1, '2022-01-14 09:59:00', '2022-06-03 03:00:56'),
	(20, 'Data Relawan', 'data_relawan', 'fa fa-user', 2, NULL, 2, 1, 1, '2023-02-28 11:24:56', '2023-03-01 07:05:10'),
	(21, 'Data Master', '#', 'fa fa-list', 1, NULL, 2, 1, 1, '2023-03-01 07:05:00', '2023-03-01 07:05:00'),
	(22, 'Data Pendukung', 'data_pendukung', 'fa fa-user', 3, NULL, 2, 1, 1, '2023-03-01 07:22:13', '2023-03-01 07:22:13');

-- Dumping structure for table db_pilcaleg.menu_accesses
CREATE TABLE IF NOT EXISTS `menu_accesses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL DEFAULT '0',
  `menu_id` int NOT NULL DEFAULT '0',
  `create` int NOT NULL DEFAULT '0',
  `read` int NOT NULL DEFAULT '0',
  `update` int NOT NULL DEFAULT '0',
  `delete` int NOT NULL DEFAULT '0',
  `print` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `menu_accesses_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_accesses_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.menu_accesses: ~8 rows (approximately)
INSERT INTO `menu_accesses` (`id`, `group_id`, `menu_id`, `create`, `read`, `update`, `delete`, `print`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 4, 1, 1, 1, 1, 1, 1, '2022-01-13 03:02:25', '2022-01-13 03:02:25'),
	(7, 1, 5, 1, 1, 1, 1, 1, 1, '2022-01-14 09:59:17', '2022-01-14 09:59:17'),
	(18, 3, 4, 1, 1, 0, 1, 1, 1, '2022-03-02 07:56:59', '2022-03-07 03:18:09'),
	(27, 1, 20, 1, 1, 1, 1, 1, 1, '2023-02-28 11:52:57', '2023-02-28 11:52:57'),
	(28, 1, 21, 0, 0, 0, 0, 0, 1, '2023-03-01 07:05:45', '2023-03-01 07:05:45'),
	(29, 1, 22, 1, 1, 1, 1, 1, 1, '2023-03-01 07:22:38', '2023-03-01 07:22:38'),
	(30, 2, 21, 0, 0, 0, 0, 0, 1, '2023-03-01 07:30:51', '2023-03-01 07:30:51'),
	(31, 2, 20, 1, 1, 1, 1, 1, 1, '2023-03-01 07:31:05', '2023-03-01 07:31:05'),
	(32, 2, 22, 1, 1, 1, 1, 1, 1, '2023-03-01 07:31:16', '2023-03-01 07:31:16');

-- Dumping structure for table db_pilcaleg.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.migrations: ~17 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2021_04_05_060844_create_sessions_table', 1),
	(7, '2021_05_11_132318_create_events_table', 1),
	(8, '2021_10_28_132348_create_activity_log_table', 1),
	(9, '2021_10_28_132349_add_event_column_to_activity_log_table', 1),
	(10, '2021_10_28_132350_add_batch_uuid_column_to_activity_log_table', 1),
	(11, '2023_02_28_210342_create_tbl_tim_pemenangan', 2),
	(12, '2023_02_28_213747_create_tbl_tim_pemenangan_tbl', 3),
	(13, '2023_02_28_213931_create_tim_pemenangan_tbl', 4),
	(14, '2023_02_28_214929_create_tbl_kecamatan', 5),
	(15, '2023_02_28_215052_create_kecamatan_tbl', 6),
	(16, '2023_02_28_215134_create_kelurahan_tbl', 7),
	(17, '2023_02_28_215716_create_tps_tbl', 8),
	(18, '2023_02_28_222205_create_relawan_tbl', 9),
	(19, '2023_02_28_223309_create_hasil_pemilihan_tbl', 10),
	(20, '2023_03_01_223618_create_subdistricts', 11),
	(21, '2023_03_01_223836_create_village_districts', 12),
	(22, '2023_03_01_223926_create_election_results', 13),
	(23, '2023_03_01_224225_create_support_teams', 13),
	(24, '2023_03_01_234346_create_volunteers', 13),
	(25, '2023_03_01_234424_create_tps', 13);

-- Dumping structure for table db_pilcaleg.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.password_resets: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('z3MtERxZL2JrDg2sAOlfqmRer1OA6YfsE7g1LSYi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTnhsZ051NUx3QXR1Vjk0UzJudTZlT3VtZktpT0lTSGdTRlVGd0RzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9waWxjYWxlZy50ZXN0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFJjLmVDdWQ1SVlnYUpBZUZJYWVUMk9RTTlMNE1pcWRWa1YuLnAxd2JRdm5QeHhHNkw2N215Ijt9', 1677692584);

-- Dumping structure for table db_pilcaleg.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `application_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `short_application_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `small_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `large_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `background_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `background_sidebar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gmaps_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `layout` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `skin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.settings: ~2 rows (approximately)
INSERT INTO `settings` (`id`, `application_name`, `short_application_name`, `small_icon`, `large_icon`, `background_login`, `background_sidebar`, `gmaps_key`, `layout`, `skin`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'PILCALEG 2024', 'PILCALEG', '16776560631.png', '16354769112.png', '16354882883.jpg', NULL, 'AIzaSyDk5azS8gZ2aDInOTqyPv7FmB5uBlu55RQ', 'default', 'skin-green-light', 1, '2021-10-29 02:58:27', '2023-03-01 07:39:33');

-- Dumping structure for table db_pilcaleg.subdistricts
CREATE TABLE IF NOT EXISTS `subdistricts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subdistricts_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.subdistricts: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.sub_menus
CREATE TABLE IF NOT EXISTS `sub_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `sub_menu_name` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `desc` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `sub_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.sub_menus: ~8 rows (approximately)
INSERT INTO `sub_menus` (`id`, `menu_id`, `sub_menu_name`, `link`, `attribute`, `position`, `desc`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(6, 4, 'User', 'user', 'fa-circle-notch', 1, NULL, 1, 1, '2022-01-12 05:42:20', '2022-01-14 12:01:44'),
	(7, 4, 'Menu', 'menu', 'fa-circle-notch', 3, NULL, 1, 1, '2022-01-12 05:43:01', '2022-01-12 05:43:01'),
	(8, 4, 'Group', 'group', 'fa-circle-notch', 2, NULL, 1, 1, '2022-01-12 05:43:18', '2022-01-12 05:43:18'),
	(20, 21, 'Kecamatan', 'kecamatan', NULL, 1, NULL, 1, 1, '2023-03-01 07:16:40', '2023-03-01 07:16:40'),
	(21, 21, 'Kelurahan', 'kelurahan', NULL, 2, NULL, 1, 1, '2023-03-01 07:16:56', '2023-03-01 07:16:56'),
	(22, 21, 'Data TPS', 'tps', NULL, 3, NULL, 1, 1, '2023-03-01 07:17:19', '2023-03-01 07:18:01'),
	(23, 21, 'Data DPT', 'dpt', NULL, 4, NULL, 1, 1, '2023-03-01 07:17:50', '2023-03-01 07:17:50'),
	(24, 21, 'Data RT/RW', 'rt_rw', NULL, 5, NULL, 1, 1, '2023-03-01 07:18:42', '2023-03-01 07:18:42');

-- Dumping structure for table db_pilcaleg.sub_menu_accesses
CREATE TABLE IF NOT EXISTS `sub_menu_accesses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL DEFAULT '0',
  `menu_id` int NOT NULL DEFAULT '0',
  `sub_menu_id` int NOT NULL DEFAULT '0',
  `create` int NOT NULL DEFAULT '0',
  `read` int NOT NULL DEFAULT '0',
  `update` int NOT NULL DEFAULT '0',
  `delete` int NOT NULL DEFAULT '0',
  `print` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `sub_menu_id` (`sub_menu_id`) USING BTREE,
  CONSTRAINT `sub_menu_accesses_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_menu_accesses_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu_accesses` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sub_menu_accesses_ibfk_3` FOREIGN KEY (`sub_menu_id`) REFERENCES `sub_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.sub_menu_accesses: ~9 rows (approximately)
INSERT INTO `sub_menu_accesses` (`id`, `group_id`, `menu_id`, `sub_menu_id`, `create`, `read`, `update`, `delete`, `print`, `user_id`, `created_at`, `updated_at`) VALUES
	(40, 1, 4, 8, 1, 1, 1, 1, 1, 1, '2022-03-08 01:26:36', '2022-03-08 01:26:37'),
	(41, 1, 4, 6, 1, 1, 1, 1, 1, 1, '2022-03-08 01:27:50', '2022-03-08 01:27:50'),
	(42, 1, 4, 7, 1, 1, 1, 1, 1, 1, '2022-03-08 01:28:05', '2022-03-08 01:28:05'),
	(47, 1, 21, 20, 1, 1, 1, 1, 0, 1, '2023-03-01 07:19:38', '2023-03-01 07:19:38'),
	(48, 1, 21, 21, 1, 1, 1, 1, 0, 1, '2023-03-01 07:19:53', '2023-03-01 07:19:53'),
	(49, 1, 21, 22, 1, 1, 1, 1, 0, 1, '2023-03-01 07:20:09', '2023-03-01 07:20:09'),
	(50, 1, 21, 23, 0, 0, 0, 0, 0, 1, '2023-03-01 07:21:03', '2023-03-01 07:21:03'),
	(51, 1, 21, 24, 1, 1, 1, 1, 0, 1, '2023-03-01 07:21:17', '2023-03-01 07:21:22'),
	(52, 2, 21, 23, 0, 0, 0, 0, 0, 1, '2023-03-01 07:31:52', '2023-03-01 07:31:52'),
	(53, 2, 21, 22, 1, 1, 1, 1, 0, 1, '2023-03-01 07:32:16', '2023-03-01 07:32:16'),
	(54, 2, 21, 24, 1, 1, 1, 1, 0, 1, '2023-03-01 07:32:36', '2023-03-01 07:32:36');

-- Dumping structure for table db_pilcaleg.support_teams
CREATE TABLE IF NOT EXISTS `support_teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_teams_family_card_number` bigint DEFAULT NULL,
  `support_teams_id_number` bigint DEFAULT NULL,
  `support_teams_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_place_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_date_of_birth` date DEFAULT NULL,
  `support_teams_gender` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_cellphone` bigint DEFAULT NULL,
  `support_teams_address` text COLLATE utf8mb4_unicode_ci,
  `support_teams_rt` int DEFAULT NULL,
  `support_teams_rw` int DEFAULT NULL,
  `support_teams_must_choose` int DEFAULT NULL,
  `status_hapus` int DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_teams_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `support_teams_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `support_teams_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `support_teams_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.support_teams: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.tps
CREATE TABLE IF NOT EXISTS `tps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number_of_tps` int DEFAULT NULL,
  `tps_information` text COLLATE utf8mb4_unicode_ci,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tps_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `tps_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `tps_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `tps_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.tps: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `foto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `group_id`, `foto`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'administrator', 'rhianjuliansyah4639@gmail.com', '2022-03-01 08:30:46', '$2y$10$Rc.eCud5IYgaJAeFIaeT2OQM9L4MiqdVkV..p1wbQvnPxxG6L67my', NULL, NULL, NULL, 1, '1677655544.jpeg', 1, '2021-04-05 06:20:00', '2023-03-01 07:26:01'),
	(504, 'operator', 'euis.nurhiliya@gmail.com', '2022-03-08 02:35:23', '$2y$10$.erEA.tdr.mEhDnbFxAmrOuFbKWT14FRBP11S6Llg3ccduuhFF6Mm', NULL, NULL, 'vildBBUh8MqWThjDBU2B4tFTc8TW8gdmtFgm42B2Y29SXf9T8r81cKsMn2bG', 2, NULL, 1, '2022-03-08 02:32:03', '2023-03-01 07:30:19'),
	(506, 'ian', 'rhianjuliansyah@gmail.com', '2023-03-01 08:28:34', '$2y$10$muJLDVjz3ylXUZBjEKDjW.AlBQkW.1IXWYSKVFDS7O3fqx.6yiFW6', NULL, NULL, NULL, 2, NULL, 1, '2023-03-01 08:26:46', '2023-03-01 08:26:46');

-- Dumping structure for table db_pilcaleg.village_districts
CREATE TABLE IF NOT EXISTS `village_districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `village_districts_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `village_districts_subdistricts_id_foreign` (`subdistricts_id`),
  CONSTRAINT `village_districts_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.village_districts: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.volunteers
CREATE TABLE IF NOT EXISTS `volunteers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `volunteers_id_number` bigint DEFAULT NULL,
  `volunteers_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_place_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_date_of_birth` date DEFAULT NULL,
  `volunteers_gender` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_address` text COLLATE utf8mb4_unicode_ci,
  `volunteers_rt` int DEFAULT NULL,
  `volunteers_rw` int DEFAULT NULL,
  `volunteers_cellphone` bigint DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volunteers_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `volunteers_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `volunteers_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `volunteers_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.volunteers: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

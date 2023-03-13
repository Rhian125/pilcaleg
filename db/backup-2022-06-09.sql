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
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.activity_log: ~257 rows (approximately)
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
	(85, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-01 17:40:13', '2023-03-01 17:40:13'),
	(86, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-02 08:36:56', '2023-03-02 08:36:56'),
	(87, 'default', 'Tambah Data Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-02 08:42:37', '2023-03-02 08:42:37'),
	(88, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-02 08:44:06', '2023-03-02 08:44:06'),
	(89, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 12:34:13', '2023-03-03 12:34:13'),
	(90, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:48:18', '2023-03-03 13:48:18'),
	(91, 'default', 'Tambah Data Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:52:59', '2023-03-03 13:52:59'),
	(92, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:54:00', '2023-03-03 13:54:00'),
	(93, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:55:16', '2023-03-03 13:55:16'),
	(94, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:55:36', '2023-03-03 13:55:36'),
	(95, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 13:57:23', '2023-03-03 13:57:23'),
	(96, 'default', 'Hapus Data Kecamatan dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:08:46', '2023-03-03 14:08:46'),
	(97, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:08:51', '2023-03-03 14:08:51'),
	(98, 'default', 'Ubah Data Kecamatan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:12:56', '2023-03-03 14:12:56'),
	(99, 'default', 'Hapus Data Kecamatan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:13:04', '2023-03-03 14:13:04'),
	(100, 'default', 'Hapus Data Menu dengan ID = 24', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:15:24', '2023-03-03 14:15:24'),
	(101, 'default', 'Hapus Data Menu dengan ID = 25', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:15:27', '2023-03-03 14:15:27'),
	(102, 'default', 'Hapus Data Menu dengan ID = 26', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:15:30', '2023-03-03 14:15:30'),
	(103, 'default', 'Hapus Data Menu dengan ID = 27', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:15:33', '2023-03-03 14:15:33'),
	(104, 'default', 'Hapus Data Menu dengan ID = 28', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:15:35', '2023-03-03 14:15:35'),
	(105, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:19:52', '2023-03-03 14:19:52'),
	(106, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:19:56', '2023-03-03 14:19:56'),
	(107, 'default', 'Ubah Data Kecamatan dengan ID = 4', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:20:38', '2023-03-03 14:20:38'),
	(108, 'default', 'Ubah Data Kecamatan dengan ID = 4', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:20:46', '2023-03-03 14:20:46'),
	(109, 'default', 'Hapus Data User dengan ID = 504', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:59:19', '2023-03-03 14:59:19'),
	(110, 'default', 'Ubah Data User dengan ID = 506', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:59:30', '2023-03-03 14:59:30'),
	(111, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 14:59:34', '2023-03-03 14:59:34'),
	(112, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:00:06', '2023-03-03 15:00:06'),
	(113, 'default', 'Ubah Data User dengan ID = 506', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:00:25', '2023-03-03 15:00:25'),
	(114, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:00:31', '2023-03-03 15:00:31'),
	(115, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-03 15:00:35', '2023-03-03 15:00:35'),
	(116, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 506, '[]', NULL, '2023-03-03 15:01:02', '2023-03-03 15:01:02'),
	(117, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:01:05', '2023-03-03 15:01:05'),
	(118, 'default', 'Tambah Data Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:01:37', '2023-03-03 15:01:37'),
	(119, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:07:51', '2023-03-03 15:07:51'),
	(120, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:08:54', '2023-03-03 15:08:54'),
	(121, 'default', 'Hapus Data User dengan ID = 508', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:20:37', '2023-03-03 15:20:37'),
	(122, 'default', 'Hapus Data User dengan ID = 507', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:20:41', '2023-03-03 15:20:41'),
	(123, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:21:21', '2023-03-03 15:21:21'),
	(124, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-03 15:24:11', '2023-03-03 15:24:11'),
	(125, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:00:08', '2023-03-04 00:00:08'),
	(126, 'default', 'Hapus Data Kelurahan dengan ID = 4', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:39:30', '2023-03-04 00:39:30'),
	(127, 'default', 'Hapus Data Kelurahan dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:39:34', '2023-03-04 00:39:34'),
	(128, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:42:40', '2023-03-04 00:42:40'),
	(129, 'default', 'Tambah Data Kecamatan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:42:46', '2023-03-04 00:42:46'),
	(130, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:53:03', '2023-03-04 00:53:03'),
	(131, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 00:59:20', '2023-03-04 00:59:20'),
	(132, 'default', 'Ubah Data Kelurahan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:21:24', '2023-03-04 01:21:24'),
	(133, 'default', 'Ubah Data Kelurahan dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:22:01', '2023-03-04 01:22:01'),
	(134, 'default', 'Hapus Data Sub Menu dengan ID = 24', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:22:52', '2023-03-04 01:22:52'),
	(135, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:23:27', '2023-03-04 01:23:27'),
	(136, 'default', 'Tambah Data Sub Menu', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:23:51', '2023-03-04 01:23:51'),
	(137, 'default', 'Ubah Data Sub Menu Akses dengan ID = 50', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:24:24', '2023-03-04 01:24:24'),
	(138, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:24:38', '2023-03-04 01:24:38'),
	(139, 'default', 'Hapus Data Sub Menu Akses dengan ID = 55', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:24:56', '2023-03-04 01:24:56'),
	(140, 'default', 'Ubah Data Sub Menu dengan ID = 25', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:25:10', '2023-03-04 01:25:10'),
	(141, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:25:51', '2023-03-04 01:25:51'),
	(142, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:26:05', '2023-03-04 01:26:05'),
	(143, 'default', 'Hapus Data Kelurahan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:28:02', '2023-03-04 01:28:02'),
	(144, 'default', 'Hapus Data Kelurahan dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:28:06', '2023-03-04 01:28:06'),
	(145, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:30:34', '2023-03-04 01:30:34'),
	(146, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:30:56', '2023-03-04 01:30:56'),
	(147, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:31:17', '2023-03-04 01:31:17'),
	(148, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:31:36', '2023-03-04 01:31:36'),
	(149, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:32:08', '2023-03-04 01:32:08'),
	(150, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:32:25', '2023-03-04 01:32:25'),
	(151, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:32:44', '2023-03-04 01:32:44'),
	(152, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:33:02', '2023-03-04 01:33:02'),
	(153, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:33:19', '2023-03-04 01:33:19'),
	(154, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:33:42', '2023-03-04 01:33:42'),
	(155, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:33:59', '2023-03-04 01:33:59'),
	(156, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:34:13', '2023-03-04 01:34:13'),
	(157, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:34:30', '2023-03-04 01:34:30'),
	(158, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:34:49', '2023-03-04 01:34:49'),
	(159, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:35:03', '2023-03-04 01:35:03'),
	(160, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:35:19', '2023-03-04 01:35:19'),
	(161, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:35:37', '2023-03-04 01:35:37'),
	(162, 'default', 'Tambah Data Kelurahan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:35:54', '2023-03-04 01:35:54'),
	(163, 'default', 'Ubah Data Sub Menu dengan ID = 25', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:37:51', '2023-03-04 01:37:51'),
	(164, 'default', 'Ubah Data Sub Menu dengan ID = 26', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:37:59', '2023-03-04 01:37:59'),
	(165, 'default', 'Ubah Data Menu dengan ID = 22', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 01:38:55', '2023-03-04 01:38:55'),
	(166, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 11:02:49', '2023-03-04 11:02:49'),
	(167, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 16:00:47', '2023-03-04 16:00:47'),
	(168, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 17:37:20', '2023-03-04 17:37:20'),
	(169, 'default', 'Tambah Data User', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-04 20:35:32', '2023-03-04 20:35:32'),
	(170, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 02:33:19', '2023-03-05 02:33:19'),
	(171, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 08:35:51', '2023-03-05 08:35:51'),
	(172, 'default', 'Tambah Data TPS', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 08:41:14', '2023-03-05 08:41:14'),
	(173, 'default', 'Ubah Data TPS dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 10:46:27', '2023-03-05 10:46:27'),
	(174, 'default', 'Ubah Data TPS dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 10:49:26', '2023-03-05 10:49:26'),
	(175, 'default', 'Ubah Data TPS dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-05 10:49:47', '2023-03-05 10:49:47'),
	(176, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 03:18:27', '2023-03-06 03:18:27'),
	(177, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 13:50:58', '2023-03-06 13:50:58'),
	(178, 'default', 'Tambah Data DPT', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:11:41', '2023-03-06 16:11:41'),
	(179, 'default', 'Hapus Data Kelurahan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:14:38', '2023-03-06 16:14:38'),
	(180, 'default', 'Hapus Data Kelurahan dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:14:44', '2023-03-06 16:14:44'),
	(181, 'default', 'Tambah Data DPT', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:14:53', '2023-03-06 16:14:53'),
	(182, 'default', 'Ubah Data DPT dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:23:14', '2023-03-06 16:23:14'),
	(183, 'default', 'Ubah Data DPT dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:23:52', '2023-03-06 16:23:52'),
	(184, 'default', 'Hapus Data TPS dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:25:15', '2023-03-06 16:25:15'),
	(185, 'default', 'Hapus Data Kelurahan dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 16:25:51', '2023-03-06 16:25:51'),
	(186, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-06 17:00:50', '2023-03-06 17:00:50'),
	(187, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:20:47', '2023-03-07 14:20:47'),
	(188, 'default', 'Hapus Data Sub Menu dengan ID = 26', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:21:11', '2023-03-07 14:21:11'),
	(189, 'default', 'Ubah Data Sub Menu dengan ID = 25', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:21:33', '2023-03-07 14:21:33'),
	(190, 'default', 'Tambah Data RT/RW', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:46:26', '2023-03-07 14:46:26'),
	(191, 'default', 'Hapus Data RT/RW dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:48:08', '2023-03-07 14:48:08'),
	(192, 'default', 'Tambah Data RT/RW', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:48:18', '2023-03-07 14:48:18'),
	(193, 'default', 'Tambah Data RT/RW', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:48:44', '2023-03-07 14:48:44'),
	(194, 'default', 'Ubah Data RT/RW dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:55:19', '2023-03-07 14:55:19'),
	(195, 'default', 'Hapus Data RT/RW dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:55:28', '2023-03-07 14:55:28'),
	(196, 'default', 'Hapus Data RT/RW dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:55:32', '2023-03-07 14:55:32'),
	(197, 'default', 'Tambah Data RT/RW', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 14:56:01', '2023-03-07 14:56:01'),
	(198, 'default', 'Ubah Data Menu dengan ID = 20', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 15:10:56', '2023-03-07 15:10:56'),
	(199, 'default', 'Ubah Data Menu dengan ID = 22', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 15:11:05', '2023-03-07 15:11:05'),
	(200, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-07 15:32:23', '2023-03-07 15:32:23'),
	(201, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 03:55:05', '2023-03-08 03:55:05'),
	(202, 'default', 'Tambah Data TPS', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 03:58:29', '2023-03-08 03:58:29'),
	(203, 'default', 'Ubah Data TPS dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 03:59:43', '2023-03-08 03:59:43'),
	(204, 'default', 'Tambah Data DPT', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:00:34', '2023-03-08 04:00:34'),
	(205, 'default', 'Tambah Data TPS', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:10:11', '2023-03-08 04:10:11'),
	(206, 'default', 'Ubah Data TPS dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:11:21', '2023-03-08 04:11:21'),
	(207, 'default', 'Tambah Data DPT', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:12:46', '2023-03-08 04:12:46'),
	(208, 'default', 'Hapus Data Kelurahan dengan ID = 4', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:12:57', '2023-03-08 04:12:57'),
	(209, 'default', 'Ubah Data DPT dengan ID = 5', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:13:56', '2023-03-08 04:13:56'),
	(210, 'default', 'Tambah Data RT/RW', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:14:58', '2023-03-08 04:14:58'),
	(211, 'default', 'Ubah Data RT/RW dengan ID = 5', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 04:15:37', '2023-03-08 04:15:37'),
	(212, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 15:29:41', '2023-03-08 15:29:41'),
	(213, 'default', 'Tambah Data Sub Menu Akses', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 15:30:21', '2023-03-08 15:30:21'),
	(214, 'default', 'Ubah Data Sub Menu Akses dengan ID = 52', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-08 15:30:35', '2023-03-08 15:30:35'),
	(215, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 02:56:36', '2023-03-10 02:56:36'),
	(216, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 02:58:04', '2023-03-10 02:58:04'),
	(217, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 02:58:09', '2023-03-10 02:58:09'),
	(218, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 03:27:45', '2023-03-10 03:27:45'),
	(219, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 03:28:24', '2023-03-10 03:28:24'),
	(220, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 03:28:30', '2023-03-10 03:28:30'),
	(221, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 04:54:11', '2023-03-10 04:54:11'),
	(222, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 04:54:53', '2023-03-10 04:54:53'),
	(223, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 04:55:10', '2023-03-10 04:55:10'),
	(224, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 05:06:08', '2023-03-10 05:06:08'),
	(225, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 05:10:16', '2023-03-10 05:10:16'),
	(226, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 05:36:03', '2023-03-10 05:36:03'),
	(227, 'default', 'Log Out', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 05:36:10', '2023-03-10 05:36:10'),
	(228, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 10:34:03', '2023-03-10 10:34:03'),
	(229, 'default', 'Ubah Data Menu dengan ID = 20', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 10:35:12', '2023-03-10 10:35:12'),
	(230, 'default', 'Ubah Data Pengaturan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 11:44:50', '2023-03-10 11:44:50'),
	(231, 'default', 'Ubah Data Profil dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 11:45:04', '2023-03-10 11:45:04'),
	(232, 'default', 'Ubah Data Profil dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 11:45:31', '2023-03-10 11:45:31'),
	(233, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-10 11:45:37', '2023-03-10 11:45:37'),
	(234, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 05:01:57', '2023-03-12 05:01:57'),
	(235, 'default', 'Tambah Data Relawan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 06:16:06', '2023-03-12 06:16:06'),
	(236, 'default', 'Hapus Data Relawan dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 06:41:49', '2023-03-12 06:41:49'),
	(237, 'default', 'Tambah Data Relawan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 06:49:01', '2023-03-12 06:49:01'),
	(238, 'default', 'Hapus Data Relawan dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 06:50:41', '2023-03-12 06:50:41'),
	(239, 'default', 'Tambah Data Relawan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 06:51:06', '2023-03-12 06:51:06'),
	(240, 'default', 'Ubah Data Relawan dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 07:42:21', '2023-03-12 07:42:21'),
	(241, 'default', 'Hapus Data Relawan dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 07:42:30', '2023-03-12 07:42:30'),
	(242, 'default', 'Tambah Data Relawan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 08:17:41', '2023-03-12 08:17:41'),
	(243, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 10:47:18', '2023-03-12 10:47:18'),
	(244, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 10:47:37', '2023-03-12 10:47:37'),
	(245, 'default', 'Tambah Data Relawan', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-12 10:56:36', '2023-03-12 10:56:36'),
	(246, 'default', 'Login', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 08:35:21', '2023-03-13 08:35:21'),
	(247, 'default', 'Tambah Data Pendukung', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 08:53:44', '2023-03-13 08:53:44'),
	(248, 'default', 'Hapus Data Pendukung dengan ID = 1', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 08:58:02', '2023-03-13 08:58:02'),
	(249, 'default', 'Tambah Data Pendukung', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 08:58:55', '2023-03-13 08:58:55'),
	(250, 'default', 'Hapus Data Pendukung dengan ID = 2', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 08:59:41', '2023-03-13 08:59:41'),
	(251, 'default', 'Tambah Data Pendukung', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:00:12', '2023-03-13 09:00:12'),
	(252, 'default', 'Hapus Data Pendukung dengan ID = 3', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:01:06', '2023-03-13 09:01:06'),
	(253, 'default', 'Tambah Data Pendukung', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:01:40', '2023-03-13 09:01:40'),
	(254, 'default', 'Hapus Data Pendukung dengan ID = 4', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:05:32', '2023-03-13 09:05:32'),
	(255, 'default', 'Tambah Data Pendukung', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:06:07', '2023-03-13 09:06:07'),
	(256, 'default', 'Ubah Data Pendukung dengan ID = 5', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:08:49', '2023-03-13 09:08:49'),
	(257, 'default', 'Ubah Data Pendukung dengan ID = 5', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2023-03-13 09:09:53', '2023-03-13 09:09:53');

-- Dumping structure for table db_pilcaleg.amount_dpt
CREATE TABLE IF NOT EXISTS `amount_dpt` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount_dpt_male` int DEFAULT NULL,
  `amount_dpt_female` int DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `amount_dpt_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `amount_dpt_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `amount_dpt_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `amount_dpt_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.amount_dpt: ~1 rows (approximately)
INSERT INTO `amount_dpt` (`id`, `amount_dpt_male`, `amount_dpt_female`, `subdistricts_id`, `village_districts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(5, 1235, 1234, 5, 12, 1, '2023-03-08 04:12:46', '2023-03-08 04:13:56');

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
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dumping structure for table db_pilcaleg.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jobs_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.jobs: ~20 rows (approximately)
INSERT INTO `jobs` (`id`, `jobs_name`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Belum/Tidak Bekerja', 1, '2023-03-12 13:43:03', '2023-03-12 13:43:04'),
	(2, 'Mengurus Rumah Tangga', 1, '2023-03-12 13:45:29', '2023-03-12 13:45:30'),
	(3, 'Pelajar/Mahasiswa', 1, '2023-03-12 13:45:42', '2023-03-12 13:45:44'),
	(4, 'Pensiunan', 1, '2023-03-12 13:45:55', '2023-03-12 13:45:56'),
	(5, 'Pegawai Negeri Sipil', 1, '2023-03-12 13:46:07', '2023-03-12 13:46:08'),
	(6, 'Tentara Nasional Indonesia', 1, '2023-03-12 13:46:18', '2023-03-12 13:46:19'),
	(7, 'Kepolisian RI', 1, '2023-03-12 13:47:31', '2023-03-12 13:47:38'),
	(8, 'Perdagangan', 1, '2023-03-12 13:47:32', '2023-03-12 13:47:39'),
	(9, 'Petani/Pekebun', 1, '2023-03-12 13:47:33', '2023-03-12 13:47:40'),
	(10, 'Peternak', 1, '2023-03-12 13:47:33', '2023-03-12 13:47:40'),
	(11, 'Nelayan/Perikanan', 1, '2023-03-12 13:47:34', '2023-03-12 13:47:41'),
	(12, 'Industri', 1, '2023-03-12 13:47:36', '2023-03-12 13:47:42'),
	(13, 'Konstruksi', 1, '2023-03-12 13:47:37', '2023-03-12 13:47:43'),
	(14, 'Transportasi', 1, '2023-03-12 13:48:58', '2023-03-12 13:49:04'),
	(15, 'Karyawan Swasta', 1, '2023-03-12 13:48:59', '2023-03-12 13:49:05'),
	(16, 'Karyawan BUMN', 1, '2023-03-12 13:49:00', '2023-03-12 13:49:06'),
	(17, 'Karyawan BUMD', 1, '2023-03-12 13:49:01', '2023-03-12 13:49:07'),
	(18, 'Karyawan Honorer', 1, '2023-03-12 13:49:01', '2023-03-12 13:49:07'),
	(19, 'Buruh Harian Lepas', 1, '2023-03-12 13:49:02', '2023-03-12 13:49:09'),
	(20, 'Buruh Tani/Perkebunan', 1, '2023-03-12 13:49:03', '2023-02-12 13:49:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.menus: ~6 rows (approximately)
INSERT INTO `menus` (`id`, `menu_name`, `link`, `attribute`, `position`, `desc`, `category`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(4, 'Pengaturan', '#', 'fa fa-cogs', 15, NULL, 1, 1, 1, '2022-01-12 03:05:31', '2022-06-03 03:00:35'),
	(5, 'Log Activity', 'log', 'fa fa-circle-notch', 14, NULL, 2, 1, 1, '2022-01-14 09:59:00', '2022-06-03 03:00:56'),
	(20, 'Data Relawan', 'relawan', 'fa fa-user', 2, NULL, 2, 1, 1, '2023-02-28 11:24:56', '2023-03-10 10:35:12'),
	(21, 'Data Master', '#', 'fa fa-list', 1, NULL, 2, 1, 1, '2023-03-01 07:05:00', '2023-03-01 07:05:00'),
	(22, 'Data Pendukung', 'pendukung', 'fa fa-users', 3, NULL, 2, 1, 1, '2023-03-01 07:22:13', '2023-03-07 15:11:05'),
	(23, 'Hasil Pemilihan', 'hasil_pemilihan', 'fa fa-check', 4, NULL, 2, 1, 1, '2023-03-02 08:42:37', '2023-03-02 08:42:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.menu_accesses: ~11 rows (approximately)
INSERT INTO `menu_accesses` (`id`, `group_id`, `menu_id`, `create`, `read`, `update`, `delete`, `print`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 4, 1, 1, 1, 1, 1, 1, '2022-01-13 03:02:25', '2022-01-13 03:02:25'),
	(7, 1, 5, 1, 1, 1, 1, 1, 1, '2022-01-14 09:59:17', '2022-01-14 09:59:17'),
	(18, 3, 4, 1, 1, 0, 1, 1, 1, '2022-03-02 07:56:59', '2022-03-07 03:18:09'),
	(27, 1, 20, 1, 1, 1, 1, 1, 1, '2023-02-28 11:52:57', '2023-02-28 11:52:57'),
	(28, 1, 21, 0, 0, 0, 0, 0, 1, '2023-03-01 07:05:45', '2023-03-01 07:05:45'),
	(29, 1, 22, 1, 1, 1, 1, 1, 1, '2023-03-01 07:22:38', '2023-03-01 07:22:38'),
	(30, 2, 21, 0, 0, 0, 0, 0, 1, '2023-03-01 07:30:51', '2023-03-01 07:30:51'),
	(31, 2, 20, 1, 1, 1, 1, 1, 1, '2023-03-01 07:31:05', '2023-03-01 07:31:05'),
	(32, 2, 22, 1, 1, 1, 1, 1, 1, '2023-03-01 07:31:16', '2023-03-01 07:31:16'),
	(33, 1, 23, 1, 1, 1, 1, 1, 1, '2023-03-02 08:44:06', '2023-03-02 08:44:06'),
	(34, 2, 23, 1, 1, 1, 1, 1, 1, '2023-03-03 15:01:37', '2023-03-03 15:01:37');

-- Dumping structure for table db_pilcaleg.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.migrations: ~31 rows (approximately)
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
	(25, '2023_03_01_234424_create_tps', 13),
	(26, '2023_03_02_152319_create_amount_dpt', 14),
	(27, '2023_03_07_002734_create_rw', 15),
	(28, '2023_03_07_221629_create_rt_rw', 16),
	(29, '2023_03_07_231714_create_witness', 17),
	(30, '2023_03_10_184340_create_volunteer', 18),
	(31, '2023_03_12_133727_create_jobs', 19);

-- Dumping structure for table db_pilcaleg.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.password_resets: ~1 rows (approximately)
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('rhianjuliansyah4639@gmail.com', '$2y$10$HFsMQi7x/quw2uOxhXQHJuoYSFXNEjxCieGxCb2BMGXGYhG1sTBy.', '2023-03-07 15:33:31');

-- Dumping structure for table db_pilcaleg.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table db_pilcaleg.rt_rw
CREATE TABLE IF NOT EXISTS `rt_rw` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rt_number` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw_number` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_rw_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `rt_rw_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `rt_rw_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `rt_rw_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.rt_rw: ~2 rows (approximately)
INSERT INTO `rt_rw` (`id`, `rt_number`, `rw_number`, `subdistricts_id`, `village_districts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(4, '002', '001', 5, 12, 1, '2023-03-07 14:56:01', '2023-03-07 14:56:01'),
	(5, '001', '001', 5, 12, 1, '2023-03-08 04:14:58', '2023-03-08 04:15:37');

-- Dumping structure for table db_pilcaleg.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('i1qBJdU2FnNGrUR4mpL9a71PWxDRsRPlyCL0kKlT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicUMzTzFSNjdjZ0tuQm15YWttWVZJSGVhYUdEc3JmSUZPckdlMHVXNiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL3BpbGNhbGVnLnRlc3QvcmVsYXdhbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vcGlsY2FsZWcudGVzdC9wZW5kdWt1bmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkanBMdkNJRURYQ2RCWjE0cUZIajllZTNHSFJhUDVmdnYzQnJuRE9yTzBmcVFESlRjV0FvUksiO30=', 1678699821),
	('q0yipIWNDZp8FBLDnFKRmQ95s4aMc0zxQvJ3TNzh', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiT2dNaldGeTN2bkJ2cUUyWnlKSEpTblV2Q2czb05aMG5qUWljZzlHYiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL3BpbGNhbGVnLnRlc3QvcmVsYXdhbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vcGlsY2FsZWcudGVzdC9yZWxhd2FuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGpwTHZDSUVEWENkQloxNHFGSGo5ZWUzR0hSYVA1ZnZ2M0JybkRPck8wZnFRREpUY1dBb1JLIjt9', 1678619234);

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

-- Dumping data for table db_pilcaleg.settings: ~1 rows (approximately)
INSERT INTO `settings` (`id`, `application_name`, `short_application_name`, `small_icon`, `large_icon`, `background_login`, `background_sidebar`, `gmaps_key`, `layout`, `skin`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'PILCALEG 2024', 'PILCALEG', '16784486901.png', '16354769112.png', '16784240933.jpg', NULL, 'AIzaSyDk5azS8gZ2aDInOTqyPv7FmB5uBlu55RQ', 'default', 'skin-green-light', 1, '2021-10-29 02:58:27', '2023-03-10 11:44:50');

-- Dumping structure for table db_pilcaleg.subdistricts
CREATE TABLE IF NOT EXISTS `subdistricts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subdistricts_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.subdistricts: ~2 rows (approximately)
INSERT INTO `subdistricts` (`id`, `subdistricts_name`, `user_id`, `created_at`, `updated_at`) VALUES
	(5, 'KENDARI BARAT', 1, '2023-03-04 00:42:40', '2023-03-04 00:42:40'),
	(6, 'KENDARI', 1, '2023-03-04 00:42:46', '2023-03-04 00:42:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.sub_menus: ~8 rows (approximately)
INSERT INTO `sub_menus` (`id`, `menu_id`, `sub_menu_name`, `link`, `attribute`, `position`, `desc`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
	(6, 4, 'User', 'user', 'fa-circle-notch', 1, NULL, 1, 1, '2022-01-12 05:42:20', '2022-01-14 12:01:44'),
	(7, 4, 'Menu', 'menu', 'fa-circle-notch', 3, NULL, 1, 1, '2022-01-12 05:43:01', '2022-01-12 05:43:01'),
	(8, 4, 'Group', 'group', 'fa-circle-notch', 2, NULL, 1, 1, '2022-01-12 05:43:18', '2022-01-12 05:43:18'),
	(20, 21, 'Kecamatan', 'kecamatan', NULL, 1, NULL, 1, 1, '2023-03-01 07:16:40', '2023-03-01 07:16:40'),
	(21, 21, 'Kelurahan', 'kelurahan', NULL, 2, NULL, 1, 1, '2023-03-01 07:16:56', '2023-03-01 07:16:56'),
	(22, 21, 'Data TPS', 'tps', NULL, 3, NULL, 1, 1, '2023-03-01 07:17:19', '2023-03-01 07:18:01'),
	(23, 21, 'Data DPT', 'dpt', NULL, 4, NULL, 1, 1, '2023-03-01 07:17:50', '2023-03-01 07:17:50'),
	(25, 21, 'Data RW/RW', 'rt_rw', NULL, 5, NULL, 1, 1, '2023-03-04 01:23:27', '2023-03-07 14:21:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.sub_menu_accesses: ~11 rows (approximately)
INSERT INTO `sub_menu_accesses` (`id`, `group_id`, `menu_id`, `sub_menu_id`, `create`, `read`, `update`, `delete`, `print`, `user_id`, `created_at`, `updated_at`) VALUES
	(40, 1, 4, 8, 1, 1, 1, 1, 1, 1, '2022-03-08 01:26:36', '2022-03-08 01:26:37'),
	(41, 1, 4, 6, 1, 1, 1, 1, 1, 1, '2022-03-08 01:27:50', '2022-03-08 01:27:50'),
	(42, 1, 4, 7, 1, 1, 1, 1, 1, 1, '2022-03-08 01:28:05', '2022-03-08 01:28:05'),
	(47, 1, 21, 20, 1, 1, 1, 1, 0, 1, '2023-03-01 07:19:38', '2023-03-01 07:19:38'),
	(48, 1, 21, 21, 1, 1, 1, 1, 0, 1, '2023-03-01 07:19:53', '2023-03-01 07:19:53'),
	(49, 1, 21, 22, 1, 1, 1, 1, 0, 1, '2023-03-01 07:20:09', '2023-03-01 07:20:09'),
	(50, 1, 21, 23, 1, 1, 1, 1, 0, 1, '2023-03-01 07:21:03', '2023-03-04 01:24:24'),
	(52, 2, 21, 23, 1, 1, 1, 1, 0, 1, '2023-03-01 07:31:52', '2023-03-08 15:30:35'),
	(53, 2, 21, 22, 1, 1, 1, 1, 0, 1, '2023-03-01 07:32:16', '2023-03-01 07:32:16'),
	(56, 1, 21, 25, 1, 1, 1, 1, 0, 1, '2023-03-04 01:25:51', '2023-03-04 01:25:51'),
	(58, 2, 21, 25, 1, 1, 1, 1, 0, 1, '2023-03-08 15:30:21', '2023-03-08 15:30:21');

-- Dumping structure for table db_pilcaleg.support_teams
CREATE TABLE IF NOT EXISTS `support_teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_teams_family_card_number` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_id_number` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_place_of_birth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_date_of_birth` date DEFAULT NULL,
  `support_teams_gender` enum('Pria','Wanita') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `support_teams_rt` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_rw` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_cellphone` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_teams_must_choose` int DEFAULT NULL,
  `jobs_id` bigint unsigned NOT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_teams_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `support_teams_village_districts_id_foreign` (`village_districts_id`),
  KEY `jobs_id` (`jobs_id`),
  CONSTRAINT `FK_support_teams_jobs` FOREIGN KEY (`jobs_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `support_teams_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `support_teams_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.support_teams: ~1 rows (approximately)
INSERT INTO `support_teams` (`id`, `support_teams_family_card_number`, `support_teams_id_number`, `support_teams_name`, `support_teams_place_of_birth`, `support_teams_date_of_birth`, `support_teams_gender`, `support_teams_address`, `support_teams_rt`, `support_teams_rw`, `support_teams_cellphone`, `support_teams_must_choose`, `jobs_id`, `subdistricts_id`, `village_districts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(5, '7471012104760006', '7471012104760001', 'Rhian Juliansyah M, Amd.Kom', 'Kendari', '1997-07-11', 'Pria', 'Jl. Imam Bonjol No. 06', '001', '001', '082259297054', 5, 15, 5, 12, 1, '2023-03-13 09:06:07', '2023-03-13 09:08:49');

-- Dumping structure for table db_pilcaleg.tps
CREATE TABLE IF NOT EXISTS `tps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number_of_tps` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tps_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tps_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `tps_village_districts_id_foreign` (`village_districts_id`),
  CONSTRAINT `tps_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `tps_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.tps: ~2 rows (approximately)
INSERT INTO `tps` (`id`, `number_of_tps`, `tps_information`, `subdistricts_id`, `village_districts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(2, '01', 'kosong satu', 5, 12, 1, '2023-03-08 03:58:29', '2023-03-08 03:59:43'),
	(3, '01', 'kosong satu', 6, 3, 1, '2023-03-08 04:10:11', '2023-03-08 04:11:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_pilcaleg.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `group_id`, `foto`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'administrator', 'rhianjuliansyah4639@gmail.com', '2022-03-01 08:30:46', '$2y$10$jpLvCIEDXCdBZ14qFHj9ee3GHRaP5fvv3BrnDOrO0fqQDJTcWAoRK', NULL, NULL, NULL, 1, '1678448704.png', 1, '2021-04-05 06:20:00', '2023-03-10 11:45:31'),
	(506, 'operator', 'rhianjuliansyah@gmail.com', '2023-03-01 08:28:34', '$2y$10$oZ5ceHuFRkjuJGxVYEMUiubHzJHenTIlH3RA8MNJlhA3KjrzZTX2y', NULL, NULL, NULL, 2, NULL, 1, '2023-03-01 08:26:46', '2023-03-03 15:00:25'),
	(511, 'ian', 'jom@gmail.com', '2023-03-04 20:35:32', '$2y$10$mvbTEjxZSwJy.vvy3cs6D.GPYLBwpeUFo7vmczSeNjDY3FAUoAHAW', NULL, NULL, NULL, 2, NULL, 1, '2023-03-04 20:35:32', '2023-03-04 20:35:32');

-- Dumping structure for table db_pilcaleg.village_districts
CREATE TABLE IF NOT EXISTS `village_districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `village_districts_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `village_districts_subdistricts_id_foreign` (`subdistricts_id`),
  CONSTRAINT `village_districts_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.village_districts: ~18 rows (approximately)
INSERT INTO `village_districts` (`id`, `village_districts_name`, `subdistricts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(3, 'Gunung Jati', 6, 1, '2023-03-04 01:30:34', '2023-03-04 01:30:34'),
	(4, 'Jati Mekar', 6, 1, '2023-03-04 01:30:56', '2023-03-04 01:30:56'),
	(5, 'Kampungsalo', 6, 1, '2023-03-04 01:31:17', '2023-03-04 01:31:17'),
	(6, 'Kandai', 6, 1, '2023-03-04 01:31:36', '2023-03-04 01:31:36'),
	(7, 'Kendari Caddi', 6, 1, '2023-03-04 01:32:08', '2023-03-04 01:32:08'),
	(8, 'Kassilampe', 6, 1, '2023-03-04 01:32:25', '2023-03-04 01:32:25'),
	(9, 'Mangga Dua', 6, 1, '2023-03-04 01:32:44', '2023-03-04 01:32:44'),
	(10, 'Mata', 6, 1, '2023-03-04 01:33:02', '2023-03-04 01:33:02'),
	(11, 'Purirano', 6, 1, '2023-03-04 01:33:19', '2023-03-04 01:33:19'),
	(12, 'Benu-Benua', 5, 1, '2023-03-04 01:33:42', '2023-03-04 01:33:42'),
	(13, 'Dapu-Dapura', 5, 1, '2023-03-04 01:33:59', '2023-03-04 01:33:59'),
	(14, 'Kemaraya', 5, 1, '2023-03-04 01:34:13', '2023-03-04 01:34:13'),
	(15, 'Lahundape', 5, 1, '2023-03-04 01:34:30', '2023-03-04 01:34:30'),
	(16, 'Punggaloba', 5, 1, '2023-03-04 01:34:49', '2023-03-04 01:34:49'),
	(17, 'Sadoha', 5, 1, '2023-03-04 01:35:03', '2023-03-04 01:35:03'),
	(18, 'Sanua', 5, 1, '2023-03-04 01:35:19', '2023-03-04 01:35:19'),
	(19, 'Tipulu', 5, 1, '2023-03-04 01:35:37', '2023-03-04 01:35:37'),
	(20, 'Watu-Watu', 5, 1, '2023-03-04 01:35:54', '2023-03-04 01:35:54');

-- Dumping structure for table db_pilcaleg.volunteers
CREATE TABLE IF NOT EXISTS `volunteers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `volunteers_id_number` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_place_of_birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_date_of_birth` date DEFAULT NULL,
  `volunteers_gender` enum('Pria','Wanita') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_address` text COLLATE utf8mb4_unicode_ci,
  `volunteers_rt` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_rw` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volunteers_cellphone` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobs_id` bigint unsigned NOT NULL,
  `subdistricts_id` bigint unsigned NOT NULL,
  `village_districts_id` bigint unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volunteers_subdistricts_id_foreign` (`subdistricts_id`),
  KEY `volunteers_village_districts_id_foreign` (`village_districts_id`),
  KEY `jobs_id` (`jobs_id`),
  CONSTRAINT `FK_volunteers_jobs` FOREIGN KEY (`jobs_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `volunteers_subdistricts_id_foreign` FOREIGN KEY (`subdistricts_id`) REFERENCES `subdistricts` (`id`),
  CONSTRAINT `volunteers_village_districts_id_foreign` FOREIGN KEY (`village_districts_id`) REFERENCES `village_districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_pilcaleg.volunteers: ~2 rows (approximately)
INSERT INTO `volunteers` (`id`, `volunteers_id_number`, `volunteers_name`, `volunteers_place_of_birth`, `volunteers_date_of_birth`, `volunteers_gender`, `volunteers_address`, `volunteers_rt`, `volunteers_rw`, `volunteers_cellphone`, `jobs_id`, `subdistricts_id`, `village_districts_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(4, '7471012104760001', 'Rhian Juliansyah M', 'Kendari', '1997-07-11', 'Pria', 'Jl. Imam Bonjol', '001', '001', '082259297054', 16, 5, 19, 1, '2023-03-12 08:17:41', '2023-03-12 08:17:41'),
	(5, '7471012104760002', 'Rhian Juliansyah M', 'Kendari', '1997-07-11', 'Pria', 'Jl. Samratulangi', '002', '005', '082259297054', 13, 5, 13, 1, '2023-03-12 10:56:36', '2023-03-12 10:56:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

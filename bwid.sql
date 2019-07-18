-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bwid.branch
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `lat` double(14,8) DEFAULT NULL,
  `lng` double(14,8) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_city_id_foreign` (`city_id`),
  CONSTRAINT `branch_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.branch: ~8 rows (approximately)
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` (`id`, `city_id`, `lat`, `lng`, `image`, `icon`, `phone`, `fax`, `email`, `created_at`, `updated_at`) VALUES
	(1, 18, NULL, 48.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:26:52', '2018-09-13 15:23:24'),
	(2, 18, NULL, 94.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:37:18', '2018-09-13 15:23:35'),
	(3, 19, NULL, 132.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:37:45', '2018-09-13 15:23:48'),
	(4, 20, NULL, 201.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:38:16', '2018-09-13 15:24:07'),
	(5, 47, NULL, 588.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:39:03', '2018-09-13 15:25:28'),
	(6, 47, NULL, 629.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:39:38', '2018-09-13 15:25:41'),
	(7, 47, NULL, 671.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:39:58', '2018-09-13 15:26:16'),
	(8, 48, NULL, 728.00000000, NULL, NULL, NULL, NULL, NULL, '2018-09-13 13:40:20', '2018-09-13 15:25:59');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- Dumping structure for table bwid.branch_project_categories
CREATE TABLE IF NOT EXISTS `branch_project_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `project_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_project_categories_branch_id_index` (`branch_id`),
  KEY `branch_project_categories_project_category_id_index` (`project_category_id`),
  CONSTRAINT `branch_project_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  CONSTRAINT `branch_project_categories_project_category_id_foreign` FOREIGN KEY (`project_category_id`) REFERENCES `project_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.branch_project_categories: ~17 rows (approximately)
/*!40000 ALTER TABLE `branch_project_categories` DISABLE KEYS */;
INSERT INTO `branch_project_categories` (`id`, `branch_id`, `project_category_id`) VALUES
	(1, 1, 2),
	(6, 1, 3),
	(7, 2, 1),
	(8, 3, 2),
	(9, 3, 1),
	(10, 4, 2),
	(11, 4, 3),
	(12, 5, 2),
	(13, 5, 4),
	(14, 6, 2),
	(15, 6, 4),
	(16, 7, 2),
	(17, 8, 2),
	(18, 8, 1),
	(19, 7, 1),
	(20, 7, 3),
	(21, 7, 4);
/*!40000 ALTER TABLE `branch_project_categories` ENABLE KEYS */;

-- Dumping structure for table bwid.branch_translation
CREATE TABLE IF NOT EXISTS `branch_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_translation_branch_id_locale_unique` (`branch_id`,`locale`),
  CONSTRAINT `branch_translation_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.branch_translation: ~16 rows (approximately)
/*!40000 ALTER TABLE `branch_translation` DISABLE KEYS */;
INSERT INTO `branch_translation` (`id`, `branch_id`, `name`, `open_time`, `address`, `locale`) VALUES
	(1, 1, 'VSIP Bac Ninh IP', NULL, NULL, 'en'),
	(2, 1, 'VSIP Bac Ninh IP', NULL, NULL, 'vi'),
	(3, 2, 'VSIP Bac Ninh 2 IP', NULL, NULL, 'en'),
	(4, 2, 'VSIP Bac Ninh 2 IP', NULL, NULL, 'vi'),
	(5, 3, 'VSIP Hai Duong IP', NULL, NULL, 'en'),
	(6, 3, 'VSIP Hai Duong IP', NULL, NULL, 'vi'),
	(7, 4, 'VSIP Hai Phong IP', NULL, NULL, 'en'),
	(8, 4, 'VSIP Hai Phong IP', NULL, NULL, 'vi'),
	(9, 5, 'Bang Bau IP', NULL, NULL, 'en'),
	(10, 5, 'Bang Bau IP', NULL, NULL, 'vi'),
	(11, 6, 'My Phuoc 3 IP', NULL, NULL, 'en'),
	(12, 6, 'My Phuoc 3 IP', NULL, NULL, 'vi'),
	(13, 7, 'VSIP II IP', NULL, NULL, 'en'),
	(14, 7, 'VSIP II IP', NULL, NULL, 'vi'),
	(15, 8, 'Nhon Trach IP', NULL, NULL, 'en'),
	(16, 8, 'Nhon Trach IP', NULL, NULL, 'vi');
/*!40000 ALTER TABLE `branch_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.brochures
CREATE TABLE IF NOT EXISTS `brochures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_download` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_active_index` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.brochures: ~2 rows (approximately)
/*!40000 ALTER TABLE `brochures` DISABLE KEYS */;
INSERT INTO `brochures` (`id`, `image`, `link_download`, `active`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '/upload/images/Ashley_Greene_DKNY_Campaign_6.png', 'cxvsd', 1, 2, '2018-06-07 13:47:33', '2018-06-13 10:39:12'),
	(11, '/upload/files/dream/img4.jpg', '/upload/files/Pdf/ecy_website_spec%20guide_310518.pdf', 1, 2, '2018-06-13 10:59:07', '2018-06-13 10:59:07');
/*!40000 ALTER TABLE `brochures` ENABLE KEYS */;

-- Dumping structure for table bwid.brochures_translation
CREATE TABLE IF NOT EXISTS `brochures_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brochures_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brochures_translation_brochures_id_locale_unique` (`brochures_id`,`locale`),
  KEY `brochures_translation_locale_index` (`locale`),
  CONSTRAINT `brochures_translation_brochures_id_foreign` FOREIGN KEY (`brochures_id`) REFERENCES `brochures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.brochures_translation: ~4 rows (approximately)
/*!40000 ALTER TABLE `brochures_translation` DISABLE KEYS */;
INSERT INTO `brochures_translation` (`id`, `brochures_id`, `locale`, `title`, `slug`) VALUES
	(1, 1, 'en', 'Mobile applications', 'mobile-applications'),
	(2, 1, 'vi', 'Ứng dụng mobile', 'ung-dung-mobile'),
	(21, 11, 'en', 'Ten  hiển thị', 'ten-hien-thi'),
	(22, 11, 'vi', 'Ten  hiển thị', 'ten-hien-thi');
/*!40000 ALTER TABLE `brochures_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.business
CREATE TABLE IF NOT EXISTS `business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.business: ~0 rows (approximately)
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;

-- Dumping structure for table bwid.business_translation
CREATE TABLE IF NOT EXISTS `business_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_translation_business_id_locale_unique` (`business_id`,`locale`),
  KEY `business_translation_locale_index` (`locale`),
  CONSTRAINT `business_translation_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.business_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `business_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.careers
CREATE TABLE IF NOT EXISTS `careers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `category_id` int(10) unsigned NOT NULL,
  `is_top` tinyint(4) NOT NULL DEFAULT '0',
  `accept_aplly` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `careers_category_id_foreign` (`category_id`),
  KEY `careers_status_index` (`status`),
  KEY `careers_is_top_index` (`is_top`),
  KEY `careers_accept_aplly_index` (`accept_aplly`),
  CONSTRAINT `careers_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `career_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.careers: ~0 rows (approximately)
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;

-- Dumping structure for table bwid.career_apply
CREATE TABLE IF NOT EXISTS `career_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `career_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `attach_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `career_apply_career_id_foreign` (`career_id`),
  CONSTRAINT `career_apply_career_id_foreign` FOREIGN KEY (`career_id`) REFERENCES `careers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_apply: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_apply` ENABLE KEYS */;

-- Dumping structure for table bwid.career_category
CREATE TABLE IF NOT EXISTS `career_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_category` ENABLE KEYS */;

-- Dumping structure for table bwid.career_category_translation
CREATE TABLE IF NOT EXISTS `career_category_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `career_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `career_category_translation_career_category_id_locale_unique` (`career_category_id`,`locale`),
  KEY `career_category_translation_locale_index` (`locale`),
  CONSTRAINT `career_category_translation_career_category_id_foreign` FOREIGN KEY (`career_category_id`) REFERENCES `career_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_category_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_category_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_category_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.career_city
CREATE TABLE IF NOT EXISTS `career_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `career_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `career_city_city_id_foreign` (`city_id`),
  KEY `career_city_career_id_foreign` (`career_id`),
  CONSTRAINT `career_city_career_id_foreign` FOREIGN KEY (`career_id`) REFERENCES `careers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `career_city_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_city: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_city` ENABLE KEYS */;

-- Dumping structure for table bwid.career_degree
CREATE TABLE IF NOT EXISTS `career_degree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_degree: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_degree` ENABLE KEYS */;

-- Dumping structure for table bwid.career_degree_translation
CREATE TABLE IF NOT EXISTS `career_degree_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `career_degree_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `career_degree_translation_career_degree_id_locale_unique` (`career_degree_id`,`locale`),
  KEY `career_degree_translation_locale_index` (`locale`),
  CONSTRAINT `career_degree_translation_career_degree_id_foreign` FOREIGN KEY (`career_degree_id`) REFERENCES `career_degree` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_degree_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_degree_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_degree_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.career_form
CREATE TABLE IF NOT EXISTS `career_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_form: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_form` ENABLE KEYS */;

-- Dumping structure for table bwid.career_level
CREATE TABLE IF NOT EXISTS `career_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_level: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_level` ENABLE KEYS */;

-- Dumping structure for table bwid.career_level_translation
CREATE TABLE IF NOT EXISTS `career_level_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `career_level_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `career_level_translation_career_level_id_locale_unique` (`career_level_id`,`locale`),
  KEY `career_level_translation_locale_index` (`locale`),
  CONSTRAINT `career_level_translation_career_level_id_foreign` FOREIGN KEY (`career_level_id`) REFERENCES `career_level` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_level_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_level_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_level_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.career_translation
CREATE TABLE IF NOT EXISTS `career_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `career_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `career_translation_career_id_locale_unique` (`career_id`,`locale`),
  KEY `career_translation_locale_index` (`locale`),
  CONSTRAINT `career_translation_career_id_foreign` FOREIGN KEY (`career_id`) REFERENCES `careers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.career_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `career_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `career_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.catalogue
CREATE TABLE IF NOT EXISTS `catalogue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(52) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.catalogue: ~0 rows (approximately)
/*!40000 ALTER TABLE `catalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue` ENABLE KEYS */;

-- Dumping structure for table bwid.catalogue_translation
CREATE TABLE IF NOT EXISTS `catalogue_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalogue_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_translation_catalogue_id_locale_unique` (`catalogue_id`,`locale`),
  KEY `catalogue_translation_locale_index` (`locale`),
  CONSTRAINT `catalogue_translation_catalogue_id_foreign` FOREIGN KEY (`catalogue_id`) REFERENCES `catalogue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.catalogue_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `catalogue_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_country_id_foreign` (`country_id`),
  CONSTRAINT `city_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.city: ~63 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `country_id`, `position`) VALUES
	(1, 1, 0),
	(2, 1, 0),
	(3, 1, 0),
	(4, 1, 0),
	(5, 1, 0),
	(6, 1, 0),
	(7, 1, 0),
	(8, 1, 0),
	(9, 1, 0),
	(10, 1, 0),
	(11, 1, 0),
	(12, 1, 0),
	(13, 1, 0),
	(14, 1, 0),
	(15, 1, 0),
	(16, 1, 0),
	(17, 1, 0),
	(18, 1, 0),
	(19, 1, 0),
	(20, 1, 0),
	(21, 1, 0),
	(22, 1, 0),
	(23, 1, 0),
	(24, 1, 0),
	(25, 1, 0),
	(26, 1, 0),
	(27, 1, 0),
	(28, 1, 0),
	(29, 1, 0),
	(30, 1, 0),
	(31, 1, 0),
	(32, 1, 0),
	(33, 1, 0),
	(34, 1, 0),
	(35, 1, 0),
	(36, 1, 0),
	(37, 1, 0),
	(38, 1, 0),
	(39, 1, 0),
	(40, 1, 0),
	(41, 1, 0),
	(42, 1, 0),
	(43, 1, 0),
	(44, 1, 0),
	(45, 1, 0),
	(46, 1, 0),
	(47, 1, 0),
	(48, 1, 0),
	(49, 1, 0),
	(50, 1, 0),
	(51, 1, 0),
	(52, 1, 0),
	(53, 1, 0),
	(54, 1, 0),
	(55, 1, 0),
	(56, 1, 0),
	(57, 1, 0),
	(58, 1, 0),
	(59, 1, 0),
	(60, 1, 0),
	(61, 1, 0),
	(62, 1, 0),
	(63, 1, 0);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table bwid.city_translation
CREATE TABLE IF NOT EXISTS `city_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_translation_city_id_locale_unique` (`city_id`,`locale`),
  KEY `city_translation_locale_index` (`locale`),
  CONSTRAINT `city_translation_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.city_translation: ~126 rows (approximately)
/*!40000 ALTER TABLE `city_translation` DISABLE KEYS */;
INSERT INTO `city_translation` (`id`, `city_id`, `locale`, `name`) VALUES
	(1, 1, 'vi', 'Hà Nội'),
	(2, 1, 'en', 'Ha Noi'),
	(3, 2, 'vi', 'Hà Giang'),
	(4, 2, 'en', 'Ha Giang'),
	(5, 3, 'vi', 'Cao Bằng'),
	(6, 3, 'en', 'Cao Bang'),
	(7, 4, 'vi', 'Bắc Kạn'),
	(8, 4, 'en', 'Bac Kan'),
	(9, 5, 'vi', 'Tuyên Quang'),
	(10, 5, 'en', 'Tuyen Quang'),
	(11, 6, 'vi', 'Lào Cai'),
	(12, 6, 'en', 'Lao Cai'),
	(13, 7, 'vi', 'Điện Biên'),
	(14, 7, 'en', 'Dien Bien'),
	(15, 8, 'vi', 'Lai Châu'),
	(16, 8, 'en', 'Lai Chau'),
	(17, 9, 'vi', 'Sơn La'),
	(18, 9, 'en', 'Son La'),
	(19, 10, 'vi', 'Yên Bái'),
	(20, 10, 'en', 'Yen Bai'),
	(21, 11, 'vi', 'Hòa Bình'),
	(22, 11, 'en', 'Hoa Binh'),
	(23, 12, 'vi', 'Thái Nguyên'),
	(24, 12, 'en', 'Thai Nguyen'),
	(25, 13, 'vi', 'Lạng Sơn'),
	(26, 13, 'en', 'Lang Son'),
	(27, 14, 'vi', 'Quảng Ninh'),
	(28, 14, 'en', 'Quang Ninh'),
	(29, 15, 'vi', 'Bắc Giang'),
	(30, 15, 'en', 'Bac Giang'),
	(31, 16, 'vi', 'Phú Thọ'),
	(32, 16, 'en', 'Phu Tho'),
	(33, 17, 'vi', 'Vĩnh Phúc'),
	(34, 17, 'en', 'Vinh Phuc'),
	(35, 18, 'vi', 'Bắc Ninh'),
	(36, 18, 'en', 'Bac Ninh'),
	(37, 19, 'vi', 'Hải Dương'),
	(38, 19, 'en', 'Hai Duong'),
	(39, 20, 'vi', 'Hải Phòng'),
	(40, 20, 'en', 'Hai Phong'),
	(41, 21, 'vi', 'Hưng Yên'),
	(42, 21, 'en', 'Hung Yen'),
	(43, 22, 'vi', 'Thái Bình'),
	(44, 22, 'en', 'Thai Binh'),
	(45, 23, 'vi', 'Hà Nam'),
	(46, 23, 'en', 'Ha Nam'),
	(47, 24, 'vi', 'Nam Định'),
	(48, 24, 'en', 'Nam Dinh'),
	(49, 25, 'vi', 'Ninh Bình'),
	(50, 25, 'en', 'Ninh Binh'),
	(51, 26, 'vi', 'Thanh Hóa'),
	(52, 26, 'en', 'Thanh Hoa'),
	(53, 27, 'vi', 'Nghệ An'),
	(54, 27, 'en', 'Nghe An'),
	(55, 28, 'vi', 'Hà Tĩnh'),
	(56, 28, 'en', 'Ha Tinh'),
	(57, 29, 'vi', 'Quảng Bình'),
	(58, 29, 'en', 'Quang Binh'),
	(59, 30, 'vi', 'Quảng Trị'),
	(60, 30, 'en', 'Quang Tri'),
	(61, 31, 'vi', 'Thừa Thiên Huế'),
	(62, 31, 'en', 'Thua Thien Hue'),
	(63, 32, 'vi', 'Đà Nẵng'),
	(64, 32, 'en', 'Da Nang'),
	(65, 33, 'vi', 'Quảng Nam'),
	(66, 33, 'en', 'Quang Nam'),
	(67, 34, 'vi', 'Quảng Ngãi'),
	(68, 34, 'en', 'Quang Ngai'),
	(69, 35, 'vi', 'Bình Định'),
	(70, 35, 'en', 'Binh Dinh'),
	(71, 36, 'vi', 'Phú Yên'),
	(72, 36, 'en', 'Phu Yen'),
	(73, 37, 'vi', 'Khánh Hòa'),
	(74, 37, 'en', 'Khanh Hoa'),
	(75, 38, 'vi', 'Ninh Thuận'),
	(76, 38, 'en', 'Ninh Thuan'),
	(77, 39, 'vi', 'Bình Thuận'),
	(78, 39, 'en', 'Binh Thuan'),
	(79, 40, 'vi', 'Kon Tum'),
	(80, 40, 'en', 'Kon Tum'),
	(81, 41, 'vi', 'Gia Lai'),
	(82, 41, 'en', 'Gia Lai'),
	(83, 42, 'vi', 'Đắk Lắk'),
	(84, 42, 'en', 'Dak Lak'),
	(85, 43, 'vi', 'Đắk Nông'),
	(86, 43, 'en', 'Dak Nong'),
	(87, 44, 'vi', 'Lâm Đồng'),
	(88, 44, 'en', 'Lam Dong'),
	(89, 45, 'vi', 'Bình Phước'),
	(90, 45, 'en', 'Binh Phuoc'),
	(91, 46, 'vi', 'Tây Ninh'),
	(92, 46, 'en', 'Tay Ninh'),
	(93, 47, 'vi', 'Bình Dương'),
	(94, 47, 'en', 'Binh Duong'),
	(95, 48, 'vi', 'Đồng Nai'),
	(96, 48, 'en', 'Dong Nai'),
	(97, 49, 'vi', 'Bà Rịa - Vũng Tàu'),
	(98, 49, 'en', 'Ba Ria - Vung Tau'),
	(99, 50, 'vi', 'Hồ Chí Minh'),
	(100, 50, 'en', 'Ho Chi Minh'),
	(101, 51, 'vi', 'Long An'),
	(102, 51, 'en', 'Long An'),
	(103, 52, 'vi', 'Tiền Giang'),
	(104, 52, 'en', 'Tien Giang'),
	(105, 53, 'vi', 'Bến Tre'),
	(106, 53, 'en', 'Ben Tre'),
	(107, 54, 'vi', 'Trà Vinh'),
	(108, 54, 'en', 'Tra Vinh'),
	(109, 55, 'vi', 'Vĩnh Long'),
	(110, 55, 'en', 'Vinh Long'),
	(111, 56, 'vi', 'Đồng Tháp'),
	(112, 56, 'en', 'Dong Thap'),
	(113, 57, 'vi', 'An Giang'),
	(114, 57, 'en', 'An Giang'),
	(115, 58, 'vi', 'Kiên Giang'),
	(116, 58, 'en', 'Kien Giang'),
	(117, 59, 'vi', 'Cần Thơ'),
	(118, 59, 'en', 'Can Tho'),
	(119, 60, 'vi', 'Hậu Giang'),
	(120, 60, 'en', 'Hau Giang'),
	(121, 61, 'vi', 'Sóc Trăng'),
	(122, 61, 'en', 'Soc Trang'),
	(123, 62, 'vi', 'Bạc Liêu'),
	(124, 62, 'en', 'Bac Lieu'),
	(125, 63, 'vi', 'Cà Mau'),
	(126, 63, 'en', 'Ca Mau');
/*!40000 ALTER TABLE `city_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_profile` text COLLATE utf8_unicode_ci,
  `information` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.contacts: ~1 rows (approximately)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `subject`, `name`, `phone`, `email`, `company`, `company_profile`, `information`, `created_at`, `updated_at`) VALUES
	(1, 'Media Inquiry', 'Nguyễn Văn Hiền', '1649223010', 'namnguyen12041994@gmail.com', 'Chưa có', NULL, NULL, '2018-09-12 16:20:31', '2018-09-12 16:20:31');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Dumping structure for table bwid.country
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `country_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.country: ~246 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id`, `code`, `position`) VALUES
	(1, 'vn', 0),
	(2, 'af', 1),
	(3, 'al', 2),
	(4, 'dz', 3),
	(5, 'ds', 4),
	(6, 'ad', 5),
	(7, 'ao', 6),
	(8, 'ai', 7),
	(9, 'aq', 8),
	(10, 'ag', 9),
	(11, 'ar', 10),
	(12, 'am', 11),
	(13, 'aw', 12),
	(14, 'au', 13),
	(15, 'at', 14),
	(16, 'az', 15),
	(17, 'bs', 16),
	(18, 'bh', 17),
	(19, 'bd', 18),
	(20, 'bb', 19),
	(21, 'by', 20),
	(22, 'be', 21),
	(23, 'bz', 22),
	(24, 'bj', 23),
	(25, 'bm', 24),
	(26, 'bt', 25),
	(27, 'bo', 26),
	(28, 'ba', 27),
	(29, 'bw', 28),
	(30, 'bv', 29),
	(31, 'br', 30),
	(32, 'io', 31),
	(33, 'bn', 32),
	(34, 'bg', 33),
	(35, 'bf', 34),
	(36, 'bi', 35),
	(37, 'kh', 36),
	(38, 'cm', 37),
	(39, 'ca', 38),
	(40, 'cv', 39),
	(41, 'ky', 40),
	(42, 'cf', 41),
	(43, 'td', 42),
	(44, 'cl', 43),
	(45, 'cn', 44),
	(46, 'cx', 45),
	(47, 'cc', 46),
	(48, 'co', 47),
	(49, 'km', 48),
	(50, 'cg', 49),
	(51, 'ck', 50),
	(52, 'cr', 51),
	(53, 'hr', 52),
	(54, 'cu', 53),
	(55, 'cy', 54),
	(56, 'cz', 55),
	(57, 'dk', 56),
	(58, 'dj', 57),
	(59, 'dm', 58),
	(60, 'do', 59),
	(61, 'tp', 60),
	(62, 'ec', 61),
	(63, 'eg', 62),
	(64, 'sv', 63),
	(65, 'gq', 64),
	(66, 'er', 65),
	(67, 'ee', 66),
	(68, 'et', 67),
	(69, 'fk', 68),
	(70, 'fo', 69),
	(71, 'fj', 70),
	(72, 'fi', 71),
	(73, 'fr', 72),
	(74, 'fx', 73),
	(75, 'gf', 74),
	(76, 'pf', 75),
	(77, 'tf', 76),
	(78, 'ga', 77),
	(79, 'gm', 78),
	(80, 'ge', 79),
	(81, 'de', 80),
	(82, 'gh', 81),
	(83, 'gi', 82),
	(84, 'gk', 83),
	(85, 'gr', 84),
	(86, 'gl', 85),
	(87, 'gd', 86),
	(88, 'gp', 87),
	(89, 'gu', 88),
	(90, 'gt', 89),
	(91, 'gn', 90),
	(92, 'gw', 91),
	(93, 'gy', 92),
	(94, 'ht', 93),
	(95, 'hm', 94),
	(96, 'hn', 95),
	(97, 'hk', 96),
	(98, 'hu', 97),
	(99, 'is', 98),
	(100, 'in', 99),
	(101, 'im', 100),
	(102, 'id', 101),
	(103, 'ir', 102),
	(104, 'iq', 103),
	(105, 'ie', 104),
	(106, 'il', 105),
	(107, 'it', 106),
	(108, 'ci', 107),
	(109, 'je', 108),
	(110, 'jm', 109),
	(111, 'jp', 110),
	(112, 'jo', 111),
	(113, 'kz', 112),
	(114, 'ke', 113),
	(115, 'ki', 114),
	(116, 'kp', 115),
	(117, 'kr', 116),
	(118, 'xk', 117),
	(119, 'kw', 118),
	(120, 'kg', 119),
	(121, 'la', 120),
	(122, 'lv', 121),
	(123, 'lb', 122),
	(124, 'ls', 123),
	(125, 'lr', 124),
	(126, 'ly', 125),
	(127, 'li', 126),
	(128, 'lt', 127),
	(129, 'lu', 128),
	(130, 'mo', 129),
	(131, 'mk', 130),
	(132, 'mg', 131),
	(133, 'mw', 132),
	(134, 'my', 133),
	(135, 'mv', 134),
	(136, 'ml', 135),
	(137, 'mt', 136),
	(138, 'mh', 137),
	(139, 'mq', 138),
	(140, 'mr', 139),
	(141, 'mu', 140),
	(142, 'ty', 141),
	(143, 'mx', 142),
	(144, 'fm', 143),
	(145, 'md', 144),
	(146, 'mc', 145),
	(147, 'mn', 146),
	(148, 'me', 147),
	(149, 'ms', 148),
	(150, 'ma', 149),
	(151, 'mz', 150),
	(152, 'mm', 151),
	(153, 'na', 152),
	(154, 'nr', 153),
	(155, 'np', 154),
	(156, 'nl', 155),
	(157, 'an', 156),
	(158, 'nc', 157),
	(159, 'nz', 158),
	(160, 'ni', 159),
	(161, 'ne', 160),
	(162, 'ng', 161),
	(163, 'nu', 162),
	(164, 'nf', 163),
	(165, 'mp', 164),
	(166, 'no', 165),
	(167, 'om', 166),
	(168, 'pk', 167),
	(169, 'pw', 168),
	(170, 'ps', 169),
	(171, 'pa', 170),
	(172, 'pg', 171),
	(173, 'py', 172),
	(174, 'pe', 173),
	(175, 'ph', 174),
	(176, 'pn', 175),
	(177, 'pl', 176),
	(178, 'pt', 177),
	(179, 'pr', 178),
	(180, 'qa', 179),
	(181, 're', 180),
	(182, 'ro', 181),
	(183, 'ru', 182),
	(184, 'rw', 183),
	(185, 'kn', 184),
	(186, 'lc', 185),
	(187, 'vc', 186),
	(188, 'ws', 187),
	(189, 'sm', 188),
	(190, 'st', 189),
	(191, 'sa', 190),
	(192, 'sn', 191),
	(193, 'rs', 192),
	(194, 'sc', 193),
	(195, 'sl', 194),
	(196, 'sg', 195),
	(197, 'sk', 196),
	(198, 'si', 197),
	(199, 'sb', 198),
	(200, 'so', 199),
	(201, 'za', 200),
	(202, 'ss', 201),
	(203, 'gs', 202),
	(204, 'es', 203),
	(205, 'lk', 204),
	(206, 'sh', 205),
	(207, 'pm', 206),
	(208, 'sd', 207),
	(209, 'sr', 208),
	(210, 'sj', 209),
	(211, 'sz', 210),
	(212, 'se', 211),
	(213, 'ch', 212),
	(214, 'sy', 213),
	(215, 'tw', 214),
	(216, 'tj', 215),
	(217, 'tz', 216),
	(218, 'th', 217),
	(219, 'tg', 218),
	(220, 'tk', 219),
	(221, 'to', 220),
	(222, 'tt', 221),
	(223, 'tn', 222),
	(224, 'tr', 223),
	(225, 'tm', 224),
	(226, 'tc', 225),
	(227, 'tv', 226),
	(228, 'ug', 227),
	(229, 'ua', 228),
	(230, 'ae', 229),
	(231, 'gb', 230),
	(232, 'us', 231),
	(233, 'um', 232),
	(234, 'uy', 233),
	(235, 'uz', 234),
	(236, 'vu', 235),
	(237, 'va', 236),
	(238, 've', 237),
	(239, 'vg', 238),
	(240, 'vi', 239),
	(241, 'wf', 240),
	(242, 'eh', 241),
	(243, 'ye', 242),
	(244, 'zr', 243),
	(245, 'zm', 244),
	(246, 'zw', 245);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dumping structure for table bwid.country_translation
CREATE TABLE IF NOT EXISTS `country_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_translation_country_id_locale_unique` (`country_id`,`locale`),
  KEY `country_translation_locale_index` (`locale`),
  CONSTRAINT `country_translation_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.country_translation: ~984 rows (approximately)
/*!40000 ALTER TABLE `country_translation` DISABLE KEYS */;
INSERT INTO `country_translation` (`id`, `country_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'Vietnam'),
	(2, 1, 'vi', 'Việt Nam'),
	(3, 1, 'ja', 'Vietnam'),
	(4, 1, 'ko', 'Vietnam'),
	(5, 2, 'en', 'Afghanistan'),
	(6, 2, 'vi', 'Afghanistan'),
	(7, 2, 'ja', 'Afghanistan'),
	(8, 2, 'ko', 'Afghanistan'),
	(9, 3, 'en', 'Albania'),
	(10, 3, 'vi', 'Albania'),
	(11, 3, 'ja', 'Albania'),
	(12, 3, 'ko', 'Albania'),
	(13, 4, 'en', 'Algeria'),
	(14, 4, 'vi', 'Algeria'),
	(15, 4, 'ja', 'Algeria'),
	(16, 4, 'ko', 'Algeria'),
	(17, 5, 'en', 'American Samoa'),
	(18, 5, 'vi', 'American Samoa'),
	(19, 5, 'ja', 'American Samoa'),
	(20, 5, 'ko', 'American Samoa'),
	(21, 6, 'en', 'Andorra'),
	(22, 6, 'vi', 'Andorra'),
	(23, 6, 'ja', 'Andorra'),
	(24, 6, 'ko', 'Andorra'),
	(25, 7, 'en', 'Angola'),
	(26, 7, 'vi', 'Angola'),
	(27, 7, 'ja', 'Angola'),
	(28, 7, 'ko', 'Angola'),
	(29, 8, 'en', 'Anguilla'),
	(30, 8, 'vi', 'Anguilla'),
	(31, 8, 'ja', 'Anguilla'),
	(32, 8, 'ko', 'Anguilla'),
	(33, 9, 'en', 'Antarctica'),
	(34, 9, 'vi', 'Antarctica'),
	(35, 9, 'ja', 'Antarctica'),
	(36, 9, 'ko', 'Antarctica'),
	(37, 10, 'en', 'Antigua and Barbuda'),
	(38, 10, 'vi', 'Antigua and Barbuda'),
	(39, 10, 'ja', 'Antigua and Barbuda'),
	(40, 10, 'ko', 'Antigua and Barbuda'),
	(41, 11, 'en', 'Argentina'),
	(42, 11, 'vi', 'Argentina'),
	(43, 11, 'ja', 'Argentina'),
	(44, 11, 'ko', 'Argentina'),
	(45, 12, 'en', 'Armenia'),
	(46, 12, 'vi', 'Armenia'),
	(47, 12, 'ja', 'Armenia'),
	(48, 12, 'ko', 'Armenia'),
	(49, 13, 'en', 'Aruba'),
	(50, 13, 'vi', 'Aruba'),
	(51, 13, 'ja', 'Aruba'),
	(52, 13, 'ko', 'Aruba'),
	(53, 14, 'en', 'Australia'),
	(54, 14, 'vi', 'Australia'),
	(55, 14, 'ja', 'Australia'),
	(56, 14, 'ko', 'Australia'),
	(57, 15, 'en', 'Austria'),
	(58, 15, 'vi', 'Austria'),
	(59, 15, 'ja', 'Austria'),
	(60, 15, 'ko', 'Austria'),
	(61, 16, 'en', 'Azerbaijan'),
	(62, 16, 'vi', 'Azerbaijan'),
	(63, 16, 'ja', 'Azerbaijan'),
	(64, 16, 'ko', 'Azerbaijan'),
	(65, 17, 'en', 'Bahamas'),
	(66, 17, 'vi', 'Bahamas'),
	(67, 17, 'ja', 'Bahamas'),
	(68, 17, 'ko', 'Bahamas'),
	(69, 18, 'en', 'Bahrain'),
	(70, 18, 'vi', 'Bahrain'),
	(71, 18, 'ja', 'Bahrain'),
	(72, 18, 'ko', 'Bahrain'),
	(73, 19, 'en', 'Bangladesh'),
	(74, 19, 'vi', 'Bangladesh'),
	(75, 19, 'ja', 'Bangladesh'),
	(76, 19, 'ko', 'Bangladesh'),
	(77, 20, 'en', 'Barbados'),
	(78, 20, 'vi', 'Barbados'),
	(79, 20, 'ja', 'Barbados'),
	(80, 20, 'ko', 'Barbados'),
	(81, 21, 'en', 'Belarus'),
	(82, 21, 'vi', 'Belarus'),
	(83, 21, 'ja', 'Belarus'),
	(84, 21, 'ko', 'Belarus'),
	(85, 22, 'en', 'Belgium'),
	(86, 22, 'vi', 'Belgium'),
	(87, 22, 'ja', 'Belgium'),
	(88, 22, 'ko', 'Belgium'),
	(89, 23, 'en', 'Belize'),
	(90, 23, 'vi', 'Belize'),
	(91, 23, 'ja', 'Belize'),
	(92, 23, 'ko', 'Belize'),
	(93, 24, 'en', 'Benin'),
	(94, 24, 'vi', 'Benin'),
	(95, 24, 'ja', 'Benin'),
	(96, 24, 'ko', 'Benin'),
	(97, 25, 'en', 'Bermuda'),
	(98, 25, 'vi', 'Bermuda'),
	(99, 25, 'ja', 'Bermuda'),
	(100, 25, 'ko', 'Bermuda'),
	(101, 26, 'en', 'Bhutan'),
	(102, 26, 'vi', 'Bhutan'),
	(103, 26, 'ja', 'Bhutan'),
	(104, 26, 'ko', 'Bhutan'),
	(105, 27, 'en', 'Bolivia'),
	(106, 27, 'vi', 'Bolivia'),
	(107, 27, 'ja', 'Bolivia'),
	(108, 27, 'ko', 'Bolivia'),
	(109, 28, 'en', 'Bosnia and Herzegovina'),
	(110, 28, 'vi', 'Bosnia and Herzegovina'),
	(111, 28, 'ja', 'Bosnia and Herzegovina'),
	(112, 28, 'ko', 'Bosnia and Herzegovina'),
	(113, 29, 'en', 'Botswana'),
	(114, 29, 'vi', 'Botswana'),
	(115, 29, 'ja', 'Botswana'),
	(116, 29, 'ko', 'Botswana'),
	(117, 30, 'en', 'Bouvet Island'),
	(118, 30, 'vi', 'Bouvet Island'),
	(119, 30, 'ja', 'Bouvet Island'),
	(120, 30, 'ko', 'Bouvet Island'),
	(121, 31, 'en', 'Brazil'),
	(122, 31, 'vi', 'Brazil'),
	(123, 31, 'ja', 'Brazil'),
	(124, 31, 'ko', 'Brazil'),
	(125, 32, 'en', 'British Indian Ocean Territory'),
	(126, 32, 'vi', 'British Indian Ocean Territory'),
	(127, 32, 'ja', 'British Indian Ocean Territory'),
	(128, 32, 'ko', 'British Indian Ocean Territory'),
	(129, 33, 'en', 'Brunei Darussalam'),
	(130, 33, 'vi', 'Brunei Darussalam'),
	(131, 33, 'ja', 'Brunei Darussalam'),
	(132, 33, 'ko', 'Brunei Darussalam'),
	(133, 34, 'en', 'Bulgaria'),
	(134, 34, 'vi', 'Bulgaria'),
	(135, 34, 'ja', 'Bulgaria'),
	(136, 34, 'ko', 'Bulgaria'),
	(137, 35, 'en', 'Burkina Faso'),
	(138, 35, 'vi', 'Burkina Faso'),
	(139, 35, 'ja', 'Burkina Faso'),
	(140, 35, 'ko', 'Burkina Faso'),
	(141, 36, 'en', 'Burundi'),
	(142, 36, 'vi', 'Burundi'),
	(143, 36, 'ja', 'Burundi'),
	(144, 36, 'ko', 'Burundi'),
	(145, 37, 'en', 'Cambodia'),
	(146, 37, 'vi', 'Cambodia'),
	(147, 37, 'ja', 'Cambodia'),
	(148, 37, 'ko', 'Cambodia'),
	(149, 38, 'en', 'Cameroon'),
	(150, 38, 'vi', 'Cameroon'),
	(151, 38, 'ja', 'Cameroon'),
	(152, 38, 'ko', 'Cameroon'),
	(153, 39, 'en', 'Canada'),
	(154, 39, 'vi', 'Canada'),
	(155, 39, 'ja', 'Canada'),
	(156, 39, 'ko', 'Canada'),
	(157, 40, 'en', 'Cape Verde'),
	(158, 40, 'vi', 'Cape Verde'),
	(159, 40, 'ja', 'Cape Verde'),
	(160, 40, 'ko', 'Cape Verde'),
	(161, 41, 'en', 'Cayman Islands'),
	(162, 41, 'vi', 'Cayman Islands'),
	(163, 41, 'ja', 'Cayman Islands'),
	(164, 41, 'ko', 'Cayman Islands'),
	(165, 42, 'en', 'Central African Republic'),
	(166, 42, 'vi', 'Central African Republic'),
	(167, 42, 'ja', 'Central African Republic'),
	(168, 42, 'ko', 'Central African Republic'),
	(169, 43, 'en', 'Chad'),
	(170, 43, 'vi', 'Chad'),
	(171, 43, 'ja', 'Chad'),
	(172, 43, 'ko', 'Chad'),
	(173, 44, 'en', 'Chile'),
	(174, 44, 'vi', 'Chile'),
	(175, 44, 'ja', 'Chile'),
	(176, 44, 'ko', 'Chile'),
	(177, 45, 'en', 'China'),
	(178, 45, 'vi', 'China'),
	(179, 45, 'ja', 'China'),
	(180, 45, 'ko', 'China'),
	(181, 46, 'en', 'Christmas Island'),
	(182, 46, 'vi', 'Christmas Island'),
	(183, 46, 'ja', 'Christmas Island'),
	(184, 46, 'ko', 'Christmas Island'),
	(185, 47, 'en', 'Cocos (Keeling) Islands'),
	(186, 47, 'vi', 'Cocos (Keeling) Islands'),
	(187, 47, 'ja', 'Cocos (Keeling) Islands'),
	(188, 47, 'ko', 'Cocos (Keeling) Islands'),
	(189, 48, 'en', 'Colombia'),
	(190, 48, 'vi', 'Colombia'),
	(191, 48, 'ja', 'Colombia'),
	(192, 48, 'ko', 'Colombia'),
	(193, 49, 'en', 'Comoros'),
	(194, 49, 'vi', 'Comoros'),
	(195, 49, 'ja', 'Comoros'),
	(196, 49, 'ko', 'Comoros'),
	(197, 50, 'en', 'Congo'),
	(198, 50, 'vi', 'Congo'),
	(199, 50, 'ja', 'Congo'),
	(200, 50, 'ko', 'Congo'),
	(201, 51, 'en', 'Cook Islands'),
	(202, 51, 'vi', 'Cook Islands'),
	(203, 51, 'ja', 'Cook Islands'),
	(204, 51, 'ko', 'Cook Islands'),
	(205, 52, 'en', 'Costa Rica'),
	(206, 52, 'vi', 'Costa Rica'),
	(207, 52, 'ja', 'Costa Rica'),
	(208, 52, 'ko', 'Costa Rica'),
	(209, 53, 'en', 'Croatia (Hrvatska)'),
	(210, 53, 'vi', 'Croatia (Hrvatska)'),
	(211, 53, 'ja', 'Croatia (Hrvatska)'),
	(212, 53, 'ko', 'Croatia (Hrvatska)'),
	(213, 54, 'en', 'Cuba'),
	(214, 54, 'vi', 'Cuba'),
	(215, 54, 'ja', 'Cuba'),
	(216, 54, 'ko', 'Cuba'),
	(217, 55, 'en', 'Cyprus'),
	(218, 55, 'vi', 'Cyprus'),
	(219, 55, 'ja', 'Cyprus'),
	(220, 55, 'ko', 'Cyprus'),
	(221, 56, 'en', 'Czech Republic'),
	(222, 56, 'vi', 'Czech Republic'),
	(223, 56, 'ja', 'Czech Republic'),
	(224, 56, 'ko', 'Czech Republic'),
	(225, 57, 'en', 'Denmark'),
	(226, 57, 'vi', 'Denmark'),
	(227, 57, 'ja', 'Denmark'),
	(228, 57, 'ko', 'Denmark'),
	(229, 58, 'en', 'Djibouti'),
	(230, 58, 'vi', 'Djibouti'),
	(231, 58, 'ja', 'Djibouti'),
	(232, 58, 'ko', 'Djibouti'),
	(233, 59, 'en', 'Dominica'),
	(234, 59, 'vi', 'Dominica'),
	(235, 59, 'ja', 'Dominica'),
	(236, 59, 'ko', 'Dominica'),
	(237, 60, 'en', 'Dominican Republic'),
	(238, 60, 'vi', 'Dominican Republic'),
	(239, 60, 'ja', 'Dominican Republic'),
	(240, 60, 'ko', 'Dominican Republic'),
	(241, 61, 'en', 'East Timor'),
	(242, 61, 'vi', 'East Timor'),
	(243, 61, 'ja', 'East Timor'),
	(244, 61, 'ko', 'East Timor'),
	(245, 62, 'en', 'Ecuador'),
	(246, 62, 'vi', 'Ecuador'),
	(247, 62, 'ja', 'Ecuador'),
	(248, 62, 'ko', 'Ecuador'),
	(249, 63, 'en', 'Egypt'),
	(250, 63, 'vi', 'Egypt'),
	(251, 63, 'ja', 'Egypt'),
	(252, 63, 'ko', 'Egypt'),
	(253, 64, 'en', 'El Salvador'),
	(254, 64, 'vi', 'El Salvador'),
	(255, 64, 'ja', 'El Salvador'),
	(256, 64, 'ko', 'El Salvador'),
	(257, 65, 'en', 'Equatorial Guinea'),
	(258, 65, 'vi', 'Equatorial Guinea'),
	(259, 65, 'ja', 'Equatorial Guinea'),
	(260, 65, 'ko', 'Equatorial Guinea'),
	(261, 66, 'en', 'Eritrea'),
	(262, 66, 'vi', 'Eritrea'),
	(263, 66, 'ja', 'Eritrea'),
	(264, 66, 'ko', 'Eritrea'),
	(265, 67, 'en', 'Estonia'),
	(266, 67, 'vi', 'Estonia'),
	(267, 67, 'ja', 'Estonia'),
	(268, 67, 'ko', 'Estonia'),
	(269, 68, 'en', 'Ethiopia'),
	(270, 68, 'vi', 'Ethiopia'),
	(271, 68, 'ja', 'Ethiopia'),
	(272, 68, 'ko', 'Ethiopia'),
	(273, 69, 'en', 'Falkland Islands (Malvinas)'),
	(274, 69, 'vi', 'Falkland Islands (Malvinas)'),
	(275, 69, 'ja', 'Falkland Islands (Malvinas)'),
	(276, 69, 'ko', 'Falkland Islands (Malvinas)'),
	(277, 70, 'en', 'Faroe Islands'),
	(278, 70, 'vi', 'Faroe Islands'),
	(279, 70, 'ja', 'Faroe Islands'),
	(280, 70, 'ko', 'Faroe Islands'),
	(281, 71, 'en', 'Fiji'),
	(282, 71, 'vi', 'Fiji'),
	(283, 71, 'ja', 'Fiji'),
	(284, 71, 'ko', 'Fiji'),
	(285, 72, 'en', 'Finland'),
	(286, 72, 'vi', 'Finland'),
	(287, 72, 'ja', 'Finland'),
	(288, 72, 'ko', 'Finland'),
	(289, 73, 'en', 'France'),
	(290, 73, 'vi', 'France'),
	(291, 73, 'ja', 'France'),
	(292, 73, 'ko', 'France'),
	(293, 74, 'en', 'France, Metropolitan'),
	(294, 74, 'vi', 'France, Metropolitan'),
	(295, 74, 'ja', 'France, Metropolitan'),
	(296, 74, 'ko', 'France, Metropolitan'),
	(297, 75, 'en', 'French Guiana'),
	(298, 75, 'vi', 'French Guiana'),
	(299, 75, 'ja', 'French Guiana'),
	(300, 75, 'ko', 'French Guiana'),
	(301, 76, 'en', 'French Polynesia'),
	(302, 76, 'vi', 'French Polynesia'),
	(303, 76, 'ja', 'French Polynesia'),
	(304, 76, 'ko', 'French Polynesia'),
	(305, 77, 'en', 'French Southern Territories'),
	(306, 77, 'vi', 'French Southern Territories'),
	(307, 77, 'ja', 'French Southern Territories'),
	(308, 77, 'ko', 'French Southern Territories'),
	(309, 78, 'en', 'Gabon'),
	(310, 78, 'vi', 'Gabon'),
	(311, 78, 'ja', 'Gabon'),
	(312, 78, 'ko', 'Gabon'),
	(313, 79, 'en', 'Gambia'),
	(314, 79, 'vi', 'Gambia'),
	(315, 79, 'ja', 'Gambia'),
	(316, 79, 'ko', 'Gambia'),
	(317, 80, 'en', 'Georgia'),
	(318, 80, 'vi', 'Georgia'),
	(319, 80, 'ja', 'Georgia'),
	(320, 80, 'ko', 'Georgia'),
	(321, 81, 'en', 'Germany'),
	(322, 81, 'vi', 'Germany'),
	(323, 81, 'ja', 'Germany'),
	(324, 81, 'ko', 'Germany'),
	(325, 82, 'en', 'Ghana'),
	(326, 82, 'vi', 'Ghana'),
	(327, 82, 'ja', 'Ghana'),
	(328, 82, 'ko', 'Ghana'),
	(329, 83, 'en', 'Gibraltar'),
	(330, 83, 'vi', 'Gibraltar'),
	(331, 83, 'ja', 'Gibraltar'),
	(332, 83, 'ko', 'Gibraltar'),
	(333, 84, 'en', 'Guernsey'),
	(334, 84, 'vi', 'Guernsey'),
	(335, 84, 'ja', 'Guernsey'),
	(336, 84, 'ko', 'Guernsey'),
	(337, 85, 'en', 'Greece'),
	(338, 85, 'vi', 'Greece'),
	(339, 85, 'ja', 'Greece'),
	(340, 85, 'ko', 'Greece'),
	(341, 86, 'en', 'Greenland'),
	(342, 86, 'vi', 'Greenland'),
	(343, 86, 'ja', 'Greenland'),
	(344, 86, 'ko', 'Greenland'),
	(345, 87, 'en', 'Grenada'),
	(346, 87, 'vi', 'Grenada'),
	(347, 87, 'ja', 'Grenada'),
	(348, 87, 'ko', 'Grenada'),
	(349, 88, 'en', 'Guadeloupe'),
	(350, 88, 'vi', 'Guadeloupe'),
	(351, 88, 'ja', 'Guadeloupe'),
	(352, 88, 'ko', 'Guadeloupe'),
	(353, 89, 'en', 'Guam'),
	(354, 89, 'vi', 'Guam'),
	(355, 89, 'ja', 'Guam'),
	(356, 89, 'ko', 'Guam'),
	(357, 90, 'en', 'Guatemala'),
	(358, 90, 'vi', 'Guatemala'),
	(359, 90, 'ja', 'Guatemala'),
	(360, 90, 'ko', 'Guatemala'),
	(361, 91, 'en', 'Guinea'),
	(362, 91, 'vi', 'Guinea'),
	(363, 91, 'ja', 'Guinea'),
	(364, 91, 'ko', 'Guinea'),
	(365, 92, 'en', 'Guinea-Bissau'),
	(366, 92, 'vi', 'Guinea-Bissau'),
	(367, 92, 'ja', 'Guinea-Bissau'),
	(368, 92, 'ko', 'Guinea-Bissau'),
	(369, 93, 'en', 'Guyana'),
	(370, 93, 'vi', 'Guyana'),
	(371, 93, 'ja', 'Guyana'),
	(372, 93, 'ko', 'Guyana'),
	(373, 94, 'en', 'Haiti'),
	(374, 94, 'vi', 'Haiti'),
	(375, 94, 'ja', 'Haiti'),
	(376, 94, 'ko', 'Haiti'),
	(377, 95, 'en', 'Heard and Mc Donald Islands'),
	(378, 95, 'vi', 'Heard and Mc Donald Islands'),
	(379, 95, 'ja', 'Heard and Mc Donald Islands'),
	(380, 95, 'ko', 'Heard and Mc Donald Islands'),
	(381, 96, 'en', 'Honduras'),
	(382, 96, 'vi', 'Honduras'),
	(383, 96, 'ja', 'Honduras'),
	(384, 96, 'ko', 'Honduras'),
	(385, 97, 'en', 'Hong Kong'),
	(386, 97, 'vi', 'Hong Kong'),
	(387, 97, 'ja', 'Hong Kong'),
	(388, 97, 'ko', 'Hong Kong'),
	(389, 98, 'en', 'Hungary'),
	(390, 98, 'vi', 'Hungary'),
	(391, 98, 'ja', 'Hungary'),
	(392, 98, 'ko', 'Hungary'),
	(393, 99, 'en', 'Iceland'),
	(394, 99, 'vi', 'Iceland'),
	(395, 99, 'ja', 'Iceland'),
	(396, 99, 'ko', 'Iceland'),
	(397, 100, 'en', 'India'),
	(398, 100, 'vi', 'India'),
	(399, 100, 'ja', 'India'),
	(400, 100, 'ko', 'India'),
	(401, 101, 'en', 'Isle of Man'),
	(402, 101, 'vi', 'Isle of Man'),
	(403, 101, 'ja', 'Isle of Man'),
	(404, 101, 'ko', 'Isle of Man'),
	(405, 102, 'en', 'Indonesia'),
	(406, 102, 'vi', 'Indonesia'),
	(407, 102, 'ja', 'Indonesia'),
	(408, 102, 'ko', 'Indonesia'),
	(409, 103, 'en', 'Iran (Islamic Republic of)'),
	(410, 103, 'vi', 'Iran (Islamic Republic of)'),
	(411, 103, 'ja', 'Iran (Islamic Republic of)'),
	(412, 103, 'ko', 'Iran (Islamic Republic of)'),
	(413, 104, 'en', 'Iraq'),
	(414, 104, 'vi', 'Iraq'),
	(415, 104, 'ja', 'Iraq'),
	(416, 104, 'ko', 'Iraq'),
	(417, 105, 'en', 'Ireland'),
	(418, 105, 'vi', 'Ireland'),
	(419, 105, 'ja', 'Ireland'),
	(420, 105, 'ko', 'Ireland'),
	(421, 106, 'en', 'Israel'),
	(422, 106, 'vi', 'Israel'),
	(423, 106, 'ja', 'Israel'),
	(424, 106, 'ko', 'Israel'),
	(425, 107, 'en', 'Italy'),
	(426, 107, 'vi', 'Italy'),
	(427, 107, 'ja', 'Italy'),
	(428, 107, 'ko', 'Italy'),
	(429, 108, 'en', 'Ivory Coast'),
	(430, 108, 'vi', 'Ivory Coast'),
	(431, 108, 'ja', 'Ivory Coast'),
	(432, 108, 'ko', 'Ivory Coast'),
	(433, 109, 'en', 'Jersey'),
	(434, 109, 'vi', 'Jersey'),
	(435, 109, 'ja', 'Jersey'),
	(436, 109, 'ko', 'Jersey'),
	(437, 110, 'en', 'Jamaica'),
	(438, 110, 'vi', 'Jamaica'),
	(439, 110, 'ja', 'Jamaica'),
	(440, 110, 'ko', 'Jamaica'),
	(441, 111, 'en', 'Japan'),
	(442, 111, 'vi', 'Japan'),
	(443, 111, 'ja', 'Japan'),
	(444, 111, 'ko', 'Japan'),
	(445, 112, 'en', 'Jordan'),
	(446, 112, 'vi', 'Jordan'),
	(447, 112, 'ja', 'Jordan'),
	(448, 112, 'ko', 'Jordan'),
	(449, 113, 'en', 'Kazakhstan'),
	(450, 113, 'vi', 'Kazakhstan'),
	(451, 113, 'ja', 'Kazakhstan'),
	(452, 113, 'ko', 'Kazakhstan'),
	(453, 114, 'en', 'Kenya'),
	(454, 114, 'vi', 'Kenya'),
	(455, 114, 'ja', 'Kenya'),
	(456, 114, 'ko', 'Kenya'),
	(457, 115, 'en', 'Kiribati'),
	(458, 115, 'vi', 'Kiribati'),
	(459, 115, 'ja', 'Kiribati'),
	(460, 115, 'ko', 'Kiribati'),
	(461, 116, 'en', 'Korea, Democratic People\'s Republic of'),
	(462, 116, 'vi', 'Korea, Democratic People\'s Republic of'),
	(463, 116, 'ja', 'Korea, Democratic People\'s Republic of'),
	(464, 116, 'ko', 'Korea, Democratic People\'s Republic of'),
	(465, 117, 'en', 'Korea, Republic of'),
	(466, 117, 'vi', 'Korea, Republic of'),
	(467, 117, 'ja', 'Korea, Republic of'),
	(468, 117, 'ko', 'Korea, Republic of'),
	(469, 118, 'en', 'Kosovo'),
	(470, 118, 'vi', 'Kosovo'),
	(471, 118, 'ja', 'Kosovo'),
	(472, 118, 'ko', 'Kosovo'),
	(473, 119, 'en', 'Kuwait'),
	(474, 119, 'vi', 'Kuwait'),
	(475, 119, 'ja', 'Kuwait'),
	(476, 119, 'ko', 'Kuwait'),
	(477, 120, 'en', 'Kyrgyzstan'),
	(478, 120, 'vi', 'Kyrgyzstan'),
	(479, 120, 'ja', 'Kyrgyzstan'),
	(480, 120, 'ko', 'Kyrgyzstan'),
	(481, 121, 'en', 'Lao People\'s Democratic Republic'),
	(482, 121, 'vi', 'Lao People\'s Democratic Republic'),
	(483, 121, 'ja', 'Lao People\'s Democratic Republic'),
	(484, 121, 'ko', 'Lao People\'s Democratic Republic'),
	(485, 122, 'en', 'Latvia'),
	(486, 122, 'vi', 'Latvia'),
	(487, 122, 'ja', 'Latvia'),
	(488, 122, 'ko', 'Latvia'),
	(489, 123, 'en', 'Lebanon'),
	(490, 123, 'vi', 'Lebanon'),
	(491, 123, 'ja', 'Lebanon'),
	(492, 123, 'ko', 'Lebanon'),
	(493, 124, 'en', 'Lesotho'),
	(494, 124, 'vi', 'Lesotho'),
	(495, 124, 'ja', 'Lesotho'),
	(496, 124, 'ko', 'Lesotho'),
	(497, 125, 'en', 'Liberia'),
	(498, 125, 'vi', 'Liberia'),
	(499, 125, 'ja', 'Liberia'),
	(500, 125, 'ko', 'Liberia'),
	(501, 126, 'en', 'Libyan Arab Jamahiriya'),
	(502, 126, 'vi', 'Libyan Arab Jamahiriya'),
	(503, 126, 'ja', 'Libyan Arab Jamahiriya'),
	(504, 126, 'ko', 'Libyan Arab Jamahiriya'),
	(505, 127, 'en', 'Liechtenstein'),
	(506, 127, 'vi', 'Liechtenstein'),
	(507, 127, 'ja', 'Liechtenstein'),
	(508, 127, 'ko', 'Liechtenstein'),
	(509, 128, 'en', 'Lithuania'),
	(510, 128, 'vi', 'Lithuania'),
	(511, 128, 'ja', 'Lithuania'),
	(512, 128, 'ko', 'Lithuania'),
	(513, 129, 'en', 'Luxembourg'),
	(514, 129, 'vi', 'Luxembourg'),
	(515, 129, 'ja', 'Luxembourg'),
	(516, 129, 'ko', 'Luxembourg'),
	(517, 130, 'en', 'Macau'),
	(518, 130, 'vi', 'Macau'),
	(519, 130, 'ja', 'Macau'),
	(520, 130, 'ko', 'Macau'),
	(521, 131, 'en', 'Macedonia'),
	(522, 131, 'vi', 'Macedonia'),
	(523, 131, 'ja', 'Macedonia'),
	(524, 131, 'ko', 'Macedonia'),
	(525, 132, 'en', 'Madagascar'),
	(526, 132, 'vi', 'Madagascar'),
	(527, 132, 'ja', 'Madagascar'),
	(528, 132, 'ko', 'Madagascar'),
	(529, 133, 'en', 'Malawi'),
	(530, 133, 'vi', 'Malawi'),
	(531, 133, 'ja', 'Malawi'),
	(532, 133, 'ko', 'Malawi'),
	(533, 134, 'en', 'Malaysia'),
	(534, 134, 'vi', 'Malaysia'),
	(535, 134, 'ja', 'Malaysia'),
	(536, 134, 'ko', 'Malaysia'),
	(537, 135, 'en', 'Maldives'),
	(538, 135, 'vi', 'Maldives'),
	(539, 135, 'ja', 'Maldives'),
	(540, 135, 'ko', 'Maldives'),
	(541, 136, 'en', 'Mali'),
	(542, 136, 'vi', 'Mali'),
	(543, 136, 'ja', 'Mali'),
	(544, 136, 'ko', 'Mali'),
	(545, 137, 'en', 'Malta'),
	(546, 137, 'vi', 'Malta'),
	(547, 137, 'ja', 'Malta'),
	(548, 137, 'ko', 'Malta'),
	(549, 138, 'en', 'Marshall Islands'),
	(550, 138, 'vi', 'Marshall Islands'),
	(551, 138, 'ja', 'Marshall Islands'),
	(552, 138, 'ko', 'Marshall Islands'),
	(553, 139, 'en', 'Martinique'),
	(554, 139, 'vi', 'Martinique'),
	(555, 139, 'ja', 'Martinique'),
	(556, 139, 'ko', 'Martinique'),
	(557, 140, 'en', 'Mauritania'),
	(558, 140, 'vi', 'Mauritania'),
	(559, 140, 'ja', 'Mauritania'),
	(560, 140, 'ko', 'Mauritania'),
	(561, 141, 'en', 'Mauritius'),
	(562, 141, 'vi', 'Mauritius'),
	(563, 141, 'ja', 'Mauritius'),
	(564, 141, 'ko', 'Mauritius'),
	(565, 142, 'en', 'Mayotte'),
	(566, 142, 'vi', 'Mayotte'),
	(567, 142, 'ja', 'Mayotte'),
	(568, 142, 'ko', 'Mayotte'),
	(569, 143, 'en', 'Mexico'),
	(570, 143, 'vi', 'Mexico'),
	(571, 143, 'ja', 'Mexico'),
	(572, 143, 'ko', 'Mexico'),
	(573, 144, 'en', 'Micronesia, Federated States of'),
	(574, 144, 'vi', 'Micronesia, Federated States of'),
	(575, 144, 'ja', 'Micronesia, Federated States of'),
	(576, 144, 'ko', 'Micronesia, Federated States of'),
	(577, 145, 'en', 'Moldova, Republic of'),
	(578, 145, 'vi', 'Moldova, Republic of'),
	(579, 145, 'ja', 'Moldova, Republic of'),
	(580, 145, 'ko', 'Moldova, Republic of'),
	(581, 146, 'en', 'Monaco'),
	(582, 146, 'vi', 'Monaco'),
	(583, 146, 'ja', 'Monaco'),
	(584, 146, 'ko', 'Monaco'),
	(585, 147, 'en', 'Mongolia'),
	(586, 147, 'vi', 'Mongolia'),
	(587, 147, 'ja', 'Mongolia'),
	(588, 147, 'ko', 'Mongolia'),
	(589, 148, 'en', 'Montenegro'),
	(590, 148, 'vi', 'Montenegro'),
	(591, 148, 'ja', 'Montenegro'),
	(592, 148, 'ko', 'Montenegro'),
	(593, 149, 'en', 'Montserrat'),
	(594, 149, 'vi', 'Montserrat'),
	(595, 149, 'ja', 'Montserrat'),
	(596, 149, 'ko', 'Montserrat'),
	(597, 150, 'en', 'Morocco'),
	(598, 150, 'vi', 'Morocco'),
	(599, 150, 'ja', 'Morocco'),
	(600, 150, 'ko', 'Morocco'),
	(601, 151, 'en', 'Mozambique'),
	(602, 151, 'vi', 'Mozambique'),
	(603, 151, 'ja', 'Mozambique'),
	(604, 151, 'ko', 'Mozambique'),
	(605, 152, 'en', 'Myanmar'),
	(606, 152, 'vi', 'Myanmar'),
	(607, 152, 'ja', 'Myanmar'),
	(608, 152, 'ko', 'Myanmar'),
	(609, 153, 'en', 'Namibia'),
	(610, 153, 'vi', 'Namibia'),
	(611, 153, 'ja', 'Namibia'),
	(612, 153, 'ko', 'Namibia'),
	(613, 154, 'en', 'Nauru'),
	(614, 154, 'vi', 'Nauru'),
	(615, 154, 'ja', 'Nauru'),
	(616, 154, 'ko', 'Nauru'),
	(617, 155, 'en', 'Nepal'),
	(618, 155, 'vi', 'Nepal'),
	(619, 155, 'ja', 'Nepal'),
	(620, 155, 'ko', 'Nepal'),
	(621, 156, 'en', 'Netherlands'),
	(622, 156, 'vi', 'Netherlands'),
	(623, 156, 'ja', 'Netherlands'),
	(624, 156, 'ko', 'Netherlands'),
	(625, 157, 'en', 'Netherlands Antilles'),
	(626, 157, 'vi', 'Netherlands Antilles'),
	(627, 157, 'ja', 'Netherlands Antilles'),
	(628, 157, 'ko', 'Netherlands Antilles'),
	(629, 158, 'en', 'New Caledonia'),
	(630, 158, 'vi', 'New Caledonia'),
	(631, 158, 'ja', 'New Caledonia'),
	(632, 158, 'ko', 'New Caledonia'),
	(633, 159, 'en', 'New Zealand'),
	(634, 159, 'vi', 'New Zealand'),
	(635, 159, 'ja', 'New Zealand'),
	(636, 159, 'ko', 'New Zealand'),
	(637, 160, 'en', 'Nicaragua'),
	(638, 160, 'vi', 'Nicaragua'),
	(639, 160, 'ja', 'Nicaragua'),
	(640, 160, 'ko', 'Nicaragua'),
	(641, 161, 'en', 'Niger'),
	(642, 161, 'vi', 'Niger'),
	(643, 161, 'ja', 'Niger'),
	(644, 161, 'ko', 'Niger'),
	(645, 162, 'en', 'Nigeria'),
	(646, 162, 'vi', 'Nigeria'),
	(647, 162, 'ja', 'Nigeria'),
	(648, 162, 'ko', 'Nigeria'),
	(649, 163, 'en', 'Niue'),
	(650, 163, 'vi', 'Niue'),
	(651, 163, 'ja', 'Niue'),
	(652, 163, 'ko', 'Niue'),
	(653, 164, 'en', 'Norfolk Island'),
	(654, 164, 'vi', 'Norfolk Island'),
	(655, 164, 'ja', 'Norfolk Island'),
	(656, 164, 'ko', 'Norfolk Island'),
	(657, 165, 'en', 'Northern Mariana Islands'),
	(658, 165, 'vi', 'Northern Mariana Islands'),
	(659, 165, 'ja', 'Northern Mariana Islands'),
	(660, 165, 'ko', 'Northern Mariana Islands'),
	(661, 166, 'en', 'Norway'),
	(662, 166, 'vi', 'Norway'),
	(663, 166, 'ja', 'Norway'),
	(664, 166, 'ko', 'Norway'),
	(665, 167, 'en', 'Oman'),
	(666, 167, 'vi', 'Oman'),
	(667, 167, 'ja', 'Oman'),
	(668, 167, 'ko', 'Oman'),
	(669, 168, 'en', 'Pakistan'),
	(670, 168, 'vi', 'Pakistan'),
	(671, 168, 'ja', 'Pakistan'),
	(672, 168, 'ko', 'Pakistan'),
	(673, 169, 'en', 'Palau'),
	(674, 169, 'vi', 'Palau'),
	(675, 169, 'ja', 'Palau'),
	(676, 169, 'ko', 'Palau'),
	(677, 170, 'en', 'Palestine'),
	(678, 170, 'vi', 'Palestine'),
	(679, 170, 'ja', 'Palestine'),
	(680, 170, 'ko', 'Palestine'),
	(681, 171, 'en', 'Panama'),
	(682, 171, 'vi', 'Panama'),
	(683, 171, 'ja', 'Panama'),
	(684, 171, 'ko', 'Panama'),
	(685, 172, 'en', 'Papua New Guinea'),
	(686, 172, 'vi', 'Papua New Guinea'),
	(687, 172, 'ja', 'Papua New Guinea'),
	(688, 172, 'ko', 'Papua New Guinea'),
	(689, 173, 'en', 'Paraguay'),
	(690, 173, 'vi', 'Paraguay'),
	(691, 173, 'ja', 'Paraguay'),
	(692, 173, 'ko', 'Paraguay'),
	(693, 174, 'en', 'Peru'),
	(694, 174, 'vi', 'Peru'),
	(695, 174, 'ja', 'Peru'),
	(696, 174, 'ko', 'Peru'),
	(697, 175, 'en', 'Philippines'),
	(698, 175, 'vi', 'Philippines'),
	(699, 175, 'ja', 'Philippines'),
	(700, 175, 'ko', 'Philippines'),
	(701, 176, 'en', 'Pitcairn'),
	(702, 176, 'vi', 'Pitcairn'),
	(703, 176, 'ja', 'Pitcairn'),
	(704, 176, 'ko', 'Pitcairn'),
	(705, 177, 'en', 'Poland'),
	(706, 177, 'vi', 'Poland'),
	(707, 177, 'ja', 'Poland'),
	(708, 177, 'ko', 'Poland'),
	(709, 178, 'en', 'Portugal'),
	(710, 178, 'vi', 'Portugal'),
	(711, 178, 'ja', 'Portugal'),
	(712, 178, 'ko', 'Portugal'),
	(713, 179, 'en', 'Puerto Rico'),
	(714, 179, 'vi', 'Puerto Rico'),
	(715, 179, 'ja', 'Puerto Rico'),
	(716, 179, 'ko', 'Puerto Rico'),
	(717, 180, 'en', 'Qatar'),
	(718, 180, 'vi', 'Qatar'),
	(719, 180, 'ja', 'Qatar'),
	(720, 180, 'ko', 'Qatar'),
	(721, 181, 'en', 'Reunion'),
	(722, 181, 'vi', 'Reunion'),
	(723, 181, 'ja', 'Reunion'),
	(724, 181, 'ko', 'Reunion'),
	(725, 182, 'en', 'Romania'),
	(726, 182, 'vi', 'Romania'),
	(727, 182, 'ja', 'Romania'),
	(728, 182, 'ko', 'Romania'),
	(729, 183, 'en', 'Russian Federation'),
	(730, 183, 'vi', 'Russian Federation'),
	(731, 183, 'ja', 'Russian Federation'),
	(732, 183, 'ko', 'Russian Federation'),
	(733, 184, 'en', 'Rwanda'),
	(734, 184, 'vi', 'Rwanda'),
	(735, 184, 'ja', 'Rwanda'),
	(736, 184, 'ko', 'Rwanda'),
	(737, 185, 'en', 'Saint Kitts and Nevis'),
	(738, 185, 'vi', 'Saint Kitts and Nevis'),
	(739, 185, 'ja', 'Saint Kitts and Nevis'),
	(740, 185, 'ko', 'Saint Kitts and Nevis'),
	(741, 186, 'en', 'Saint Lucia'),
	(742, 186, 'vi', 'Saint Lucia'),
	(743, 186, 'ja', 'Saint Lucia'),
	(744, 186, 'ko', 'Saint Lucia'),
	(745, 187, 'en', 'Saint Vincent and the Grenadines'),
	(746, 187, 'vi', 'Saint Vincent and the Grenadines'),
	(747, 187, 'ja', 'Saint Vincent and the Grenadines'),
	(748, 187, 'ko', 'Saint Vincent and the Grenadines'),
	(749, 188, 'en', 'Samoa'),
	(750, 188, 'vi', 'Samoa'),
	(751, 188, 'ja', 'Samoa'),
	(752, 188, 'ko', 'Samoa'),
	(753, 189, 'en', 'San Marino'),
	(754, 189, 'vi', 'San Marino'),
	(755, 189, 'ja', 'San Marino'),
	(756, 189, 'ko', 'San Marino'),
	(757, 190, 'en', 'Sao Tome and Principe'),
	(758, 190, 'vi', 'Sao Tome and Principe'),
	(759, 190, 'ja', 'Sao Tome and Principe'),
	(760, 190, 'ko', 'Sao Tome and Principe'),
	(761, 191, 'en', 'Saudi Arabia'),
	(762, 191, 'vi', 'Saudi Arabia'),
	(763, 191, 'ja', 'Saudi Arabia'),
	(764, 191, 'ko', 'Saudi Arabia'),
	(765, 192, 'en', 'Senegal'),
	(766, 192, 'vi', 'Senegal'),
	(767, 192, 'ja', 'Senegal'),
	(768, 192, 'ko', 'Senegal'),
	(769, 193, 'en', 'Serbia'),
	(770, 193, 'vi', 'Serbia'),
	(771, 193, 'ja', 'Serbia'),
	(772, 193, 'ko', 'Serbia'),
	(773, 194, 'en', 'Seychelles'),
	(774, 194, 'vi', 'Seychelles'),
	(775, 194, 'ja', 'Seychelles'),
	(776, 194, 'ko', 'Seychelles'),
	(777, 195, 'en', 'Sierra Leone'),
	(778, 195, 'vi', 'Sierra Leone'),
	(779, 195, 'ja', 'Sierra Leone'),
	(780, 195, 'ko', 'Sierra Leone'),
	(781, 196, 'en', 'Singapore'),
	(782, 196, 'vi', 'Singapore'),
	(783, 196, 'ja', 'Singapore'),
	(784, 196, 'ko', 'Singapore'),
	(785, 197, 'en', 'Slovakia'),
	(786, 197, 'vi', 'Slovakia'),
	(787, 197, 'ja', 'Slovakia'),
	(788, 197, 'ko', 'Slovakia'),
	(789, 198, 'en', 'Slovenia'),
	(790, 198, 'vi', 'Slovenia'),
	(791, 198, 'ja', 'Slovenia'),
	(792, 198, 'ko', 'Slovenia'),
	(793, 199, 'en', 'Solomon Islands'),
	(794, 199, 'vi', 'Solomon Islands'),
	(795, 199, 'ja', 'Solomon Islands'),
	(796, 199, 'ko', 'Solomon Islands'),
	(797, 200, 'en', 'Somalia'),
	(798, 200, 'vi', 'Somalia'),
	(799, 200, 'ja', 'Somalia'),
	(800, 200, 'ko', 'Somalia'),
	(801, 201, 'en', 'South Africa'),
	(802, 201, 'vi', 'South Africa'),
	(803, 201, 'ja', 'South Africa'),
	(804, 201, 'ko', 'South Africa'),
	(805, 202, 'en', 'South Sudan'),
	(806, 202, 'vi', 'South Sudan'),
	(807, 202, 'ja', 'South Sudan'),
	(808, 202, 'ko', 'South Sudan'),
	(809, 203, 'en', 'South Georgia South Sandwich Islands'),
	(810, 203, 'vi', 'South Georgia South Sandwich Islands'),
	(811, 203, 'ja', 'South Georgia South Sandwich Islands'),
	(812, 203, 'ko', 'South Georgia South Sandwich Islands'),
	(813, 204, 'en', 'Spain'),
	(814, 204, 'vi', 'Spain'),
	(815, 204, 'ja', 'Spain'),
	(816, 204, 'ko', 'Spain'),
	(817, 205, 'en', 'Sri Lanka'),
	(818, 205, 'vi', 'Sri Lanka'),
	(819, 205, 'ja', 'Sri Lanka'),
	(820, 205, 'ko', 'Sri Lanka'),
	(821, 206, 'en', 'St. Helena'),
	(822, 206, 'vi', 'St. Helena'),
	(823, 206, 'ja', 'St. Helena'),
	(824, 206, 'ko', 'St. Helena'),
	(825, 207, 'en', 'St. Pierre and Miquelon'),
	(826, 207, 'vi', 'St. Pierre and Miquelon'),
	(827, 207, 'ja', 'St. Pierre and Miquelon'),
	(828, 207, 'ko', 'St. Pierre and Miquelon'),
	(829, 208, 'en', 'Sudan'),
	(830, 208, 'vi', 'Sudan'),
	(831, 208, 'ja', 'Sudan'),
	(832, 208, 'ko', 'Sudan'),
	(833, 209, 'en', 'Suriname'),
	(834, 209, 'vi', 'Suriname'),
	(835, 209, 'ja', 'Suriname'),
	(836, 209, 'ko', 'Suriname'),
	(837, 210, 'en', 'Svalbard and Jan Mayen Islands'),
	(838, 210, 'vi', 'Svalbard and Jan Mayen Islands'),
	(839, 210, 'ja', 'Svalbard and Jan Mayen Islands'),
	(840, 210, 'ko', 'Svalbard and Jan Mayen Islands'),
	(841, 211, 'en', 'Swaziland'),
	(842, 211, 'vi', 'Swaziland'),
	(843, 211, 'ja', 'Swaziland'),
	(844, 211, 'ko', 'Swaziland'),
	(845, 212, 'en', 'Sweden'),
	(846, 212, 'vi', 'Sweden'),
	(847, 212, 'ja', 'Sweden'),
	(848, 212, 'ko', 'Sweden'),
	(849, 213, 'en', 'Switzerland'),
	(850, 213, 'vi', 'Switzerland'),
	(851, 213, 'ja', 'Switzerland'),
	(852, 213, 'ko', 'Switzerland'),
	(853, 214, 'en', 'Syrian Arab Republic'),
	(854, 214, 'vi', 'Syrian Arab Republic'),
	(855, 214, 'ja', 'Syrian Arab Republic'),
	(856, 214, 'ko', 'Syrian Arab Republic'),
	(857, 215, 'en', 'Taiwan'),
	(858, 215, 'vi', 'Taiwan'),
	(859, 215, 'ja', 'Taiwan'),
	(860, 215, 'ko', 'Taiwan'),
	(861, 216, 'en', 'Tajikistan'),
	(862, 216, 'vi', 'Tajikistan'),
	(863, 216, 'ja', 'Tajikistan'),
	(864, 216, 'ko', 'Tajikistan'),
	(865, 217, 'en', 'Tanzania, United Republic of'),
	(866, 217, 'vi', 'Tanzania, United Republic of'),
	(867, 217, 'ja', 'Tanzania, United Republic of'),
	(868, 217, 'ko', 'Tanzania, United Republic of'),
	(869, 218, 'en', 'Thailand'),
	(870, 218, 'vi', 'Thailand'),
	(871, 218, 'ja', 'Thailand'),
	(872, 218, 'ko', 'Thailand'),
	(873, 219, 'en', 'Togo'),
	(874, 219, 'vi', 'Togo'),
	(875, 219, 'ja', 'Togo'),
	(876, 219, 'ko', 'Togo'),
	(877, 220, 'en', 'Tokelau'),
	(878, 220, 'vi', 'Tokelau'),
	(879, 220, 'ja', 'Tokelau'),
	(880, 220, 'ko', 'Tokelau'),
	(881, 221, 'en', 'Tonga'),
	(882, 221, 'vi', 'Tonga'),
	(883, 221, 'ja', 'Tonga'),
	(884, 221, 'ko', 'Tonga'),
	(885, 222, 'en', 'Trinidad and Tobago'),
	(886, 222, 'vi', 'Trinidad and Tobago'),
	(887, 222, 'ja', 'Trinidad and Tobago'),
	(888, 222, 'ko', 'Trinidad and Tobago'),
	(889, 223, 'en', 'Tunisia'),
	(890, 223, 'vi', 'Tunisia'),
	(891, 223, 'ja', 'Tunisia'),
	(892, 223, 'ko', 'Tunisia'),
	(893, 224, 'en', 'Turkey'),
	(894, 224, 'vi', 'Turkey'),
	(895, 224, 'ja', 'Turkey'),
	(896, 224, 'ko', 'Turkey'),
	(897, 225, 'en', 'Turkmenistan'),
	(898, 225, 'vi', 'Turkmenistan'),
	(899, 225, 'ja', 'Turkmenistan'),
	(900, 225, 'ko', 'Turkmenistan'),
	(901, 226, 'en', 'Turks and Caicos Islands'),
	(902, 226, 'vi', 'Turks and Caicos Islands'),
	(903, 226, 'ja', 'Turks and Caicos Islands'),
	(904, 226, 'ko', 'Turks and Caicos Islands'),
	(905, 227, 'en', 'Tuvalu'),
	(906, 227, 'vi', 'Tuvalu'),
	(907, 227, 'ja', 'Tuvalu'),
	(908, 227, 'ko', 'Tuvalu'),
	(909, 228, 'en', 'Uganda'),
	(910, 228, 'vi', 'Uganda'),
	(911, 228, 'ja', 'Uganda'),
	(912, 228, 'ko', 'Uganda'),
	(913, 229, 'en', 'Ukraine'),
	(914, 229, 'vi', 'Ukraine'),
	(915, 229, 'ja', 'Ukraine'),
	(916, 229, 'ko', 'Ukraine'),
	(917, 230, 'en', 'United Arab Emirates'),
	(918, 230, 'vi', 'United Arab Emirates'),
	(919, 230, 'ja', 'United Arab Emirates'),
	(920, 230, 'ko', 'United Arab Emirates'),
	(921, 231, 'en', 'United Kingdom'),
	(922, 231, 'vi', 'United Kingdom'),
	(923, 231, 'ja', 'United Kingdom'),
	(924, 231, 'ko', 'United Kingdom'),
	(925, 232, 'en', 'United States'),
	(926, 232, 'vi', 'United States'),
	(927, 232, 'ja', 'United States'),
	(928, 232, 'ko', 'United States'),
	(929, 233, 'en', 'United States minor outlying islands'),
	(930, 233, 'vi', 'United States minor outlying islands'),
	(931, 233, 'ja', 'United States minor outlying islands'),
	(932, 233, 'ko', 'United States minor outlying islands'),
	(933, 234, 'en', 'Uruguay'),
	(934, 234, 'vi', 'Uruguay'),
	(935, 234, 'ja', 'Uruguay'),
	(936, 234, 'ko', 'Uruguay'),
	(937, 235, 'en', 'Uzbekistan'),
	(938, 235, 'vi', 'Uzbekistan'),
	(939, 235, 'ja', 'Uzbekistan'),
	(940, 235, 'ko', 'Uzbekistan'),
	(941, 236, 'en', 'Vanuatu'),
	(942, 236, 'vi', 'Vanuatu'),
	(943, 236, 'ja', 'Vanuatu'),
	(944, 236, 'ko', 'Vanuatu'),
	(945, 237, 'en', 'Vatican City State'),
	(946, 237, 'vi', 'Vatican City State'),
	(947, 237, 'ja', 'Vatican City State'),
	(948, 237, 'ko', 'Vatican City State'),
	(949, 238, 'en', 'Venezuela'),
	(950, 238, 'vi', 'Venezuela'),
	(951, 238, 'ja', 'Venezuela'),
	(952, 238, 'ko', 'Venezuela'),
	(953, 239, 'en', 'Virgin Islands (British)'),
	(954, 239, 'vi', 'Virgin Islands (British)'),
	(955, 239, 'ja', 'Virgin Islands (British)'),
	(956, 239, 'ko', 'Virgin Islands (British)'),
	(957, 240, 'en', 'Virgin Islands (U.S.)'),
	(958, 240, 'vi', 'Virgin Islands (U.S.)'),
	(959, 240, 'ja', 'Virgin Islands (U.S.)'),
	(960, 240, 'ko', 'Virgin Islands (U.S.)'),
	(961, 241, 'en', 'Wallis and Futuna Islands'),
	(962, 241, 'vi', 'Wallis and Futuna Islands'),
	(963, 241, 'ja', 'Wallis and Futuna Islands'),
	(964, 241, 'ko', 'Wallis and Futuna Islands'),
	(965, 242, 'en', 'Western Sahara'),
	(966, 242, 'vi', 'Western Sahara'),
	(967, 242, 'ja', 'Western Sahara'),
	(968, 242, 'ko', 'Western Sahara'),
	(969, 243, 'en', 'Yemen'),
	(970, 243, 'vi', 'Yemen'),
	(971, 243, 'ja', 'Yemen'),
	(972, 243, 'ko', 'Yemen'),
	(973, 244, 'en', 'Zaire'),
	(974, 244, 'vi', 'Zaire'),
	(975, 244, 'ja', 'Zaire'),
	(976, 244, 'ko', 'Zaire'),
	(977, 245, 'en', 'Zambia'),
	(978, 245, 'vi', 'Zambia'),
	(979, 245, 'ja', 'Zambia'),
	(980, 245, 'ko', 'Zambia'),
	(981, 246, 'en', 'Zimbabwe'),
	(982, 246, 'vi', 'Zimbabwe'),
	(983, 246, 'ja', 'Zimbabwe'),
	(984, 246, 'ko', 'Zimbabwe');
/*!40000 ALTER TABLE `country_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table bwid.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_category_id_foreign` (`category_id`),
  CONSTRAINT `faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.faqs: ~0 rows (approximately)
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

-- Dumping structure for table bwid.faqs_translation
CREATE TABLE IF NOT EXISTS `faqs_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faqs_translation_faq_id_locale_unique` (`faq_id`,`locale`),
  KEY `faqs_translation_locale_index` (`locale`),
  CONSTRAINT `faqs_translation_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.faqs_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `faqs_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.faq_categories
CREATE TABLE IF NOT EXISTS `faq_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.faq_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;

-- Dumping structure for table bwid.faq_category_translation
CREATE TABLE IF NOT EXISTS `faq_category_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faq_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_category_translation_faq_category_id_locale_unique` (`faq_category_id`,`locale`),
  KEY `faq_category_translation_locale_index` (`locale`),
  CONSTRAINT `faq_category_translation_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.faq_category_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `faq_category_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_category_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.faq_question
CREATE TABLE IF NOT EXISTS `faq_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.faq_question: ~0 rows (approximately)
/*!40000 ALTER TABLE `faq_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_question` ENABLE KEYS */;

-- Dumping structure for table bwid.free_space
CREATE TABLE IF NOT EXISTS `free_space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `free_space_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.free_space: ~0 rows (approximately)
/*!40000 ALTER TABLE `free_space` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_space` ENABLE KEYS */;

-- Dumping structure for table bwid.free_space_translation
CREATE TABLE IF NOT EXISTS `free_space_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `free_space_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `free_space_translation_free_space_id_locale_unique` (`free_space_id`,`locale`),
  KEY `free_space_translation_locale_index` (`locale`),
  CONSTRAINT `free_space_translation_free_space_id_foreign` FOREIGN KEY (`free_space_id`) REFERENCES `free_space` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.free_space_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `free_space_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_space_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.gallery
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gallery_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;

-- Dumping structure for table bwid.gallery_translation
CREATE TABLE IF NOT EXISTS `gallery_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_translation_gallery_id_locale_unique` (`gallery_id`,`locale`),
  KEY `gallery_translation_locale_index` (`locale`),
  CONSTRAINT `gallery_translation_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.gallery_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `gallery_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.image360
CREATE TABLE IF NOT EXISTS `image360` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hfov` double(8,1) DEFAULT NULL,
  `pitch` double(8,1) DEFAULT NULL,
  `yaw` double(8,1) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image360: ~0 rows (approximately)
/*!40000 ALTER TABLE `image360` DISABLE KEYS */;
/*!40000 ALTER TABLE `image360` ENABLE KEYS */;

-- Dumping structure for table bwid.image360_translation
CREATE TABLE IF NOT EXISTS `image360_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image360_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image360_translation_image360_id_locale_unique` (`image360_id`,`locale`),
  KEY `image360_translation_locale_index` (`locale`),
  CONSTRAINT `image360_translation_image360_id_foreign` FOREIGN KEY (`image360_id`) REFERENCES `image360` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image360_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `image360_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `image360_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.image_area
CREATE TABLE IF NOT EXISTS `image_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_map_id` int(10) unsigned NOT NULL,
  `shape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_area_image_map_id_foreign` (`image_map_id`),
  CONSTRAINT `image_area_image_map_id_foreign` FOREIGN KEY (`image_map_id`) REFERENCES `image_map` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image_area: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_area` ENABLE KEYS */;

-- Dumping structure for table bwid.image_area_translation
CREATE TABLE IF NOT EXISTS `image_area_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_area_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_area_translation_image_area_id_locale_unique` (`image_area_id`,`locale`),
  KEY `image_area_translation_locale_index` (`locale`),
  CONSTRAINT `image_area_translation_image_area_id_foreign` FOREIGN KEY (`image_area_id`) REFERENCES `image_area` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image_area_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_area_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_area_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.image_map
CREATE TABLE IF NOT EXISTS `image_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image_map: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_map` ENABLE KEYS */;

-- Dumping structure for table bwid.image_map_translation
CREATE TABLE IF NOT EXISTS `image_map_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_map_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_map_translation_image_map_id_locale_unique` (`image_map_id`,`locale`),
  KEY `image_map_translation_locale_index` (`locale`),
  CONSTRAINT `image_map_translation_image_map_id_foreign` FOREIGN KEY (`image_map_id`) REFERENCES `image_map` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.image_map_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `image_map_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_map_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.jobs: ~1 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"displayName":"App\\\\Jobs\\\\SubscribeJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\SubscribeJob","command":"O:21:\\"App\\\\Jobs\\\\SubscribeJob\\":8:{s:8:\\"\\u0000*\\u0000email\\";s:27:\\"namnguyen12041994@gmail.com\\";s:6:\\"\\u0000*\\u0000job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:7:\\"chained\\";a:0:{}}"}}', 0, NULL, 1533795833, 1533795833);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table bwid.metadata
CREATE TABLE IF NOT EXISTS `metadata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `metadata_meta_key_index` (`meta_key`),
  KEY `metadata_object_id_index` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.metadata: ~29 rows (approximately)
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
INSERT INTO `metadata` (`id`, `meta_key`, `object_id`, `created_at`, `updated_at`) VALUES
	(1, 'page', 1, '2018-05-30 15:49:49', '2018-05-30 15:49:49'),
	(2, 'page', 2, '2018-06-01 09:35:42', '2018-06-01 09:35:42'),
	(9, 'resource', 1, '2018-06-07 13:47:33', '2018-06-07 13:47:33'),
	(10, 'resource', 2, '2018-06-07 13:48:15', '2018-06-07 13:48:15'),
	(11, 'resource', 3, '2018-06-07 13:53:16', '2018-06-07 13:53:16'),
	(12, 'resource', 4, '2018-06-07 13:54:51', '2018-06-07 13:54:51'),
	(13, 'resource', 5, '2018-06-07 14:09:10', '2018-06-07 14:09:10'),
	(14, 'resource', 6, '2018-06-07 14:10:56', '2018-06-07 14:10:56'),
	(15, 'resource', 7, '2018-06-07 14:12:06', '2018-06-07 14:12:06'),
	(16, 'resource', 8, '2018-06-07 14:13:03', '2018-06-07 14:13:03'),
	(17, 'resource', 9, '2018-06-07 14:30:25', '2018-06-07 14:30:25'),
	(18, 'resource', 10, '2018-06-07 14:32:03', '2018-06-07 14:32:03'),
	(19, 'news', 1, '2018-06-12 09:26:37', '2018-06-12 09:26:37'),
	(20, 'news', 2, '2018-06-12 14:36:29', '2018-06-12 14:36:29'),
	(21, 'news', 3, '2018-06-12 15:32:07', '2018-06-12 15:32:07'),
	(22, 'news', 4, '2018-06-12 15:33:18', '2018-06-12 15:33:18'),
	(23, 'news', 5, '2018-06-12 15:35:12', '2018-06-12 15:35:12'),
	(24, 'news', 6, '2018-06-12 15:39:26', '2018-06-12 15:39:26'),
	(25, 'brochures', 1, '2018-06-13 10:39:12', '2018-06-13 10:39:12'),
	(26, 'brochures', 11, '2018-06-13 10:59:07', '2018-06-13 10:59:07'),
	(33, 'page', 15, '2018-09-11 14:11:53', '2018-09-11 14:11:53'),
	(34, 'page', 16, '2018-09-12 13:50:26', '2018-09-12 13:50:26'),
	(35, 'page', 17, '2018-09-12 14:01:32', '2018-09-12 14:01:32'),
	(36, 'page', 18, '2018-09-12 14:05:57', '2018-09-12 14:05:57'),
	(37, 'page', 19, '2018-09-12 14:26:36', '2018-09-12 14:26:36'),
	(38, 'page', 20, '2018-09-12 14:35:43', '2018-09-12 14:35:43'),
	(39, 'page', 21, '2018-09-12 17:00:56', '2018-09-12 17:00:56'),
	(40, 'page', 22, '2018-09-13 10:55:43', '2018-09-13 10:55:43'),
	(41, 'page', 23, '2018-09-17 13:07:59', '2018-09-17 13:07:59');
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;

-- Dumping structure for table bwid.metadata_translations
CREATE TABLE IF NOT EXISTS `metadata_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `metadata_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_word` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metadata_translations_metadata_id_locale_unique` (`metadata_id`,`locale`),
  KEY `metadata_translations_locale_index` (`locale`),
  CONSTRAINT `metadata_translations_metadata_id_foreign` FOREIGN KEY (`metadata_id`) REFERENCES `metadata` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.metadata_translations: ~69 rows (approximately)
/*!40000 ALTER TABLE `metadata_translations` DISABLE KEYS */;
INSERT INTO `metadata_translations` (`id`, `metadata_id`, `locale`, `title`, `description`, `key_word`) VALUES
	(1, 1, 'en', 'Home', NULL, NULL),
	(2, 1, 'vi', 'Trang chủ', NULL, NULL),
	(3, 1, 'ja', NULL, NULL, NULL),
	(4, 1, 'ko', NULL, NULL, NULL),
	(5, 2, 'en', 'Contact', NULL, NULL),
	(6, 2, 'vi', 'Liên hệ', NULL, NULL),
	(7, 2, 'ja', NULL, NULL, NULL),
	(8, 2, 'ko', NULL, NULL, NULL),
	(25, 9, 'en', NULL, NULL, NULL),
	(26, 9, 'vi', NULL, NULL, NULL),
	(27, 10, 'en', NULL, NULL, NULL),
	(28, 10, 'vi', NULL, NULL, NULL),
	(29, 11, 'en', NULL, NULL, NULL),
	(30, 11, 'vi', NULL, NULL, NULL),
	(31, 12, 'en', NULL, NULL, NULL),
	(32, 12, 'vi', NULL, NULL, NULL),
	(33, 13, 'en', NULL, NULL, NULL),
	(34, 13, 'vi', NULL, NULL, NULL),
	(35, 14, 'en', NULL, NULL, NULL),
	(36, 14, 'vi', NULL, NULL, NULL),
	(37, 15, 'en', NULL, NULL, NULL),
	(38, 15, 'vi', NULL, NULL, NULL),
	(39, 16, 'en', NULL, NULL, NULL),
	(40, 16, 'vi', NULL, NULL, NULL),
	(41, 17, 'en', NULL, NULL, NULL),
	(42, 17, 'vi', NULL, NULL, NULL),
	(43, 18, 'en', NULL, NULL, NULL),
	(44, 18, 'vi', NULL, NULL, NULL),
	(45, 19, 'en', NULL, NULL, NULL),
	(46, 19, 'vi', NULL, NULL, NULL),
	(47, 20, 'en', NULL, NULL, NULL),
	(48, 20, 'vi', NULL, NULL, NULL),
	(49, 21, 'en', NULL, NULL, NULL),
	(50, 21, 'vi', NULL, NULL, NULL),
	(51, 22, 'en', NULL, NULL, NULL),
	(52, 22, 'vi', NULL, NULL, NULL),
	(53, 23, 'en', NULL, NULL, NULL),
	(54, 23, 'vi', NULL, NULL, NULL),
	(55, 24, 'en', NULL, NULL, NULL),
	(56, 24, 'vi', NULL, NULL, NULL),
	(57, 25, 'en', NULL, NULL, NULL),
	(58, 25, 'vi', NULL, NULL, NULL),
	(59, 26, 'en', NULL, NULL, NULL),
	(60, 26, 'vi', NULL, NULL, NULL),
	(73, 33, 'en', NULL, NULL, NULL),
	(74, 33, 'vi', NULL, NULL, NULL),
	(75, 34, 'en', NULL, NULL, NULL),
	(76, 34, 'vi', NULL, NULL, NULL),
	(77, 35, 'en', NULL, NULL, NULL),
	(78, 35, 'vi', NULL, NULL, NULL),
	(79, 36, 'en', NULL, NULL, NULL),
	(80, 36, 'vi', NULL, NULL, NULL),
	(81, 37, 'en', NULL, NULL, NULL),
	(82, 37, 'vi', NULL, NULL, NULL),
	(83, 38, 'en', NULL, NULL, NULL),
	(84, 38, 'vi', NULL, NULL, NULL),
	(85, 39, 'en', NULL, NULL, NULL),
	(86, 39, 'vi', NULL, NULL, NULL),
	(87, 40, 'en', NULL, NULL, NULL),
	(88, 40, 'vi', NULL, NULL, NULL),
	(89, 1, 'zh', NULL, NULL, NULL),
	(90, 36, 'ja', NULL, NULL, NULL),
	(91, 36, 'ko', NULL, NULL, NULL),
	(92, 36, 'zh', NULL, NULL, NULL),
	(93, 41, 'en', NULL, NULL, NULL),
	(94, 41, 'vi', NULL, NULL, NULL),
	(95, 41, 'ja', NULL, NULL, NULL),
	(96, 41, 'ko', NULL, NULL, NULL),
	(97, 41, 'zh', NULL, NULL, NULL);
/*!40000 ALTER TABLE `metadata_translations` ENABLE KEYS */;

-- Dumping structure for table bwid.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.migrations: ~94 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2015_01_15_105324_create_roles_table', 1),
	(4, '2015_01_15_114412_create_role_user_table', 1),
	(5, '2015_01_26_115212_create_permissions_table', 1),
	(6, '2015_01_26_115523_create_permission_role_table', 1),
	(7, '2015_02_09_132439_create_permission_user_table', 1),
	(8, '2015_02_09_132440_create_jobs_table', 1),
	(9, '2015_02_09_132441_create_failed_jobs_table', 1),
	(10, '2017_08_02_161235_create_metadata_table', 1),
	(11, '2017_08_02_161500_create_metadata_translations_table', 1),
	(12, '2017_08_02_161500_create_object_media_table', 1),
	(13, '2017_08_15_081918_create_news_categories_table', 1),
	(14, '2017_08_15_081919_create_news_category_translation_table', 1),
	(15, '2017_08_15_081920_create_news_table', 1),
	(16, '2017_08_15_082746_create_news_translation_table', 1),
	(17, '2017_08_19_163304_create_country_table', 1),
	(18, '2017_08_19_163323_create_city_table', 1),
	(19, '2017_08_19_163425_create_country_translation_table', 1),
	(20, '2017_08_19_163454_create_city_translation_table', 1),
	(21, '2017_08_19_163801_create_career_forms_table', 1),
	(22, '2017_08_19_163803_create_career_categories_table', 1),
	(23, '2017_08_19_163804_create_career_category_translations_table', 1),
	(24, '2017_08_19_163805_create_career_levels_table', 1),
	(25, '2017_08_19_163806_create_career_level_translations_table', 1),
	(26, '2017_08_19_163807_create_career_degrees_table', 1),
	(27, '2017_08_19_163808_create_career_degrees_translations_table', 1),
	(28, '2017_08_19_163811_create_careers_table', 1),
	(29, '2017_08_19_163812_create_career_translation_table', 1),
	(30, '2017_08_19_164637_create_career_city_table', 1),
	(31, '2017_08_19_164836_create_career_apply_table', 1),
	(32, '2017_08_21_075538_create_product_categories_table', 1),
	(33, '2017_08_21_082412_create_product_category_translation_table', 1),
	(34, '2017_08_23_060601_create_catalogue_table', 1),
	(35, '2017_08_23_061037_create_catalogue_translation_table', 1),
	(36, '2017_09_01_063756_create_product_table', 1),
	(37, '2017_09_01_063846_create_product_translation_table', 1),
	(38, '2017_09_01_063847_create_product_block_table', 1),
	(39, '2017_09_01_063848_create_product_block_translation_table', 1),
	(40, '2017_09_01_064822_create_product_category_table', 1),
	(41, '2017_09_06_065336_create_branch_table', 1),
	(42, '2017_09_06_065419_create_branch_translation_table', 1),
	(43, '2017_09_09_153410_create_faq_categories_table', 1),
	(44, '2017_09_09_160058_create_faqs_table', 1),
	(45, '2017_09_09_161723_create_faq_category_translation_table', 1),
	(46, '2017_09_09_161749_create_faq_translation_table', 1),
	(47, '2017_09_09_161750_create_faq_questions_table', 1),
	(48, '2017_09_10_123504_create_slider_table', 1),
	(49, '2017_09_10_123532_create_slider_translation_table', 1),
	(50, '2017_09_12_135106_create_page_table', 1),
	(51, '2017_09_12_135107_add_parent_id_to_page_table', 1),
	(52, '2017_09_12_135135_create_page_translation_table', 1),
	(53, '2017_09_12_135136_create_page_blocks_table', 1),
	(54, '2017_09_12_135137_create_page_block_translations_table', 1),
	(55, '2017_09_27_061058_create_contacts_table', 1),
	(56, '2017_09_27_070829_create_systems_table', 1),
	(57, '2017_10_16_034756_create_image360_table', 1),
	(58, '2017_10_16_034916_create_image360_translation_table', 1),
	(59, '2017_11_02_133530_create_partner_table', 1),
	(60, '2017_11_02_133705_create_partner_translation_table', 1),
	(61, '2018_02_09_150016_create_image_map_table', 1),
	(62, '2018_02_09_150040_create_image_map_translation_table', 1),
	(63, '2018_02_09_150902_create_image_area_table', 1),
	(64, '2018_02_09_150934_create_image_area_translation_table', 1),
	(65, '2018_03_12_153410_create_business_table', 1),
	(66, '2018_03_12_153411_create_business_translation_table', 1),
	(67, '2018_03_12_153412_create_target_table', 1),
	(68, '2018_03_12_153413_create_target_translation_table', 1),
	(69, '2018_03_12_153414_create_free_space_table', 1),
	(70, '2018_03_12_153415_create_free_space_translation_table', 1),
	(71, '2018_03_13_135923_create_book_spaces_table', 1),
	(72, '2018_03_13_141431_create_book_space_space_table', 1),
	(73, '2018_03_19_100739_create_register_sights_table', 1),
	(74, '2018_04_12_101316_create_gallery_table', 1),
	(75, '2018_04_13_094510_create_gallery_translation_table', 1),
	(76, '2018_04_26_100223_add_2attr_to_partner', 1),
	(77, '2018_05_23_100819_create_el_companies_table', 1),
	(78, '2018_05_24_144413_create_el_company_menus_table', 1),
	(79, '2018_05_28_115336_add_remember_token_el_company_table', 1),
	(80, '2018_05_29_091429_create_el_news_table', 1),
	(81, '2018_05_29_092743_create_el_faqs_table', 1),
	(82, '2018_05_29_093526_add_el_company_id_and_url_to_el_news_table', 1),
	(83, '2018_06_04_085342_create_rfp_table', 2),
	(84, '2017_08_15_081920_create_resource_table', 3),
	(85, '2017_08_15_082746_create_resource_translation_table', 3),
	(86, '2017_11_02_133530_create_team_table', 4),
	(87, '2017_11_02_133705_create_team_translation_table', 4),
	(88, '2018_08_09_115600_create_subscribe_table', 5),
	(89, '2018_09_10_112442_add_is_follow_column_to_contacts_table', 6),
	(90, '2018_06_27_145130_create_project_categories_table', 7),
	(91, '2018_06_27_145155_create_project_category_translations_table', 7),
	(92, '2018_06_27_145210_create_projects_table', 7),
	(93, '2018_06_27_145220_create_project_translations_table', 7),
	(94, '2018_09_13_131028_create_branch_project_categories_table', 8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table bwid.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_category_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `is_top` tinyint(4) NOT NULL DEFAULT '0',
  `publish_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_news_category_id_foreign` (`news_category_id`),
  KEY `news_active_index` (`active`),
  KEY `news_is_top_index` (`is_top`),
  CONSTRAINT `news_news_category_id_foreign` FOREIGN KEY (`news_category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.news: ~6 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `image`, `banner`, `news_category_id`, `active`, `is_top`, `publish_at`, `created_at`, `updated_at`) VALUES
	(1, '/upload/files/dream/img1.jpg', '/upload/files/dream/img1.jpg', NULL, 1, 1, '2018-06-06', '2018-06-12 09:26:37', '2018-06-12 09:26:37'),
	(2, '/upload/images/Ashley_Greene_DKNY_Campaign_6.png', '/upload/images/Ashley_Greene_DKNY_Campaign_6.png', NULL, 1, 1, '2018-06-07', '2018-06-12 14:36:29', '2018-06-12 14:36:29'),
	(3, '/upload/images/embedded_DKNY_Resort_2014_campaign.png', NULL, NULL, 1, 1, '2018-06-05', '2018-06-12 15:32:07', '2018-06-12 15:32:07'),
	(4, '/upload/images/dkny-campaign-ss-2013-21.png', NULL, NULL, 1, 1, '2018-05-29', '2018-06-12 15:33:18', '2018-06-12 15:33:18'),
	(5, '/upload/files/dream/img1.jpg', NULL, NULL, 1, 1, '2018-05-29', '2018-06-12 15:35:12', '2018-06-12 15:35:12'),
	(6, '/upload/files/dream/img6.jpg', NULL, NULL, 1, 1, '2018-05-28', '2018-06-12 15:39:26', '2018-06-12 15:39:26');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Dumping structure for table bwid.news_categories
CREATE TABLE IF NOT EXISTS `news_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_categories_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.news_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_categories` ENABLE KEYS */;

-- Dumping structure for table bwid.news_category_translation
CREATE TABLE IF NOT EXISTS `news_category_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_category_translation_news_category_id_locale_unique` (`news_category_id`,`locale`),
  KEY `news_category_translation_locale_index` (`locale`),
  CONSTRAINT `news_category_translation_news_category_id_foreign` FOREIGN KEY (`news_category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.news_category_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `news_category_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_category_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.news_translation
CREATE TABLE IF NOT EXISTS `news_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translation_news_id_locale_unique` (`news_id`,`locale`),
  KEY `news_translation_locale_index` (`locale`),
  CONSTRAINT `news_translation_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.news_translation: ~12 rows (approximately)
/*!40000 ALTER TABLE `news_translation` DISABLE KEYS */;
INSERT INTO `news_translation` (`id`, `news_id`, `locale`, `title`, `slug`, `description`, `content`) VALUES
	(1, 1, 'en', 'Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.', 'ho-chi-minh-citys-empire-city-is-the-latest-design-by-an-influential-european-architect-in-asia-to-incorporate-plants-into-physical-man-made-structures', NULL, '<div>\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.</p>\r\n\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.</p>\r\n\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n</div>'),
	(2, 1, 'vi', 'Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.', 'ho-chi-minh-citys-empire-city-is-the-latest-design-by-an-influential-european-architect-in-asia-to-incorporate-plants-into-physical-man-made-structures', NULL, '<div>\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.</p>\r\n\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ho Chi Minh City’s “Empire City” is the latest design by an influential European architect in Asia to incorporate plants into physical man-made structures.</p>\r\n\r\n<p>The complex located on the Saigon River will consist of three skyscrapers placed on top of a garden mountain-inspired structure. The tallest, the 88 Tower will reach a height of about 333 metres – far higher than the city’s current tallest building, the 262-metre Bitexco Financial Tower. Its 88 floors will contain residences, office-space, a hotel and a public observation deck.</p>\r\n\r\n<p>Continuing the garden-theme, German-born architect Ole Scheeren, famous for designing the CTBUH-award winning CCTV building in Beijing, has created a multi-level platform in the middle of the tower that will play host to the “sky forest”, an inside/outside garden inspired by Vietnam‘s famous terraced rice fields.</p>\r\n\r\n<p>Plans for Empire City have been unveiled fresh off the completion of Scheeren’s firm’s three other Asian developments this year: the MahaNakhon skyscraper in Bangkok, the DUO towers in Singapore and the Guardian Art Center in Beijing.</p>\r\n</div>'),
	(3, 2, 'en', 'Tin test thử en', 'tin-test-thu-en', NULL, '<div>\r\n<p>Note that views which&nbsp;<code>extend</code>&nbsp;a Blade layout simply override sections from the layout. Content of the layout can be included in a child view using the&nbsp;<code>@parent</code>&nbsp;directive in a section, allowing you to append to the contents of a layout section such as a sidebar or footer.</p>\r\n\r\n<p>Sometimes, such as when you are not sure if a section has been defined, you may wish to pass a default value to the&nbsp;<code>@yield</code>&nbsp;directive.&nbsp;</p>\r\n</div>'),
	(4, 2, 'vi', 'Tin test thử vi', 'tin-test-thu-vi', NULL, '<div>\r\n<p>Note that views which&nbsp;<code>extend</code>&nbsp;a Blade layout simply override sections from the layout. Content of the layout can be included in a child view using the&nbsp;<code>@parent</code>&nbsp;directive in a section, allowing you to append to the contents of a layout section such as a sidebar or footer.</p>\r\n\r\n<p>Sometimes, such as when you are not sure if a section has been defined, you may wish to pass a default value to the&nbsp;<code>@yield</code>&nbsp;directive.&nbsp;</p>\r\n</div>'),
	(5, 3, 'en', 'Twelve killed as rains hit Bangladesh', 'twelve-killed-as-rains-hit-bangladesh', NULL, '<div>\r\n<div>\r\n<div>ReutersJUNE 12, 20185:16PM</div>\r\n</div>\r\n\r\n<div>\r\n<article>\r\n<p>Landslides and related incidents triggered by pre-monsoon rain in southeast Bangladesh have killed at least 12 people, including two Rohingya Muslims.</p>\r\n\r\n<div>\r\n<p>The deaths happened in the districts of Cox\'s Bazar and Rangamati - both bordering Myanmar from where hundreds of thousands of Rohingya have fled a military crackdown - due to incessant rain over the past three days, government officials said on Tuesday.</p>\r\n\r\n<p>One of the two Rohingya casualties in Cox\'s Bazar was a two-and-half-year-old boy who died when a mud wall fell on him and his mother. The injured mother is in hospital. A Rohingya man was killed when a tree, weakened by rainfall, fell on him.</p>\r\n\r\n<p>Most Rohingya refugees live in shacks made of bamboo and plastic sheets that cling to steep, denuded hills in coastal Cox\'s Bazar. Their numbers have swelled since last August when an army operation in Myanmar, following Rohingya insurgents\' attacks on security forces, prompted an exodus to Bangladesh.</p>\r\n\r\n<p>Mohammad Shamsuddoha, a senior official in Bangladesh\'s refugee relief and repatriation commission, said around 1500 shacks have been damaged or destroyed since the weekend due to the rain.</p>\r\n\r\n<p>Nijhum Rokeya Ahmed, from the Bangladesh Meteorological Department, said there was a possibility of medium to heavy rain over the next 24 hours that could trigger further landslides in districts like Rangamati and Cox Bazar.</p>\r\n\r\n<p>The government is working with international aid agencies to quickly relocate an initial group of 100,000 Rohingya from the camps, said Mohammad Shah Kamal, the top civil servant in the Ministry of Disaster Management and Relief, who was visiting Cox\'s Bazar.</p>\r\n</div>\r\n</article>\r\n</div>\r\n</div>'),
	(6, 3, 'vi', 'Mười hai người thiệt mạng khi mưa đánh Bangladesh', 'muoi-hai-nguoi-thiet-mang-khi-mua-danh-bangladesh', NULL, '<div>\r\n<div>\r\n<div>ReutersJUNE 12, 20185:16PM</div>\r\n</div>\r\n\r\n<div>\r\n<article>\r\n<p>Landslides and related incidents triggered by pre-monsoon rain in southeast Bangladesh have killed at least 12 people, including two Rohingya Muslims.</p>\r\n\r\n<div>\r\n<p>The deaths happened in the districts of Cox\'s Bazar and Rangamati - both bordering Myanmar from where hundreds of thousands of Rohingya have fled a military crackdown - due to incessant rain over the past three days, government officials said on Tuesday.</p>\r\n\r\n<p>One of the two Rohingya casualties in Cox\'s Bazar was a two-and-half-year-old boy who died when a mud wall fell on him and his mother. The injured mother is in hospital. A Rohingya man was killed when a tree, weakened by rainfall, fell on him.</p>\r\n\r\n<p>Most Rohingya refugees live in shacks made of bamboo and plastic sheets that cling to steep, denuded hills in coastal Cox\'s Bazar. Their numbers have swelled since last August when an army operation in Myanmar, following Rohingya insurgents\' attacks on security forces, prompted an exodus to Bangladesh.</p>\r\n\r\n<p>Mohammad Shamsuddoha, a senior official in Bangladesh\'s refugee relief and repatriation commission, said around 1500 shacks have been damaged or destroyed since the weekend due to the rain.</p>\r\n\r\n<p>Nijhum Rokeya Ahmed, from the Bangladesh Meteorological Department, said there was a possibility of medium to heavy rain over the next 24 hours that could trigger further landslides in districts like Rangamati and Cox Bazar.</p>\r\n\r\n<p>The government is working with international aid agencies to quickly relocate an initial group of 100,000 Rohingya from the camps, said Mohammad Shah Kamal, the top civil servant in the Ministry of Disaster Management and Relief, who was visiting Cox\'s Bazar.</p>\r\n</div>\r\n</article>\r\n</div>\r\n</div>'),
	(7, 4, 'en', 'Out of the dark: North Koreans told of Trump-Kim summit', 'out-of-the-dark-north-koreans-told-of-trump-kim-summit', NULL, '<div>\r\n<p>The KCNA news agency said the two leaders will exchange "wide-ranging and profound views" during their meeting at the five-star Capella Hotel on Sentosa Island.</p>\r\n\r\n<p>It reported that the discussions are going to focus on "the issue of building a permanent and durable peacekeeping mechanism on the Korean peninsula, the issue of realising the denuclearisation of the Korean peninsula, and other issues of mutual concern".</p>\r\n</div>'),
	(8, 4, 'vi', 'Ra khỏi bóng tối: Bắc Triều Tiên nói về hội nghị thượng đỉnh Trump-Kim', 'ra-khoi-bong-toi-bac-trieu-tien-noi-ve-hoi-nghi-thuong-dinh-trump-kim', NULL, '<div>\r\n<p>The KCNA news agency said the two leaders will exchange "wide-ranging and profound views" during their meeting at the five-star Capella Hotel on Sentosa Island.</p>\r\n\r\n<p>It reported that the discussions are going to focus on "the issue of building a permanent and durable peacekeeping mechanism on the Korean peninsula, the issue of realising the denuclearisation of the Korean peninsula, and other issues of mutual concern".</p>\r\n</div>'),
	(9, 5, 'en', 'There’s a big reason Australians are skipping out on their dental check-ups', 'theres-a-big-reason-australians-are-skipping-out-on-their-dental-check-ups', NULL, '<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_f27fdb40a9a0dd5c931a332169472502" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_f27fdb40a9a0dd5c931a332169472502" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>BEING scared of the dentist can be understandable, especially when you are young. There is frightening looking tool that a stranger uses to prod and poke the inside of your mouth, what kid wouldn’t be afraid?</p>\r\n\r\n<div>\r\n<p>For some people, that fear sticks around even into adulthood, but there is a much bigger reason millions of Aussies are skipping out on their regular dental check up.</p>\r\n\r\n<p><a href="http://finder.com.au/health-insurance/dental" target="_blank">Finder.com.au</a>&nbsp;surveyed over 2000 Australians and found that the equivalent of 12.6 million people have purposefully avoided the dentist, with and the biggest reason having to do with money.</p>\r\n\r\n<p>The research found that a massive 41 per cent of people listed high costs as their main reason for not visiting the dentist.</p>\r\n\r\n<p><b><a href="https://www.news.com.au/lifestyle/health/health-problems/screwdriver-surgically-removed-after-dental-mishap/news-story/01d30b11ecf65eb98414ad07513ff761" target="_blank">READ: Man’s horror $20k dentist visit</a></b></p>\r\n\r\n<p>Fear was the second most cited reason, with 20 per cent scared of needles, pain or just the dentist office itself. Laziness headed up third place, with 13 per cent of people claiming they just “never get around to it”.</p>\r\n\r\n<div>\r\n<div><img alt="The reasons why Aussies are skipping out on the dentist. Picture: Finder.com.au/Supplied" height="365" src="https://cdn.newsapi.com.au/image/v1/733d35d77f1f63c0afff0dd1b54e6856?width=650" width="650" /></div>\r\n\r\n<p>The reasons why Aussies are skipping out on the dentist. Picture: Finder.com.au/Supplied<em>Source:Supplied</em></p>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_2c8e1d8651d1b080f79071795535d383" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_2c8e1d8651d1b080f79071795535d383" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>The study found that women are more likely to avoid a trip to the dentist, with 47 per cent of women saying it is too expensive compared to 36 per cent of men.</p>\r\n\r\n<p>Whatever your reason might be for skipping out on visit to the dental chair, it could be doing more harm than you realise, with dental complications being the third biggest cause of preventable hospitalisations in the country.</p>\r\n\r\n<p>[SLIDER1]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Only one in three Australians said they keep up to date with their dental visits, which is why more than 63,000 Australians are hospitalised each year for preventable dental conditions, according to the National Oral Health Plan.</p>\r\n\r\n<div>\r\n<div><iframe frameborder="0" height="4" id="google_ads_iframe_/5129/ndm.lifestyle/lifestyle//health//healthproblems_5" marginheight="0" marginwidth="0" name="google_ads_iframe_/5129/ndm.lifestyle/lifestyle//health//healthproblems_5" scrolling="no" srcdoc="" title="3rd party ad content" width="4"></iframe></div>\r\n</div>\r\n\r\n<p>Health insurance expert at Finder.com.au, Bessie Hassan, said it was astounding that dental issues were so common in Australia.</p>\r\n\r\n<p>“It’s hard to believe that oral health is a problem for a first-world country like Australia,” she said.</p>\r\n\r\n<p>“Oral disease is among the most common and costly health problems experienced by Australians yet many can just not afford to see a dentist.”</p>\r\n\r\n<div>\r\n<div><img alt="Over 63,000 Australians are hospitalised each year for preventable dental issues. Picture: iStock" height="487" src="https://cdn.newsapi.com.au/image/v1/b561a51fe14ce96f0bf25132f0e3b04f?width=650" width="650" /></div>\r\n\r\n<p>Over 63,000 Australians are hospitalised each year for preventable dental issues. Picture: iStock<em>Source:Supplied</em></p>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_5f71cc7b85409e35938df1bfdfb454c9" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_5f71cc7b85409e35938df1bfdfb454c9" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>Another reason respondents said they were putting off a dentist visit was that they knew they needed major dental work and instead of dealing with it they were avoiding it all together.</p>\r\n\r\n<p>A shocking 25 per cent of Australian adults are living with untreated tooth decay and in 2016 the Australian Bureau of Statistics found that there were 846 oral cancer deaths in the country.</p>\r\n\r\n<p>Government figures show Australians are three times more likely to delay seeing a dentist than a GP but Ms Hassan says we shouldn’t be so complacent.</p>\r\n\r\n<p>“As a nation we are well practised at justifying avoiding the dentist but the consequences could be major,” Ms Hassan said.</p>\r\n\r\n<p>Insurance was another reason Aussies say they aren’t paying attention to oral health, with Ms Hassan saying it was important to know exactly what you were covered for.</p>\r\n\r\n<p>“Even the most basic extras cover usually has generous general dental inclusions,” she said.</p>\r\n\r\n<p>“If you are paying for it, you might as well use it.”</p>\r\n\r\n<p>[SLIDER2]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ms Hassan added that if you couldn’t afford a private dentist but had a concession card then you should visit a public dental service.</p>\r\n\r\n<p>“These services are provided free to eligible people and in every state and territory in Australia,” she said.</p>\r\n</div>\r\n</div>'),
	(10, 5, 'vi', 'Có một lý do lớn khiến người Úc bỏ qua kiểm tra răng miệng của họ', 'co-mot-ly-do-lon-khien-nguoi-uc-bo-qua-kiem-tra-rang-mieng-cua-ho', 'dssds', '<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_f27fdb40a9a0dd5c931a332169472502" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_f27fdb40a9a0dd5c931a332169472502" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>BEING scared of the dentist can be understandable, especially when you are young. There is frightening looking tool that a stranger uses to prod and poke the inside of your mouth, what kid wouldn’t be afraid?</p>\r\n\r\n<div>\r\n<p>For some people, that fear sticks around even into adulthood, but there is a much bigger reason millions of Aussies are skipping out on their regular dental check up.</p>\r\n\r\n<p><a href="http://finder.com.au/health-insurance/dental" target="_blank">Finder.com.au</a>&nbsp;surveyed over 2000 Australians and found that the equivalent of 12.6 million people have purposefully avoided the dentist, with and the biggest reason having to do with money.</p>\r\n\r\n<p>The research found that a massive 41 per cent of people listed high costs as their main reason for not visiting the dentist.</p>\r\n\r\n<p><b><a href="https://www.news.com.au/lifestyle/health/health-problems/screwdriver-surgically-removed-after-dental-mishap/news-story/01d30b11ecf65eb98414ad07513ff761" target="_blank">READ: Man’s horror $20k dentist visit</a></b></p>\r\n\r\n<p>Fear was the second most cited reason, with 20 per cent scared of needles, pain or just the dentist office itself. Laziness headed up third place, with 13 per cent of people claiming they just “never get around to it”.</p>\r\n\r\n<div>\r\n<div><img alt="The reasons why Aussies are skipping out on the dentist. Picture: Finder.com.au/Supplied" height="365" src="https://cdn.newsapi.com.au/image/v1/733d35d77f1f63c0afff0dd1b54e6856?width=650" width="650" /></div>\r\n\r\n<p>The reasons why Aussies are skipping out on the dentist. Picture: Finder.com.au/Supplied<em>Source:Supplied</em></p>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_2c8e1d8651d1b080f79071795535d383" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_2c8e1d8651d1b080f79071795535d383" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>The study found that women are more likely to avoid a trip to the dentist, with 47 per cent of women saying it is too expensive compared to 36 per cent of men.</p>\r\n\r\n<p>Whatever your reason might be for skipping out on visit to the dental chair, it could be doing more harm than you realise, with dental complications being the third biggest cause of preventable hospitalisations in the country.</p>\r\n\r\n<p>[SLIDER]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Only one in three Australians said they keep up to date with their dental visits, which is why more than 63,000 Australians are hospitalised each year for preventable dental conditions, according to the National Oral Health Plan.</p>\r\n\r\n<div>\r\n<div><iframe frameborder="0" height="4" id="google_ads_iframe_/5129/ndm.lifestyle/lifestyle//health//healthproblems_5" marginheight="0" marginwidth="0" name="google_ads_iframe_/5129/ndm.lifestyle/lifestyle//health//healthproblems_5" scrolling="no" srcdoc="" title="3rd party ad content" width="4"></iframe></div>\r\n</div>\r\n\r\n<p>Health insurance expert at Finder.com.au, Bessie Hassan, said it was astounding that dental issues were so common in Australia.</p>\r\n\r\n<p>“It’s hard to believe that oral health is a problem for a first-world country like Australia,” she said.</p>\r\n\r\n<p>“Oral disease is among the most common and costly health problems experienced by Australians yet many can just not afford to see a dentist.”</p>\r\n\r\n<div>\r\n<div><img alt="Over 63,000 Australians are hospitalised each year for preventable dental issues. Picture: iStock" height="487" src="https://cdn.newsapi.com.au/image/v1/b561a51fe14ce96f0bf25132f0e3b04f?width=650" width="650" /></div>\r\n\r\n<p>Over 63,000 Australians are hospitalised each year for preventable dental issues. Picture: iStock<em>Source:Supplied</em></p>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_5f71cc7b85409e35938df1bfdfb454c9" frameborder="0" scrolling="no"></iframe><iframe></iframe></div>\r\n\r\n<div><iframe align="top" data-kiosked-adframe="outer" data-kioskid="k_5f71cc7b85409e35938df1bfdfb454c9" frameborder="0" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-scripts allow-same-origin" scrolling="no"></iframe><iframe></iframe></div>\r\n</div>\r\n\r\n<div>\r\n<div>Ads by&nbsp;<a href="http://kiosked.com/" target="_blank">Kiosked</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<p>Another reason respondents said they were putting off a dentist visit was that they knew they needed major dental work and instead of dealing with it they were avoiding it all together.</p>\r\n\r\n<p>A shocking 25 per cent of Australian adults are living with untreated tooth decay and in 2016 the Australian Bureau of Statistics found that there were 846 oral cancer deaths in the country.</p>\r\n\r\n<p>Government figures show Australians are three times more likely to delay seeing a dentist than a GP but Ms Hassan says we shouldn’t be so complacent.</p>\r\n\r\n<p>“As a nation we are well practised at justifying avoiding the dentist but the consequences could be major,” Ms Hassan said.</p>\r\n\r\n<p>Insurance was another reason Aussies say they aren’t paying attention to oral health, with Ms Hassan saying it was important to know exactly what you were covered for.</p>\r\n\r\n<p>“Even the most basic extras cover usually has generous general dental inclusions,” she said.</p>\r\n\r\n<p>“If you are paying for it, you might as well use it.”</p>\r\n\r\n<p>[SLIDER2]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ms Hassan added that if you couldn’t afford a private dentist but had a concession card then you should visit a public dental service.</p>\r\n\r\n<p>“These services are provided free to eligible people and in every state and territory in Australia,” she said.</p>\r\n</div>\r\n</div>'),
	(11, 6, 'en', 'Australia\'s urban boom breathes new life into light rail', 'australias-urban-boom-breathes-new-life-into-light-rail', NULL, '<div>\r\n<div>\r\n<div>\r\n<p>SYDNEY/TOKYO -- Australia is quickly bringing back the street-level rail lines that used to dominate the country before automobiles rose to prominence, as urban centers swamped with transplants look to ease congestion.</p>\r\n\r\n<p>Sydney\'s 2.1 billion Australian dollar ($1.58 billion) light-rail project, which broke ground in 2015, will snake through 12km of cityscape after its expected completion next year. Because several of the 19 stops will be located on George Street, parts of the bustling city-center avenue have been shut down for construction.</p>\r\n\r\n<p>One set of carriages will carry 450 people, or five times the occupancy of a bus. The trains will arrive at a stop every four minutes during rush hours.</p>\r\n\r\n<p>To emphasize the renewed focus away from automobiles, the surrounding state of New South Wales will ban cars, buses and other vehicles from operating within a 1km stretch of George Street.</p>\r\n\r\n<p>As the planner of the project, New South Wales has opted for a public-private partnership to construct and manage the system. The corporate consortium includes the likes of French carriage maker Alstom, Spanish new-energy infrastructure provider Acciona, and French public-mobility company Transdev.</p>\r\n\r\n<p>New South Wales is bringing back the tram in response to the sharp population increase in Sydney, the state capital. Largely as a result of Asian migrants, the city\'s residents have jumped from roughly 4 million in 2007 to 4.7 million last year, contributing to serious traffic snarls during rush hour.&nbsp;The population is projected to rise by an additional million in the next decade, and downtown commuters could swell by 25%.</p>\r\n\r\n<p>The George Street tram was made possible by the success of another light-rail line serving the western metropolitan area. Opened in 1997, the Dulwich Hill Line was extended to 12.8km in 2014. Annual ridership rose to 10 million passengers, and reviews have been positive. One 36-year-old commuter said she likes the connection because it makes it easier to take her child on museum trips.</p>\r\n\r\n<p>Australia relied on streetcars from the 19th century until the first half of the 20th century. Sydney in particular used to be known as the tramway capital of the Southern Hemisphere. But Australia\'s expansive territory and low population density paved the way for an explosion of automobiles. Sydney\'s trams were blamed for causing traffic jams, and they were decommissioned by 1961.</p>\r\n\r\n<p>Now trams are&nbsp;<a href="https://asia.nikkei.com/Economy/Australia-boosts-infrastructure-spending-as-mining-boom-pops">being resurrected throughout the country</a>&nbsp;due to their negligible carbon footprint, and their accessibility for the elderly. Australia\'s capital of Canberra is spending over $500 million to construct a 12km connection between the city\'s center and the northern area. Work will wrap up this year, and there are plans to build an extension toward the south.</p>\r\n\r\n<p>As of the end of last year, 20km of tramway runs along Australia\'s Gold Coast tourist area. Similar plans have been floated for the southwestern city of Perth. &nbsp;</p>\r\n\r\n<p>But light-rail construction has grown more challenging than in the past, due to the presence of modern urban infrastructure. In Sydney, Acciona has reported unexpected expenses stemming from relocating parts of underground power and communication networks. The firm is suing New South Wales for A$1.2 billion to cover additional costs, and many critics say the project could be delayed past its 2019 deadline.</p>\r\n\r\n<p>Australia\'s return to tramways follows the same trajectory as the booming rail business in the Asia-Pacific region. According to European rail industry association UNIFE, the regional market is expected to average 58.9 billion euros ($68.7 billion) between 2019 and 2021, which would be an 18% expansion from the 2013-2015 average.</p>\r\n\r\n<p>While heavier vehicle traffic is driving the rise of railway projects, the more high-profile undertakings in Asia are exposed to political vagaries. Malaysia\'s newly installed government of Prime Minister Mahathir Mohamad&nbsp;<a href="https://asia.nikkei.com/Politics/Malaysia-in-transition/Malaysia-to-drop-high-speed-rail-link-to-Singapore">expressed its intentions</a>&nbsp;to cancel a connection between Kuala Lumpur and Singapore. On the other hand, smaller urban links are less prone to being scrapped entirely.</p>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe aria-hidden="true" frameborder="0" height="1" id="google_ads_iframe_7049/NikkeiFT_PC_Inread_video_0" marginheight="0" marginwidth="0" name="google_ads_iframe_7049/NikkeiFT_PC_Inread_video_0" role="presentation" scrolling="no" srcdoc="" tabindex="-1" title="Advertisement" width="1"></iframe></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div>&nbsp;</div>\r\n</div>\r\n</div>'),
	(12, 6, 'vi', 'Australia\'s urban boom breathes new life into light rail', 'australias-urban-boom-breathes-new-life-into-light-rail', NULL, '<div>\r\n<div>\r\n<div>\r\n<p>SYDNEY/TOKYO -- Australia is quickly bringing back the street-level rail lines that used to dominate the country before automobiles rose to prominence, as urban centers swamped with transplants look to ease congestion.</p>\r\n\r\n<p>Sydney\'s 2.1 billion Australian dollar ($1.58 billion) light-rail project, which broke ground in 2015, will snake through 12km of cityscape after its expected completion next year. Because several of the 19 stops will be located on George Street, parts of the bustling city-center avenue have been shut down for construction.</p>\r\n\r\n<p>One set of carriages will carry 450 people, or five times the occupancy of a bus. The trains will arrive at a stop every four minutes during rush hours.</p>\r\n\r\n<p>To emphasize the renewed focus away from automobiles, the surrounding state of New South Wales will ban cars, buses and other vehicles from operating within a 1km stretch of George Street.</p>\r\n\r\n<p>As the planner of the project, New South Wales has opted for a public-private partnership to construct and manage the system. The corporate consortium includes the likes of French carriage maker Alstom, Spanish new-energy infrastructure provider Acciona, and French public-mobility company Transdev.</p>\r\n\r\n<p>New South Wales is bringing back the tram in response to the sharp population increase in Sydney, the state capital. Largely as a result of Asian migrants, the city\'s residents have jumped from roughly 4 million in 2007 to 4.7 million last year, contributing to serious traffic snarls during rush hour.&nbsp;The population is projected to rise by an additional million in the next decade, and downtown commuters could swell by 25%.</p>\r\n\r\n<p>The George Street tram was made possible by the success of another light-rail line serving the western metropolitan area. Opened in 1997, the Dulwich Hill Line was extended to 12.8km in 2014. Annual ridership rose to 10 million passengers, and reviews have been positive. One 36-year-old commuter said she likes the connection because it makes it easier to take her child on museum trips.</p>\r\n\r\n<p>Australia relied on streetcars from the 19th century until the first half of the 20th century. Sydney in particular used to be known as the tramway capital of the Southern Hemisphere. But Australia\'s expansive territory and low population density paved the way for an explosion of automobiles. Sydney\'s trams were blamed for causing traffic jams, and they were decommissioned by 1961.</p>\r\n\r\n<p>Now trams are&nbsp;<a href="https://asia.nikkei.com/Economy/Australia-boosts-infrastructure-spending-as-mining-boom-pops">being resurrected throughout the country</a>&nbsp;due to their negligible carbon footprint, and their accessibility for the elderly. Australia\'s capital of Canberra is spending over $500 million to construct a 12km connection between the city\'s center and the northern area. Work will wrap up this year, and there are plans to build an extension toward the south.</p>\r\n\r\n<p>As of the end of last year, 20km of tramway runs along Australia\'s Gold Coast tourist area. Similar plans have been floated for the southwestern city of Perth. &nbsp;</p>\r\n\r\n<p>But light-rail construction has grown more challenging than in the past, due to the presence of modern urban infrastructure. In Sydney, Acciona has reported unexpected expenses stemming from relocating parts of underground power and communication networks. The firm is suing New South Wales for A$1.2 billion to cover additional costs, and many critics say the project could be delayed past its 2019 deadline.</p>\r\n\r\n<p>Australia\'s return to tramways follows the same trajectory as the booming rail business in the Asia-Pacific region. According to European rail industry association UNIFE, the regional market is expected to average 58.9 billion euros ($68.7 billion) between 2019 and 2021, which would be an 18% expansion from the 2013-2015 average.</p>\r\n\r\n<p>While heavier vehicle traffic is driving the rise of railway projects, the more high-profile undertakings in Asia are exposed to political vagaries. Malaysia\'s newly installed government of Prime Minister Mahathir Mohamad&nbsp;<a href="https://asia.nikkei.com/Politics/Malaysia-in-transition/Malaysia-to-drop-high-speed-rail-link-to-Singapore">expressed its intentions</a>&nbsp;to cancel a connection between Kuala Lumpur and Singapore. On the other hand, smaller urban links are less prone to being scrapped entirely.</p>\r\n\r\n<div>\r\n<div>\r\n<div>\r\n<div><iframe aria-hidden="true" frameborder="0" height="1" id="google_ads_iframe_7049/NikkeiFT_PC_Inread_video_0" marginheight="0" marginwidth="0" name="google_ads_iframe_7049/NikkeiFT_PC_Inread_video_0" role="presentation" scrolling="no" srcdoc="" tabindex="-1" title="Advertisement" width="1"></iframe></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div>&nbsp;</div>\r\n</div>\r\n</div>');
/*!40000 ALTER TABLE `news_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.object_media
CREATE TABLE IF NOT EXISTS `object_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_media_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.object_media: ~0 rows (approximately)
/*!40000 ALTER TABLE `object_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_media` ENABLE KEYS */;

-- Dumping structure for table bwid.page
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `position` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_code_index` (`code`),
  KEY `page_group_code_index` (`group_code`),
  KEY `page_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.page: ~11 rows (approximately)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `parent_id`, `code`, `group_code`, `theme`, `active`, `position`, `created_at`, `updated_at`) VALUES
	(1, 0, 'HOME-PAGE', 'MAIN', 'home', 1, 1, '2018-05-30 15:49:49', '2018-06-11 15:01:43'),
	(2, 0, 'CONTACT', 'CONTACT', 'contact', 1, 0, '2018-06-01 09:35:42', '2018-06-11 15:01:32'),
	(15, 0, 'ABOUT', 'ABOUT', 'about_us', 1, 1, '2018-09-11 14:11:53', '2018-09-11 14:11:53'),
	(16, 0, 'VISION', 'ABOUT', 'about_us_vision', 1, 0, '2018-09-12 13:50:26', '2018-09-12 13:50:26'),
	(17, 0, 'MILESTONES', 'ABOUT', 'about_us_milestones', 1, 0, '2018-09-12 14:01:32', '2018-09-12 14:01:38'),
	(18, 0, 'FUND', 'ABOUT', 'about_us_fund', 1, 0, '2018-09-12 14:05:57', '2018-09-12 14:05:57'),
	(19, 0, 'MODEL', 'BUSINESS', 'business_model', 1, 0, '2018-09-12 14:26:36', '2018-09-12 14:26:36'),
	(20, 0, 'PROPERTY-TYPE', 'BUSINESS', 'business_property_type', 1, 0, '2018-09-12 14:35:43', '2018-09-12 14:35:43'),
	(21, 0, 'PRIVACY-POLICY', 'MAIN', 'privacy_policy', 1, 0, '2018-09-12 17:00:56', '2018-09-12 17:00:56'),
	(22, 0, 'PRESENCE', 'BUSINESS', 'our_presence', 1, 0, '2018-09-13 10:55:43', '2018-09-13 10:55:43'),
	(23, 0, 'TEAM', 'ABOUT', 'about_team', 1, 0, '2018-09-17 13:07:59', '2018-09-17 13:07:59');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Dumping structure for table bwid.page_block
CREATE TABLE IF NOT EXISTS `page_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_map_id` int(11) DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_block_page_id_foreign` (`page_id`),
  KEY `page_block_code_index` (`code`),
  KEY `page_block_types_index` (`types`),
  CONSTRAINT `page_block_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.page_block: ~39 rows (approximately)
/*!40000 ALTER TABLE `page_block` DISABLE KEYS */;
INSERT INTO `page_block` (`id`, `page_id`, `parent_id`, `code`, `types`, `icon`, `photo`, `image_map_id`, `position`, `created_at`, `updated_at`) VALUES
	(37, 1, 0, 'HOME', '["TYPE_DESCRIPTION"]', NULL, NULL, NULL, 0, '2018-06-11 09:40:17', '2018-06-11 09:40:17'),
	(238, 15, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-11 14:30:06', '2018-09-11 14:30:06'),
	(239, 16, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-12 13:50:26', '2018-09-12 13:50:26'),
	(240, 16, 0, 'BOX-VISION', '["TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-12 13:50:26', '2018-09-12 13:50:26'),
	(241, 17, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-12 14:01:32', '2018-09-12 14:03:02'),
	(242, 18, 0, 'INTRODUCE', '["TYPE_NAME"]', NULL, NULL, NULL, 0, '2018-09-12 14:05:57', '2018-09-12 14:05:57'),
	(243, 18, 242, '1', '["TYPE_NAME","TYPE_CONTENT","TYPE_ICON"]', '/upload/images/fund/fund-logo-1.png', NULL, NULL, 1, '2018-09-12 14:08:13', '2018-09-12 14:08:13'),
	(244, 18, 242, '2', '["TYPE_NAME","TYPE_CONTENT","TYPE_ICON"]', '/upload/images/fund/fund-logo-2.png', NULL, NULL, 2, '2018-09-12 14:08:13', '2018-09-12 14:08:13'),
	(246, 20, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-12 14:35:43', '2018-09-12 14:35:43'),
	(247, 2, 0, 'INTRODUCE', '["TYPE_NAME"]', NULL, NULL, NULL, 0, '2018-09-12 15:03:29', '2018-09-12 15:03:29'),
	(248, 2, 247, '1', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 1, '2018-09-12 15:06:54', '2018-09-12 15:06:54'),
	(249, 2, 247, '2', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 2, '2018-09-12 15:06:54', '2018-09-12 15:06:54'),
	(250, 2, 0, 'SUBJECT-CONTACT', '["TYPE_NAME"]', NULL, NULL, NULL, 0, '2018-09-12 15:10:39', '2018-09-12 15:10:39'),
	(251, 2, 250, '1', '["TYPE_NAME"]', NULL, NULL, NULL, 1, '2018-09-12 15:12:58', '2018-09-12 15:12:58'),
	(252, 2, 250, '2', '["TYPE_NAME"]', NULL, NULL, NULL, 2, '2018-09-12 15:12:58', '2018-09-12 15:12:58'),
	(253, 2, 250, '3', '["TYPE_NAME"]', NULL, NULL, NULL, 3, '2018-09-12 15:12:58', '2018-09-12 15:12:58'),
	(254, 2, 250, '4', '["TYPE_NAME"]', NULL, NULL, NULL, 4, '2018-09-12 15:12:58', '2018-09-12 15:12:58'),
	(255, 2, 250, '5', '["TYPE_NAME"]', NULL, NULL, NULL, 5, '2018-09-12 15:12:58', '2018-09-12 15:12:58'),
	(256, 1, 37, '1', '["TYPE_URL","TYPE_NAME","TYPE_DESCRIPTION","TYPE_PHOTO"]', NULL, '/upload/images/home/press-1.jpg', NULL, 0, '2018-09-12 15:52:28', '2018-09-12 15:52:28'),
	(257, 1, 37, '2', '["TYPE_URL","TYPE_NAME","TYPE_DESCRIPTION","TYPE_PHOTO"]', NULL, '/upload/images/home/presence-1.jpg', NULL, 1, '2018-09-12 15:52:28', '2018-09-12 15:52:49'),
	(258, 1, 37, '3', '["TYPE_URL","TYPE_NAME","TYPE_DESCRIPTION","TYPE_PHOTO"]', NULL, '/upload/images/home/lease-1.jpg', NULL, 2, '2018-09-12 15:52:28', '2018-09-12 15:52:49'),
	(259, 1, 37, '4', '["TYPE_URL","TYPE_NAME","TYPE_DESCRIPTION","TYPE_PHOTO"]', NULL, '/upload/images/home/career-1.jpg', NULL, 3, '2018-09-12 15:52:28', '2018-09-12 15:52:49'),
	(260, 21, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 1, '2018-09-12 17:00:56', '2018-09-12 17:27:38'),
	(261, 2, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:10:16', '2018-09-12 17:10:16'),
	(262, 15, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:22:48', '2018-09-12 17:22:48'),
	(263, 16, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:24:18', '2018-09-12 17:24:18'),
	(264, 17, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:24:33', '2018-09-12 17:24:33'),
	(265, 18, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:24:47', '2018-09-12 17:24:47'),
	(266, 19, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:26:31', '2018-09-12 17:26:31'),
	(267, 20, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:27:12', '2018-09-12 17:27:12'),
	(268, 21, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-12 17:27:27', '2018-09-12 17:27:27'),
	(269, 22, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-13 10:58:43', '2018-09-13 10:58:43'),
	(270, 19, 273, '1', '["TYPE_NAME","TYPE_CONTENT","TYPE_ICON"]', '/upload/images/icon/ic-business-1.svg', NULL, NULL, 0, '2018-09-13 16:06:59', '2018-09-13 16:08:00'),
	(271, 19, 273, '2', '["TYPE_NAME","TYPE_CONTENT","TYPE_ICON"]', '/upload/images/icon/ic-business-2.svg', NULL, NULL, 0, '2018-09-13 16:06:59', '2018-09-13 16:08:00'),
	(272, 19, 273, '3', '["TYPE_NAME","TYPE_CONTENT","TYPE_ICON"]', '/upload/images/icon/ic-business-3.svg', NULL, NULL, 0, '2018-09-13 16:06:59', '2018-09-13 16:08:00'),
	(273, 19, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-13 16:07:45', '2018-09-13 16:07:45'),
	(274, 19, 0, 'DEV', '["TYPE_NAME","TYPE_PHOTO_TRANSLATION"]', NULL, NULL, NULL, 0, '2018-09-13 16:12:56', '2018-09-13 16:12:56'),
	(275, 23, 0, 'BANNER', '["TYPE_URL"]', NULL, NULL, NULL, 0, '2018-09-17 13:07:59', '2018-09-17 13:07:59'),
	(276, 23, 0, 'INTRODUCE', '["TYPE_NAME","TYPE_CONTENT"]', NULL, NULL, NULL, 0, '2018-09-17 13:07:59', '2018-09-17 13:07:59');
/*!40000 ALTER TABLE `page_block` ENABLE KEYS */;

-- Dumping structure for table bwid.page_block_translation
CREATE TABLE IF NOT EXISTS `page_block_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_block_id` int(10) unsigned NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `photo_translation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_block_translation_page_block_id_locale_unique` (`page_block_id`,`locale`),
  KEY `page_block_translation_locale_index` (`locale`),
  CONSTRAINT `page_block_translation_page_block_id_foreign` FOREIGN KEY (`page_block_id`) REFERENCES `page_block` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.page_block_translation: ~87 rows (approximately)
/*!40000 ALTER TABLE `page_block_translation` DISABLE KEYS */;
INSERT INTO `page_block_translation` (`id`, `page_block_id`, `locale`, `photo_translation`, `url`, `name`, `description`, `content`) VALUES
	(119, 37, 'en', NULL, NULL, NULL, NULL, NULL),
	(120, 37, 'vi', NULL, NULL, NULL, NULL, NULL),
	(521, 238, 'en', NULL, NULL, 'OUR COMPANY', NULL, '<div>\r\n<p>Warburg Pincus, leading global private equity firm focused on growth investing, and Becamex IDC Corp, the largest industrial real estate developer in Vietnam, announced today the official launch of their joint venture BW Industrial Development Joint Stock Company (“BW Industrial”) in Vietnam.</p>\r\n\r\n<p>With over 2,000,000 square meters of projects under development and initial investment of over US$200 million, BW Industrial is the largest ‘for-rent’ industrial and logistics developer in Vietnam.</p>\r\n</div>'),
	(522, 238, 'vi', NULL, NULL, 'OUR COMPANY', NULL, '<div>\r\n<p>Warburg Pincus, leading global private equity firm focused on growth investing, and Becamex IDC Corp, the largest industrial real estate developer in Vietnam, announced today the official launch of their joint venture BW Industrial Development Joint Stock Company (“BW Industrial”) in Vietnam.</p>\r\n\r\n<p>With over 2,000,000 square meters of projects under development and initial investment of over US$200 million, BW Industrial is the largest ‘for-rent’ industrial and logistics developer in Vietnam.</p>\r\n</div>'),
	(523, 239, 'en', NULL, NULL, 'VISION & VALUES', NULL, '<div>\r\n<p>BW Industrial’s plan is to create the logistics and industrial platform of choice for leading MNCs, 3PLs and e-commerce companies, according to Mr. Jeffrey Perlman, Managing Director and Head of Southeast Asia of Warburg Pincus.</p>\r\n\r\n<p>“With a sizable population of nearly 100 million people and an increasingly diversified economy, manufacturing and domestic consumption have become the central areas of growth for Vietnam. We feel that our timing is just right to tap into these growth opportunities with the goal of taking Vietnam’s industrial and logistics value chain to the next level.” commented Mr. Perlman.</p>\r\n</div>'),
	(524, 239, 'vi', NULL, NULL, 'VISION & VALUES', NULL, '<div>\r\n<p>BW Industrial’s plan is to create the logistics and industrial platform of choice for leading MNCs, 3PLs and e-commerce companies, according to Mr. Jeffrey Perlman, Managing Director and Head of Southeast Asia of Warburg Pincus.</p>\r\n\r\n<p>“With a sizable population of nearly 100 million people and an increasingly diversified economy, manufacturing and domestic consumption have become the central areas of growth for Vietnam. We feel that our timing is just right to tap into these growth opportunities with the goal of taking Vietnam’s industrial and logistics value chain to the next level.” commented Mr. Perlman.</p>\r\n</div>'),
	(525, 240, 'en', NULL, NULL, NULL, NULL, '<div><div class="boxVision__image"><img src="/images/aboutus/arrow-vision.svg" alt=""></div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-1.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>JANUARY 23 2018</h4>\r\n                        <p>Company established</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-2.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>END OF 2018</h4>\r\n                        <p>Acquire more industrial land in strategic locations Complete master plan/ design and start construction on the 2 seed projectsprojects (i.e. My Phuoc and Bau Bang)</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-3.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>2019 PLAN</h4>\r\n                        <p>Following the successful execution in the Northern and Southern Economic Zones, BW Industrial expands to the Central Vietnam</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-4.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>2020 VISION</h4>\r\n                        <p>#1 For-rent Industrial Developer in Vietnam with a strong presence nationwide and expanding</p>\r\n                    </div>\r\n                </div>\r\n<pre>\r\n&lt;div class="boxVision__image"&gt;&lt;img src="/images/aboutus/arrow-vision.svg" alt=""&gt;&lt;/div&gt;\r\n&lt;div class="boxVision__item"&gt;\r\n    &lt;div class="boxVision__item__icon"&gt;&lt;img src="/images/aboutus/ic-about-1.svg" alt=""&gt;&lt;/div&gt;\r\n    &lt;div class="boxVision__item__content"&gt;\r\n        &lt;h4&gt;JANUARY 23 2018&lt;/h4&gt;\r\n        &lt;p&gt;Company established&lt;/p&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class="boxVision__item"&gt;\r\n    &lt;div class="boxVision__item__icon"&gt;&lt;img src="/images/aboutus/ic-about-2.svg" alt=""&gt;&lt;/div&gt;\r\n    &lt;div class="boxVision__item__content"&gt;\r\n        &lt;h4&gt;END OF 2018&lt;/h4&gt;\r\n        &lt;p&gt;Acquire more industrial land in strategic locations Complete master plan/ design and start construction on the 2 seed projectsprojects (i.e. My Phuoc and Bau Bang)&lt;/p&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class="boxVision__item"&gt;\r\n    &lt;div class="boxVision__item__icon"&gt;&lt;img src="/images/aboutus/ic-about-3.svg" alt=""&gt;&lt;/div&gt;\r\n    &lt;div class="boxVision__item__content"&gt;\r\n        &lt;h4&gt;2019 PLAN&lt;/h4&gt;\r\n        &lt;p&gt;Following the successful execution in the Northern and Southern Economic Zones, BW Industrial expands to the Central Vietnam&lt;/p&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class="boxVision__item"&gt;\r\n    &lt;div class="boxVision__item__icon"&gt;&lt;img src="/images/aboutus/ic-about-4.svg" alt=""&gt;&lt;/div&gt;\r\n    &lt;div class="boxVision__item__content"&gt;\r\n        &lt;h4&gt;2020 VISION&lt;/h4&gt;\r\n        &lt;p&gt;#1 For-rent Industrial Developer in Vietnam with a strong presence nationwide and expanding&lt;/p&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;</pre>\r\n</div>'),
	(526, 240, 'vi', NULL, NULL, NULL, NULL, '<div class="boxVision__image"><img src="/images/aboutus/arrow-vision.svg" alt=""></div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-1.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>JANUARY 23 2018</h4>\r\n                        <p>Company established</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-2.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>END OF 2018</h4>\r\n                        <p>Acquire more industrial land in strategic locations Complete master plan/ design and start construction on the 2 seed projectsprojects (i.e. My Phuoc and Bau Bang)</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-3.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>2019 PLAN</h4>\r\n                        <p>Following the successful execution in the Northern and Southern Economic Zones, BW Industrial expands to the Central Vietnam</p>\r\n                    </div>\r\n                </div>\r\n                <div class="boxVision__item">\r\n                    <div class="boxVision__item__icon"><img src="/images/aboutus/ic-about-4.svg" alt=""></div>\r\n                    <div class="boxVision__item__content">\r\n                        <h4>2020 VISION</h4>\r\n                        <p>#1 For-rent Industrial Developer in Vietnam with a strong presence nationwide and expanding</p>\r\n                    </div>\r\n                </div>'),
	(527, 241, 'en', NULL, NULL, 'Milestones', NULL, '<div class="timeline" data-waypoint="100%">\r\n<div class="timeline__item">\r\n<div class="timeline__year"><span>2018</span></div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">15 May</div>\r\n\r\n<div class="info">Official Launch</div>\r\n</div>\r\n</div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">23 January</div>\r\n\r\n<div class="info">BW Industrial</div>\r\n\r\n<div class="ml-auto">\r\n<div class="innerlogo"><img alt="" src="/images/aboutus/fund-logo-3.png" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="timeline__item">\r\n<div class="timeline__year"><span>2017</span></div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">19 September</div>\r\n\r\n<div class="info">MOU signed between <strong>Warburg Pincus &amp; Becamex</strong></div>\r\n\r\n<div class="ml-auto">\r\n<div class="innerlogo"><img alt="" src="/images/aboutus/fund-logo-4.png" /><img alt="" src="/images/aboutus/fund-logo-5.png" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>'),
	(528, 241, 'vi', NULL, NULL, 'Milestones', NULL, '<div class="timeline" data-waypoint="100%">\r\n<div class="timeline__item">\r\n<div class="timeline__year"><span>2018</span></div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">15 May</div>\r\n\r\n<div class="info">Official Launch</div>\r\n</div>\r\n</div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">23 January</div>\r\n\r\n<div class="info">BW Industrial</div>\r\n\r\n<div class="ml-auto">\r\n<div class="innerlogo"><img alt="" src="/images/aboutus/fund-logo-3.png" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class="timeline__item">\r\n<div class="timeline__year"><span>2017</span></div>\r\n\r\n<div class="timeline__item__content">\r\n<div class="timeline__item__content__des d-flex">\r\n<div class="date">19 September</div>\r\n\r\n<div class="info">MOU signed between <strong>Warburg Pincus &amp; Becamex</strong></div>\r\n\r\n<div class="ml-auto">\r\n<div class="innerlogo"><img alt="" src="/images/aboutus/fund-logo-4.png" /><img alt="" src="/images/aboutus/fund-logo-5.png" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>'),
	(529, 242, 'en', NULL, NULL, 'Fund management', NULL, NULL),
	(530, 242, 'vi', NULL, NULL, 'Fund management', NULL, NULL),
	(531, 243, 'en', NULL, NULL, 'About Becamex IDC', NULL, '<div>\r\n<p>Established in 1976, Becamex specializes in developing large-scale industrial townships with one of the largest industrial landbanks in key markets across Vietnam. Over the past 20 years, Becamex has been a pioneer in the industrial real estate industry in the country with the creation of over 10 world class industrial parks with Fortune 500 companies as its existing business partners and clients.</p>\r\n\r\n<p>Historically, Becamex has formed a number of partnerships with foreign players such as TOKYU Corporation, a major Tokyo-based infrastructure developer, and Sembcorp, a Temasek-sponsored industrial group through the Vietnam Singapore Industrial Park platform (“VSIP”), which is now widely recognized as one of the most successful industrial park developers in Vietnam with over $10 billion of investments to-date.</p>\r\n</div>'),
	(532, 243, 'vi', NULL, NULL, 'About Becamex IDC', NULL, '<div>\r\n<p>Established in 1976, Becamex specializes in developing large-scale industrial townships with one of the largest industrial landbanks in key markets across Vietnam. Over the past 20 years, Becamex has been a pioneer in the industrial real estate industry in the country with the creation of over 10 world class industrial parks with Fortune 500 companies as its existing business partners and clients.</p>\r\n\r\n<p>Historically, Becamex has formed a number of partnerships with foreign players such as TOKYU Corporation, a major Tokyo-based infrastructure developer, and Sembcorp, a Temasek-sponsored industrial group through the Vietnam Singapore Industrial Park platform (“VSIP”), which is now widely recognized as one of the most successful industrial park developers in Vietnam with over $10 billion of investments to-date.</p>\r\n</div>'),
	(533, 244, 'en', NULL, NULL, 'About Warburg Pincus', NULL, '<div>\r\n<p>Established in 1976, Becamex specializes in developing large-scale industrial townships with one of the largest industrial landbanks in key markets across Vietnam. Over the past 20 years, Becamex has been a pioneer in the industrial real estate industry in the country with the creation of over 10 world class industrial parks with Fortune 500 companies as its existing business partners and clients.</p>\r\n\r\n<p>Historically, Becamex has formed a number of partnerships with foreign players such as TOKYU Corporation, a major Tokyo-based infrastructure developer, and Sembcorp, a Temasek-sponsored industrial group through the Vietnam Singapore Industrial Park platform (“VSIP”), which is now widely recognized as one of the most successful industrial park developers in Vietnam with over $10 billion of investments to-date.</p>\r\n</div>'),
	(534, 244, 'vi', NULL, NULL, 'About Warburg Pincus', NULL, '<div>\r\n<p>Established in 1976, Becamex specializes in developing large-scale industrial townships with one of the largest industrial landbanks in key markets across Vietnam. Over the past 20 years, Becamex has been a pioneer in the industrial real estate industry in the country with the creation of over 10 world class industrial parks with Fortune 500 companies as its existing business partners and clients.</p>\r\n\r\n<p>Historically, Becamex has formed a number of partnerships with foreign players such as TOKYU Corporation, a major Tokyo-based infrastructure developer, and Sembcorp, a Temasek-sponsored industrial group through the Vietnam Singapore Industrial Park platform (“VSIP”), which is now widely recognized as one of the most successful industrial park developers in Vietnam with over $10 billion of investments to-date.</p>\r\n</div>'),
	(537, 246, 'en', NULL, NULL, 'Property type', NULL, '<div>Our focus is to leverage local strong relationships with tenants and development expertise to develop industrial real estate properties including: (i) Ready-built factories, (ii) Logistics warehouses and (iii) Built-to-suit projects and (iv) Sale &amp; Lease back</div>'),
	(538, 246, 'vi', NULL, NULL, 'Property type', NULL, '<div>Our focus is to leverage local strong relationships with tenants and development expertise to develop industrial real estate properties including: (i) Ready-built factories, (ii) Logistics warehouses and (iii) Built-to-suit projects and (iv) Sale &amp; Lease back</div>'),
	(539, 247, 'en', NULL, NULL, 'Contact us', NULL, NULL),
	(540, 247, 'vi', NULL, NULL, 'Contact us', NULL, NULL),
	(541, 248, 'en', NULL, NULL, 'Headquarter (Binh Duong)', NULL, '<ul class="location">\r\n                                    <li class="location__item"><i class="icon_pin"></i><strong>Address:</strong> 17/F Becamex Tower, 230 Binh Duong Boulevard, Phu Hoa Ward, Thu Dau Mot City, Binh Duong Province, Vietnam</li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Tel:</strong> <a href="#">(+84) 274 7300 472</a></li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Hotline:</strong> <a href="#">(+84) 899 514 468</a></li>\r\n                                    <li class="location__item"><i class="icon_mail"></i><strong>Email:</strong> <a href="#">enquiry@bwidjsc.com</a></li>\r\n                                </ul>'),
	(542, 248, 'vi', NULL, NULL, 'Headquarter (Binh Duong)', NULL, '<ul class="location">\r\n                                    <li class="location__item"><i class="icon_pin"></i><strong>Address:</strong> 17/F Becamex Tower, 230 Binh Duong Boulevard, Phu Hoa Ward, Thu Dau Mot City, Binh Duong Province, Vietnam</li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Tel:</strong> <a href="#">(+84) 274 7300 472</a></li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Hotline:</strong> <a href="#">(+84) 899 514 468</a></li>\r\n                                    <li class="location__item"><i class="icon_mail"></i><strong>Email:</strong> <a href="#">enquiry@bwidjsc.com</a></li>\r\n                                </ul>'),
	(543, 249, 'en', NULL, NULL, 'Branch Office (Bac Ninh)', NULL, '<ul class="location">\r\n                                    <li class="location__item"><i class="icon_pin"></i><strong>Address:</strong> No.1, Huu Nghi Road, VSIP Bac Ninh, Phu Chan Commune, Tu Son Town, Bac Ninh Province, Vietnam</li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Hotline:</strong> <a href="#">(+84) 899 516 099</a></li>\r\n                                    <li class="location__item"><i class="icon_mail"></i><strong>Email:</strong> <a href="#">enquiry@bwidjsc.com</a></li>\r\n                                </ul>'),
	(544, 249, 'vi', NULL, NULL, 'Branch Office (Bac Ninh)', NULL, '<ul class="location">\r\n                                    <li class="location__item"><i class="icon_pin"></i><strong>Address:</strong> No.1, Huu Nghi Road, VSIP Bac Ninh, Phu Chan Commune, Tu Son Town, Bac Ninh Province, Vietnam</li>\r\n                                    <li class="location__item"><i class="icon_phone"></i><strong>Hotline:</strong> <a href="#">(+84) 899 516 099</a></li>\r\n                                    <li class="location__item"><i class="icon_mail"></i><strong>Email:</strong> <a href="#">enquiry@bwidjsc.com</a></li>\r\n                                </ul>'),
	(545, 250, 'en', NULL, NULL, 'Subject', NULL, NULL),
	(546, 250, 'vi', NULL, NULL, 'Chủ đề', NULL, NULL),
	(547, 251, 'en', NULL, NULL, 'Employment', NULL, NULL),
	(548, 251, 'vi', NULL, NULL, 'Employment', NULL, NULL),
	(549, 252, 'en', NULL, NULL, 'Media Inquiry', NULL, NULL),
	(550, 252, 'vi', NULL, NULL, 'Media Inquiry', NULL, NULL),
	(551, 253, 'en', NULL, NULL, 'Investor Relations', NULL, NULL),
	(552, 253, 'vi', NULL, NULL, 'Investor Relations', NULL, NULL),
	(553, 254, 'en', NULL, NULL, 'Property For Lease Request', NULL, NULL),
	(554, 254, 'vi', NULL, NULL, NULL, NULL, NULL),
	(555, 255, 'en', NULL, NULL, 'Others', NULL, NULL),
	(556, 255, 'vi', NULL, NULL, 'Others', NULL, NULL),
	(557, 256, 'en', NULL, '#', 'Press Releases', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(558, 256, 'vi', NULL, '#', 'Press Releases', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(559, 257, 'en', NULL, '#', 'Our Presence', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(560, 257, 'vi', NULL, '#', 'Our Presence', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(561, 258, 'en', NULL, '#', 'Property for Lease', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(562, 258, 'vi', NULL, '#', 'Property for Lease', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(563, 259, 'en', NULL, '#', 'Careers', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(564, 259, 'vi', NULL, '#', 'Careers', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', NULL),
	(565, 260, 'en', NULL, NULL, 'Privacy Policy', NULL, '<div>Content Privacy Policy</div>'),
	(566, 260, 'vi', NULL, NULL, 'Privacy Policy', NULL, '<div>Nội dung&nbsp;Privacy Policy</div>'),
	(567, 261, 'en', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(568, 261, 'vi', NULL, NULL, NULL, NULL, NULL),
	(569, 262, 'en', NULL, NULL, NULL, NULL, NULL),
	(570, 262, 'vi', NULL, NULL, NULL, NULL, NULL),
	(571, 263, 'en', NULL, NULL, NULL, NULL, NULL),
	(572, 263, 'vi', NULL, NULL, NULL, NULL, NULL),
	(573, 264, 'en', NULL, NULL, NULL, NULL, NULL),
	(574, 264, 'vi', NULL, NULL, NULL, NULL, NULL),
	(575, 265, 'en', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(576, 265, 'vi', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(577, 266, 'en', NULL, NULL, NULL, NULL, NULL),
	(578, 266, 'vi', NULL, NULL, NULL, NULL, NULL),
	(579, 267, 'en', NULL, NULL, NULL, NULL, NULL),
	(580, 267, 'vi', NULL, NULL, NULL, NULL, NULL),
	(581, 268, 'en', NULL, NULL, NULL, NULL, NULL),
	(582, 268, 'vi', NULL, NULL, NULL, NULL, NULL),
	(583, 269, 'en', NULL, '/upload/images/banner/bg-business-model.jpg', NULL, NULL, NULL),
	(584, 269, 'vi', NULL, NULL, NULL, NULL, NULL),
	(585, 270, 'en', NULL, NULL, 'Industrial Real Estate Development', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth. We will be a key force in the industrial and logistics real estate sector driving the development and upgrade of other sectors such as manufacturing, logistics and processing in the country’s 4.0 industrial revolution.</div>'),
	(586, 270, 'vi', NULL, NULL, 'Industrial Real Estate Development', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth. We will be a key force in the industrial and logistics real estate sector driving the development and upgrade of other sectors such as manufacturing, logistics and processing in the country’s 4.0 industrial revolution.</div>'),
	(587, 271, 'en', NULL, NULL, 'Speedy Land Acquisitions in Key Economic Zones', NULL, '<div>We have acquired over 2,000,000 square meters of projects under development and initial investment of over US$200 million within only 60 days from our joint venture establishment date. Following the successful execution in the Northern and Southern Economic Zone, BW Industrial will enter the Central Economic with projects in Da Nang, Quang Ngai, and other cities.</div>'),
	(588, 271, 'vi', NULL, NULL, 'Speedy Land Acquisitions in Key Economic Zones', NULL, '<div>We have acquired over 2,000,000 square meters of projects under development and initial investment of over US$200 million within only 60 days from our joint venture establishment date. Following the successful execution in the Northern and Southern Economic Zone, BW Industrial will enter the Central Economic with projects in Da Nang, Quang Ngai, and other cities.</div>'),
	(589, 272, 'en', NULL, NULL, 'Supply Chain Consultancy & Value Added Services', NULL, '<div>With BW Industrial staffs\' expertise in many different fields, we support investors at all phases of their investment journey from obtaining investment certificate, business registration to recruiting, accounting supports.</div>'),
	(590, 272, 'vi', NULL, NULL, 'Supply Chain Consultancy & Value Added Services', NULL, '<div>With BW Industrial staffs\' expertise in many different fields, we support investors at all phases of their investment journey from obtaining investment certificate, business registration to recruiting, accounting supports.</div>'),
	(591, 273, 'en', NULL, NULL, 'Business model', NULL, '<div>Our road to number 1 is riding on 3 solid guiding principles of BW Industrial</div>'),
	(592, 273, 'vi', NULL, NULL, 'Business model', NULL, '<div>Our road to number 1 is riding on 3 solid guiding principles of BW Industrial</div>'),
	(593, 274, 'en', '/upload/images/business-model/business-model.png', NULL, 'Our road to number 1 is riding on 3 solid guiding principles of BW Industrial', NULL, NULL),
	(594, 274, 'vi', '/upload/images/business-model/business-model.png', NULL, 'Our road to number 1 is riding on 3 solid guiding principles of BW Industrial', NULL, NULL),
	(595, 265, 'ja', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(596, 265, 'ko', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(597, 265, 'zh', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(598, 275, 'en', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(599, 275, 'vi', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(600, 275, 'ja', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(601, 275, 'ko', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(602, 275, 'zh', NULL, '/upload/images/banner/bg-contact.jpg', NULL, NULL, NULL),
	(603, 276, 'en', NULL, NULL, 'Core management team', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth.</div>'),
	(604, 276, 'vi', NULL, NULL, 'Core management team', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth.</div>'),
	(605, 276, 'ja', NULL, NULL, 'Core management team', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth.</div>'),
	(606, 276, 'ko', NULL, NULL, 'Core management team', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth.</div>'),
	(607, 276, 'zh', NULL, NULL, 'Core management team', NULL, '<div>With a best-in-class management team, sizable land holdings and a strong pipeline of future projects, BW Industrial aims to satisfy the rising demand for modern logistics warehouses, build-to-suit and ready-built factories in addition to other industrial related products across all key industrial zones, a catalyst in driving Vietnams economic growth.</div>');
/*!40000 ALTER TABLE `page_block_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.page_translation
CREATE TABLE IF NOT EXISTS `page_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translation_page_id_locale_unique` (`page_id`,`locale`),
  KEY `page_translation_locale_index` (`locale`),
  CONSTRAINT `page_translation_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.page_translation: ~33 rows (approximately)
/*!40000 ALTER TABLE `page_translation` DISABLE KEYS */;
INSERT INTO `page_translation` (`id`, `page_id`, `locale`, `title`, `description`, `content`, `slug`) VALUES
	(1, 1, 'en', 'Home', 'This is home page', NULL, '/'),
	(2, 1, 'vi', 'Trang chủ', NULL, NULL, '/'),
	(3, 1, 'ja', NULL, NULL, NULL, '/'),
	(4, 1, 'ko', 'Korea', NULL, NULL, '/'),
	(5, 2, 'en', 'Contact us', 'Contact page description', NULL, 'contact'),
	(6, 2, 'vi', 'Liên hệ', 'Mô tả trang liên hệ', NULL, 'lien-he'),
	(7, 2, 'ja', NULL, NULL, NULL, NULL),
	(8, 2, 'ko', NULL, NULL, NULL, NULL),
	(37, 15, 'en', 'About us', NULL, NULL, 'about-us'),
	(38, 15, 'vi', 'Về chúng tôi', NULL, NULL, 've-chung-toi'),
	(39, 16, 'en', 'Vision & values', NULL, NULL, 'vision-and-value'),
	(40, 16, 'vi', 'Vision & values', NULL, NULL, 'vision-and-value'),
	(41, 17, 'en', 'Milestones', NULL, NULL, 'milestones'),
	(42, 17, 'vi', 'Milestones', NULL, NULL, 'milestones'),
	(43, 18, 'en', 'Fund management', NULL, NULL, 'fund-management'),
	(44, 18, 'vi', 'Fund management', NULL, NULL, 'fund-management'),
	(45, 19, 'en', 'Business model', NULL, NULL, 'business-model'),
	(46, 19, 'vi', 'Business model', NULL, NULL, 'business-model'),
	(47, 20, 'en', 'Property type', NULL, NULL, 'property-type'),
	(48, 20, 'vi', 'Property type', NULL, NULL, 'property-type'),
	(49, 21, 'en', 'Privacy Policy', NULL, NULL, 'privacy-policy'),
	(50, 21, 'vi', 'Privacy Policy', NULL, NULL, 'privacy-policy'),
	(51, 22, 'en', 'Our presence', NULL, NULL, 'our-presence'),
	(52, 22, 'vi', 'Our presence', NULL, NULL, 'our-presence'),
	(53, 1, 'zh', NULL, NULL, NULL, '/'),
	(54, 18, 'ja', NULL, NULL, NULL, NULL),
	(55, 18, 'ko', NULL, NULL, NULL, NULL),
	(56, 18, 'zh', NULL, NULL, NULL, NULL),
	(57, 23, 'en', 'Core management team', NULL, NULL, 'core-management-team'),
	(58, 23, 'vi', 'Core management team', NULL, NULL, 'core-management-team'),
	(59, 23, 'ja', 'Core management team', NULL, NULL, 'core-management-team'),
	(60, 23, 'ko', 'Core management team', NULL, NULL, 'core-management-team'),
	(61, 23, 'zh', 'Core management team', NULL, NULL, 'core-management-team');
/*!40000 ALTER TABLE `page_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.partner
CREATE TABLE IF NOT EXISTS `partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.partner: ~5 rows (approximately)
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` (`id`, `photo`, `position`, `logo`, `created_at`, `updated_at`) VALUES
	(5, NULL, 0, '/upload/images/partner/logo-01.png', '2018-06-07 16:24:14', '2018-09-13 10:20:37'),
	(6, NULL, 0, '/upload/images/partner/logo-02.png', '2018-06-07 16:24:38', '2018-09-13 10:21:29'),
	(7, NULL, 0, '/upload/images/partner/logo-03.png', '2018-06-07 16:25:06', '2018-09-13 10:21:47'),
	(8, NULL, 0, '/upload/images/partner/logo-04.png', '2018-06-07 16:25:44', '2018-09-13 10:22:02'),
	(9, NULL, 0, '/upload/images/partner/logo-05.png', '2018-06-07 16:26:00', '2018-09-13 10:22:23');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;

-- Dumping structure for table bwid.partner_translation
CREATE TABLE IF NOT EXISTS `partner_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_translation_partner_id_locale_unique` (`partner_id`,`locale`),
  KEY `partner_translation_locale_index` (`locale`),
  CONSTRAINT `partner_translation_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.partner_translation: ~10 rows (approximately)
/*!40000 ALTER TABLE `partner_translation` DISABLE KEYS */;
INSERT INTO `partner_translation` (`id`, `partner_id`, `locale`, `name`, `content`) VALUES
	(9, 5, 'en', 'BECAMEX', NULL),
	(10, 5, 'vi', 'BECAMEX', NULL),
	(11, 6, 'en', 'WB', NULL),
	(12, 6, 'vi', 'WB', NULL),
	(13, 7, 'en', 'CN', NULL),
	(14, 7, 'vi', 'CN', NULL),
	(15, 8, 'en', 'GC', NULL),
	(16, 8, 'vi', 'GC', NULL),
	(17, 9, 'en', 'Nest', NULL),
	(18, 9, 'vi', 'Nest', NULL);
/*!40000 ALTER TABLE `partner_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table bwid.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.permissions: ~61 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`) VALUES
	(169, 'Truy cập', 'admin.index', 'Truy cập', 'Admin', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(170, 'Truy cập', 'admin.news.index', 'Truy cập', 'Tin tức', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(171, 'Tạo', 'admin.news.create', 'Tạo', 'Tin tức', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(172, 'Sửa', 'admin.news.edit', 'Sửa', 'Tin tức', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(173, 'Xóa', 'admin.news.destroy', 'Xóa', 'Tin tức', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(174, 'Truy cập', 'admin.brochures.index', 'Truy cập', 'Tài liệu quảng cáo', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(175, 'Tạo', 'admin.brochures.create', 'Tạo', 'Tài liệu quảng cáo', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(176, 'Sửa', 'admin.brochures.edit', 'Sửa', 'Tài liệu quảng cáo', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(177, 'Xóa', 'admin.brochures.destroy', 'Xóa', 'Tài liệu quảng cáo', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(178, 'Truy cập', 'admin.theme.index', 'Truy cập', 'Bản mẫu', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(179, 'Tạo', 'admin.theme.create', 'Tạo', 'Bản mẫu', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(180, 'Sửa', 'admin.theme.edit', 'Sửa', 'Bản mẫu', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(181, 'Xóa', 'admin.theme.destroy', 'Xóa', 'Bản mẫu', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(182, 'Truy cập', 'admin.page.index', 'Truy cập', 'Trang', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(183, 'Tạo', 'admin.page.create', 'Tạo', 'Trang', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(184, 'Sửa', 'admin.page.edit', 'Sửa', 'Trang', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(185, 'Xóa', 'admin.page.destroy', 'Xóa', 'Trang', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(186, 'Truy cập', 'admin.contact.index', 'Truy cập', 'Liên hệ', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(187, 'Xóa', 'admin.contact.destroy', 'Xóa', 'Liên hệ', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(188, 'Truy cập', 'admin.slider.index', 'Truy cập', 'Băng rôn', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(189, 'Tạo', 'admin.slider.create', 'Tạo', 'Băng rôn', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(190, 'Sửa', 'admin.slider.edit', 'Sửa', 'Băng rôn', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(191, 'Xóa', 'admin.slider.destroy', 'Xóa', 'Băng rôn', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(192, 'Truy cập', 'admin.general.index', 'Truy cập', 'Thông tin chung', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(193, 'Tạo', 'admin.general.create', 'Tạo', 'Thông tin chung', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(194, 'Sửa', 'admin.general.edit', 'Sửa', 'Thông tin chung', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(195, 'Xóa', 'admin.general.destroy', 'Xóa', 'Thông tin chung', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(196, 'Truy cập', 'admin.user.index', 'Truy cập', 'Tài khoản', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(197, 'Tạo', 'admin.user.create', 'Tạo', 'Tài khoản', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(198, 'Sửa', 'admin.user.edit', 'Sửa', 'Tài khoản', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(199, 'Xóa', 'admin.user.destroy', 'Xóa', 'Tài khoản', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(200, 'Cấp quyền', 'admin.user.set.permission', 'Cấp quyền', 'Tài khoản', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(201, 'Truy cập', 'admin.role.index', 'Truy cập', 'Vai trò', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(202, 'Tạo', 'admin.role.create', 'Tạo', 'Vai trò', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(203, 'Sửa', 'admin.role.edit', 'Sửa', 'Vai trò', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(204, 'Xóa', 'admin.role.destroy', 'Xóa', 'Vai trò', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(205, 'Sửa', 'admin.system.edit', 'Sửa', 'Hệ thống', '2018-06-14 14:21:25', '2018-06-14 14:21:25'),
	(206, 'Truy cập', 'admin.subscribe.index', 'Truy cập', 'Subscribe', '2018-08-09 13:15:20', '2018-08-09 13:15:20'),
	(207, 'Xóa', 'admin.subscribe.destroy', 'Xóa', 'Subscribe', '2018-08-09 13:15:20', '2018-08-09 13:15:20'),
	(208, 'Truy cập', 'admin.register.index', 'Truy cập', 'Đăng ký theo dõi', '2018-09-10 11:44:43', '2018-09-10 11:44:43'),
	(209, 'Xóa', 'admin.register.destroy', 'Xóa', 'Đăng ký theo dõi', '2018-09-10 11:44:43', '2018-09-10 11:44:43'),
	(210, 'Truy cập', 'admin.project.category.index', 'Truy cập', 'Danh mục dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(211, 'Tạo', 'admin.project.category.create', 'Tạo', 'Danh mục dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(212, 'Sửa', 'admin.project.category.edit', 'Sửa', 'Danh mục dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(213, 'Xóa', 'admin.project.category.destroy', 'Xóa', 'Danh mục dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(214, 'Truy cập', 'admin.project.index', 'Truy cập', 'Dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(215, 'Tạo', 'admin.project.create', 'Tạo', 'Dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(216, 'Sửa', 'admin.project.edit', 'Sửa', 'Dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(217, 'Xóa', 'admin.project.destroy', 'Xóa', 'Dự án', '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(218, 'Truy cập', 'admin.partner.index', 'Truy cập', 'Đối tác', '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(219, 'Tạo', 'admin.partner.create', 'Tạo', 'Đối tác', '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(220, 'Sửa', 'admin.partner.edit', 'Sửa', 'Đối tác', '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(221, 'Xóa', 'admin.partner.destroy', 'Xóa', 'Đối tác', '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(222, 'Branch index', 'admin.branch.index', 'Branch index', 'Branch', '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(223, 'Create branch', 'admin.branch.create', 'Create branch', 'Branch', '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(224, 'Edit branch', 'admin.branch.edit', 'Edit branch', 'Branch', '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(225, 'Delete branch', 'admin.branch.destroy', 'Delete branch', 'Branch', '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(226, 'Truy cập', 'admin.team.index', 'Truy cập', 'Đội ngũ', '2018-09-17 13:11:29', '2018-09-17 13:11:29'),
	(227, 'Tạo', 'admin.team.create', 'Tạo', 'Đội ngũ', '2018-09-17 13:11:29', '2018-09-17 13:11:29'),
	(228, 'Sửa', 'admin.team.edit', 'Sửa', 'Đội ngũ', '2018-09-17 13:11:30', '2018-09-17 13:11:30'),
	(229, 'Xóa', 'admin.team.destroy', 'Xóa', 'Đội ngũ', '2018-09-17 13:11:30', '2018-09-17 13:11:30');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table bwid.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.permission_role: ~61 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(169, 169, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(170, 170, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(171, 171, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(172, 172, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(173, 173, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(174, 174, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(175, 175, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(176, 176, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(177, 177, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(178, 178, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(179, 179, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(180, 180, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(181, 181, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(182, 182, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(183, 183, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(184, 184, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(185, 185, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(186, 186, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(187, 187, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(188, 188, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(189, 189, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(190, 190, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(191, 191, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(192, 192, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(193, 193, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(194, 194, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(195, 195, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(196, 196, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(197, 197, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(198, 198, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(199, 199, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(200, 200, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(201, 201, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(202, 202, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(203, 203, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(204, 204, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(205, 205, 1, '2018-06-14 14:21:26', '2018-06-14 14:21:26'),
	(206, 206, 1, '2018-08-09 13:15:20', '2018-08-09 13:15:20'),
	(207, 207, 1, '2018-08-09 13:15:20', '2018-08-09 13:15:20'),
	(208, 208, 1, '2018-09-10 11:44:43', '2018-09-10 11:44:43'),
	(209, 209, 1, '2018-09-10 11:44:43', '2018-09-10 11:44:43'),
	(210, 210, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(211, 211, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(212, 212, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(213, 213, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(214, 214, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(215, 215, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(216, 216, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(217, 217, 1, '2018-09-11 15:46:18', '2018-09-11 15:46:18'),
	(218, 218, 1, '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(219, 219, 1, '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(220, 220, 1, '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(221, 221, 1, '2018-09-13 10:05:38', '2018-09-13 10:05:38'),
	(222, 222, 1, '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(223, 223, 1, '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(224, 224, 1, '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(225, 225, 1, '2018-09-13 11:16:41', '2018-09-13 11:16:41'),
	(226, 226, 1, '2018-09-17 13:11:30', '2018-09-17 13:11:30'),
	(227, 227, 1, '2018-09-17 13:11:30', '2018-09-17 13:11:30'),
	(228, 228, 1, '2018-09-17 13:11:30', '2018-09-17 13:11:30'),
	(229, 229, 1, '2018-09-17 13:11:30', '2018-09-17 13:11:30');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table bwid.permission_user
CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.permission_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;

-- Dumping structure for table bwid.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `is_product` tinyint(4) NOT NULL DEFAULT '1',
  `position` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product: ~0 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table bwid.product_block
CREATE TABLE IF NOT EXISTS `product_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_map_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_block_product_id_foreign` (`product_id`),
  KEY `product_block_type_index` (`type`),
  CONSTRAINT `product_block_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_block: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_block` ENABLE KEYS */;

-- Dumping structure for table bwid.product_block_translation
CREATE TABLE IF NOT EXISTS `product_block_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_block_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_translation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_block_translation_product_block_id_locale_unique` (`product_block_id`,`locale`),
  KEY `product_block_translation_locale_index` (`locale`),
  CONSTRAINT `product_block_translation_product_block_id_foreign` FOREIGN KEY (`product_block_id`) REFERENCES `product_block` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_block_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_block_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_block_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT '0',
  `is_top` tinyint(4) NOT NULL DEFAULT '0',
  `slider_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_parent_id_index` (`parent_id`),
  KEY `product_categories_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;

-- Dumping structure for table bwid.product_category
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_product_id_foreign` (`product_id`),
  KEY `product_category_category_id_foreign` (`category_id`),
  CONSTRAINT `product_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;

-- Dumping structure for table bwid.product_category_translation
CREATE TABLE IF NOT EXISTS `product_category_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_category_translation_product_category_id_locale_unique` (`product_category_id`,`locale`),
  KEY `product_category_translation_locale_index` (`locale`),
  CONSTRAINT `product_category_translation_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_category_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_category_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.product_translation
CREATE TABLE IF NOT EXISTS `product_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_translation_product_id_locale_unique` (`product_id`,`locale`),
  KEY `product_translation_locale_index` (`locale`),
  CONSTRAINT `product_translation_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.product_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pictures` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `features` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_category_id_index` (`category_id`),
  KEY `projects_active_index` (`active`),
  CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.projects: ~4 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `category_id`, `thumbnail`, `banner`, `phone`, `email`, `lat`, `lng`, `pictures`, `position`, `active`, `features`, `created_at`, `updated_at`) VALUES
	(1, 1, '/upload/images/property-type/logistic-2.jpg', '/upload/images/property-type/bg-property-type-detail.jpg', '+84 9012345678', 'namnguyen12041994@gmail.com', '2341234', '2345435234', '["\\/upload\\/images\\/property-type\\/property-1.jpg","\\/upload\\/images\\/property-type\\/property-2.jpg","\\/upload\\/images\\/property-type\\/property-3.jpg","\\/upload\\/images\\/property-type\\/property-4.jpg"]', 1, 1, '{"N32R213B9R":{"en":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"vi":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"icon":"\\/upload\\/images\\/feature\\/icon-features-1.svg"},"UL9A0O45FR":{"en":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"vi":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"icon":"\\/upload\\/images\\/feature\\/icon-features-2.svg"},"4o226g531m":{"en":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"vi":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"icon":"\\/upload\\/images\\/feature\\/icon-features-3.svg"},"kv1vqw0jbz":{"en":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"vi":{"title":"Lorem ipsum dolor sit amet, consectetur adipisicing elit","description":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde"},"icon":"\\/upload\\/images\\/feature\\/icon-features-4.svg"}}', '2018-09-11 16:57:00', '2018-09-12 13:25:31'),
	(3, 1, '/upload/images/property-type/logistic-3.jpg', '/upload/images/property-type/bg-property-type-detail.jpg', '+84 9012345678', 'namnguyen12041994@gmail.com', '2341234', '2345435234', '["\\/upload\\/images\\/property-type\\/property-1.jpg","\\/upload\\/images\\/property-type\\/property-2.jpg","\\/upload\\/images\\/property-type\\/property-3.jpg","\\/upload\\/images\\/property-type\\/property-4.jpg"]', 1, 1, '[]', '2018-09-11 16:57:00', '2018-09-12 11:56:21'),
	(7, 1, '/upload/images/property-type/logistic-8.jpg', '/upload/images/property-type/bg-property-type-detail.jpg', '+84 9012345678', 'namnguyen12041994@gmail.com', '2341234', '2345435234', '["\\/upload\\/images\\/property-type\\/property-1.jpg","\\/upload\\/images\\/property-type\\/property-2.jpg","\\/upload\\/images\\/property-type\\/property-3.jpg","\\/upload\\/images\\/property-type\\/property-4.jpg"]', 1, 1, '[]', '2018-09-11 16:57:00', '2018-09-12 11:56:36'),
	(8, 1, '/upload/images/property-type/logistic-1.jpg', '/upload/images/property-type/bg-property-type-detail.jpg', '+84 9012345678', 'namnguyen12041994@gmail.com', '2341234', '2345435234', '["\\/upload\\/images\\/property-type\\/property-1.jpg","\\/upload\\/images\\/property-type\\/property-2.jpg","\\/upload\\/images\\/property-type\\/property-3.jpg","\\/upload\\/images\\/property-type\\/property-4.jpg"]', 1, 1, '[]', '2018-09-11 16:57:00', '2018-09-12 11:56:42');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Dumping structure for table bwid.project_categories
CREATE TABLE IF NOT EXISTS `project_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_categories_active_index` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.project_categories: ~4 rows (approximately)
/*!40000 ALTER TABLE `project_categories` DISABLE KEYS */;
INSERT INTO `project_categories` (`id`, `position`, `thumbnail`, `banner`, `icon`, `active`, `created_at`, `updated_at`) VALUES
	(1, 2, '/upload/images/project-category/img1.jpg', '/upload/images/project-category/bg-logistic.jpg', '/upload/images/project-category/icon/ic_lw.png', 1, '2018-09-11 16:30:04', '2018-09-13 11:02:08'),
	(2, 1, '/upload/images/project-category/img2.jpg', '/upload/images/project-category/bg-logistic.jpg', '/upload/images/project-category/icon/ic_rbf.png', 1, '2018-09-11 16:31:19', '2018-09-13 11:01:56'),
	(3, 3, '/upload/images/project-category/img3.jpg', '/upload/images/project-category/bg-logistic.jpg', '/upload/images/project-category/icon/ic_btsp.png', 1, '2018-09-11 16:32:30', '2018-09-13 11:02:20'),
	(4, 4, '/upload/images/project-category/img4.jpg', '/upload/images/project-category/bg-logistic.jpg', '/upload/images/project-category/icon/ic_salb.png', 1, '2018-09-11 16:33:06', '2018-09-13 11:02:27');
/*!40000 ALTER TABLE `project_categories` ENABLE KEYS */;

-- Dumping structure for table bwid.project_category_translations
CREATE TABLE IF NOT EXISTS `project_category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_category_translations_project_category_id_locale_unique` (`project_category_id`,`locale`),
  KEY `project_category_translations_project_category_id_index` (`project_category_id`),
  KEY `project_category_translations_locale_index` (`locale`),
  CONSTRAINT `project_category_translations_project_category_id_foreign` FOREIGN KEY (`project_category_id`) REFERENCES `project_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.project_category_translations: ~8 rows (approximately)
/*!40000 ALTER TABLE `project_category_translations` DISABLE KEYS */;
INSERT INTO `project_category_translations` (`id`, `project_category_id`, `locale`, `name`, `slug`, `description`) VALUES
	(1, 1, 'en', 'Logistics Warehouses', 'logistics-warehouses', '<div>We aim to satisfy the rising demand for modern logistics warehouses in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(2, 1, 'vi', 'Logistics Warehouses', 'logistics-warehouses', '<div>We aim to satisfy the rising demand for modern logistics warehouses in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(3, 2, 'en', 'Ready-built factory', 'ready-built-factory', '<div>We aim to satisfy the rising demand for modern Ready-built factory in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(4, 2, 'vi', 'Ready-built factory', 'ready-built-factory', '<div>We aim to satisfy the rising demand for modern Ready-built factory in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(5, 3, 'en', 'Built-to-suit project', 'built-to-suit-project', '<div>We aim to satisfy the rising demand for modern Built-to-suit project in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(6, 3, 'vi', 'Built-to-suit project', 'built-to-suit-project', '<div>We aim to satisfy the rising demand for modern Built-to-suit project in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(7, 4, 'en', 'Sale and lease back', 'sale-and-lease-back', '<div>We aim to satisfy the rising demand for modern Sale and lease back in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>'),
	(8, 4, 'vi', 'Sale and lease back', 'sale-and-lease-back', '<div>We aim to satisfy the rising demand for modern Sale and lease back in Vietnam. Our land locations offers different warehouse purposes with proximity to Hanoi &amp; HCMC international airports as well as to international maritime gateway of the North (Hai Phong) &amp; South (Dong Nai).</div>');
/*!40000 ALTER TABLE `project_category_translations` ENABLE KEYS */;

-- Dumping structure for table bwid.project_translations
CREATE TABLE IF NOT EXISTS `project_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_translations_project_id_locale_unique` (`project_id`,`locale`),
  KEY `project_translations_project_id_index` (`project_id`),
  KEY `project_translations_locale_index` (`locale`),
  CONSTRAINT `project_translations_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.project_translations: ~8 rows (approximately)
/*!40000 ALTER TABLE `project_translations` DISABLE KEYS */;
INSERT INTO `project_translations` (`id`, `project_id`, `locale`, `name`, `slug`, `address`, `contact_person`, `description`) VALUES
	(1, 1, 'en', 'Building aute dolor', 'building-aute-dolor', '354 Ly Thuong kiet, Quan 10, HCM', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(2, 1, 'vi', 'Building aute dolor', 'building-aute-dolor', '354 Ly Thuong kiet, Quan 10, HCM', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(5, 3, 'en', 'Sed ut perspiciatis unde omnis iste natus error sit', 'sed-ut-perspiciatis-unde-omnis-iste-natus-error-sit', '20 Cong Quynh, Pham Ngu Lao, Quan 1, Ho Chi Minh', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(6, 3, 'vi', 'Sed ut perspiciatis unde omnis iste natus error sit', 'sed-ut-perspiciatis-unde-omnis-iste-natus-error-sit', '20 Cong Quynh, Pham Ngu Lao, Quan 1, Ho Chi Minh', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(7, 7, 'en', 'Excepteur sint occaecat', 'excepteur-sint-occaecat', '20 Cong Quynh, Pham Ngu Lao, Quan 1, Ho Chi Minh', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(8, 7, 'vi', 'Excepteur sint occaecat', 'excepteur-sint-occaecat', '20 Cong Quynh, Pham Ngu Lao, Quan 1, Ho Chi Minh', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(9, 8, 'en', 'Excepteur sint sasaa', 'excepteur-sint-sasaa', '354 Ly Thuong kiet, Quan 10, HCM', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>'),
	(10, 8, 'vi', 'Excepteur sint sasaa', 'excepteur-sint-sasaa', '354 Ly Thuong kiet, Quan 10, HCM', 'Mr. Smith', '<div>\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</div>');
/*!40000 ALTER TABLE `project_translations` ENABLE KEYS */;

-- Dumping structure for table bwid.register_sightseeing
CREATE TABLE IF NOT EXISTS `register_sightseeing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_people` smallint(6) NOT NULL DEFAULT '0',
  `country_id` int(10) unsigned NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_other` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `register_sightseeing_country_id_foreign` (`country_id`),
  KEY `register_sightseeing_business_id_foreign` (`business_id`),
  CONSTRAINT `register_sightseeing_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `register_sightseeing_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.register_sightseeing: ~0 rows (approximately)
/*!40000 ALTER TABLE `register_sightseeing` DISABLE KEYS */;
/*!40000 ALTER TABLE `register_sightseeing` ENABLE KEYS */;

-- Dumping structure for table bwid.rfp
CREATE TABLE IF NOT EXISTS `rfp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solution` text COLLATE utf8_unicode_ci,
  `requirement_detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.rfp: ~0 rows (approximately)
/*!40000 ALTER TABLE `rfp` DISABLE KEYS */;
/*!40000 ALTER TABLE `rfp` ENABLE KEYS */;

-- Dumping structure for table bwid.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', '', 100, '2018-05-30 11:47:35', '2018-05-30 11:47:35'),
	(2, 'User', 'user', '', 1, '2018-05-30 11:47:37', '2018-05-30 11:47:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table bwid.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.role_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2018-05-30 11:47:37', '2018-05-30 11:47:37'),
	(2, 1, 2, '2018-06-04 15:15:56', '2018-06-04 15:15:56');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table bwid.slider
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.slider: ~3 rows (approximately)
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` (`id`, `key`, `image`, `created_at`, `updated_at`) VALUES
	(3, 'HOME', '/upload/images/slider/slider-01.jpg', '2018-05-30 15:06:46', '2018-09-11 13:17:03'),
	(6, 'HOME', '/upload/images/slider/slider-01.jpg', '2018-09-11 13:18:35', '2018-09-11 13:18:35'),
	(7, 'HOME', '/upload/images/slider/slider-01.jpg', '2018-09-11 13:19:00', '2018-09-11 13:19:00');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;

-- Dumping structure for table bwid.slider_translation
CREATE TABLE IF NOT EXISTS `slider_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_translation_slider_id_locale_unique` (`slider_id`,`locale`),
  KEY `slider_translation_locale_index` (`locale`),
  CONSTRAINT `slider_translation_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.slider_translation: ~8 rows (approximately)
/*!40000 ALTER TABLE `slider_translation` DISABLE KEYS */;
INSERT INTO `slider_translation` (`id`, `slider_id`, `locale`, `name`, `description`, `link`) VALUES
	(9, 3, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#'),
	(10, 3, 'ja', NULL, NULL, NULL),
	(11, 3, 'ko', NULL, NULL, NULL),
	(12, 3, 'vi', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#'),
	(17, 6, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#'),
	(18, 6, 'vi', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#'),
	(19, 7, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#'),
	(20, 7, 'vi', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod', '#');
/*!40000 ALTER TABLE `slider_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.subscribe
CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.subscribe: ~0 rows (approximately)
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;

-- Dumping structure for table bwid.systems
CREATE TABLE IF NOT EXISTS `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.systems: ~21 rows (approximately)
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` (`id`, `key`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'email', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(2, 'contact_email', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(3, 'address', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(4, 'address_show_room', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(5, 'location', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(6, 'fax', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(7, 'phone', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(8, 'phone_bottom', NULL, '2018-09-13 14:34:34', '2018-09-13 14:35:13'),
	(9, 'google_analytic', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(10, 'chat_script', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(11, 'facebook', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(12, 'youtube', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(13, 'google', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(14, 'twitter', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(15, 'likedin', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(16, 'instagram', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(17, 'website_title', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(18, 'website_description', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(19, 'website_keywords', NULL, '2018-09-13 14:34:34', '2018-09-13 14:34:34'),
	(20, 'map_desktop', '/upload/images/branch/map.png', '2018-09-13 14:34:34', '2018-09-13 14:44:17'),
	(21, 'map_mobile', '/upload/images/branch/map-mb.png', '2018-09-13 14:34:34', '2018-09-13 14:44:17');
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;

-- Dumping structure for table bwid.systems_back
CREATE TABLE IF NOT EXISTS `systems_back` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `systems_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.systems_back: ~19 rows (approximately)
/*!40000 ALTER TABLE `systems_back` DISABLE KEYS */;
INSERT INTO `systems_back` (`id`, `key`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'email', 'info@empirectity.vn', '2018-05-31 16:06:04', '2018-06-12 10:31:28'),
	(2, 'address', '{"en":"Le Meridien Office Building  8\\/F, 3C Ton Duc Thang, District 1, Chi Minh City, Vietnam","vi":"T\\u00f2a nh\\u00e0 Le Meridien  8\\/F, 3C T\\u00f4n \\u0110\\u1ee9c Th\\u1eafng, Qu\\u1eadn 1, TP. H\\u1ed3 Ch\\u00ed Minh, Vi\\u1ec7t Nam"}', '2018-05-31 16:06:04', '2018-06-12 10:04:44'),
	(3, 'location', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(4, 'fax', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(5, 'phone', '+84 902 833 388', '2018-05-31 16:06:04', '2018-06-12 10:31:00'),
	(6, 'phone_bottom', '028. 3620.5900', '2018-05-31 16:06:04', '2018-06-12 10:31:00'),
	(7, 'google_analytic', NULL, '2018-05-31 16:06:04', '2018-06-01 14:31:11'),
	(8, 'chat_script', NULL, '2018-05-31 16:06:04', '2018-06-13 09:41:37'),
	(9, 'facebook', 'https://www.facebook.com/3forCom', '2018-05-31 16:06:04', '2018-05-31 16:47:28'),
	(10, 'youtube', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(11, 'google', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(12, 'twitter', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(13, 'likedin', NULL, '2018-05-31 16:06:04', '2018-06-01 14:31:11'),
	(14, 'website_title', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(15, 'website_description', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(16, 'website_keywords', NULL, '2018-05-31 16:06:04', '2018-05-31 16:06:04'),
	(17, 'address_show_room', '{"en":"2B Thu Thiem, District 2, HCMC","vi":"2B Th\\u1ee7 Thi\\u00eam, Qu\\u1eadn 2, TP.  H\\u1ed3 Ch\\u00ed Minh"}', '2018-06-12 09:57:25', '2018-06-12 10:10:56'),
	(18, 'contact_email', 'hiennv@3forcom.com', '2018-07-02 14:47:53', '2018-07-02 14:47:54'),
	(19, 'instagram', NULL, '2018-09-12 16:28:26', '2018-09-12 16:28:26');
/*!40000 ALTER TABLE `systems_back` ENABLE KEYS */;

-- Dumping structure for table bwid.target
CREATE TABLE IF NOT EXISTS `target` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.target: ~0 rows (approximately)
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;

-- Dumping structure for table bwid.target_translation
CREATE TABLE IF NOT EXISTS `target_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target_translation_target_id_locale_unique` (`target_id`,`locale`),
  KEY `target_translation_locale_index` (`locale`),
  CONSTRAINT `target_translation_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `target` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.target_translation: ~0 rows (approximately)
/*!40000 ALTER TABLE `target_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.team
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `team_category` int(11) NOT NULL DEFAULT '3',
  `link_twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_linkin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.team: ~4 rows (approximately)
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`id`, `avatar`, `order`, `team_category`, `link_twitter`, `link_facebook`, `link_google_plus`, `link_linkin`, `created_at`, `updated_at`) VALUES
	(1, '/upload/images/team/img1.jpg', 1, 1, 'twitter.com', 'facebook.com', 'plus.google.com', 'linkedIn.com', '2018-06-08 09:25:25', '2018-09-17 13:48:03'),
	(2, '/upload/images/team/img2.jpg', 1, 1, NULL, NULL, NULL, NULL, '2018-06-08 10:20:16', '2018-09-17 13:49:44'),
	(3, '/upload/images/team/img3.jpg', 3, 2, NULL, NULL, NULL, NULL, '2018-06-08 10:27:39', '2018-09-17 13:50:54'),
	(4, '/upload/images/team/img4.jpg', 4, 2, NULL, NULL, NULL, NULL, '2018-06-08 10:30:14', '2018-09-17 13:51:34');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;

-- Dumping structure for table bwid.team_translation
CREATE TABLE IF NOT EXISTS `team_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_translation_team_id_locale_unique` (`team_id`,`locale`),
  KEY `team_translation_locale_index` (`locale`),
  CONSTRAINT `team_translation_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.team_translation: ~20 rows (approximately)
/*!40000 ALTER TABLE `team_translation` DISABLE KEYS */;
INSERT INTO `team_translation` (`id`, `team_id`, `locale`, `name`, `position`, `description`) VALUES
	(1, 1, 'vi', 'Mr. CK Tong', 'CEO', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(2, 1, 'en', 'Mr. CK Tong', 'CEO', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(3, 2, 'en', 'Mr. Greg Ohan', 'Deputy CEO- Sales & Marketing', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(4, 2, 'vi', 'Mr. Greg Ohan', 'Deputy CEO- Sales & Marketing', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(5, 3, 'en', 'Mr. Vu Le', 'Deputy CEO-Construction', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(6, 3, 'vi', 'Mr. Vu Le', 'Deputy CEO-Construction', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(7, 4, 'en', 'Mr. Hai Nguyen', 'CFO', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(8, 4, 'vi', 'Mr. Hai Nguyen', 'CFO', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo.'),
	(19, 1, 'ja', 'Mr. CK Tong', NULL, NULL),
	(20, 1, 'ko', 'Mr. CK Tong', NULL, NULL),
	(21, 1, 'zh', 'Mr. CK Tong', 'CEO', NULL),
	(22, 2, 'ja', 'Mr. Greg Ohan', NULL, NULL),
	(23, 2, 'ko', 'Mr. Greg Ohan', NULL, NULL),
	(24, 2, 'zh', 'Mr. Greg Ohan', 'Deputy CEO- Sales & Marketing', NULL),
	(25, 3, 'ja', 'Mr. Vu Le', 'Deputy CEO-Construction', NULL),
	(26, 3, 'ko', 'Mr. Vu Le', 'Deputy CEO-Construction', NULL),
	(27, 3, 'zh', 'Mr. Vu Le', 'Deputy CEO-Construction', NULL),
	(28, 4, 'ja', 'Mr. Hai Nguyen', 'CFO', NULL),
	(29, 4, 'ko', 'Mr. Hai Nguyen', 'CFO', NULL),
	(30, 4, 'zh', 'Mr. Hai Nguyen', 'CFO', NULL);
/*!40000 ALTER TABLE `team_translation` ENABLE KEYS */;

-- Dumping structure for table bwid.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_logon` datetime DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `active_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_active_code_unique` (`active_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table bwid.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `last_logon`, `active`, `active_code`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@longhau.co', '$2y$10$gGNNrhv89SU4X/wah.zex./tfIXJ8HJl9dXKv4h0.5OkHMgRy7Usa', NULL, 1, '5b0e2ce962bce', NULL, '2018-05-30 11:47:37', '2018-05-30 11:47:37'),
	(2, 'Admin', 'admin@3forcom.com', '$2y$10$fF5ADjfYjO4r.0B9gsgyzuXPnQhkAY/C7Jbmnx4endWVhs0X3rd9O', NULL, 1, '5b14f53c15a90', 'RSe8GZNC7vR49ODMRgHdPzKG8zDaTEPRhaQvgtryHgEJ1QTgztgyV0I3A2fc', '2018-06-04 15:15:56', '2018-06-04 15:15:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

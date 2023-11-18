-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for opac
CREATE DATABASE IF NOT EXISTS `opac` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `opac`;

-- Dumping structure for table opac.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.banners: ~2 rows (approximately)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, '.', 'opac-is', 'http://localhost/storage/photos/1/banner12.jpg', '<h2><br></h2>', 'active', '2020-08-14 07:47:38', '2022-08-26 10:00:41');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Dumping structure for table opac.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.brands: ~5 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Square', 'square', 'active', '2020-08-14 10:23:00', '2020-08-14 10:23:00'),
	(2, 'Incepta', 'incepta', 'active', '2020-08-14 10:23:08', '2020-08-14 10:23:08'),
	(3, 'Beximco', 'beximco', 'active', '2020-08-14 10:23:48', '2020-08-14 10:23:48'),
	(4, 'Opsonin', 'bpsonin', 'active', '2020-08-14 10:24:08', '2020-08-14 10:24:08'),
	(6, 'ACI', 'aci', 'active', '2020-08-18 02:50:31', '2020-08-18 02:50:31');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table opac.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.carts: ~2 rows (approximately)
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
	(11, 9, NULL, 2, 190.00, 'new', 2, 380.00, '2020-08-18 03:08:35', '2020-08-18 03:17:03'),
	(15, 10, NULL, 30, 270.00, 'new', 1, 270.00, '2022-08-26 16:30:55', '2022-08-26 16:30:55');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;

-- Dumping structure for table opac.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.categories: ~7 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Gastrointestinal', 'c1', NULL, 'http://localhost/storage/photos/1/asd.jpg', 1, NULL, NULL, 'active', '2020-08-14 10:26:15', '2022-08-26 18:05:01'),
	(2, 'Diarrhea', 'c2', 'Description Bolbo na 2', 'http://localhost/storage/photos/1/asd2.jpg', 1, NULL, NULL, 'active', '2020-08-14 10:26:40', '2022-08-26 18:05:16'),
	(3, 'Vitamins', 'c3', NULL, 'http://localhost/storage/photos/1/asd3.jpg', 1, NULL, NULL, 'active', '2020-08-14 10:27:10', '2022-08-26 18:06:46'),
	(4, 'Sub Category 1', 'sc1', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 10:32:14', '2022-08-20 17:09:52'),
	(5, 'Sub Category 2', 'sc2', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 10:32:49', '2022-08-20 17:09:41'),
	(6, 'Sub Category 3', 'sc3', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 10:33:37', '2022-08-20 17:10:03');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table opac.coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.coupons: ~3 rows (approximately)
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'abc123', 'fixed', 30.00, 'active', NULL, NULL),
	(5, 'abcd', 'fixed', 50.00, 'active', '2020-08-18 02:54:58', '2020-08-18 02:54:58');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table opac.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table opac.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` longtext COLLATE utf8mb4_unicode_ci,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.messages: ~4 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
	(9, 'Samiur Rahman', 'Problem Category', 'mdsrer@gmail.com', NULL, 'as', 'I once took care of an elderly patient who wasn’t particularly interested in some of the preventive measures I was recommending. He liked to say “you gotta die of something.” True enough. But that’s no reason to ignore measures that could prevent deaths, especially the “low-hanging fruit” such as automobile accidents.\n\nWhen thinking about the most serious health problems, there are several ways of looking at them. For example, you might consider\n\nthe most common causes of death\nthe diseases and conditions of death people worry about the most\nthe causes of death that are somewhat unique to where you live.\nThese three lists are not the same. Let’s consider each.', '2022-08-26 18:28:25', '2022-08-22 12:04:55', '2022-08-26 18:28:25'),
	(10, 'samir', 'fsdgdfg sdfgf sfdgdfg dfgsd', 'rimassamiragent@gmail.com', NULL, NULL, 'daf adfad dfada adfd adsf asdf df', '2022-08-26 16:48:39', '2022-08-26 10:04:59', '2022-08-26 16:48:39'),
	(11, 'Samiur Rahman', 'fsdgdfg sdfgf sfdgdfg dfgsd', 'rimassamiragent@gmail.com', NULL, NULL, 'asd asddddddddddddddddddddddddddd', '2022-08-26 16:48:41', '2022-08-26 15:54:32', '2022-08-26 16:48:41'),
	(12, 'asdf', 'adsfasfasdf', 'rimassamiragent@gmail.com', NULL, 'adsfgasdfdsfdsfdsf', 'adfasd asdf adsfasdfsaaaaaaaaaaaaa', '2022-08-26 17:33:02', '2022-08-26 17:32:50', '2022-08-26 17:33:02');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table opac.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.migrations: ~20 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2020_07_10_021010_create_brands_table', 1),
	(5, '2020_07_10_025334_create_banners_table', 1),
	(6, '2020_07_10_112147_create_categories_table', 1),
	(7, '2020_07_11_063857_create_products_table', 1),
	(8, '2020_07_12_073132_create_post_categories_table', 1),
	(9, '2020_07_12_073701_create_post_tags_table', 1),
	(10, '2020_07_12_083638_create_posts_table', 1),
	(11, '2020_07_13_151329_create_messages_table', 1),
	(12, '2020_07_14_023748_create_shippings_table', 1),
	(13, '2020_07_15_054356_create_orders_table', 1),
	(14, '2020_07_15_102626_create_carts_table', 1),
	(15, '2020_07_16_041623_create_notifications_table', 1),
	(16, '2020_07_16_053240_create_coupons_table', 1),
	(17, '2020_07_23_143757_create_wishlists_table', 1),
	(18, '2020_07_24_074930_create_product_reviews_table', 1),
	(19, '2020_07_24_131727_create_post_comments_table', 1),
	(20, '2020_08_01_143408_create_settings_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table opac.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.notifications: ~14 rows (approximately)
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
	('18110d37-c674-4633-87e4-582ef8429271', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2022-08-25 15:04:19', '2022-08-25 15:04:19'),
	('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-15 13:31:21', '2020-08-15 13:31:21'),
	('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/4","fas":"fa-file-alt"}', NULL, '2020-08-15 13:54:52', '2020-08-15 13:54:52'),
	('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}', NULL, '2020-08-18 03:13:51', '2020-08-18 03:13:51'),
	('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', '2020-08-15 13:30:44', '2020-08-14 13:12:28', '2020-08-15 13:30:44'),
	('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage","fas":"fas fa-comment"}', NULL, '2020-08-15 13:51:02', '2020-08-15 13:51:02'),
	('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t","fas":"fa-star"}', NULL, '2020-08-15 13:44:07', '2020-08-15 13:44:07'),
	('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-14 13:11:03', '2020-08-14 13:11:03'),
	('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/1","fas":"fa-file-alt"}', NULL, '2020-08-14 13:20:44', '2020-08-14 13:20:44'),
	('a6265e39-f499-4ce7-8c6a-adb6964b425a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2022-08-21 18:15:01', '2022-08-21 18:15:01'),
	('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2020-08-18 03:17:03', '2020-08-18 03:17:03'),
	('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/2","fas":"fa-file-alt"}', '2020-08-15 10:17:24', '2020-08-15 04:14:55', '2020-08-15 10:17:24'),
	('c7cb25f6-2465-4828-ac2e-8d45ea48ffab', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3","fas":"fa-file-alt"}', NULL, '2022-08-26 15:52:47', '2022-08-26 15:52:47'),
	('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-14 13:08:50', '2020-08-14 13:08:50'),
	('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/3","fas":"fa-file-alt"}', NULL, '2020-08-15 12:40:54', '2020-08-15 12:40:54'),
	('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply","fas":"fa-star"}', NULL, '2020-08-18 03:08:16', '2020-08-18 03:08:16'),
	('ead3d68d-cfb2-4fe7-9cd6-e4a8d3f87bc0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6","fas":"fa-file-alt"}', NULL, '2022-08-26 08:20:28', '2022-08-26 08:20:28'),
	('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}', NULL, '2020-08-18 03:13:29', '2020-08-18 03:13:29');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping structure for table opac.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
	(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-15 04:14:49', '2020-08-15 04:15:19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table opac.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table opac.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.posts: ~5 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'for opac blog1', 'where-does-it-come-from', 'summary this', 'description', 'description', '/storage/photos/1/Blog/blog1.jpg', 'rimas', 1, NULL, 2, 'active', '2020-08-14 07:55:55', '2020-08-14 10:29:56'),
	(2, 'for opac blog2', 'where-can-i-get-some', 'summary this', 'description', NULL, '/storage/photos/1/Blog/blog2.jpg', 'asdfa', 2, NULL, 1, 'active', '2020-08-14 07:58:52', '2020-08-14 13:08:14'),
	(3, 'for opac blog3', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', 'summary this', 'description', NULL, '/storage/photos/1/Blog/blog3.jpg', 'adsf', 3, NULL, NULL, 'active', '2020-08-14 08:59:33', '2020-08-14 10:29:44'),
	(5, 'for opac blog4', 'the-standard-lorem-ipsum-passage', 'summary this', 'description', 'description', '/storage/photos/1/Blog/blog2.jpg', 'samir', 1, NULL, 1, 'active', '2020-08-15 12:58:45', '2020-08-15 12:58:45'),
	(6, 'for opac blog5', 'lorem-ipsum-is-simply', 'summary this', 'description', '', '/storage/photos/1/Blog/blog3.jpg', '123', 2, NULL, 1, 'active', '2020-08-18 02:54:19', '2020-08-18 02:54:19');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table opac.post_categories
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.post_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Medicine', 'medicine', 'active', '2020-08-14 07:51:03', '2020-08-14 07:51:39'),
	(2, 'Stuff1', 'stuff1', 'active', '2020-08-14 07:51:22', '2020-08-14 07:52:00'),
	(3, 'Stuff2', 'stuff2', 'active', '2020-08-14 07:52:22', '2020-08-14 07:52:22'),
	(4, 'Stuff3', 'stuff3', 'active', '2020-08-14 09:16:10', '2020-08-14 09:16:10'),
	(5, 'Stuff4', 'stuff4', 'active', '2020-08-15 12:59:04', '2020-08-15 12:59:04');
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;

-- Dumping structure for table opac.post_comments
CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.post_comments: ~7 rows (approximately)
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;
INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 13:08:42', '2020-08-15 12:59:58'),
	(2, NULL, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 13:11:03', '2020-08-14 13:11:03'),
	(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 13:12:27', '2020-08-14 13:12:27'),
	(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 13:31:19', '2020-08-15 13:31:19'),
	(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 13:51:01', '2020-08-15 13:51:01'),
	(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-18 03:13:29', '2020-08-18 03:13:29'),
	(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-18 03:13:51', '2020-08-18 03:13:51');
/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;

-- Dumping structure for table opac.post_tags
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.post_tags: ~4 rows (approximately)
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'asdf', 'asdf', 'active', '2020-08-14 07:53:52', '2020-08-14 07:53:52'),
	(2, 'ggggg', 'ggggg', 'active', '2020-08-14 07:54:09', '2020-08-14 07:54:09'),
	(3, 'asdfasdf', 'asdfasdf', 'active', '2020-08-14 07:54:33', '2020-08-14 07:54:33'),
	(4, 'asdf', 'tag', 'active', '2020-08-15 12:59:31', '2020-08-15 12:59:31');
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;

-- Dumping structure for table opac.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.products: ~10 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
	(1, 'Calbo D', 'medicine-10', 'summary1', 'Description', 'http://localhost/storage/photos/1/20.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 3, NULL, 4, '2020-08-14 10:38:26', '2022-08-26 18:11:07'),
	(2, 'Anadol', 'medicine-9', 'summary1', 'Description', 'http://localhost/storage/photos/1/19.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 10:40:21', '2022-08-26 17:35:53'),
	(3, 'Seclo 20mg', 'medicine-8', 'Seclo 20mg', 'Description Bolbo Na', 'http://localhost/storage/photos/1/18.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 1, NULL, 2, '2020-08-14 11:57:48', '2022-08-26 17:42:24'),
	(4, 'Vitamin E Capsule', 'medicine-7', 'summary1', 'Description', 'http://localhost/storage/photos/1/17.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, 0, 3, NULL, 1, '2020-08-14 12:04:13', '2022-08-26 18:10:43'),
	(5, 'Paravil', 'medicine-6', 'summary1', 'Description', 'http://localhost/storage/photos/1/16.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, 0, 3, NULL, 3, '2020-08-14 12:10:52', '2022-08-26 17:35:10'),
	(6, 'ORSaline', 'medicine-5', 'summary1', 'Description', 'http://localhost/storage/photos/1/15.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, 1, 2, NULL, 4, '2020-08-14 12:13:20', '2022-08-26 18:10:12'),
	(7, 'Alatrol', 'medicine-4', 'summary1', 'Description', 'http://localhost/storage/photos/1/14.jpg', 0, 'L', 'hot', 'active', 1999.00, 3.00, 0, 3, NULL, 1, '2020-08-14 12:23:33', '2022-08-26 17:34:42'),
	(8, 'Equate Omeprazole', 'medicine-3', 'summary1', 'Description', 'http://localhost/storage/photos/1/13.jpg', 1, 'S', 'new', 'active', 200.00, 0.00, 0, 3, NULL, 2, '2020-08-14 12:25:42', '2022-08-26 17:34:25'),
	(9, 'Ampicilin', 'medicine-2', 'summary1', 'Description', 'http://localhost/storage/photos/1/12.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, 0, 2, NULL, 3, '2020-08-15 12:52:44', '2022-08-26 17:34:07'),
	(10, 'Omeprazole', 'medicine-1', 'summary1', 'Description', 'http://localhost/storage/photos/1/11.jpg', 3, 'L,XL', 'hot', 'active', 300.00, 10.00, 0, 1, 4, 3, '2020-08-18 02:50:07', '2022-08-26 17:33:52');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table opac.product_reviews
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.product_reviews: ~2 rows (approximately)
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
	(1, NULL, 2, 5, 'nice product', 'active', '2020-08-15 13:44:05', '2020-08-15 13:44:05'),
	(2, 2, 9, 5, 'nice', 'active', '2020-08-18 03:08:14', '2020-08-18 03:18:31');
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;

-- Dumping structure for table opac.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(1, '\r\nDescription', 'Short Description', 'http://localhost/storage/photos/1/logo5.png', '/storage/photos/1/blog3.jpg', 'BRAC University', '+88016208396**', 'mdsrer@gmail.com', NULL, '2020-08-14 07:49:09');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table opac.shippings
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.shippings: ~4 rows (approximately)
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Dhaka', 80.00, 'active', '2020-08-14 10:22:17', '2020-08-14 10:22:17'),
	(2, 'Chittagong', 150.00, 'active', '2020-08-14 10:22:41', '2020-08-14 10:22:41'),
	(3, 'Rajshahi', 160.00, 'active', '2020-08-15 12:54:04', '2020-08-15 12:54:04'),
	(4, 'Khulna', 160.00, 'active', '2020-08-18 02:50:48', '2020-08-18 02:50:48');
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;

-- Dumping structure for table opac.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','doctor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ADMIN', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', NULL, 'admin', NULL, NULL, 'active', 'b9KZvgqzzBeQKHeskM6Vf3BS01dUpzmu90iTzvSpmnT2LqhjKvQ0OeuqUd2Z', NULL, '2022-08-20 20:15:16'),
	(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 13:30:07'),
	(30, 'Rimas', 'rimassamiragent@gmail.com', NULL, '$2y$10$xxNvnlf1YJBElDuRBIJdt.f5ZxoxiByj7faDWkso9g5oxqmJDimnq', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-20 15:42:36', '2022-08-20 20:17:19'),
	(31, 'Samiur Rahman', 'asdf@gmail.com', NULL, '$2y$10$EZeT/PtVUwyWQwsgr6MpX./5jAdBdEGJyk/mMISdiI8vZHh.lkX1u', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-20 15:42:55', '2022-08-20 15:42:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table opac.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table opac.wishlists: ~0 rows (approximately)
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

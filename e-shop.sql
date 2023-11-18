-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table opac.banners: ~1 rows (approximately)
INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, '.', 'opac-is', 'http://localhost/storage/photos/1/banner12.jpg', '<h2><br></h2>', 'active', '2020-08-14 01:47:38', '2022-08-26 04:00:41');

-- Dumping data for table opac.brands: ~5 rows (approximately)
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Square', 'square', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
	(2, 'Incepta', 'incepta', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
	(3, 'Beximco', 'beximco', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
	(4, 'Opsonin', 'bpsonin', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
	(6, 'ACI', 'aci', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31');

-- Dumping data for table opac.carts: ~2 rows (approximately)
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
	(11, 9, NULL, 2, 190.00, 'new', 2, 380.00, '2020-08-17 21:08:35', '2020-08-17 21:17:03'),
	(15, 10, NULL, 30, 270.00, 'new', 1, 270.00, '2022-08-26 10:30:55', '2022-08-26 10:30:55');

-- Dumping data for table opac.categories: ~6 rows (approximately)
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Gastrointestinal', 'c1', NULL, 'http://localhost/storage/photos/1/asd.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2022-08-26 12:05:01'),
	(2, 'Diarrhea', 'c2', 'Description Bolbo na 2', 'http://localhost/storage/photos/1/asd2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2022-08-26 12:05:16'),
	(3, 'Vitamins', 'c3', NULL, 'http://localhost/storage/photos/1/asd3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2022-08-26 12:06:46'),
	(4, 'Sub Category 1', 'sc1', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2022-08-20 11:09:52'),
	(5, 'Sub Category 2', 'sc2', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2022-08-20 11:09:41'),
	(6, 'Sub Category 3', 'sc3', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2022-08-20 11:10:03');

-- Dumping data for table opac.coupons: ~2 rows (approximately)
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'abc123', 'fixed', 30.00, 'active', NULL, NULL),
	(5, 'abcd', 'fixed', 50.00, 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- Dumping data for table opac.failed_jobs: ~0 rows (approximately)

-- Dumping data for table opac.messages: ~4 rows (approximately)
INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
	(9, 'Samiur Rahman', 'Problem Category', 'mdsrer@gmail.com', NULL, 'as', 'I once took care of an elderly patient who wasn’t particularly interested in some of the preventive measures I was recommending. He liked to say “you gotta die of something.” True enough. But that’s no reason to ignore measures that could prevent deaths, especially the “low-hanging fruit” such as automobile accidents.\n\nWhen thinking about the most serious health problems, there are several ways of looking at them. For example, you might consider\n\nthe most common causes of death\nthe diseases and conditions of death people worry about the most\nthe causes of death that are somewhat unique to where you live.\nThese three lists are not the same. Let’s consider each.', '2022-08-26 12:28:25', '2022-08-22 06:04:55', '2022-08-26 12:28:25'),
	(10, 'samir', 'fsdgdfg sdfgf sfdgdfg dfgsd', 'rimassamiragent@gmail.com', NULL, NULL, 'daf adfad dfada adfd adsf asdf df', '2022-08-26 10:48:39', '2022-08-26 04:04:59', '2022-08-26 10:48:39'),
	(11, 'Samiur Rahman', 'fsdgdfg sdfgf sfdgdfg dfgsd', 'rimassamiragent@gmail.com', NULL, NULL, 'asd asddddddddddddddddddddddddddd', '2022-08-26 10:48:41', '2022-08-26 09:54:32', '2022-08-26 10:48:41'),
	(12, 'asdf', 'adsfasfasdf', 'rimassamiragent@gmail.com', NULL, 'adsfgasdfdsfdsfdsf', 'adfasd asdf adsfasdfsaaaaaaaaaaaaa', '2022-08-26 11:33:02', '2022-08-26 11:32:50', '2022-08-26 11:33:02');

-- Dumping data for table opac.migrations: ~20 rows (approximately)
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

-- Dumping data for table opac.notifications: ~18 rows (approximately)
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
	('18110d37-c674-4633-87e4-582ef8429271', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2022-08-25 09:04:19', '2022-08-25 09:04:19'),
	('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
	('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/4","fas":"fa-file-alt"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
	('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
	('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
	('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage","fas":"fas fa-comment"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
	('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t","fas":"fa-star"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
	('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
	('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/1","fas":"fa-file-alt"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
	('a6265e39-f499-4ce7-8c6a-adb6964b425a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2022-08-21 12:15:01', '2022-08-21 12:15:01'),
	('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/localhost:8000\\/admin\\/order\\/5","fas":"fa-file-alt"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
	('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/2","fas":"fa-file-alt"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
	('c7cb25f6-2465-4828-ac2e-8d45ea48ffab', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3","fas":"fa-file-alt"}', NULL, '2022-08-26 09:52:47', '2022-08-26 09:52:47'),
	('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some","fas":"fas fa-comment"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
	('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/e-shop.loc\\/admin\\/order\\/3","fas":"fa-file-alt"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
	('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Product Rating!","actionURL":"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply","fas":"fa-star"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
	('ead3d68d-cfb2-4fe7-9cd6-e4a8d3f87bc0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New order created","actionURL":"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6","fas":"fa-file-alt"}', NULL, '2022-08-26 02:20:28', '2022-08-26 02:20:28'),
	('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{"title":"New Comment created","actionURL":"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s","fas":"fas fa-comment"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- Dumping data for table opac.orders: ~1 rows (approximately)
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
	(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-14 22:14:49', '2020-08-14 22:15:19');

-- Dumping data for table opac.password_resets: ~0 rows (approximately)

-- Dumping data for table opac.posts: ~5 rows (approximately)
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'for opac blog1', 'where-does-it-come-from', 'summary this', 'description', 'description', '/storage/photos/1/Blog/blog1.jpg', 'rimas', 1, NULL, 2, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
	(2, 'for opac blog2', 'where-can-i-get-some', 'summary this', 'description', NULL, '/storage/photos/1/Blog/blog2.jpg', 'asdfa', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
	(3, 'for opac blog3', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', 'summary this', 'description', NULL, '/storage/photos/1/Blog/blog3.jpg', 'adsf', 3, NULL, NULL, 'active', '2020-08-14 02:59:33', '2020-08-14 04:29:44'),
	(5, 'for opac blog4', 'the-standard-lorem-ipsum-passage', 'summary this', 'description', 'description', '/storage/photos/1/Blog/blog2.jpg', 'samir', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
	(6, 'for opac blog5', 'lorem-ipsum-is-simply', 'summary this', 'description', '', '/storage/photos/1/Blog/blog3.jpg', '123', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- Dumping data for table opac.post_categories: ~5 rows (approximately)
INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Medicine', 'medicine', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
	(2, 'Stuff1', 'stuff1', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
	(3, 'Stuff2', 'stuff2', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
	(4, 'Stuff3', 'stuff3', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
	(5, 'Stuff4', 'stuff4', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- Dumping data for table opac.post_comments: ~7 rows (approximately)
INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
	(2, NULL, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
	(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
	(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
	(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
	(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
	(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

-- Dumping data for table opac.post_tags: ~4 rows (approximately)
INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'asdf', 'asdf', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
	(2, 'ggggg', 'ggggg', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
	(3, 'asdfasdf', 'asdfasdf', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
	(4, 'asdf', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- Dumping data for table opac.products: ~10 rows (approximately)
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
	(1, 'Calbo D', 'medicine-10', 'summary1', 'Description', 'http://localhost/storage/photos/1/20.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 3, NULL, 4, '2020-08-14 04:38:26', '2022-08-26 12:11:07'),
	(2, 'Anadol', 'medicine-9', 'summary1', 'Description', 'http://localhost/storage/photos/1/19.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 04:40:21', '2022-08-26 11:35:53'),
	(3, 'Seclo 20mg', 'medicine-8', 'Seclo 20mg', 'Description Bolbo Na', 'http://localhost/storage/photos/1/18.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 1, NULL, 2, '2020-08-14 05:57:48', '2022-08-26 11:42:24'),
	(4, 'Vitamin E Capsule', 'medicine-7', 'summary1', 'Description', 'http://localhost/storage/photos/1/17.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, 0, 3, NULL, 1, '2020-08-14 06:04:13', '2022-08-26 12:10:43'),
	(5, 'Paravil', 'medicine-6', 'summary1', 'Description', 'http://localhost/storage/photos/1/16.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, 0, 3, NULL, 3, '2020-08-14 06:10:52', '2022-08-26 11:35:10'),
	(6, 'ORSaline', 'medicine-5', 'summary1', 'Description', 'http://localhost/storage/photos/1/15.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, 1, 2, NULL, 4, '2020-08-14 06:13:20', '2022-08-26 12:10:12'),
	(7, 'Alatrol', 'medicine-4', 'summary1', 'Description', 'http://localhost/storage/photos/1/14.jpg', 0, 'L', 'hot', 'active', 1999.00, 3.00, 0, 3, NULL, 1, '2020-08-14 06:23:33', '2022-08-26 11:34:42'),
	(8, 'Equate Omeprazole', 'medicine-3', 'summary1', 'Description', 'http://localhost/storage/photos/1/13.jpg', 1, 'S', 'new', 'active', 200.00, 0.00, 0, 3, NULL, 2, '2020-08-14 06:25:42', '2022-08-26 11:34:25'),
	(9, 'Ampicilin', 'medicine-2', 'summary1', 'Description', 'http://localhost/storage/photos/1/12.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, 0, 2, NULL, 3, '2020-08-15 06:52:44', '2022-08-26 11:34:07'),
	(10, 'Omeprazole', 'medicine-1', 'summary1', 'Description', 'http://localhost/storage/photos/1/11.jpg', 3, 'L,XL', 'hot', 'active', 300.00, 10.00, 0, 1, 4, 3, '2020-08-17 20:50:07', '2022-08-26 11:33:52');

-- Dumping data for table opac.product_reviews: ~2 rows (approximately)
INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
	(1, NULL, 2, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
	(2, 2, 9, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- Dumping data for table opac.settings: ~1 rows (approximately)
INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
	(1, '\r\nDescription', 'Short Description', 'http://localhost/storage/photos/1/logo5.png', '/storage/photos/1/blog3.jpg', 'BRAC University', '+88016208396**', 'mdsrer@gmail.com', NULL, '2020-08-14 01:49:09');

-- Dumping data for table opac.shippings: ~4 rows (approximately)
INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Dhaka', 80.00, 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
	(2, 'Chittagong', 150.00, 'active', '2020-08-14 04:22:41', '2020-08-14 04:22:41'),
	(3, 'Rajshahi', 160.00, 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
	(4, 'Khulna', 160.00, 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- Dumping data for table opac.users: ~4 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'ADMIN', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', NULL, 'admin', NULL, NULL, 'active', 'b9KZvgqzzBeQKHeskM6Vf3BS01dUpzmu90iTzvSpmnT2LqhjKvQ0OeuqUd2Z', NULL, '2022-08-20 14:15:16'),
	(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07'),
	(30, 'Rimas', 'rimassamiragent@gmail.com', NULL, '$2y$10$xxNvnlf1YJBElDuRBIJdt.f5ZxoxiByj7faDWkso9g5oxqmJDimnq', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-20 09:42:36', '2022-08-20 14:17:19'),
	(31, 'Samiur Rahman', 'asdf@gmail.com', NULL, '$2y$10$EZeT/PtVUwyWQwsgr6MpX./5jAdBdEGJyk/mMISdiI8vZHh.lkX1u', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-20 09:42:55', '2022-08-20 09:42:55');

-- Dumping data for table opac.wishlists: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

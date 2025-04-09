-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 06:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `address`) VALUES
(17, 15, 'Vĩnh Long 123'),
(18, 6, 'Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(230, 54, 19, 'Huawei P30 Lite', 17000000, 1, 'huawei-p30-lite-1-600x600.jpg'),
(243, 44, 23, 'Samsung Galaxy S25 Ultra', 28050000, 1, 'samsung-galaxy-s25-ultra-blue-thumbai-600x600.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(20, 'Apple', 'Apple.png', 1),
(21, 'Xiaomi', 'Xiaomi.jpg', 1),
(22, 'Samsung', 'Samsung.png', 1),
(23, 'Oppo', 'Oppo.jpg', 1),
(25, 'Realme', 'Realme.jpg', 1),
(26, 'Huawei', 'Huawei.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(13, 'còn tặng gì thêm ko shop', '2025-04-01 23:06:24', 1, 19, 54),
(14, 'con này lỗi nhiều', '2025-04-01 23:24:51', 1, 23, 38);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(119, 61, 53, 4, 17000000),
(120, 62, 38, 1, 11050000),
(121, 62, 37, 1, 12750000),
(122, 62, 36, 1, 17000000),
(123, 62, 35, 1, 25500000),
(124, 63, 41, 2, 19550000),
(125, 63, 42, 1, 14450000),
(126, 63, 40, 1, 21250000),
(127, 63, 39, 1, 17000000),
(128, 64, 46, 1, 18700000),
(129, 64, 45, 1, 21250000),
(130, 64, 44, 1, 28050000),
(131, 64, 43, 1, 24650000),
(132, 65, 49, 1, 10200000),
(133, 65, 48, 1, 15300000),
(134, 65, 47, 1, 17850000),
(135, 66, 37, 1, 12750000),
(136, 67, 52, 1, 17000000),
(137, 67, 51, 1, 17000000),
(138, 68, 53, 1, 17000000),
(139, 68, 54, 2, 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(61, 18, '2025-03-31 02:27:35', 68000000, 'quan9', '0855003466', 'quận 9', 4),
(62, 18, '2025-03-17 22:51:32', 66300000, 'quan9', '0855003466', 'quận 9', 4),
(63, 19, '2025-03-23 23:01:07', 91800000, 'Bình Dương', '0855003433', 'Phú Giáo', 4),
(64, 20, '2025-04-01 23:15:50', 92650000, 'Quảng Ngãi', '0855003431', 'Giao cẩn thận cho tui', 4),
(65, 21, '2025-04-01 23:18:18', 43350000, 'Nghệ An', '0855003434', '', 1),
(66, 21, '2025-04-01 23:18:41', 12750000, 'Nghệ An', '0855003434', '', 4),
(67, 22, '2025-04-01 23:20:33', 34000000, 'Đồng Nai', '0855003411', 'Giao chill chill thôi ko gấp nào tới điện anh trước 10 phút', 1),
(68, 23, '2025-04-01 23:22:41', 51000000, 'Phan Thiết', '0855003422', 'Giao đường biển cho tui', 4);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(13, 15, 'Đánh giá iPhone 15 Pro Max – Có đáng nâng cấp?', 'bv1.jpg', 'Admin', '<p>iPhone 15 Pro Max là phiên bản cao cấp nhất của Apple năm 2025, với những nâng cấp mạnh mẽ về hiệu năng, thiết kế và camera.</p><p><strong>Thiết kế:</strong> Apple đã sử dụng chất liệu Titan giúp iPhone 15 Pro Max nhẹ hơn nhưng vẫn cực kỳ bền bỉ.<br><strong>Màn hình:</strong> Công nghệ ProMotion 120Hz giúp trải nghiệm vuốt chạm mượt mà hơn.<br><strong>Camera:</strong> Camera chính 48MP với khả năng zoom quang 5x, cùng với chế độ quay video ProRes 8K chuyên nghiệp.&nbsp;<br><strong>Hiệu năng:</strong> Chip A17 Pro mang lại hiệu năng vượt trội, tối ưu hóa cho gaming và xử lý AI.<br>Có nên nâng cấp? Nếu bạn đang dùng iPhone 13 Pro hoặc cũ hơn, iPhone 15 Pro Max là một sự lựa chọn đáng cân nhắc. Tuy nhiên, nếu bạn đang sở hữu iPhone 14 Pro, nâng cấp không thực sự cần thiết.</p>', 0, 1, '2025-04-01 22:01:56', '2025-04-01 22:01:56'),
(14, 16, 'Apple ra mắt iPhone 16 – Những nâng cấp đáng chú ý', 'bv2.jpg', 'Admin', '<p>Apple vừa chính thức giới thiệu iPhone 16 với hàng loạt cải tiến đáng chú ý:</p><p>Thiết kế mới**: iPhone 16 có khung titan thế hệ 2, giúp máy nhẹ hơn nhưng vẫn cực kỳ bền bỉ.&nbsp;</p><p><strong>Màn hình ProMotion 144Hz**:</strong> Đây là lần đầu tiên Apple nâng cấp màn hình tần số quét lên 144Hz, mang lại trải nghiệm siêu mượt.</p><p><strong>Camera AI 50MP**:</strong> Hệ thống camera mới hỗ trợ AI, giúp nhận diện cảnh vật và tự động tối ưu hình ảnh tốt hơn.&nbsp;</p><p><strong>Chip A18 Pro mạnh mẽ**:</strong> Apple trang bị vi xử lý A18 Pro với hiệu suất cao hơn 25% so với thế hệ trước.</p><p>Ngày ra mắt &amp; giá bán iPhone 16 dự kiến lên kệ vào tháng 10/2025, với giá khởi điểm từ 999 USD.</p>', 0, 1, '2025-04-01 22:13:34', '2025-04-01 22:13:34'),
(15, 17, 'Mẹo chụp ảnh đẹp bằng điện thoại', 'bv3.jpg', 'Admin', '<p>Chụp ảnh đẹp bằng điện thoại không khó nếu bạn biết những mẹo nhỏ dưới đây!<br>&nbsp; &nbsp;???? **1. Sử dụng ánh sáng tự nhiên**: Ánh sáng tự nhiên giúp bức ảnh sáng rõ và có độ sâu hơn so với dùng flash.<br>&nbsp; &nbsp;???? **2. Điều chỉnh bố cục theo quy tắc 1/3**: Hãy để chủ thể của bạn nằm trên các đường lưới của quy tắc 1/3 để tạo bức ảnh hài hòa.<br>&nbsp; &nbsp;???? **3. Tận dụng chế độ chụp đêm**: Nếu chụp thiếu sáng, hãy bật chế độ Night Mode để có bức ảnh sáng rõ mà không bị nhiễu hạt.<br>&nbsp; &nbsp;???? **4. Giữ máy ổn định khi chụp**: Sử dụng chân máy hoặc tựa tay vào vật cố định để tránh rung lắc.<br>&nbsp; &nbsp;???? **5. Chỉnh sửa ảnh sau khi chụp**: Sử dụng Lightroom hoặc Snapseed để cân chỉnh màu sắc và độ nét.<br>&nbsp; &nbsp;Thử áp dụng những mẹo này</p>', 0, 1, '2025-04-01 22:15:37', '2025-04-01 22:15:37'),
(16, 18, 'Flash Sale: Giảm giá sốc iPhone 15 Pro Max', 'bv4.jpg', 'Admin', '<p>???? Cơ hội vàng sở hữu iPhone 15 Pro Max với mức giá ưu đãi nhất!&nbsp;<br>&nbsp;Chương trình giảm giá lớn nhất tháng đã chính thức bắt đầu! Chỉ trong ngày hôm nay, khi mua iPhone 15 Pro Max tại hệ thống cửa hàng của chúng tôi, bạn sẽ nhận ngay mức giảm giá **3 triệu đồng**. Đừng bỏ lỡ cơ hội này để sở hữu chiếc flagship mới nhất từ Apple với giá cực kỳ hấp dẫn.<br>&nbsp;✅ **Chi tiết chương trình khuyến mãi**:<br>&nbsp;- ???? **Giảm ngay 3 triệu đồng** cho tất cả phiên bản iPhone 15 Pro Max.<br>&nbsp;- ???? Áp dụng cho cả mua online và tại cửa hàng.<br>&nbsp;- ???? Hỗ trợ trả góp 0% lãi suất lên đến 12 tháng.<br>&nbsp;- ???? Tặng kèm combo phụ kiện cao cấp trị giá **1 triệu đồng**.<br>&nbsp;???? **Thời gian áp dụng**: Chỉ duy nhất hôm nay - ngày 04/04/2025.<br>&nbsp;???? **Ưu đãi đặc biệt khi mua online**:<br>&nbsp;- Miễn phí vận chuyển toàn quốc.<br>&nbsp;- Giao hàng nhanh trong 2 giờ đối với khu vực nội thành.<br>&nbsp;???? **Nhanh tay đặt hàng ngay trước khi hết khuyến mãi!** Số lượng sản phẩm có hạn, hãy chốt đơn ngay hôm nay để không bỏ lỡ cơ hội sở hữu siêu phẩm iPhone 15 Pro Max với giá tốt nhất.\",</p>', 0, 1, '2025-04-01 22:17:23', '2025-04-01 22:17:23'),
(17, 18, 'Mua 1 tặng 1: Cơ hội sở hữu iPhone 14 miễn phí!', 'bv5.jpg', 'Admin', '<p>???? Cực sốc! Chương trình mua 1 tặng 1 duy nhất trong tháng này! ????<br>&nbsp;Nhằm tri ân khách hàng, chúng tôi mang đến ưu đãi đặc biệt: **Mua iPhone 15 Pro Max - Nhận ngay iPhone 14 miễn phí!**<br>&nbsp;✅ **Chi tiết chương trình**:<br>&nbsp;- ???? Khi mua iPhone 15 Pro Max 256GB trở lên, bạn sẽ được **tặng ngay 1 iPhone 14 128GB** hoàn toàn miễn phí!<br>&nbsp;- ???? Áp dụng cho cả mua online và mua trực tiếp tại cửa hàng.<br>&nbsp;- ???? Hỗ trợ trả góp 0% trong 12 tháng.<br>&nbsp;- ???? Tặng kèm gói bảo hành mở rộng 12 tháng.<br>&nbsp;???? **Thời gian áp dụng**: Từ ngày 05/04/2025 đến hết 15/04/2025.\\n\\n<br>&nbsp;???? **Ưu đãi đặc biệt khi mua online**<br>&nbsp;- Miễn phí giao hàng toàn quốc<br>&nbsp;???? **Chương trình có giới hạn – Nhanh tay đặt hàng ngay!** Số lượng có hạn, chỉ áp dụng cho 100 khách hàng đầu tiên!\",</p>', 0, 1, '2025-04-01 22:20:03', '2025-04-01 22:20:03'),
(18, 16, 'Samsung giới thiệu Galaxy Z Fold6 – Nâng cấp lớn về màn hình và camera', 'bv6.jpg', 'Admin', '<p>???? Samsung vừa chính thức trình làng Galaxy Z Fold6, thế hệ điện thoại gập mới nhất với những nâng cấp đáng chú ý!<br>&nbsp;???? **Thiết kế mỏng hơn, bền hơn**:<br>&nbsp;- Samsung đã cải tiến bản lề giúp thiết bị gập mở mượt hơn và giảm độ dày so với thế hệ trước.<br>&nbsp;- Sử dụng kính cường lực Gorilla Glass Victus 3, giúp tăng độ bền đáng kể.\\n\\n<br>&nbsp;???? **Màn hình siêu mượt 120Hz**:<br>&nbsp;- Màn hình chính 7.6 inch Dynamic AMOLED 2X với tần số quét 120Hz mang đến trải nghiệm cực kỳ mượt mà.<br>&nbsp;- Màn hình ngoài 6.2 inch hỗ trợ HDR10+, tối ưu hóa hiển thị dưới ánh sáng mạnh.<br>&nbsp;???? **Camera nâng cấp mạnh mẽ**:<br>&nbsp;- Camera chính 50MP với cảm biến lớn hơn giúp chụp ảnh thiếu sáng tốt hơn.<br>&nbsp;- Camera zoom quang học 3x và AI xử lý hình ảnh tối ưu hóa màu sắc.<br>&nbsp;???? **Chip Snapdragon 8 Gen 3 tối ưu cho AI**:<br>&nbsp;- Hiệu năng tăng 20% so với thế hệ trước, hỗ trợ tốt hơn cho gaming và tác vụ đa nhiệm.<br>&nbsp;- Pin 4800mAh, hỗ trợ sạc nhanh 45W, giúp sạc đầy 50% chỉ trong 30 phút.<br>&nbsp;???? **Giá bán &amp; ngày mở bán**:<br>&nbsp;- Galaxy Z Fold6 sẽ chính thức lên kệ vào tháng 7/2025 với giá khởi điểm từ 1.799 USD.\\n\\n<br>&nbsp;???? **Bạn nghĩ gì về Galaxy Z Fold6? Liệu đây có phải là chiếc điện thoại gập đáng mua nhất năm nay?**\",</p>', 0, 1, '2025-04-01 22:21:33', '2025-04-01 22:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(15, 'Đánh giá điện thoại'),
(16, 'Tin tức công nghệ'),
(17, 'Hướng dẫn & Mẹo vặt'),
(18, 'Khuyến mãi & Sự kiện');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `sell_quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(35, 20, 'iPhone 16', 'iphone16.png', 19, 1, 30000000, 25500000, '2025-04-01 01:18:37', 1, '', '', 1),
(36, 20, 'iPhone 15', 'Apple.png', 19, 1, 20000000, 17000000, '2025-04-01 01:22:40', 1, '', '', 1),
(37, 20, 'iPhone 14', 'ip14.jpg', 18, 2, 15000000, 12750000, '2025-04-01 01:23:40', 0, '', '', 1),
(38, 20, 'iPhone 13', 'ip13.jpg', 19, 1, 13000000, 11050000, '2025-04-01 01:24:39', 3, '', '', 1),
(39, 21, 'Xiaomi Note14', 'xiaomi-redmi-note-14.jpg', 19, 1, 20000000, 17000000, '2025-04-01 01:27:13', 1, '', '', 1),
(40, 21, 'Xiaomi 15', 'xiaomi-15.jpg', 9, 1, 25000000, 21250000, '2025-04-01 01:41:19', 0, '', '', 1),
(41, 21, 'Xiaomi 14T Pro', 'xiaomi-14t-pro-5g-12gb-256gb-thumb-600x600.jpg', 8, 2, 23000000, 19550000, '2025-04-01 01:44:30', 0, '', '', 1),
(42, 21, 'Xiaomi 13', 'xiaomi-13.jpg', 9, 1, 17000000, 14450000, '2025-04-01 01:50:36', 0, '', '', 1),
(43, 22, 'Samsung Galaxy S24 Ultra', 'samsung-galaxy-s24-ultra-5g-600x600.jpg', 9, 1, 29000000, 24650000, '2025-04-01 01:53:48', 0, '', '', 1),
(44, 22, 'Samsung Galaxy S25 Ultra', 'samsung-galaxy-s25-ultra-blue-thumbai-600x600.jpg', 9, 1, 33000000, 28050000, '2025-04-01 01:55:28', 0, '', '', 1),
(45, 22, 'Samsung Galaxy Z Flip6', 'samsung-galaxy-z-flip6-thumb-1-600x600.jpg', 9, 1, 25000000, 21250000, '2025-04-01 01:57:39', 0, '', '', 1),
(46, 22, 'Samsung Galaxy Z Flip5', 'purples.png', 9, 1, 22000000, 18700000, '2025-04-01 02:01:40', 0, '', '', 1),
(47, 23, 'OPPO Find N3', 'oppo-find-n3-thumb-600x600.jpg', 14, 1, 21000000, 17850000, '2025-04-01 02:04:07', 0, '', '', 1),
(48, 23, 'OPPO Find X8', 'oppo-find-x8-hong-thumb-600x600.jpg', 14, 1, 18000000, 15300000, '2025-04-01 02:06:19', 0, '', '', 1),
(49, 23, 'OPPO Reno 3 Pro', 'oppo-reno13-5g-thumb-600x600.jpg', 14, 1, 12000000, 10200000, '2025-04-01 02:10:21', 0, '', '', 1),
(50, 23, 'OPPO Find X5', 'oppo-find-x5---trắng_1739453086.jpg.jpg', 15, 0, 18000000, 15300000, '2025-04-01 02:12:01', 0, '', '', 1),
(51, 25, 'Realme 10 Plus Pro', 'realme-10-pro-plus-hyperspace.jpg', 9, 1, 20000000, 17000000, '2025-04-01 02:17:42', 0, '', '', 1),
(52, 25, 'Realme C75X', 'realme-c75x-pink-thumbn-600x600.jpg', 9, 1, 20000000, 17000000, '2025-04-01 02:18:47', 0, '', '', 1),
(53, 26, 'Huawei Nova 13', 'huawei-nova-13---xanh_1729833654.jpg.jpg', 5, 5, 20000000, 17000000, '2025-04-01 02:20:10', 1, '', '', 1),
(54, 26, 'Huawei P30 Lite', 'huawei-p30-lite-1-600x600.jpg', 8, 2, 20000000, 17000000, '2025-04-01 02:20:55', 9, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(6, 'khoanguyen', '$2y$10$YO9fd9Wdhed5mYcUFc5eTe5o7zrasZtl2x7Wt4J03im0NWaRisesu', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoacntt2003@gmail.com', '0909135329', 'Ninh Kiều, Cần Thơ', 0, 1),
(7, 'khahi', '$2y$10$sF.yA6lAhvCE1vhwffwijuzA3JMoVhgnxkk.FdqXR4HVHlHdnXHzK', 'Lê Châu Khả Hi', 'user-default.png', 'hilckpc06524@fpt.edu.vn', '0336216654', 'Kiên Giang', 0, 1),
(8, 'admin', '$2y$10$Cm.2KiZ85WRGUTBk8vhMaOIQt46A53HKuzPfZh2jS.fdZzAr33dTi', 'Admin', 'user-default.png', 'khoacn03@gmail.com', '0336216559', 'Cần Thơ', 1, 1),
(9, 'tranvana', '$2y$10$ts748iCUjwA5HpQBMLuROuAXa70addsKmfkMh9rYIw/PjhxLLwH8i', 'Trần Văn A', 'user-default.png', 'tranvana@gmail.com', '0909135969', 'Cái Răng, Cần Thơ', 0, 1),
(10, 'haohao', '$2y$10$gcBHpzElBGDkOv5EEzJFhuoireNk2HsaloJQLy2KHvzGqx6MIyYku', 'Mai Hảo Hảo', 'user-default.png', 'haomhpc07316@fpt.edu.vn', '0909135985', 'Ninh Kiều, Cần Thơ', 0, 1),
(11, 'tuankiet', '$2y$10$ENy4z0Infjac7VjlKYp2A.gqCBwc8N01tKGLT9A3buGdVoyd7sXnK', 'Đặng tuấn Kiệt', 'user-default.png', 'kietdtpc06764@fpt.edu.vn', '0909006764', 'Cần Thơ', 0, 1),
(12, 'khoanguyen111', '$2y$10$ZPAY2O7ntfQ5/Huv3dUAIuY4qHuPD/DpRxiw11TurgYr3hCrWfnv2', 'Nguyễn Lê Anh Khoa', 'khoanguyen.jpg', 'khoanlapc1234@gmail.com', '0336216546', 'Cần Thơ', 0, 1),
(13, 'khoanguyen001', '$2y$10$ptSvfsaT78h4LdZQNCrKdemlC.AqyZ/q5cudTk9/FKcbe6TtJDJAC', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoanla113@gmail.com', '0336216555', 'Can tho', 0, 1),
(15, 'toan', '$2y$10$rwdD7UlOPC2XUc4d3nJ/nO0THzotlhmrKekcbBynHxTqpOmFlN79a', 'Toàn', 'user-default.png', 'toan@gmail.com', '0336256555', 'Đại Học Cửu Long', 0, 1),
(16, 'minhtri0509', '$2y$10$rzCX16m0dEWIq5BTmAZ9yOrfjcD4Ox/6b4FT0f3sM/XuFmPCH4QN6', 'Trình Trí', 'user-default.png', 'trinhminhtri0509@gmail.com', '0386584929', '77/40G tân lập 1', 0, 1),
(17, 'viethuynh2k3', '$2y$10$3rBELHRDDMZAK.AY31WFAOFF0k1/Qmbog52cVLIav/w33hJUhJI2e', 'Đắc Việt', 'user-default.png', 'minhtritrinh0509@gmail.com', '0386584928', '77/40G tân lập 1', 0, 1),
(18, 'Thuan0211', '$2y$10$IbZcHuykpv1nOR4t8jsKlOBPcsTKwGpFDcJDmIQkwCLU9890Cn6oC', 'Thuan', 'user-default.png', 'thanhthuantanan@gmail.com', '0855003466', 'quan9', 0, 1),
(19, 'Uyen', '$2y$10$3v/Lcc4Pp/ZRMt2XltSyROaNFeOwmc5DktM0kSUHpjMkGu7c5NaZK', 'Bùi Thị Mỹ Uyên', 'user-default.png', 'Uyen@gmail.com', '0855003433', 'Bình Dương', 0, 1),
(20, 'Viet', '$2y$10$7STjPnVvwjFbU.2ApOacs.IsxE5EEEU4C.9paFP3ii4PpEY5pFybK', 'Việt', 'user-default.png', 'Viet@gmail.com', '0855003431', 'Quảng Ngãi', 0, 1),
(21, 'Đạt', '$2y$10$zLnqnjzbNdJzvm.w.ej1TOOETG8IV9fFoWPfd6WLNNY5XTe5BB18m', 'Đạt', 'user-default.png', 'Dat@gmail.com', '0855003434', 'Nghệ An', 0, 1),
(22, 'Thành', '$2y$10$94y1tIs2T55vwTHwXbq63uUgcU/MgTYJ0mNqBbsxVsYkOhwh2RJpu', 'Thành', 'user-default.png', 'Thanh@gmail.com', '0855003411', 'Đồng Nai', 0, 1),
(23, 'Nhan', '$2y$10$OgNLBr9LSNRir/hXyPCqgeXoyf/PIPUsBzw38wArDPHsFcCSdTbmO', 'Nhân', 'user-default.png', 'Nhan@gmail.com', '0855003422', 'Phan Thiết', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sell` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

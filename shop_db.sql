-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 12:01 AM
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
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(11, 11, 29, 'Tomato', 80.00, 1, 'tomato.jpg'),
(12, 11, 42, 'Fish (Rohu)', 350.00, 1, 'fish.jpg'),
(13, 11, 31, 'Onion', 65.00, 1, 'onion.jpg'),
(14, 11, 30, 'Potato', 50.00, 1, 'potato.jpg'),
(16, 11, 37, 'Mango', 180.00, 1, 'mango.jpg'),
(17, 11, 38, 'Watermelon', 250.00, 1, 'watermelon.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `number`, `email`, `message`) VALUES
(1, 9, 'মাহিন', '01740212096', 'user392@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(2, 3, 'মেহজাবিন', '01783490245', 'user253@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(3, 6, 'নাফিসা', '01776576553', 'user49@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(4, 7, 'আশফাক', '01762290581', 'user479@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(5, 8, 'আশফাক', '01770508249', 'user121@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(6, 8, 'ফারহানা', '01763060262', 'user34@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(7, 1, 'আশফাক', '01780386653', 'user350@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(8, 4, 'তানভীর', '01746673490', 'user255@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(9, 2, 'সাদিয়া', '01709445154', 'user434@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(10, 7, 'সুমাইয়া', '01789948113', 'user477@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(11, 5, 'তানভীর', '01778299320', 'user79@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(12, 8, 'ফারহানা', '01734109796', 'user399@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(13, 5, 'তানভীর', '01785218092', 'user295@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(14, 2, 'আশফাক', '01708010337', 'user117@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(15, 10, 'আশফাক', '01707254902', 'user47@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(16, 10, 'রাহুল', '01754473066', 'user228@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(17, 9, 'তানভীর', '01784835647', 'user212@example.com', 'আপনারা কি ঢাকার বাইরে ডেলিভারি দেন?'),
(18, 6, 'সুমাইয়া', '01795628804', 'user195@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(19, 3, 'আশফাক', '01737428227', 'user241@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(20, 10, 'নাফিসা', '01768840061', 'user362@example.com', 'আপনারা কি ঢাকার বাইরে ডেলিভারি দেন?'),
(21, 6, 'তানভীর', '01744034445', 'user251@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(22, 5, 'মাহিন', '01722676228', 'user333@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(23, 3, 'তানভীর', '01747069812', 'user325@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(24, 3, 'সাদিয়া', '01717654114', 'user99@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(25, 7, 'রাহুল', '01701857927', 'user36@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(26, 3, 'মাহিন', '01750497118', 'user68@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(27, 4, 'সাদিয়া', '01731776939', 'user43@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(28, 1, 'রাহুল', '01700190273', 'user421@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(29, 5, 'মেহজাবিন', '01758860385', 'user261@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(30, 7, 'আশফাক', '01772835691', 'user214@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(31, 5, 'সাদিয়া', '01729575298', 'user418@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(32, 10, 'মেহজাবিন', '01724496519', 'user398@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(33, 9, 'ফারহানা', '01745572006', 'user64@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(34, 10, 'মেহজাবিন', '01766059699', 'user311@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(35, 8, 'ফারহানা', '01764063477', 'user36@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(36, 10, 'মাহিন', '01741126268', 'user350@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(37, 3, 'ফারহানা', '01793825142', 'user364@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(38, 10, 'সুমাইয়া', '01798405452', 'user235@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(39, 6, 'ইমরান', '01748536681', 'user261@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(40, 2, 'মাহিন', '01779084474', 'user275@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(41, 3, 'রাহুল', '01755189552', 'user301@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(42, 10, 'আশফাক', '01787066610', 'user50@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(43, 2, 'মেহজাবিন', '01712193569', 'user474@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(44, 10, 'মেহজাবিন', '01728332151', 'user433@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(45, 8, 'সাদিয়া', '01726890437', 'user379@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(46, 7, 'সুমাইয়া', '01778686627', 'user282@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(47, 6, 'ইমরান', '01728402470', 'user287@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(48, 4, 'আশফাক', '01772797022', 'user176@example.com', 'আপনারা কি ঢাকার বাইরে ডেলিভারি দেন?'),
(49, 8, 'তানভীর', '01773811767', 'user19@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(50, 8, 'মেহজাবিন', '01782684649', 'user349@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(51, 10, 'সাদিয়া', '01723601713', 'user191@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(52, 9, 'সাদিয়া', '01720161346', 'user204@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(53, 10, 'ফারহানা', '01702772896', 'user23@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(54, 6, 'সাদিয়া', '01790819649', 'user462@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(55, 7, 'আশফাক', '01785173504', 'user451@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(56, 1, 'ফারহানা', '01761747992', 'user25@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(57, 9, 'মেহজাবিন', '01781131491', 'user263@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(58, 4, 'ফারহানা', '01764191939', 'user64@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(59, 2, 'ইমরান', '01768161984', 'user267@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(60, 5, 'সাদিয়া', '01740289499', 'user151@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(61, 6, 'রাহুল', '01763652865', 'user463@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(62, 9, 'মেহজাবিন', '01797632587', 'user124@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(63, 8, 'নাফিসা', '01740423829', 'user97@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(64, 2, 'আশফাক', '01700433305', 'user433@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(65, 10, 'আশফাক', '01716139091', 'user206@example.com', 'আপনারা কি ঢাকার বাইরে ডেলিভারি দেন?'),
(66, 7, 'ফারহানা', '01799870158', 'user444@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(67, 6, 'তানভীর', '01786688043', 'user241@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(68, 6, 'সাদিয়া', '01796418992', 'user86@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(69, 4, 'ইমরান', '01752823398', 'user275@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(70, 2, 'তানভীর', '01784701087', 'user232@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(71, 5, 'রাহুল', '01798022465', 'user324@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(72, 6, 'আশফাক', '01700775377', 'user452@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(73, 8, 'ফারহানা', '01724227072', 'user153@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(74, 1, 'নাফিসা', '01746519606', 'user267@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(75, 8, 'নাফিসা', '01729245203', 'user377@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(76, 2, 'সুমাইয়া', '01732414582', 'user67@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(77, 1, 'তানভীর', '01704929181', 'user250@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(78, 3, 'সুমাইয়া', '01793803207', 'user154@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(79, 8, 'ফারহানা', '01761943921', 'user29@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(80, 10, 'সাদিয়া', '01773108540', 'user45@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(81, 10, 'সুমাইয়া', '01782727609', 'user338@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(82, 5, 'সাদিয়া', '01757853032', 'user63@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(83, 1, 'আশফাক', '01730418240', 'user202@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(84, 4, 'সুমাইয়া', '01708622046', 'user420@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(85, 2, 'নাফিসা', '01725889391', 'user237@example.com', 'আপনারা কি ঢাকার বাইরে ডেলিভারি দেন?'),
(86, 6, 'নাফিসা', '01791698710', 'user436@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(87, 4, 'সুমাইয়া', '01764479578', 'user365@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(88, 4, 'ইমরান', '01724595897', 'user119@example.com', 'আমার শেষ অর্ডারটি ক্যান্সেল করুন।'),
(89, 6, 'ফারহানা', '01710415054', 'user244@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(90, 2, 'মাহিন', '01785405915', 'user426@example.com', 'ওয়েবসাইটটি অনেক ইউজার ফ্রেন্ডলি।'),
(91, 9, 'মাহিন', '01742870646', 'user434@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(92, 7, 'সুমাইয়া', '01780569227', 'user275@example.com', 'সার্ভিসে আমি খুবই সন্তুষ্ট।'),
(93, 1, 'রাহুল', '01722047758', 'user478@example.com', 'আমার অর্ডার এখনো ডেলিভারি হয়নি।'),
(94, 7, 'রাহুল', '01742125766', 'user411@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(95, 8, 'তানভীর', '01777903667', 'user143@example.com', 'আজকের অফার সম্পর্কে জানতে চাই।'),
(96, 6, 'ইমরান', '01771352602', 'user236@example.com', 'গতকালের কেনা প্রোডাক্ট কি রিটার্ন করা যাবে?'),
(97, 7, 'ইমরান', '01714501487', 'user433@example.com', 'পেমেন্ট কনফার্মেশন এখনো পাইনি।'),
(98, 9, 'ইমরান', '01751015905', 'user351@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(99, 8, 'নাফিসা', '01724602609', 'user252@example.com', 'বাল্ক অর্ডার করলে কি ডিসকাউন্ট পাব?'),
(100, 4, 'ইমরান', '01791988382', 'user371@example.com', 'হটলাইন নাম্বারটি দিলে ভালো হয়।'),
(128, 11, 'shanjida azim shorna', '01744842746', 'shanjidaazimshorna@gmail.com', 'HELLO'),
(129, 11, 'Shorna', '01887337586', 'shanjidaazimshorna@gmail.com', 'no fruits are available');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `total_products` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `method` varchar(50) NOT NULL,
  `payment_status` enum('pending','completed','return') NOT NULL DEFAULT 'pending',
  `placed_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `number`, `address`, `total_products`, `total_price`, `method`, `payment_status`, `placed_on`) VALUES
(2, 1, 'Jamil', 'user272@example.com', '01729780974', 'Rajshahi', '4', 1263.00, 'Cash on Delivery', 'completed', '2025-07-21 22:14:37'),
(3, 1, 'Jamil', 'user93@example.com', '01758330678', 'Dhaka', '9', 4964.00, 'Cash on Delivery', 'completed', '2025-08-01 22:14:37'),
(4, 1, 'Jamil', 'user125@example.com', '01850406245', 'Khulna', '7', 4484.00, 'bKash', 'completed', '2025-07-31 22:14:37'),
(5, 1, 'Mitu', 'user214@example.com', '01646981159', 'Rajshahi', '1', 3644.00, 'bKash', 'completed', '2025-08-04 22:14:37'),
(6, 1, 'Tariq', 'user195@example.com', '01674169977', 'Dhaka', '7', 4216.00, 'Cash on Delivery', 'pending', '2025-08-13 22:14:37'),
(7, 1, 'Farzana', 'user464@example.com', '01881550612', 'Barisal', '8', 4904.00, 'bKash', 'pending', '2025-08-02 22:14:37'),
(8, 1, 'Tariq', 'user483@example.com', '01682561053', 'Khulna', '6', 2244.00, 'bKash', 'completed', '2025-07-23 22:14:37'),
(9, 1, 'Farzana', 'user402@example.com', '01707489828', 'Khulna', '9', 402.00, 'Nagad', 'completed', '2025-08-13 22:14:37'),
(10, 1, 'Mitu', 'user93@example.com', '01813459061', 'Dhaka', '9', 2191.00, 'bKash', 'completed', '2025-08-11 22:14:37'),
(11, 1, 'Tariq', 'user3@example.com', '01706748181', 'Sylhet', '8', 2581.00, 'Cash on Delivery', 'completed', '2025-08-16 22:14:37'),
(12, 1, 'Jamil', 'user424@example.com', '01830300701', 'Chittagong', '2', 5076.00, 'bKash', 'pending', '2025-07-23 22:14:37'),
(13, 1, 'Mitu', 'user444@example.com', '01690809583', 'Barisal', '4', 1074.00, 'Nagad', 'pending', '2025-08-06 22:14:37'),
(14, 1, 'Farzana', 'user312@example.com', '01656259787', 'Dhaka', '8', 3667.00, 'Cash on Delivery', 'completed', '2025-08-18 22:14:37'),
(15, 1, 'Rahim', 'user126@example.com', '01747422691', 'Sylhet', '1', 392.00, 'Cash on Delivery', 'completed', '2025-08-06 22:14:37'),
(16, 1, 'Mitu', 'user478@example.com', '01862070965', 'Rajshahi', '9', 4767.00, 'Cash on Delivery', 'pending', '2025-08-16 22:14:37'),
(17, 1, 'Jamil', 'user298@example.com', '01798145545', 'Rajshahi', '7', 2713.00, 'Nagad', 'pending', '2025-07-20 22:14:37'),
(18, 1, 'Nusrat', 'user452@example.com', '01897851914', 'Chittagong', '3', 3741.00, 'Nagad', 'completed', '2025-08-05 22:14:37'),
(19, 1, 'Mitu', 'user6@example.com', '01605590655', 'Dhaka', '3', 651.00, 'Nagad', 'completed', '2025-08-09 22:14:37'),
(20, 1, 'Shakil', 'user63@example.com', '01773351709', 'Rajshahi', '9', 3110.00, 'bKash', 'completed', '2025-08-01 22:14:37'),
(21, 1, 'Rahim', 'user49@example.com', '01719900229', 'Sylhet', '4', 2919.00, 'Nagad', 'pending', '2025-08-09 22:14:37'),
(22, 1, 'Tariq', 'user394@example.com', '01686840546', 'Dhaka', '6', 2832.00, 'Cash on Delivery', 'completed', '2025-07-22 22:14:37'),
(23, 1, 'Mitu', 'user352@example.com', '01741275654', 'Chittagong', '9', 1586.00, 'Cash on Delivery', 'pending', '2025-08-17 22:14:37'),
(24, 1, 'Farzana', 'user321@example.com', '01690769445', 'Rajshahi', '1', 2133.00, 'Nagad', 'pending', '2025-08-07 22:14:37'),
(25, 1, 'Tariq', 'user313@example.com', '01745778343', 'Rajshahi', '4', 4744.00, 'Nagad', 'completed', '2025-08-13 22:14:37'),
(26, 1, 'Shakil', 'user298@example.com', '01857503146', 'Rajshahi', '10', 1536.00, 'bKash', 'completed', '2025-07-25 22:14:37'),
(27, 1, 'Shanjida', 'user266@example.com', '01740134662', 'Sylhet', '4', 1876.00, 'Nagad', 'pending', '2025-07-25 22:14:37'),
(28, 1, 'Farzana', 'user17@example.com', '01744731904', 'Chittagong', '2', 3260.00, 'Nagad', 'pending', '2025-08-02 22:14:37'),
(29, 1, 'Shakil', 'user392@example.com', '01806095409', 'Dhaka', '4', 2751.00, 'bKash', 'pending', '2025-07-23 22:14:37'),
(30, 1, 'Shanjida', 'user186@example.com', '01797769596', 'Chittagong', '10', 706.00, 'Nagad', 'completed', '2025-07-22 22:14:37'),
(31, 1, 'Tariq', 'user464@example.com', '01615109644', 'Khulna', '3', 3197.00, 'bKash', 'completed', '2025-08-13 22:14:37'),
(32, 1, 'Shanjida', 'user235@example.com', '01632837804', 'Dhaka', '4', 2161.00, 'Nagad', 'completed', '2025-08-17 22:14:37'),
(33, 1, 'Shanjida', 'user480@example.com', '01768110800', 'Barisal', '10', 4701.00, 'Nagad', 'pending', '2025-08-04 22:14:37'),
(34, 1, 'Farzana', 'user127@example.com', '01730086791', 'Khulna', '8', 2262.00, 'Nagad', 'completed', '2025-07-23 22:14:37'),
(35, 1, 'Jamil', 'user159@example.com', '01654397876', 'Barisal', '3', 1365.00, 'bKash', 'pending', '2025-08-08 22:14:37'),
(36, 1, 'Shakil', 'user125@example.com', '01620747907', 'Rajshahi', '8', 679.00, 'Cash on Delivery', 'completed', '2025-08-06 22:14:37'),
(38, 1, 'Nusrat', 'user155@example.com', '01897709879', 'Dhaka', '2', 4282.00, 'bKash', 'completed', '2025-08-15 22:14:37'),
(39, 1, 'Jamil', 'user434@example.com', '01834985604', 'Chittagong', '3', 914.00, 'Cash on Delivery', 'pending', '2025-07-23 22:14:37'),
(40, 1, 'Mitu', 'user259@example.com', '01803596290', 'Barisal', '2', 1616.00, 'Cash on Delivery', 'pending', '2025-07-21 22:14:37'),
(41, 1, 'Shakil', 'user321@example.com', '01879454823', 'Sylhet', '9', 941.00, 'Cash on Delivery', 'completed', '2025-08-09 22:14:37'),
(42, 1, 'Jamil', 'user435@example.com', '01621060471', 'Sylhet', '6', 1647.00, 'Cash on Delivery', 'pending', '2025-07-24 22:14:37'),
(43, 1, 'Mitu', 'user49@example.com', '01684806887', 'Dhaka', '8', 2350.00, 'Nagad', 'pending', '2025-08-07 22:14:37'),
(44, 1, 'Tariq', 'user317@example.com', '01748944325', 'Rajshahi', '5', 1967.00, 'bKash', 'completed', '2025-08-04 22:14:37'),
(45, 1, 'Jamil', 'user343@example.com', '01886182258', 'Sylhet', '8', 2486.00, 'Cash on Delivery', 'completed', '2025-08-06 22:14:37'),
(46, 1, 'Rahim', 'user83@example.com', '01888791985', 'Chittagong', '8', 3037.00, 'Nagad', 'pending', '2025-08-18 22:14:37'),
(47, 1, 'Nusrat', 'user381@example.com', '01703787394', 'Khulna', '2', 3134.00, 'bKash', 'completed', '2025-08-12 22:14:37'),
(48, 1, 'Tariq', 'user460@example.com', '01615500611', 'Rajshahi', '4', 1337.00, 'Cash on Delivery', 'pending', '2025-08-07 22:14:37'),
(49, 1, 'Shanjida', 'user433@example.com', '01626530566', 'Barisal', '10', 1865.00, 'Nagad', 'pending', '2025-07-24 22:14:37'),
(50, 1, 'Shakil', 'user402@example.com', '01837893793', 'Rajshahi', '5', 1993.00, 'bKash', 'pending', '2025-07-23 22:14:37'),
(51, 1, 'Farzana', 'user7@example.com', '01673729551', 'Chittagong', '3', 2794.00, 'Cash on Delivery', 'completed', '2025-08-04 22:14:37'),
(52, 1, 'Jamil', 'user464@example.com', '01603614634', 'Chittagong', '4', 4842.00, 'Nagad', 'completed', '2025-08-02 22:14:37'),
(53, 1, 'Nusrat', 'user218@example.com', '01755928383', 'Chittagong', '10', 3538.00, 'Nagad', 'pending', '2025-07-20 22:14:37'),
(54, 1, 'Mitu', 'user153@example.com', '01774116315', 'Barisal', '3', 383.00, 'Nagad', 'pending', '2025-07-24 22:14:37'),
(55, 1, 'Jamil', 'user148@example.com', '01645812844', 'Barisal', '10', 284.00, 'bKash', 'completed', '2025-07-25 22:14:37'),
(56, 1, 'Mitu', 'user117@example.com', '01882305290', 'Dhaka', '3', 240.00, 'bKash', 'pending', '2025-07-24 22:14:37'),
(57, 1, 'Jamil', 'user180@example.com', '01740727450', 'Chittagong', '10', 4289.00, 'bKash', 'completed', '2025-08-07 22:14:37'),
(58, 1, 'Rahim', 'user202@example.com', '01630059738', 'Chittagong', '2', 5018.00, 'bKash', 'pending', '2025-07-20 22:14:37'),
(59, 1, 'Jamil', 'user106@example.com', '01765264962', 'Dhaka', '10', 1954.00, 'Cash on Delivery', 'completed', '2025-07-25 22:14:37'),
(60, 1, 'Shakil', 'user60@example.com', '01682711902', 'Dhaka', '3', 1890.00, 'Nagad', 'completed', '2025-08-13 22:14:37'),
(61, 1, 'Nusrat', 'user160@example.com', '01615177605', 'Chittagong', '4', 3814.00, 'Nagad', 'pending', '2025-08-16 22:14:37'),
(62, 1, 'Farzana', 'user352@example.com', '01769235211', 'Sylhet', '9', 1256.00, 'bKash', 'completed', '2025-08-10 22:14:37'),
(63, 1, 'Shanjida', 'user219@example.com', '01847641050', 'Sylhet', '7', 3042.00, 'Cash on Delivery', 'completed', '2025-07-26 22:14:37'),
(64, 1, 'Shanjida', 'user454@example.com', '01651471295', 'Dhaka', '2', 2315.00, 'Nagad', 'pending', '2025-07-25 22:14:37'),
(65, 1, 'Tariq', 'user36@example.com', '01854961851', 'Dhaka', '7', 679.00, 'bKash', 'completed', '2025-08-09 22:14:37'),
(66, 1, 'Shakil', 'user192@example.com', '01810035588', 'Khulna', '7', 1561.00, 'bKash', 'pending', '2025-08-04 22:14:37'),
(67, 1, 'Rahim', 'user93@example.com', '01881016243', 'Dhaka', '9', 4262.00, 'bKash', 'completed', '2025-08-09 22:14:37'),
(68, 1, 'Tariq', 'user49@example.com', '01805553541', 'Dhaka', '7', 3400.00, 'bKash', 'pending', '2025-08-09 22:14:37'),
(69, 1, 'Tariq', 'user355@example.com', '01888158261', 'Sylhet', '6', 2488.00, 'Nagad', 'completed', '2025-08-10 22:14:37'),
(70, 1, 'Shanjida', 'user186@example.com', '01758464144', 'Rajshahi', '1', 3542.00, 'Cash on Delivery', 'pending', '2025-07-25 22:14:37'),
(71, 1, 'Shakil', 'user485@example.com', '01779795441', 'Dhaka', '7', 4823.00, 'Nagad', 'pending', '2025-08-07 22:14:37'),
(72, 1, 'Shanjida', 'user90@example.com', '01746250375', 'Barisal', '1', 2801.00, 'bKash', 'pending', '2025-08-17 22:14:37'),
(73, 1, 'Jamil', 'user89@example.com', '01680674718', 'Sylhet', '3', 4470.00, 'bKash', 'pending', '2025-07-29 22:14:37'),
(74, 1, 'Shanjida', 'user229@example.com', '01841838777', 'Rajshahi', '9', 2427.00, 'bKash', 'completed', '2025-08-04 22:14:37'),
(75, 1, 'Mitu', 'user53@example.com', '01723028232', 'Sylhet', '5', 5048.00, 'bKash', 'pending', '2025-08-15 22:14:37'),
(76, 1, 'Farzana', 'user152@example.com', '01823979578', 'Sylhet', '9', 4447.00, 'Nagad', 'pending', '2025-08-06 22:14:37'),
(77, 1, 'Tariq', 'user452@example.com', '01796236847', 'Rajshahi', '9', 2528.00, 'Nagad', 'pending', '2025-08-12 22:14:37'),
(78, 1, 'Shanjida', 'user210@example.com', '01865786845', 'Chittagong', '2', 2479.00, 'Nagad', 'completed', '2025-08-14 22:14:37'),
(79, 1, 'Rahim', 'user426@example.com', '01740543338', 'Sylhet', '6', 1703.00, 'Nagad', 'completed', '2025-08-18 22:14:37'),
(80, 1, 'Shakil', 'user73@example.com', '01790395476', 'Sylhet', '8', 3467.00, 'Cash on Delivery', 'pending', '2025-07-27 22:14:37'),
(81, 1, 'Nusrat', 'user361@example.com', '01611312496', 'Dhaka', '1', 248.00, 'Cash on Delivery', 'pending', '2025-08-08 22:14:37'),
(82, 1, 'Jamil', 'user491@example.com', '01743394921', 'Khulna', '9', 3573.00, 'Cash on Delivery', 'pending', '2025-07-29 22:14:37'),
(83, 1, 'Jamil', 'user138@example.com', '01841512029', 'Chittagong', '6', 1730.00, 'Nagad', 'pending', '2025-08-08 22:14:37'),
(84, 1, 'Tariq', 'user454@example.com', '01823558817', 'Dhaka', '9', 4997.00, 'bKash', 'completed', '2025-08-11 22:14:37'),
(85, 1, 'Tariq', 'user64@example.com', '01876736273', 'Chittagong', '4', 1395.00, 'Cash on Delivery', 'completed', '2025-07-25 22:14:37'),
(86, 1, 'Tariq', 'user212@example.com', '01717015226', 'Sylhet', '3', 784.00, 'Nagad', 'pending', '2025-08-06 22:14:37'),
(87, 1, 'Mitu', 'user87@example.com', '01841896060', 'Rajshahi', '2', 1093.00, 'bKash', 'pending', '2025-08-15 22:14:37'),
(88, 1, 'Nusrat', 'user212@example.com', '01790095400', 'Barisal', '7', 1688.00, 'Nagad', 'completed', '2025-08-09 22:14:37'),
(89, 1, 'Mitu', 'user385@example.com', '01791105086', 'Barisal', '5', 4046.00, 'bKash', 'pending', '2025-07-21 22:14:37'),
(90, 1, 'Shanjida', 'user316@example.com', '01799965352', 'Khulna', '3', 3505.00, 'Nagad', 'completed', '2025-08-04 22:14:37'),
(91, 1, 'Shanjida', 'user5@example.com', '01768234771', 'Sylhet', '3', 3686.00, 'Nagad', 'completed', '2025-08-11 22:14:37'),
(92, 1, 'Rahim', 'user16@example.com', '01628296456', 'Khulna', '7', 4987.00, 'Cash on Delivery', 'pending', '2025-07-30 22:14:37'),
(93, 1, 'Jamil', 'user105@example.com', '01764067421', 'Dhaka', '10', 1211.00, 'bKash', 'pending', '2025-08-18 22:14:37'),
(94, 1, 'Rahim', 'user415@example.com', '01608078511', 'Rajshahi', '2', 4137.00, 'bKash', 'completed', '2025-07-23 22:14:37'),
(95, 1, 'Jamil', 'user178@example.com', '01714437253', 'Barisal', '1', 4245.00, 'Nagad', 'pending', '2025-08-18 22:14:37'),
(96, 1, 'Tariq', 'user26@example.com', '01715676690', 'Sylhet', '8', 1350.00, 'Cash on Delivery', 'completed', '2025-08-01 22:14:37'),
(97, 1, 'Tariq', 'user158@example.com', '01816624825', 'Rajshahi', '2', 3821.00, 'Cash on Delivery', 'pending', '2025-08-17 22:14:37'),
(98, 1, 'Mitu', 'user185@example.com', '01822088608', 'Rajshahi', '8', 4744.00, 'bKash', 'pending', '2025-08-09 22:14:37'),
(99, 1, 'Mitu', 'user130@example.com', '01711375821', 'Dhaka', '3', 654.00, 'Nagad', 'pending', '2025-07-24 22:14:37'),
(100, 1, 'Shakil', 'user251@example.com', '01739676784', 'Sylhet', '8', 805.00, 'bKash', 'pending', '2025-07-28 22:14:37'),
(101, 1, 'Jamil', 'user367@example.com', '01702135027', 'Rajshahi', '5', 4840.00, 'Cash on Delivery', 'pending', '2025-07-30 22:14:37'),
(102, 1, 'Jamil', 'user62@example.com', '01645287143', 'Khulna', '5', 1465.00, 'Nagad', 'completed', '2025-07-26 22:14:37'),
(103, 1, 'Jamil', 'user318@example.com', '01837370428', 'Dhaka', '9', 1687.00, 'Nagad', 'completed', '2025-08-17 22:14:37'),
(104, 1, 'Tariq', 'user341@example.com', '01816596808', 'Rajshahi', '7', 3333.00, 'Cash on Delivery', 'pending', '2025-08-11 22:14:37'),
(105, 1, 'Mitu', 'user324@example.com', '01660775203', 'Dhaka', '8', 2949.00, 'bKash', 'pending', '2025-08-15 22:14:37'),
(106, 1, 'Shakil', 'user67@example.com', '01710237766', 'Khulna', '1', 622.00, 'Cash on Delivery', 'pending', '2025-08-05 22:14:37'),
(107, 1, 'Shakil', 'user470@example.com', '01761939012', 'Barisal', '8', 1344.00, 'Nagad', 'completed', '2025-08-08 22:14:37'),
(108, 1, 'Nusrat', 'user109@example.com', '01704307897', 'Dhaka', '4', 3499.00, 'Cash on Delivery', 'pending', '2025-08-18 22:14:37'),
(109, 1, 'Tariq', 'user474@example.com', '01887414504', 'Barisal', '9', 2787.00, 'Cash on Delivery', 'completed', '2025-08-15 22:14:37'),
(110, 1, 'Mitu', 'user2@example.com', '01892290805', 'Barisal', '4', 2125.00, 'Nagad', 'completed', '2025-08-15 22:14:37'),
(111, 1, 'Jamil', 'user253@example.com', '01672627759', 'Sylhet', '8', 3133.00, 'Nagad', 'pending', '2025-07-20 22:14:37'),
(112, 1, 'Shakil', 'user276@example.com', '01729361838', 'Rajshahi', '3', 2900.00, 'Cash on Delivery', 'pending', '2025-08-13 22:14:37'),
(113, 1, 'Shanjida', 'user356@example.com', '01668707608', 'Dhaka', '4', 4178.00, 'Nagad', 'pending', '2025-08-16 22:14:37'),
(114, 1, 'Nusrat', 'user297@example.com', '01745619145', 'Rajshahi', '8', 4963.00, 'bKash', 'completed', '2025-07-28 22:14:37'),
(115, 1, 'Mitu', 'user497@example.com', '01622984455', 'Khulna', '8', 3981.00, 'bKash', 'pending', '2025-08-17 22:14:37'),
(116, 1, 'Farzana', 'user200@example.com', '01684856720', 'Chittagong', '3', 2766.00, 'Nagad', 'pending', '2025-08-18 22:14:37'),
(117, 1, 'Tariq', 'user11@example.com', '01670991761', 'Dhaka', '9', 304.00, 'bKash', 'completed', '2025-07-23 22:14:37'),
(118, 1, 'Rahim', 'user319@example.com', '01725004315', 'Chittagong', '7', 2768.00, 'Nagad', 'completed', '2025-08-05 22:14:37'),
(119, 1, 'Shanjida', 'user31@example.com', '01855202254', 'Dhaka', '9', 4175.00, 'bKash', 'completed', '2025-08-11 22:14:37'),
(120, 1, 'Mitu', 'user333@example.com', '01688147451', 'Khulna', '5', 5057.00, 'bKash', 'completed', '2025-08-07 22:14:37'),
(121, 1, 'Nusrat', 'user413@example.com', '01758393852', 'Dhaka', '3', 3473.00, 'Nagad', 'pending', '2025-07-28 22:14:37'),
(122, 1, 'Tariq', 'user244@example.com', '01858529871', 'Barisal', '7', 3490.00, 'bKash', 'pending', '2025-07-20 22:14:37'),
(123, 1, 'Shakil', 'user207@example.com', '01858814558', 'Dhaka', '8', 3273.00, 'Nagad', 'pending', '2025-08-04 22:14:37'),
(124, 1, 'Nusrat', 'user220@example.com', '01796747458', 'Barisal', '9', 1965.00, 'Cash on Delivery', 'pending', '2025-08-14 22:14:37'),
(125, 1, 'Shanjida', 'user28@example.com', '01832948029', 'Sylhet', '3', 695.00, 'Nagad', 'completed', '2025-08-01 22:14:37'),
(126, 1, 'Shanjida', 'user160@example.com', '01712278846', 'Barisal', '5', 2867.00, 'bKash', 'pending', '2025-08-13 22:14:37'),
(127, 1, 'Shakil', 'user496@example.com', '01790832278', 'Chittagong', '2', 4934.00, 'bKash', 'completed', '2025-08-13 22:14:37'),
(128, 1, 'Rahim', 'user434@example.com', '01753136203', 'Barisal', '3', 1307.00, 'bKash', 'pending', '2025-08-02 22:14:37'),
(129, 1, 'Tariq', 'user90@example.com', '01666479230', 'Rajshahi', '3', 1613.00, 'Nagad', 'completed', '2025-08-11 22:14:37'),
(130, 1, 'Shanjida', 'user195@example.com', '01805348458', 'Chittagong', '3', 2074.00, 'Cash on Delivery', 'pending', '2025-08-15 22:14:37'),
(131, 1, 'Farzana', 'user313@example.com', '01646435243', 'Barisal', '1', 2135.00, 'Nagad', 'completed', '2025-08-07 22:14:37'),
(132, 1, 'Farzana', 'user236@example.com', '01775206097', 'Rajshahi', '8', 2115.00, 'bKash', 'pending', '2025-08-04 22:14:37'),
(133, 1, 'Shakil', 'user70@example.com', '01706064338', 'Khulna', '7', 1994.00, 'Nagad', 'pending', '2025-07-26 22:14:37'),
(134, 1, 'Mitu', 'user24@example.com', '01667268939', 'Barisal', '3', 1086.00, 'Cash on Delivery', 'completed', '2025-07-28 22:14:37'),
(135, 1, 'Jamil', 'user33@example.com', '01834197914', 'Sylhet', '2', 4309.00, 'bKash', 'completed', '2025-08-11 22:14:37'),
(136, 1, 'Shanjida', 'user191@example.com', '01779897278', 'Barisal', '5', 3971.00, 'bKash', 'pending', '2025-07-27 22:14:37'),
(137, 1, 'Mitu', 'user18@example.com', '01659256168', 'Barisal', '9', 2684.00, 'Cash on Delivery', 'completed', '2025-08-18 22:14:37'),
(138, 1, 'Tariq', 'user317@example.com', '01764647721', 'Barisal', '6', 2090.00, 'Cash on Delivery', 'completed', '2025-08-18 22:14:37'),
(139, 1, 'Rahim', 'user257@example.com', '01781234902', 'Khulna', '6', 2776.00, 'Nagad', 'completed', '2025-08-03 22:14:37'),
(140, 1, 'Shakil', 'user352@example.com', '01711298055', 'Sylhet', '7', 4608.00, 'bKash', 'pending', '2025-08-15 22:14:37'),
(141, 1, 'Shanjida', 'user301@example.com', '01850952812', 'Khulna', '4', 4210.00, 'Nagad', 'pending', '2025-08-13 22:14:37'),
(142, 1, 'Rahim', 'user104@example.com', '01890870852', 'Chittagong', '3', 2330.00, 'bKash', 'pending', '2025-08-03 22:14:37'),
(143, 1, 'Nusrat', 'user352@example.com', '01833419129', 'Sylhet', '6', 2436.00, 'bKash', 'completed', '2025-08-07 22:14:37'),
(144, 1, 'Rahim', 'user166@example.com', '01831921156', 'Barisal', '1', 3042.00, 'Nagad', 'pending', '2025-08-12 22:14:37'),
(145, 1, 'Shakil', 'user316@example.com', '01898891383', 'Dhaka', '5', 124.00, 'bKash', 'pending', '2025-08-04 22:14:37'),
(146, 1, 'Tariq', 'user236@example.com', '01772398383', 'Khulna', '6', 2956.00, 'Cash on Delivery', 'completed', '2025-08-13 22:14:37'),
(147, 1, 'Farzana', 'user416@example.com', '01755983699', 'Dhaka', '10', 2859.00, 'Nagad', 'completed', '2025-08-15 22:14:37'),
(148, 1, 'Farzana', 'user283@example.com', '01866707877', 'Sylhet', '1', 878.00, 'bKash', 'pending', '2025-08-05 22:14:37'),
(149, 1, 'Mitu', 'user444@example.com', '01743376470', 'Sylhet', '3', 4364.00, 'bKash', 'completed', '2025-08-09 22:14:37'),
(150, 1, 'Mitu', 'user229@example.com', '01666555090', 'Sylhet', '1', 4542.00, 'bKash', 'pending', '2025-08-16 22:14:37'),
(151, 1, 'Mitu', 'user208@example.com', '01854575922', 'Barisal', '5', 1303.00, 'Nagad', 'completed', '2025-08-08 22:14:37'),
(152, 1, 'Farzana', 'user358@example.com', '01820974706', 'Rajshahi', '5', 3775.00, 'Cash on Delivery', 'pending', '2025-07-22 22:14:37'),
(153, 1, 'Nusrat', 'user483@example.com', '01720135648', 'Dhaka', '4', 1677.00, 'bKash', 'pending', '2025-08-06 22:14:37'),
(154, 1, 'Farzana', 'user342@example.com', '01732492903', 'Dhaka', '5', 4451.00, 'Nagad', 'pending', '2025-07-29 22:14:37'),
(155, 1, 'Nusrat', 'user381@example.com', '01687299558', 'Chittagong', '10', 2356.00, 'Cash on Delivery', 'pending', '2025-08-11 22:14:37'),
(156, 1, 'Nusrat', 'user135@example.com', '01819704018', 'Barisal', '1', 4426.00, 'Cash on Delivery', 'completed', '2025-08-05 22:14:37'),
(157, 1, 'Shakil', 'user50@example.com', '01662530039', 'Sylhet', '2', 1755.00, 'Cash on Delivery', 'completed', '2025-07-24 22:14:37'),
(158, 1, 'Tariq', 'user235@example.com', '01755761164', 'Chittagong', '5', 2259.00, 'Nagad', 'pending', '2025-08-02 22:14:37'),
(159, 1, 'Nusrat', 'user311@example.com', '01709535942', 'Barisal', '8', 3538.00, 'Cash on Delivery', 'pending', '2025-08-14 22:14:37'),
(160, 1, 'Tariq', 'user156@example.com', '01867188077', 'Rajshahi', '10', 328.00, 'bKash', 'pending', '2025-07-31 22:14:37'),
(161, 1, 'Shanjida', 'user134@example.com', '01625308847', 'Rajshahi', '9', 2310.00, 'bKash', 'completed', '2025-08-16 22:14:37'),
(162, 1, 'Shakil', 'user123@example.com', '01869930941', 'Sylhet', '2', 1779.00, 'Cash on Delivery', 'pending', '2025-08-01 22:14:37'),
(163, 1, 'Shanjida', 'user134@example.com', '01639749230', 'Barisal', '10', 133.00, 'Cash on Delivery', 'pending', '2025-07-21 22:14:37'),
(164, 1, 'Mitu', 'user419@example.com', '01884995647', 'Chittagong', '4', 4932.00, 'Nagad', 'pending', '2025-07-29 22:14:37'),
(165, 1, 'Mitu', 'user176@example.com', '01820140960', 'Rajshahi', '9', 2782.00, 'Cash on Delivery', 'completed', '2025-08-15 22:14:37'),
(166, 1, 'Tariq', 'user347@example.com', '01793431813', 'Dhaka', '8', 2597.00, 'Cash on Delivery', 'pending', '2025-08-02 22:14:37'),
(167, 1, 'Nusrat', 'user168@example.com', '01620338900', 'Khulna', '5', 2029.00, 'bKash', 'pending', '2025-08-17 22:14:37'),
(168, 1, 'Rahim', 'user233@example.com', '01707168081', 'Khulna', '9', 1614.00, 'Nagad', 'pending', '2025-08-01 22:14:37'),
(169, 1, 'Rahim', 'user387@example.com', '01882458445', 'Khulna', '2', 2195.00, 'Nagad', 'pending', '2025-08-15 22:14:37'),
(170, 1, 'Shakil', 'user139@example.com', '01608644973', 'Chittagong', '5', 2546.00, 'Nagad', 'pending', '2025-08-07 22:14:37'),
(171, 1, 'Shanjida', 'user61@example.com', '01681986255', 'Dhaka', '2', 4658.00, 'Cash on Delivery', 'pending', '2025-08-02 22:14:37'),
(172, 1, 'Jamil', 'user265@example.com', '01637323305', 'Dhaka', '8', 4363.00, 'Nagad', 'completed', '2025-07-24 22:14:37'),
(173, 1, 'Tariq', 'user195@example.com', '01646603559', 'Rajshahi', '6', 495.00, 'bKash', 'pending', '2025-08-15 22:14:37'),
(174, 1, 'Tariq', 'user316@example.com', '01701042999', 'Sylhet', '10', 2153.00, 'Cash on Delivery', 'completed', '2025-07-27 22:14:37'),
(175, 1, 'Jamil', 'user399@example.com', '01763504931', 'Chittagong', '1', 789.00, 'bKash', 'completed', '2025-08-09 22:14:37'),
(176, 1, 'Mitu', 'user234@example.com', '01688233681', 'Dhaka', '5', 530.00, 'Cash on Delivery', 'pending', '2025-07-21 22:14:37'),
(177, 1, 'Mitu', 'user204@example.com', '01627615324', 'Chittagong', '10', 4657.00, 'Nagad', 'pending', '2025-08-06 22:14:37'),
(178, 1, 'Mitu', 'user73@example.com', '01799873973', 'Barisal', '5', 3760.00, 'Cash on Delivery', 'completed', '2025-08-01 22:14:37'),
(179, 1, 'Rahim', 'user21@example.com', '01643043919', 'Rajshahi', '6', 5021.00, 'Cash on Delivery', 'pending', '2025-07-23 22:14:37'),
(180, 1, 'Rahim', 'user129@example.com', '01647439540', 'Dhaka', '7', 675.00, 'bKash', 'completed', '2025-07-21 22:14:37'),
(181, 1, 'Mitu', 'user384@example.com', '01807518621', 'Dhaka', '8', 569.00, 'Cash on Delivery', 'pending', '2025-07-24 22:14:37'),
(182, 1, 'Shakil', 'user446@example.com', '01665471071', 'Khulna', '5', 4748.00, 'bKash', 'completed', '2025-08-04 22:14:37'),
(183, 1, 'Mitu', 'user104@example.com', '01851347610', 'Rajshahi', '4', 4517.00, 'bKash', 'completed', '2025-08-17 22:14:37'),
(184, 1, 'Nusrat', 'user460@example.com', '01881537614', 'Barisal', '9', 2394.00, 'Nagad', 'pending', '2025-08-07 22:14:37'),
(185, 1, 'Farzana', 'user253@example.com', '01824417516', 'Chittagong', '9', 3463.00, 'Nagad', 'completed', '2025-07-31 22:14:37'),
(186, 1, 'Mitu', 'user399@example.com', '01842466658', 'Rajshahi', '9', 753.00, 'Cash on Delivery', 'completed', '2025-07-30 22:14:37'),
(187, 1, 'Nusrat', 'user116@example.com', '01739844810', 'Rajshahi', '8', 503.00, 'Cash on Delivery', 'completed', '2025-07-23 22:14:37'),
(188, 1, 'Shakil', 'user271@example.com', '01781903255', 'Khulna', '3', 4873.00, 'Cash on Delivery', 'pending', '2025-08-18 22:14:37'),
(189, 1, 'Mitu', 'user310@example.com', '01872570863', 'Sylhet', '8', 2368.00, 'Cash on Delivery', 'pending', '2025-07-26 22:14:37'),
(190, 8, 'Shanjida', 'user92@example.com', '01725687237', 'Rajshahi', '5', 3613.00, 'Cash on Delivery', 'pending', '2025-07-23 22:14:37'),
(191, 8, 'Nusrat', 'user50@example.com', '01604603135', 'Sylhet', '9', 4759.00, 'Cash on Delivery', 'completed', '2025-08-14 22:14:37'),
(192, 8, 'Mitu', 'user424@example.com', '01679682121', 'Sylhet', '2', 2057.00, 'bKash', 'pending', '2025-08-14 22:14:37'),
(193, 8, 'Mitu', 'user85@example.com', '01806834031', 'Barisal', '7', 1882.00, 'Nagad', 'pending', '2025-07-23 22:14:37'),
(194, 8, 'Tariq', 'user94@example.com', '01661109160', 'Khulna', '7', 371.00, 'Cash on Delivery', 'completed', '2025-07-24 22:14:37'),
(195, 8, 'Tariq', 'user18@example.com', '01793093355', 'Dhaka', '7', 4313.00, 'Cash on Delivery', 'completed', '2025-08-18 22:14:37'),
(196, 8, 'Nusrat', 'user441@example.com', '01845734886', 'Khulna', '9', 3409.00, 'Nagad', 'completed', '2025-07-24 22:14:37'),
(197, 8, 'Mitu', 'user379@example.com', '01847980630', 'Barisal', '9', 3189.00, 'bKash', 'completed', '2025-08-15 22:14:37'),
(198, 8, 'Mitu', 'user28@example.com', '01672955440', 'Dhaka', '6', 2311.00, 'bKash', 'completed', '2025-07-25 22:14:37'),
(199, 8, 'Nusrat', 'user349@example.com', '01835834830', 'Barisal', '9', 3628.00, 'Nagad', 'completed', '2025-08-12 22:14:37'),
(200, 8, 'Tariq', 'user162@example.com', '01845911014', 'Dhaka', '2', 2823.00, 'Cash on Delivery', 'pending', '2025-08-05 22:14:37'),
(201, 8, 'Mitu', 'user41@example.com', '01703799816', 'Khulna', '4', 2656.00, 'bKash', 'pending', '2025-08-02 22:14:37'),
(334, 7, 'Alice', 'user485@example.com', '01782534137', 'Chittagong', '7', 2603.00, 'bKash', 'return', '2025-08-03 22:50:07'),
(335, 8, 'Bob', 'user69@example.com', '01781854890', 'Rajshahi', '10', 4015.00, 'Cash on Delivery', 'return', '2025-07-28 22:50:07'),
(336, 6, 'Charlie', 'user142@example.com', '01766334529', 'Khulna', '4', 1513.00, 'bKash', 'return', '2025-08-13 22:50:07'),
(337, 8, 'Eve', 'user376@example.com', '01783113847', 'Sylhet', '1', 2272.00, 'Cash on Delivery', 'return', '2025-08-15 22:50:07'),
(338, 4, 'Bob', 'user123@example.com', '01751072378', 'Sylhet', '6', 1795.00, 'Cash on Delivery', 'return', '2025-08-16 22:50:07'),
(339, 4, 'Charlie', 'user115@example.com', '01780228314', 'Chittagong', '3', 522.00, 'Nagad', 'return', '2025-07-29 22:50:07'),
(340, 1, 'Charlie', 'user386@example.com', '01761341591', 'Rajshahi', '10', 2143.00, 'Cash on Delivery', 'return', '2025-07-20 22:50:07'),
(341, 2, 'David', 'user197@example.com', '01769019193', 'Chittagong', '3', 3078.00, 'Cash on Delivery', 'return', '2025-07-23 22:50:07'),
(342, 1, 'Charlie', 'user23@example.com', '01797665017', 'Rajshahi', '9', 3974.00, 'bKash', 'return', '2025-08-18 22:50:07'),
(343, 7, 'Alice', 'user352@example.com', '01716384364', 'Rajshahi', '1', 1115.00, 'Nagad', 'return', '2025-08-05 22:50:07'),
(344, 9, 'David', 'user105@example.com', '01784891263', 'Rajshahi', '6', 4420.00, 'Nagad', 'return', '2025-07-24 22:50:07'),
(345, 3, 'Charlie', 'user384@example.com', '01739652669', 'Rajshahi', '3', 482.00, 'Nagad', 'return', '2025-08-09 22:50:07'),
(346, 5, 'Alice', 'user249@example.com', '01704172244', 'Rajshahi', '5', 920.00, 'bKash', 'return', '2025-07-30 22:50:07'),
(347, 1, 'Alice', 'user82@example.com', '01770987165', 'Dhaka', '2', 3811.00, 'Cash on Delivery', 'return', '2025-08-02 22:50:07'),
(348, 3, 'Charlie', 'user352@example.com', '01711113359', 'Khulna', '9', 609.00, 'Nagad', 'return', '2025-07-21 22:50:07'),
(349, 2, 'Eve', 'user60@example.com', '01786661109', 'Sylhet', '3', 2142.00, 'Cash on Delivery', 'return', '2025-08-18 22:50:07'),
(350, 3, 'Charlie', 'user106@example.com', '01781076187', 'Khulna', '7', 859.00, 'Nagad', 'return', '2025-08-16 22:50:07'),
(351, 3, 'Alice', 'user310@example.com', '01785251066', 'Khulna', '5', 744.00, 'Cash on Delivery', 'return', '2025-07-25 22:50:07'),
(352, 3, 'Alice', 'user217@example.com', '01798143936', 'Rajshahi', '1', 3084.00, 'Nagad', 'return', '2025-07-23 22:50:07'),
(353, 3, 'Charlie', 'user107@example.com', '01727717436', 'Rajshahi', '10', 1554.00, 'Nagad', 'return', '2025-07-26 22:50:07'),
(354, 8, 'Charlie', 'user222@example.com', '01752649352', 'Chittagong', '10', 3740.00, 'Nagad', 'return', '2025-08-15 22:50:07'),
(355, 1, 'David', 'user369@example.com', '01740001069', 'Rajshahi', '8', 1634.00, 'bKash', 'return', '2025-07-27 22:50:07'),
(356, 8, 'Charlie', 'user90@example.com', '01744707417', 'Rajshahi', '2', 3132.00, 'bKash', 'return', '2025-08-11 22:50:07'),
(357, 5, 'Charlie', 'user495@example.com', '01754066579', 'Rajshahi', '1', 757.00, 'bKash', 'return', '2025-07-24 22:50:07'),
(358, 10, 'Alice', 'user284@example.com', '01762414208', 'Khulna', '3', 4584.00, 'Nagad', 'return', '2025-08-11 22:50:07'),
(359, 9, 'David', 'user456@example.com', '01739833351', 'Chittagong', '1', 3586.00, 'Cash on Delivery', 'return', '2025-07-22 22:50:07'),
(360, 1, 'Bob', 'user368@example.com', '01758398961', 'Rajshahi', '9', 4626.00, 'Cash on Delivery', 'return', '2025-07-26 22:50:07'),
(361, 7, 'Eve', 'user277@example.com', '01704899639', 'Khulna', '8', 1118.00, 'bKash', 'return', '2025-08-01 22:50:07'),
(362, 10, 'Alice', 'user335@example.com', '01700320293', 'Dhaka', '1', 597.00, 'bKash', 'return', '2025-07-25 22:50:07'),
(363, 9, 'Eve', 'user334@example.com', '01776841190', 'Sylhet', '10', 262.00, 'bKash', 'return', '2025-08-18 22:50:07'),
(364, 9, 'Alice', 'user216@example.com', '01755832599', 'Khulna', '9', 2943.00, 'bKash', 'return', '2025-08-09 22:50:07'),
(365, 5, 'Alice', 'user168@example.com', '01731910280', 'Khulna', '10', 916.00, 'Nagad', 'return', '2025-07-25 22:50:07'),
(366, 5, 'Eve', 'user380@example.com', '01733319735', 'Chittagong', '10', 3064.00, 'Cash on Delivery', 'return', '2025-07-27 22:50:07'),
(367, 5, 'Eve', 'user186@example.com', '01703977766', 'Dhaka', '4', 1866.00, 'Nagad', 'return', '2025-07-22 22:50:07'),
(368, 2, 'Alice', 'user163@example.com', '01709641537', 'Khulna', '3', 3972.00, 'Cash on Delivery', 'return', '2025-08-15 22:50:07'),
(369, 4, 'Charlie', 'user26@example.com', '01797222892', 'Rajshahi', '7', 247.00, 'Cash on Delivery', 'return', '2025-08-13 22:50:07'),
(370, 2, 'Alice', 'user460@example.com', '01743521843', 'Khulna', '8', 3605.00, 'Cash on Delivery', 'return', '2025-08-02 22:50:07'),
(371, 4, 'Alice', 'user144@example.com', '01725502251', 'Khulna', '3', 1233.00, 'Cash on Delivery', 'return', '2025-07-31 22:50:07'),
(372, 3, 'Charlie', 'user186@example.com', '01759270399', 'Sylhet', '5', 3917.00, 'bKash', 'return', '2025-07-23 22:50:07'),
(373, 1, 'David', 'user235@example.com', '01713261712', 'Chittagong', '9', 3451.00, 'Nagad', 'return', '2025-08-06 22:50:07'),
(374, 1, 'Eve', 'user331@example.com', '01743087498', 'Dhaka', '6', 1494.00, 'Nagad', 'return', '2025-07-26 22:50:07'),
(375, 7, 'Alice', 'user188@example.com', '01763219053', 'Dhaka', '3', 1577.00, 'bKash', 'return', '2025-08-10 22:50:07'),
(376, 6, 'Eve', 'user102@example.com', '01706028046', 'Rajshahi', '3', 1519.00, 'bKash', 'return', '2025-08-13 22:50:07'),
(377, 1, 'Eve', 'user15@example.com', '01758871280', 'Sylhet', '6', 5035.00, 'bKash', 'return', '2025-08-17 22:50:07'),
(378, 1, 'Alice', 'user311@example.com', '01761105849', 'Dhaka', '2', 646.00, 'Cash on Delivery', 'return', '2025-08-09 22:50:07'),
(379, 3, 'Bob', 'user241@example.com', '01767291379', 'Sylhet', '6', 1150.00, 'Cash on Delivery', 'return', '2025-07-29 22:50:07'),
(380, 7, 'Alice', 'user327@example.com', '01793405610', 'Rajshahi', '8', 3327.00, 'Nagad', 'return', '2025-07-24 22:50:07'),
(381, 5, 'Charlie', 'user165@example.com', '01709296249', 'Khulna', '2', 718.00, 'Cash on Delivery', 'return', '2025-08-17 22:50:07'),
(382, 4, 'David', 'user374@example.com', '01739158563', 'Rajshahi', '5', 4875.00, 'bKash', 'return', '2025-07-29 22:50:07'),
(383, 9, 'Alice', 'user219@example.com', '01760633160', 'Rajshahi', '8', 3901.00, 'bKash', 'return', '2025-07-21 22:50:07'),
(384, 5, 'Bob', 'user227@example.com', '01718827661', 'Khulna', '4', 143.00, 'Nagad', 'return', '2025-07-22 22:50:07'),
(385, 7, 'Bob', 'user305@example.com', '01718584276', 'Dhaka', '10', 2731.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(386, 1, 'Bob', 'user17@example.com', '01739974835', 'Sylhet', '3', 3847.00, 'Nagad', 'return', '2025-08-14 22:50:07'),
(387, 2, 'Bob', 'user86@example.com', '01786051359', 'Rajshahi', '4', 2206.00, 'Cash on Delivery', 'return', '2025-07-22 22:50:07'),
(388, 5, 'Charlie', 'user232@example.com', '01760284855', 'Rajshahi', '4', 3843.00, 'Nagad', 'return', '2025-08-01 22:50:07'),
(389, 7, 'Bob', 'user461@example.com', '01752895365', 'Sylhet', '9', 2737.00, 'Cash on Delivery', 'return', '2025-08-17 22:50:07'),
(390, 10, 'Bob', 'user96@example.com', '01779899768', 'Khulna', '8', 1444.00, 'Cash on Delivery', 'return', '2025-08-09 22:50:07'),
(391, 10, 'David', 'user412@example.com', '01792849069', 'Dhaka', '1', 4614.00, 'Cash on Delivery', 'return', '2025-08-01 22:50:07'),
(392, 2, 'Alice', 'user416@example.com', '01795804448', 'Chittagong', '7', 810.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(393, 6, 'Bob', 'user237@example.com', '01718219116', 'Khulna', '10', 444.00, 'bKash', 'return', '2025-07-23 22:50:07'),
(394, 6, 'Bob', 'user408@example.com', '01710552886', 'Dhaka', '2', 1365.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(395, 4, 'Eve', 'user433@example.com', '01789566788', 'Sylhet', '8', 4825.00, 'bKash', 'return', '2025-08-18 22:50:07'),
(396, 5, 'Alice', 'user395@example.com', '01792117718', 'Chittagong', '5', 2146.00, 'Nagad', 'return', '2025-07-30 22:50:07'),
(397, 9, 'Charlie', 'user348@example.com', '01707683866', 'Chittagong', '3', 2492.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(398, 2, 'Eve', 'user355@example.com', '01796377280', 'Rajshahi', '6', 3810.00, 'Cash on Delivery', 'return', '2025-07-23 22:50:07'),
(399, 4, 'Alice', 'user118@example.com', '01702862767', 'Khulna', '1', 882.00, 'bKash', 'return', '2025-08-17 22:50:07'),
(400, 8, 'David', 'user375@example.com', '01793943196', 'Khulna', '5', 4341.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(401, 6, 'Bob', 'user124@example.com', '01718529076', 'Dhaka', '4', 1564.00, 'bKash', 'return', '2025-07-23 22:50:07'),
(402, 5, 'Charlie', 'user470@example.com', '01736263325', 'Sylhet', '9', 2321.00, 'bKash', 'return', '2025-08-04 22:50:07'),
(403, 8, 'Bob', 'user121@example.com', '01729974302', 'Rajshahi', '10', 3247.00, 'Cash on Delivery', 'return', '2025-07-21 22:50:07'),
(404, 3, 'Charlie', 'user283@example.com', '01740041538', 'Chittagong', '4', 4158.00, 'Cash on Delivery', 'return', '2025-07-30 22:50:07'),
(405, 2, 'David', 'user135@example.com', '01715952594', 'Sylhet', '5', 1907.00, 'bKash', 'return', '2025-07-20 22:50:07'),
(406, 7, 'Alice', 'user466@example.com', '01719316570', 'Dhaka', '3', 4757.00, 'Nagad', 'return', '2025-08-15 22:50:07'),
(407, 4, 'Alice', 'user357@example.com', '01719383703', 'Sylhet', '6', 1553.00, 'Nagad', 'return', '2025-08-16 22:50:07'),
(408, 1, 'Eve', 'user215@example.com', '01743304891', 'Sylhet', '2', 4465.00, 'Cash on Delivery', 'return', '2025-07-30 22:50:07'),
(409, 2, 'David', 'user192@example.com', '01761019844', 'Sylhet', '7', 3620.00, 'bKash', 'return', '2025-08-11 22:50:07'),
(410, 9, 'Charlie', 'user44@example.com', '01783157015', 'Sylhet', '10', 1552.00, 'bKash', 'return', '2025-08-06 22:50:07'),
(411, 8, 'David', 'user368@example.com', '01782217268', 'Sylhet', '1', 3223.00, 'Nagad', 'return', '2025-07-28 22:50:07'),
(412, 8, 'David', 'user222@example.com', '01795647412', 'Khulna', '5', 3365.00, 'Cash on Delivery', 'return', '2025-08-09 22:50:07'),
(413, 5, 'Alice', 'user244@example.com', '01798788996', 'Khulna', '5', 3521.00, 'Cash on Delivery', 'return', '2025-07-28 22:50:07'),
(414, 1, 'Bob', 'user454@example.com', '01786851713', 'Rajshahi', '6', 3490.00, 'Nagad', 'return', '2025-08-10 22:50:07'),
(415, 8, 'Alice', 'user158@example.com', '01715990571', 'Sylhet', '8', 1961.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(416, 5, 'Alice', 'user202@example.com', '01753061485', 'Khulna', '7', 3923.00, 'Nagad', 'return', '2025-08-02 22:50:07'),
(417, 9, 'Charlie', 'user175@example.com', '01701420223', 'Dhaka', '1', 1604.00, 'Cash on Delivery', 'return', '2025-08-03 22:50:07'),
(418, 7, 'Eve', 'user328@example.com', '01743475749', 'Chittagong', '8', 243.00, 'Nagad', 'return', '2025-07-29 22:50:07'),
(419, 6, 'David', 'user34@example.com', '01708116524', 'Chittagong', '8', 1869.00, 'bKash', 'return', '2025-07-24 22:50:07'),
(420, 2, 'Alice', 'user451@example.com', '01733916525', 'Sylhet', '10', 4067.00, 'Cash on Delivery', 'return', '2025-08-15 22:50:07'),
(421, 4, 'Bob', 'user95@example.com', '01725662008', 'Rajshahi', '9', 4412.00, 'Nagad', 'return', '2025-07-21 22:50:07'),
(422, 1, 'Charlie', 'user15@example.com', '01780885221', 'Sylhet', '4', 5045.00, 'Nagad', 'return', '2025-08-14 22:50:07'),
(423, 3, 'Eve', 'user483@example.com', '01793554011', 'Rajshahi', '2', 1112.00, 'Nagad', 'return', '2025-07-26 22:50:07'),
(424, 10, 'Bob', 'user353@example.com', '01761584536', 'Sylhet', '10', 4736.00, 'Nagad', 'return', '2025-07-21 22:50:07'),
(425, 6, 'Eve', 'user354@example.com', '01792591818', 'Khulna', '8', 1283.00, 'Nagad', 'return', '2025-07-21 22:50:07'),
(426, 10, 'Eve', 'user202@example.com', '01749160694', 'Chittagong', '8', 378.00, 'Cash on Delivery', 'return', '2025-07-24 22:50:07'),
(427, 2, 'Charlie', 'user256@example.com', '01731186170', 'Dhaka', '3', 4841.00, 'Cash on Delivery', 'return', '2025-07-27 22:50:07'),
(428, 5, 'Eve', 'user187@example.com', '01704275858', 'Dhaka', '4', 2048.00, 'Nagad', 'return', '2025-08-01 22:50:07'),
(429, 1, 'Bob', 'user409@example.com', '01795906170', 'Chittagong', '9', 1227.00, 'bKash', 'return', '2025-08-13 22:50:07'),
(430, 2, 'Bob', 'user288@example.com', '01727112520', 'Rajshahi', '4', 4382.00, 'Cash on Delivery', 'return', '2025-08-01 22:50:07'),
(431, 3, 'Bob', 'user384@example.com', '01701518861', 'Rajshahi', '9', 3936.00, 'bKash', 'return', '2025-07-31 22:50:07'),
(432, 10, 'Alice', 'user65@example.com', '01760570174', 'Rajshahi', '4', 208.00, 'Nagad', 'return', '2025-07-30 22:50:07'),
(433, 4, 'Eve', 'user328@example.com', '01740599105', 'Dhaka', '2', 1889.00, 'bKash', 'return', '2025-08-12 22:50:07'),
(434, 7, 'David', 'user271@example.com', '01758432905', 'Chittagong', '8', 3978.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(435, 3, 'Bob', 'user163@example.com', '01791610293', 'Rajshahi', '3', 2961.00, 'Cash on Delivery', 'return', '2025-08-06 22:50:07'),
(436, 1, 'Eve', 'user285@example.com', '01702164799', 'Khulna', '10', 2900.00, 'Nagad', 'return', '2025-08-18 22:50:07'),
(437, 3, 'Alice', 'user416@example.com', '01785548413', 'Rajshahi', '4', 1954.00, 'Nagad', 'return', '2025-08-18 22:50:07'),
(438, 6, 'Eve', 'user284@example.com', '01725516897', 'Khulna', '2', 4085.00, 'Nagad', 'return', '2025-07-20 22:50:07'),
(439, 9, 'Charlie', 'user287@example.com', '01754084637', 'Sylhet', '4', 3209.00, 'Cash on Delivery', 'return', '2025-07-22 22:50:07'),
(440, 2, 'Eve', 'user211@example.com', '01718506835', 'Rajshahi', '8', 3916.00, 'bKash', 'return', '2025-08-02 22:50:07'),
(441, 1, 'David', 'user139@example.com', '01728913603', 'Rajshahi', '2', 797.00, 'Cash on Delivery', 'return', '2025-08-14 22:50:07'),
(442, 4, 'Bob', 'user341@example.com', '01736140486', 'Rajshahi', '8', 2197.00, 'Nagad', 'return', '2025-08-16 22:50:07'),
(443, 8, 'David', 'user156@example.com', '01733608181', 'Rajshahi', '8', 2105.00, 'Nagad', 'return', '2025-07-23 22:50:07'),
(444, 1, 'Charlie', 'user477@example.com', '01756182151', 'Sylhet', '1', 2478.00, 'Cash on Delivery', 'return', '2025-08-04 22:50:07'),
(445, 9, 'Eve', 'user82@example.com', '01792850534', 'Dhaka', '10', 2074.00, 'Cash on Delivery', 'return', '2025-08-14 22:50:07'),
(446, 6, 'Bob', 'user234@example.com', '01770321925', 'Dhaka', '5', 4891.00, 'bKash', 'return', '2025-08-13 22:50:07'),
(447, 7, 'Eve', 'user122@example.com', '01763977146', 'Khulna', '5', 4013.00, 'bKash', 'return', '2025-07-31 22:50:07'),
(448, 4, 'Eve', 'user143@example.com', '01782323156', 'Chittagong', '9', 2212.00, 'bKash', 'return', '2025-07-30 22:50:07'),
(449, 6, 'Eve', 'user301@example.com', '01741462864', 'Chittagong', '2', 3626.00, 'Cash on Delivery', 'return', '2025-07-20 22:50:07'),
(450, 3, 'Bob', 'user209@example.com', '01742102787', 'Sylhet', '1', 2351.00, 'Cash on Delivery', 'return', '2025-07-23 22:50:07'),
(451, 7, 'David', 'user192@example.com', '01789253251', 'Chittagong', '9', 2586.00, 'Nagad', 'return', '2025-07-31 22:50:07'),
(452, 7, 'Charlie', 'user248@example.com', '01795841587', 'Chittagong', '7', 1694.00, 'bKash', 'return', '2025-08-09 22:50:07'),
(453, 7, 'Alice', 'user26@example.com', '01768978304', 'Chittagong', '5', 1135.00, 'Nagad', 'return', '2025-08-11 22:50:07'),
(454, 10, 'Eve', 'user447@example.com', '01763822215', 'Khulna', '7', 3440.00, 'bKash', 'return', '2025-08-16 22:50:07'),
(455, 3, 'David', 'user144@example.com', '01708139477', 'Khulna', '5', 3768.00, 'Cash on Delivery', 'return', '2025-08-17 22:50:07'),
(456, 6, 'Bob', 'user169@example.com', '01757619393', 'Sylhet', '7', 2422.00, 'bKash', 'return', '2025-08-18 22:50:07'),
(457, 7, 'Eve', 'user41@example.com', '01747710974', 'Dhaka', '3', 4913.00, 'Nagad', 'return', '2025-08-18 22:50:07'),
(458, 2, 'David', 'user428@example.com', '01731027710', 'Sylhet', '10', 132.00, 'Cash on Delivery', 'return', '2025-08-11 22:50:07'),
(459, 2, 'Eve', 'user115@example.com', '01734568687', 'Dhaka', '2', 3931.00, 'Cash on Delivery', 'return', '2025-08-13 22:50:07'),
(460, 10, 'Bob', 'user457@example.com', '01745815332', 'Khulna', '4', 1482.00, 'Cash on Delivery', 'return', '2025-08-10 22:50:07'),
(461, 8, 'Eve', 'user123@example.com', '01752795682', 'Sylhet', '10', 5043.00, 'Cash on Delivery', 'return', '2025-07-30 22:50:07'),
(462, 9, 'Bob', 'user482@example.com', '01791972955', 'Rajshahi', '8', 3889.00, 'bKash', 'return', '2025-08-17 22:50:07'),
(463, 9, 'Eve', 'user66@example.com', '01792762143', 'Chittagong', '5', 2485.00, 'Cash on Delivery', 'return', '2025-07-24 22:50:07'),
(464, 2, 'Alice', 'user432@example.com', '01716739836', 'Chittagong', '8', 5099.00, 'Nagad', 'return', '2025-07-27 22:50:07'),
(465, 5, 'Alice', 'user127@example.com', '01786194419', 'Khulna', '2', 989.00, 'bKash', 'return', '2025-08-06 22:50:07'),
(466, 10, 'Charlie', 'user373@example.com', '01714372396', 'Khulna', '10', 2740.00, 'bKash', 'return', '2025-07-30 22:50:07'),
(467, 4, 'Eve', 'user19@example.com', '01770834351', 'Khulna', '1', 4558.00, 'bKash', 'return', '2025-08-17 22:50:07'),
(468, 3, 'Eve', 'user466@example.com', '01791063454', 'Rajshahi', '1', 688.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(469, 9, 'Alice', 'user267@example.com', '01766682862', 'Rajshahi', '7', 721.00, 'bKash', 'return', '2025-07-27 22:50:07'),
(470, 10, 'Charlie', 'user149@example.com', '01720375729', 'Dhaka', '1', 4092.00, 'Nagad', 'return', '2025-08-18 22:50:07'),
(471, 4, 'Eve', 'user195@example.com', '01721602253', 'Sylhet', '10', 4571.00, 'Nagad', 'return', '2025-07-27 22:50:07'),
(472, 8, 'Bob', 'user212@example.com', '01717168502', 'Khulna', '5', 2047.00, 'bKash', 'return', '2025-08-16 22:50:07'),
(473, 6, 'Bob', 'user23@example.com', '01725782313', 'Dhaka', '10', 2736.00, 'bKash', 'return', '2025-07-31 22:50:07'),
(474, 3, 'Bob', 'user215@example.com', '01749024343', 'Dhaka', '4', 1283.00, 'Cash on Delivery', 'return', '2025-08-18 22:50:07'),
(475, 7, 'Bob', 'user432@example.com', '01714547442', 'Dhaka', '3', 4575.00, 'Nagad', 'return', '2025-07-27 22:50:07'),
(476, 7, 'Alice', 'user319@example.com', '01778591740', 'Dhaka', '8', 3423.00, 'Cash on Delivery', 'return', '2025-08-05 22:50:07'),
(477, 10, 'Charlie', 'user197@example.com', '01760779848', 'Sylhet', '5', 4032.00, 'bKash', 'return', '2025-08-12 22:50:07'),
(478, 6, 'Eve', 'user94@example.com', '01709502009', 'Sylhet', '3', 3358.00, 'bKash', 'return', '2025-08-13 22:50:07'),
(479, 6, 'Bob', 'user36@example.com', '01727803084', 'Dhaka', '1', 3898.00, 'bKash', 'return', '2025-07-25 22:50:07'),
(480, 3, 'Eve', 'user247@example.com', '01788455111', 'Sylhet', '1', 2814.00, 'bKash', 'return', '2025-07-25 22:50:07'),
(481, 6, 'Bob', 'user93@example.com', '01781320614', 'Khulna', '2', 332.00, 'Nagad', 'return', '2025-08-10 22:50:07'),
(482, 8, 'Eve', 'user336@example.com', '01736642501', 'Sylhet', '10', 2679.00, 'bKash', 'return', '2025-08-06 22:50:07'),
(483, 4, 'Charlie', 'user355@example.com', '01785353798', 'Dhaka', '2', 1260.00, 'Nagad', 'return', '2025-08-13 22:50:07'),
(484, 6, 'Alice', 'user447@example.com', '01719441129', 'Chittagong', '9', 2901.00, 'Cash on Delivery', 'return', '2025-07-20 22:50:07'),
(485, 6, 'Eve', 'user325@example.com', '01762679511', 'Dhaka', '1', 3608.00, 'bKash', 'return', '2025-07-30 22:50:07'),
(486, 3, 'Alice', 'user417@example.com', '01788507185', 'Sylhet', '10', 727.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(487, 2, 'David', 'user318@example.com', '01733168232', 'Rajshahi', '8', 2993.00, 'bKash', 'return', '2025-08-12 22:50:07'),
(488, 4, 'Alice', 'user23@example.com', '01719248266', 'Sylhet', '6', 1841.00, 'Cash on Delivery', 'return', '2025-08-14 22:50:07'),
(489, 7, 'Eve', 'user200@example.com', '01734880040', 'Khulna', '7', 3909.00, 'Nagad', 'return', '2025-08-01 22:50:07'),
(490, 6, 'Eve', 'user82@example.com', '01795949295', 'Chittagong', '7', 2128.00, 'Cash on Delivery', 'return', '2025-07-22 22:50:07'),
(491, 6, 'Eve', 'user27@example.com', '01745579862', 'Dhaka', '3', 4169.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(492, 9, 'Eve', 'user34@example.com', '01763667646', 'Sylhet', '1', 736.00, 'bKash', 'return', '2025-08-02 22:50:07'),
(493, 10, 'Bob', 'user320@example.com', '01721941987', 'Dhaka', '3', 3446.00, 'bKash', 'return', '2025-08-16 22:50:07'),
(494, 7, 'Eve', 'user87@example.com', '01744927137', 'Rajshahi', '3', 1243.00, 'Cash on Delivery', 'return', '2025-07-25 22:50:07'),
(495, 2, 'Bob', 'user197@example.com', '01783742769', 'Dhaka', '6', 3114.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(496, 7, 'Eve', 'user429@example.com', '01745354621', 'Rajshahi', '2', 2595.00, 'Cash on Delivery', 'return', '2025-08-12 22:50:07'),
(497, 7, 'David', 'user392@example.com', '01760981953', 'Rajshahi', '7', 1067.00, 'Nagad', 'return', '2025-08-06 22:50:07'),
(498, 1, 'Eve', 'user144@example.com', '01783548396', 'Chittagong', '1', 2505.00, 'Cash on Delivery', 'return', '2025-08-10 22:50:07'),
(499, 10, 'Eve', 'user236@example.com', '01779071939', 'Khulna', '4', 193.00, 'Cash on Delivery', 'return', '2025-08-04 22:50:07'),
(500, 2, 'Bob', 'user330@example.com', '01765230617', 'Chittagong', '5', 2198.00, 'Nagad', 'return', '2025-08-05 22:50:07'),
(501, 10, 'Charlie', 'user369@example.com', '01710479722', 'Chittagong', '3', 1342.00, 'bKash', 'return', '2025-07-22 22:50:07'),
(502, 1, 'Charlie', 'user6@example.com', '01776680462', 'Sylhet', '8', 959.00, 'Nagad', 'return', '2025-08-17 22:50:07'),
(503, 1, 'Alice', 'user280@example.com', '01736657874', 'Dhaka', '7', 4967.00, 'Nagad', 'return', '2025-08-16 22:50:07'),
(504, 10, 'David', 'user188@example.com', '01788853027', 'Chittagong', '10', 3598.00, 'Nagad', 'return', '2025-08-06 22:50:07'),
(505, 10, 'David', 'user140@example.com', '01746849791', 'Khulna', '2', 269.00, 'Nagad', 'return', '2025-08-15 22:50:07'),
(506, 1, 'Eve', 'user302@example.com', '01713895616', 'Sylhet', '1', 2153.00, 'Cash on Delivery', 'return', '2025-07-25 22:50:07'),
(507, 1, 'Alice', 'user372@example.com', '01769200292', 'Chittagong', '1', 3774.00, 'bKash', 'return', '2025-07-23 22:50:07'),
(508, 2, 'Eve', 'user213@example.com', '01726159851', 'Dhaka', '4', 4373.00, 'Cash on Delivery', 'return', '2025-07-22 22:50:07'),
(509, 4, 'David', 'user496@example.com', '01760239004', 'Dhaka', '4', 4412.00, 'Cash on Delivery', 'return', '2025-08-18 22:50:07'),
(510, 8, 'Charlie', 'user398@example.com', '01718499763', 'Khulna', '2', 429.00, 'Nagad', 'return', '2025-08-06 22:50:07'),
(511, 3, 'Alice', 'user463@example.com', '01717579286', 'Dhaka', '10', 3369.00, 'Cash on Delivery', 'return', '2025-08-04 22:50:07'),
(512, 6, 'Bob', 'user61@example.com', '01751780835', 'Chittagong', '6', 994.00, 'Cash on Delivery', 'return', '2025-08-07 22:50:07'),
(513, 4, 'Charlie', 'user290@example.com', '01736112045', 'Dhaka', '3', 352.00, 'bKash', 'return', '2025-08-08 22:50:07'),
(514, 3, 'Bob', 'user469@example.com', '01760479618', 'Chittagong', '3', 3260.00, 'bKash', 'return', '2025-08-16 22:50:07'),
(515, 3, 'Eve', 'user56@example.com', '01764885234', 'Sylhet', '6', 1366.00, 'bKash', 'return', '2025-07-30 22:50:07'),
(516, 8, 'Eve', 'user408@example.com', '01765009841', 'Sylhet', '1', 4752.00, 'bKash', 'return', '2025-08-05 22:50:07'),
(517, 9, 'Alice', 'user363@example.com', '01740717054', 'Sylhet', '1', 3950.00, 'bKash', 'return', '2025-07-22 22:50:07'),
(518, 7, 'Bob', 'user12@example.com', '01798199871', 'Sylhet', '3', 3900.00, 'Cash on Delivery', 'return', '2025-07-23 22:50:07'),
(519, 3, 'Eve', 'user113@example.com', '01766916933', 'Rajshahi', '4', 3633.00, 'bKash', 'return', '2025-08-07 22:50:07'),
(520, 5, 'Alice', 'user236@example.com', '01781607781', 'Rajshahi', '10', 2576.00, 'Nagad', 'return', '2025-08-07 22:50:07'),
(521, 6, 'Eve', 'user192@example.com', '01741111980', 'Sylhet', '3', 3907.00, 'Nagad', 'return', '2025-08-09 22:50:07'),
(522, 9, 'Alice', 'user196@example.com', '01743920603', 'Dhaka', '8', 4404.00, 'Nagad', 'return', '2025-08-13 22:50:07'),
(523, 1, 'Charlie', 'user412@example.com', '01738064842', 'Khulna', '1', 4613.00, 'bKash', 'return', '2025-08-12 22:50:07'),
(524, 10, 'Alice', 'user160@example.com', '01751531610', 'Rajshahi', '6', 4853.00, 'Cash on Delivery', 'return', '2025-08-04 22:50:07'),
(525, 2, 'Bob', 'user134@example.com', '01730698529', 'Rajshahi', '8', 2680.00, 'bKash', 'return', '2025-08-12 22:50:07'),
(526, 1, 'Bob', 'user439@example.com', '01725432157', 'Rajshahi', '5', 1507.00, 'Cash on Delivery', 'return', '2025-08-01 22:50:07'),
(527, 7, 'Charlie', 'user393@example.com', '01726475993', 'Sylhet', '1', 1789.00, 'bKash', 'return', '2025-07-28 22:50:07'),
(528, 9, 'Bob', 'user459@example.com', '01764422225', 'Khulna', '5', 3368.00, 'Cash on Delivery', 'return', '2025-08-13 22:50:07'),
(529, 9, 'Eve', 'user363@example.com', '01797836092', 'Rajshahi', '7', 575.00, 'bKash', 'return', '2025-08-08 22:50:07');
INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `number`, `address`, `total_products`, `total_price`, `method`, `payment_status`, `placed_on`) VALUES
(530, 2, 'Eve', 'user449@example.com', '01780494538', 'Chittagong', '3', 1136.00, 'Cash on Delivery', 'return', '2025-07-21 22:50:07'),
(531, 9, 'Bob', 'user213@example.com', '01792539596', 'Chittagong', '10', 4623.00, 'bKash', 'return', '2025-08-18 22:50:07'),
(532, 4, 'Eve', 'user221@example.com', '01744443669', 'Sylhet', '2', 781.00, 'Cash on Delivery', 'return', '2025-08-04 22:50:07'),
(533, 10, 'Alice', 'user332@example.com', '01708176231', 'Khulna', '9', 5016.00, 'bKash', 'return', '2025-07-22 22:50:07'),
(589, 8, 'ইমরান', 'user16@example.com', '01766135106', 'চট্টগ্রাম', '1', 4147.00, 'Nagad', 'pending', '2025-07-22 22:57:15'),
(590, 2, 'তানভীর', 'user374@example.com', '01792720264', 'চট্টগ্রাম', '3', 4228.00, 'bKash', 'completed', '2025-08-18 22:57:15'),
(591, 8, 'ইমরান', 'user409@example.com', '01758337278', 'খুলনা', '6', 2828.00, 'Nagad', 'completed', '2025-07-22 22:57:15'),
(592, 1, 'মাহিন', 'user327@example.com', '01757690238', 'সিলেট', '9', 3333.00, 'bKash', 'completed', '2025-08-14 22:57:15'),
(593, 9, 'মেহজাবিন', 'user403@example.com', '01736301655', 'খুলনা', '10', 1920.00, 'Cash on Delivery', 'pending', '2025-08-09 22:57:15'),
(594, 7, 'তানভীর', 'user411@example.com', '01701329855', 'রাজশাহী', '10', 645.00, 'bKash', 'return', '2025-08-07 22:57:15'),
(595, 10, 'ইমরান', 'user102@example.com', '01750698309', 'সিলেট', '2', 3771.00, 'bKash', 'return', '2025-08-17 22:57:15'),
(596, 4, 'সাদিয়া', 'user40@example.com', '01750566845', 'চট্টগ্রাম', '10', 4442.00, 'bKash', 'pending', '2025-07-25 22:57:15'),
(597, 6, 'তানভীর', 'user316@example.com', '01739624103', 'ঢাকা', '3', 4825.00, 'Cash on Delivery', 'completed', '2025-07-22 22:57:15'),
(598, 10, 'সুমাইয়া', 'user470@example.com', '01717048269', 'ঢাকা', '7', 1211.00, 'Cash on Delivery', 'completed', '2025-08-13 22:57:15'),
(599, 3, 'ফারহানা', 'user335@example.com', '01798155021', 'সিলেট', '6', 598.00, 'Nagad', 'return', '2025-08-04 22:57:15'),
(600, 10, 'মাহিন', 'user406@example.com', '01737708352', 'খুলনা', '2', 1907.00, 'bKash', 'return', '2025-07-27 22:57:15'),
(601, 4, 'সাদিয়া', 'user51@example.com', '01758090150', 'খুলনা', '3', 2523.00, 'bKash', 'pending', '2025-08-16 22:57:15'),
(602, 10, 'সাদিয়া', 'user339@example.com', '01718702690', 'সিলেট', '10', 243.00, 'Cash on Delivery', 'pending', '2025-08-11 22:57:15'),
(603, 10, 'মেহজাবিন', 'user365@example.com', '01793724034', 'খুলনা', '7', 4905.00, 'Nagad', 'return', '2025-08-01 22:57:15'),
(604, 7, 'মাহিন', 'user285@example.com', '01733855052', 'সিলেট', '9', 2817.00, 'Cash on Delivery', 'pending', '2025-08-09 22:57:15'),
(605, 3, 'সুমাইয়া', 'user479@example.com', '01740245338', 'ঢাকা', '6', 711.00, 'Cash on Delivery', 'completed', '2025-07-22 22:57:15'),
(606, 6, 'ইমরান', 'user363@example.com', '01703799300', 'ঢাকা', '10', 4085.00, 'Cash on Delivery', 'completed', '2025-07-27 22:57:15'),
(607, 8, 'ফারহানা', 'user383@example.com', '01766948899', 'ঢাকা', '3', 438.00, 'bKash', 'pending', '2025-08-09 22:57:15'),
(608, 2, 'ইমরান', 'user381@example.com', '01724309577', 'সিলেট', '10', 4349.00, 'bKash', 'return', '2025-08-05 22:57:15'),
(609, 9, 'রাহুল', 'user373@example.com', '01750692972', 'চট্টগ্রাম', '10', 4739.00, 'Nagad', 'completed', '2025-08-02 22:57:15'),
(610, 9, 'মাহিন', 'user187@example.com', '01712783118', 'খুলনা', '3', 2613.00, 'Nagad', 'pending', '2025-07-27 22:57:15'),
(611, 2, 'মাহিন', 'user168@example.com', '01796811487', 'সিলেট', '3', 4301.00, 'bKash', 'pending', '2025-08-16 22:57:15'),
(612, 1, 'রাহুল', 'user34@example.com', '01718295814', 'রাজশাহী', '1', 104.00, 'Nagad', 'pending', '2025-08-14 22:57:15'),
(613, 10, 'তানভীর', 'user426@example.com', '01723792822', 'রাজশাহী', '5', 2075.00, 'bKash', 'return', '2025-08-13 22:57:15'),
(614, 6, 'সুমাইয়া', 'user222@example.com', '01754117531', 'চট্টগ্রাম', '3', 1242.00, 'Cash on Delivery', 'completed', '2025-07-29 22:57:15'),
(615, 6, 'ইমরান', 'user273@example.com', '01716580701', 'ঢাকা', '5', 4002.00, 'bKash', 'completed', '2025-07-21 22:57:15'),
(616, 6, 'ইমরান', 'user306@example.com', '01750980269', 'রাজশাহী', '1', 447.00, 'Cash on Delivery', 'pending', '2025-07-25 22:57:15'),
(617, 4, 'তানভীর', 'user189@example.com', '01704855382', 'ঢাকা', '5', 3963.00, 'bKash', 'return', '2025-08-03 22:57:15'),
(618, 6, 'সুমাইয়া', 'user278@example.com', '01705309109', 'খুলনা', '9', 1875.00, 'Cash on Delivery', 'pending', '2025-07-20 22:57:15'),
(619, 8, 'ইমরান', 'user9@example.com', '01752302790', 'খুলনা', '3', 2640.00, 'Nagad', 'pending', '2025-08-03 22:57:15'),
(620, 8, 'ফারহানা', 'user377@example.com', '01748075253', 'ঢাকা', '3', 4837.00, 'Nagad', 'return', '2025-07-25 22:57:15'),
(621, 10, 'তানভীর', 'user329@example.com', '01737787147', 'সিলেট', '5', 3071.00, 'bKash', 'completed', '2025-08-08 22:57:15'),
(622, 8, 'মাহিন', 'user270@example.com', '01708190838', 'রাজশাহী', '8', 1459.00, 'Cash on Delivery', 'completed', '2025-08-02 22:57:15'),
(623, 7, 'ইমরান', 'user466@example.com', '01726404659', 'খুলনা', '9', 3402.00, 'Nagad', 'return', '2025-07-28 22:57:15'),
(624, 2, 'মাহিন', 'user221@example.com', '01749654181', 'ঢাকা', '4', 355.00, 'bKash', 'pending', '2025-07-29 22:57:15'),
(625, 8, 'ইমরান', 'user322@example.com', '01785360900', 'চট্টগ্রাম', '2', 3630.00, 'Cash on Delivery', 'pending', '2025-08-05 22:57:15'),
(626, 3, 'সাদিয়া', 'user408@example.com', '01701247090', 'রাজশাহী', '1', 2214.00, 'Nagad', 'pending', '2025-08-04 22:57:15'),
(627, 1, 'ইমরান', 'user473@example.com', '01724987011', 'খুলনা', '4', 1914.00, 'Nagad', 'completed', '2025-08-10 22:57:15'),
(628, 10, 'সাদিয়া', 'user402@example.com', '01789518720', 'ঢাকা', '7', 195.00, 'Cash on Delivery', 'return', '2025-08-08 22:57:15'),
(629, 6, 'ফারহানা', 'user341@example.com', '01708586275', 'চট্টগ্রাম', '7', 985.00, 'Nagad', 'completed', '2025-07-24 22:57:15'),
(630, 6, 'রাহুল', 'user377@example.com', '01757862167', 'রাজশাহী', '5', 1500.00, 'Cash on Delivery', 'return', '2025-07-26 22:57:15'),
(631, 1, 'সুমাইয়া', 'user194@example.com', '01752252863', 'খুলনা', '7', 673.00, 'bKash', 'completed', '2025-08-16 22:57:15'),
(632, 1, 'মেহজাবিন', 'user215@example.com', '01744826470', 'সিলেট', '5', 1553.00, 'Cash on Delivery', 'completed', '2025-08-14 22:57:15'),
(633, 10, 'ফারহানা', 'user169@example.com', '01731473282', 'খুলনা', '9', 3312.00, 'bKash', 'completed', '2025-07-23 22:57:15'),
(634, 1, 'ফারহানা', 'user158@example.com', '01712210191', 'রাজশাহী', '10', 4334.00, 'Cash on Delivery', 'completed', '2025-08-05 22:57:15'),
(635, 1, 'সাদিয়া', 'user327@example.com', '01703610716', 'চট্টগ্রাম', '10', 1465.00, 'bKash', 'pending', '2025-07-23 22:57:15'),
(636, 8, 'মেহজাবিন', 'user186@example.com', '01716966534', 'রাজশাহী', '2', 3169.00, 'bKash', 'completed', '2025-08-03 22:57:15'),
(637, 5, 'ইমরান', 'user313@example.com', '01768837230', 'খুলনা', '8', 787.00, 'bKash', 'pending', '2025-08-06 22:57:15'),
(638, 6, 'তানভীর', 'user483@example.com', '01793558841', 'রাজশাহী', '2', 1277.00, 'Nagad', 'pending', '2025-08-01 22:57:15'),
(639, 7, 'সাদিয়া', 'user119@example.com', '01721578084', 'চট্টগ্রাম', '2', 4530.00, 'Nagad', 'pending', '2025-08-17 22:57:15'),
(640, 8, 'সাদিয়া', 'user479@example.com', '01783442153', 'চট্টগ্রাম', '10', 327.00, 'Cash on Delivery', 'completed', '2025-08-15 22:57:15'),
(641, 1, 'সাদিয়া', 'user233@example.com', '01724084754', 'সিলেট', '4', 852.00, 'Nagad', 'pending', '2025-08-03 22:57:15'),
(642, 9, 'ইমরান', 'user273@example.com', '01719807457', 'চট্টগ্রাম', '2', 4466.00, 'Nagad', 'pending', '2025-08-03 22:57:15'),
(643, 5, 'মাহিন', 'user151@example.com', '01799483235', 'ঢাকা', '4', 3009.00, 'Nagad', 'pending', '2025-07-29 22:57:15'),
(644, 2, 'মাহিন', 'user232@example.com', '01760419363', 'রাজশাহী', '4', 4551.00, 'bKash', 'pending', '2025-07-22 22:57:15'),
(645, 10, 'মেহজাবিন', 'user29@example.com', '01735043265', 'খুলনা', '9', 2869.00, 'Cash on Delivery', 'pending', '2025-07-24 22:57:15'),
(646, 4, 'ফারহানা', 'user11@example.com', '01777421533', 'সিলেট', '8', 993.00, 'Nagad', 'completed', '2025-08-07 22:57:15'),
(647, 6, 'ইমরান', 'user69@example.com', '01734027814', 'চট্টগ্রাম', '5', 1800.00, 'bKash', 'pending', '2025-08-18 22:57:15'),
(648, 7, 'রাহুল', 'user182@example.com', '01767805595', 'চট্টগ্রাম', '5', 2547.00, 'Cash on Delivery', 'pending', '2025-07-24 22:57:15'),
(649, 6, 'সুমাইয়া', 'user151@example.com', '01793459913', 'রাজশাহী', '1', 4386.00, 'Cash on Delivery', 'pending', '2025-08-08 22:57:15'),
(650, 6, 'মেহজাবিন', 'user322@example.com', '01757696089', 'সিলেট', '1', 2011.00, 'Nagad', 'return', '2025-08-18 22:57:15'),
(651, 1, 'তানভীর', 'user203@example.com', '01705612422', 'ঢাকা', '2', 3089.00, 'bKash', 'return', '2025-08-09 22:57:15'),
(652, 3, 'মাহিন', 'user369@example.com', '01710282481', 'চট্টগ্রাম', '3', 792.00, 'Cash on Delivery', 'pending', '2025-08-09 22:57:15'),
(653, 9, 'তানভীর', 'user405@example.com', '01725408216', 'সিলেট', '5', 3748.00, 'Cash on Delivery', 'pending', '2025-08-03 22:57:15'),
(654, 8, 'রাহুল', 'user170@example.com', '01737852950', 'সিলেট', '3', 3123.00, 'Cash on Delivery', 'return', '2025-08-14 22:57:15'),
(655, 10, 'ফারহানা', 'user25@example.com', '01706512062', 'ঢাকা', '8', 5021.00, 'Nagad', 'completed', '2025-07-20 22:57:15'),
(656, 7, 'ফারহানা', 'user489@example.com', '01769205992', 'খুলনা', '6', 1691.00, 'Nagad', 'pending', '2025-07-26 22:57:15'),
(657, 2, 'তানভীর', 'user131@example.com', '01729742302', 'রাজশাহী', '7', 375.00, 'bKash', 'return', '2025-08-07 22:57:15'),
(658, 9, 'মেহজাবিন', 'user79@example.com', '01702924469', 'রাজশাহী', '3', 1931.00, 'Cash on Delivery', 'completed', '2025-08-03 22:57:15'),
(659, 9, 'ইমরান', 'user224@example.com', '01779937139', 'রাজশাহী', '9', 2037.00, 'Cash on Delivery', 'pending', '2025-08-06 22:57:15'),
(660, 7, 'রাহুল', 'user241@example.com', '01709830726', 'ঢাকা', '10', 3329.00, 'bKash', 'pending', '2025-08-18 22:57:15'),
(661, 7, 'রাহুল', 'user212@example.com', '01794755272', 'খুলনা', '6', 767.00, 'Cash on Delivery', 'pending', '2025-08-16 22:57:15'),
(662, 6, 'ফারহানা', 'user224@example.com', '01700745636', 'রাজশাহী', '5', 859.00, 'bKash', 'return', '2025-07-21 22:57:15'),
(663, 9, 'ফারহানা', 'user181@example.com', '01766265775', 'চট্টগ্রাম', '2', 418.00, 'Nagad', 'completed', '2025-08-12 22:57:15'),
(664, 6, 'রাহুল', 'user255@example.com', '01749868814', 'সিলেট', '4', 3681.00, 'bKash', 'completed', '2025-07-24 22:57:15'),
(665, 5, 'ফারহানা', 'user132@example.com', '01782657334', 'চট্টগ্রাম', '3', 875.00, 'Cash on Delivery', 'pending', '2025-08-16 22:57:15'),
(666, 9, 'সুমাইয়া', 'user40@example.com', '01795312407', 'খুলনা', '8', 2055.00, 'bKash', 'return', '2025-08-02 22:57:15'),
(667, 9, 'মাহিন', 'user69@example.com', '01708516796', 'ঢাকা', '9', 538.00, 'Nagad', 'pending', '2025-07-28 22:57:15'),
(668, 1, 'রাহুল', 'user32@example.com', '01721179097', 'সিলেট', '8', 4710.00, 'bKash', 'return', '2025-08-17 22:57:15'),
(669, 2, 'ফারহানা', 'user409@example.com', '01779002228', 'খুলনা', '2', 686.00, 'Cash on Delivery', 'return', '2025-08-17 22:57:15'),
(670, 1, 'মেহজাবিন', 'user310@example.com', '01729565412', 'রাজশাহী', '3', 1347.00, 'bKash', 'completed', '2025-07-20 22:57:15'),
(671, 5, 'ফারহানা', 'user308@example.com', '01786490846', 'খুলনা', '8', 2818.00, 'Cash on Delivery', 'completed', '2025-08-14 22:57:15'),
(672, 7, 'সাদিয়া', 'user208@example.com', '01712425260', 'চট্টগ্রাম', '6', 1986.00, 'bKash', 'return', '2025-07-24 22:57:15'),
(673, 8, 'ফারহানা', 'user293@example.com', '01777675528', 'ঢাকা', '4', 835.00, 'Nagad', 'return', '2025-07-26 22:57:15'),
(674, 10, 'সাদিয়া', 'user68@example.com', '01779329277', 'খুলনা', '5', 2624.00, 'Cash on Delivery', 'pending', '2025-07-20 22:57:15'),
(675, 4, 'ইমরান', 'user376@example.com', '01749453986', 'চট্টগ্রাম', '7', 2211.00, 'Cash on Delivery', 'completed', '2025-08-06 22:57:15'),
(676, 1, 'ইমরান', 'user418@example.com', '01785688619', 'রাজশাহী', '4', 1288.00, 'Cash on Delivery', 'pending', '2025-07-23 22:57:15'),
(677, 9, 'ফারহানা', 'user275@example.com', '01756999252', 'চট্টগ্রাম', '4', 4683.00, 'Nagad', 'pending', '2025-07-21 22:57:15'),
(678, 10, 'মেহজাবিন', 'user350@example.com', '01777105544', 'রাজশাহী', '5', 603.00, 'Cash on Delivery', 'completed', '2025-08-11 22:57:15'),
(679, 10, 'মেহজাবিন', 'user412@example.com', '01734143014', 'চট্টগ্রাম', '2', 959.00, 'Cash on Delivery', 'completed', '2025-08-03 22:57:15'),
(680, 4, 'রাহুল', 'user231@example.com', '01702759646', 'রাজশাহী', '7', 1005.00, 'Nagad', 'return', '2025-07-27 22:57:15'),
(681, 8, 'মাহিন', 'user397@example.com', '01710263287', 'ঢাকা', '4', 1929.00, 'Nagad', 'return', '2025-08-03 22:57:15'),
(682, 3, 'সাদিয়া', 'user331@example.com', '01728178775', 'খুলনা', '3', 514.00, 'bKash', 'return', '2025-08-18 22:57:15'),
(683, 9, 'রাহুল', 'user447@example.com', '01722870809', 'খুলনা', '7', 4338.00, 'Cash on Delivery', 'completed', '2025-07-30 22:57:15'),
(684, 5, 'মাহিন', 'user133@example.com', '01767529426', 'খুলনা', '9', 3605.00, 'Nagad', 'completed', '2025-07-24 22:57:15'),
(685, 1, 'মাহিন', 'user480@example.com', '01796462631', 'সিলেট', '9', 1728.00, 'Cash on Delivery', 'return', '2025-08-18 22:57:15'),
(686, 10, 'মেহজাবিন', 'user377@example.com', '01792230078', 'চট্টগ্রাম', '1', 4913.00, 'Nagad', 'completed', '2025-08-15 22:57:15'),
(687, 3, 'ইমরান', 'user282@example.com', '01725070637', 'খুলনা', '1', 3683.00, 'Cash on Delivery', 'pending', '2025-08-01 22:57:15'),
(688, 4, 'ইমরান', 'user78@example.com', '01733757143', 'চট্টগ্রাম', '1', 4087.00, 'Nagad', 'completed', '2025-07-29 22:57:15'),
(689, 10, 'মাহিন', 'user450@example.com', '01790802365', 'সিলেট', '6', 4944.00, 'bKash', 'pending', '2025-08-18 22:57:15'),
(690, 6, 'মেহজাবিন', 'user40@example.com', '01747067235', 'ঢাকা', '2', 2838.00, 'Cash on Delivery', 'pending', '2025-08-15 22:57:15'),
(691, 6, 'তানভীর', 'user376@example.com', '01797698169', 'রাজশাহী', '3', 1230.00, 'bKash', 'return', '2025-07-28 22:57:15'),
(692, 7, 'তানভীর', 'user339@example.com', '01732367929', 'খুলনা', '10', 542.00, 'bKash', 'pending', '2025-08-08 22:57:15'),
(693, 6, 'ইমরান', 'user225@example.com', '01773841105', 'চট্টগ্রাম', '6', 2722.00, 'Cash on Delivery', 'pending', '2025-08-18 22:57:15'),
(694, 6, 'সাদিয়া', 'user4@example.com', '01781330696', 'ঢাকা', '8', 4249.00, 'Nagad', 'pending', '2025-08-05 22:57:15'),
(695, 2, 'ফারহানা', 'user364@example.com', '01733060285', 'খুলনা', '4', 1993.00, 'Nagad', 'completed', '2025-08-07 22:57:15'),
(696, 10, 'মাহিন', 'user109@example.com', '01725689785', 'রাজশাহী', '5', 609.00, 'Cash on Delivery', 'pending', '2025-08-12 22:57:15'),
(697, 5, 'ফারহানা', 'user23@example.com', '01783229703', 'ঢাকা', '7', 442.00, 'bKash', 'completed', '2025-08-18 22:57:15'),
(698, 9, 'রাহুল', 'user63@example.com', '01725307200', 'সিলেট', '7', 3982.00, 'Nagad', 'return', '2025-08-10 22:57:15'),
(699, 3, 'সুমাইয়া', 'user105@example.com', '01754911285', 'ঢাকা', '10', 1794.00, 'Nagad', 'pending', '2025-08-10 22:57:15'),
(700, 3, 'ফারহানা', 'user143@example.com', '01720451958', 'ঢাকা', '3', 3211.00, 'bKash', 'pending', '2025-08-11 22:57:15'),
(701, 4, 'সুমাইয়া', 'user242@example.com', '01703565399', 'রাজশাহী', '6', 2354.00, 'Nagad', 'completed', '2025-08-15 22:57:15'),
(702, 5, 'মেহজাবিন', 'user159@example.com', '01778567712', 'সিলেট', '6', 3563.00, 'Nagad', 'pending', '2025-08-12 22:57:15'),
(703, 9, 'ইমরান', 'user215@example.com', '01769531881', 'ঢাকা', '9', 3853.00, 'Cash on Delivery', 'pending', '2025-08-10 22:57:15'),
(704, 8, 'রাহুল', 'user373@example.com', '01768218262', 'ঢাকা', '9', 3283.00, 'Nagad', 'pending', '2025-08-03 22:57:15'),
(705, 1, 'ইমরান', 'user358@example.com', '01722052089', 'সিলেট', '2', 3651.00, 'Cash on Delivery', 'pending', '2025-07-23 22:57:15'),
(706, 7, 'ইমরান', 'user373@example.com', '01746051760', 'ঢাকা', '10', 3149.00, 'Cash on Delivery', 'completed', '2025-08-08 22:57:15'),
(707, 9, 'ফারহানা', 'user153@example.com', '01733217321', 'রাজশাহী', '8', 2080.00, 'Nagad', 'pending', '2025-07-28 22:57:15'),
(708, 1, 'তানভীর', 'user188@example.com', '01788082332', 'চট্টগ্রাম', '8', 4694.00, 'bKash', 'completed', '2025-07-28 22:57:15'),
(709, 8, 'সাদিয়া', 'user85@example.com', '01774572119', 'চট্টগ্রাম', '9', 3832.00, 'Cash on Delivery', 'completed', '2025-08-01 22:57:15'),
(710, 5, 'তানভীর', 'user266@example.com', '01757374768', 'চট্টগ্রাম', '7', 2630.00, 'bKash', 'completed', '2025-07-20 22:57:15'),
(711, 7, 'সুমাইয়া', 'user57@example.com', '01794786419', 'চট্টগ্রাম', '2', 2895.00, 'bKash', 'completed', '2025-08-14 22:57:15'),
(712, 6, 'ফারহানা', 'user372@example.com', '01721969245', 'সিলেট', '8', 4590.00, 'bKash', 'pending', '2025-07-22 22:57:15'),
(713, 10, 'রাহুল', 'user134@example.com', '01725259136', 'খুলনা', '6', 1957.00, 'Cash on Delivery', 'completed', '2025-07-23 22:57:15'),
(714, 8, 'তানভীর', 'user454@example.com', '01777100390', 'ঢাকা', '4', 1752.00, 'bKash', 'completed', '2025-07-31 22:57:15'),
(715, 9, 'সুমাইয়া', 'user310@example.com', '01745548223', 'খুলনা', '8', 2407.00, 'Cash on Delivery', 'completed', '2025-07-31 22:57:15'),
(716, 3, 'তানভীর', 'user417@example.com', '01723207803', 'রাজশাহী', '7', 636.00, 'Nagad', 'completed', '2025-08-09 22:57:15'),
(717, 5, 'রাহুল', 'user48@example.com', '01728675684', 'ঢাকা', '9', 4761.00, 'Cash on Delivery', 'pending', '2025-07-24 22:57:15'),
(718, 1, 'সাদিয়া', 'user110@example.com', '01709107187', 'সিলেট', '8', 1287.00, 'Cash on Delivery', 'pending', '2025-08-02 22:57:15'),
(719, 8, 'সুমাইয়া', 'user284@example.com', '01733879499', 'সিলেট', '10', 3591.00, 'Nagad', 'pending', '2025-07-28 22:57:15'),
(720, 5, 'তানভীর', 'user52@example.com', '01757167036', 'খুলনা', '1', 2603.00, 'bKash', 'pending', '2025-07-31 22:57:15'),
(721, 5, 'সুমাইয়া', 'user250@example.com', '01707169188', 'সিলেট', '1', 4296.00, 'Nagad', 'pending', '2025-08-12 22:57:15'),
(722, 4, 'ফারহানা', 'user344@example.com', '01730580236', 'খুলনা', '5', 3716.00, 'bKash', 'pending', '2025-07-31 22:57:15'),
(723, 5, 'সাদিয়া', 'user327@example.com', '01738592181', 'সিলেট', '7', 2730.00, 'bKash', 'pending', '2025-07-29 22:57:15'),
(724, 6, 'সাদিয়া', 'user328@example.com', '01732336991', 'রাজশাহী', '3', 2315.00, 'bKash', 'pending', '2025-07-28 22:57:15'),
(725, 9, 'তানভীর', 'user420@example.com', '01727945631', 'সিলেট', '6', 1138.00, 'Cash on Delivery', 'completed', '2025-08-16 22:57:15'),
(726, 4, 'ফারহানা', 'user222@example.com', '01773240010', 'চট্টগ্রাম', '5', 1554.00, 'Cash on Delivery', 'pending', '2025-08-04 22:57:15'),
(727, 9, 'মাহিন', 'user222@example.com', '01748915595', 'ঢাকা', '2', 1473.00, 'Nagad', 'completed', '2025-07-27 22:57:15'),
(728, 4, 'মাহিন', 'user345@example.com', '01776408471', 'রাজশাহী', '5', 748.00, 'Cash on Delivery', 'return', '2025-07-27 22:57:15'),
(729, 8, 'তানভীর', 'user117@example.com', '01736243094', 'ঢাকা', '5', 367.00, 'Nagad', 'completed', '2025-08-04 22:57:15'),
(730, 5, 'মেহজাবিন', 'user229@example.com', '01731877664', 'চট্টগ্রাম', '2', 481.00, 'Nagad', 'pending', '2025-08-04 22:57:15'),
(731, 1, 'মেহজাবিন', 'user106@example.com', '01739896504', 'চট্টগ্রাম', '7', 5028.00, 'Cash on Delivery', 'pending', '2025-08-16 22:57:15'),
(732, 1, 'মেহজাবিন', 'user289@example.com', '01706244460', 'খুলনা', '8', 4398.00, 'Cash on Delivery', 'completed', '2025-08-16 22:57:15'),
(733, 2, 'মাহিন', 'user87@example.com', '01727143386', 'সিলেট', '4', 1839.00, 'bKash', 'completed', '2025-08-04 22:57:15'),
(734, 3, 'মেহজাবিন', 'user279@example.com', '01715923339', 'ঢাকা', '2', 1678.00, 'Cash on Delivery', 'pending', '2025-07-21 22:57:15'),
(735, 2, 'সাদিয়া', 'user109@example.com', '01794275709', 'ঢাকা', '5', 1208.00, 'bKash', 'return', '2025-08-10 22:57:15'),
(736, 5, 'মাহিন', 'user77@example.com', '01721726701', 'রাজশাহী', '5', 2619.00, 'Cash on Delivery', 'completed', '2025-08-05 22:57:15'),
(737, 5, 'সাদিয়া', 'user125@example.com', '01715751587', 'ঢাকা', '8', 3058.00, 'Nagad', 'pending', '2025-08-16 22:57:15'),
(738, 9, 'সুমাইয়া', 'user498@example.com', '01759852674', 'ঢাকা', '3', 1065.00, 'Cash on Delivery', 'pending', '2025-08-10 22:57:15'),
(739, 7, 'সুমাইয়া', 'user147@example.com', '01778295183', 'ঢাকা', '9', 363.00, 'Nagad', 'return', '2025-08-16 22:57:15'),
(740, 4, 'মাহিন', 'user455@example.com', '01773326268', 'সিলেট', '6', 3729.00, 'Cash on Delivery', 'pending', '2025-08-10 22:57:15'),
(741, 5, 'সুমাইয়া', 'user447@example.com', '01779910315', 'চট্টগ্রাম', '2', 4989.00, 'Cash on Delivery', 'return', '2025-07-30 22:57:15'),
(742, 2, 'মাহিন', 'user281@example.com', '01706746677', 'রাজশাহী', '1', 1788.00, 'bKash', 'pending', '2025-08-13 22:57:15'),
(743, 4, 'সুমাইয়া', 'user394@example.com', '01743049242', 'রাজশাহী', '7', 4615.00, 'bKash', 'completed', '2025-07-31 22:57:15'),
(744, 10, 'ইমরান', 'user39@example.com', '01707592714', 'ঢাকা', '6', 589.00, 'Nagad', 'pending', '2025-07-26 22:57:15'),
(745, 3, 'রাহুল', 'user334@example.com', '01701613012', 'ঢাকা', '4', 2584.00, 'bKash', 'return', '2025-08-09 22:57:15'),
(746, 5, 'রাহুল', 'user119@example.com', '01789916332', 'রাজশাহী', '3', 4253.00, 'bKash', 'return', '2025-08-13 22:57:15'),
(747, 9, 'মাহিন', 'user148@example.com', '01781963436', 'চট্টগ্রাম', '7', 2156.00, 'Cash on Delivery', 'pending', '2025-07-26 22:57:15'),
(748, 3, 'ইমরান', 'user142@example.com', '01704016100', 'চট্টগ্রাম', '7', 594.00, 'bKash', 'return', '2025-07-25 22:57:15'),
(749, 10, 'সুমাইয়া', 'user466@example.com', '01724227767', 'খুলনা', '4', 2865.00, 'Nagad', 'return', '2025-07-28 22:57:15'),
(750, 4, 'ফারহানা', 'user43@example.com', '01721674803', 'সিলেট', '6', 221.00, 'bKash', 'completed', '2025-08-16 22:57:15'),
(751, 6, 'সুমাইয়া', 'user366@example.com', '01790818099', 'চট্টগ্রাম', '1', 157.00, 'Cash on Delivery', 'completed', '2025-08-06 22:57:15'),
(752, 8, 'ফারহানা', 'user444@example.com', '01720127342', 'চট্টগ্রাম', '2', 2890.00, 'bKash', 'pending', '2025-08-12 22:57:15'),
(753, 6, 'রাহুল', 'user265@example.com', '01757168724', 'চট্টগ্রাম', '7', 2349.00, 'Cash on Delivery', 'completed', '2025-08-02 22:57:15'),
(754, 6, 'মেহজাবিন', 'user117@example.com', '01728332123', 'রাজশাহী', '8', 2521.00, 'Cash on Delivery', 'return', '2025-08-15 22:57:15'),
(755, 3, 'সাদিয়া', 'user472@example.com', '01758232892', 'ঢাকা', '7', 748.00, 'bKash', 'return', '2025-07-30 22:57:15'),
(756, 2, 'ইমরান', 'user418@example.com', '01757764941', 'চট্টগ্রাম', '2', 3769.00, 'Cash on Delivery', 'pending', '2025-08-15 22:57:15'),
(757, 1, 'ইমরান', 'user41@example.com', '01789357221', 'চট্টগ্রাম', '5', 2936.00, 'bKash', 'return', '2025-08-11 22:57:15'),
(758, 1, 'মাহিন', 'user289@example.com', '01721465510', 'চট্টগ্রাম', '1', 1792.00, 'bKash', 'pending', '2025-08-10 22:57:15'),
(759, 4, 'রাহুল', 'user32@example.com', '01720832510', 'সিলেট', '7', 2948.00, 'Nagad', 'completed', '2025-07-21 22:57:15'),
(760, 3, 'সুমাইয়া', 'user152@example.com', '01796238435', 'সিলেট', '7', 2484.00, 'bKash', 'completed', '2025-08-13 22:57:15'),
(761, 2, 'রাহুল', 'user457@example.com', '01741369645', 'চট্টগ্রাম', '5', 243.00, 'Nagad', 'pending', '2025-08-15 22:57:15'),
(762, 9, 'মেহজাবিন', 'user147@example.com', '01752330074', 'রাজশাহী', '2', 1714.00, 'Cash on Delivery', 'pending', '2025-07-28 22:57:15'),
(763, 10, 'সাদিয়া', 'user376@example.com', '01755840779', 'খুলনা', '1', 2518.00, 'bKash', 'pending', '2025-07-31 22:57:15'),
(764, 1, 'ফারহানা', 'user66@example.com', '01726283036', 'সিলেট', '9', 1928.00, 'bKash', 'return', '2025-08-14 22:57:15'),
(765, 9, 'ইমরান', 'user154@example.com', '01722976938', 'চট্টগ্রাম', '5', 2929.00, 'bKash', 'return', '2025-08-16 22:57:15'),
(766, 3, 'রাহুল', 'user390@example.com', '01754624935', 'চট্টগ্রাম', '4', 2296.00, 'Cash on Delivery', 'pending', '2025-08-07 22:57:15'),
(767, 6, 'ফারহানা', 'user183@example.com', '01768786118', 'চট্টগ্রাম', '7', 1397.00, 'Cash on Delivery', 'pending', '2025-08-13 22:57:15'),
(768, 5, 'সাদিয়া', 'user418@example.com', '01728759467', 'সিলেট', '9', 1119.00, 'bKash', 'pending', '2025-08-02 22:57:15'),
(769, 4, 'মেহজাবিন', 'user262@example.com', '01794824045', 'ঢাকা', '1', 2797.00, 'bKash', 'return', '2025-08-02 22:57:15'),
(770, 7, 'সাদিয়া', 'user285@example.com', '01767632832', 'রাজশাহী', '4', 3383.00, 'Cash on Delivery', 'pending', '2025-08-10 22:57:15'),
(771, 1, 'মাহিন', 'user327@example.com', '01753789633', 'রাজশাহী', '1', 5058.00, 'Nagad', 'pending', '2025-07-25 22:57:15'),
(772, 3, 'মেহজাবিন', 'user357@example.com', '01785116402', 'ঢাকা', '1', 3786.00, 'bKash', 'completed', '2025-07-20 22:57:15'),
(773, 1, 'সুমাইয়া', 'user334@example.com', '01788871364', 'খুলনা', '6', 1982.00, 'Cash on Delivery', 'completed', '2025-08-15 22:57:15'),
(774, 1, 'মেহজাবিন', 'user331@example.com', '01738496873', 'সিলেট', '6', 4863.00, 'Cash on Delivery', 'return', '2025-07-25 22:57:15'),
(775, 3, 'সাদিয়া', 'user285@example.com', '01791164682', 'সিলেট', '6', 234.00, 'bKash', 'pending', '2025-08-02 22:57:15'),
(776, 2, 'মেহজাবিন', 'user253@example.com', '01760611630', 'খুলনা', '8', 1527.00, 'Cash on Delivery', 'return', '2025-08-04 22:57:15'),
(777, 1, 'রাহুল', 'user457@example.com', '01743866056', 'খুলনা', '10', 2343.00, 'bKash', 'pending', '2025-08-17 22:57:15'),
(778, 1, 'মেহজাবিন', 'user300@example.com', '01719863615', 'ঢাকা', '4', 1584.00, 'bKash', 'pending', '2025-08-07 22:57:15'),
(779, 3, 'সুমাইয়া', 'user38@example.com', '01784674294', 'ঢাকা', '6', 2564.00, 'Nagad', 'pending', '2025-08-01 22:57:15'),
(780, 1, 'তানভীর', 'user229@example.com', '01740663216', 'রাজশাহী', '1', 2520.00, 'Cash on Delivery', 'pending', '2025-07-27 22:57:15'),
(781, 1, 'রাহুল', 'user39@example.com', '01723132765', 'সিলেট', '10', 4311.00, 'bKash', 'return', '2025-08-14 22:57:15'),
(782, 6, 'মাহিন', 'user37@example.com', '01765029742', 'ঢাকা', '3', 4827.00, 'Cash on Delivery', 'return', '2025-08-16 22:57:15'),
(783, 4, 'ফারহানা', 'user217@example.com', '01768365089', 'ঢাকা', '6', 2235.00, 'bKash', 'completed', '2025-07-28 22:57:15'),
(784, 5, 'তানভীর', 'user28@example.com', '01737198451', 'রাজশাহী', '4', 3445.00, 'Cash on Delivery', 'pending', '2025-08-04 22:57:15'),
(785, 1, 'সাদিয়া', 'user119@example.com', '01719295192', 'চট্টগ্রাম', '7', 3558.00, 'bKash', 'pending', '2025-08-15 22:57:15'),
(786, 1, 'ইমরান', 'user56@example.com', '01701113773', 'রাজশাহী', '6', 3751.00, 'Nagad', 'pending', '2025-08-15 22:57:15'),
(787, 5, 'রাহুল', 'user367@example.com', '01756672579', 'রাজশাহী', '5', 2327.00, 'Nagad', 'return', '2025-08-08 22:57:15'),
(788, 5, 'রাহুল', 'user108@example.com', '01778157329', 'চট্টগ্রাম', '10', 520.00, 'bKash', 'pending', '2025-07-31 22:57:15'),
(789, 5, 'মাহিন', 'user173@example.com', '01703554396', 'ঢাকা', '6', 2817.00, 'Nagad', 'completed', '2025-08-03 22:57:15'),
(790, 5, 'ফারহানা', 'user39@example.com', '01701234259', 'সিলেট', '2', 385.00, 'Nagad', 'return', '2025-08-11 22:57:15'),
(791, 4, 'মেহজাবিন', 'user399@example.com', '01709827456', 'ঢাকা', '3', 3858.00, 'Cash on Delivery', 'pending', '2025-08-04 22:57:15'),
(792, 4, 'সুমাইয়া', 'user348@example.com', '01708881397', 'চট্টগ্রাম', '6', 2626.00, 'Nagad', 'pending', '2025-08-18 22:57:15'),
(793, 10, 'সাদিয়া', 'user403@example.com', '01780020484', 'খুলনা', '6', 4699.00, 'Nagad', 'completed', '2025-07-20 22:57:15'),
(794, 4, 'মেহজাবিন', 'user220@example.com', '01745260783', 'সিলেট', '4', 188.00, 'Nagad', 'pending', '2025-08-13 22:57:15'),
(795, 6, 'মেহজাবিন', 'user164@example.com', '01771297512', 'খুলনা', '8', 1010.00, 'bKash', 'completed', '2025-08-09 22:57:15'),
(796, 1, 'সুমাইয়া', 'user349@example.com', '01702269049', 'ঢাকা', '1', 1115.00, 'Nagad', 'return', '2025-07-31 22:57:15'),
(797, 3, 'তানভীর', 'user457@example.com', '01757661956', 'ঢাকা', '10', 2847.00, 'Nagad', 'completed', '2025-08-07 22:57:15'),
(798, 6, 'সাদিয়া', 'user288@example.com', '01791416595', 'সিলেট', '5', 4271.00, 'Nagad', 'pending', '2025-08-17 22:57:15'),
(799, 6, 'তানভীর', 'user136@example.com', '01727551928', 'খুলনা', '1', 1767.00, 'bKash', 'pending', '2025-08-11 22:57:15'),
(800, 5, 'সাদিয়া', 'user35@example.com', '01722907044', 'সিলেট', '1', 1411.00, 'Cash on Delivery', 'pending', '2025-07-25 22:57:15'),
(801, 5, 'মেহজাবিন', 'user187@example.com', '01798279055', 'রাজশাহী', '1', 4042.00, 'Nagad', 'pending', '2025-08-02 22:57:15'),
(802, 3, 'সাদিয়া', 'user391@example.com', '01775314880', 'খুলনা', '9', 429.00, 'Nagad', 'pending', '2025-07-21 22:57:15'),
(803, 5, 'ফারহানা', 'user389@example.com', '01760629738', 'রাজশাহী', '7', 1595.00, 'bKash', 'pending', '2025-08-02 22:57:15'),
(804, 7, 'ফারহানা', 'user181@example.com', '01746798645', 'চট্টগ্রাম', '9', 3271.00, 'bKash', 'return', '2025-08-15 22:57:15'),
(805, 4, 'সুমাইয়া', 'user108@example.com', '01739376744', 'চট্টগ্রাম', '5', 1006.00, 'bKash', 'pending', '2025-07-23 22:57:15'),
(806, 8, 'মেহজাবিন', 'user383@example.com', '01786721920', 'ঢাকা', '7', 4879.00, 'Nagad', 'return', '2025-08-17 22:57:15'),
(807, 10, 'সাদিয়া', 'user175@example.com', '01781115224', 'ঢাকা', '6', 4902.00, 'Cash on Delivery', 'completed', '2025-07-21 22:57:15'),
(808, 1, 'সাদিয়া', 'user58@example.com', '01752456830', 'চট্টগ্রাম', '9', 1514.00, 'Nagad', 'pending', '2025-08-05 22:57:15'),
(809, 8, 'তানভীর', 'user234@example.com', '01731419477', 'ঢাকা', '9', 4989.00, 'Cash on Delivery', 'completed', '2025-07-27 22:57:15'),
(810, 6, 'তানভীর', 'user122@example.com', '01713486216', 'সিলেট', '4', 3926.00, 'Nagad', 'completed', '2025-08-01 22:57:15'),
(811, 9, 'ফারহানা', 'user232@example.com', '01714092270', 'চট্টগ্রাম', '2', 4174.00, 'bKash', 'return', '2025-08-07 22:57:15'),
(812, 1, 'ইমরান', 'user168@example.com', '01705809192', 'চট্টগ্রাম', '3', 2039.00, 'Cash on Delivery', 'pending', '2025-08-05 22:57:15'),
(813, 9, 'রাহুল', 'user288@example.com', '01772900490', 'সিলেট', '5', 1917.00, 'bKash', 'return', '2025-08-07 22:57:15'),
(814, 2, 'মাহিন', 'user258@example.com', '01778765657', 'চট্টগ্রাম', '7', 4368.00, 'bKash', 'return', '2025-08-18 22:57:15'),
(815, 2, 'মাহিন', 'user231@example.com', '01758596892', 'খুলনা', '10', 1500.00, 'bKash', 'pending', '2025-08-01 22:57:15'),
(816, 8, 'সুমাইয়া', 'user205@example.com', '01758801657', 'রাজশাহী', '9', 4666.00, 'Cash on Delivery', 'completed', '2025-08-13 22:57:15'),
(817, 3, 'ফারহানা', 'user336@example.com', '01798079734', 'সিলেট', '6', 4524.00, 'Nagad', 'return', '2025-08-09 22:57:15'),
(818, 2, 'মেহজাবিন', 'user61@example.com', '01781967763', 'রাজশাহী', '3', 4586.00, 'Nagad', 'pending', '2025-07-30 22:57:15'),
(819, 10, 'ইমরান', 'user239@example.com', '01776418555', 'চট্টগ্রাম', '7', 864.00, 'Nagad', 'pending', '2025-07-31 22:57:15'),
(820, 9, 'মাহিন', 'user32@example.com', '01771603912', 'চট্টগ্রাম', '9', 4314.00, 'Nagad', 'pending', '2025-08-16 22:57:15'),
(821, 10, 'মাহিন', 'user391@example.com', '01730598640', 'ঢাকা', '1', 2432.00, 'Cash on Delivery', 'pending', '2025-08-17 22:57:15'),
(822, 7, 'সুমাইয়া', 'user412@example.com', '01762275844', 'রাজশাহী', '4', 4297.00, 'Cash on Delivery', 'completed', '2025-08-08 22:57:15'),
(823, 3, 'তানভীর', 'user403@example.com', '01705535110', 'সিলেট', '2', 692.00, 'Cash on Delivery', 'pending', '2025-07-20 22:57:15'),
(824, 5, 'সুমাইয়া', 'user380@example.com', '01715611368', 'খুলনা', '1', 3860.00, 'bKash', 'return', '2025-07-21 22:57:15'),
(825, 5, 'মাহিন', 'user237@example.com', '01760874454', 'রাজশাহী', '3', 3050.00, 'Cash on Delivery', 'pending', '2025-07-26 22:57:15'),
(826, 1, 'রাহুল', 'user99@example.com', '01771584753', 'সিলেট', '8', 107.00, 'bKash', 'completed', '2025-07-26 22:57:15'),
(827, 6, 'তানভীর', 'user20@example.com', '01719918913', 'সিলেট', '9', 1963.00, 'bKash', 'completed', '2025-08-06 22:57:15'),
(828, 7, 'রাহুল', 'user235@example.com', '01703999607', 'রাজশাহী', '9', 4402.00, 'Nagad', 'pending', '2025-07-27 22:57:15'),
(829, 2, 'মাহিন', 'user190@example.com', '01716537356', 'রাজশাহী', '10', 3269.00, 'bKash', 'pending', '2025-08-11 22:57:15'),
(830, 7, 'সাদিয়া', 'user74@example.com', '01782128497', 'রাজশাহী', '9', 1900.00, 'Cash on Delivery', 'pending', '2025-07-30 22:57:15'),
(831, 7, 'ফারহানা', 'user128@example.com', '01790838403', 'রাজশাহী', '2', 2554.00, 'Nagad', 'pending', '2025-07-27 22:57:15'),
(832, 8, 'সাদিয়া', 'user450@example.com', '01754635206', 'ঢাকা', '6', 3235.00, 'bKash', 'pending', '2025-08-06 22:57:15'),
(833, 4, 'মাহিন', 'user439@example.com', '01758405796', 'চট্টগ্রাম', '8', 3307.00, 'Cash on Delivery', 'pending', '2025-08-02 22:57:15'),
(834, 1, 'সাদিয়া', 'user81@example.com', '01778165633', 'খুলনা', '8', 3554.00, 'Cash on Delivery', 'pending', '2025-08-13 22:57:15'),
(835, 1, 'মাহিন', 'user391@example.com', '01721093446', 'রাজশাহী', '10', 2633.00, 'Nagad', 'pending', '2025-07-24 22:57:15'),
(836, 6, 'সুমাইয়া', 'user253@example.com', '01783137996', 'রাজশাহী', '8', 3388.00, 'Cash on Delivery', 'return', '2025-08-13 22:57:15'),
(837, 8, 'রাহুল', 'user461@example.com', '01758482172', 'ঢাকা', '1', 4002.00, 'Nagad', 'pending', '2025-07-30 22:57:15'),
(838, 2, 'মাহিন', 'user324@example.com', '01745121259', 'চট্টগ্রাম', '3', 1205.00, 'bKash', 'pending', '2025-08-03 22:57:15'),
(839, 5, 'মেহজাবিন', 'user198@example.com', '01704106443', 'ঢাকা', '10', 4250.00, 'Cash on Delivery', 'pending', '2025-08-09 22:57:15'),
(840, 8, 'ইমরান', 'user365@example.com', '01727608320', 'ঢাকা', '2', 784.00, 'Cash on Delivery', 'pending', '2025-08-03 22:57:15'),
(841, 10, 'তানভীর', 'user241@example.com', '01759975189', 'খুলনা', '10', 1043.00, 'Cash on Delivery', 'return', '2025-07-22 22:57:15'),
(842, 8, 'ইমরান', 'user482@example.com', '01737084256', 'সিলেট', '8', 3485.00, 'Cash on Delivery', 'completed', '2025-08-14 22:57:15'),
(843, 3, 'সাদিয়া', 'user347@example.com', '01744367149', 'ঢাকা', '4', 2270.00, 'Cash on Delivery', 'completed', '2025-07-27 22:57:15'),
(844, 8, 'সাদিয়া', 'user43@example.com', '01736068280', 'খুলনা', '7', 3219.00, 'Cash on Delivery', 'completed', '2025-08-13 22:57:15'),
(845, 2, 'মেহজাবিন', 'user287@example.com', '01793734179', 'সিলেট', '1', 1061.00, 'Nagad', 'completed', '2025-08-16 22:57:15'),
(846, 5, 'সুমাইয়া', 'user120@example.com', '01780949327', 'চট্টগ্রাম', '3', 962.00, 'Cash on Delivery', 'pending', '2025-07-21 22:57:15'),
(847, 9, 'মাহিন', 'user493@example.com', '01736223353', 'সিলেট', '3', 2376.00, 'bKash', 'completed', '2025-07-30 22:57:15'),
(848, 5, 'ফারহানা', 'user391@example.com', '01757513549', 'খুলনা', '10', 441.00, 'bKash', 'pending', '2025-07-21 22:57:15'),
(849, 2, 'ইমরান', 'user481@example.com', '01718708109', 'ঢাকা', '7', 1598.00, 'bKash', 'pending', '2025-07-22 22:57:15'),
(850, 9, 'সাদিয়া', 'user325@example.com', '01726485422', 'চট্টগ্রাম', '1', 1530.00, 'Cash on Delivery', 'completed', '2025-07-28 22:57:15'),
(851, 5, 'সুমাইয়া', 'user357@example.com', '01786099481', 'ঢাকা', '3', 4030.00, 'Cash on Delivery', 'pending', '2025-07-30 22:57:15'),
(852, 10, 'ইমরান', 'user44@example.com', '01708848353', 'ঢাকা', '7', 3421.00, 'bKash', 'completed', '2025-07-27 22:57:15'),
(853, 9, 'মেহজাবিন', 'user485@example.com', '01716159406', 'সিলেট', '1', 1891.00, 'Nagad', 'return', '2025-08-10 22:57:15'),
(854, 4, 'ইমরান', 'user402@example.com', '01774597700', 'চট্টগ্রাম', '4', 4277.00, 'Cash on Delivery', 'completed', '2025-07-28 22:57:15'),
(855, 6, 'ফারহানা', 'user306@example.com', '01777750139', 'ঢাকা', '10', 2721.00, 'Nagad', 'pending', '2025-07-21 22:57:15'),
(856, 4, 'ইমরান', 'user102@example.com', '01747507917', 'রাজশাহী', '5', 3987.00, 'bKash', 'pending', '2025-08-07 22:57:15'),
(857, 4, 'ফারহানা', 'user90@example.com', '01762997864', 'রাজশাহী', '2', 137.00, 'bKash', 'return', '2025-08-01 22:57:15'),
(858, 1, 'মাহিন', 'user174@example.com', '01722708818', 'ঢাকা', '8', 3180.00, 'Nagad', 'pending', '2025-08-14 22:57:15'),
(859, 2, 'সুমাইয়া', 'user349@example.com', '01781830656', 'ঢাকা', '6', 3961.00, 'Cash on Delivery', 'return', '2025-07-29 22:57:15'),
(860, 6, 'মাহিন', 'user476@example.com', '01725058571', 'চট্টগ্রাম', '3', 290.00, 'bKash', 'completed', '2025-08-10 22:57:15'),
(861, 1, 'সুমাইয়া', 'user30@example.com', '01764558739', 'ঢাকা', '4', 2103.00, 'Cash on Delivery', 'completed', '2025-07-31 22:57:15'),
(862, 7, 'সুমাইয়া', 'user6@example.com', '01755305193', 'রাজশাহী', '1', 4380.00, 'Cash on Delivery', 'return', '2025-08-02 22:57:15'),
(863, 9, 'ফারহানা', 'user283@example.com', '01761803465', 'চট্টগ্রাম', '2', 2211.00, 'Nagad', 'pending', '2025-08-16 22:57:15'),
(864, 1, 'রাহুল', 'user35@example.com', '01718423540', 'রাজশাহী', '1', 4774.00, 'bKash', 'pending', '2025-07-25 22:57:15'),
(865, 1, 'মেহজাবিন', 'user215@example.com', '01734187003', 'খুলনা', '1', 1160.00, 'Nagad', 'pending', '2025-07-27 22:57:15'),
(866, 1, 'রাহুল', 'user9@example.com', '01798760661', 'সিলেট', '5', 3819.00, 'Cash on Delivery', 'completed', '2025-07-24 22:57:15'),
(867, 9, 'মাহিন', 'user242@example.com', '01764405667', 'রাজশাহী', '10', 1329.00, 'bKash', 'return', '2025-08-10 22:57:15'),
(868, 2, 'সাদিয়া', 'user192@example.com', '01767747802', 'চট্টগ্রাম', '2', 682.00, 'Cash on Delivery', 'completed', '2025-08-18 22:57:15'),
(869, 10, 'সাদিয়া', 'user313@example.com', '01703290843', 'চট্টগ্রাম', '4', 4670.00, 'bKash', 'return', '2025-08-11 22:57:15'),
(870, 10, 'রাহুল', 'user113@example.com', '01708969652', 'রাজশাহী', '7', 3530.00, 'bKash', 'completed', '2025-08-05 22:57:15'),
(871, 2, 'সুমাইয়া', 'user282@example.com', '01726794221', 'রাজশাহী', '5', 1838.00, 'bKash', 'return', '2025-08-01 22:57:15'),
(872, 8, 'মেহজাবিন', 'user189@example.com', '01713765828', 'খুলনা', '4', 1088.00, 'Nagad', 'return', '2025-08-16 22:57:15'),
(873, 3, 'রাহুল', 'user128@example.com', '01725583108', 'খুলনা', '9', 2590.00, 'Cash on Delivery', 'pending', '2025-07-21 22:57:15'),
(874, 3, 'তানভীর', 'user347@example.com', '01765404921', 'ঢাকা', '1', 2382.00, 'Cash on Delivery', 'completed', '2025-07-24 22:57:15'),
(875, 6, 'মেহজাবিন', 'user132@example.com', '01744573056', 'খুলনা', '9', 139.00, 'bKash', 'completed', '2025-08-01 22:57:15'),
(876, 4, 'সুমাইয়া', 'user474@example.com', '01704357420', 'চট্টগ্রাম', '8', 3603.00, 'Cash on Delivery', 'pending', '2025-07-23 22:57:15'),
(877, 8, 'রাহুল', 'user409@example.com', '01707916983', 'সিলেট', '5', 3093.00, 'bKash', 'pending', '2025-07-27 22:57:15'),
(878, 2, 'মাহিন', 'user224@example.com', '01745152188', 'সিলেট', '3', 2324.00, 'bKash', 'completed', '2025-08-06 22:57:15'),
(879, 5, 'সুমাইয়া', 'user146@example.com', '01703298363', 'চট্টগ্রাম', '4', 4795.00, 'bKash', 'pending', '2025-08-11 22:57:15'),
(880, 6, 'রাহুল', 'user220@example.com', '01714929989', 'খুলনা', '8', 1417.00, 'Cash on Delivery', 'completed', '2025-08-17 22:57:15'),
(881, 9, 'তানভীর', 'user438@example.com', '01744160641', 'খুলনা', '7', 1333.00, 'bKash', 'pending', '2025-07-25 22:57:15'),
(882, 8, 'ফারহানা', 'user360@example.com', '01739118215', 'রাজশাহী', '9', 3542.00, 'Nagad', 'completed', '2025-08-03 22:57:15'),
(883, 10, 'মেহজাবিন', 'user119@example.com', '01720070671', 'চট্টগ্রাম', '9', 2164.00, 'bKash', 'pending', '2025-07-31 22:57:15'),
(884, 5, 'সুমাইয়া', 'user489@example.com', '01714737230', 'সিলেট', '6', 2667.00, 'Nagad', 'pending', '2025-08-16 22:57:15'),
(885, 10, 'মাহিন', 'user330@example.com', '01777556517', 'সিলেট', '2', 1038.00, 'bKash', 'pending', '2025-08-16 22:57:15'),
(886, 10, 'সাদিয়া', 'user192@example.com', '01793745414', 'খুলনা', '9', 3729.00, 'Cash on Delivery', 'completed', '2025-07-27 22:57:15'),
(887, 9, 'সুমাইয়া', 'user136@example.com', '01778115406', 'ঢাকা', '2', 1773.00, 'Cash on Delivery', 'pending', '2025-07-29 22:57:15'),
(888, 9, 'তানভীর', 'user382@example.com', '01799749927', 'রাজশাহী', '6', 2279.00, 'bKash', 'completed', '2025-07-21 22:57:15'),
(1102, 11, 'shanjida azim shorna', 'shanjidaazimshorna@gmail.com', '01744842746', 'Flat: 10, Khadim Para, Sylhet, Bangladesh - 3100', 'Onion (x1)', 65.00, 'Nagad', 'pending', '2025-08-18 21:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`id`, `order_id`, `status`, `updated_at`) VALUES
(1, 188, 'Packed', '2025-08-18 16:14:56'),
(2, 1102, 'Packed', '2025-08-18 19:31:17'),
(3, 63, 'Order Placed', '2025-08-18 19:44:29'),
(4, 601, 'Out for Delivery', '2025-08-18 19:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `details`, `category`) VALUES
(29, 'Tomato', 80.00, 'tomato.jpg', 'Fresh red tomatoes, ideal for cooking and salads', 'Vegetables'),
(30, 'Potato', 50.00, 'potato.jpg', 'High-quality potatoes, perfect for fries and curries', 'Vegetables'),
(31, 'Onion', 65.00, 'onion.jpg', 'Fresh onions, essential for everyday cooking', 'Vegetables'),
(32, 'Cucumber', 40.00, 'cucumber.jpg', 'Green cucumbers, great for salads and hydration', 'Vegetables'),
(33, 'Carrot', 90.00, 'carrot.jpg', 'Crunchy carrots, rich in vitamins and minerals', 'Vegetables'),
(35, 'Banana', 100.00, 'banana.jpg', 'Sweet bananas, full of energy and nutrition', 'Fruits'),
(36, 'Orange', 150.00, 'orange.jpg', 'Fresh oranges, rich in Vitamin C', 'Fruits'),
(37, 'Mango', 180.00, 'mango.jpg', 'Juicy mangoes, the king of fruits', 'Fruits'),
(38, 'Watermelon', 250.00, 'watermelon.jpg', 'Watermelons, refreshing and hydrating', 'Fruits'),
(39, 'Chicken (Whole)', 280.00, 'chicken.jpg', 'Fresh whole chicken, suitable for roasting and curries', 'Meat'),
(40, 'Beef (Boneless)', 650.00, 'beef.jpg', 'Premium boneless beef, perfect for steaks and curries', 'Meat'),
(42, 'Fish (Rohu)', 350.00, 'fish.jpg', 'Fresh Rohu fish, ideal for frying and curry', 'Meat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('user','admin','seller') DEFAULT 'user',
  `profile_picture` varchar(255) DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `profile_picture`, `created_at`) VALUES
(1, 'Shanjida', 'azim15-4708@diu.edu.bd', '$2y$10$ZwOzUIJYNE8McGYARlRiyezDzgDjPcPwCpCf5oHNem3wqocbW1T3G', 'admin', 'pic-4.PNG', '2025-08-18 15:45:17'),
(2, 'Nusrat', 'nusrat@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(3, 'Rahim', 'rahim@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(4, 'Shanjida', 'shanjida@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(5, 'Tariq', 'tariq@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(6, 'Mitu', 'mitu@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(7, 'Jamil', 'jamil@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(8, 'Farzana', 'farzana@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(9, 'Hasan', 'hasan@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(10, 'Rima', 'rima@example.com', '123456', 'user', 'default.jpg', '2025-08-18 16:14:23'),
(11, 'Shanjida Azim Shorna', 'shanjida301@gmail.com', '$2y$10$yzn1GBZR6qtHNVoIrIyH9e3EZQQ9Adnl28Ce2pczAOq8HTgbbapuu', 'user', 'pic-3.PNG', '2025-08-18 16:58:48');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(17, 11, 32, 'Cucumber', 40.00, 'cucumber.jpg'),
(18, 11, 38, 'Watermelon', 250.00, 'watermelon.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1103;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

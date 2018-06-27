-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2018 at 05:57 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `status`) VALUES
(1, 's@gmail.com', '123', 'active'),
(2, 'hello@gmil.com', 'hello', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(1000) DEFAULT NULL,
  `blog_date` varchar(1000) DEFAULT NULL,
  `blog_author` varchar(1000) DEFAULT NULL,
  `blog_img` varchar(1000) DEFAULT NULL,
  `blog_description` varchar(10000) DEFAULT NULL,
  `blog_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_title`, `blog_date`, `blog_author`, `blog_img`, `blog_description`, `blog_status`) VALUES
(1, 'The First Day of Their Lives', ' April 27, 2018 at 6:53 pm', 'Cindy Jefferson', '/static/post-1.jpg', 'Lorem ipsum dolor sit amet, consecteturs, blandit maximus augue magna accumsan ante. Aliquam bibendum lacus quis nulla dignissim faucibus. Sed mauris enim, bibendum at purus aliquet, maximus molestie tortor. Sed faucibus et tellus eu sollicitudin. Sed fringilla malesuada luctus.\r\nlacinia a velit et, sodales condimentum metus. Nulla non fermentum nisl. Maecenas id molestie turpis, sit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor, sollicitudin ac lectus sed, rhoncus iaculis lectus. ', 'active'),
(2, 'Happily Ever after or Yes! I Will', ' March 9, 2018 at 1:50 pm', 'Cindy Jefferson', '/static/post-003.jpg', 'Lorem ipsum dogue magna accumsan ante. Aliquam bibendum lacus quis nulla dignissim faucibus. Sed mauris enim, bibendum at purus aliquet, maximus molestie tortor. Sed faucibus et tellus eu sollicitudin. Sed fringilla malesuada luctus.\r\nlacinia a velit et, sodales condimentum metus. Nulla non fermentum nisl. Maecenas id molestie turpis, sit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor, sollicitudin. ', 'active'),
(3, 'Top Wed Bakers in Your Area', ' Feb 27, 2018 at 6:53 pm', 'Ronald', '/static/post-005.jpg', 'Lorem ipsum dolor sit amet, consecteturs, blandit maximus augue magna accumsan ante. Aliquam bibendum lacus quis nulla dignissim faucibus. Sed mauris enim, bibendum at purus aliquet, maximus molestie tortor. Sed faucibus et tellus eu sollicitudin. Sed fringilla malesuada luctus.\r\nlacinia a velit et, sodales condimentum metus. Nulla non fermentum nisl. Maecenas id molestie turpis, sit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor, sollicitudin ac lectus sed, rhoncus iaculis lectus. ', 'active'),
(4, 'Special Treats for the Guests', ' Feb 9, 2018', 'Cindy Jefferson', '/static/post-008.jpg', 'Lorem ipsum dolor sit amet, consecteturs, blandit maximus augue magna accumsan ante. Aliquam bibendum lacus quis nulla dignissim faucibus. Sed mauris enim, bibendum at purus aliquet, maximus molestie tortor. Sed faucibus et tellus eu sollicitudin. Sed fringilla malesuada luctus.\r\nlacinia a velit et, sodales condimentum metus. Nulla non fermentum nisl. Maecenas id molestie turpis, sit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor, sollicitudin ac lectus sed, rhoncus iaculis lectus. ', 'active'),
(5, 'Beautiful Landscapes for Ceremonies', ' Jan 27, 2018', 'Cindy Jefferson', '/static/post-012.jpg', 'Lorem ipsum dolor sit amet, consecteturs, blandit maximus auguesit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor. ', 'active'),
(6, 'Exotic Flowers and Elements of Decor', ' Jan 9, 2018', 'Cindy Jefferson', '/static/post-6.jpg', 'Lorem ipsum dogue magna accumsan ante. Aliquam bibendum lacus quis nulla dignissim faucibus. Sed mauris enim, bibendum at purus aliquet, maximus molestie tortor. Sed faucibus et tellus eu sollicitudin. Sed fringilla malesuada luctus.\r\nlacinia a velit et, sodales condimentum metus. Nulla non fermentum nisl. Maecenas id molestie turpis, sit amet feugiat lorem. Curabitur sed erat vel tellus hendrerit tincidunt. Sed arcu tortor, sollicitudin. ', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `cart_id` int(11) NOT NULL,
  `order_id` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_email` varchar(10000) NOT NULL,
  `cart_name` varchar(1000) NOT NULL,
  `cart_contact` varchar(1000) NOT NULL,
  `cart_email` varchar(1000) NOT NULL,
  `cart_address` varchar(1000) NOT NULL,
  `cart_payment_option` varchar(1000) NOT NULL,
  `cart_amount` varchar(1000) NOT NULL,
  `cart_status` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`cart_id`, `order_id`, `date`, `user_email`, `cart_name`, `cart_contact`, `cart_email`, `cart_address`, `cart_payment_option`, `cart_amount`, `cart_status`) VALUES
(1, 'SmnW8Gdw0OOnhAs1', '2018-05-18 19:15:43', 'sw@gmail.com', 'Sakshi', '7410852', ' ss@gmail.com', 'asdfghjk', 'Stripe', '5000', 'success'),
(2, 'VQFHcoVoJe7rw8FV', '2018-05-19 21:32:07', 'sw@gmail.com', 'Sakshi Wadhwa', '75', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'undefined', '4000', 'cart'),
(3, 'USy3Xw0We5f3BwEX', '2018-05-19 21:32:12', 'sw@gmail.com', 'Sakshi Wadhwa', '7542', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Stripe', '4000', 'cart'),
(4, 'oGScS2ZdpwEH4OoO', '2018-05-19 21:36:51', 'sw@gmail.com', 'Sakshi Wadhwa', '68453120', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Stripe', '7000', 'cart'),
(5, 'RUeVvFTilLmOXDNb', '2018-05-19 21:39:17', 'sw@gmail.com', 'Sakshi Wadhwa', '5632', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Stripe', '10500', 'cart'),
(6, 'fnRhAml9Th4umgzS', '2018-05-20 19:09:22', 'sw@gmail.com', 'Rohit', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', 'Stripe', '7512', 'success'),
(7, 'omL4uCfmD3Ukavq5', '2018-05-22 08:45:05', 'sw@gmail.com', 'Sakshi Wadhwa', '89654210', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Stripe', '1650', 'success'),
(8, 'DpweZMNB1nphaCMV', '2018-05-22 09:48:29', 'sw@gmail.com', 'Reet', '978645210', ' reet@gmail.com', '90876trf', 'Stripe', '362', 'success'),
(9, 'Pgemu3AFAWUvPSiU', '2018-05-24 18:10:04', 'sw@gmail.com', 'Sakshi Wadhwa', '1234567890', ' sakshi0723@gmail.com', 'Chandigarh', 'Stripe', '3262', 'success'),
(10, 'xCHEakP08TdzG0KB', '2018-05-25 18:58:34', 'sw@gmail.com', 'Sakshi Wadhwa', '874521', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '7062', 'cart'),
(11, 'dBnXkKM3q3VwgJiq', '2018-05-25 19:04:33', 'sw@gmail.com', 'Sakshi Wadhwa', '7846512', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '10062', 'cart'),
(12, 'BomQR6RvfLfyJWzN', '2018-05-25 19:04:40', 'sw@gmail.com', 'Sakshi Wadhwa', '7846512', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Stripe', '10062', 'success'),
(13, 'OLe7Q9WVJkduqNWD', '2018-05-25 19:52:56', 'sw@gmail.com', 'Sakshi Wadhwa', '5421', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '800', 'cart'),
(14, '8DITE2y2GbDaMoJ8', '2018-05-25 19:55:36', 'sw@gmail.com', 'Sakshi Wadhwa', '52', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '1600', 'cart'),
(15, 'IHQTMEiTvNbwlcAW', '2018-05-25 19:56:38', 'sw@gmail.com', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '3100', 'cart'),
(16, 'gPyWl8eWWisNICZR', '2018-05-25 19:57:22', 'sw@gmail.com', '', '', ' ', '', 'Paypal', '3600', 'cart'),
(17, '9cRlZ0T7EDKTLoEM', '2018-05-25 19:58:46', 'sw@gmail.com', '', '', ' ', '', 'Paypal', '3850', 'cart'),
(18, 'a7naPRG9NtTKQch1', '2018-05-25 20:01:27', 'sw@gmail.com', '', '', ' ', '', 'Paypal', '3962', 'cart'),
(19, 'qblqKciEFWlTWmvG', '2018-05-25 20:03:38', 'sw@gmail.com', '', '', ' ', '', 'Paypal', '4762', 'cart'),
(20, 'GQpkG4QsPq3023VQ', '2018-05-25 20:06:25', 'sw@gmail.com', 'Sakshi Wadhwa', '4785', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '5362', 'cart'),
(21, 'ewcIspfvNKcJDILX', '2018-05-25 20:07:09', 'sw@gmail.com', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'undefined', '6162', 'cart'),
(22, 'NdcQd4rMRNN1hMmG', '2018-05-25 20:12:34', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '6274', 'success'),
(23, 'MRyLtcmsN6p3tr6v', '2018-05-25 20:44:04', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '250', 'cart'),
(24, 'D4m7ScTyBdGTcGnN', '2018-05-25 20:46:44', 'sw@gmail.com', 'drtfyhj', '89546', ' aa@g.com', '', 'Stripe', '1550', 'cart'),
(25, 'yfHmZFFkt5XurqZH', '2018-05-26 05:21:23', 'sw@gmail.com', 'Sakshi Wadhwa', '7521', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '3774', 'cart'),
(26, 'JKNDcur5HMFVB2lx', '2018-06-01 18:27:36', 'sw@gmail.com', 'Sakshi Wadhwa', '98745210', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', 'Paypal', '5962', 'cart'),
(27, 'TRoJcMXOr6gX8cd8', '2018-06-08 21:09:39', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '13474', 'success'),
(28, '8KqbpV5HxlXSJULR', '2018-06-08 21:13:29', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '112', 'cart'),
(29, 'MM5GvZOt6AMg0ucE', '2018-06-08 21:20:54', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '912', 'cart'),
(30, 'xgoX42FTR2cRGBOK', '2018-06-08 21:31:35', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '1712', 'cart'),
(31, 'Jd3xfy2v6mhQ0Xw7', '2018-06-08 21:38:29', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '2512', 'cart'),
(32, 'v2TuaXwANlsywX47', '2018-06-08 21:42:22', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '5512', 'cart'),
(33, 'Q2PC4CROJiFAMBNV', '2018-06-08 21:51:00', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '7512', 'cart'),
(34, 'lgPgpBlT4fIt8LoT', '2018-06-08 21:58:08', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '7762', 'cart'),
(35, 'JreTPM1rQnAmAnCA', '2018-06-08 22:00:04', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '8662', 'cart'),
(36, 'xT6q8xeX6mqoFA8s', '2018-06-08 22:01:40', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '8962', 'cart'),
(37, '0ZiTB9m8gRxoVMRu', '2018-06-08 22:03:59', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '9212', 'cart'),
(38, 's9avIWLsP2oCeGKi', '2018-06-08 22:05:37', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '9324', 'cart'),
(39, '5bXzrEWM7SpnBlXr', '2018-06-08 22:11:37', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '9574', 'cart'),
(40, 'OuxeakyFICORxri2', '2018-06-08 22:15:09', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '9686', 'cart'),
(41, 'WaHtG1rcuhDTF5wa', '2018-06-08 22:23:27', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '9936', 'cart'),
(42, '8wMuVl85WZLgJxWi', '2018-06-08 22:26:09', 'sw@gmail.com', '', '', ' ', '', 'Stripe', '10186', 'cart');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `category_icon` varchar(1000) DEFAULT NULL,
  `category_img` varchar(200) DEFAULT NULL,
  `category_description` varchar(1000) DEFAULT NULL,
  `category_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_icon`, `category_img`, `category_description`, `category_status`) VALUES
(1, 'WEDDING', 'far fa-star-half fa-stack-1x', 'C:UsersDimpleAppDataLocalTempupload_f98f68242bb456fffa8e5d718d0ac542', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(2, 'PARTIES', 'fas fa-utensils fa-stack-1x', 'C:UsersDimpleAppDataLocalTempupload_f3b69449673da306fd02ebf0b38b4557', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(3, 'CORPORATE EVENTS', 'glyphicon glyphicon-glass fa-stack-1x', 'C:UsersDimpleAppDataLocalTempupload_a33ba1f594621dd098fa51505fa4b608', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `project_id` int(250) NOT NULL,
  `gallery_title` varchar(1000) NOT NULL,
  `gallery_img` varchar(1000) NOT NULL,
  `gallery_description` varchar(1000) NOT NULL,
  `gallery_status` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `project_id`, `gallery_title`, `gallery_img`, `gallery_description`, `gallery_status`) VALUES
(1, 1, 'Weddings Collection', './static/wed1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(2, 1, 'Weddings Collection', './static/wed2.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(3, 1, 'Weddings Collection', './static/wed5.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(4, 1, 'Weddings Collection', './static/wed3.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(5, 1, 'Weddings Collection', './static/wed4.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(6, 1, 'Weddings Collection', './static/wed6.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(7, 1, 'Weddings Collection', './static/wed8.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(8, 1, 'Weddings Collection', './static/wed7.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(9, 1, 'Weddings Collection', './static/wed12.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(10, 1, 'Weddings Collection', './static/wed10.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(11, 1, 'Weddings Collection', './static/wed9.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(12, 1, 'Weddings Collection', './static/wed11.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(13, 2, 'Random Collections', './static/wp1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(14, 2, 'Random Collections', './static/wp2.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(15, 2, 'Random Collections', './static/wp3.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(16, 2, 'Random Collections', './static/wp4.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(17, 2, 'Random Collections', './static/wp5.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(18, 2, 'Random Collections', './static/wp6.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(19, 2, 'Random Collections', './static/wp7.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(20, 2, 'Random Collections', './static/wp8.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(21, 2, 'Random Collections', './static/wp9.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(22, 2, 'Random Collections', './static/wp11.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(23, 2, 'Random Collections', './static/wp10.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(24, 2, 'Random Collections', './static/wp12.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(25, 3, 'Party Collections', './static/p1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(26, 3, 'Party Collections', './static/p2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(27, 3, 'Party Collections', './static/p3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(28, 3, 'Party Collections', './static/p4.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(29, 3, 'Party Collections', './static/p5.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(30, 3, 'Party Collections', './static/p6.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(31, 3, 'Party Collections', './static/p7.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(32, 3, 'Party Collections', './static/p9.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(33, 3, 'Party Collections', './static/p8.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(34, 3, 'Party Collections', './static/p10.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(35, 3, 'Party Collections', './static/p11.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(36, 3, 'Party Collections', './static/p12.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(37, 4, 'Corporate Events Collections', './static/c1.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(38, 4, 'Corporate Events Collections', './static/c2.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(39, 4, 'Corporate Events Collections', './static/c3.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(40, 4, 'Corporate Events Collections', './static/c4.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(41, 4, 'Corporate Events Collections', './static/c5.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(42, 4, 'Corporate Events Collections', './static/c6.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(43, 4, 'Corporate Events Collections', './static/c7.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(44, 4, 'Corporate Events Collections', './static/c8.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(45, 4, 'Corporate Events Collections', './static/c9.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(46, 4, 'Corporate Events Collections', './static/c10.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(47, 4, 'Corporate Events Collections', './static/c11.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(48, 4, 'Corporate Events Collections', './static/c12.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(49, 1, 'Weddings Collection', './static/wed13.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(50, 1, 'Weddings Collection', './static/wed14.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(51, 3, 'Party Collections', './static/p13.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(52, 3, 'Party Collections', './static/p14.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(53, 2, 'Our Collections', './static/wp13.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membership_id` int(11) NOT NULL,
  `membership_title` varchar(10000) DEFAULT NULL,
  `membership_description` varchar(10000) DEFAULT NULL,
  `membership_price` varchar(250) DEFAULT NULL,
  `membership_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`membership_id`, `membership_title`, `membership_description`, `membership_price`, `membership_status`) VALUES
(1, 'BASIC', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '20', 'active'),
(2, 'STANDARD', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '40', 'active'),
(3, 'GOLD', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '50', 'active'),
(4, 'PLATINUM', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '60', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `order_events`
--

CREATE TABLE `order_events` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `service_id` varchar(100) NOT NULL,
  `order_status` varchar(1000) NOT NULL,
  `user_email` varchar(1000) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_events`
--

INSERT INTO `order_events` (`id`, `order_id`, `service_id`, `order_status`, `user_email`, `order_date`) VALUES
(1, 'SmnW8Gdw0OOnhAs1', '4', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(2, 'SmnW8Gdw0OOnhAs1', '2', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(13, 'fnRhAml9Th4umgzS', '14', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(19, 'fnRhAml9Th4umgzS', '8', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(20, 'fnRhAml9Th4umgzS', '15', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(23, 'fnRhAml9Th4umgzS', '8', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(28, 'omL4uCfmD3Ukavq5', '8', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(29, 'omL4uCfmD3Ukavq5', '7', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(32, 'DpweZMNB1nphaCMV', '1', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(33, 'DpweZMNB1nphaCMV', '7', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(35, 'Pgemu3AFAWUvPSiU', '1', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(36, 'Pgemu3AFAWUvPSiU', '13', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(37, 'Pgemu3AFAWUvPSiU', '14', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(39, 'Pgemu3AFAWUvPSiU', '8', 'success', 'sw@gmail.com', '2018-05-22 20:09:17'),
(40, 'Pgemu3AFAWUvPSiU', '9', 'success', 'sw@gmail.com', '2018-05-22 21:02:15'),
(41, 'Pgemu3AFAWUvPSiU', '7', 'success', 'sw@gmail.com', '2018-05-24 15:57:29'),
(42, 'Pgemu3AFAWUvPSiU', '10', 'success', 'sw@gmail.com', '2018-05-24 15:57:34'),
(43, 'BomQR6RvfLfyJWzN', '2', 'success', 'sw@gmail.com', '2018-05-25 09:24:15'),
(44, 'BomQR6RvfLfyJWzN', '8', 'success', 'sw@gmail.com', '2018-05-25 09:28:43'),
(46, 'BomQR6RvfLfyJWzN', '14', 'success', 'sw@gmail.com', '2018-05-25 09:33:18'),
(47, 'BomQR6RvfLfyJWzN', '16', 'success', 'sw@gmail.com', '2018-05-25 09:33:26'),
(48, 'BomQR6RvfLfyJWzN', '9', 'success', 'sw@gmail.com', '2018-05-25 09:58:45'),
(49, 'BomQR6RvfLfyJWzN', '10', 'success', 'sw@gmail.com', '2018-05-25 09:58:48'),
(50, 'BomQR6RvfLfyJWzN', '14', 'success', 'sw@gmail.com', '2018-05-25 10:28:01'),
(52, 'BomQR6RvfLfyJWzN', '7', 'success', 'sw@gmail.com', '2018-05-25 10:33:27'),
(53, '', '8', 'cart', 'undefined', '2018-05-25 10:36:23'),
(58, 'BomQR6RvfLfyJWzN', '1', 'success', 'sw@gmail.com', '2018-05-25 10:43:23'),
(59, 'BomQR6RvfLfyJWzN', '8', 'success', 'sw@gmail.com', '2018-05-25 10:44:45'),
(61, 'BomQR6RvfLfyJWzN', '7', 'success', 'sw@gmail.com', '2018-05-25 18:58:18'),
(62, 'BomQR6RvfLfyJWzN', '2', 'success', 'sw@gmail.com', '2018-05-25 19:04:19'),
(63, 'NdcQd4rMRNN1hMmG', '8', 'success', 'sw@gmail.com', '2018-05-25 19:52:43'),
(64, 'NdcQd4rMRNN1hMmG', '8', 'success', 'sw@gmail.com', '2018-05-25 19:55:19'),
(65, 'NdcQd4rMRNN1hMmG', '3', 'success', 'sw@gmail.com', '2018-05-25 19:56:29'),
(66, 'NdcQd4rMRNN1hMmG', '13', 'success', 'sw@gmail.com', '2018-05-25 19:57:14'),
(67, 'NdcQd4rMRNN1hMmG', '7', 'success', 'sw@gmail.com', '2018-05-25 19:58:39'),
(68, 'NdcQd4rMRNN1hMmG', '1', 'success', 'sw@gmail.com', '2018-05-25 20:01:19'),
(69, 'NdcQd4rMRNN1hMmG', '8', 'success', 'sw@gmail.com', '2018-05-25 20:03:31'),
(70, 'NdcQd4rMRNN1hMmG', '10', 'success', 'sw@gmail.com', '2018-05-25 20:06:12'),
(71, 'NdcQd4rMRNN1hMmG', '8', 'success', 'sw@gmail.com', '2018-05-25 20:06:58'),
(72, 'NdcQd4rMRNN1hMmG', '1', 'success', 'sw@gmail.com', '2018-05-25 20:09:41'),
(74, 'TRoJcMXOr6gX8cd8', '8', 'success', 'sw@gmail.com', '2018-05-25 20:46:01'),
(78, 'TRoJcMXOr6gX8cd8', '4', 'success', 'sw@gmail.com', '2018-05-26 05:20:09'),
(80, 'TRoJcMXOr6gX8cd8', '8', 'success', 'sw@gmail.com', '2018-06-01 18:23:57'),
(82, 'TRoJcMXOr6gX8cd8', '11', 'success', 'sw@gmail.com', '2018-06-01 18:24:31'),
(84, 'TRoJcMXOr6gX8cd8', '14', 'success', 'sw@gmail.com', '2018-06-01 18:26:22'),
(87, 'TRoJcMXOr6gX8cd8', '2', 'success', 'sw@gmail.com', '2018-06-01 20:05:39'),
(88, 'TRoJcMXOr6gX8cd8', '1', 'success', 'sw@gmail.com', '2018-06-01 20:09:18'),
(89, 'TRoJcMXOr6gX8cd8', '2', 'success', 'sw@gmail.com', '2018-06-01 20:13:07'),
(90, 'TRoJcMXOr6gX8cd8', '1', 'success', 'sw@gmail.com', '2018-06-01 20:13:11'),
(92, '', '2', 'cart', 'undefined', '2018-06-01 20:28:28'),
(93, '', '2', 'cart', 'sakshi@gmail.com', '2018-06-01 20:28:57'),
(94, '', '1', 'cart', 'sakshi@gmail.com', '2018-06-01 20:29:03'),
(95, 'TRoJcMXOr6gX8cd8', '7', 'success', 'sw@gmail.com', '2018-06-08 21:09:07'),
(96, 'TRoJcMXOr6gX8cd8', '2', 'success', 'sw@gmail.com', '2018-06-08 21:09:14'),
(97, '8wMuVl85WZLgJxWi', '1', 'cart', 'sw@gmail.com', '2018-06-08 21:13:17'),
(98, '8wMuVl85WZLgJxWi', '8', 'cart', 'sw@gmail.com', '2018-06-08 21:20:46'),
(99, '8wMuVl85WZLgJxWi', '8', 'cart', 'sw@gmail.com', '2018-06-08 21:31:27'),
(100, '8wMuVl85WZLgJxWi', '8', 'cart', 'sw@gmail.com', '2018-06-08 21:38:23'),
(101, '8wMuVl85WZLgJxWi', '2', 'cart', 'sw@gmail.com', '2018-06-08 21:42:12'),
(102, '8wMuVl85WZLgJxWi', '5', 'cart', 'sw@gmail.com', '2018-06-08 21:50:39'),
(103, '8wMuVl85WZLgJxWi', '7', 'cart', 'sw@gmail.com', '2018-06-08 21:58:01'),
(104, '8wMuVl85WZLgJxWi', '9', 'cart', 'sw@gmail.com', '2018-06-08 21:59:51'),
(105, '8wMuVl85WZLgJxWi', '11', 'cart', 'sw@gmail.com', '2018-06-08 22:01:31'),
(106, '8wMuVl85WZLgJxWi', '7', 'cart', 'sw@gmail.com', '2018-06-08 22:03:51'),
(107, '8wMuVl85WZLgJxWi', '1', 'cart', 'sw@gmail.com', '2018-06-08 22:05:28'),
(108, '8wMuVl85WZLgJxWi', '7', 'cart', 'sw@gmail.com', '2018-06-08 22:11:31'),
(109, '8wMuVl85WZLgJxWi', '1', 'cart', 'sw@gmail.com', '2018-06-08 22:15:01'),
(110, '8wMuVl85WZLgJxWi', '7', 'cart', 'sw@gmail.com', '2018-06-08 22:23:20'),
(111, '8wMuVl85WZLgJxWi', '7', 'cart', 'sw@gmail.com', '2018-06-08 22:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(100) NOT NULL,
  `payment_name` varchar(1000) NOT NULL,
  `payment_contact` varchar(1000) NOT NULL,
  `payment_email` varchar(1000) NOT NULL,
  `payment_address` varchar(1000) NOT NULL,
  `payment_age` varchar(100) NOT NULL,
  `payment_option` varchar(1000) NOT NULL,
  `payment_status` varchar(1000) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_name`, `payment_contact`, `payment_email`, `payment_address`, `payment_age`, `payment_option`, `payment_status`, `payment_date`, `user_email`) VALUES
('0eVkKLnZRZCNucuw', 'Sakshi Wadhwa', '741', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '77', 'Stripe', 'cart', '2018-05-25 20:35:16', ''),
('0G6wd9lWEGdXOl3k', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 07:15:13', ''),
('0rSpPNcboOgCkUW1', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:49:50', ''),
('0Vb0LxrMwMWz03VJ', 'Sakshi', '741053250', ' Sakshi@ymail.com', 'sdtrfyguhikl', '21', 'Paypal', 'cart', '2018-05-24 20:01:54', ''),
('1BQ6T6P2BTE0JEhh', 'Sakshi Wadhwa', '741', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-25 20:34:59', ''),
('1IOzTWkQXuVal2XI', 'asdfgh', '895632', ' asdfg@gg.com', 'kjihugtfdr', '21', 'Stripe', 'success', '2018-05-25 20:40:37', 'sw@gmail.com'),
('3Bum0C6q8NxNfxay', 'Sw', '98563', ' sdfgh@gmail.com', 'kiouyjtrhg', '22', 'Paypal', 'cart', '2018-05-23 08:58:29', ''),
('3uRzc5hhsmDAJEv3', 'Wadhwa', '4561230', ' wadhwa0723@gmail.com', 'oiouytfrgcvb', '21', 'Stripe', 'cart', '2018-05-22 07:16:27', ''),
('5BSVCtOGnVRJqO1N', 'Sakshi Wadhwa', '54', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Paypal', 'cart', '2018-05-25 20:31:24', ''),
('5BVSGz6ZFAi8T4Ir', 'SW', '7418529630', ' sw123@gmail.com', 'poiuytfrdx', '22', 'Paypal', 'cart', '2018-05-24 19:23:52', ''),
('5fwPsl2w9bHLiLI2', 'Sakshi Wadhwa', '8965421', ' sakshiwadhwa0723@gmail.com', 'Chandigarh', '21', 'Stripe', 'success', '2018-05-24 11:01:35', 'sw@gmail.com'),
('5MaeCAX1MMd4XgGo', 'Sakshi Wadhwa', '645', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-22 18:57:00', ''),
('60JP7CpU0xOLJL5i', 'Sakshi', '123456', ' sak@gmail.com', 'asdfghjkl', '21', 'Stripe', NULL, '2018-05-05 20:02:47', ''),
('7XFtBILFx9kLXWCx', '', '', ' ', '', '', 'Paypal', 'cart', '2018-06-08 21:12:55', ''),
('8GP4DgfiS0eBT6Me', 'sw', '456123', ' sw@gmail.com', 'asdfg', '21', 'Paypal', NULL, '2018-05-04 07:37:34', ''),
('8xHZTPnvlgg8CoKG', 'SSSS', '1111', ' ssss@yahoo.in', 'zxcvbn', '21', 'Stripe', 'success', '2018-05-09 08:06:51', ''),
('9ceo29PVvenkUseO', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 22:26:31', ''),
('9gfkqWEXxOqPb3mP', 'sakshi wadhwa', '7894561230', ' sw@gmail.com', 'asdfghjl', '20', 'Paypal', NULL, '2018-05-04 07:33:29', ''),
('A2d6e5ipPyPaR0c0', 'Sakshi Wadhwa', '5668645210', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 08:22:18', ''),
('aMqvhwKk9HGGRFyA', '', '', ' ', '', '', 'Paypal', 'cart', '2018-05-23 11:12:50', ''),
('as78FosiWCAEHpZE', '', '', ' ', '', '', 'Paypal', 'cart', '2018-06-08 21:10:25', ''),
('asfcwWyEqGga2Tm9', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', 'cart', '2018-05-08 07:00:58', ''),
('aTqMapPeo13ggXDI', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:34:38', ''),
('AVn8aXIJU9BpNIcA', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', NULL, '2018-05-04 08:37:02', ''),
('B2ihsz4ikIBVmnQr', 'Sakshi Wadhwa', '864521', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-22 19:13:55', ''),
('bDTruXMTRzcVweaN', '', '', ' ', '', '', 'undefined', 'cart', '2018-05-25 20:29:23', ''),
('bhV1vOARAlbcSNeu', '', '', ' ', '', '', 'Stripe', 'cart', '2018-05-25 20:42:34', ''),
('BkpsdyWHDGMLDacF', 'Sakshi Wadhwa', '5634', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-22 18:50:46', ''),
('bsxksuapOyx9uEUm', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '78', 'Stripe', 'success', '2018-05-09 08:30:07', ''),
('btVzionaFOa1ZCm0', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:12:44', ''),
('BUx918W9U4bxBErC', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:31:46', ''),
('c7CeR85BIMEz47Kq', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:58:21', ''),
('cIuzOQNW3nfBFzEO', 'Sakshi Wadhwa', '9654321', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 09:28:30', ''),
('cMwUhxJfZMAQy6oN', 'SW', '7418529630', ' sw123@gmail.com', 'poiuytrd', '22', 'Stripe', 'success', '2018-05-24 19:37:26', 'sw@gmail.com'),
('ct1AgM2gUt7OBd8S', 'dfrgtf', '986453210', ' af@gmail.com', 'sdfghkl;', '22', 'Paypal', 'success', '2018-05-09 09:05:55', 'sw@gmail.com'),
('cu7RS3KgfTfTsQUG', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:52:15', ''),
('DB0kwkK4AvzHTJXP', 'Sakshi Wadhwa', '5412', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '25', 'Stripe', 'cart', '2018-05-22 07:04:58', ''),
('dxoltIpHJRxKb6qK', 'ref`', '85555526', ' yw@R.CO', 'EEEE', '78', 'Paypal', 'cart', '2018-05-23 10:50:34', ''),
('EeQ7UUGNsyTlmnFw', '', '', ' ', '', '', 'Paypal', 'success', '2018-05-23 10:52:32', 'sw@gmail.com'),
('EgZw3DzvHr4iGx9U', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', NULL, '2018-05-04 08:42:28', ''),
('eXamdBywTMmfBDTA', 'Sakshi Wadhwa', '46852', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'success', '2018-05-23 10:02:02', 'sw@gmail.com'),
('EZmI0snigywyRHLh', 'Sakshi Wadhwa', '7898545', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '21', 'Paypal', NULL, '2018-05-04 08:45:28', ''),
('f63X0pKG7O1pW5qh', 'Sakshi Wadhwa', '951', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-25 20:38:17', ''),
('GctOF1glAWMMzl4C', '', '', ' ', '', '', 'Stripe', NULL, '2018-05-04 10:59:07', ''),
('GGuGorVxuprR6ExF', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 22:12:04', ''),
('gpvtdTGhWZpi0Edb', 'Sakshi Wadhwa', '64521', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-25 20:27:56', ''),
('gRZggzUyudfyhduQ', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'cart', '2018-06-01 18:32:00', ''),
('gTf2gfZb4kZINgeJ', 'Sakshi Wadhwa', '741', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-25 20:32:39', ''),
('gWRVeZ8WZ1GXCoHg', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:32:16', ''),
('HmtT2oNTJ9BflhMo', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', 'cart', '2018-05-22 18:59:18', ''),
('hyUugCU0MytIRLPu', 'sakshi', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', 'success', '2018-05-09 08:38:15', ''),
('HZnpoNWhWopI5Di0', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 06:53:41', ''),
('ih27QuKJHsdlTKtb', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:12:43', ''),
('IMqDzozQOPLPZiQk', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'cart', '2018-06-01 18:39:22', ''),
('iok1Rhw5Hdv9z5Ho', '', '', ' ', '', '', 'Stripe', 'cart', '2018-05-25 20:44:29', ''),
('iV8KmyqwVMpbmlp6', '', '', ' ', '', '', 'Stripe', NULL, '2018-05-04 11:01:35', ''),
('iw8yqztzDpmcwirF', '', '', ' ', '', '', 'undefined', 'cart', '2018-05-25 20:31:32', ''),
('ixINGMvwHPyGO6C5', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'cart', '2018-06-01 18:38:02', ''),
('IZgcVJWDGoRNXiPz', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:45:30', ''),
('J809vxoqCGAB4Tai', 'Sak', '456', ' gh@gmail.com', 'asdfghjkk', '21', 'Paypal', 'cart', '2018-05-08 11:03:43', ''),
('Jr3RdylimKw8CmEE', 'Sakshi Wadhwa', '8654321', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 09:49:32', ''),
('K4OiZBZHsA1c2xpw', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 06:50:31', ''),
('k4qhpl1bAMD3QPi0', 'SW', '7418529630', ' sw123@gmail.com', 'poiuytfrdx', '22', 'Stripe', 'cart', '2018-05-24 19:24:00', ''),
('kc4q133TTZfI5uVT', '', '', ' ', '', '', 'Paypal', 'cart', '2018-06-08 22:31:47', ''),
('kgHzmr24MeazhNp0', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', NULL, '2018-05-04 08:36:31', ''),
('Khmozom4JS2sWelK', '', '', ' ', '', '', 'undefined', NULL, '2018-05-07 09:56:07', ''),
('KSGCXn3LrqPOeiqN', 'SSSS', '1111', ' ssss@yahoo.in', 'qwertyuiop', '21', 'Paypal', 'cart', '2018-05-09 07:12:19', ''),
('kV8hu4R44Fc8GNs9', 'SSSS', '3333', ' ssss@yahoo.in', 'zxcvbnm', '21', 'Paypal', 'success', '2018-05-09 07:29:13', ''),
('KvwsVgdvu7CAVZeI', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:42:35', ''),
('LIu07FknHbpW8Ft3', 'Saksham Garg', '9805410002', ' garg.saksham14@gmail.com', 'Kangra, HP', '22', 'Stripe', 'success', '2018-05-09 09:34:06', 'sw@gmail.com'),
('lNzMgtxykBVw0pIp', 'Sakshi Wadhwa', '112345', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-07 18:34:38', ''),
('LQXNAyJ3N5oPIRBt', '', '', ' ', '', '', 'Paypal', 'cart', '2018-05-25 20:24:36', ''),
('LuWRio7azBosTBFI', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:15:21', ''),
('lVs4xaTQqhSIvEx7', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 07:04:01', ''),
('lzkaPuIeLX2TRcdx', 'Sahil', '123456789', ' sahil1996.jain@gmail.com', 'qazwsxedfv', '21', 'Paypal', 'success', '2018-05-09 09:27:19', 'sw@gmail.com'),
('mCbeJcesi4UZAI9p', 'Saloni', '9888692406', ' gsaloni1796@gmail.com', 'chd', '24', 'Stripe', 'cart', '2018-05-08 09:44:49', ''),
('mcLmGA5FkSc2T4Vb', 'Sakshi', '9874563210', ' Sakshi@ymail.com', 'poiuytrewsdfgh', '21', 'Paypal', 'cart', '2018-05-24 19:59:41', ''),
('mewK1rtIDTHtCkhg', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 06:47:45', ''),
('mK6Qq5JDxoSI2PPB', 'Wadhwa', '4561230', ' wadhwa0723@gmail.com', 'oiouytfrgcvb', '21', 'Stripe', 'cart', '2018-05-22 07:10:46', ''),
('MMvNEzoA5XEsX8Ll', '', '', ' ', '', '', 'Paypal', 'cart', '2018-06-08 22:26:24', ''),
('mOQP4lzT43pXNPcH', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'success', '2018-05-09 09:37:32', 'sw@gmail.com'),
('mqepU5Tb90IPNCWQ', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:26:01', ''),
('NUaNW9F2CkNFpL5e', 'Sakshi Wadhwa', '5', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', 'cart', '2018-05-25 20:27:09', ''),
('o6rDvAGTsrqyTDxJ', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:25:38', ''),
('oBztx8QTorHQvrf1', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'cart', '2018-05-08 10:21:34', ''),
('OfgwnX2OJGXRQ3NB', 'SS', '8764521', ' ss@gmail.com', 'oi9u8y7tf', '22', 'Paypal', 'cart', '2018-05-23 09:54:05', ''),
('OTfqJfH2SyUysmkU', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-06-01 20:39:08', ''),
('oTVrAitI31ZV93Hi', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', NULL, '2018-05-04 08:35:49', ''),
('PcEavPURvEq30z8M', 'Saloni', '98654210', ' gsaloni1796@gmail.com', 'popiujgyhgfc', '25', 'Paypal', 'cart', '2018-05-23 09:22:57', ''),
('pf1zro7yFSPvCANJ', '', '', ' ', '', '', 'Paypal', 'cart', '2018-05-25 20:31:38', ''),
('pmzCk1RBu2sVA1HX', 'Sakshi Wadhwa', '71', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '11', 'Stripe', 'cart', '2018-05-25 20:37:52', ''),
('pNbIpPzqSazLCbSg', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 10:00:22', ''),
('q0zlPl1Fsms8b1l5', 'Sakshi Wadhwa', '23456', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-07 11:54:46', ''),
('QNeIXXUlU0PxeCpF', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Paypal', 'cart', '2018-05-25 20:30:37', ''),
('qqT8ZyoyUfNcnVU5', '', '', ' ', '', '', 'Paypal', 'cart', '2018-05-25 20:27:45', ''),
('QvxluklXRSWpdRaP', '', '', ' ', '', '', 'Stripe', 'cart', '2018-05-25 20:31:51', ''),
('qWihgbRSJG6zPm6T', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'success', '2018-06-01 18:40:15', 'sw@gmail.com'),
('qzkhmUr200O3SxOQ', 'Sakshi Wadhwa', '569421', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 09:26:23', ''),
('RDOhTscizTvUPWWP', '', '', ' ', '', '', 'Paypal', NULL, '2018-05-07 10:45:47', ''),
('rkEmiDclVvtL3zxN', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 22:00:17', ''),
('roNwBhKvRlXF6tIz', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:51:26', ''),
('rrDJHXQw6QqiLlKX', 'SSSS', '2222', ' ssss@yahoo.in', 'zxcvbn', '22', 'Paypal', 'success', '2018-05-09 07:25:25', ''),
('SQHdtV23WrCJhaJ2', '', '', ' ', '', '', 'Paypal', 'success', '2018-05-23 11:01:41', 'sw@gmail.com'),
('sSsKTtKPVHEWSrES', '', '', ' ', '', '', 'Stripe', 'cart', '2018-05-25 20:43:10', ''),
('SyQxzEPX6o08TzA0', 'Rohit Sharma', '9814601963', ' sh.rohit485@gmail.com', 'Chandigarh', '22', 'Stripe', 'cart', '2018-05-07 20:16:59', ''),
('tInysi7Bx07WOCkm', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 06:56:29', ''),
('u26qfXlFmUexT2GV', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:13:58', ''),
('uFFCsG8X279nCLJu', 'Sakshi Wadhwa', '56545', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '21', 'Paypal', NULL, '2018-05-04 10:42:28', ''),
('UlMwykxL65a2OVPp', 'Sakshi Wadhwa', '6452', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 09:35:32', ''),
('ULV1lw0cOTslJHgw', 'raghav', '8988562622', ' raghav.sharma848@gmail.com', 'dsfd', '22', 'Stripe', 'success', '2018-05-09 08:43:03', ''),
('UvEwZuaNQziIL7g8', 'Divij Thakur', '7418529630', ' divijsingh5@gmail.com', 'Sec. 51, Chandigarh', '21', 'Paypal', 'success', '2018-05-09 09:46:37', 'sw@gmail.com'),
('VcruDtqTShNEGsGZ', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 07:21:15', ''),
('vGv3XiL6LceiBIUr', 'Sakshi Wadhwa', '7754', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', 'cart', '2018-05-25 20:30:54', ''),
('vvcmM8mTc3NPwBos', 'Sakshi Wadhwa', '12458963', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', NULL, '2018-05-07 11:51:21', ''),
('vyv8dTstbFOXulB1', 'Sakshi Wadhwa', '856452526', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Stripe', 'cart', '2018-05-08 06:32:51', ''),
('WbfdiXtnaNnS7zk9', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:11:43', ''),
('wC3Ayfqligt3w99w', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:21:11', ''),
('WDKarM4gQQP61khi', 'Sakshi Wadhwa', '89654222', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-23 09:32:07', ''),
('Ww1dI6IOocwJfbzX', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'undefined', NULL, '2018-05-04 10:48:26', ''),
('wXBMXm7geNNOHhNS', '', '', ' ', '', '', 'undefined', 'success', '2018-05-09 08:54:46', ''),
('x0HEnOTHd3IZQGcn', 'Sakshi', '7894561230', ' sakshi@gmail.com', 'Landmark, Chandigarh', '21', 'Paypal', NULL, '2018-05-04 09:12:07', ''),
('Xa6nMEVMAeEwlK1Z', 'Sakshi', '1234578', ' sw@gmail.com', 'awdrgyj', '21', 'Paypal', NULL, '2018-05-05 20:16:54', ''),
('XcoOfPDxTTubb6vr', 'Sakshi Wadhwa', '', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '', 'Paypal', 'cart', '2018-05-25 20:29:47', ''),
('xgw0awvqKKs7XVS9', 'Rohit Sharma', '985', ' ', '', '', 'undefined', 'cart', '2018-06-01 18:35:06', ''),
('y6I78gJQKxAqI5ll', 'Sakshi Wadhwa', '541', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', 'cart', '2018-05-25 20:29:17', ''),
('yqm668FGOKIziVM6', 'SSSS', '1111', ' ssss@yahoo.in', 'zxcvbnm', '22', 'Paypal', 'success', '2018-05-09 07:31:01', ''),
('yRmroR7HMKwRxAx3', '', '', ' ', '', '', 'Stripe', 'cart', '2018-06-08 21:38:45', ''),
('ySkVBByp83HOtsFi', '', '', ' ', '', '', 'Paypal', 'cart', '2018-05-25 20:29:39', ''),
('yWHQxthxWAcHulpL', 'Sakshi Wadhwa', '645', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Stripe', 'cart', '2018-05-22 18:55:49', ''),
('zRwOHrJDf0P8hKRA', '', '', ' ', '', '', 'Paypal', 'success', '2018-05-23 10:57:13', 'sw@gmail.com'),
('zT0kgE6ArDc80kOm', 'Sakshi Wadhwa', '841254', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '22', 'Paypal', NULL, '2018-05-06 21:14:53', ''),
('ZuQTZGyELIsFT6GE', 'Wadhwa', '7508214970', ' sakshiwadhwa0723@gmail.com', 'Prem General Store, Near Rani Majra Provision Store, Lalru Mandi', '21', 'Stripe', 'cart', '2018-05-08 19:58:09', '');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_title` mediumtext,
  `project_img` varchar(1000) DEFAULT NULL,
  `project_description` mediumtext,
  `project_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_title`, `project_img`, `project_description`, `project_status`) VALUES
(1, 'WEDDING PROJECT', './static/testimonial4.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(2, 'OUR COLLECTIONS', ' ./static/main_carousel_1dfghjk.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(3, 'PARTY PROJECT', ' ./static/main_carousel_3sdfhgh.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active'),
(4, 'CORPORATE EVENTS', ' ./static/testimonial2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `category_id` int(100) DEFAULT NULL,
  `service_name` mediumtext,
  `service_img` mediumtext,
  `service_description` mediumtext,
  `book_amount` int(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `category_id`, `service_name`, `service_img`, `service_description`, `book_amount`) VALUES
(1, 1, 'Banquets & Style', './static/banquets.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 112),
(2, 1, 'Wedding Planning', './static/planning.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3000),
(3, 1, 'Catering & Decoration', './static/catering.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1500),
(4, 1, 'Gift Ideas', './static/gift_ideas.jpeg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2000),
(5, 1, 'Ceremony Ideas', './static/ceremony.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2000),
(6, 1, 'Beach Weddings', './static/beach.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2500),
(7, 2, 'DJs', './static/dj-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 250),
(8, 2, 'Bartenders', './static/bar.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 800),
(9, 2, 'Waitstaff', './static/wait_staff-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 900),
(10, 2, 'Photographers', './static/photograph-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 600),
(11, 2, 'Clean-Up Crew', './static/clean-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 300),
(12, 2, 'Book A Party', './static/book-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1000),
(13, 3, 'Corporate Conference', './static/confrenceroom.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 500),
(14, 3, 'Meetings', './static/meetings.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 100),
(15, 3, 'Club Events', './static/club-001.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 700),
(16, 3, 'Product Launch Announcement', './static/announce.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 150),
(17, 3, 'Digital', './static/digital.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 100),
(18, 3, '25th Corporate Celebration', './static/celebration-002.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 250);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `subscribe_id` int(11) NOT NULL,
  `subscribe_name` varchar(1000) DEFAULT NULL,
  `subscribe_email` mediumtext,
  `subscribe_status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`subscribe_id`, `subscribe_name`, `subscribe_email`, `subscribe_status`) VALUES
(1, 'undefined', ' sakshiwadhwa@gmail.com', 'active'),
(3, 'Sakshi', 'sakshi@gmail.com', 'active'),
(5, 'Sakshi', 'swa@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_name` varchar(1000) NOT NULL,
  `testimonial_designation` varchar(10000) NOT NULL,
  `testimonial_review` varchar(10000) NOT NULL,
  `testimonial_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`testimonial_id`, `testimonial_name`, `testimonial_designation`, `testimonial_review`, `testimonial_img`) VALUES
(1, 'Philip Lawrence', ' Customer', '\"I have got my complete wedding planned by Treveants, experience was phenomenal and they managed every occasion beautifully.\"', './static/testimonial.jpg'),
(2, 'Philip Lawrence', ' Customer', '\"I have got my complete wedding planned by Treveants, experience was phenomenal and they managed every occasion beautifully.\"', './static/testimonial.jpg'),
(3, 'Philip Lawrence', ' Customer', '\"I have got my complete wedding planned by Treveants, experience was phenomenal and they managed every occasion beautifully.\"', './static/testimonial.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(1000) DEFAULT NULL,
  `user_lastname` varchar(1000) DEFAULT NULL,
  `user_email` varchar(10000) DEFAULT NULL,
  `user_password` varchar(10000) DEFAULT NULL,
  `user_status` varchar(100) DEFAULT 'active',
  `membership_title` varchar(10000) DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_status`, `membership_title`, `payment_id`) VALUES
(1, NULL, NULL, 'sakshi@gmail.com', 'sakshi', 'active', 'BASIC', 'ih27QuKJHsdlTKtb'),
(2, 'Sa', '', '', ' ', 'Select', NULL, NULL),
(3, 'Sakshi', 'Wadhwa', 'sw@gmail.com', 'sakshi', 'active', 'PLATINUM', 'qWihgbRSJG6zPm6T'),
(4, NULL, NULL, 'reet@gmail.com', 'reet', '', NULL, NULL),
(5, 'Rohit', 'Sharma', 'rohit@gmail.com', 'rohit', 'active', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`,`email`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `order_events`
--
ALTER TABLE `order_events`
  ADD PRIMARY KEY (`id`,`order_id`,`service_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`subscribe_id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_events`
--
ALTER TABLE `order_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

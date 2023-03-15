-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 
-- 伺服器版本： 8.0.17
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `wms_master`
--

-- --------------------------------------------------------

--
-- 資料表結構 `accessories`
--

CREATE TABLE `accessories` (
  `ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `ACCESSORIES_ID` bigint(20) NOT NULL,
  `NECESSARY` tinyint(1) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `addresses`
--

CREATE TABLE `addresses` (
  `ID` bigint(20) NOT NULL,
  `PERSON_ID` bigint(20) NOT NULL,
  `TYPE` int(10) NOT NULL,
  `ADDRESS` varchar(256) DEFAULT '',
  `CITY` varchar(50) DEFAULT '',
  `STATE` varchar(50) DEFAULT '',
  `COUNTRY` varchar(50) DEFAULT '',
  `ZIP` char(10) DEFAULT '',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `address_types`
--

CREATE TABLE `address_types` (
  `ID` int(10) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `brands`
--

CREATE TABLE `brands` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `COMPANY_ID` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(50) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `companies`
--

CREATE TABLE `companies` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `TAX_ID_NUMBER` char(20) DEFAULT '',
  `PHONE` char(20) DEFAULT '',
  `FAX` char(20) DEFAULT '',
  `EMAIL` varchar(100) DEFAULT '',
  `ADDRESS` varchar(256) DEFAULT '',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `contacts`
--

CREATE TABLE `contacts` (
  `ID` bigint(20) NOT NULL,
  `COMPANY_ID` bigint(20) DEFAULT '0',
  `DEPARTMENT` varchar(256) DEFAULT '',
  `JOB_TITLE` char(50) DEFAULT '',
  `PERSON_ID` bigint(20) NOT NULL,
  `SUPPLIER` tinyint(1) DEFAULT NULL,
  `COSTOMER` tinyint(1) DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `genders`
--

CREATE TABLE `genders` (
  `ID` smallint(6) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `COMMENT` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `groups`
--

CREATE TABLE `groups` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `CREATED` datetime NOT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `instant_social`
--

CREATE TABLE `instant_social` (
  `ID` bigint(20) NOT NULL,
  `PERSON_ID` bigint(20) NOT NULL,
  `TYPE` int(10) NOT NULL,
  `ACCOUNT` varchar(256) NOT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `instant_social_types`
--

CREATE TABLE `instant_social_types` (
  `ID` int(10) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `inventories`
--

CREATE TABLE `inventories` (
  `ID` bigint(20) NOT NULL,
  `REPORT_ITEM_ID` bigint(20) NOT NULL,
  `GOODS_ITEM_ID` bigint(20) DEFAULT NULL,
  `DATETIME` date NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `STOCK_QUANTITY` bigint(20) DEFAULT NULL,
  `TAG_ID` bigint(20) DEFAULT '0',
  `LOCATION_ID` bigint(20) DEFAULT '0',
  `DEVICE_ID` bigint(20) DEFAULT '0',
  `PHYSICAL_PORT` bigint(16) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `inventory_items`
--

CREATE TABLE `inventory_items` (
  `ID` bigint(20) NOT NULL,
  `REPORT_ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  `AUDITOR_ID` bigint(20) NOT NULL DEFAULT '0',
  `CREATE_DATETIME` date NOT NULL,
  `FINISHED_DATETIME` date DEFAULT NULL,
  `QUANTITY` bigint(20) DEFAULT '0',
  `STOCK_QUANTITY` bigint(20) DEFAULT '0',
  `CLOSED` tinyint(1) DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `inventory_reports`
--

CREATE TABLE `inventory_reports` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `REPORT` varchar(512) DEFAULT '',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `BRAND_ID` bigint(20) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT '',
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SPECIFICATION` varchar(50) DEFAULT '',
  `ATTRIBUTES` varchar(256) DEFAULT '',
  `SIZE` varchar(50) DEFAULT '',
  `WEIGHT` char(10) DEFAULT '',
  `UNIT` char(10) DEFAULT '',
  `STOCK_QUANTITY` bigint(20) DEFAULT '0',
  `SAFETY_STOCK` bigint(20) DEFAULT '0',
  `SHARED_ID` tinyint(1) DEFAULT '0',
  `BARCODE` char(20) DEFAULT NULL,
  `HYPERLINK` text,
  `PHOTO` mediumblob,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`ID`, `NAME`, `FULL_NAME`, `BRAND_ID`, `MODEL`, `CATEGORY_ID`, `SPECIFICATION`, `ATTRIBUTES`, `SIZE`, `WEIGHT`, `UNIT`, `STOCK_QUANTITY`, `SAFETY_STOCK`, `SHARED_ID`, `BARCODE`, `HYPERLINK`, `PHOTO`, `COMMENT`) VALUES
(1, 'item001', 'item001', NULL, '', NULL, '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL, 'item001'),
(2, 'item002', 'item002', NULL, '', NULL, '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL, 'item002');

-- --------------------------------------------------------

--
-- 資料表結構 `locations`
--

CREATE TABLE `locations` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(50) NOT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `TYPE` tinyint(4) DEFAULT '0',
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(50) DEFAULT NULL,
  `CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `locations`
--

INSERT INTO `locations` (`ID`, `NAME`, `FULL_NAME`, `TYPE`, `PARENT_ID`, `COMMENT`, `CREATED`) VALUES
(1, 'Location001', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-12 20:05:23'),
(2, 'Location002', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-12 20:05:23'),
(4, 'Location004', 'Location001', 0, NULL, NULL, '2023-03-12 20:05:23'),
(6, 'Location006', 'Location001', 0, NULL, 'ttttttt', '2023-03-12 20:06:48'),
(7, 'Location007', 'Location001', 0, NULL, 'ttttttt', '2023-03-12 20:07:59'),
(9, 'Location009', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-12 20:10:25'),
(14, 'Location014', 'Location001', 0, 2, 'ddddddd', '2023-03-12 20:16:41'),
(15, 'subLocation001', 'subLocation001', 0, NULL, 'AAAAttttttt', '2023-03-12 20:16:42'),
(16, 'Location016', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-12 20:28:07'),
(18, 'Location018', 'Location001', 0, 2, 'ddddddd', '2023-03-12 22:25:16'),
(20, 'Location020', 'Location001', 0, NULL, 'ddddddd', '2023-03-12 22:26:02'),
(21, 'Location021', 'Location001', 0, NULL, 'ddddddd', '2023-03-12 22:26:06'),
(22, 'Location022', 'Location001', 0, NULL, 'ddddddd', '2023-03-12 22:26:34'),
(23, 'Location023', 'Location003', 0, NULL, 'ddddddd', '2023-03-12 22:36:11'),
(24, 'Location024', 'Location003', 0, NULL, 'ddddddd', '2023-03-12 22:36:14'),
(25, 'Location025', 'Location003', 0, NULL, 'ddddddd', '2023-03-12 22:36:17'),
(26, 'Location026', 'Location005', 0, NULL, 'ffffff', '2023-03-12 22:36:31'),
(27, 'Location027', 'Location005', 0, NULL, 'ffffff', '2023-03-12 22:36:34'),
(28, 'Location028', 'Location005', 0, NULL, 'ffffff', '2023-03-12 22:36:37'),
(29, 'Location029', 'Location005', 2, NULL, 'ffffff', '2023-03-12 22:47:43'),
(30, 'Location030', 'Location005', 2, NULL, 'ffffff', '2023-03-12 22:47:47'),
(31, 'Location031', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:06:39'),
(32, 'Location032', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:06:42'),
(33, 'Location033', 'Location033', 5, NULL, 'ffff33333', '2023-03-13 01:09:32'),
(34, 'Location034', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:09:36'),
(35, 'Location035', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:10:13'),
(36, 'Location036', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:12:11'),
(37, 'Location037', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:12:17'),
(38, 'Location038', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:12:37'),
(39, 'Location039', 'Location005', 5, NULL, 'ffffff', '2023-03-13 01:12:48'),
(40, 'Location040', 'Location005', 5, NULL, 'ffffff', '2023-03-13 16:56:10'),
(41, 'Location041', 'Location005', 5, NULL, 'ffffff', '2023-03-13 16:56:17'),
(42, 'Location001', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-15 17:31:37'),
(43, 'Location001', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-15 17:33:29'),
(44, 'Location001', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-15 17:34:55'),
(45, 'Location001', 'Location001', 0, NULL, 'AAAAttttttt', '2023-03-15 17:36:17');

-- --------------------------------------------------------

--
-- 資料表結構 `people`
--

CREATE TABLE `people` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(256) NOT NULL,
  `FIRST_NAME` char(50) NOT NULL DEFAULT '',
  `MIDDLE_NAME` char(50) DEFAULT '',
  `LAST_NAME` char(50) DEFAULT '',
  `BIRTHDAY` date DEFAULT NULL,
  `GENDER` smallint(6) NOT NULL,
  `PHOTO` mediumblob,
  `COMMENT` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `phones`
--

CREATE TABLE `phones` (
  `ID` bigint(20) NOT NULL,
  `PERSON_ID` bigint(20) NOT NULL,
  `TYPE` int(10) NOT NULL,
  `COUNTRY_CODE` char(20) DEFAULT '',
  `AREA_CODE` char(5) DEFAULT '',
  `PHONE_NUMBER` char(20) DEFAULT '',
  `EXTENSION_NUMBER` char(5) DEFAULT '',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `phone_types`
--

CREATE TABLE `phone_types` (
  `ID` int(10) NOT NULL,
  `NAME` char(50) NOT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `related_products`
--

CREATE TABLE `related_products` (
  `ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `RELATED_PRODUCTS` bigint(20) NOT NULL,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `tag_identifiers`
--

CREATE TABLE `tag_identifiers` (
  `ID` bigint(20) NOT NULL,
  `UID` char(40) DEFAULT '',
  `TID` char(40) DEFAULT '',
  `EPC` varchar(128) DEFAULT '',
  `MANUFACTURING_TIME` date DEFAULT NULL,
  `EFFECTIVE_TIME` date DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `tag_identifiers`
--

INSERT INTO `tag_identifiers` (`ID`, `UID`, `TID`, `EPC`, `MANUFACTURING_TIME`, `EFFECTIVE_TIME`, `STATUS`, `COMMENT`) VALUES
(1, '', '', 'AAAAAAA00000000A1', NULL, NULL, 0, 'AAAAAAA00000000A1'),
(2, '', '', 'AAAAAAA00000000A2', NULL, NULL, 0, 'AAAAAAA00000000A2');

-- --------------------------------------------------------

--
-- 資料表結構 `transactions`
--

CREATE TABLE `transactions` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `TYPE` int(10) NOT NULL,
  `DATETIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `QUANTITY` bigint(20) DEFAULT '1',
  `TAG_ID` bigint(20) DEFAULT '0',
  `LOCATION_ID` bigint(20) DEFAULT '0',
  `DEVICE_ID` bigint(20) DEFAULT '0',
  `PHYSICAL_PORT` bigint(16) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `transactions`
--

INSERT INTO `transactions` (`ID`, `USER_ID`, `ITEM_ID`, `TYPE`, `DATETIME`, `QUANTITY`, `TAG_ID`, `LOCATION_ID`, `DEVICE_ID`, `PHYSICAL_PORT`, `COMMENT`) VALUES
(11, 1, 2, 2, '2023-03-03 01:02:42', 1, 2, 32, 2, 0, 'transaction'),
(13, 2, 1, 1, '2023-03-03 01:14:44', 1, 2, 2, 2, 0, 'transaction002'),
(64, 1, 1, 1, '2023-03-15 14:01:37', 1, 1, 28, 1, 1, 'ttttttt'),
(75, 1, 1, 1, '2023-03-15 14:08:31', 1, 1, 27, 1, 1, 'fffffgggg'),
(77, 1, 1, 1, '2023-03-15 14:08:56', 1, 1, 27, 1, 1, 'fff'),
(78, 2, 2, 2, '2023-03-15 14:09:05', 2, 2, 28, 2, 2, 'kkkkk'),
(79, 1, 1, 1, '2023-03-15 14:11:44', 1, 1, 26, 1, 1, 'lllll'),
(80, 1, 1, 1, '2023-03-15 14:11:57', 1, 1, 28, 1, 1, 'hhhhhhoooo'),
(81, 2, 2, 2, '2023-03-15 14:13:19', 2, 2, 2, 2, 2, 'transaction003'),
(82, 2, 2, 2, '2023-03-15 14:13:29', 2, 2, 2, 2, 2, 'transaction003'),
(86, 1, 1, 1, '2023-03-15 14:21:49', 1, 1, 26, 1, 1, 'gggggg'),
(87, 1, 1, 1, '2023-03-15 16:16:41', 1, 1, 26, 1, 1, 'wwwww'),
(89, 2, 2, 2, '2023-03-15 17:07:40', 2, 2, 2, 2, 2, 'transaction003'),
(90, 2, 2, 2, '2023-03-15 17:12:00', 2, 2, 2, 2, 2, 'transaction003'),
(91, 1, 1, 1, '2023-03-15 17:13:51', 1, 1, 26, 1, 1, '23333333'),
(92, 2, 2, 2, '2023-03-15 17:14:37', 2, 2, 25, 2, 2, 'rrrrrr');

-- --------------------------------------------------------

--
-- 資料表結構 `transaction_types`
--

CREATE TABLE `transaction_types` (
  `ID` int(10) NOT NULL,
  `NAME` char(50) NOT NULL,
  `ADJUSTMENT` tinyint(4) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `transaction_types`
--

INSERT INTO `transaction_types` (`ID`, `NAME`, `ADJUSTMENT`, `COMMENT`) VALUES
(1, 'type001', 0, 'type001'),
(2, 'type002', 0, 'type002');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(100) NOT NULL,
  `PASSWORD` varchar(1024) DEFAULT '',
  `FULL_NAME` varchar(256) DEFAULT '',
  `EMPLOYEE_NUMBER` char(50) DEFAULT '',
  `PHONE_NUMBER` char(20) DEFAULT '',
  `EXTENSION_NUMBER` char(10) DEFAULT '',
  `MOBILE_PHONE` char(20) DEFAULT '',
  `EMAIL` varchar(100) DEFAULT '',
  `LAST_PASSWORD_CHANGE` datetime DEFAULT NULL,
  `MINIMUM_PASSWORD_AGE` int(10) DEFAULT NULL,
  `MAXIMUM_PASSWORD_AGE` int(10) DEFAULT NULL,
  `PASSWORD_WARNING_PERIOD` int(10) DEFAULT NULL,
  `PASSWORD_INACTIVITY_PERIOD` int(10) DEFAULT NULL,
  `ACCOUNT_EXPIRATION_DATE` date DEFAULT NULL,
  `CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LOGIN` datetime DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `PHOTO` mediumblob,
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`ID`, `NAME`, `PASSWORD`, `FULL_NAME`, `EMPLOYEE_NUMBER`, `PHONE_NUMBER`, `EXTENSION_NUMBER`, `MOBILE_PHONE`, `EMAIL`, `LAST_PASSWORD_CHANGE`, `MINIMUM_PASSWORD_AGE`, `MAXIMUM_PASSWORD_AGE`, `PASSWORD_WARNING_PERIOD`, `PASSWORD_INACTIVITY_PERIOD`, `ACCOUNT_EXPIRATION_DATE`, `CREATED`, `LOGIN`, `UPDATED`, `PHOTO`, `COMMENT`) VALUES
(1, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-01 19:15:43', NULL, NULL, NULL, 'user001'),
(2, 'user002', 'user002', 'user002', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-01 19:17:45', NULL, NULL, NULL, 'user002'),
(5, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 18:41:48', NULL, NULL, NULL, 'user001'),
(6, 'user002', 'user002', 'user002', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 18:41:52', NULL, NULL, NULL, 'user002'),
(7, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:08:46', NULL, NULL, NULL, 'user001'),
(8, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:08:57', NULL, NULL, NULL, 'user001'),
(9, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:09:03', NULL, NULL, NULL, 'user001'),
(10, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:15:32', NULL, NULL, NULL, 'user001'),
(11, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:19:54', NULL, NULL, NULL, 'user001'),
(12, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:20:34', NULL, NULL, NULL, 'user001'),
(13, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:21:00', NULL, NULL, NULL, 'user001'),
(14, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:21:02', NULL, NULL, NULL, 'user001'),
(15, 'user002', 'user002', 'user002', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:24:35', NULL, NULL, NULL, 'user002'),
(16, 'user001', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 19:25:17', NULL, NULL, NULL, 'user001'),
(17, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 20:07:25', NULL, '2023-03-05 20:07:25', NULL, 'user001'),
(18, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:28:08', NULL, '2023-03-06 02:28:08', NULL, 'user001'),
(19, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:28:11', NULL, '2023-03-06 02:28:11', NULL, 'user001'),
(20, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:28:13', NULL, '2023-03-06 02:28:13', NULL, 'user001'),
(21, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:38:32', NULL, '2023-03-06 02:38:32', NULL, 'user001'),
(22, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:38:34', NULL, '2023-03-06 02:38:34', NULL, 'user001'),
(23, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:38:37', NULL, '2023-03-06 02:38:37', NULL, 'user001'),
(24, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:47:28', NULL, '2023-03-06 02:47:28', NULL, 'user001'),
(25, 'user0017', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 02:47:29', NULL, '2023-03-06 02:47:29', NULL, 'user001'),
(26, 'user031', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 17:18:47', NULL, '2023-03-15 17:18:48', NULL, 'user001'),
(27, 'user031', 'user001', 'user001', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-15 17:19:04', NULL, '2023-03-15 17:19:05', NULL, 'user001');

-- --------------------------------------------------------

--
-- 資料表結構 `virtual_devices`
--

CREATE TABLE `virtual_devices` (
  `ID` bigint(20) NOT NULL,
  `NAME` char(50) NOT NULL,
  `FULL_NAME` char(100) DEFAULT '',
  `DEVICE_ID` char(12) NOT NULL,
  `ANTENNAS` bigint(16) DEFAULT '1',
  `LOCATION_ID` bigint(20) DEFAULT '0',
  `COMMENT` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `virtual_devices`
--

INSERT INTO `virtual_devices` (`ID`, `NAME`, `FULL_NAME`, `DEVICE_ID`, `ANTENNAS`, `LOCATION_ID`, `COMMENT`) VALUES
(1, 'virtual_devices001', 'virtual_devices001', '', 1, 1, 'virtual_devices001'),
(2, 'virtual_devices002', 'virtual_devices002', '', 1, 2, 'virtual_devices002');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `COMPANY_ID` (`COMPANY_ID`);

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PARENT_ID` (`PARENT_ID`);

--
-- 資料表索引 `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CATEGORY_ID` (`CATEGORY_ID`),
  ADD KEY `BRAND_ID` (`BRAND_ID`);

--
-- 資料表索引 `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PARENT_ID` (`PARENT_ID`);

--
-- 資料表索引 `tag_identifiers`
--
ALTER TABLE `tag_identifiers`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LOCATION_ID` (`LOCATION_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `ITEM_ID` (`ITEM_ID`),
  ADD KEY `TYPE` (`TYPE`),
  ADD KEY `TAG_ID` (`TAG_ID`),
  ADD KEY `DEVICE_ID` (`DEVICE_ID`);

--
-- 資料表索引 `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `virtual_devices`
--
ALTER TABLE `virtual_devices`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LOCATION_ID` (`LOCATION_ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `brands`
--
ALTER TABLE `brands`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `companies`
--
ALTER TABLE `companies`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items`
--
ALTER TABLE `items`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `locations`
--
ALTER TABLE `locations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag_identifiers`
--
ALTER TABLE `tag_identifiers`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `virtual_devices`
--
ALTER TABLE `virtual_devices`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`COMPANY_ID`) REFERENCES `companies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `categories` (`ID`);

--
-- 資料表的限制式 `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`ID`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`BRAND_ID`) REFERENCES `brands` (`ID`);

--
-- 資料表的限制式 `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `locations` (`ID`);

--
-- 資料表的限制式 `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`ID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`ITEM_ID`) REFERENCES `items` (`ID`),
  ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`TYPE`) REFERENCES `transaction_types` (`ID`),
  ADD CONSTRAINT `transaction_ibfk_5` FOREIGN KEY (`TAG_ID`) REFERENCES `tag_identifiers` (`ID`),
  ADD CONSTRAINT `transaction_ibfk_6` FOREIGN KEY (`DEVICE_ID`) REFERENCES `virtual_devices` (`ID`);

--
-- 資料表的限制式 `virtual_devices`
--
ALTER TABLE `virtual_devices`
  ADD CONSTRAINT `virtual_devices_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

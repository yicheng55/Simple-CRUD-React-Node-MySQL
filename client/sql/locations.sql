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
-- 資料表結構 `locations`
--

DROP TABLE IF EXISTS `locations`;
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
(41, 'Location041', 'Location005', 5, NULL, 'ffffff', '2023-03-13 16:56:17');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PARENT_ID` (`PARENT_ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `locations`
--
ALTER TABLE `locations`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `locations` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

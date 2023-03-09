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
-- 資料庫： `employeesystem`
--
CREATE DATABASE IF NOT EXISTS `employeesystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `employeesystem`;

-- --------------------------------------------------------

--
-- 資料表結構 `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `position` varchar(90) DEFAULT NULL,
  `wage` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `employees`
--

INSERT INTO `employees` (`id`, `name`, `age`, `country`, `position`, `wage`) VALUES
(5, 'fdsgg', 34, 'gffg', 'asga', 'fffff'),
(9, 'dddd', 333, 'fdsfff', '33', '33'),
(10, 'AAAA', 45, 'fffff', 'ffff', '45'),
(11, 'AAAA', 45, 'fffff', 'ffff', '45'),
(12, 'AAAA', 45, 'fffff', 'ffff', '45'),
(13, 'wwww', 21, 'eee', 'eeee', '344'),
(14, 'wwww', 21, 'eee', 'eeee', '344'),
(15, '', 0, '', '', '1'),
(16, '', 0, '', '', '1'),
(17, '', 0, '', '', '1'),
(18, '', 0, '', '', '0');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2021 at 07:45 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `10january`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` char(8) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` char(10) NOT NULL,
  `salary` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `first_name`, `last_name`, `email`, `phone`, `salary`) VALUES
(1, '101', 'samir', 'hossen', 'samirhossen@gmail.com', '0125478855', '12000.00'),
(3, '103', 'Hridoy', 'Khan', 'Hridoykhan@gmail.com', '0459877', '17000.00'),
(4, '104', 'Ruhul', 'Amin', 'rohoulamin@gmail.com', '8523695', '22000.00');

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `after_insert_employee` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
INSERT INTO employees_log VALUES('',NEW.employee_id,'create',now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_employee` BEFORE DELETE ON `employees` FOR EACH ROW BEGIN
INSERT INTO employee_log VALUES(' ',OLD.employee_id,'delete',now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_employee` BEFORE UPDATE ON `employees` FOR EACH ROW BEGIN
INSERT INTO employee_log VALUES(' ',OLD.employee_id,'update',now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_info_view`
-- (See below for the actual view)
--
CREATE TABLE `employee_info_view` (
`employee_id` char(8)
,`first_name` varchar(100)
,`last_name` varchar(100)
,`salary` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee_log`
--

CREATE TABLE `employee_log` (
  `log_id` int(11) NOT NULL,
  `employee_id` mediumint(9) NOT NULL,
  `event` varchar(10) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_log`
--

INSERT INTO `employee_log` (`log_id`, `employee_id`, `event`, `date_time`) VALUES
(1, 105, 'delete', '2021-01-10 12:12:48'),
(2, 104, 'update', '2021-01-10 12:14:55');

-- --------------------------------------------------------

--
-- Structure for view `employee_info_view`
--
DROP TABLE IF EXISTS `employee_info_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_info_view`  AS SELECT `employees`.`employee_id` AS `employee_id`, `employees`.`first_name` AS `first_name`, `employees`.`last_name` AS `last_name`, `employees`.`salary` AS `salary` FROM `employees` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_log`
--
ALTER TABLE `employee_log`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_log`
--
ALTER TABLE `employee_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

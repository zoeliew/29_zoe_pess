-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 05:37 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `29_zoe_pessdb`
--
CREATE DATABASE IF NOT EXISTS `29_zoe_pessdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `29_zoe_pessdb`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(1, 'QX1234B', '2019-05-06 12:36:23', NULL, NULL),
(2, 'QX1111C', '2019-05-08 16:39:17', NULL, NULL),
(3, 'QX1234A', '2019-05-08 16:58:49', NULL, NULL),
(4, 'QX1234B', '2019-05-09 10:47:59', NULL, NULL),
(5, 'QX1111C', '2019-05-09 10:49:41', NULL, NULL),
(6, 'QX1234A', '2019-05-09 13:16:20', NULL, NULL),
(7, 'QX1234B', '2019-05-09 14:37:12', NULL, NULL),
(8, 'QX1235E', '2019-05-15 17:02:35', NULL, '2019-05-15 17:02:42'),
(9, 'QX5555D', '2019-05-15 17:03:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(1, 'sered', '95485465', '1', 'hvbyhgbu', 'jubuhih', '2', '2019-05-06 04:36:23'),
(2, 'adsas', '12312321', '1', 'qasdas', 'sacsasa', '2', '2019-05-08 08:39:16'),
(3, 'adsd', 'wqdwqd', '1', 'wqfwqf', 'wqfwqf', '2', '2019-05-08 08:58:49'),
(4, 'daasc', '212131', '1', 'cacacssa', 'assaca', '2', '2019-05-09 02:47:59'),
(5, 'safsaf', '12321321', '1', 'asasdsad', 'asdasdsada', '2', '2019-05-09 02:49:41'),
(6, 'dexexe', '123456', '5', '', '', '2', '2019-05-09 05:16:20'),
(7, 'asdas', 'sadsad', '1', 'sadads', 'asdsadads', '2', '2019-05-09 06:37:10'),
(8, 'qweq', '2321321321', '1', 'wqewqeqe', 'wqewqeq', '3', '2019-05-15 09:02:42'),
(9, 'asdsad', '2132131', '1', 'wqewqeqe', 'ff', '2', '2019-05-15 09:03:07');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_status_id` varchar(1) NOT NULL,
  `incident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('1', 'Fire'),
('2', 'Riot'),
('3', 'Burglary'),
('4', 'Domestic Violence'),
('5', 'Fallen Tree'),
('6', 'Traffic Accident'),
('7', 'Loan Shark'),
('8', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1111C', '1'),
('QX1234A', '2'),
('QX1234B', '1'),
('QX1235E', '3'),
('QX5555D', '5');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'AVAILABLE'),
('2', 'STOLEN'),
('3', 'PATROL'),
('4', 'AVAILABLE'),
('5', 'LOST');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

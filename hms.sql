-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 11:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'danielkim@gmail.com', 'Dr. Daniel Kim', 'Cardiologists'),
(2, 'emilysmith@gmail.com', 'Dr. Emily Smith', 'Dermatologists'),
(3, 'jamespatel@gmail.com', 'Dr. James Patel', 'Anesthesiologists'),
(4, 'danielkim@gmail', 'Dr. Daniel Kim', 'Endocrinologists'),
(5, 'jenniferlee@gmail.com', 'Dr. Jennifer lee', 'Corona');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(5, 'patient@gmail.com', 'Patient', 'Male', 'morning', 'fevr', '18:06:00', '2024-03-10', 'Cardiologists', '9874563210'),
(8, 'anshuman@gmail.com', 'Anshuman', 'Male', 'evening', 'cold', '22:18:00', '2024-03-05', 'Dermatologists', '9871253210'),
(9, 'kartik@gmail.com', 'Kartik', 'Male', 'morning', 'cold', '17:27:00', '2024-02-24', 'Anesthesiologists', '9796475122'),
(10, 'ram@gmail.com', 'Ram', 'Male', 'evening', 'fever', '16:25:00', '2024-02-09', 'Cardiologists', '9857451230'),
(15, 'kanishk@gmail.com', 'Kanishk', 'Female', 'morning', 'corona', '20:42:00', '2024-03-14', 'Anesthesiologists', '7084571252'),
(16, 'khushi@gmail.com', 'Khushi', 'Female', 'evening', 'fever', '15:46:00', '2024-03-01', 'Endocrinologists', '7844125102'),
(17, 'randy@gmail.com', 'Randy', 'Female', 'evening', 'fever', '15:48:00', '2021-01-23', 'Endocrinologists', '7841253102');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'Anishul', 'anishul@gmail.com'),
(2, 'test', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 12, 'kartik@gmail.com', 'Kartik', 'PATIENT INSERTED', '2024-01-02 16:35:10'),
(2, 11, 'kuntal@gmail.com', 'Kuntal', 'PATIENT INSERTED', '2024-01-03 16:37:34'),
(3, 10, 'sammy@gmail.com', 'Sammy', 'PATIENT UPDATED', '2024-01-03 16:38:27'),
(4, 11, 'zane@gmail.com', 'Zane', 'PATIENT UPDATED', '2024-01-03 16:38:33'),
(5, 12, 'dora@gmail.com', 'Dora', 'Patient Deleted', '2024-01-09 16:40:40'),
(6, 11, 'jimmy@gmail.com', 'Jimmy', 'PATIENT DELETED', '2024-01-10 16:41:10'),
(7, 13, 'nora@gmail.com', 'Nora', 'PATIENT INSERTED', '2024-01-12 16:50:21'),
(8, 13, 'suzane@gmail.com', 'Suzane', 'PATIENT UPDATED', '2024-01-13 16:50:32'),
(9, 13, 'joker@gmail.com', 'Joker', 'PATIENT DELETED', '2024-02-01 16:50:57'),
(10, 14, 'sakir@gmail.com', 'Sakir', 'PATIENT INSERTED', '2024-02-04 15:18:09'),
(11, 14, 'lily@gmail.com', 'Lily', 'PATIENT UPDATED', '2024-02-04 15:18:29'),
(12, 14, 'manik@gmail.com', 'Manik', 'PATIENT DELETED', '2024-02-06 15:41:48'),
(13, 15, 'gopal@gmail.com', 'Gopal', 'PATIENT INSERTED', '2024-02-07 15:43:02'),
(14, 15, 'nanika@gmail.com', 'Nanika', 'PATIENT UPDATED', '2024-02-07 15:43:11'),
(15, 16, 'gon@gmail.com', 'Gon', 'PATIENT INSERTED', '2024-02-09 15:43:37'),
(16, 16, 'jack@gmail.com', 'Jack', 'PATIENT UPDATED', '2024-02-14 15:43:49'),
(17, 17, 'katie@gmail.com', 'Katie', 'PATIENT INSERTED', '2024-02-14 15:44:41'),
(18, 17, 'patient@gmail.com', 'Patient', 'PATIENT UPDATED', '2024-02-15 15:44:52'),
(19, 17, 'anish@gmail.com', 'Anish', 'PATIENT UPDATED', '2024-02-23 15:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(1, 'Anish', 'Patient', 'anish@gmail.com', 'anish'),
(2, 'Anshuman', 'Patient', 'anshuman@gmail.com', 'anshuman'),
(3, 'Khushi', 'Patient', 'khushi@gmail.com', 'khushi'),
(4, 'Daniel Kim', 'Doctor', 'danielkim@gmail.com', 'danielkim');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

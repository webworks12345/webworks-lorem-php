-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 07:08 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webworks_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `email`, `username`, `password`, `usertype`, `status`, `created`, `updated`) VALUES
(1, 'bvrlisah@gmail.com', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'admin', 1, '2023-10-26 21:01:34', '2023-10-26 21:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branchCode` int(11) NOT NULL,
  `businessCode` int(11) NOT NULL,
  `branchName` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `coordinates` varchar(100) NOT NULL,
  `imageFile` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branchCode`, `businessCode`, `branchName`, `address`, `coordinates`, `imageFile`) VALUES
(6, 5, 'Mina Branch', 'Mina Iloilo Province', '', 0x363534643337316362353836325f66316638376566623162616538656630376162383437396465626664363837642e706e67),
(9, 12, 'Mandurriao Branch', '20, Hibao-an Iloilo', '10.71726102925748', ''),
(10, 11, 'Jereos Branch', 'Jereos Lapaz', '4234234234.234324234', ''),
(11, 5, 'Janiuay Branch', 'Janiuay Iloilo', '4234234234.234324234', '');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `businessCode` int(11) NOT NULL,
  `ownerID` int(11) NOT NULL,
  `busName` varchar(100) NOT NULL,
  `about` varchar(255) NOT NULL,
  `busType` varchar(100) NOT NULL,
  `house_building` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `city_municipality` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `permits` mediumblob NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`businessCode`, `ownerID`, `busName`, `about`, `busType`, `house_building`, `street`, `barangay`, `city_municipality`, `province`, `region`, `phone`, `mobile`, `permits`, `status`) VALUES
(5, 2, 'Puga Funeral', 'Funeral Services ', 'Funeral Services', '12', 'JEREOS', 'Jereos', 'ILOILO CITY (CAPITAL)', 'ILOILO', '6', '09452781051', '09452781051', 0x6173736574732f75706c6f6164732f62616a616a2e706e67, 1),
(6, 3, 'Jireh\'s Catering', '', 'Catering', '20', 'Lapuz', 'Alalasan', 'Iloilo City', 'Iloilo', 'IV', '3202918', '09203633104', 0x6173736574732f75706c6f6164732f4b4147415741442e706e67, 0),
(8, 3, 'Jireh\'s Photography', '', 'Photography', '20', 'ILOILO', 'Alalasan', 'iloilo', 'ILOILO', '6', '09452781051', '09374683434', 0x6173736574732f75706c6f6164732f5461736b2d312e646f6378, 0),
(11, 2, 'Alisah Photography', 'Premium Photography', 'Photography', '45', 'Bulong', 'Norte', 'Iloilo', 'Iloilo', '6', '09647384763', '09837465327', 0x6173736574732f75706c6f6164732f52756e6e6572205b31393230c397313038305d2e6a666966, 1),
(12, 4, 'Kevin Eatery', '', 'Catering', '20', 'Jereos Street', 'Hibao-an', 'Iloilo', 'Iloilo', '6', '+639203633104', '09675486784', 0x6173736574732f75706c6f6164732f5461736b2d312e646f6378, 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_owner`
--

CREATE TABLE `business_owner` (
  `ownerID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(30) NOT NULL,
  `ownerAddress` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_owner`
--

INSERT INTO `business_owner` (`ownerID`, `fname`, `lname`, `birthday`, `email`, `number`, `ownerAddress`, `username`, `password`, `usertype`, `status`, `created`, `updated`) VALUES
(2, 'Alisah Mae', 'Bolivar', '0001-01-07', 'bvrlisah@gmail.com', '09452781051', '28 Dayot Subdivision Jereos Street La Paz, Iloilo City', 'Owner', '827ccb0eea8a706c4c34a16891f84e7b', 'business owner', 1, '2023-10-26 09:03:03', '2023-10-26 09:03:03'),
(3, 'Jireh', 'Nieves', '2001-02-13', 'jireh@gmail.com', '09203633104', '', 'Owner2', '827ccb0eea8a706c4c34a16891f84e7b', 'business owner', 1, '2023-10-27 00:45:59', '2023-10-27 00:45:59'),
(4, 'Kevin', 'Santos', '2001-09-27', 'bvrlisah@gmail.com', '09452781051', 'Hibao-an Mandurriao Iloilo', 'Kevin', '827ccb0eea8a706c4c34a16891f84e7b', 'business owner', 1, '2023-11-12 08:32:46', '2023-11-12 08:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryCode` int(11) NOT NULL,
  `packCode` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryCode`, `packCode`, `categoryName`) VALUES
(1, 1, 'Coffin Style'),
(3, 1, 'Clothes'),
(5, 3, 'Coffin Style');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(30) NOT NULL,
  `ownerAddress` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientID`, `fname`, `lname`, `birthday`, `email`, `number`, `ownerAddress`, `username`, `password`, `usertype`, `status`, `created`, `updated`) VALUES
(1, 'Jireh', 'NIevs', '2001-12-01', 'lalalaamb@gmail.com', '09452781051', '', 'jireh', '827ccb0eea8a706c4c34a16891f84e7b', 'client', 0, '2023-10-25 08:51:53', '2023-10-25 08:51:53'),
(2, 'Jireh  Antonette', 'Nieves', '2001-12-02', 'jirehsevein@gmail.com', '09452781052', 'Lapuz', 'User', '827ccb0eea8a706c4c34a16891f84e7b', 'client', 1, '2023-10-25 08:59:20', '2023-10-25 08:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `email_verify`
--

CREATE TABLE `email_verify` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `verification_code` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packCode` int(11) NOT NULL,
  `packName` varchar(50) NOT NULL,
  `branchCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packCode`, `packName`, `branchCode`) VALUES
(1, 'Basic Package', 6),
(3, 'Normal Package', 6);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serviceCode` int(11) NOT NULL,
  `categoryCode` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `price` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceCode`, `categoryCode`, `serviceName`, `Description`, `quantity`, `color`, `price`) VALUES
(1, 1, 'De Barra', 'Metal ', 1, 'Blue and White', 150000),
(2, 3, 'Barong', 'Barong with Pants', 1, 'White', 2000),
(5, 5, 'De Barra', 'Wood', 1, 'Brown', 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branchCode`),
  ADD KEY `businessCode` (`businessCode`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`businessCode`),
  ADD KEY `ownerID` (`ownerID`);

--
-- Indexes for table `business_owner`
--
ALTER TABLE `business_owner`
  ADD PRIMARY KEY (`ownerID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryCode`),
  ADD KEY `packCode` (`packCode`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packCode`),
  ADD KEY `branchCode` (`branchCode`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branchCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `businessCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `business_owner`
--
ALTER TABLE `business_owner`
  MODIFY `ownerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `packCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `businessCode` FOREIGN KEY (`businessCode`) REFERENCES `business` (`businessCode`);

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `ownerID` FOREIGN KEY (`ownerID`) REFERENCES `business_owner` (`ownerID`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `packCode` FOREIGN KEY (`packCode`) REFERENCES `package` (`packCode`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `branchCode` FOREIGN KEY (`branchCode`) REFERENCES `branches` (`branchCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

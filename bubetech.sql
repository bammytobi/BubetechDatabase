-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 29, 2024 at 12:12 PM
-- Server version: 11.3.2-MariaDB
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bubetech`
--

-- --------------------------------------------------------

--
-- Table structure for table `farmcoordinate`
--

DROP TABLE IF EXISTS `farmcoordinate`;
CREATE TABLE IF NOT EXISTS `farmcoordinate` (
  `FarmCoordinateId` int(11) NOT NULL,
  `Topleft` varchar(100) DEFAULT NULL,
  `Topright` varchar(100) DEFAULT NULL,
  `Bottomleft` varchar(100) DEFAULT NULL,
  `BottomRight` varchar(100) DEFAULT NULL,
  `FarmId` int(11) DEFAULT NULL,
  PRIMARY KEY (`FarmCoordinateId`),
  KEY `FarmId` (`FarmId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farmdetails`
--

DROP TABLE IF EXISTS `farmdetails`;
CREATE TABLE IF NOT EXISTS `farmdetails` (
  `FarmId` int(11) NOT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `FarmSize` varchar(100) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `CropId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`FarmId`),
  KEY `UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livestock`
--

DROP TABLE IF EXISTS `livestock`;
CREATE TABLE IF NOT EXISTS `livestock` (
  `LivestockId` int(11) NOT NULL,
  `Name` varchar(500) DEFAULT NULL,
  `FarmSize` varchar(500) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`LivestockId`),
  KEY `UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `PermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `PermissionName` varchar(500) NOT NULL,
  `Description` varchar(500) NOT NULL,
  PRIMARY KEY (`PermissionId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(500) NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rolepermissionid`
--

DROP TABLE IF EXISTS `rolepermissionid`;
CREATE TABLE IF NOT EXISTS `rolepermissionid` (
  `RolePermissionID` int(11) NOT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `PermissionsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`RolePermissionID`),
  KEY `RoleId` (`RoleId`),
  KEY `PermissionsId` (`PermissionsId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `UserRoleId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserRoleId`),
  KEY `UserId` (`UserId`),
  KEY `RoleId` (`RoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(500) NOT NULL,
  `LastName` varchar(500) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `PasswordHash` varchar(500) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `PhoneNumber` varchar(100) NOT NULL,
  `ProfilePicture` longblob NOT NULL,
  `CreatedDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

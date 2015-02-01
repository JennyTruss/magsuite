-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: 10.10.11.17
-- Generation Time: Feb 01, 2015 at 04:04 PM
-- Server version: 5.6.22
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `magsuite`
--

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typ_id`, `typ_name`, `typ_desc`, `typ_group`) VALUES
(1, 'Badge Type', NULL, 0),
(2, 'Attendee', NULL, 1),
(3, 'Staff', NULL, 1),
(4, 'Guest', NULL, 1),
(5, 'Supporter', NULL, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: 10.10.11.17
-- Generation Time: Feb 01, 2015 at 04:00 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
CREATE TABLE IF NOT EXISTS `attendees` (
  `atn_id` int(11) NOT NULL,
  `atn_name` varchar(255) NOT NULL,
  `atn_badgenum` int(11) NOT NULL,
  `atn_dh` tinyint(1) NOT NULL DEFAULT '0',
  `typ_id` int(11) NOT NULL DEFAULT '0',
  `atn_eligible` tinyint(1) NOT NULL DEFAULT '0',
  `ss_volunteer` tinyint(1) NOT NULL DEFAULT '0',
  `atn_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atn_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `get_delivery` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2998 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
CREATE TABLE IF NOT EXISTS `badges` (
  `bdg_id` int(11) NOT NULL,
  `bdg_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atn_id` int(11) NOT NULL,
  `mel_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1634 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `del_id` int(11) NOT NULL,
  `atn_id` int(11) NOT NULL,
  `dpt_id` int(11) NOT NULL,
  `mel_id` int(11) NOT NULL,
  `del_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_food` varchar(1000) NOT NULL,
  `del_comment` varchar(1000) DEFAULT NULL,
  `del_enteredBy` int(11) NOT NULL,
  `out_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `delivered` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dpt_id` int(11) NOT NULL,
  `dpt_name` varchar(100) NOT NULL,
  `dpt_desc` varchar(255) DEFAULT NULL,
  `dpt_heads` varchar(100) DEFAULT NULL,
  `dpt_location` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
CREATE TABLE IF NOT EXISTS `meals` (
  `mel_id` int(11) NOT NULL,
  `mel_name` varchar(100) NOT NULL,
  `mel_start` datetime NOT NULL,
  `mel_end` datetime NOT NULL,
  `mel_seconds` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
CREATE TABLE IF NOT EXISTS `numbers` (
  `num_id` int(11) NOT NULL,
  `num_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staff` int(11) NOT NULL DEFAULT '0',
  `guests` int(11) NOT NULL DEFAULT '0',
  `elg_volunteers` int(11) NOT NULL DEFAULT '0',
  `inelg_volunteers` int(11) NOT NULL DEFAULT '0',
  `no_dairy` int(11) NOT NULL DEFAULT '0',
  `no_gluten` int(11) NOT NULL DEFAULT '0',
  `no_pork` int(11) NOT NULL DEFAULT '0',
  `vegan` int(11) NOT NULL DEFAULT '0',
  `vegetarian` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restrictions`
--

DROP TABLE IF EXISTS `restrictions`;
CREATE TABLE IF NOT EXISTS `restrictions` (
  `rst_id` int(11) NOT NULL,
  `atn_id` int(11) NOT NULL,
  `vegetarian` tinyint(1) NOT NULL DEFAULT '0',
  `vegan` tinyint(1) NOT NULL DEFAULT '0',
  `pork` tinyint(1) NOT NULL DEFAULT '1',
  `gluten` tinyint(1) NOT NULL DEFAULT '1',
  `dairy` tinyint(1) NOT NULL DEFAULT '1',
  `rst_notes` varchar(500) DEFAULT NULL,
  `rst_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rst_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cheese` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2997 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `snacks`
--

DROP TABLE IF EXISTS `snacks`;
CREATE TABLE IF NOT EXISTS `snacks` (
  `snk_id` int(11) NOT NULL,
  `snk_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atn_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `typ_id` int(11) NOT NULL,
  `typ_name` varchar(50) NOT NULL,
  `typ_desc` varchar(255) DEFAULT NULL,
  `typ_group` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`atn_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`bdg_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`del_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dpt_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`mel_id`);

--
-- Indexes for table `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`num_id`);

--
-- Indexes for table `restrictions`
--
ALTER TABLE `restrictions`
  ADD PRIMARY KEY (`rst_id`);

--
-- Indexes for table `snacks`
--
ALTER TABLE `snacks`
  ADD PRIMARY KEY (`snk_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typ_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendees`
--
ALTER TABLE `attendees`
  MODIFY `atn_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2998;
--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `bdg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1634;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `del_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dpt_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `mel_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `numbers`
--
ALTER TABLE `numbers`
  MODIFY `num_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `restrictions`
--
ALTER TABLE `restrictions`
  MODIFY `rst_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2997;
--
-- AUTO_INCREMENT for table `snacks`
--
ALTER TABLE `snacks`
  MODIFY `snk_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `typ_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

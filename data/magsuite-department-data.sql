-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: 10.10.11.17
-- Generation Time: Feb 01, 2015 at 04:05 PM
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
-- Dumping data for table `department`
--

INSERT INTO `department` (`dpt_id`, `dpt_name`, `dpt_desc`, `dpt_heads`, `dpt_location`) VALUES
(2, 'Arcade', NULL, NULL, 'Expo C'),
(3, 'LAN Lounge', NULL, NULL, 'Ballroom Level - Magnolia 3'),
(4, 'Artemis', NULL, NULL, 'Expo B - Behind registration'),
(5, 'Challenges', NULL, NULL, 'Expo E - Back before NGA'),
(6, 'Charity', NULL, NULL, 'Expo B in the back (Table Flipping)'),
(7, 'Chipspace', NULL, NULL, 'Conference Center - Potomac Hallway (past Potomac ballroom)'),
(8, 'Concert', NULL, NULL, 'Conference Center - Potomac Ballroom Green Room'),
(9, 'Concert Security', NULL, NULL, 'Conference Center - Potomac Ballroom Green Room'),
(10, 'Consoles', NULL, NULL, 'Expo E - Front half of large square of tables'),
(11, 'Public Safety', NULL, NULL, 'Conference Center - Chesapeake ABC'),
(12, 'Fest Ops', NULL, NULL, 'Conference Center - Chesapeake DEF'),
(13, 'Dispatch', NULL, NULL, 'Conference Center - Chesapeake DEF'),
(14, 'Dorsai', NULL, NULL, 'Conference Center - Chesapeake ABC'),
(15, 'Events', NULL, NULL, ''),
(17, 'Games on Film', NULL, NULL, 'Conference Center - Maryland D'),
(18, 'Indie Games', NULL, NULL, 'Expo E - Front'),
(19, 'Jamspace', NULL, NULL, 'Ballroom Level - Annapolis 1-4'),
(20, 'LAN', NULL, NULL, 'Ballroom Level - Cherry Blossom'),
(21, 'LARP', NULL, NULL, 'Ballroom Level - Magnolia 1'),
(24, 'Marketplace', NULL, NULL, 'Expo D'),
(25, 'Merchandise', NULL, NULL, 'Expo Level - Window in front of Expo C'),
(26, 'MEDIATRON!', NULL, NULL, 'Mezzanine Conference'),
(27, 'Nexus Gaming Alliance', NULL, NULL, 'Expo E - Back half of large square of tables'),
(28, 'Regdesk', NULL, NULL, 'Expo B - Registration Manager Desk'),
(29, 'Reg Managers', NULL, NULL, ' Expo B - Registration Manager Desk'),
(30, 'Rescuers', NULL, NULL, ''),
(31, 'Security', NULL, NULL, 'Conference Center - Chesapeake ABC'),
(32, 'Shedspace', NULL, NULL, 'Ballroom Level - Camelia 1'),
(33, 'Staff Support', NULL, NULL, 'Conference Center - Chesapeake DEF'),
(34, 'Starship Horizons', NULL, NULL, 'Ballroom Level - Baltimore 1-2'),
(35, 'Staffing Ops', NULL, NULL, 'Conference Center - Chesapeake DEF'),
(36, 'Tabletop', NULL, NULL, 'National Harbor (very top) - NH 9'),
(37, 'Treasury', NULL, NULL, 'Expo B - Registration Manager Area'),
(38, 'Tabletop (CCG)', NULL, NULL, 'National Harbor (very top) - NH 12'),
(39, 'Tabletop (Pathfinder)', NULL, NULL, ''),
(40, 'Tech Ops', NULL, NULL, 'Conference Center - Chesapeake DEF'),
(41, 'Tea Room', NULL, NULL, 'Conference Center - Chesapeak GH');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

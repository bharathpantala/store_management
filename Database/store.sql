-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2019 at 06:20 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` text NOT NULL,
  `password` text NOT NULL,
  `clg` text NOT NULL,
  `otp` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `password`, `clg`, `otp`, `email`) VALUES
('Admin', '123', 'Admin', '123', ''),
('Computer Science', '123', 'MITWPU', '12345', 'siddhihagawane22@gmail.com'),
('Mechanical Engineering', '123', 'MIT', '123', ''),
('Information Technology', 'siddhant', 'MITCOE', '', 'siddhantpadma100@gmail.com'),
('Mechanical Engineering', 'qwerty', 'MIT', '', 'siddhihagawane22@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `s_items`
--

CREATE TABLE `s_items` (
  `id` int(11) NOT NULL,
  `items` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_items`
--

INSERT INTO `s_items` (`id`, `items`, `stock`) VALUES
(1, 'Laminated Files', 2),
(2, 'File Index', 2),
(3, 'Both side ruled papers', 2),
(4, 'One side ruled papers', 2),
(5, 'Graph Papers (A4-size)', 2),
(6, 'Full Imperial Graph paper', 2),
(8, 'Full imperial drawing sheets', 2),
(9, 'Half imperial drawing sheets', 2),
(10, 'Quarter imperial drawing sheets', 2),
(11, 'A-4 size Tracing paper', 2),
(12, 'Full Imperial Size Tracing paper', 2),
(13, 'Drawing Index', 2),
(14, 'Continuous stationery for computer printout', 2),
(15, 'A-4 size copy power for computer printout', 2),
(16, 'Experiment Title Sheet', 2),
(17, 'Measurement sheets', 2),
(18, 'Abstract sheets', 2),
(19, 'Rate analysis sheets', 2),
(20, 'Metallury paper', 2),
(21, 'Semi log paper', 2),
(22, 'Log-Log paper', 2),
(23, 'Field book for F.E.', 2),
(24, 'Field book for S.E.', 2),
(25, 'Smith chart', 2),
(26, 'Box file', 2),
(27, 'Eraser', 2),
(28, 'Pen', 2),
(29, 'Pencil', 2),
(32, 'Compass', 2);

-- --------------------------------------------------------

--
-- Table structure for table `s_order`
--

CREATE TABLE `s_order` (
  `o_id` text NOT NULL,
  `dep` text NOT NULL,
  `a_year` text NOT NULL,
  `year` text NOT NULL,
  `clg` text NOT NULL,
  `no_of_stud` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_order`
--

INSERT INTO `s_order` (`o_id`, `dep`, `a_year`, `year`, `clg`, `no_of_stud`) VALUES
('4368338b-fa76-48e9-88f4-eccd0d74b8b9', 'Information Technology', 'SE', '2019', 'MITCOE', '10'),
('6e43dfe5-3604-4121-8dff-9ebe927ce0ec', 'Computer Science', 'SE', '2019', 'MITWPU', '100'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', 'Computer Science', 'TE', '2019', 'MITWPU', '200');

-- --------------------------------------------------------

--
-- Table structure for table `s_qty`
--

CREATE TABLE `s_qty` (
  `o_id` text NOT NULL,
  `item_id` text NOT NULL,
  `qty` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_qty`
--

INSERT INTO `s_qty` (`o_id`, `item_id`, `qty`) VALUES
('4368338b-fa76-48e9-88f4-eccd0d74b8b9', '1', '10'),
('6e43dfe5-3604-4121-8dff-9ebe927ce0ec', '1', '10'),
('6e43dfe5-3604-4121-8dff-9ebe927ce0ec', '2', '4'),
('6e43dfe5-3604-4121-8dff-9ebe927ce0ec', '5', '10'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '1', '14'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '2', '1'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '3', '4'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '4', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '5', '9'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '6', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '7', '1'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '8', '8'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '9', '1'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '10', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '11', '1'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '12', '5'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '13', '2'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '14', '1'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '15', '8'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '16', '5'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '17', '6'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '18', '4'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '19', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '20', '12'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '21', '2'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '22', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '23', '5'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '24', '3'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '25', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '26', '5'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '27', '7'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '28', '5'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '29', '4'),
('0a71cb1d-9f34-4236-8f4c-7cd229cbf250', '32', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `s_items`
--
ALTER TABLE `s_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `s_items`
--
ALTER TABLE `s_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

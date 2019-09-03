-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2019 at 06:54 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apcviosystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'test', 'test@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Male'),
(2, 'testdo', 'testdo@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Discipline Office'),
(3, 'testgo', 'testgo@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Guidance Office'),
(4, 'testpd', 'testpd@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Program Director'),
(5, 'testguard', 'testguard@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Guard'),
(6, 'teststudent', 'teststudent@test.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `user_do`
--

CREATE TABLE `user_do` (
  `id` int(11) NOT NULL,
  `do_scl_id` varchar(10) NOT NULL,
  `do_role` varchar(25) NOT NULL,
  `do_fullname` varchar(200) NOT NULL,
  `do_email` varchar(200) NOT NULL,
  `do_username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_guard`
--

CREATE TABLE `user_guard` (
  `id` int(11) NOT NULL,
  `guard_scl_id` varchar(10) NOT NULL,
  `role` varchar(25) NOT NULL,
  `guard_fullname` varchar(200) NOT NULL,
  `guard_email` varchar(200) NOT NULL,
  `guard_username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_pd`
--

CREATE TABLE `user_pd` (
  `id` int(11) NOT NULL,
  `pd_scl_id` varchar(10) NOT NULL,
  `role` varchar(25) NOT NULL,
  `pd_fullname` varchar(200) NOT NULL,
  `pd_email` varchar(200) NOT NULL,
  `pd_username` varchar(200) NOT NULL,
  `pd_course_scl` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_student`
--

CREATE TABLE `user_student` (
  `id` int(11) NOT NULL,
  `stud_scl_id` varchar(11) NOT NULL,
  `role` varchar(25) NOT NULL,
  `stud_fullname` varchar(200) NOT NULL,
  `stud_email` varchar(200) NOT NULL,
  `stud_username` varchar(200) NOT NULL,
  `stud_course_scl` varchar(200) NOT NULL,
  `stud_major` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `violation`
--

CREATE TABLE `violation` (
  `id` int(11) NOT NULL,
  `vio_created_at` timestamp NULL DEFAULT NULL,
  `vio_type` varchar(200) NOT NULL,
  `vio_stud_scl_id` varchar(11) NOT NULL,
  `vio_stud_fullname` varchar(200) NOT NULL,
  `vio_stud_email` varchar(200) NOT NULL,
  `vio_stud_username` varchar(200) NOT NULL,
  `vio_issuer_scl_id` varchar(10) NOT NULL,
  `vio_issuer_fullname` varchar(200) NOT NULL,
  `vio_issuer_email` varchar(200) NOT NULL,
  `vio_issuer_username` varchar(200) NOT NULL,
  `vio_desc` longtext DEFAULT NULL,
  `vio_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_do`
--
ALTER TABLE `user_do`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_guard`
--
ALTER TABLE `user_guard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_pd`
--
ALTER TABLE `user_pd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_student`
--
ALTER TABLE `user_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violation`
--
ALTER TABLE `violation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

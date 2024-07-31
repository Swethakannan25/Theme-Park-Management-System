-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 08:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `themepark`
--

-- --------------------------------------------------------

--
-- Table structure for table `cookies`
--

CREATE TABLE `cookies` (
  `cookie` varchar(120) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_list`
--

CREATE TABLE `ride_list` (
  `ride_id` int(11) NOT NULL,
  `ride_name` varchar(40) NOT NULL,
  `ride_description` varchar(120) NOT NULL,
  `adult_price` int(11) NOT NULL,
  `child_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ride_list`
--

INSERT INTO `ride_list` (`ride_id`, `ride_name`, `ride_description`, `adult_price`, `child_price`) VALUES
(2, 'Carousel', 'Merry-Go-Round', 400, 200),
(9, 'Haunted Mansion', 'Dark Rides', 200, 120),
(10, 'Gravitron', 'Flat Ride', 200, 120),
(12, 'Frisbee', 'Pendulum ride', 200, 120),
(25, 'Test', 'Child ride', 400, 200);

-- --------------------------------------------------------

--
-- Table structure for table `tickets_list`
--

CREATE TABLE `tickets_list` (
  `ticket_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `no_adult` int(11) NOT NULL DEFAULT 0,
  `ride_id` int(11) NOT NULL,
  `date_issued` datetime NOT NULL DEFAULT current_timestamp(),
  `no_child` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets_list`
--

INSERT INTO `tickets_list` (`ticket_id`, `customer_name`, `no_adult`, `ride_id`, `date_issued`, `no_child`) VALUES
(21, 'Ramesh', 2, 9, '2022-03-23 02:41:45', 1),
(22, 'Dhruv', 2, 9, '2022-04-16 17:09:16', 1),
(23, 'Ramesh', 3, 10, '2022-04-16 17:13:02', 2),
(24, 'Hemang', 3, 9, '2022-04-16 17:13:16', 2),
(26, 'john', 2, 2, '2023-04-04 16:17:01', 1),
(27, 'Michael', 3, 25, '2023-04-05 10:17:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(120) NOT NULL,
  `type` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `date_created`) VALUES
(1, 'Dhruv', NULL, 'admin@gmail.com', 'admin123', 1, '2022-02-22 06:59:18'),
(5, 'Jay', NULL, 'staff@gmail.com', 'staff123', 2, '2022-02-22 07:00:35'),
(11, 'faiz', '0', 'faiz@gmail.com', '$2y$10$YZF9yDO4K6lUqpPVb6zBZOTAGtaPrf00wnSUZ3jSYkYQS1O2BvQii', 2, '2022-02-26 06:34:25'),
(12, 'naim', 'ghoda', 'naim@gmail.com', '$2y$10$yYuQLrgmSL/bptLbFJYshOBJ4KM7OpjM62C0Qi3fDvshuWwNrDrKa', 2, '2022-02-27 06:28:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ride_list`
--
ALTER TABLE `ride_list`
  ADD PRIMARY KEY (`ride_id`);

--
-- Indexes for table `tickets_list`
--
ALTER TABLE `tickets_list`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `foreign_key_ride_id` (`ride_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ride_list`
--
ALTER TABLE `ride_list`
  MODIFY `ride_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tickets_list`
--
ALTER TABLE `tickets_list`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets_list`
--
ALTER TABLE `tickets_list`
  ADD CONSTRAINT `foreign_key_ride_id` FOREIGN KEY (`ride_id`) REFERENCES `ride_list` (`ride_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

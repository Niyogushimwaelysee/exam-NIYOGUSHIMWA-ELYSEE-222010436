-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 12:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantbasedmealdeliveryservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`) VALUES
(1, 'John ', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '345-678-9012'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '456-789-0123'),
(5, 'Sarah', 'Davis', 'sarah.davis@example.com', '567-890-1234'),
(6, 'elysee', 'NIYOGUSHIMWA', 'niyo@gmail.com', '0788903506');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `MealID` int(11) NOT NULL,
  `MealName` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`MealID`, `MealName`, `Description`, `Price`, `Category`) VALUES
(1, 'Vegan Burger', 'A delicious vegan burger made with black beans, quinoa, and veggies.', 9.99, 'Lunch'),
(2, 'Quinoa Salad', 'A healthy quinoa salad with fresh vegetables and a lemon vinaigrette.', 7.99, 'Salad'),
(3, 'Tofu Stir-Fry', 'Stir-fried tofu with mixed vegetables and a savory sauce.', 8.99, 'Dinner'),
(4, 'Avocado Toast', 'Toasted bread topped with mashed avocado, cherry tomatoes, and arugula.', 6.99, 'Breakfast'),
(5, 'Chickpea Wrap', 'A flavorful wrap filled with spiced chickpeas, lettuce, and tahini sauce.', 8.49, 'Lunch');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `activation_code` varchar(50) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `firstname`, `lastname`, `username`, `email`, `telephone`, `password`, `creationdate`, `activation_code`, `is_activated`) VALUES
(0, 'Didas ', 'BIRIMIMANA', 'Didas03', 'birimimanad@gmail.com', '0788903506', '$2y$10$D.3RBLu.UmNOFtKK0zpGT.t58e5oINxLdgwYtPitVWKwmSS2vtFPW', '2024-05-21 11:43:41', '8888', 0),
(0, 'Niyogushimwa ', 'elysee', 'elysee', 'niyo@gmail.com', '0788903506', '$2y$10$Wfxd1Da4.zJ1414wwoSB2e3A.8nuLxYNyr.SKAemDXIHhhhFGxIvC', '2024-05-22 20:29:28', '4', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`MealID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `MealID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

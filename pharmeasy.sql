-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2019 at 07:28 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmeasy`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(1, 1, 'Admin', 'Hostel 8,MNIT', '30201', 'Jaipur', 'INDIA', '0123456789'),
(7, 5, 'tester', 'Hostel 9,MNIT', '12121', 'jaipur', 'Canada', '091343867');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'Tablet', 'Capsule/Pills', 'tablet', '1.png'),
(2, 'Syrup', 'liquid', 'syrup', '1.png'),
(3, 'Spray', 'spray', 'spray', '1.png'),
(4, 'Ointment', 'Ointment', 'Ointment', '1.png');

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`OrderID`, `ProductID`, `Quantity`, `Total`) VALUES
(46, 28, 1, '90.00'),
(47, 29, 1, '13.00'),
(47, 33, 1, '30.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddressID`, `SubTotal`, `Discount`, `ShippingFee`, `Total`, `OrderDate`, `Status`) VALUES
(46, 1, 1, '90.00', '0.00', '0.00', '90.00', '2019-11-16 23:37:40', 'Order Received'),
(47, 5, 7, '43.00', '0.00', '0.00', '43.00', '2019-11-16 23:52:39', 'Order Received');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` varchar(15) DEFAULT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`, `Feature`) VALUES
(24, 'Aspirine', 1, '20.00', 10, 'Fever-Pain', '2019-06', '1.png', 'Fever-Pain', 'Aspirine'),
(25, 'Disprin', 1, '25.00', 15, 'Pain-Headache-Fever', '2019-06', '1.png', 'Pain-Headache-Fever', 'Disprin'),
(26, 'Paracetamol', 1, '10.00', 20, 'Pain-Headache-Cold-Fever', '2019-06', '1.png', 'Pain-Headache-Cold-Fever', 'Paracetamol'),
(27, 'Paracetamol Syrup', 2, '40.00', 5, 'Pain-Headache-Cold-Fever', '2019-06', '1.png', 'Pain-Headache-Cold-Fever', 'Paracetamol-Syrup'),
(28, 'Moov', 4, '90.00', 6, 'Pain-Backpain-Jointpain-Sprains', '2019-06', '1.png', 'Pain-Backpain-Jointpain-Sprains', 'Moov'),
(29, 'Moov Spray', 3, '13.00', 5, 'Pain-Backpain-Jointpain-Sprains', '2019-06', '1.png', 'Pain-Backpain-Jointpain-Sprains', 'Moov-Spray'),
(30, 'Saridon', 1, '95.00', 15, 'Pain-Headache-Cold-Fever', '2019-06', '1.png', 'Pain-Headache-Cold-Fever', 'Saridon'),
(31, 'Combiflam', 1, '20.00', 25, 'Pain-Fever', '2019-06', '1.png', 'Pain-Fever', 'Combiflam'),
(32, 'Glucose', 2, '80.00', 10, 'Diabetic-Unconsious', '2019-06', '1.png', 'Diabetic-Unconsious', 'Glucose'),
(33, 'Ranitidine', 1, '30.00', 3, 'Ulcer', '2019-06', '1.png', 'Ulcer', 'Ranitidine');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Admin', 'Hostel 8,MNIT', '30201', 'Jaipur', 'INDIA', '0123456789', 'admin@pharmeasy.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1),
(5, 'tester', 'Hostel 9,MNIT', '12121', 'jaipur', 'Canada', '091343867', 'tester@pharmeasy.com', 'tester', '$2a$10$/fZPTeQ/j2ljnweeHv4yj.ORumSRk7lBq1wcwhCwq5zkBNAOGwI7u', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

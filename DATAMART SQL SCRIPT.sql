-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307:3307
-- Generation Time: Dec 20, 2020 at 10:14 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `OrderStatusID` int(11) NOT NULL,
  `OrderStatus` char(50) NOT NULL,
  `DateOrdered` date NOT NULL,
  `DateReceived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`OrderStatusID`, `OrderStatus`, `DateOrdered`, `DateReceived`) VALUES
(1, 'Delivered', '2020-12-12', '2020-12-15'),
(2, 'Delivered', '2020-12-12', '0202-12-18'),
(3, 'Delivered', '2020-06-23', '2020-06-27'),
(4, 'Delivered', '2020-05-03', '2020-05-07'),
(5, 'Delivered', '2020-03-06', '2020-03-20'),
(6, 'Delivered', '2020-08-20', '2020-08-25');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(30) NOT NULL,
  `ProductType` varchar(30) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `ProductType`, `Quantity`, `Price`) VALUES
(1, 'shovel', 'tool', 1, 20),
(2, 'Compost', 'Ag', 5, 20),
(3, 'Tractor', 'Vehicle', 2, 400),
(4, 'pesticide', 'chemical', 3, 30),
(5, 'terries compost', 'compost', 4, 24),
(6, 'sand', 'ag', 5, 200);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorders`
--

CREATE TABLE `purchaseorders` (
  `PurchaseOrdersID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `OrderStatusID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Name` char(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchaseorders`
--

INSERT INTO `purchaseorders` (`PurchaseOrdersID`, `ProductID`, `SupplierID`, `OrderStatusID`, `Price`, `Name`) VALUES
(1, 1, 1, 1, 20, 'sand shovel'),
(2, 2, 2, 2, 20, 'grass compost'),
(3, 3, 3, 3, 400, 'tractor'),
(4, 4, 4, 4, 30, 'rat posining'),
(5, 5, 5, 5, 24, 'compost'),
(6, 6, 6, 6, 200, 'sand');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` char(25) NOT NULL,
  `SupplierEmail` char(25) NOT NULL,
  `SupplierType` char(12) DEFAULT NULL,
  `SupplierAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `SupplierEmail`, `SupplierType`, `SupplierAddress`) VALUES
(1, 'Johnn Deere', 'johnd@gmail.com', 'agricultural', 'dublin 21'),
(2, 'Johns Compost', 'jc@hotmail.com', 'compost', 'dublin 14'),
(3, 'mullholland', 'mh@gmail.com', 'ag vehicles', 'Kildare 14'),
(4, 'pesticideRus', 'pestrus@gmail.com', 'animal poisi', 'offaly industrial estate'),
(5, 'johns compost', 'jc@gmail.com', 'growth', 'Donegal 6'),
(6, 'Darcys sand', 'darcysand@gmail.com', 'sand', 'kildare 8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`OrderStatusID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `purchaseorders`
--
ALTER TABLE `purchaseorders`
  ADD PRIMARY KEY (`PurchaseOrdersID`,`ProductID`,`SupplierID`,`OrderStatusID`),
  ADD KEY `PO_PRODUCT_FK` (`ProductID`),
  ADD KEY `PO_SUPPLIER_FK` (`SupplierID`),
  ADD KEY `PO_ORDERSTATUS_FK` (`OrderStatusID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `SupplierAddress` (`SupplierAddress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `OrderStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD CONSTRAINT `orderstatus_ibfk_1` FOREIGN KEY (`OrderStatusID`) REFERENCES `purchaseorders` (`OrderStatusID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `purchaseorders` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `purchaseorders` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

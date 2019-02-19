-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2019 at 02:40 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtemp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(10) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `userId`) VALUES
(9, 10),
(26, 10),
(25, 13),
(1, 28),
(2, 29),
(3, 30),
(4, 31),
(5, 32),
(6, 34),
(7, 37),
(8, 38),
(10, 41),
(11, 42),
(12, 43),
(13, 44),
(14, 45),
(15, 46),
(16, 47),
(17, 48),
(18, 49),
(19, 50),
(20, 52),
(21, 53),
(22, 54),
(23, 55),
(24, 59),
(27, 63);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custId` int(11) DEFAULT NULL,
  `custName` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custId`, `custName`, `address`, `email`, `contact`) VALUES
(2, 'Pankaj', 'Jalgoan', 'shelarm613@gmail.com', 9876987611),
(3, 'Shraddha', 'MP', 'shelarm613@gmail.com', 9876987611),
(4, 'Suraj', 'Aurangabaad', 'mubin0202@gmail.com', 9145605582),
(5, 'Shubhankar', 'Nagar', 'mubin0202@gmail.com', 9876987611),
(6, 'Vijay', 'Pune', 'mubin0202@gmail.com', 1234567890),
(7, 'Akhilesh', 'Sangali', 'abc@hmail.com', 9876987611),
(8, 'Swapnil', 'Jalgoan', 'patilswapnil@gmail.com', 9098765443),
(9, 'Rajshri', 'Shirdi', 'nkte@gmail.com', 9145605582),
(10, 'Sagar', 'Satara', 'ashish.rasane@gmai.com', 5355745),
(11, 'Abc', 'Aurangabaad', 'shelarm613@gmail.com', 9876987611),
(12, 'Abdul', 'jalgoan', 'mubin0202@gmail.com', 9876987611),
(13, 'Shubhankar', 'Aurangabaad', 'mubin0202@gmail.com', 9876987611),
(15, 'Mubin', 'Pune', 'mubin0202@gmail.com', 8876765455),
(16, 'Swarub', 'Jalgoan', 'patilswapnil@gmail.com', 9876987611),
(17, 'Farukh', 'Satara', 'shelarm613@gmail.com', 9145605582),
(18, 'Jabbar', 'Aurangabaad', 'jivannalavade0105@gmail.com', 8876765455),
(19, 'JackRyan', ' Mumbai', 'sandiplandge08@gmail.com', 9145605582),
(25, 'Rolians', 'Mumbai', 'mubin0202@gmail.com', 9098765443),
(26, 'Ambrose', 'Dehli', 'patilswapnil@gmail.com', 9098765443),
(27, 'Ravindra', 'Jalgoan', 'patilswapnil@gmail.com', 9876987611),
(28, 'Gajanan', 'Pune', 'jivannalavade0105@gmail.com', 9876987611),
(29, 'Shambhu', 'Satara', 'jivannalavade@gmail.com', 9145605582),
(30, 'Rajiv', 'Pune', 'rajesh@gmail.com', 9567891234),
(31, 'Chaitanya', 'Nashik', 'mubin0202@gmail.com', 8876765455),
(32, 'Abhijeet', 'Nagar', 'abc@hmail.com', 9098765443),
(33, 'Hrishi', 'Bhopal', 'dasnad@zdzd.com', 9098987654),
(34, 'Mohsin', 'Pune', 'mubin0202@gmail.com', 9090787866),
(35, 'Akshay', 'Pune', 'ashish.rasane@gmai.com', 8987765432),
(36, 'Rakesh', 'Aurangabaad', 'rajesh@gmail.com', 9098765443),
(37, 'Anmol', 'Satara', 'jivannalavade0105@gmail.com', 8938028929),
(38, 'Sourabh', 'Aurangabaad', 'sandiplandge08@gmail.com', 8938028929),
(41, 'Sayali', 'Nashik', 'mubin0202@gmail.com', 9145605582),
(42, 'Sanket', 'Pune', 'mubin0202@gmail.com', 9098765443),
(43, 'Mansi', 'Pune', 'mubin0202@gmail.com', 9145605582),
(44, 'Sushant', 'Pune', 'sayali.chavan@gmail.com', 9098765443),
(45, 'Ramesh', 'Jalgoan', 'shelarm613@gmail.com', 9876987611),
(46, 'Suresh', 'Satara', 'sandiplandge08@gmail.com', 8876765455),
(47, 'varsha', 'Pune', 'patilswapnil@gmail.com', 9145605582),
(48, 'Sumit', 'Sangali', 'patilswapnil@gmail.com', 8938028929),
(49, 'Natansh', 'Pune', 'neha89876@gmail.com', 8876765455),
(50, 'Gabbar', 'Mumbai', 'patilswapnil@gmail.com', 8876765455),
(52, 'Pritam', 'Pune', 'sandiplandge08@gmail.com', 9098765443),
(53, 'Prasad', 'Pune', 'mubin0202@gmail.com', 9098765443),
(54, 'Akansha', 'Kumathe', 'akansh@gmail.com', 9145605582),
(55, 'Raghav', 'Satara', 'sandiplandge08@gmail.com', 8876765455),
(56, 'Shankar', 'Aurangabaad', 'sandiplandge08@gmail.com', 9876987611),
(57, 'Rajaram', 'Solapur', 'palak0202@gmail.com', 8876765455),
(58, 'Mahadev', 'Mumbai', 'patilswapnil@gmail.com', 9876987611),
(59, 'Smruti', 'Pune', 'priyankasakate24@gmail.com', 9145605582),
(13, 'Shubhankar', 'Aurangabaad', 'shelarm613@gmail.com', 9876987611),
(10, 'Shubhankar', 'Aurangabaad', 'shelarm613@gmail.com', 9876987611),
(63, 'Pankaj', 'Aurangabaad', 'mubin0202@gmail.com', 9876987611);

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

CREATE TABLE `orderhistory` (
  `orderHistoryId` int(10) NOT NULL,
  `userId` int(10) DEFAULT NULL,
  `OrderPrice` int(10) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`orderHistoryId`, `userId`, `OrderPrice`, `OrderDate`) VALUES
(1, 38, 10260, '2019-02-11 00:00:00'),
(2, 38, 493, '2019-02-11 00:00:00'),
(3, 41, 2060, '2019-02-11 00:00:00'),
(4, 41, 90, '2019-05-11 13:05:15'),
(5, 42, 40260, '0000-00-00 00:00:00'),
(6, 53, 10000, '0000-00-00 00:00:00'),
(7, 54, 900, '2019-09-14 11:09:20'),
(8, 55, 40190, '0000-00-00 00:00:00'),
(9, 59, 10180, '2019-08-15 13:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `OrderDetailId` int(10) NOT NULL,
  `cartId` int(10) DEFAULT NULL,
  `productId` int(10) DEFAULT NULL,
  `reqQuantity` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`OrderDetailId`, `cartId`, `productId`, `reqQuantity`, `price`) VALUES
(10, 1, 8, 1, 900),
(16, 7, 5, 2, 43),
(17, 7, 6, 1, 10000),
(18, 7, 3, 2, 130),
(19, 7, 2, 1, 190),
(20, 7, 8, 1, 900),
(21, 7, 3, 1, 130),
(22, 7, 5, 1, 43),
(23, 2, 2, 4, 190),
(29, 11, 5, 1, 43),
(30, 18, 1, 2, 90),
(31, 18, 6, 1, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodId` int(10) NOT NULL,
  `prodName` varchar(50) DEFAULT NULL,
  `avail_Quantity` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `ProdCategory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodId`, `prodName`, `avail_Quantity`, `price`, `ProdCategory`) VALUES
(1, 'Fan', 20, 90, 'Electronics'),
(2, 'Book', 20, 190, 'Educational'),
(3, 'T-Shirt', 20, 130, 'Cloths'),
(5, 'Parker-Pen', 20, 43, 'Edu'),
(6, 'Refregerator', 20, 10000, 'Elecronics'),
(8, 'Cotton Jeans', 20, 900, 'Cloths'),
(9, 'Acer Aspire 5 laptop', 20, 40000, 'Electronic'),
(10, 'Dell Laptop Bag', 30, 1500, 'Educational');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(10) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `userType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `password`, `userType`) VALUES
(1, 'datta', 'abcd', NULL),
(2, 'pankaj', 'iklm', NULL),
(3, 'shraddha', 'shraddha', NULL),
(4, 'jamba', 'jamba', NULL),
(5, 'shubh', 'shubh', NULL),
(6, 'vijay', 'vijay', 'Customer'),
(7, 'akhi', 'akhi', 'Customer'),
(8, 'patil', 'patil', 'Customer'),
(9, 'raju', 'raju', 'Customer'),
(10, 'sagar', 'sagar', 'Customer'),
(11, 'abc', 'abc', 'Customer'),
(12, 'abdul', 'abdul123', 'Customer'),
(13, 'baban', 'baban123', 'Customer'),
(15, 'mubin', 'mubin1', 'Customer'),
(16, 'swarup', 'swarup', 'Customer'),
(17, 'farukh', 'farukh', 'Customer'),
(18, 'jabbar', 'jabbar', 'Customer'),
(19, 'jack', 'jack123', 'Customer'),
(20, 'shubham', 'c250f88274cb8a75961a', 'Customer'),
(21, 'ganesh', 'ba2e4e8b8ab27814a47b', 'Customer'),
(22, 'swayam', 'bda341ae08bb3ecdabe8', 'Customer'),
(23, 'roman1', '1d3d50c8624eab09bbf5', 'Customer'),
(25, 'seth123', '10761bc4d64896e9994b', 'Customer'),
(26, 'ambrose', '72d628afcba6276ef21c', 'Customer'),
(27, 'ravindra', 'dcc954558d860ac8fb4ae3d370d3525a624278ec', 'Customer'),
(28, 'gajanan', 'ba62e2a6050cdaa7815a6c61fb3456d5698b8051', 'Customer'),
(29, 'shambhu', 'c10ec943d6df87dea84c3fdbb54cfa0447ddcb70', 'Customer'),
(30, 'rajeev', '80d87824e5740a2423ce43a9f624b6039883e190', 'Customer'),
(31, 'chaitya', '3655302e654d7f1c8ec3c88a058934c6506dca2a', 'Customer'),
(32, 'abhijeet', '13e30ae3b35e0e6cbfddab33cd3027cb7c56c542', 'Customer'),
(33, 'hrishi', '0fa5fe3e71dd681edf94f02ada2720cf4afe3a84', 'Customer'),
(34, 'mohsin', '510671eabac5f6f3f367fa9b0146d6d8a0a1e1bf', 'Customer'),
(35, 'akshay', '4a9c198ddfc9a400d75029e4b6bc7ac7fdf23d20', 'Customer'),
(36, 'rakesh', '9eadc8fa224eebb865f005688a041b3ba050c57f', 'Customer'),
(37, 'amol123', '40cde0a663927aa440bc1132b03ed7a123aca571', 'Customer'),
(38, 'sourabh', '3adae7803aad471f4cfea63342577e9c44c32e36', 'Customer'),
(41, 'sayali', '55cc55174fbbbfdfd5e40fe8573e3238f4347026', 'Customer'),
(42, 'sanket', '9c664381e5b87b01ae3a9eb599830a8d504e3bb8', 'Customer'),
(43, 'manasi', '89cc476073cdc03fc26699f1dd9be12e8d339baf', 'Customer'),
(44, 'sushant', '$2a$10$055YPFg0XEcUSe4ucim7QuOKjjSvGzUTYdSba2fPZmT', 'Customer'),
(45, 'ramesh', '$2a$10$oGHT.bDI9KLeitLujyiZA.UreRVaAsEJNwNzaz4eqc1', 'Customer'),
(46, 'suresh', '$2a$10$ditUpe4Ip.RrCTcluOleA.dbvJo9JVPT4aVuzlFnaJs', 'Customer'),
(47, 'varsha', '$2a$10$aJMxqkxno3JTgZ6PPx0YWeYtmD8UNGXoVstYQackMDnJuZDkMnzum', 'Customer'),
(48, 'sumit', '$2a$10$902TsmAqTQ/duF32ajFAuu9eHJ8UP7Ulnhtg4z72M90i5wwmSSd8G', 'Customer'),
(49, 'natansh', '$2a$10$vbtTr48tC7MRhXPz21S1sOOMTD.ewZKV5qGaqyb30v8oLR/JVM8nS', 'Customer'),
(50, 'gabbar', '$2a$10$xvs7aes9AIgTlgqkbVbQYudzX27bft/QSvcBq31s8Qt2djXkaBvNu', 'Customer'),
(52, 'pritam', '$2a$10$vx79LM18pDpdQruGVSg1oebQlPsHxw/lpkXxyeBU.wSIUXOg6Kk/e', 'Customer'),
(53, 'prasad ', '$2a$10$ShfHMTKRGfAtl5uZL3jfgewq4S8IQixmQLZehTxIn0AAffh8R/bEm', 'Customer'),
(54, 'akansha', '$2a$10$9kUL9H3UJOiYXM8sCmwKPeTkteb/HFsyY8Dsm9rKRB23/3SWAwLlW', 'Customer'),
(55, 'raghav', '$2a$10$PZs3Xog5g3WvYaYJb5s/pObGsiMfsHqrHFchWEjflx8tllqWGby8C', 'Customer'),
(56, 'shankar', '$2a$10$mkhfIA/eJ8LXevUYdgfdW.TJgQ7faDvkdyuHqtZnRzDnHklqELSsu', 'Customer'),
(57, 'rajaram', '$2a$10$7ANipzeOj8C.xV63x8x3W.NH/VPFHJbbu17FhYYKpYofkwzJpVpiK', 'Customer'),
(58, 'mahadev', '$2a$10$RaQSD5sfAZ.c8Xxf0dDOzO5ZZ7hTq57rITNPiLOp.5u3iHVpy3NJS', 'Customer'),
(59, 'smruti', '$2a$10$HG0tnBwbpd/5KjeODvgtUOz42n1/pLBn9ptro0yb1W2fjoxD5h1lu', 'Customer'),
(63, 'dasdadd', '$2a$10$m.7l5kCjxsd.8Bq0OqfuZep9ILS0F4ukecg0gNwPRolL.40XJWH2K', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD KEY `custId` (`custId`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`orderHistoryId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`OrderDetailId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `orderHistoryId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `OrderDetailId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`prodId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

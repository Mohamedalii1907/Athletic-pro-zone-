-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2024 at 02:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `athletic_pro_zone`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `Ordering` int(11) DEFAULT NULL,
  `Visibility` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `parent`, `Ordering`, `Visibility`, `Allow_Comment`, `Allow_Ads`) VALUES
(8, 'Men Clothes', 'Clothes for Men', 0, 1, 0, 0, 0),
(9, 'Women Clothes', 'Clothes for women', 0, 2, 0, 0, 0),
(10, 'Teenagers', 'clothes for teenagers', 0, 3, 0, 0, 0),
(12, 'Watches', 'Hand watches', 0, 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `comment_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `status`, `comment_date`, `item_id`, `user_id`) VALUES
(1, 'Very Nice', 1, '2024-02-03', 15, 28),
(10, 'Cool', 1, '2024-02-03', 15, 30);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` varchar(255) NOT NULL,
  `Add_Date` date NOT NULL,
  `Country_Made` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Rating` smallint(6) NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT 0,
  `Cat_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Name`, `Description`, `Price`, `Add_Date`, `Country_Made`, `Image`, `Status`, `Rating`, `Approve`, `Cat_ID`, `Member_ID`, `tags`) VALUES
(14, 'jacket', 'jacket for training in winter', '150', '2024-02-04', 'USA', 'https://contents.mediadecathlon.com/p2607240/k$0c6fc1ce5995dd9d3901c48452ea496c/mens-hiking-fleece-jacket-mh120.jpg?format=auto&quality=40&f=800x800', '1', 0, 1, 8, 27, ''),
(15, 'T-shirt', 'T-shirt for training in gym', '108', '2024-02-04', 'USA', 'https://contents.mediadecathlon.com/p2290668/k$da98c1ed5e96524a4d4ca6b1f56989de/stretchy-cotton-tank-top-black.jpg?format=auto&quality=40&f=800x800', '1', 0, 1, 8, 24, ''),
(16, 'Short', 'Comfortable short for training', '300', '2024-02-05', 'USA', 'https://contents.mediadecathlon.com/p2197697/k$285353d159bba29c9894ad76ab856592/majority-cotton-fitness-shorts-essentials-khaki.jpg?format=auto&quality=40&f=800x800', '2', 0, 1, 8, 27, ''),
(17, 'jogging ', 'Men\'s comfortable slim-fit fitness ', '150', '2024-02-05', 'USA', 'https://contents.mediadecathlon.com/p2621124/k$8e3812587e8f5a8aab078905fbaf7f07/slim-fit-majority-cotton-jogging-bottoms-black.jpg?format=auto&quality=40&f=800x800', '1', 0, 1, 8, 24, ''),
(19, 'Women’s ski base', 'ski base layer top-bl 100 - black', '150', '2024-02-05', 'USA', 'https://contents.mediadecathlon.com/p1691884/k$e24dc312e1c6e9bd3170936918c99af1/women-s-ski-base-layer-top-bl-100-black.jpg?format=auto&quality=40&f=800x800', '2', 0, 1, 9, 30, ''),
(20, 'zip sweatshirt', 'Women\'s fitness-spacer off-white\r\n', '1500', '2024-02-05', 'USA', 'https://contents.mediadecathlon.com/p2071847/k$3101af546886b649dbb742652554c798/zippered-fitness-sweatshirt-with-zippered-pockets-off-white.jpg?format=auto&quality=40&f=800x800', '2', 0, 1, 9, 28, ''),
(22, 'fitness leggings', 'Straight cut fitness leggings', '600', '2024-02-05', 'Egypt', 'https://contents.mediadecathlon.com/p2429341/k$df96c7dc27dd1f28df54a79d104b4500/straight-cut-fitness-leggings.jpg?format=auto&quality=40&f=800x800', '1', 0, 1, 9, 28, ''),
(23, 'running stopwatch', 'women\'s running stopwatch - pink and coral\r\n', '190', '2024-02-05', 'Japan', 'https://contents.mediadecathlon.com/p1517504/k$a45124d5476891df0c7f58e6bf97eb3f/-w200-s-.jpg?format=auto&quality=40&f=800x800', '3', 0, 1, 12, 31, ''),
(24, 'men\'s running stopwatch', 'men\'s running stopwatch - black', '200', '2024-02-05', 'Korea', 'https://contents.mediadecathlon.com/p1327924/k$b8cda1d242727c7b9b5fc98f6ea7e7ce/w200-m-running-stopwatch-red-and-black.jpg?format=auto&quality=40&f=800x800', '3', 0, 0, 12, 31, ''),
(25, 'stopwatch ', 'running stopwatch - blue', '160', '2024-02-05', 'Egypt', 'https://contents.mediadecathlon.com/p2258499/k$deca82042d19129df3fb400efa6286a6/-atw100-.jpg?format=auto&quality=40&f=800x800', '3', 0, 1, 12, 24, ''),
(27, 'Watch ', 'Watch a400 - black', '1500', '2024-02-05', 'Saudi Arabia', 'https://contents.mediadecathlon.com/p1911599/k$b8d08a8b73bf4d6b0f930d3258d0a22b/watch-a400-black.jpg?format=auto&quality=40&f=800x800', '1', 0, 1, 12, 31, ''),
(31, 'unisex jersey sweatshirt', 'Kids\' warm crew neck brushed', '150', '2024-02-05', 'USA', 'https://contents.mediadecathlon.com/p1970251/k$77a4a286dfff5a3706a66d1b080d2244/kids-crew-neck-brushed-jersey-sweatshirt-navy-blue.jpg?format=auto&quality=40&f=800x800', '1', 0, 0, 10, 26, NULL),
(32, 'Kids\' at ts100', 'pink', '130', '2024-02-05', 'Egypt', 'https://contents.mediadecathlon.com/p2237599/k$fa7581dfddee20c49a6c18aa7cfe80c3/at-100-kid-s-athletics-t-shirt-white.jpg?format=auto&quality=40&f=800x800', '2', 0, 1, 10, 28, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'To Identify User',
  `Username` varchar(255) NOT NULL COMMENT 'Username To Login',
  `Password` varchar(255) NOT NULL COMMENT 'Password To Login',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0 COMMENT 'Identify User Group',
  `TrustStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'Seller Rank',
  `RegStatus` int(11) NOT NULL DEFAULT 0 COMMENT 'User Approval',
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `GroupID`, `TrustStatus`, `RegStatus`, `Date`) VALUES
(1, 'Mohamed', 'e1794a744abf405a0d1c8bee81a909de329ff7f4', 'Mohamed@gmail.com', 'Mohamed Ali', 1, 0, 1, '2024-01-24'),
(24, 'Omar', '6905d91503ed0daa4432ce078a530cf0f9219cb6', 'Omar@gmail.com', 'Omar Elgindi', 0, 0, 1, '2024-01-25'),
(25, 'Mahmoud', 'fdcca43175c6c3da4542836cb553cf4d2bd66b4a', 'Mahmoud@gmail.com', 'Mahmoud Soubih', 1, 0, 1, '2024-01-31'),
(26, 'Mariam', '8ef006e55e4237c7e9a8e5e083fbf49a32beffb5', 'mariam@gmail.com', 'Mariam Tamer', 0, 0, 1, '2024-01-31'),
(27, 'Youssef', '3d967e916fc7edb95ffa818d465861b5f594e54b', 'youssef@gmail.com', 'Youssef Gamal', 0, 0, 1, '2024-01-31'),
(28, 'Hanen', '52ec5b436889dbff14b4aecd1411e4490610df29', 'hanen@gmail.com', 'Hanen Nasser', 0, 0, 1, '2024-01-31'),
(30, 'Ahd', '682489278977d3f10d594a7299a40d63e75fe8de', 'ahd@gmail.com', 'Ahd Mahmoud', 0, 0, 0, '2024-01-31'),
(31, 'Azaro', '597f9693a78ecbf4a3908a790cc79779bef7d159', 'Azaro@gmail.com', 'Azaro mohamed', 0, 0, 0, '2024-02-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `items_comment` (`item_id`),
  ADD KEY `comment_user` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `member_1` (`Member_ID`),
  ADD KEY `cat_1` (`Cat_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'To Identify User', AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_comment` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_1` FOREIGN KEY (`Member_ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

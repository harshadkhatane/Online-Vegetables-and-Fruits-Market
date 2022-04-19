 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegetableshopjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userid` varchar(30) NOT NULL,
  `prodid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `catname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catname`) VALUES
(8, 'Green Vegetable'),
(9, 'Leafy Vegetables'),
(10, 'Marrow'),
(11, 'Root'),
(12, 'Edible plant stem'),
(13, 'Allium');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `msgDate` timestamp NULL DEFAULT current_timestamp(),
  `isRead` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `name`, `contact`, `emailid`, `subject`, `message`, `msgDate`, `isRead`) VALUES
(3, 'Anand', '7896541230', 'anand@gmail.com', 'I want to connect with u', 'I want to buy a vegetable', '2022-03-21 11:05:46', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `cust_address`
--

CREATE TABLE `cust_address` (
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` char(10) NOT NULL,
  `pin` char(8) NOT NULL,
  `locality` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `adtype` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cust_address`
--

INSERT INTO `cust_address` (`userid`, `name`, `mobile`, `pin`, `locality`, `state`, `city`, `address`, `adtype`) VALUES
('abhi@gmail.com', 'Abhishek', '7845122010', '462021', 'Bhopal', 'MP', 'Bhopal', 'Narela Sankari Bhopal', 'Home'),
('rohit@gmail.com', 'Rohit Raj', '7896541230', '462021', 'Indore', 'MP', 'Indore', 'Sector-C Vijay Nagar Indore', 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `feedbackDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `username`, `contact`, `email`, `address`, `description`, `feedbackDate`) VALUES
(5, 'Abhishek', '1234567890', 'abhi@gmail.com', 'Narela Sanakri Bhopal', 'Your Service are amazing', '2022-03-21 16:26:30'),
(6, 'Rohit ', '9876543210', 'rohit@gmail.com', 'Vijay Nagar Indore', 'Your service are very fast', '2022-03-21 16:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` varchar(30) NOT NULL,
  `order_status` varchar(200) NOT NULL DEFAULT 'Pending',
  `remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `orderdate`, `userid`, `order_status`, `remarks`) VALUES
(7, '2022-03-21 16:20:54', 'abhi@gmail.com', 'Confirmed', NULL),
(8, '2022-03-21 16:43:33', 'rohit@gmail.com', 'Pending', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderview`
-- (See below for the actual view)
--
CREATE TABLE `orderview` (
`order_id` int(11)
,`orderdate` datetime
,`pname` varchar(100)
,`disc_price` decimal(16,2)
,`qty` int(11)
,`amount` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `prodid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `prodid`, `qty`) VALUES
(1, 4, 3),
(1, 8, 2),
(1, 12, 2),
(2, 19, 2),
(2, 21, 1),
(3, 1, 1),
(3, 2, 2),
(4, 23, 1),
(5, 2, 1),
(6, 17, 1),
(7, 37, 2),
(8, 24, 1),
(8, 30, 1),
(8, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `pcat` varchar(20) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `disc_price` decimal(16,2) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `remarks` varchar(20) NOT NULL,
  `descr` text NOT NULL,
  `instock` varchar(20) DEFAULT 'In Stock',
  `featured` varchar(5) NOT NULL DEFAULT 'Yes',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodid`, `pname`, `pcat`, `price`, `disc_price`, `photo`, `remarks`, `descr`, `instock`, `featured`, `create_date`) VALUES
(24, 'Cabbage', 'Leafy Vegetables', '40.00', '40.00', '24.jpg', 'NA', 'Cabbage is an example of a large leafy vegetable that can grow to the size of a soccer ball.', 'In Stock', 'Yes', '2022-03-21 14:31:56'),
(25, 'Spinach', 'Leafy Vegetables', '50.00', '50.00', '25.jpg', 'NA', 'Spinach may be one of the healthiest varieties of leafy vegetables you can eat.', 'In Stock', 'Yes', '2022-03-21 14:34:09'),
(26, 'Pumpkin', 'Marrow', '80.00', '80.00', '26.jpg', 'NA', 'A pumpkin is a cultivar of winter squash that is round with smooth, slightly ribbed skin, and is most often deep yellow to orange in coloration.', 'In Stock', 'Yes', '2022-03-21 14:42:18'),
(27, 'Cucumber', 'Marrow', '50.00', '50.00', '27.jpg', 'NA', 'Cucumber is a widely-cultivated creeping vine plant in the Cucurbitaceae family that bears usually cylindrical fruits, which are used as vegetables.', 'In Stock', 'Yes', '2022-03-21 14:45:06'),
(28, 'Zucchini', 'Marrow', '60.00', '60.00', '28.jpg', 'NA', 'Zucchini, also known as courgette, is a summer squash in the Cucurbitaceae plant family, alongside melons, spaghetti squash, and cucumbers.', 'In Stock', 'Yes', '2022-03-21 14:47:59'),
(29, 'Sweet potato', 'Root', '40.00', '40.00', '29.jpg', 'NA', 'The sweet potato or sweetpotato (Ipomoea batatas) is a dicotyledonous plant that belongs to the bindweed or morning glory family, Convolvulaceae.', 'In Stock', 'Yes', '2022-03-21 14:49:46'),
(30, 'Potato', 'Root', '30.00', '30.00', '30.jpg', 'NA', 'The potato is one of some 150 tuber-bearing species of the genus Solanum.', 'In Stock', 'Yes', '2022-03-21 14:50:40'),
(31, 'Yam', 'Root', '120.00', '120.00', '31.jpg', 'NA', 'Yam, any of several plant species of the genus Dioscorea (family Dioscoreaceae) grown for their edible tubers.', 'In Stock', 'Yes', '2022-03-21 15:22:22'),
(32, 'Lettuce', 'Leafy Vegetables', '30.00', '30.00', '32.jpg', 'NA', 'Lettuce (Lactuca sativa) is an annual plant of the daisy family, Asteraceae.', 'In Stock', 'Yes', '2022-03-21 15:27:24'),
(33, 'Onion', 'Allium', '80.00', '80.00', '33.jpg', 'NA', 'The onion also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium.', 'In Stock', 'Yes', '2022-03-21 15:32:05'),
(34, 'Garlic', 'Allium', '100.00', '100.00', '34.jpg', 'NA', 'Garlic is a species of bulbous flowering plant in the genus Allium.', 'In Stock', 'Yes', '2022-03-21 15:33:20'),
(35, 'Celery', 'Edible plant stem', '60.00', '60.00', '35.jpg', 'NA', 'Celery is a marshland plant in the family Apiaceae that has been cultivated as a vegetable since antiquity.', 'In Stock', 'Yes', '2022-03-21 15:34:54'),
(36, 'Asparagus', 'Edible plant stem', '100.00', '100.00', '36.jpg', 'NA', 'Asparagus, or garden asparagus, folk name sparrow grass, scientific name Asparagus officinalis, is a perennial flowering plant species in the genus Asparagus.', 'In Stock', 'Yes', '2022-03-21 15:36:34'),
(37, 'Eggplant', 'Green Vegetable', '45.00', '45.00', '37.jpg', 'NA', 'eggplant, (Solanum melongena), also called aubergine or Guinea squash, tender perennial plant of the nightshade family (Solanaceae), grown for its edible fruits.', 'In Stock', 'Yes', '2022-03-21 15:43:09'),
(38, 'Tomato', 'Green Vegetable', '40.00', '40.00', '38.jpg', 'NA', 'Tomatoes are used a lot in Italian food. They are also used to make ketchup.', 'In Stock', 'Yes', '2022-03-21 15:44:29'),
(39, 'Green Pepper', 'Green Vegetable', '60.00', '60.00', '39.jpg', 'NA', 'Green sweet peppers or bell peppers (Capsicum annuum) are commonly thought of as vegetables, though they\'re technically a type of fruit.', 'In Stock', 'Yes', '2022-03-21 15:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `firstname`, `lastname`, `password`, `email`, `contact`, `city`, `address`, `img`) VALUES
(5, 'Abhishek', 'Pandey', '1234', 'abhi@gmail.com', '1234567890', 'Bhopal', 'Narela Sanakri Bhopal', '5.jpg'),
(6, 'Rohit ', 'Raj', '12345', 'rohit@gmail.com', '9876543210', 'Indore', 'Vijay Nagar Indore', '6.jpg'),
(7, 'Rahul ', 'Sinha', '1234', 'rahul@gmail.com', '9856231474', 'Indore', 'Sector-C Indrapuri Bhopal', '7.jpg');

-- --------------------------------------------------------

--
-- Structure for view `orderview`
--
DROP TABLE IF EXISTS `orderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderview`  AS SELECT `o`.`order_id` AS `order_id`, `od`.`orderdate` AS `orderdate`, `p`.`pname` AS `pname`, `p`.`disc_price` AS `disc_price`, `o`.`qty` AS `qty`, `p`.`disc_price`* `o`.`qty` AS `amount` FROM ((`order_details` `o` join `products` `p` on(`p`.`prodid` = `o`.`prodid`)) join `orders` `od` on(`od`.`order_id` = `o`.`order_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userid`,`prodid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `cust_address`
--
ALTER TABLE `cust_address`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

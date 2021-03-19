-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2021 at 01:04 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_inv`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_brand` (IN `bid` INT)  MODIFIES SQL DATA
BEGIN 

DELETE FROM `brand` WHERE brand_id=bid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_category` (IN `catid` INT)  NO SQL
BEGIN 

DELETE FROM `category` WHERE CID=catid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_currency` (IN `cid` INT)  BEGIN 
DELETE FROM `currency` WHERE currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_supplier` (IN `id` INT(255))  NO SQL
BEGIN

DECLARE suppid INT DEFAULT 0;
SET suppid = id;

SELECT `fk_person_id`
INTO id
FROM supplier WHERE `supplier_id`= suppid ;
DELETE FROM supplier WHERE supplier_id=suppid;
DELETE FROM person WHERE person_id=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_brand` ()  NO SQL
BEGIN 
select * FROM brand;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_category` ()  NO SQL
BEGIN 
select * FROM category;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_currency` ()  BEGIN 
select * FROM currency;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_brand` (IN `bid` INT)  NO SQL
BEGIN 

select * from brand where brand_id=bid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_category` (IN `cid` INT(255))  NO SQL
BEGIN 

select * from category where CID=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_currecny` (IN `cid` INT(255))  BEGIN 

select * from currency where currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_supplier` (IN `id` INT(255))  NO SQL
BEGIN

SELECT * FROM `supplier` WHERE 	supplier_id=id;





END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_supllier` ()  NO SQL
BEGIN
SELECT * FROM `supplier`;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_symbol_currency` (IN `cid` INT(255), INOUT `sy` VARCHAR(255))  BEGIN 
SELECT symbol into sy from currency WHERE currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_supplier` (IN `person_type` TINYINT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` INT(255))  NO SQL
BEGIN

INSERT INTO `person`(`person_id`, `person_type`, `fname`, `lname`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES (Null,person_type,fname,lname,address,phone,email,NOW(),NOW());



INSERT INTO `supplier`(`supplier_id`, `fk_person_id`) VALUES (Null,LAST_INSERT_ID());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_brand` (IN `bid` INT(255), IN `name` VARCHAR(255), IN `descrip` VARCHAR(250), IN `laupdate` TIMESTAMP(6))  BEGIN
UPDATE `brand` SET `name`=name,`description`=descrip,`last_update`=laupdate 
WHERE `brand_id`=bid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_category` (IN `cid` INT(255), IN `name` VARCHAR(255), IN `descrip` VARCHAR(255), IN `laupdate` TIMESTAMP(6))  NO SQL
UPDATE `category` 
SET `name`=name,`description`=descrip,`last_update`=laupdate
WHERE CID=cid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_currency` (IN `cid` INT(255), IN `name` VARCHAR(50), IN `symbol` VARCHAR(50), IN `dvalue` DECIMAL(30.2))  BEGIN
UPDATE `currency` SET `name`=name,`symbol`=symbol,`dolar_value`=dvalue WHERE `currency_id`=cid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(250) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `name`, `description`, `last_update`) VALUES
(125, 'ok', 'ok', '2021-03-19 09:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CID`, `name`, `description`, `last_update`) VALUES
(2, 'name', 'desc', '2021-03-18 15:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `dolar_value` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(255) NOT NULL,
  `fk_person_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_transaction`
--

CREATE TABLE `item_transaction` (
  `fk_PID` int(255) NOT NULL,
  `fk_sales_id` int(255) NOT NULL,
  `fk_purchase_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userId` bigint(50) NOT NULL,
  `usertype` tinyint(4) NOT NULL,
  `username` varchar(100) NOT NULL,
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(255) NOT NULL,
  `person_type` tinyint(4) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `person_type`, `fname`, `lname`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 2, 'ali', 'ayad', 'sd', '71227414', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 'ali', 'ayad', 'sd', '71227414', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 'gogo', 'schwuul', 'honek', '71227414', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 'gogo', 'sd', 'adress', '71227414', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 4, 'maxi', 'ayad', 'here', '07415466', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 4, 'maxi', 'ayad', 'here', '07415466', '0', '2021-03-19 08:59:08', '2021-03-19 08:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(255) NOT NULL,
  `fk_BID` int(255) NOT NULL,
  `fk_cat` int(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(255) NOT NULL,
  `fk_supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(255) NOT NULL,
  `fk_payment_id` int(255) NOT NULL,
  `fk_customer` int(255) NOT NULL,
  `total_amount` decimal(30,2) NOT NULL,
  `discounts` decimal(30,2) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(255) NOT NULL,
  `stock_name` int(11) NOT NULL,
  `stock_number` int(11) NOT NULL,
  `stock_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_detail`
--

CREATE TABLE `stock_detail` (
  `detail_id` int(255) NOT NULL,
  `fk_product_id` int(255) NOT NULL,
  `fk_stock_id` int(255) NOT NULL,
  `in_stock` int(255) NOT NULL,
  `unit` int(255) NOT NULL,
  `purchase_price` decimal(30,2) NOT NULL,
  `retail_price` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_mngmnt`
--

CREATE TABLE `stock_mngmnt` (
  `mangment_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `fk_person_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `fk_person_id`) VALUES
(4, 5),
(5, 6),
(6, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `vat`
--

CREATE TABLE `vat` (
  `vat_id` int(255) NOT NULL,
  `fk_currency_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent_value` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_person` (`fk_person_id`);

--
-- Indexes for table `item_transaction`
--
ALTER TABLE `item_transaction`
  ADD KEY `fk_t_pid` (`fk_PID`),
  ADD KEY `fk_t_sales` (`fk_sales_id`),
  ADD KEY `fk_t_purchase` (`fk_purchase_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `fk_p_brand` (`fk_BID`),
  ADD KEY `fk_p_cat` (`fk_cat`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `fk_p_supplier` (`fk_supplier_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `fk_s_customer` (`fk_customer`),
  ADD KEY `fk_s_payment` (`fk_payment_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_d_product` (`fk_product_id`),
  ADD KEY `fk_d_stock` (`fk_stock_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `fk_s_person` (`fk_person_id`);

--
-- Indexes for table `vat`
--
ALTER TABLE `vat`
  ADD KEY `fk_v_currency` (`fk_currency_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `userId` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_detail`
--
ALTER TABLE `stock_detail`
  MODIFY `detail_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_c_person` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `item_transaction`
--
ALTER TABLE `item_transaction`
  ADD CONSTRAINT `fk_t_pid` FOREIGN KEY (`fk_PID`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `fk_t_purchase` FOREIGN KEY (`fk_purchase_id`) REFERENCES `purchase` (`purchase_id`),
  ADD CONSTRAINT `fk_t_sales` FOREIGN KEY (`fk_sales_id`) REFERENCES `sale` (`sale_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_p_brand` FOREIGN KEY (`fk_BID`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `fk_p_cat` FOREIGN KEY (`fk_cat`) REFERENCES `category` (`CID`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_p_supplier` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_s_customer` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_s_payment` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD CONSTRAINT `fk_d_product` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `fk_d_stock` FOREIGN KEY (`fk_stock_id`) REFERENCES `stock` (`stock_id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `fk_s_person` FOREIGN KEY (`fk_person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `vat`
--
ALTER TABLE `vat`
  ADD CONSTRAINT `fk_v_currency` FOREIGN KEY (`fk_currency_id`) REFERENCES `currency` (`currency_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

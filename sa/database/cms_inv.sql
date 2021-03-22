-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 01:45 PM
-- Server version: 10.4.13-MariaDB-log
-- PHP Version: 7.4.7

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_stock_action` (IN `user_id` BIGINT(50), IN `stock_id` INT(255), IN `type` TINYINT, IN `comments` TEXT)  BEGIN 
INSERT INTO `stock_action`(`action_id`, `fk_user_id`, `fk_stock_id`, `status`, `type`, `comment`, `created_at`) VALUES (NULL,user_id,stock_id,NULL,type,comments,NULL);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_brand` (IN `bid` INT)  MODIFIES SQL DATA
BEGIN 

DELETE FROM `brand` WHERE brand_id=bid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_category` (IN `catid` INT)  BEGIN 

DELETE FROM `category` WHERE CID=catid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_currency` (IN `cid` INT)  BEGIN 
DELETE FROM `currency` WHERE currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_customer` (IN `id` INT)  BEGIN

DECLARE fkid INT DEFAULT 0;


SELECT `fk_person_id`
INTO fkid
FROM customer WHERE `customer_id`= id ;
DELETE FROM customer WHERE customer.customer_id=id;
CALL delete_person(fkid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_person` (IN `did` INT(255))  NO SQL
BEGIN
DELETE FROM `person` WHERE person.person_id=did;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_stock` (IN `sid` INT)  BEGIN 

DELETE FROM stock WHERE stock_id=sid;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_supplier` (IN `id` INT(255))  BEGIN

DECLARE fkpid INT DEFAULT 0;


SELECT `fk_person_id`
INTO fkpid
FROM supplier WHERE `supplier_id`= id ;
DELETE FROM supplier WHERE supplier_id=id;
CALL delete_person(fkpid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `disable_stock_action` (IN `action_id` INT)  BEGIN
UPDATE `stock_action` SET `status`=0 WHERE `action_id`=action_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `enable_stock_action` (IN `action_id` INT)  BEGIN
UPDATE `stock_action` SET `status`=1 WHERE `action_id`=action_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_brand` ()  NO SQL
BEGIN 
select * FROM brand;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_category` ()  BEGIN 
select * FROM category;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_currency` ()  BEGIN 
select * FROM currency;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer` ()  BEGIN
SELECT *
FROM customer
INNER JOIN person
ON person.person_id = customer.fk_person_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_brand` (IN `bid` INT)  BEGIN 

select * from brand where brand_id=bid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_category` (IN `cid` INT(255))  BEGIN 

select * from category where CID=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_currecny` (IN `cid` INT(255))  BEGIN 

select * from currency where currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_customer` (IN `cid` INT(255))  NO SQL
BEGIN
DECLARE persindgid INT DEFAULT 0;
SELECT `fk_person_id`
INTO persindgid
FROM customer WHERE `customer_id`= cid ;


CALL get_single_person(persindgid);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_person` (IN `pid` INT(255))  NO SQL
BEGIN

SELECT * FROM person
WHERE person.person_id=pid;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_stock` (IN `sid` INT(255))  BEGIN 
SELECT * FROM stock WHERE stock_id=sid; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_single_supplier` (IN `sid` INT(255))  BEGIN
DECLARE persindgid INT DEFAULT 0;
SELECT `fk_person_id`
INTO persindgid
FROM supplier WHERE `supplier_id`= sid ;


CALL get_single_person(persindgid);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stock` ()  BEGIN
SELECT * FROM stock;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_stock_action` (IN `sid` INT(255))  BEGIN 
SELECT * FROM stock_action WHERE `fk_stock_id`=sid; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_supllier` ()  BEGIN
SELECT *
FROM supplier
INNER JOIN person
ON person.person_id = supplier.fk_person_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_symbol_currency` (IN `cid` INT(255), INOUT `sy` VARCHAR(255))  BEGIN 
SELECT symbol into sy from currency WHERE currency_id=cid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_customer` (IN `person_type` INT, IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255))  BEGIN


CALL new_person(person_type,fname,lname,address,phone,email,@lid);


INSERT INTO `customer`(`customer_id`, `fk_person_id`) VALUES (Null,@lid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_person` (IN `person_type` TINYINT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255), OUT `lid` INT(250))  BEGIN

INSERT INTO `person`(`person_id`, `person_type`, `fname`, `lname`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES (Null,person_type,fname,lname,address,phone,email,NOW(),NOW());



SELECT LAST_INSERT_ID()
INTO lid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_supplier` (IN `person_type` TINYINT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255))  BEGIN

CALL new_person(person_type,fname,lname,address,phone,email,@lid);



INSERT INTO `supplier`(`supplier_id`, `fk_person_id`) VALUES (Null,@lid);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_single_stock_action` (IN `action_id` INT(255))  BEGIN

SELECT * from stock_action WHERE `action_id`=action_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `read_stock_action_t` (IN `action_id` INT(255))  BEGIN 
SELECT  P.product_name,P.sku,A.unit_price,A.unit_number FROM   action_transaction A INNER JOIN product P  ON A.fk_product_id=P.PID  where A.fk_stock_action=action_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_brand` (IN `bid` INT(255), IN `name` VARCHAR(255), IN `descrip` VARCHAR(250), IN `laupdate` TIMESTAMP(6))  BEGIN
UPDATE `brand` SET `name`=name,`description`=descrip,`last_update`=laupdate 
WHERE `brand_id`=bid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_category` (IN `cid` INT(255), IN `name` VARCHAR(255), IN `descrip` VARCHAR(255), IN `laupdate` TIMESTAMP(6))  UPDATE `category` 
SET `name`=name,`description`=descrip,`last_update`=laupdate
WHERE CID=cid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_currency` (IN `cid` INT(255), IN `name` VARCHAR(50), IN `symbol` VARCHAR(50), IN `dvalue` DECIMAL(30.2))  BEGIN
UPDATE `currency` SET `name`=name,`symbol`=symbol,`dolar_value`=dvalue WHERE `currency_id`=cid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer` (IN `customer_gid` INT(255), IN `person_type` INT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255))  NO SQL
BEGIN
DECLARE persindgid INT DEFAULT 0;
SELECT `fk_person_id`
INTO persindgid
FROM customer WHERE `customer_id`= customer_gid ;


CALL update_person(persindgid,person_type,fname,lname,address,phone,email);




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_person` (IN `person_id` INT(255), IN `person_type` INT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255))  BEGIN

UPDATE `person` 
SET `person_type`=person_type,`fname`=fname,`lname`=lname,`address`=address,`phone`=phone,`email`=email,`updated_at`=NOW() 

WHERE person.person_id=person_id;






END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_stock` (IN `sid` INT(255), IN `stock_name` VARCHAR(255), IN `stock_number` VARCHAR(250), IN `stock_address` VARCHAR(6))  BEGIN
UPDATE `stock` 
SET `stock_name`=stock_name,`stock_number`=stock_number,`stock_address`=stock_address
WHERE stock_id=sid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_stock_action` (IN `action_id` INT(255), IN `stock_id` INT(255), IN `statuses` TINYINT, IN `type` TINYINT, IN `comments` VARCHAR(255))  BEGIN

UPDATE `stock_action` SET `fk_stock_id`=stock_id,`status`=statuses,`type`=type,`comment`=comments,`created_at`=NOW() WHERE `action_id`=action_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_supplier` (IN `sid` INT(255), IN `person_type` TINYINT(4), IN `fname` VARCHAR(100), IN `lname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(20), IN `email` VARCHAR(255))  BEGIN
DECLARE persindgid INT DEFAULT 0;

SELECT `fk_person_id`
INTO persindgid
FROM supplier WHERE `supplier_id`= sid ;


CALL update_person(persindgid,person_type,fname,lname,address,phone,email);


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `action_transaction`
--

CREATE TABLE `action_transaction` (
  `fk_stock_action` int(255) NOT NULL,
  `fk_product_id` int(255) NOT NULL,
  `unit_price` decimal(30,2) NOT NULL DEFAULT 0.00,
  `unit_number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action_transaction`
--

INSERT INTO `action_transaction` (`fk_stock_action`, `fk_product_id`, `unit_price`, `unit_number`) VALUES
(2, 2, '100.00', 299);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `name`, `description`, `last_update`) VALUES
(1, 'cream', 'cream', '2021-03-22 08:44:26');

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
(1, 'skin care', 'skin care', '2021-03-22 10:16:58');

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

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `name`, `symbol`, `dolar_value`) VALUES
(1, 'KSA', 'KSA', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(255) NOT NULL,
  `fk_person_id` int(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_transaction`
--

CREATE TABLE `item_transaction` (
  `fk_PID` int(255) NOT NULL,
  `fk_sales_id` int(255) NOT NULL,
  `fk_purchase_id` int(255) NOT NULL,
  `fk_user_id` bigint(50) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL
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

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userId`, `usertype`, `username`, `encrypted_password`, `salt`, `created_at`) VALUES
(4, 1, 'admin', '123', '123', '2021-03-22 11:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `mngmnt_transaction`
--

CREATE TABLE `mngmnt_transaction` (
  `fk_stock_action` int(255) NOT NULL,
  `fk_detail_id` int(255) NOT NULL,
  `unit_number` int(255) NOT NULL,
  `before_unit` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 'asdasd', 'asdasd', 'asdas', '33333', 'alede', '2021-03-19 11:00:27', '2021-03-19 11:00:27'),
(2, 1, 'test', 'test', 'test', '555555', '0', '2021-03-19 12:23:33', '2021-03-19 12:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PID` int(255) NOT NULL,
  `fk_BID` int(255) NOT NULL,
  `fk_cat` int(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `sku` varchar(30) NOT NULL DEFAULT '0',
  `retail_price` decimal(30,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `fk_BID`, `fk_cat`, `product_name`, `product_description`, `sku`, `retail_price`, `status`, `created_at`) VALUES
(2, 1, 1, 'ALPROSE', 'cream for skincare', '', '0.00', 1, '2021-03-22 10:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(255) NOT NULL,
  `fk_supplier_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
  `stock_name` varchar(255) NOT NULL,
  `stock_number` bigint(20) NOT NULL,
  `stock_address` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `stock_name`, `stock_number`, `stock_address`, `created_at`) VALUES
(1, 'ksa', 1234123, 'ksa', '2021-03-22 09:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `stock_action`
--

CREATE TABLE `stock_action` (
  `action_id` int(255) NOT NULL,
  `fk_user_id` bigint(50) NOT NULL,
  `fk_stock_id` int(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'INBOUND OR OUTBOUND product into stock',
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_action`
--

INSERT INTO `stock_action` (`action_id`, `fk_user_id`, `fk_stock_id`, `status`, `type`, `comment`, `created_at`) VALUES
(2, 4, 1, 1, 2, 'hello', '2021-03-22 11:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `stock_detail`
--

CREATE TABLE `stock_detail` (
  `detail_id` int(255) NOT NULL,
  `fk_product_id` int(255) NOT NULL,
  `fk_stock_id` int(255) NOT NULL,
  `in_stock` tinyint(4) NOT NULL,
  `unit` int(255) NOT NULL,
  `purchase_price` decimal(30,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_detail`
--

INSERT INTO `stock_detail` (`detail_id`, `fk_product_id`, `fk_stock_id`, `in_stock`, `unit`, `purchase_price`, `created_at`) VALUES
(1, 2, 1, 1, 100, '240.00', '2021-03-22 10:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `stock_mngmnt`
--

CREATE TABLE `stock_mngmnt` (
  `mangment_id` int(255) NOT NULL,
  `fk_user_id` bigint(50) NOT NULL,
  `fk_stock_id` int(255) NOT NULL,
  `custom_nb` int(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `fk_person_id` int(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `fk_person_id`, `status`) VALUES
(1, 2, 0);

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
-- Indexes for table `action_transaction`
--
ALTER TABLE `action_transaction`
  ADD KEY `fk_action_id` (`fk_stock_action`),
  ADD KEY `fk_product_id` (`fk_product_id`);

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
  ADD KEY `fk_t_purchase` (`fk_purchase_id`),
  ADD KEY `fk_user2` (`fk_user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `mngmnt_transaction`
--
ALTER TABLE `mngmnt_transaction`
  ADD KEY `fk_action_id` (`fk_stock_action`),
  ADD KEY `fk_detail_id` (`fk_detail_id`);

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
-- Indexes for table `stock_action`
--
ALTER TABLE `stock_action`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `fk_m_stock_id` (`fk_stock_id`),
  ADD KEY `fk_user1` (`fk_user_id`);

--
-- Indexes for table `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `fk_product_id` (`fk_product_id`,`fk_stock_id`) USING BTREE;

--
-- Indexes for table `stock_mngmnt`
--
ALTER TABLE `stock_mngmnt`
  ADD PRIMARY KEY (`mangment_id`),
  ADD KEY `fk_m_stock_id` (`fk_stock_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

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
  MODIFY `brand_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `userId` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `PID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `stock_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_action`
--
ALTER TABLE `stock_action`
  MODIFY `action_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_detail`
--
ALTER TABLE `stock_detail`
  MODIFY `detail_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_mngmnt`
--
ALTER TABLE `stock_mngmnt`
  MODIFY `mangment_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_transaction`
--
ALTER TABLE `action_transaction`
  ADD CONSTRAINT `fk_action_id` FOREIGN KEY (`fk_stock_action`) REFERENCES `stock_action` (`action_id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`PID`);

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
  ADD CONSTRAINT `fk_t_sales` FOREIGN KEY (`fk_sales_id`) REFERENCES `sale` (`sale_id`),
  ADD CONSTRAINT `fk_user2` FOREIGN KEY (`fk_user_id`) REFERENCES `login` (`userId`);

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
-- Constraints for table `stock_action`
--
ALTER TABLE `stock_action`
  ADD CONSTRAINT `fk_user1` FOREIGN KEY (`fk_user_id`) REFERENCES `login` (`userId`);

--
-- Constraints for table `stock_detail`
--
ALTER TABLE `stock_detail`
  ADD CONSTRAINT `fk_d_product` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`PID`),
  ADD CONSTRAINT `fk_d_stock` FOREIGN KEY (`fk_stock_id`) REFERENCES `stock` (`stock_id`);

--
-- Constraints for table `stock_mngmnt`
--
ALTER TABLE `stock_mngmnt`
  ADD CONSTRAINT `fk_m_stock_id` FOREIGN KEY (`fk_stock_id`) REFERENCES `stock` (`stock_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `login` (`userId`);

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

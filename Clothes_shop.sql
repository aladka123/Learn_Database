-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 24, 2022 at 08:46 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Clothes_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `id_product` varchar(5) DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` bigint NOT NULL,
  `id_discount` varchar(5) DEFAULT NULL,
  `customer_id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `date`, `id_product`, `quantity`, `price`, `id_discount`, `customer_id`) VALUES
('1', '2021-01-02', '1', 2, 1200000, '1', '1'),
('2', '2021-01-03', '2', 1, 600000, '2', '4'),
('3', '2021-01-04', '3', 3, 1900000, '3', '2'),
('4', '2021-01-05', '4', 2, 1400000, '1', '3');

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` varchar(5) NOT NULL,
  `reason_bonus` text NOT NULL,
  `bonus` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`id`, `reason_bonus`, `bonus`) VALUES
('1', 'Doanh số', 500000),
('2', 'Chăm chỉ', 200000),
('3', 'Lễ tết', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
('1', 'LV'),
('2', 'DSQ'),
('3', 'BBR'),
('4', 'Tommy'),
('5', 'DG'),
('6', 'GVC');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `birth` date NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `birth`, `address`, `mobile`, `email`) VALUES
('1', 'Tùng', '1999-12-01', 'QN', '032452356', 'tung@gmail.com'),
('2', 'Tiến', '1998-11-02', 'LS', '032453345', 'tien@gmail.com'),
('3', 'Trang', '2000-06-06', 'HCM', '039245464', 'trang@gmail.com'),
('4', 'My', '1995-08-08', 'HN', '093243255', 'my@gmail.com'),
('5', 'Thắng', '1997-05-05', 'HN', '032432436', 'thang@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` varchar(5) NOT NULL,
  `discount_rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `discount_rate`) VALUES
('1', 0.1),
('2', 0.2),
('3', 0.3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `age` int NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `age`, `address`, `mobile`, `email`, `position`) VALUES
('1', 'Việt', 23, 'TN', '036345463', 'viet@gmail.com', 'Kho'),
('2', 'Phương', 22, 'BN', '033546455', 'phuong@gmail.com', 'Thu Ngân'),
('3', 'Lan', 20, 'HN', '093545463', 'lan@gmail.com', 'Bán hàng'),
('4', 'Trang', 25, 'HN', '092356775', 'trang@gmail.com', 'Quản lý');

-- --------------------------------------------------------

--
-- Table structure for table `import_ticket`
--

CREATE TABLE `import_ticket` (
  `id` varchar(5) NOT NULL,
  `id_employee` varchar(5) NOT NULL,
  `id_supplier` varchar(5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `import_ticket`
--

INSERT INTO `import_ticket` (`id`, `id_employee`, `id_supplier`, `date`) VALUES
('1', '3', '1', '2021-12-28'),
('2', '4', '2', '2021-01-05'),
('3', '3', '3', '2021-01-07'),
('4', '4', '4', '2021-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `size` text NOT NULL,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `type`, `size`, `price`, `quantity`) VALUES
('1', 'lV', 'T-shirt', 'S', 600000, 10),
('2', 'DSQ', 'Jean', 'M', 700000, 15),
('3', 'Tommy', 'Hoodie', 'S', 500000, 10),
('4', 'BBR', 'Sweater', 'M', 800000, 15),
('5', 'DG', 'Shirt', 'L', 650000, 10),
('6', 'GVC', 'T-shirt', 'S', 550000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` varchar(5) NOT NULL,
  `id_product` varchar(5) DEFAULT NULL,
  `size` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`id`, `id_product`, `size`, `quantity`) VALUES
('1', '1', 1, 10),
('2', '2', 2, 10),
('3', '3', 3, 15),
('4', '4', 1, 10),
('5', '5', 2, 15),
('6', '6', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `punish`
--

CREATE TABLE `punish` (
  `id` varchar(5) NOT NULL,
  `reason_punish` text NOT NULL,
  `punish` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `punish`
--

INSERT INTO `punish` (`id`, `reason_punish`, `punish`) VALUES
('1', 'đi muộn', 100000),
('2', 'không mặc đồng phục', 100000),
('3', 'làm việc riêng trong giờ làm', 50000),
('4', 'không vệ sinh chỗ làm', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` varchar(5) NOT NULL,
  `id_employee` varchar(5) NOT NULL,
  `id_shift` varchar(5) NOT NULL,
  `month` enum('1','2','3','4','5','6','7','8','9','10','11','12') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `id_employee`, `id_shift`, `month`) VALUES
('1', '1', '4', '1'),
('2', '2', '2', '1'),
('3', '3', '4', '1'),
('4', '4', '4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_bonus`
--

CREATE TABLE `salary_bonus` (
  `salary_bonus_id` varchar(5) NOT NULL,
  `id_salary` varchar(5) NOT NULL,
  `id_bonus` varchar(5) NOT NULL,
  `bonus_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_bonus`
--

INSERT INTO `salary_bonus` (`salary_bonus_id`, `id_salary`, `id_bonus`, `bonus_date`) VALUES
('1', '1', '1', '2022-01-18'),
('2', '2', '1', '2022-01-18'),
('3', '3', '1', '2022-01-18'),
('4', '4', '1', '2022-01-18');

-- --------------------------------------------------------

--
-- Table structure for table `salary_punish`
--

CREATE TABLE `salary_punish` (
  `salary_punish_id` varchar(5) NOT NULL,
  `id_salary` varchar(5) NOT NULL,
  `id_punish` varchar(5) NOT NULL,
  `punish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_punish`
--

INSERT INTO `salary_punish` (`salary_punish_id`, `id_salary`, `id_punish`, `punish_date`) VALUES
('1', '1', '1', '2022-01-11'),
('2', '2', '1', '2022-01-15'),
('3', '3', '2', '2022-01-21');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` varchar(5) NOT NULL,
  `shift_name` text NOT NULL,
  `start_time` int NOT NULL,
  `working_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `shift_name`, `start_time`, `working_time`) VALUES
('1', 'ca sáng', 8, 4),
('2', 'ca chiều', 14, 4),
('3', 'ca tối', 18, 4),
('4', 'fulltime', 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` varchar(5) NOT NULL,
  `name` text NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `mobile`, `address`, `email`) VALUES
('1', 'LV', '032523536', 'Italy', 'lv@gmail.com'),
('2', 'DG', '093573262', 'USA', 'dg@gmail.com'),
('3', 'BBR', '032477485', 'France', 'bbr@gmail.com'),
('4', 'Tommy', '093483775', 'Lao', 'tommy@gmail.com'),
('5', 'GVC', '092164637', 'Campuchia', 'gvc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` varchar(5) NOT NULL,
  `id_product` varchar(5) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `id_product`, `quantity`) VALUES
('1', '1', 10),
('2', '2', 15),
('3', '3', 10),
('4', '4', 15),
('5', '5', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_discount` (`id_discount`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_ticket`
--
ALTER TABLE `import_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `punish`
--
ALTER TABLE `punish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_shift` (`id_shift`);

--
-- Indexes for table `salary_bonus`
--
ALTER TABLE `salary_bonus`
  ADD PRIMARY KEY (`salary_bonus_id`),
  ADD KEY `id_salary` (`id_salary`),
  ADD KEY `id_bonus` (`id_bonus`);

--
-- Indexes for table `salary_punish`
--
ALTER TABLE `salary_punish`
  ADD PRIMARY KEY (`salary_punish_id`),
  ADD KEY `id_salary` (`id_salary`),
  ADD KEY `id_punish` (`id_punish`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `import_ticket`
--
ALTER TABLE `import_ticket`
  ADD CONSTRAINT `import_ticket_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `import_ticket_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `product_info`
--
ALTER TABLE `product_info`
  ADD CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`id_shift`) REFERENCES `shift` (`id`);

--
-- Constraints for table `salary_bonus`
--
ALTER TABLE `salary_bonus`
  ADD CONSTRAINT `salary_bonus_ibfk_1` FOREIGN KEY (`id_salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `salary_bonus_ibfk_2` FOREIGN KEY (`id_bonus`) REFERENCES `bonus` (`id`);

--
-- Constraints for table `salary_punish`
--
ALTER TABLE `salary_punish`
  ADD CONSTRAINT `salary_punish_ibfk_1` FOREIGN KEY (`id_salary`) REFERENCES `salary` (`id`),
  ADD CONSTRAINT `salary_punish_ibfk_2` FOREIGN KEY (`id_punish`) REFERENCES `punish` (`id`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

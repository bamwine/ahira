-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2020 at 01:04 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `branch_address` varchar(100) NOT NULL,
  `branch_contact` varchar(50) NOT NULL,
  `email` tinytext NOT NULL,
  `skin` varchar(15) NOT NULL,
  `terms` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `branch_address`, `branch_contact`, `email`, `skin`, `terms`) VALUES
(1, 'BK GENERAL SPAREPARTS', 'Mahataye Opposite  Dream Land Hotel', '+211 929 141 047\n+211 929 699 920', 'kbgeneral@gmail.com', 'red', 'Goods Once Bought Not Returned');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_first` varchar(50) NOT NULL,
  `cust_last` varchar(30) NOT NULL,
  `cust_address` varchar(100) NOT NULL,
  `cust_contact` varchar(30) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `cust_pic` varchar(300) NOT NULL,
  `bday` date NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `house_status` varchar(30) NOT NULL,
  `years` varchar(20) NOT NULL,
  `rent` varchar(10) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_no` varchar(30) NOT NULL,
  `emp_address` varchar(100) NOT NULL,
  `emp_year` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `salary` varchar(30) NOT NULL,
  `spouse` varchar(30) NOT NULL,
  `spouse_no` varchar(30) NOT NULL,
  `spouse_emp` varchar(50) NOT NULL,
  `spouse_details` varchar(100) NOT NULL,
  `spouse_income` decimal(10,2) NOT NULL,
  `comaker` varchar(30) NOT NULL,
  `comaker_details` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `credit_status` varchar(10) NOT NULL,
  `ci_remarks` varchar(1000) NOT NULL,
  `ci_name` varchar(50) NOT NULL,
  `ci_date` date NOT NULL,
  `payslip` int(11) NOT NULL,
  `valid_id` int(11) NOT NULL,
  `cert` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `income` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_first`, `cust_last`, `cust_address`, `cust_contact`, `balance`, `cust_pic`, `bday`, `nickname`, `house_status`, `years`, `rent`, `emp_name`, `emp_no`, `emp_address`, `emp_year`, `occupation`, `salary`, `spouse`, `spouse_no`, `spouse_emp`, `spouse_details`, `spouse_income`, `comaker`, `comaker_details`, `branch_id`, `credit_status`, `ci_remarks`, `ci_name`, `ci_date`, `payslip`, `valid_id`, `cert`, `cedula`, `income`) VALUES
(1, 'bams', 'bams', 'xxxx', '4566', '0.00', 'default.gif', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0.00', '', '', 1, '', '', '', '0000-00-00', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `user_id`, `action`, `date`) VALUES
(1, 1, 'has logged in the system at ', '2020-05-18 12:06:29'),
(2, 1, 'has logged in the system at ', '2020-05-18 15:31:48'),
(3, 1, 'has logged in the system at ', '2020-05-18 17:59:24'),
(4, 1, 'added 10 of FRONT HEAD LAMP R', '2020-05-18 20:39:36'),
(5, 1, 'has logged in the system at ', '2020-05-19 12:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `payment_for` date NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `remaining` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `rebate` decimal(10,2) NOT NULL,
  `or_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `cust_id`, `sales_id`, `payment`, `payment_date`, `user_id`, `branch_id`, `payment_for`, `due`, `interest`, `remaining`, `status`, `rebate`, `or_no`) VALUES
(1, 0, 1, '60.00', '2020-05-17 20:40:24', 1, 1, '2020-05-17', '60.00', '0.00', '0.00', 'paid', '0.00', 1),
(2, 0, 2, '90.00', '2020-05-17 20:52:32', 1, 1, '2020-05-17', '90.00', '0.00', '0.00', 'paid', '0.00', 2),
(3, 0, 3, '70.00', '2020-05-17 20:53:08', 1, 1, '2020-05-17', '70.00', '0.00', '0.00', 'paid', '0.00', 3),
(4, 0, 4, '20.00', '2020-05-17 20:57:49', 1, 1, '2020-05-17', '20.00', '0.00', '0.00', 'paid', '0.00', 4),
(5, 0, 5, '80.00', '2020-05-17 22:17:26', 1, 1, '2020-05-17', '80.00', '0.00', '0.00', 'paid', '0.00', 5),
(6, 0, 6, '20.00', '2020-05-18 06:47:01', 1, 1, '2020-05-18', '20.00', '0.00', '0.00', 'paid', '0.00', 6),
(7, 1, 7, '15.00', '2020-05-18 06:59:39', 1, 1, '2020-05-18', '15.00', '0.00', '0.00', 'paid', '0.00', 7),
(8, 0, 8, '80.00', '2020-05-18 07:21:08', 1, 1, '2020-05-18', '80.00', '0.00', '0.00', 'paid', '0.00', 8),
(9, 0, 9, '20.00', '2020-05-18 12:57:43', 1, 1, '2020-05-18', '20.00', '0.00', '0.00', 'paid', '0.00', 9),
(10, 0, 10, '180.00', '2020-05-18 14:06:44', 1, 1, '2020-05-18', '180.00', '0.00', '0.00', 'paid', '0.00', 10),
(11, 0, 11, '300.00', '2020-05-18 14:07:37', 1, 1, '2020-05-18', '300.00', '0.00', '0.00', 'paid', '0.00', 11);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(500) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_pic` varchar(300) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `reorder` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `prod_price`, `prod_pic`, `cat_id`, `prod_qty`, `branch_id`, `reorder`, `supplier_id`, `serial`) VALUES
(1, 'FRONT HEAD LAMP L', 'FRONT HEAD LAMP L', '60.00', 'default.gif', 1, 15, 1, 10, 2, 'WG9719720001'),
(2, 'FRONT HEAD LAMP R', 'FRONT HEAD LAMP R', '60.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 30, 1, 10, 2, 'WG9719720002'),
(3, 'SHOCK ABSORBER', 'SHOCK ABSORBER', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'WG9925680028'),
(4, 'SHOCK ABSORBER', 'SHOCK ABSORBER', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'WGL 642430283'),
(5, 'SHOCK ABSORBER', 'SHOCK ABSORBER', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ 1642440021'),
(6, 'CLUTCH MASTER CYLIR', 'CLUTCH MASTER CYLIR', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG971923 0023 / 5'),
(7, 'FOOG LAMP R', 'FOOG LAMP R', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719720026/2'),
(8, 'FOOG LAMP L', 'FOOG LAMP L', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719720025 / 2'),
(9, 'V BRAKE ROD', 'V BRAKE ROD', '130.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9725529272'),
(10, 'BREKE LINING REAR P', 'BREKE LINING REAR P', '5.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 1200, 1, 10, 2, 'WG9231342068 '),
(11, 'RUBER SUPPORT ORIGI', 'RUBER SUPPORT ORIGI', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'AZ9725520276'),
(12, 'RIVET', 'RIVET', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG880340039'),
(13, 'LEAF SPERIN SUPPORT', 'LEAF SPERIN SUPPORT', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9232520010'),
(14, 'LEAF SPERIN SUPPORT', 'LEAF SPERIN SUPPORT', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9232520011'),
(15, 'U BOLT FRONT', 'U BOLT FRONT', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ9925520230'),
(16, 'U BOLT REAR', 'U BOLT REAR', '18.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ9925520268'),
(17, 'SPIDER KIT 57', 'SPIDER KIT 57', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, '57*144'),
(18, 'BRAKE CHAMBER REA', 'BRAKE CHAMBER REA', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9000360601 / 2'),
(19, 'ENGINE SUPPORT REA', 'ENGINE SUPPORT REA', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'WG9725593031'),
(20, 'ENGINE SUPPORT FRO', 'ENGINE SUPPORT FRO', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'WGL680590095'),
(21, 'CLUTCH SERVO', 'CLUTCH SERVO', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 30, 1, 10, 2, 'WG9725230041'),
(22, 'WHEEL FENDER BELAL', 'WHEEL FENDER BELAL', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WG1642230106'),
(23, 'WHEEL FENDER BELAK', 'WHEEL FENDER BELAK', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WGL642230105'),
(24, 'FOOT STEEP BELAK R', 'FOOT STEEP BELAK R', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WGL642242104'),
(25, 'FOOT STEEP BELAK L', 'FOOT STEEP BELAK L', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WGL642242103'),
(26, 'REAR FENDER BELAK I', 'REAR FENDER BELAK I', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WGL64223010'),
(27, 'REAR FENDER BELAK F', 'REAR FENDER BELAK F', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 25, 1, 10, 2, 'WGL642230108'),
(28, 'MUDE GARDE BELAK', 'MUDE GARDE BELAK', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WGL642230104'),
(29, 'MUDE GARDE BELAK', 'MUDE GARDE BELAK', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WGL642230103'),
(30, 'STARTOR MOTRE', 'STARTOR MOTRE', '200.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WGL560090007'),
(31, 'ALETMETOR', 'ALETMETOR', '150.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VG1560194002'),
(32, 'FLEXIBEL HOSE', 'FLEXIBEL HOSE', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9725549068 / WG9725540499'),
(33, 'INJECTION PUMP', 'INJECTION PUMP', '850.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VGL560080023'),
(34, 'FAN BELT', 'FAN BELT', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 200, 1, 10, 2, 'VGL560120253'),
(35, 'ALETRNETOR BELT', 'ALETRNETOR BELT', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'VGL500090066'),
(36, 'V BRAKE ROD BUSHIN', 'V BRAKE ROD BUSHIN', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ9725529213'),
(37, 'OIL SEAL', 'OIL SEAL', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 150, 1, 10, 2, '190*220*30'),
(38, 'AIR FILTER', 'AIR FILTER', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG9725790102'),
(39, 'TOREQEROD BUSHING', 'TOREQEROD BUSHING', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG9114521175'),
(40, 'LEAF SPERING PIN', 'LEAF SPERING PIN', '5.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG9100520065'),
(41, 'ACCELERATOR CABEL', 'ACCELERATOR CABEL', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG9725570300'),
(42, 'FRONT BAMPER', 'FRONT BAMPER', '170.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WGL642241021'),
(43, 'FRONT PANEL', 'FRONT PANEL', '170.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WGL642111011'),
(44, 'CABIN JACK', 'CABIN JACK', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9719820001'),
(45, 'SPIDER KIT 52', 'SPIDER KIT 52', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, '52*133'),
(46, 'LEAF SPRING BUSHING', 'LEAF SPRING BUSHING', '5.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'WG9000520078'),
(47, 'FUEL HUSE', 'FUEL HUSE', '4.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WGL092080018'),
(48, 'FUEL HOSE', 'FUEL HOSE', '4.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WGL092080017'),
(49, 'DOOR ASSY R', 'DOOR ASSY R', '300.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'AZ 1642210002'),
(50, 'DOOR ASSY L', 'DOOR ASSY L', '300.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'AZ1642210001'),
(51, 'BUGI BALANCE BEARI', 'BUGI BALANCE BEARI', '18.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'AZ9725520235'),
(52, 'FUEL HOSE', 'FUEL HOSE', '4.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WGL092080019'),
(53, 'ENGINE GASKET', 'ENGINE GASKET', '60.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZL560010701'),
(54, 'PISTON', 'PISTON', '250.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VGL560037011'),
(55, 'PISTO RING CYEPR', 'PISTO RING CYEPR', '60.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VGL560030050'),
(56, 'LINER', 'LINER', '150.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VGL540010006'),
(57, 'CON ROD BEARING', 'CON ROD BEARING', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VGL560037033/34'),
(58, 'CON ROD BEARING BO', 'CON ROD BEARING BO', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'VGL500030023'),
(59, 'OUTER FRONT HUB BEE', 'OUTER FRONT HUB BEE', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '32310'),
(60, 'INNER FRONT HUB BET', 'INNER FRONT HUB BET', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '32314'),
(61, 'OIL FILTER', 'OIL FILTER', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '5801649910'),
(62, 'FUEL FILTER', 'FUEL FILTER', '35.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '5041995510'),
(63, 'WATER SEPARTOR', 'WATER SEPARTOR', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '5801312864'),
(64, 'CUP FOR WATER SEPARATOR', 'CUP FOR WATER SEPARATOR', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, ''),
(65, 'GREASE NIPPLE', 'GREASE NIPPLE', '1.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ9003963022'),
(66, 'WASHER', 'WASHER', '100.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, '1680520050'),
(67, 'ELECTRICAL INSECTION BOX', 'ELECTRICAL INSECTION BOX', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9716582101'),
(68, 'FAN', 'FAN', '2.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'VG1500060447'),
(69, 'CLAMP', 'CLAMP', '2.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG1500119215'),
(70, 'CLAMP', 'CLAMP', '2.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG1500119216'),
(71, 'CLAMP', 'CLAMP', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'VG1034110100'),
(72, 'SHIFTING HANDLE', 'SHIFTING HANDLE', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9925240020'),
(73, 'DOOR HANDLE', 'DOOR HANDLE', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG1642330001'),
(74, 'BATERY SWITCH', 'BATERY SWITCH', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9100760100'),
(75, 'POWER SWITCH', 'POWER SWITCH', '600.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, '81255066033'),
(76, 'CRANCH SHAFT', 'CRANCH SHAFT', '60.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, '161560000000.00'),
(77, 'WATER PUMP ASSEMBLE', 'WATER PUMP ASSEMBLE', '18.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'VG1500060051'),
(78, 'TIE ROD ARM', 'TIE ROD ARM', '18.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9719410040'),
(79, 'TIE ROD', 'TIE ROD', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9719410041'),
(80, 'STAD', 'STAD', '12.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9719410005'),
(81, 'BALL JOINT LEFT', 'BALL JOINT LEFT', '12.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9925430100'),
(82, 'BALL JOINT RIGHT', 'BALL JOINT RIGHT', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9925430200'),
(83, 'HAND BRAKE VALVE', 'HAND BRAKE VALVE', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9000360522| 2'),
(84, 'BRAKE MASTER VALVE', 'BRAKE MASTER VALVE', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'D29100360080'),
(85, 'BRAKE MASTER CYLINDER', 'BRAKE MASTER CYLINDER', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG900360520|1'),
(86, '4 CIRCIUT PROTECTION VALVE', '4 CIRCIUT PROTECTION VALVE', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, -3, 1, 10, 2, 'AZ91003 60067'),
(87, 'RELAY VALVE', 'RELAY VALVE', '18.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9000360506 | 2'),
(88, '4 CIRCIUT PROTECTION VALVE', '4 CIRCIUT PROTECTION VALVE', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'WG9000360523 | 1'),
(89, 'DOUBLE H VALAVE', 'DOUBLE H VALAVE', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG2203250003 | 1'),
(90, 'AUXI VALVE', 'AUXI VALVE', '70.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 4, 1, 10, 2, 'WG9000361404'),
(91, 'EXHAUST BRAKE VALVE', 'EXHAUST BRAKE VALVE', '70.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725542041 / 1'),
(92, 'EXHAUST BRAKE VALVE', 'EXHAUST BRAKE VALVE', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725542042 / 2'),
(93, 'RELEASE BARING', 'RELEASE BARING', '35.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9725160510'),
(94, 'BRACKET ASSEMBLE', 'BRACKET ASSEMBLE', '70.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 9, 1, 10, 2, 'AZ9725360020'),
(95, 'HYDROLIC CYLINDER', 'HYDROLIC CYLINDER', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719820004'),
(96, 'HOSE', 'HOSE', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719820203'),
(97, 'HOSE', 'HOSE', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719820206'),
(98, 'HOSE', 'HOSE', '170.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719820204'),
(99, 'COOLING COMPRESSC', 'COOLING COMPRESSC', '75.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1500139001'),
(100, 'SUN VISOR', 'SUN VISOR', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1642879231'),
(101, 'FLANGE', 'FLANGE', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9231320014'),
(102, 'PAD', 'PAD', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG2229020001'),
(103, 'SPRING', 'SPRING', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG2229020003'),
(104, 'SPRING', 'SPRING', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'WG2229020002'),
(105, 'OIL SEAL', 'OIL SEAL', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9003070105'),
(106, 'OIL SEAL', 'OIL SEAL', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9003070055'),
(107, 'LEFT BRACKET', 'LEFT BRACKET', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'AZ1664430042'),
(108, 'RIGHT BRACKET', 'RIGHT BRACKET', '50.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'AZ1664430043'),
(109, 'FLANGE', 'FLANGE', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'VG1246060045'),
(110, 'BRAKE DRUM REAP', 'BRAKE DRUM REAP', '160.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG9231342006'),
(111, 'BOLT WITH NUT FRONT', 'BOLT WITH NUT FRONT', '5.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 500, 1, 10, 2, ''),
(112, 'BOLT WITH NUT REAR', 'BOLT WITH NUT REAR', '5.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, ''),
(113, 'TIRE ROAD', 'TIRE ROAD', '75.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9700430050'),
(114, 'TIRE ROAD', 'TIRE ROAD', '70.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9719430010'),
(115, 'BRAKE SHOE ASSEML', 'BRAKE SHOE ASSEML', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 40, 1, 10, 2, '9231342070'),
(116, 'CYLINDER BLOCK', 'CYLINDER BLOCK', '1600.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 3, 1, 10, 2, 'AZ1095010048'),
(117, 'WIND SHIELD', 'WIND SHIELD', '150.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG1642710001'),
(118, 'SEALING STRIP FOR WIND SHIELD', 'SEALING STRIP FOR WIND SHIELD', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, ''),
(119, 'PROPELER SHAFT', 'PROPELER SHAFT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9939311748'),
(120, 'RETURN SPRING', 'RETURN SPRING', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'AZ9100340012'),
(121, 'RETURN SPRING', 'RETURN SPRING', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '199112000000'),
(122, 'HANGER ASSMEBLY', 'HANGER ASSMEBLY', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ229115314126'),
(123, 'V MIRROR L', 'V MIRROR L', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1642777020'),
(124, 'V MIRROR R', 'V MIRROR R', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1642777010'),
(125, 'RADIATOR', 'RADIATOR', '250.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725530129'),
(126, 'INTERCOOLER', 'INTERCOOLER', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725530130'),
(127, 'WIPER ARM AND BLA<', 'WIPER ARM AND BLA<', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG 1642740010'),
(128, 'DOOR GLASS', 'DOOR GLASS', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1642330060'),
(129, 'DOOR GLASS', 'DOOR GLASS', '80.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG1642330061'),
(130, 'RUBBER SUPPORT', 'RUBBER SUPPORT', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, 'AZ9925525286'),
(131, 'AIR FILTER', 'AIR FILTER', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 50, 1, 10, 2, '2841'),
(132, 'INJECTOR', 'INJECTOR', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 6, 1, 10, 2, '445120361'),
(133, 'INJECTION PUMP', 'INJECTION PUMP', '850.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 1, 1, 10, 2, 'VG1560080022'),
(134, 'MAIN BEARING', 'MAIN BEARING', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, ''),
(135, 'BRACKET ASSEMBLE', 'BRACKET ASSEMBLE', '55.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ 1642448081/8 2'),
(136, 'TURNING SHAFT', 'TURNING SHAFT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ 1642430219'),
(137, 'BUSHING', 'BUSHING', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 49, 1, 10, 2, 'QY1780680035'),
(138, 'BRAKE CAMSHAFT', 'BRAKE CAMSHAFT', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9231340227'),
(139, 'PUSH RODE', 'PUSH RODE', '65.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9631521175'),
(140, 'AIR PIPE ASSEMBLY', 'AIR PIPE ASSEMBLY', '65.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725190002'),
(141, 'BELLOW HOSE', 'BELLOW HOSE', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9719190015'),
(142, 'BRAKE CHAMBER REA', 'BRAKE CHAMBER REA', '45.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, '9000360600'),
(143, 'BASIN ANGLE GEAR', 'BASIN ANGLE GEAR', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, ''),
(144, 'BRACKET', 'BRACKET', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9100680055'),
(145, 'DIFFERENTIAL MEDIA', 'DIFFERENTIAL MEDIA', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9981320136'),
(146, 'WHEEL REDUCTORREJ', 'WHEEL REDUCTORREJ', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9981340070'),
(147, 'FLANGE NUT', 'FLANGE NUT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, '179000000000'),
(148, 'BRACKET CHAMBER', 'BRACKET CHAMBER', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9231340041'),
(149, 'FORK', 'FORK', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, '199014000000'),
(150, 'WIPER MOTOR', 'WIPER MOTOR', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG 1642740008'),
(151, 'IGNITION SWITCH', 'IGNITION SWITCH', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9725580090/ 1'),
(152, 'COMBINATION SWITC', 'COMBINATION SWITC', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9730583117'),
(153, 'FEUL SENOR', 'FEUL SENOR', '30.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9725550030'),
(154, 'WATER TANK IVECO', 'WATER TANK IVECO', '100.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, '1300-500580'),
(155, 'WATER TANK HOWO', 'WATER TANK HOWO', '35.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'WG9719530260'),
(156, 'KEY ASSEMBLY', 'KEY ASSEMBLY', '40.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ1642341001'),
(157, 'ADJUST ARM', 'ADJUST ARM', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9100340056'),
(158, 'ADJUST ARM', 'ADJUST ARM', '25.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'WG9100340057'),
(159, 'BUSHING', 'BUSHING', '7.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG1642430263'),
(160, 'FEUL TANK', 'FEUL TANK', '300.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 4, 1, 10, 2, 'WG9725550006'),
(161, 'CAP FEUL TANK', 'CAP FEUL TANK', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ9112550213'),
(162, 'CLUTCH DISC', 'CLUTCH DISC', '115.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 10, 1, 10, 2, 'AZ1560160020'),
(163, 'CLUTCH PRESSURE', 'CLUTCH PRESSURE', '250.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 5, 1, 10, 2, 'AZ9725160100'),
(164, 'TAILLIGHTS', 'TAILLIGHTS', '10.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9719818001'),
(165, 'OIL FILTER', 'OIL FILTER', '7.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '7005'),
(166, 'FEUL FILTER', 'FEUL FILTER', '7.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'VG1560080012'),
(167, 'WATER SEPARATOR', 'WATER SEPARATOR', '15.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'PL420'),
(168, 'PISTON PIN', 'PISTON PIN', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 30, 1, 10, 2, 'VGL560037011FFL'),
(169, 'CIRCLIP PIN', 'CIRCLIP PIN', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 60, 1, 10, 2, 'VGL56003701LFFL'),
(170, 'OIL FILTER', 'OIL FILTER', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, '7005'),
(171, 'FEUL FILTER', 'FEUL FILTER', '8.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'VG1560080012'),
(172, 'WATER SEPARATOR', 'WATER SEPARATOR', '20.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 100, 1, 10, 2, 'PL420'),
(173, 'SPRING SEAT', 'SPRING SEAT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'DZ9114524001/2/'),
(174, 'ENGINE REPAIR KIT', 'ENGINE REPAIR KIT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 1, 1, 10, 2, ''),
(175, 'PISTON SET', 'PISTON SET', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 1, 1, 10, 2, ''),
(176, 'LIMIT BLOCK', 'LIMIT BLOCK', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'WG 164243 0081'),
(177, 'LIMIT BLOCK', 'LIMIT BLOCK', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9725521210'),
(178, 'LIMIT BLOCK', 'LIMIT BLOCK', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, 'AZ9114520091'),
(179, 'ENGINE SUPPORT', 'ENGINE SUPPORT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 20, 1, 10, 2, '680590095'),
(180, 'OIL AIR FILTER ASSEML', 'OIL AIR FILTER ASSEML', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, '190801'),
(181, 'BALANCE HOUSING', 'BALANCE HOUSING', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'DZ91259520038'),
(182, 'COVER BALANCE HOU:', 'COVER BALANCE HOU:', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'DZ91259520211'),
(183, 'SPRING COVER', 'SPRING COVER', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 2, 1, 10, 2, 'DZ91259520246'),
(184, 'U BOLT', 'U BOLT', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 8, 1, 10, 2, 'DZ9118520124'),
(185, 'A POLE', 'A POLE', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 2, 19, 1, 10, 2, 'WG 1642110020'),
(186, 'COVER(L & R) (OBAMA)', 'COVER(L & R) (OBAMA)', '0.00', '391e10f504e3b3e0feaa946ee6a170ea.jpg', 0, 20, 1, 20, 2, 'WG16421110131');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request`
--

CREATE TABLE `purchase_request` (
  `pr_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `request_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `purchase_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_tendered` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `cash_change` decimal(10,2) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `modeofpayment` varchar(15) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `saletype` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `cust_id`, `user_id`, `cash_tendered`, `discount`, `amount_due`, `cash_change`, `date_added`, `modeofpayment`, `branch_id`, `total`, `saletype`) VALUES
(1, 0, 1, '0.00', '0.00', '60.00', '0.00', '2020-05-17 20:40:24', 'cash', 1, '60.00', 'Receipt'),
(2, 0, 1, '0.00', '0.00', '90.00', '0.00', '2020-05-17 20:52:32', 'cash', 1, '90.00', 'Receipt'),
(3, 0, 1, '0.00', '0.00', '70.00', '0.00', '2020-05-17 20:53:08', 'cash', 1, '70.00', 'Invoice'),
(4, 0, 1, '0.00', '0.00', '20.00', '0.00', '2020-05-17 20:57:49', 'cash', 1, '20.00', 'Quatation'),
(5, 0, 1, '0.00', '0.00', '80.00', '0.00', '2020-05-17 22:17:26', 'cash', 1, '80.00', 'Receipt'),
(6, 0, 1, '0.00', '0.00', '20.00', '0.00', '2020-05-18 06:47:01', 'cash', 1, '20.00', 'Receipt'),
(7, 1, 1, '0.00', '0.00', '15.00', '0.00', '2020-05-18 06:59:39', 'cash', 1, '15.00', 'Receipt'),
(8, 0, 1, '0.00', '0.00', '80.00', '0.00', '2020-05-18 07:21:08', 'cash', 1, '80.00', 'Receipt'),
(9, 0, 1, '0.00', '0.00', '20.00', '0.00', '2020-05-18 12:57:43', 'cash', 1, '20.00', 'Receipt'),
(10, 0, 1, '0.00', '0.00', '180.00', '0.00', '2020-05-18 14:06:44', 'cash', 1, '180.00', 'Invoice'),
(11, 0, 1, '0.00', '0.00', '300.00', '0.00', '2020-05-18 14:07:37', 'cash', 1, '300.00', 'Receipt');

-- --------------------------------------------------------

--
-- Table structure for table `sales_details`
--

CREATE TABLE `sales_details` (
  `sales_details_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_details`
--

INSERT INTO `sales_details` (`sales_details_id`, `sales_id`, `prod_id`, `price`, `qty`) VALUES
(1, 1, 88, '30.00', 2),
(2, 1, 185, '0.00', 1),
(3, 2, 86, '20.00', 1),
(4, 2, 90, '70.00', 1),
(5, 3, 137, '0.00', 1),
(6, 3, 94, '70.00', 1),
(7, 4, 86, '20.00', 1),
(8, 5, 86, '40.00', 2),
(9, 6, 86, '20.00', 1),
(10, 7, 88, '15.00', 1),
(11, 8, 86, '40.00', 2),
(12, 9, 86, '20.00', 1),
(13, 10, 1, '60.00', 3),
(14, 11, 1, '60.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stockin`
--

CREATE TABLE `stockin` (
  `stockin_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(6) NOT NULL,
  `date` datetime NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockin`
--

INSERT INTO `stockin` (`stockin_id`, `prod_id`, `qty`, `date`, `branch_id`) VALUES
(1, 2, 10, '2020-05-18 20:39:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(300) NOT NULL,
  `supplier_contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_contact`) VALUES
(2, 'BK GENERAL SPAREPARTS', 'Mahataye Opposite  Dream Land Hotel', '+211 929 141 047\n+211 929 699 920');

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans`
--

CREATE TABLE `temp_trans` (
  `temp_trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `term_id` int(11) NOT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `payable_for` varchar(10) NOT NULL,
  `term` varchar(11) NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `payment_start` date NOT NULL,
  `down` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `status`, `branch_id`) VALUES
(1, 'admin', 'a1Bz20ydqelm8m1wql21232f297a57a5a743894a0e4a801fc3', 'John Smith', 'active', 1),
(4, 'user', 'a1Bz20ydqelm8m1wql21232f297a57a5a743894a0e4a801fc3', 'Mona Lisa', 'active', 2),
(6, 'administrator', 'a1Bz20ydqelm8m1wql21232f297a57a5a743894a0e4a801fc3', 'Giu Matthew', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `valid`
--

CREATE TABLE `valid` (
  `startd` tinytext NOT NULL,
  `enda` tinytext NOT NULL,
  `systemco` varchar(700) NOT NULL,
  `tkl` tinytext NOT NULL,
  `Key_code` tinytext NOT NULL,
  `mach_code` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `valid`
--

INSERT INTO `valid` (`startd`, `enda`, `systemco`, `tkl`, `Key_code`, `mach_code`) VALUES
('2020-05-04 04:58:37', '2021-05-31 12:0:0 ', 'SY79214477POS', 'ZkhLbm9iNnZIM212ck1FM0RPbTNpN0E1dDAyaWsyN2tMNG1zQjBGWW9XS1g1eGhZd0dVUGw3WnZkSUd5VWhKVg====', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `history_log`
--
ALTER TABLE `history_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `purchase_request`
--
ALTER TABLE `purchase_request`
  ADD PRIMARY KEY (`pr_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`sales_details_id`);

--
-- Indexes for table `stockin`
--
ALTER TABLE `stockin`
  ADD PRIMARY KEY (`stockin_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD PRIMARY KEY (`temp_trans_id`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `valid`
--
ALTER TABLE `valid`
  ADD PRIMARY KEY (`systemco`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `history_log`
--
ALTER TABLE `history_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `purchase_request`
--
ALTER TABLE `purchase_request`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `sales_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `stockin`
--
ALTER TABLE `stockin`
  MODIFY `stockin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `temp_trans`
--
ALTER TABLE `temp_trans`
  MODIFY `temp_trans_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2015 at 01:02 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csc261`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergens`
--

CREATE TABLE IF NOT EXISTS `allergens` (
  `ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allergens`
--

INSERT INTO `allergens` (`ID`) VALUES
('Gluten'),
('Milk'),
('Peanut Butter'),
('Soy'),
('Soybeans'),
('Tree nuts'),
('Wheat');

-- --------------------------------------------------------

--
-- Table structure for table `allergen_sets`
--

CREATE TABLE IF NOT EXISTS `allergen_sets` (
  `Set_Number` int(11) DEFAULT NULL,
  `Allergen_ID` varchar(255) DEFAULT NULL,
  KEY `allergen_sets_ibfk_1` (`Allergen_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allergen_sets`
--

INSERT INTO `allergen_sets` (`Set_Number`, `Allergen_ID`) VALUES
(2, 'Milk'),
(2, 'Peanut Butter'),
(2, 'Milk'),
(2, 'Tree Nuts'),
(3, 'Tree Nuts'),
(1, 'Wheat');

-- --------------------------------------------------------

--
-- Table structure for table `available_topping_sets`
--

CREATE TABLE IF NOT EXISTS `available_topping_sets` (
  `Set_Number` int(11) DEFAULT NULL,
  `Topping_ID` varchar(255) DEFAULT NULL,
  KEY `available_topping_sets_ibfk_1` (`Topping_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `available_topping_sets`
--

INSERT INTO `available_topping_sets` (`Set_Number`, `Topping_ID`) VALUES
(1, 'Brown Sugar'),
(1, 'Cinnamon'),
(1, 'Walnuts'),
(1, 'Almonds'),
(2, 'Half and Half'),
(2, '2 Percent Milk'),
(2, 'Whole Milk'),
(2, 'Soy Milk');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `ID` varchar(255) NOT NULL,
  `Size_ID` varchar(255) DEFAULT NULL,
  `Av_Top_Set_Num` int(11) DEFAULT NULL,
  `Base_Price` decimal(4,2) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Av_Allergen_Set_Num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `menu_ibfk_1` (`Size_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID`, `Size_ID`, `Av_Top_Set_Num`, `Base_Price`, `Available`, `Category`, `Av_Allergen_Set_Num`) VALUES
('Grande Coffee', 'Grande', 2, '3.50', 1, 'Hot Drink', 2),
('Grande Java Chip Frappuccino', 'Grande', 1, '5.25', 1, 'Frozen Drink', 2),
('Ham & Swiss Panini', 'NULL', 0, '5.50', 1, 'Sandwich', 1),
('Tall Coffee', 'Tall', 2, '3.25', 1, 'Hot Drink', 2),
('Tall Java Chip Frappuccino', 'Tall', 1, '4.75', 1, 'Frozen Drink', 2),
('Venti Coffee', 'Venti', 2, '4.00', 1, 'Hot Drink', 2),
('Venti Java Chip Frappuccino', 'Venti', 1, '5.75', 1, 'Frozen Drink', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `ID` int(11) NOT NULL,
  `Menu_ID` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total_Price` decimal(5,2) DEFAULT NULL,
  `Payment_Type` varchar(255) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `User_ID` varchar(255) DEFAULT NULL,
  `Ready_By` timestamp NULL DEFAULT NULL,
  `Time_Stamp` timestamp NULL DEFAULT NULL,
  `Speal_Instructions` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_history_ibfk_1` (`Menu_ID`),
  KEY `order_history_ibfk_2` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE IF NOT EXISTS `sizes` (
  `ID` varchar(255) NOT NULL,
  `Volume_In_Oz` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`ID`, `Volume_In_Oz`) VALUES
('Doppio', 2),
('Grande', 16),
('NULL', 0),
('Short', 8),
('Solo', 1),
('Tall', 12),
('Venti', 20);

-- --------------------------------------------------------

--
-- Table structure for table `toppings_info`
--

CREATE TABLE IF NOT EXISTS `toppings_info` (
  `ID` varchar(255) NOT NULL,
  `Price` decimal(4,2) DEFAULT NULL,
  `Calorie_Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toppings_info`
--

INSERT INTO `toppings_info` (`ID`, `Price`, `Calorie_Count`) VALUES
('2 Percent Milk', '0.00', 50),
('Almonds', '0.50', 40),
('Brown Sugar', '0.50', 5),
('Cinnamon', '10.00', 1),
('Expresso Shot', '0.75', 20),
('Grazed Almonds', '0.50', 10),
('Half and Half', '0.00', 100),
('Soy Milk', '0.00', 40),
('Spice', '2.00', 10),
('Walnuts', '0.50', 10),
('Whipped Cream', '0.75', 30),
('Whole Milk', '0.00', 70);

-- --------------------------------------------------------

--
-- Table structure for table `toppings_ordered`
--

CREATE TABLE IF NOT EXISTS `toppings_ordered` (
  `ID` varchar(255) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Topping_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `toppings_ordered_ibfk_1` (`Order_ID`),
  KEY `toppings_ordered_ibfk_2` (`Topping_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` varchar(255) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE IF NOT EXISTS `user_favorites` (
  `User_ID` varchar(255) DEFAULT NULL,
  `Menu_ID` varchar(255) DEFAULT NULL,
  `Special_Instructions` varchar(400) DEFAULT NULL,
  `Times_Ordered` int(11) DEFAULT NULL,
  KEY `user_favorites_ibfk_1` (`User_ID`),
  KEY `user_favorites_ibfk_2` (`Menu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergen_sets`
--
ALTER TABLE `allergen_sets`
  ADD CONSTRAINT `allergen_sets_ibfk_1` FOREIGN KEY (`Allergen_ID`) REFERENCES `allergens` (`ID`);

--
-- Constraints for table `available_topping_sets`
--
ALTER TABLE `available_topping_sets`
  ADD CONSTRAINT `available_topping_sets_ibfk_1` FOREIGN KEY (`Topping_ID`) REFERENCES `toppings_info` (`ID`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Size_ID`) REFERENCES `sizes` (`ID`);

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`ID`),
  ADD CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `toppings_ordered`
--
ALTER TABLE `toppings_ordered`
  ADD CONSTRAINT `toppings_ordered_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order_history` (`ID`),
  ADD CONSTRAINT `toppings_ordered_ibfk_2` FOREIGN KEY (`Topping_ID`) REFERENCES `toppings_info` (`ID`);

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

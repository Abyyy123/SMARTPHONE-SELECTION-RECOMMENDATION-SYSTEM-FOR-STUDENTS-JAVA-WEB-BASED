-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 07:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_smartphone`
--

CREATE TABLE `data_smartphone` (
  `Merk` varchar(150) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Ram` int(11) NOT NULL,
  `Memory Internal` int(11) NOT NULL,
  `Kamera` int(11) NOT NULL,
  `Baterai` int(11) NOT NULL,
  `Os` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_smartphone`
--

INSERT INTO `data_smartphone` (`Merk`, `Harga`, `Ram`, `Memory Internal`, `Kamera`, `Baterai`, `Os`) VALUES
('Infinix GT 20 Pro', 4365000, 12, 256, 108, 5000, 'Android'),
('Infinix Note 40 Pro', 3399000, 8, 256, 108, 5000, 'Android'),
('Iqoo Z9x', 3299000, 8, 256, 50, 6000, 'Android'),
('Oppo A60', 2599000, 8, 128, 50, 5000, 'Android'),
('Oppo A77s', 2499000, 8, 128, 50, 5000, 'Android'),
('Oppo A98', 3699000, 8, 256, 64, 5000, 'Android'),
('Pocco M6 Pro', 2799000, 8, 256, 64, 5000, 'Android'),
('Pocco X5 5g', 3499000, 6, 128, 64, 5000, 'Android'),
('Poco X6 5g', 3799000, 12, 256, 64, 5100, 'Android'),
('Redmi Note 13', 3199000, 8, 256, 64, 5000, 'Android'),
('Redmi Note 13', 3199000, 8, 256, 64, 5000, 'Android'),
('Samsung Galaxy A15 ', 3265000, 8, 256, 50, 5000, 'Android'),
('Samsung Galaxy A15 5g', 3265000, 8, 256, 50, 5000, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `normalisasi`
--

CREATE TABLE `normalisasi` (
  `Merk` varchar(150) NOT NULL,
  `Harga` double NOT NULL,
  `Ram` double NOT NULL,
  `Memory Internal` double NOT NULL,
  `Kamera` double NOT NULL,
  `Baterai` double NOT NULL,
  `Os` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `normalisasi`
--

INSERT INTO `normalisasi` (`Merk`, `Harga`, `Ram`, `Memory Internal`, `Kamera`, `Baterai`, `Os`) VALUES
('Infinix GT 20 Pro', 0.534, 1, 1, 1, 0.833, 'Android'),
('Infinix Note 40 Pro', 0.685, 0.667, 1, 1, 0.833, 'Android'),
('Iqoo Z9x', 0.706, 0.667, 1, 0.463, 1, 'Android'),
('Oppo A60', 0.896, 0.667, 0.5, 0.463, 0.833, 'Android'),
('Oppo A77s', 0.932, 0.667, 0.5, 0.463, 0.833, 'Android'),
('Oppo A98', 0.63, 0.667, 1, 0.593, 0.833, 'Android'),
('Pocco M6 Pro', 0.832, 0.667, 1, 0.593, 0.833, 'Android'),
('Pocco X5 5g', 0.666, 0.5, 0.5, 0.593, 0.833, 'Android'),
('Poco X6 5g', 0.613, 1, 1, 0.593, 0.85, 'Android'),
('Redmi Note 13', 0.728, 0.667, 1, 0.593, 0.833, 'Android'),
('Redmi Note 13', 0.728, 0.667, 1, 0.593, 0.833, 'Android'),
('Samsung Galaxy A15 ', 0.713, 0.667, 1, 0.463, 0.833, 'Android'),
('Samsung Galaxy A15 5g', 0.713, 0.667, 1, 0.463, 0.833, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(150) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Email`, `Password`) VALUES
('Aby', 'adinthyaaby@gmail.com', 'Abyadinthya123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

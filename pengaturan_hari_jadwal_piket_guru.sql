-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2019 at 04:59 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sia_integrasi_coba_4`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan_hari_jadwal_piket_guru`
--

CREATE TABLE `pengaturan_hari_jadwal_piket_guru` (
  `id_pengaturan` int(2) NOT NULL,
  `nama_hari` varchar(30) NOT NULL,
  `atribut` varchar(100) NOT NULL,
  `nilai` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaturan_hari_jadwal_piket_guru`
--

INSERT INTO `pengaturan_hari_jadwal_piket_guru` (`id_pengaturan`, `nama_hari`, `atribut`, `nilai`) VALUES
(1, 'senin', 'Senin', 1),
(2, 'selasa', 'Selasa', 0),
(3, 'rabu', 'Rabu', 0),
(4, 'kamis', 'Kamis', 0),
(5, 'jumat', 'Jumat', 0),
(6, 'sabtu', 'Sabtu', 0),
(7, 'minggu', 'Minggu', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengaturan_hari_jadwal_piket_guru`
--
ALTER TABLE `pengaturan_hari_jadwal_piket_guru`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaturan_hari_jadwal_piket_guru`
--
ALTER TABLE `pengaturan_hari_jadwal_piket_guru`
  MODIFY `id_pengaturan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

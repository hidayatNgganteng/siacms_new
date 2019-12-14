-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2019 at 11:23 AM
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
-- Table structure for table `pengaturan_jam_mengajar`
--

CREATE TABLE `pengaturan_jam_mengajar` (
  `id_pengaturan_jam_mengajar` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaturan_jam_mengajar`
--

INSERT INTO `pengaturan_jam_mengajar` (`id_pengaturan_jam_mengajar`, `nama`, `alias`, `status`) VALUES
(1, 'Nama', 'nama', 1),
(2, 'NIP', 'nip', 0),
(3, 'Golongan', 'golongan', 0),
(4, 'Jabatan', 'jabatan', 1),
(5, 'Ijazah', 'ijazah', 0),
(6, 'Mata Pelajaran', 'mata pelajaran', 1),
(7, 'Jam Mengajar per Minggu', 'jam mengajar per minggu', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengaturan_jam_mengajar`
--
ALTER TABLE `pengaturan_jam_mengajar`
  ADD PRIMARY KEY (`id_pengaturan_jam_mengajar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaturan_jam_mengajar`
--
ALTER TABLE `pengaturan_jam_mengajar`
  MODIFY `id_pengaturan_jam_mengajar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

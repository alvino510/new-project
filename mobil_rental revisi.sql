-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2021 at 09:52 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobil_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `usia` int(3) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama`, `alamat`, `usia`, `gender`, `no_telp`, `email`, `username`, `password`) VALUES
(1, 'alvin', 'jakarta', 19, 'pria', '098463523', 'alvin@email.com', 'alvin123', 'alvin123'),
(2, 'Farhan', 'Jl. Kamper', 19, 'Pria', '01294012', 'Yanto@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mobil`
--

CREATE TABLE `tbl_mobil` (
  `id_mobil` varchar(8) NOT NULL,
  `merek` varchar(55) NOT NULL,
  `tipe` varchar(55) NOT NULL,
  `warna` varchar(55) NOT NULL,
  `biaya` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mobil`
--

INSERT INTO `tbl_mobil` (`id_mobil`, `merek`, `tipe`, `warna`, `biaya`, `gambar`) VALUES
('B1234ARE', 'Honda', 'Civic 2004', 'Hitam', 500, 'CIVIC2004.jpg'),
('B2004ATW', 'Honda', 'Civic 2005', 'Putih', 255, 'CIVIC2005.jfif'),
('B2041ABC', 'Getek', 'Terbang', 'Hitam', 200, 'GETEK.jfif'),
('B2051ATK', 'Toyota', 'Voxy 2021', 'Putih', 600, 'VOXY2021.jpg'),
('B5678ASU', 'BMW', 'F22', 'Putih', 800, 'F22.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `no_ktp` varchar(12) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `alamat`, `no_telp`, `email`) VALUES
('PG001', '070118564', 'Yanto', 'jakarta', '06987463', 'rahel@email.com'),
('PG002', '067745653', 'jojo', 'morioh', '098654332', 'joestar@email.com'),
('PG003', '09876558', 'bastilla', 'jakarta', '01234564', 'bastilla@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trx`
--

CREATE TABLE `tbl_trx` (
  `id_trx` varchar(5) NOT NULL,
  `pelanggan_id` varchar(5) NOT NULL,
  `tanggal_sewa` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `mobil_id` varchar(8) NOT NULL,
  `biaya` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_trx`
--

INSERT INTO `tbl_trx` (`id_trx`, `pelanggan_id`, `tanggal_sewa`, `tanggal_selesai`, `mobil_id`, `biaya`) VALUES
('TR001', 'PG002', '2021-09-01', '2021-09-10', 'B1234ARE', 500),
('TR002', 'PG001', '2021-10-01', '2021-10-13', 'B5678ASU', 800),
('TR003', 'PG003', '2021-01-01', '2021-03-03', 'B2051ATK', 600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_mobil`
--
ALTER TABLE `tbl_mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tbl_trx`
--
ALTER TABLE `tbl_trx`
  ADD PRIMARY KEY (`id_trx`),
  ADD KEY `pelanggan_id` (`pelanggan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_trx`
--
ALTER TABLE `tbl_trx`
  ADD CONSTRAINT `tbl_trx_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `tbl_pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 12, 2022 at 07:14 AM
-- Server version: 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cf-cuaca`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuaca`
--

CREATE TABLE `cuaca` (
  `id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuaca`
--

INSERT INTO `cuaca` (`id`, `kode`, `nama`, `keterangan`) VALUES
(1, 'P001', 'Cerah', 'Cuaca ini terdapat beberapa awan putih bahkan sampai tidak ada di langit sehingga cahaya akan sampai ke tanah tanpa hambatan dan disarankan untuk tidak sering terpapar matahari karena akan menyebabkan kulit menjadi hitam.'),
(2, 'P002', 'Akan Hujan', 'Cuaca ini diperkirakan akan terjadinya hujan diakibatkan beberapa faktor seperti angin kencang dan juga awan tebal dan hitam.'),
(3, 'P003', 'Hujan', 'Cuaca ini disebabkan oleh air yang keluar dari awan hitam tebal kadang juga disertai dengan suara petir yang disebut dengan hujan.'),
(6, 'P004', 'Mendung', 'Cuaca ini biasanya terdapat awan hitam yang menggumpal dilangit tetapi belum sampai turun hujan');

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id` int(11) NOT NULL,
  `kelompok_gejala_id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `kelompok_gejala_id`, `kode`, `keterangan`) VALUES
(3, 1, 'G001', 'Awan Tipis'),
(4, 1, 'G002', 'Awan Tebal Hitam'),
(5, 1, 'G003', 'Angin Sedang'),
(7, 1, 'G004', 'Angin Kencang'),
(8, 1, 'G005', 'Keluar Suara Petir'),
(9, 2, 'G006', 'Suhu Panas'),
(10, 2, 'G007', 'Suhu Dingin'),
(11, 2, 'G008', 'Suhu Sedang');

-- --------------------------------------------------------

--
-- Table structure for table `gejala_cuaca`
--

CREATE TABLE `gejala_cuaca` (
  `id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `cuaca_id` int(11) NOT NULL,
  `md` float NOT NULL,
  `mb` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala_cuaca`
--

INSERT INTO `gejala_cuaca` (`id`, `gejala_id`, `cuaca_id`, `md`, `mb`) VALUES
(3, 3, 1, 0.7, 0.3),
(4, 8, 3, 0.8, 0.2),
(5, 9, 1, 0.9, 0.1),
(9, 7, 2, 0.7, 0.3),
(10, 4, 2, 0.75, 0.25),
(11, 11, 2, 0.5, 0.5),
(12, 10, 2, 0.5, 0.5),
(15, 11, 1, 0.75, 0.25);

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_gejala`
--

CREATE TABLE `kelompok_gejala` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok_gejala`
--

INSERT INTO `kelompok_gejala` (`id`, `nama`, `keterangan`) VALUES
(1, 'Gejala Iklim', '-'),
(2, 'Gejala Temperature', '-');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Fadilah Riczky');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuaca`
--
ALTER TABLE `cuaca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelompok_gejala_id` (`kelompok_gejala_id`);

--
-- Indexes for table `gejala_cuaca`
--
ALTER TABLE `gejala_cuaca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gejala_id` (`gejala_id`),
  ADD KEY `penyakit_id` (`cuaca_id`);

--
-- Indexes for table `kelompok_gejala`
--
ALTER TABLE `kelompok_gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuaca`
--
ALTER TABLE `cuaca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `gejala_cuaca`
--
ALTER TABLE `gejala_cuaca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `kelompok_gejala`
--
ALTER TABLE `kelompok_gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `gejala`
--
ALTER TABLE `gejala`
  ADD CONSTRAINT `gejala_ibfk_1` FOREIGN KEY (`kelompok_gejala_id`) REFERENCES `kelompok_gejala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gejala_cuaca`
--
ALTER TABLE `gejala_cuaca`
  ADD CONSTRAINT `gejala_cuaca_ibfk_1` FOREIGN KEY (`gejala_id`) REFERENCES `gejala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gejala_cuaca_ibfk_2` FOREIGN KEY (`cuaca_id`) REFERENCES `cuaca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

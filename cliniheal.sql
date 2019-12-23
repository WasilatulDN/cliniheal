-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 09:14 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cliniheal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `nama`, `email`, `username`, `password`) VALUES
(1, 'anda', 'anda@email.com', 'iniadmin', '$2y$08$cCtuYUpkcUlsOE1ia21sdOvoRbGDEb2F/PcfyOetCajEyC9TU5ElS');

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `idAntrian` int(11) NOT NULL,
  `idPasien` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`idAntrian`, `idPasien`, `status`) VALUES
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `apoteker`
--

CREATE TABLE `apoteker` (
  `idApoteker` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `str` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apoteker`
--

INSERT INTO `apoteker` (`idApoteker`, `nama`, `str`, `email`, `username`, `password`) VALUES
(1, 'dia', '123', 'dia@email.com', 'iniapoteker', '$2y$08$WEVBY05Tbm03bXR1YVI2VuScHcKfa3r7OqVzqhWXUcHHKErDkRcau');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `idDokter` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `str` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`idDokter`, `nama`, `str`, `email`, `username`, `password`) VALUES
(1, 'saya', '123', 'saya@email.com', 'inidokter', '$2y$08$VlZ2RVRXSi9UN2tsSFduO.dETLBuaFo2nqcKhYJdV/hozuO27CcBq');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idPasien` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jkel` varchar(20) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `tlp` varchar(20) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`idPasien`, `nama`, `jkel`, `tgllahir`, `alamat`, `tlp`, `nik`) VALUES
(1, 'putri', 'Pe', '1998-10-10', 'gebang', '087', '123');

-- --------------------------------------------------------

--
-- Table structure for table `rekammedis`
--

CREATE TABLE `rekammedis` (
  `idRekamMedis` int(11) NOT NULL,
  `idDokter` int(11) NOT NULL,
  `idPasien` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `keluhan` varchar(200) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `prognosis` varchar(200) DEFAULT NULL,
  `anamnesa` varchar(200) DEFAULT NULL,
  `obyektif` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekammedis`
--

INSERT INTO `rekammedis` (`idRekamMedis`, `idDokter`, `idPasien`, `tanggal`, `keluhan`, `diagnosis`, `prognosis`, `anamnesa`, `obyektif`) VALUES
(1, 1, 1, '2019-12-11', 'aaaaa', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `idResep` int(11) NOT NULL,
  `idRekamMedis` int(11) NOT NULL,
  `resep` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`idResep`, `idRekamMedis`, `resep`, `status`) VALUES
(1, 1, 'bbb', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`idAntrian`),
  ADD KEY `fk_antrian_pasien` (`idPasien`);

--
-- Indexes for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`idApoteker`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`idDokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idPasien`);

--
-- Indexes for table `rekammedis`
--
ALTER TABLE `rekammedis`
  ADD PRIMARY KEY (`idRekamMedis`),
  ADD KEY `fk_rm_pasien` (`idPasien`),
  ADD KEY `fk_rm_dokter` (`idDokter`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`idResep`),
  ADD KEY `fk_resep_rm` (`idRekamMedis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `idAntrian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `apoteker`
--
ALTER TABLE `apoteker`
  MODIFY `idApoteker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `idDokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `idPasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rekammedis`
--
ALTER TABLE `rekammedis`
  MODIFY `idRekamMedis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `idResep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `fk_antrian_pasien` FOREIGN KEY (`idPasien`) REFERENCES `pasien` (`idPasien`);

--
-- Constraints for table `rekammedis`
--
ALTER TABLE `rekammedis`
  ADD CONSTRAINT `fk_rm_dokter` FOREIGN KEY (`idDokter`) REFERENCES `dokter` (`idDokter`),
  ADD CONSTRAINT `fk_rm_pasien` FOREIGN KEY (`idPasien`) REFERENCES `pasien` (`idPasien`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `fk_resep_rm` FOREIGN KEY (`idRekamMedis`) REFERENCES `rekammedis` (`idRekamMedis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

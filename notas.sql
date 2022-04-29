-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2022 at 07:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notas`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `idnotes` int(11) DEFAULT NULL,
  `notes_idnotes` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `typeFile` varchar(45) DEFAULT NULL,
  `creationDate` datetime NOT NULL,
  `modificationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `idnotes` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `creationDate` datetime DEFAULT current_timestamp(),
  `status` tinyint(2) DEFAULT NULL,
  `iduser` int(11) NOT NULL,
  `icon` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restorePass`
--

CREATE TABLE `restorePass` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `token` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(3) UNSIGNED ZEROFILL DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `modificationDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`iduser`, `name`, `password`, `status`, `creationDate`, `modificationDate`) VALUES
(1, 'Miguel', '123', 001, '2022-02-20 17:58:12', '2022-02-20 17:58:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD KEY `fk_message_notes1` (`notes_idnotes`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`idnotes`),
  ADD KEY `fk_notes_users1` (`iduser`);

--
-- Indexes for table `restorePass`
--
ALTER TABLE `restorePass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_restorePass_users1` (`iduser`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `idnotes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restorePass`
--
ALTER TABLE `restorePass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_notes1` FOREIGN KEY (`notes_idnotes`) REFERENCES `notes` (`idnotes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_notes_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restorePass`
--
ALTER TABLE `restorePass`
  ADD CONSTRAINT `fk_restorePass_users1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

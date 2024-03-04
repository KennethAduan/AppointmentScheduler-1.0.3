-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 02:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointmentscheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id_canceler` int(11) DEFAULT NULL,
  `id_provider` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `id_invoice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `corporate_customers`
--

CREATE TABLE `corporate_customers` (
  `id_customer` int(11) NOT NULL,
  `vat_number` varchar(256) DEFAULT NULL,
  `company_name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id_customer`) VALUES
(13),
(26),
(27),
(28),
(29),
(30),
(31),
(32);

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` int(11) NOT NULL,
  `exchange_status` varchar(256) DEFAULT NULL,
  `id_appointment_requestor` int(11) DEFAULT NULL,
  `id_appointment_requested` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `number` varchar(256) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `issued` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `message` text DEFAULT NULL,
  `id_author` int(11) DEFAULT NULL,
  `id_appointment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id_provider`) VALUES
(5),
(7),
(12),
(14),
(19),
(20),
(21),
(22),
(23),
(24),
(33);

-- --------------------------------------------------------

--
-- Table structure for table `retail_customers`
--

CREATE TABLE `retail_customers` (
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `retail_customers`
--

INSERT INTO `retail_customers` (`id_customer`) VALUES
(6),
(8),
(9),
(10),
(13),
(26),
(27),
(28),
(29),
(30),
(31),
(32);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_PROVIDER'),
(3, 'ROLE_CUSTOMER'),
(4, 'ROLE_CUSTOMER_CORPORATE'),
(5, 'ROLE_CUSTOMER_RETAIL');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `mobile`, `street`, `city`, `postcode`) VALUES
(1, 'admin', '$2a$10$EqKcp1WFKVQISheBxkQJoOqFbsWDzGJXRz/tjkGq85IZKJJ1IipYi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'admission_office', '$2a$10$AEjYMyb0qNnxmQ/zYm4pfu.j4rTNF7rcDaI0m54RT.bWR6p4vb0bS', 'Admission', 'Office', 'admission_office@philsca.com', '09000000000', 'PHILSCA', NULL, NULL),
(13, 'shed', '$2a$10$ZVK7epcedqvTUhGcN2oa5e1E0X5S9NitoanQZ6Kp4NZHEVMXxkSKi', 'Princess Shed', 'Sambo', 'samboprincessshed@gmail.com', '09292052381', 'Villamor, Pasay City', NULL, NULL),
(19, 'collecting_office', '$2a$10$4WPl.1IKngzR5pUTn7YKfe1sNoafQC1FGSQ39brNhB5RYOXYfwZ2u', 'Collecting', 'Office', 'collecting_office@philsca.com', '09000000000', 'Villamor, Pasay', NULL, NULL),
(20, 'guidance_office', '$2a$10$8sQYWjJKfh1urUp.mLoBjeRV048WjGy5CMrmF5vNdrCaqgEtcpED6', 'Guidance Services', 'Unit', 'guidance_office@philsca.com', '09000000000', 'Villamor, Pasay', NULL, NULL),
(21, 'amt_registrar', '$2a$10$xAmnLG0fy993wPBPhPqGcuaeFKO.QCjPL6USasuQa4Nk1xMhCKgtm', 'AMT - Registrar', 'Office', 'amt_registrar@philsca.com', '09000000000', 'Villamor, Pasay', NULL, NULL),
(22, 'ilas_registrar', '$2a$10$o5fRVV.Dl1WwwPMN.X1.JudBgJrUNvXIIhj.wx8uBjSHLVQ6/eCJ.', 'ILAS - Registrar', 'Office', 'ilas_registrar@philsca.com', '09000000000', 'Villamor, Pasay', NULL, NULL),
(23, 'ics_registrar', '$2a$10$BH7inaSS5gXbtQo1FH75reHZTnUW1nF6xIaeXhVIU9rMwE5nrERK2', 'ICS - Registrar', 'Office', 'ics_registrar@philsca.com', '09000000000', 'Villamor, Pasay', NULL, NULL),
(24, 'hr_philsca', '$2a$10$xyT5zY9puEUCNHzhod3pYOKBx5BUczbwSUjR9yp8jcQun4gTE5PJ2', 'Human Resource', 'Management Services Division', 'hr_office@philsca.com', '09000000000', 'Villamor, Pasay City', NULL, NULL),
(28, 'alex', '$2a$10$58RHuA14i9Y7uHHjzn/0xuRvCyaK4DS7k3WQeZhgDBTw.xoC.5y2a', 'Alexandrea', 'Mendoza', 'alexandrea22m@gmail.com', '09090909090', 'Villamor, Pasay', NULL, NULL),
(29, 'rox', '$2a$10$.P7Qes.mkz0TcMckqgKgjOPuvwqlNq6oQOanuY5YhC6Fe414./S3G', 'Roxane Jean', 'Glorioso', 'gloriosoroxane21@gmail.com', '09090909090', 'Villamor, Pasay', NULL, NULL),
(30, 'kaye', '$2a$10$IpaCvJK.0AYJzi8.lyhHsO6YUTbqmE9mdV511HmCB59WOmvxcEg92', 'Kaye Shaira', 'Verdera', 'kaye10verdera@gmail.com', '09090909090', 'Villamor, Pasay', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(5, 2),
(6, 3),
(6, 5),
(7, 2),
(8, 3),
(8, 5),
(9, 3),
(9, 5),
(10, 3),
(10, 5),
(12, 2),
(13, 3),
(13, 5),
(14, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(26, 3),
(26, 5),
(27, 3),
(27, 5),
(28, 3),
(28, 5),
(29, 3),
(29, 5),
(30, 3),
(30, 5),
(31, 3),
(31, 5),
(32, 3),
(32, 5),
(33, 2);

-- --------------------------------------------------------

--
-- Table structure for table `working_plans`
--

CREATE TABLE `working_plans` (
  `id_provider` int(11) NOT NULL,
  `monday` text DEFAULT NULL,
  `tuesday` text DEFAULT NULL,
  `wednesday` text DEFAULT NULL,
  `thursday` text DEFAULT NULL,
  `friday` text DEFAULT NULL,
  `saturday` text DEFAULT NULL,
  `sunday` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `working_plans`
--

INSERT INTO `working_plans` (`id_provider`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`) VALUES
(5, '{\"workingHours\":{\"start\":[10,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[10,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[8,30],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[8,30],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(7, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[11,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[11,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(12, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(14, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(19, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(20, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(21, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[12,50],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[12,50],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[7,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[7,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(22, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[9,5],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[9,5],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(23, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[12,5],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[12,5],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[9,5],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[9,5],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(24, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}'),
(33, '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}', '{\"workingHours\":{\"start\":[6,0],\"end\":[18,0]},\"breaks\":[],\"timePeroidsWithBreaksExcluded\":[{\"start\":[6,0],\"end\":[18,0]}]}');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `target` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `name`, `duration`, `price`, `editable`, `target`, `description`) VALUES
(4, 'Entrance Exam Schedule (Freshmen and Transferees)', 10, 0.00, 0, 'retail', 'Online Application for College Admission Test (PhilSCAAT)\r\n*Requirements*\r\n1. Online Application\r\n2. Senior High School Card (for Transferees) Transcript of Records (for Freshmen)\r\n3. Certificate of Good Moral Character\r\n4. 1x1 picture\r\n5. Honorable Dismissal (for Transfewrees)\r\n6. Ishihara Test Result (BSAT, Aero, AAMT AAET & BS AvComm'),
(5, 'Entrance Exam Schedule (for Foreign Students)', 25, 500.00, 0, 'retail', 'Application for the Entrance Examination of Foreign Students\r\n*Requirements*\r\n1. Online Transcript of Records/Transfer Credentials;\r\n2. Student Personal History Statement\r\n3. Affidavit of Support\r\n4. Alien Certificate of Registration (ACR)\r\n5. Passport\r\n6. *Proceed to Collecting Office for the payment of PHP 500*'),
(6, 'Claim for Refund', 11, 0.00, 0, 'retail', ''),
(7, 'Claiming of Checks', 5, 0.00, 0, 'retail', 'Provides the employees/suppliers of the basic documents for their Salary and other Claims.\r\n*Requirements*\r\n1. Valid ID\'s\r\n2. SPA / Notarized Authorization (for suppliers)'),
(8, 'Certificate of Good Moral Character', 5, 50.00, 0, 'retail', 'Providing the students of the basic documents for their personal and legal purposes.\r\n*Requirements*\r\n1. Request Form\r\n2. Documentary Stamp\r\n\r\n**Note: Releasing of CGMC (Certificate of Good Moral Character) is estimated in total of 3 days, 19 minutes**'),
(9, 'Transcript of Records', 5, 75.00, 0, 'retail', 'Application for Scholastic Records\r\n*Requirements*\r\n1. Fill-up Registrar\'s Form No 25\r\n2. Proof of Payment (if applicable)\r\n3. Complete credentials & 2x2 latest picture with name\r\n4. 6 pieces Documentary Stamps'),
(10, 'Diploma, Evaluation Sheet, Certifications and other Credentials', 5, 80.00, 0, 'retail', 'Application for Scholastic Records\r\n*Requirements*\r\n1. Fill-up Registrar\'s Form No 25\r\n2. Proof of Payment (if applicable)\r\n3. Complete credentials & 2x2 latest picture with name\r\n4. 6 pieces Documentary Stamps'),
(11, 'Certificate of Employment', 30, 50.00, 0, 'retail', 'Process of Personnel Requests\r\n*Requirements*\r\n1. HRM Request Form No. 16\r\n2. Official Receipt'),
(12, 'Certificate of Grades', 5, 50.00, 0, 'retail', 'Process of Certificate of Grades\r\n*Requirements*\r\n1. School ID or COR'),
(13, 'Certificate of Registration', 5, 0.00, 0, 'retail', 'Process of Certificate of Registration\r\n*Requirements*\r\n1. School ID');

-- --------------------------------------------------------

--
-- Table structure for table `works_providers`
--

CREATE TABLE `works_providers` (
  `id_user` int(11) NOT NULL,
  `id_work` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `works_providers`
--

INSERT INTO `works_providers` (`id_user`, `id_work`) VALUES
(12, 4),
(12, 5),
(14, 4),
(14, 5),
(19, 6),
(19, 7),
(20, 8),
(21, 9),
(21, 10),
(21, 12),
(21, 13),
(22, 9),
(22, 10),
(22, 12),
(22, 13),
(23, 9),
(23, 10),
(23, 12),
(23, 13),
(24, 11),
(33, 4),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(33, 10),
(33, 11),
(33, 12),
(33, 13),
(33, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_canceler` (`id_canceler`),
  ADD KEY `id_provider` (`id_provider`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_work` (`id_work`),
  ADD KEY `id_invoice` (`id_invoice`);

--
-- Indexes for table `corporate_customers`
--
ALTER TABLE `corporate_customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_appointment_requestor` (`id_appointment_requestor`),
  ADD KEY `id_appointment_requested` (`id_appointment_requested`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_author` (`id_author`),
  ADD KEY `id_appointment` (`id_appointment`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id_provider`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Indexes for table `retail_customers`
--
ALTER TABLE `retail_customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FK_ROLE_idx` (`role_id`);

--
-- Indexes for table `working_plans`
--
ALTER TABLE `working_plans`
  ADD PRIMARY KEY (`id_provider`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works_providers`
--
ALTER TABLE `works_providers`
  ADD PRIMARY KEY (`id_user`,`id_work`),
  ADD KEY `id_work` (`id_work`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_invoices` FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_canceler` FOREIGN KEY (`id_canceler`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_provider`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_works` FOREIGN KEY (`id_work`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `corporate_customers`
--
ALTER TABLE `corporate_customers`
  ADD CONSTRAINT `FK_corporate_customer_user` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `FK_customer_user` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`);

--
-- Constraints for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD CONSTRAINT `FK_exchange_appointment_requested` FOREIGN KEY (`id_appointment_requested`) REFERENCES `appointments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_exchange_appointment_requestor` FOREIGN KEY (`id_appointment_requestor`) REFERENCES `appointments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_notes_appointment` FOREIGN KEY (`id_appointment`) REFERENCES `appointments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_notes_author` FOREIGN KEY (`id_author`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK_notification_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `FK_provider_user` FOREIGN KEY (`id_provider`) REFERENCES `users` (`id`);

--
-- Constraints for table `retail_customers`
--
ALTER TABLE `retail_customers`
  ADD CONSTRAINT `FK_retail_customer_user` FOREIGN KEY (`id_customer`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `working_plans`
--
ALTER TABLE `working_plans`
  ADD CONSTRAINT `FK_appointments_provider` FOREIGN KEY (`id_provider`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `works_providers`
--
ALTER TABLE `works_providers`
  ADD CONSTRAINT `works_providers_users_provider` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_providers_works` FOREIGN KEY (`id_work`) REFERENCES `works` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

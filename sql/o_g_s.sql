-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 03:17 PM
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
-- Database: `o_g_s`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Arcade', 'Action-packed games with thrilling adventures.'),
(2, 'Strategy', 'Games requiring tactical and strategic thinking.'),
(3, 'Puzzle', 'Games involving problem-solving and logic.'),
(4, 'Adventure', 'Story-driven games with exploration elements.'),
(7, 'Arcade', 'Live your life gaming'),
(9, 'dfggd', 'fffff');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `text`, `date`, `user_id`, `game_id`) VALUES
(8, 'Amazing game', '2024-10-03', 8, 53),
(9, 'exciting game', '2024-10-03', 8, 53);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `message`, `date`) VALUES
(2, 'sashini', 'sashi@gmail.com', 'hello im sashini', '2024-10-10 00:00:00'),
(3, 'sashini', 'sashi@gmail.com', 'hellooooooo', '2024-10-03 00:00:00'),
(4, 'tharushi', 'tharu@gmail.com', 'hiiiiiiiii', '2024-10-02 00:00:00'),
(5, 'sanduni', 'sandu@gmail.com', 'morrree gamess', '2024-10-09 00:00:00'),
(6, 'malshi', 'malshi@gmail.com', 'mashiiiiiiiii', '2024-10-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `release_date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `developer_name` varchar(50) NOT NULL,
  `cost_per_item` double NOT NULL,
  `game_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `title`, `release_date`, `description`, `category_id`, `developer_name`, `cost_per_item`, `game_image`) VALUES
(26, 'Rogue Waters', '2024-10-02', ' tactical, turn-based rogue-lite set in a pirate world overtaken by a terrible curse. Gather your ragtag crew of rogues and grow them into fierce pirates.', 1, 'Ice Code Games', 4352, 'game3.jpg'),
(27, 'Fruit slice', '2024-10-01', 'Cut some fruits', 2, 'unity', 324322, 'game4.jpg'),
(28, 'Pacman', '2024-10-09', 'Catch to win or loose', 4, 'Holagames', 23242, 'game5.jpg'),
(30, 'flappy Bird', '2024-10-08', 'dont drop the bird', 2, 'Google', 324222, 'game6.jpg'),
(31, 'Temple run', '2024-10-08', 'run run run!! hellow', 1, 'Unix', 32432, 'temple.jpg'),
(32, 'Deathly games', '2024-10-08', 'Kill the enemies', 4, 'AGT', 4322, 'slider3.jpg'),
(51, 'Zombie ', '2024-10-02', 'Escape if you can!!', 4, 'Zonal', 123213, 'zombie.jpg'),
(52, 'Looks Out', '2024-10-03', 'look out', 4, 'Heshas', 122322, 'game9.jpg'),
(53, 'Sticky man', '2024-10-02', 'Stick the man', 2, 'Stixs', 324222, 'game10.jpg'),
(54, 'penalty shooters 4', '2024-10-09', 'Strike a goal!!', 4, 'unix', 234422, 'game11.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `uname` varchar(50) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `upwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`uname`, `uemail`, `upwd`) VALUES
('eshan sankalpa', 'eshan@gmail.com', '123eshan'),
('Eshan Harshana', 'eshan@gmail.com', 'esahn'),
('Sanduni Deshapriya', 'sanduni@gmail.com', '1234'),
('Lakshi Senadeera', 'lakshi@gmail.com', 'laki'),
('Sashini geshani', 'sashi@gmail.com', 'sashi'),
('Tharushi Sandunika', 'tharu@gmail.com', 'tharu'),
('99887766', 'mnhghfgfh@h', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `phone`, `password`) VALUES
(5, 'Sashini geshani', 'sashi@gmail.com', '0711232765', 'sashi'),
(7, 'Sanduni Deshapriya', 'sanduni@gmail.com', '071232178', '1234'),
(8, 'Lakshi Senadeera', 'laki@gmail.com', '0711309860', 'laki'),
(9, 'malshi ', 'malshi@gmail.com', '0711232890', 'malshi'),
(11, 'Tharushi Sandunika', 'tharu@gmail.com', '0712345678', 'tharu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

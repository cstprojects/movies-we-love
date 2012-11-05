-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2012 at 12:28 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `bridge_movies_directors`
--

CREATE TABLE IF NOT EXISTS `bridge_movies_directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `directors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directors_id` (`directors_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_movies_genres`
--

CREATE TABLE IF NOT EXISTS `bridge_movies_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id` (`genres_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_movies_stars`
--

CREATE TABLE IF NOT EXISTS `bridge_movies_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `stars_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_directors`
--

CREATE TABLE IF NOT EXISTS `bridge_users_directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `directors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directors_id` (`directors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_genres`
--

CREATE TABLE IF NOT EXISTS `bridge_users_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id` (`genres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_movies`
--

CREATE TABLE IF NOT EXISTS `bridge_users_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `watchlist` int(11) DEFAULT NULL,
  `watched` int(11) DEFAULT NULL,
  `favorited` int(11) DEFAULT NULL,
  `recommended` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE IF NOT EXISTS `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `self` tinytext,
  `alternate` tinytext,
  `similar` tinytext,
  `cast` tinytext,
  `clips` tinytext,
  `reviews` tinytext,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `abridged_cast` tinytext,
  `links` tinytext,
  `mpaa_rating` varchar(50) DEFAULT NULL,
  `posters` tinytext,
  `ratings` tinytext,
  `release_dates` tinytext,
  `runtime` varchar(50) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `imdb_id` varchar(50) DEFAULT NULL,
  `genres` tinytext,
  `synopsis` tinytext,
  `critics_consensus` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `posters`
--

CREATE TABLE IF NOT EXISTS `posters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `detailed` tinytext,
  `original` tinytext,
  `profile` tinytext,
  `thumbnail` tinytext,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE IF NOT EXISTS `stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(500) DEFAULT NULL,
  `star_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bridge_movies_directors`
--
ALTER TABLE `bridge_movies_directors`
  ADD CONSTRAINT `bridge_movies_directors_ibfk_1` FOREIGN KEY (`directors_id`) REFERENCES `directors` (`id`);

--
-- Constraints for table `bridge_movies_genres`
--
ALTER TABLE `bridge_movies_genres`
  ADD CONSTRAINT `bridge_movies_genres_ibfk_1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `bridge_movies_stars`
--
ALTER TABLE `bridge_movies_stars`
  ADD CONSTRAINT `bridge_movies_stars_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `bridge_users_directors`
--
ALTER TABLE `bridge_users_directors`
  ADD CONSTRAINT `bridge_users_directors_ibfk_1` FOREIGN KEY (`directors_id`) REFERENCES `directors` (`id`);

--
-- Constraints for table `bridge_users_genres`
--
ALTER TABLE `bridge_users_genres`
  ADD CONSTRAINT `bridge_users_genres_ibfk_1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `bridge_users_movies`
--
ALTER TABLE `bridge_users_movies`
  ADD CONSTRAINT `bridge_users_movies_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `posters`
--
ALTER TABLE `posters`
  ADD CONSTRAINT `posters_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

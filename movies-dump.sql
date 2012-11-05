-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2012 at 07:06 AM
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
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `directors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directors_id` (`directors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bridge_movies_directors`
--

INSERT INTO `bridge_movies_directors` (`id`, `movies_id`, `directors_id`) VALUES
(84, 145, 86),
(85, 146, 87),
(86, 147, 88),
(87, 148, 89),
(88, 149, 90);

-- --------------------------------------------------------

--
-- Table structure for table `bridge_movies_genres`
--

CREATE TABLE IF NOT EXISTS `bridge_movies_genres` (
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id` (`genres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bridge_movies_genres`
--

INSERT INTO `bridge_movies_genres` (`id`, `movies_id`, `genres_id`) VALUES
(184, 145, 187),
(185, 145, 188),
(186, 146, 189),
(187, 146, 190),
(188, 147, 187);

-- --------------------------------------------------------

--
-- Table structure for table `bridge_movies_stars`
--

CREATE TABLE IF NOT EXISTS `bridge_movies_stars` (
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `stars_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_directors`
--

CREATE TABLE IF NOT EXISTS `bridge_users_directors` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `directors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directors_id` (`directors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_genres`
--

CREATE TABLE IF NOT EXISTS `bridge_users_genres` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id` (`genres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_users_movies`
--

CREATE TABLE IF NOT EXISTS `bridge_users_movies` (
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `watchlist` int(11) DEFAULT NULL,
  `watched` int(11) DEFAULT NULL,
  `favorited` int(11) DEFAULT NULL,
  `recommended` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE IF NOT EXISTS `directors` (
  `id` int(11) NOT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `full_name`) VALUES
(86, 'David Brooks'),
(87, 'Amy Heckerling'),
(88, 'Bryan Singer'),
(89, 'Bruce Pittman'),
(90, 'Gene Kelly');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL,
  `genre_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`) VALUES
(187, 'Mystery & Suspense'),
(188, 'Horror'),
(189, 'Comedy'),
(190, 'Romance'),
(191, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `self` tinytext,
  `alternate` tinytext,
  `similar` tinytext,
  `cast` tinytext,
  `clips` tinytext,
  `reviews` tinytext,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `movies_id`, `self`, `alternate`, `similar`, `cast`, `clips`, `reviews`) VALUES
(107, 146, 'http://api.rottentomatoes.com/api/public/v1.0/movies/771247665.json', 'http://www.rottentomatoes.com/m/vamps_2011/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/771247665/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/771247665/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/771247665/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/771247665/reviews.json'),
(108, 147, 'http://api.rottentomatoes.com/api/public/v1.0/movies/770671940.json', 'http://www.rottentomatoes.com/m/valkyrie/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/770671940/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/770671940/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/770671940/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/770671940/reviews.json'),
(109, 148, 'http://api.rottentomatoes.com/api/public/v1.0/movies/60559090.json', 'http://www.rottentomatoes.com/m/hello_mary_lou_prom_night_2/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/60559090/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/60559090/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/60559090/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/60559090/reviews.json'),
(110, 149, 'http://api.rottentomatoes.com/api/public/v1.0/movies/9442.json', 'http://www.rottentomatoes.com/m/1009483-hello_dolly/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9442/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9442/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9442/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9442/reviews.json');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_id`, `abridged_cast`, `links`, `mpaa_rating`, `posters`, `ratings`, `release_dates`, `runtime`, `title`, `year`, `imdb_id`, `genres`, `synopsis`, `critics_consensus`) VALUES
(146, 771247665, '[{"name":"Alicia Silverstone","id":"162662764","characters":["Goody"]},{"name":"Krysten Ritter","id":"770688427","characters":["Stacy"]},{"name":"Sigourney Weaver","id":"162660903","characters":["Cisserus"]},{"name":"Dan Stevens","id":"770698532","charact', 'link', 'PG-13', '{"thumbnail":"http://content8.flixster.com/movie/11/16/03/11160382_mob.jpg","profile":"http://content8.flixster.com/movie/11/16/03/11160382_pro.jpg","detailed":"http://content8.flixster.com/movie/11/16/03/11160382_det.jpg","original":"http://content8.flix', '{"critics_score":-1,"audience_score":85}', '{"theater":"2012-11-02","dvd":"2012-11-13"}', '93', 'Vamps', '2012', '1545106', '["Comedy","Romance"]', 'Goody (Silverstone) and Stacy (Krysten Ritter) are addicted to the night life, clubbing, hooking up and always looking for the next thrill, all the while keeping a big a secret-they happen to be modern-day vampires. But even with lifetimes of dating exper', ''),
(147, 770671940, '[{"name":"Tom Cruise","id":"162652763","characters":["Col. Claus von Stauffenberg"]},{"name":"Kenneth Branagh","id":"162659680","characters":["Major-Gen. Henning von Tresckow"]},{"name":"Bill Nighy","id":"162652300","characters":["Gen. Friedrich Olbricht"', 'link', 'PG-13', '{"thumbnail":"http://content9.flixster.com/movie/10/86/48/10864803_mob.jpg","profile":"http://content9.flixster.com/movie/10/86/48/10864803_pro.jpg","detailed":"http://content9.flixster.com/movie/10/86/48/10864803_det.jpg","original":"http://content9.flix', '{"critics_rating":"Fresh","critics_score":61,"audience_rating":"Upright","audience_score":66}', '{"theater":"2008-12-25","dvd":"2009-05-19"}', '120', 'Valkyrie', '2008', '0985699', '["Mystery & Suspense","Drama"]', '', 'Given the subject matter, Valkyrie could have been an outstanding historical thriller, but settles for being a mildly entertaining, but disposable yarn.'),
(148, 60559090, '[{"name":"Michael Ironside","id":"162713567","characters":["Bill Nordham"]},{"name":"Wendy Lyon","id":"364601489","characters":["Vicki Carpenter"]},{"name":"Lisa Schrage","id":"364601492","characters":["Mary Lou Maloney"]},{"name":"Michael Evans","id":"77', 'link', 'R', '{"thumbnail":"http://content6.flixster.com/movie/20/86/04/2086048_mob.jpg","profile":"http://content6.flixster.com/movie/20/86/04/2086048_pro.jpg","detailed":"http://content6.flixster.com/movie/20/86/04/2086048_det.jpg","original":"http://content6.flixste', '{"critics_rating":"Rotten","critics_score":38,"audience_rating":"Spilled","audience_score":37}', '{"theater":"1987-10-01","dvd":"1999-01-12"}', '97', 'Hello Mary Lou: Prom Night II', '1987', '0093176', '["Horror"]', '', ''),
(149, 9442, '[{"name":"Barbra Streisand","id":"162655994","characters":["Dolly Levi"]},{"name":"Walter Matthau","id":"162656073","characters":["Horace Vandergelder"]},{"name":"Michael Crawford","id":"162657495","characters":["Cornelius Hackl"]},{"name":"Louis Armstron', 'link', 'G', '{"thumbnail":"http://content7.flixster.com/movie/11/16/47/11164741_mob.jpg","profile":"http://content7.flixster.com/movie/11/16/47/11164741_pro.jpg","detailed":"http://content7.flixster.com/movie/11/16/47/11164741_det.jpg","original":"http://content7.flix', '{"critics_rating":"Rotten","critics_score":47,"audience_rating":"Upright","audience_score":74}', '{"theater":"1969-12-16","dvd":"2003-08-19"}', '146', 'Hello, Dolly!', '1969', '0064418', '["Musical & Performing Arts","Classics","Comedy"]', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `posters`
--

CREATE TABLE IF NOT EXISTS `posters` (
  `id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `detailed` tinytext,
  `original` tinytext,
  `profile` tinytext,
  `thumbnail` tinytext,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posters`
--

INSERT INTO `posters` (`id`, `movies_id`, `detailed`, `original`, `profile`, `thumbnail`) VALUES
(103, 146, 'http://content8.flixster.com/movie/11/16/03/11160382_det.jpg', 'http://content8.flixster.com/movie/11/16/03/11160382_ori.jpg', 'http://content8.flixster.com/movie/11/16/03/11160382_pro.jpg', 'http://content8.flixster.com/movie/11/16/03/11160382_mob.jpg'),
(104, 147, 'http://content9.flixster.com/movie/10/86/48/10864803_det.jpg', 'http://content9.flixster.com/movie/10/86/48/10864803_ori.jpg', 'http://content9.flixster.com/movie/10/86/48/10864803_pro.jpg', 'http://content9.flixster.com/movie/10/86/48/10864803_mob.jpg'),
(105, 148, 'http://content6.flixster.com/movie/20/86/04/2086048_det.jpg', 'http://content6.flixster.com/movie/20/86/04/2086048_ori.jpg', 'http://content6.flixster.com/movie/20/86/04/2086048_pro.jpg', 'http://content6.flixster.com/movie/20/86/04/2086048_mob.jpg'),
(106, 149, 'http://content7.flixster.com/movie/11/16/47/11164741_det.jpg', 'http://content7.flixster.com/movie/11/16/47/11164741_ori.jpg', 'http://content7.flixster.com/movie/11/16/47/11164741_pro.jpg', 'http://content7.flixster.com/movie/11/16/47/11164741_mob.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE IF NOT EXISTS `stars` (
  `id` int(11) NOT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  `star_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`id`, `full_name`, `star_id`) VALUES
(218, 'Brian Geraghty', 364606993),
(219, 'Josh Peck', 341817696),
(220, 'Alice Eve', 355028246),
(222, 'Bob Huculak', 771016468);

-- --------------------------------------------------------

--
-- Table structure for table `sysdiagrams`
--

CREATE TABLE IF NOT EXISTS `sysdiagrams` (
  `name` varchar(128) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sysdiagrams`
--

INSERT INTO `sysdiagrams` (`name`, `principal_id`, `diagram_id`, `version`, `definition`) VALUES
('Diagram_0', 1, 1, 1, 0x3f3f3f3f);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(500) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

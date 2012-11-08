-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2012 at 12:52 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bridge_movies_directors`
--

INSERT INTO `bridge_movies_directors` (`id`, `movies_id`, `directors_id`) VALUES
(3, 10, 3),
(4, 11, 4),
(5, 12, 5),
(6, 13, 6),
(7, 14, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `bridge_movies_genres`
--

INSERT INTO `bridge_movies_genres` (`id`, `movies_id`, `genres_id`) VALUES
(9, 10, 9),
(10, 10, 10),
(11, 10, 11),
(12, 11, 9),
(13, 11, 10),
(14, 11, 12),
(15, 12, 13),
(16, 12, 9),
(17, 13, 9),
(18, 14, 10),
(19, 14, 14);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `bridge_movies_stars`
--

INSERT INTO `bridge_movies_stars` (`id`, `movies_id`, `stars_id`) VALUES
(11, 10, 11),
(12, 10, 12),
(13, 10, 13),
(14, 10, 14),
(15, 10, 15),
(16, 11, 16),
(17, 11, 17),
(18, 11, 18),
(19, 11, 19),
(20, 11, 20),
(21, 12, 21),
(22, 12, 22),
(23, 12, 23),
(24, 12, 24),
(25, 12, 25),
(26, 13, 26),
(27, 13, 27),
(28, 13, 28),
(29, 13, 29),
(30, 13, 30),
(31, 14, 31),
(32, 14, 32),
(33, 14, 33),
(34, 14, 34),
(35, 14, 35);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `full_name`) VALUES
(3, 'Robert Harmon'),
(4, 'Ridley Scott'),
(5, 'James Gartner'),
(6, 'James Foley'),
(7, 'George Lucas');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`) VALUES
(9, 'Drama'),
(10, 'Action & Adventure'),
(11, 'Television'),
(12, 'Classics'),
(13, 'Sports & Fitness'),
(14, 'Science Fiction & Fantasy');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `movies_id`, `self`, `alternate`, `similar`, `cast`, `clips`, `reviews`) VALUES
(6, 10, 'http://api.rottentomatoes.com/api/public/v1.0/movies/10988.json', 'http://www.rottentomatoes.com/m/ike_countdown_to_dday/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/10988/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/10988/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/10988/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/10988/reviews.json'),
(7, 11, 'http://api.rottentomatoes.com/api/public/v1.0/movies/13065.json', 'http://www.rottentomatoes.com/m/gladiator/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/13065/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/13065/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/13065/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/13065/reviews.json'),
(8, 12, 'http://api.rottentomatoes.com/api/public/v1.0/movies/2864420.json', 'http://www.rottentomatoes.com/m/1155467-glory_road/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/2864420/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/2864420/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/2864420/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/2864420/reviews.json'),
(9, 13, 'http://api.rottentomatoes.com/api/public/v1.0/movies/12913.json', 'http://www.rottentomatoes.com/m/glengarry_glen_ross/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/12913/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/12913/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/12913/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/12913/reviews.json'),
(10, 14, 'http://api.rottentomatoes.com/api/public/v1.0/movies/9.json', 'http://www.rottentomatoes.com/m/star_wars_episode_iii_revenge_of_the_sith_3d/', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9/similar.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9/cast.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9/clips.json', 'http://api.rottentomatoes.com/api/public/v1.0/movies/9/reviews.json');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_id`, `abridged_cast`, `links`, `mpaa_rating`, `posters`, `ratings`, `release_dates`, `runtime`, `title`, `year`, `imdb_id`, `genres`, `synopsis`, `critics_consensus`) VALUES
(10, 10988, '[{"name":"Tom Selleck","id":"162666130","characters":["Dwight D. Eisenhower"]},{"name":"Timothy Bottoms","id":"162661047","characters":["Walter Bedell Smith"]},{"name":"Gerald McRaney","id":"646801631","characters":["George S. Patton"]},{"name":"James Rem', 'link', 'PG', '{"thumbnail":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/89\\/85\\/10898520_mob.jpg","profile":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/89\\/85\\/10898520_pro.jpg","detailed":"http:\\/\\/content6.flixster.com\\/movie\\/10\\/89\\/85\\/10898520_det.jpg","original":', '{"critics_score":-1,"audience_rating":"Upright","audience_score":63}', '{"theater":"2004-05-31","dvd":"2004-08-31"}', '89', 'Ike - Countdown to D-Day', '2004', '0401504', '["Drama","Action & Adventure","Television"]', '', ''),
(11, 13065, '[{"name":"Russell Crowe","id":"162652569","characters":["Maximus"]},{"name":"Joaquin Phoenix","id":"162655394","characters":["Commodus"]},{"name":"Connie Nielsen","id":"162653203","characters":["Lucilla"]},{"name":"Oliver Reed","id":"162662908","character', 'link', 'R', '{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/80\\/17\\/10801794_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/80\\/17\\/10801794_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/80\\/17\\/10801794_det.jpg","original":', '{"critics_rating":"Certified Fresh","critics_score":78,"audience_rating":"Upright","audience_score":85}', '{"theater":"2000-05-05","dvd":"2000-11-21"}', '171', 'Gladiator', '2000', '0172495', '["Drama","Action & Adventure","Classics"]', '', 'Ridley Scott and an excellent cast successfully convey the intensity of Roman gladitorial combat as well as the political intrigue brewing beneath.'),
(12, 2864420, '[{"name":"Josh Lucas","id":"162652973","characters":["Don Haskins"]},{"name":"Derek Luke","id":"162661079","characters":["Bobby Joe Hill"]},{"name":"Jon Voight","id":"162664393","characters":["Adolph Rupp"]},{"name":"Emily Deschanel","id":"162664640","cha', 'link', 'PG', '{"thumbnail":"http:\\/\\/content9.flixster.com\\/movie\\/31\\/21\\/312195_mob.jpg","profile":"http:\\/\\/content9.flixster.com\\/movie\\/31\\/21\\/312195_pro.jpg","detailed":"http:\\/\\/content9.flixster.com\\/movie\\/31\\/21\\/312195_det.jpg","original":"http:\\/\\/content9', '{"critics_rating":"Rotten","critics_score":56,"audience_rating":"Upright","audience_score":82}', '{"theater":"2006-01-13","dvd":"2006-06-06"}', '117', 'Glory Road', '2006', '', '["Sports & Fitness","Drama"]', '', 'As formulaic as sports movies get, this underdog story still triumphs on the strength of its inspiring story.'),
(13, 12913, '[{"name":"Al Pacino","id":"162654461","characters":["Ricky Roma"]},{"name":"Jack Lemmon","id":"162656072","characters":["Shelley Levene"]},{"name":"Ed Harris","id":"162654543","characters":["Dave Moss"]},{"name":"Alan Arkin","id":"162666144","characters":', 'link', 'R', '{"thumbnail":"http:\\/\\/content9.flixster.com\\/movie\\/11\\/16\\/66\\/11166663_mob.jpg","profile":"http:\\/\\/content9.flixster.com\\/movie\\/11\\/16\\/66\\/11166663_pro.jpg","detailed":"http:\\/\\/content9.flixster.com\\/movie\\/11\\/16\\/66\\/11166663_det.jpg","original":', '{"critics_rating":"Certified Fresh","critics_score":96,"audience_rating":"Upright","audience_score":87}', '{"theater":"1992-09-29","dvd":"2007-02-20"}', '100', 'Glengarry Glen Ross', '1992', '0104348', '["Drama"]', '', 'This adaptation of David Mamet''s play is every bit as compelling and witty as its source material, thanks in large part to a clever script and a bevy of powerhouse actors.'),
(14, 9, '[{"name":"Hayden Christensen","id":"162652153","characters":["Anakin Skywalker\\/Darth Vader"]},{"name":"Ewan McGregor","id":"162652152","characters":["Obi-Wan Kenobi"]},{"name":"Kenny Baker","id":"418638213","characters":["R2-D2"]},{"name":"Graeme Blundel', 'link', 'PG-13', '{"thumbnail":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/94\\/47\\/10944718_mob.jpg","profile":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/94\\/47\\/10944718_pro.jpg","detailed":"http:\\/\\/content8.flixster.com\\/movie\\/10\\/94\\/47\\/10944718_det.jpg","original":', '{"critics_rating":"Certified Fresh","critics_score":80,"audience_rating":"Upright","audience_score":32}', '{"theater":"2013-10-11","dvd":"2005-11-01"}', '140', 'Star Wars: Episode III - Revenge of the Sith 3D', '2005', '0121766', '["Action & Adventure","Science Fiction & Fantasy"]', '', 'This sixth and final installment of George Lucas'' epic space opera will please die-hard fanatics and non-believers alike -- largely due to awesome digital effects and the sheer power of the mythology.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `posters`
--

INSERT INTO `posters` (`id`, `movies_id`, `detailed`, `original`, `profile`, `thumbnail`) VALUES
(3, 10, 'http://content6.flixster.com/movie/10/89/85/10898520_det.jpg', 'http://content6.flixster.com/movie/10/89/85/10898520_ori.jpg', 'http://content6.flixster.com/movie/10/89/85/10898520_pro.jpg', 'http://content6.flixster.com/movie/10/89/85/10898520_mob.jpg'),
(4, 11, 'http://content8.flixster.com/movie/10/80/17/10801794_det.jpg', 'http://content8.flixster.com/movie/10/80/17/10801794_ori.jpg', 'http://content8.flixster.com/movie/10/80/17/10801794_pro.jpg', 'http://content8.flixster.com/movie/10/80/17/10801794_mob.jpg'),
(5, 12, 'http://content9.flixster.com/movie/31/21/312195_det.jpg', 'http://content9.flixster.com/movie/31/21/312195_ori.jpg', 'http://content9.flixster.com/movie/31/21/312195_pro.jpg', 'http://content9.flixster.com/movie/31/21/312195_mob.jpg'),
(6, 13, 'http://content9.flixster.com/movie/11/16/66/11166663_det.jpg', 'http://content9.flixster.com/movie/11/16/66/11166663_ori.jpg', 'http://content9.flixster.com/movie/11/16/66/11166663_pro.jpg', 'http://content9.flixster.com/movie/11/16/66/11166663_mob.jpg'),
(7, 14, 'http://content8.flixster.com/movie/10/94/47/10944718_det.jpg', 'http://content8.flixster.com/movie/10/94/47/10944718_ori.jpg', 'http://content8.flixster.com/movie/10/94/47/10944718_pro.jpg', 'http://content8.flixster.com/movie/10/94/47/10944718_mob.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE IF NOT EXISTS `stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(500) DEFAULT NULL,
  `star_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`id`, `full_name`, `star_id`) VALUES
(11, 'Tom Selleck', 162666130),
(12, 'Timothy Bottoms', 162661047),
(13, 'Gerald McRaney', 646801631),
(14, 'James Remar', 162667832),
(15, 'George Shevtsov', 162734641),
(16, 'Russell Crowe', 162652569),
(17, 'Joaquin Phoenix', 162655394),
(18, 'Connie Nielsen', 162653203),
(19, 'Oliver Reed', 162662908),
(20, 'Derek Jacobi', 162656362),
(21, 'Josh Lucas', 162652973),
(22, 'Derek Luke', 162661079),
(23, 'Jon Voight', 162664393),
(24, 'Emily Deschanel', 162664640),
(25, 'Evan Jones', 364627387),
(26, 'Al Pacino', 162654461),
(27, 'Jack Lemmon', 162656072),
(28, 'Ed Harris', 162654543),
(29, 'Alan Arkin', 162666144),
(30, 'Kevin Spacey', 162657625),
(31, 'Hayden Christensen', 162652153),
(32, 'Ewan McGregor', 162652152),
(33, 'Kenny Baker', 418638213),
(34, 'Graeme Blundell', 548155708),
(35, 'Jeremy Bulloch', 358317901);

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

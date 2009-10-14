-- MySQL dump 10.11
--
-- Host: localhost    Database: twitapps_replies
-- ------------------------------------------------------
-- Server version	5.0.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `username` varchar(20) NOT NULL,
  `tweetid` int(20) unsigned NOT NULL,
  `sent_at` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY  (`username`,`tweetid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `email` varchar(250) NOT NULL,
  `status` varchar(20) NOT NULL default 'inactive',
  `last_run_at` int(11) unsigned NOT NULL default '0',
  `last_email_at` int(11) unsigned NOT NULL default '0',
  `last_id` int(20) unsigned NOT NULL default '0',
  `registered_at` int(11) unsigned NOT NULL default '0',
  `processor_pid` int(11) unsigned NOT NULL default '0',
  `ignore_self` tinyint(3) unsigned NOT NULL default '0',
  `replies_only` tinyint(3) unsigned NOT NULL default '0',
  `min_interval` int(10) unsigned NOT NULL default '3600',
  `max_queued` int(10) unsigned NOT NULL default '25',
  PRIMARY KEY  (`username`),
  KEY `get_next` (`status`,`last_run_at`,`last_email_at`),
  KEY `processor_pid` (`processor_pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-14 18:53:35

-- MySQL dump 10.11
--
-- Host: localhost    Database: twitapps_shared
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
-- Table structure for table `apilog`
--

DROP TABLE IF EXISTS `apilog`;
CREATE TABLE `apilog` (
  `id` int(20) unsigned NOT NULL auto_increment,
  `stamp` datetime NOT NULL,
  `service` varchar(50) NOT NULL,
  `command` text,
  PRIMARY KEY  (`id`),
  KEY `service_idx` (`service`),
  KEY `stamp_idx` (`stamp`),
  KEY `stampservice_idx` (`stamp`,`service`)
) ENGINE=MyISAM AUTO_INCREMENT=12894549 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `apistats`
--

DROP TABLE IF EXISTS `apistats`;
CREATE TABLE `apistats` (
  `y` smallint(5) unsigned NOT NULL,
  `m` tinyint(3) unsigned NOT NULL,
  `d` tinyint(3) unsigned NOT NULL,
  `h` tinyint(3) unsigned NOT NULL,
  `t` varchar(20) NOT NULL default '',
  `n` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`y`,`m`,`d`,`h`,`t`),
  KEY `day` (`y`,`m`,`d`,`t`),
  KEY `day_no_type` (`y`,`m`,`d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) unsigned NOT NULL,
  `screen_name` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `url` text NOT NULL,
  `utc_offset` tinyint(4) NOT NULL default '0',
  `time_zone` varchar(50) NOT NULL,
  `statuses_count` int(11) unsigned NOT NULL default '0',
  `followers_count` int(11) unsigned NOT NULL default '0',
  `friends_count` int(11) unsigned NOT NULL default '0',
  `favourites_count` int(11) unsigned NOT NULL default '0',
  `created_at` int(11) unsigned NOT NULL default '0',
  `protected` tinyint(4) NOT NULL default '0',
  `status` text NOT NULL,
  `profile_image_url` text NOT NULL,
  `profile_sidebar_fill_color` varchar(20) NOT NULL,
  `profile_sidebar_border_color` varchar(20) NOT NULL,
  `profile_background_tile` tinyint(4) NOT NULL default '0',
  `profile_background_color` varchar(20) NOT NULL,
  `profile_text_color` varchar(20) NOT NULL,
  `profile_background_image_url` text NOT NULL,
  `profile_link_color` varchar(20) NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `registered_at` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-14 18:53:53

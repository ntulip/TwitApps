-- MySQL dump 10.11
--
-- Host: localhost    Database: twitapps_follows
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
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE `followers` (
  `username` varchar(20) NOT NULL default '',
  `follower_id` int(20) unsigned NOT NULL,
  `followed_at` int(11) unsigned NOT NULL default '0',
  `unfollowed_at` int(11) unsigned NOT NULL default '0',
  `last_updated_at` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`,`follower_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `oauth_consumer_registry`
--

DROP TABLE IF EXISTS `oauth_consumer_registry`;
CREATE TABLE `oauth_consumer_registry` (
  `ocr_id` int(11) NOT NULL auto_increment,
  `ocr_usa_id_ref` varchar(20) default NULL,
  `ocr_consumer_key` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `ocr_consumer_secret` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `ocr_signature_methods` varchar(255) NOT NULL default 'HMAC-SHA1,PLAINTEXT',
  `ocr_server_uri` varchar(255) NOT NULL,
  `ocr_server_uri_host` varchar(128) NOT NULL,
  `ocr_server_uri_path` varchar(128) character set utf8 collate utf8_bin NOT NULL,
  `ocr_request_token_uri` varchar(255) NOT NULL,
  `ocr_authorize_uri` varchar(255) NOT NULL,
  `ocr_access_token_uri` varchar(255) NOT NULL,
  `ocr_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ocr_id`),
  UNIQUE KEY `ocr_consumer_key` (`ocr_consumer_key`,`ocr_usa_id_ref`),
  KEY `ocr_server_uri` (`ocr_server_uri`),
  KEY `ocr_server_uri_host` (`ocr_server_uri_host`,`ocr_server_uri_path`),
  KEY `ocr_usa_id_ref` (`ocr_usa_id_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Table structure for table `oauth_consumer_token`
--

DROP TABLE IF EXISTS `oauth_consumer_token`;
CREATE TABLE `oauth_consumer_token` (
  `oct_id` int(11) NOT NULL auto_increment,
  `oct_ocr_id_ref` int(11) NOT NULL,
  `oct_usa_id_ref` varchar(20) NOT NULL,
  `oct_name` varchar(64) character set utf8 collate utf8_bin NOT NULL default '',
  `oct_token` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `oct_token_secret` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `oct_token_type` enum('request','authorized','access') default NULL,
  `oct_token_ttl` datetime NOT NULL default '9999-12-31 00:00:00',
  `oct_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`oct_id`),
  UNIQUE KEY `oct_ocr_id_ref` (`oct_ocr_id_ref`,`oct_token`),
  UNIQUE KEY `oct_usa_id_ref` (`oct_usa_id_ref`,`oct_ocr_id_ref`,`oct_token_type`,`oct_name`),
  KEY `oct_token_ttl` (`oct_token_ttl`),
  CONSTRAINT `oauth_consumer_token_ibfk_1` FOREIGN KEY (`oct_ocr_id_ref`) REFERENCES `oauth_consumer_registry` (`ocr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Table structure for table `oauth_log`
--

DROP TABLE IF EXISTS `oauth_log`;
CREATE TABLE `oauth_log` (
  `olg_id` int(11) NOT NULL auto_increment,
  `olg_osr_consumer_key` varchar(64) character set utf8 collate utf8_bin default NULL,
  `olg_ost_token` varchar(64) character set utf8 collate utf8_bin default NULL,
  `olg_ocr_consumer_key` varchar(64) character set utf8 collate utf8_bin default NULL,
  `olg_oct_token` varchar(64) character set utf8 collate utf8_bin default NULL,
  `olg_usa_id_ref` varchar(20) default NULL,
  `olg_received` text NOT NULL,
  `olg_sent` text NOT NULL,
  `olg_base_string` text NOT NULL,
  `olg_notes` text NOT NULL,
  `olg_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `olg_remote_ip` bigint(20) NOT NULL,
  PRIMARY KEY  (`olg_id`),
  KEY `olg_osr_consumer_key` (`olg_osr_consumer_key`,`olg_id`),
  KEY `olg_ost_token` (`olg_ost_token`,`olg_id`),
  KEY `olg_ocr_consumer_key` (`olg_ocr_consumer_key`,`olg_id`),
  KEY `olg_oct_token` (`olg_oct_token`,`olg_id`),
  KEY `olg_usa_id_ref` (`olg_usa_id_ref`,`olg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `oauth_server_nonce`
--

DROP TABLE IF EXISTS `oauth_server_nonce`;
CREATE TABLE `oauth_server_nonce` (
  `osn_id` int(11) NOT NULL auto_increment,
  `osn_consumer_key` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `osn_token` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `osn_timestamp` bigint(20) NOT NULL,
  `osn_nonce` varchar(80) character set utf8 collate utf8_bin NOT NULL,
  PRIMARY KEY  (`osn_id`),
  UNIQUE KEY `osn_consumer_key` (`osn_consumer_key`,`osn_token`,`osn_timestamp`,`osn_nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `oauth_server_registry`
--

DROP TABLE IF EXISTS `oauth_server_registry`;
CREATE TABLE `oauth_server_registry` (
  `osr_id` int(11) NOT NULL auto_increment,
  `osr_usa_id_ref` varchar(20) default NULL,
  `osr_consumer_key` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `osr_consumer_secret` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `osr_enabled` tinyint(1) NOT NULL default '1',
  `osr_status` varchar(16) NOT NULL,
  `osr_requester_name` varchar(64) NOT NULL,
  `osr_requester_email` varchar(64) NOT NULL,
  `osr_callback_uri` varchar(255) NOT NULL,
  `osr_application_uri` varchar(255) NOT NULL,
  `osr_application_title` varchar(80) NOT NULL,
  `osr_application_descr` text NOT NULL,
  `osr_application_notes` text NOT NULL,
  `osr_application_type` varchar(20) NOT NULL,
  `osr_application_commercial` tinyint(1) NOT NULL default '0',
  `osr_issue_date` datetime NOT NULL,
  `osr_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`osr_id`),
  UNIQUE KEY `osr_consumer_key` (`osr_consumer_key`),
  KEY `osr_usa_id_ref` (`osr_usa_id_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `oauth_server_token`
--

DROP TABLE IF EXISTS `oauth_server_token`;
CREATE TABLE `oauth_server_token` (
  `ost_id` int(11) NOT NULL auto_increment,
  `ost_osr_id_ref` int(11) NOT NULL,
  `ost_usa_id_ref` varchar(20) NOT NULL,
  `ost_token` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `ost_token_secret` varchar(64) character set utf8 collate utf8_bin NOT NULL,
  `ost_token_type` enum('request','access') default NULL,
  `ost_authorized` tinyint(1) NOT NULL default '0',
  `ost_referrer_host` varchar(128) NOT NULL,
  `ost_token_ttl` datetime NOT NULL default '9999-12-31 00:00:00',
  `ost_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ost_id`),
  UNIQUE KEY `ost_token` (`ost_token`),
  KEY `ost_osr_id_ref` (`ost_osr_id_ref`),
  KEY `ost_token_ttl` (`ost_token_ttl`),
  CONSTRAINT `oauth_server_token_ibfk_1` FOREIGN KEY (`ost_osr_id_ref`) REFERENCES `oauth_server_registry` (`osr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `twitterusers`
--

DROP TABLE IF EXISTS `twitterusers`;
CREATE TABLE `twitterusers` (
  `id` int(20) unsigned NOT NULL,
  `username` varchar(20) default NULL,
  `description` varchar(200) default NULL,
  `url` varchar(250) default NULL,
  `name` varchar(100) default NULL,
  `protected` tinyint(3) unsigned default '0',
  `followers_count` int(10) unsigned default '0',
  `following_count` int(10) unsigned NOT NULL default '0',
  `profile_image_url` varchar(250) default NULL,
  `location` varchar(250) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL default '',
  `email` varchar(250) NOT NULL,
  `status` varchar(20) default NULL,
  `last_run_at` int(11) unsigned NOT NULL,
  `frequency` varchar(20) NOT NULL default 'daily',
  `hour` tinyint(3) unsigned NOT NULL,
  `when` varchar(20) NOT NULL,
  `last_email_at` int(11) unsigned NOT NULL,
  `next_email_at` int(11) unsigned NOT NULL default '0',
  `registered_at` int(11) unsigned NOT NULL default '0',
  `follower_count` int(11) unsigned NOT NULL default '0',
  `post_url` text NOT NULL,
  `post_format` varchar(20) NOT NULL default 'json',
  `processor_pid` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-14 18:53:15

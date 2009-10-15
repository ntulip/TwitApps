<?php
	define('APPNAME', 'follows');

	$_email = array(
		'server' => '{imap.googlemail.com:993/imap/ssl/novalidate-cert}INBOX',
		'username' => 'twitapps@googlemail.com',
		'password' => 'password_one',
	);
	
	$_db = array(
		'username' => 'ta_follows',
		'password' => 'password_two',
		'database' => 'twitapps_follows',
		'host' => 'localhost',
	);

	$_twitter = array(
		'username' => 'ta_follows',
		'password' => 'password_three',
		'source' => 'twitapps',
	);
	
	$_oauth = array(
		'consumer_key' => '', // Get this from Twitter
		'consumer_secret' => '', // Get this from Twitter
		'url_request_token' => 'http://twitter.com/oauth/request_token',
		'url_access_token' => 'http://twitter.com/oauth/access_token',
		'url_authorize' => 'http://twitter.com/oauth/authorize',
	);

<?php
define('DB_NAME', 'wordpress_db');
define('DB_USER', 'admin');
define('DB_PASSWORD', 'password');
define('DB_HOST',          'cyberlicious-dbinstance-c7n4xqmopfzo.c32ymei0y17e.us-west-1.rds.amazonaws.com');
define('DB_CHARSET',       'utf8');
define('DB_COLLATE',       '');
define('WPLANG'            , '');
define('WP_DEBUG'          , false);
$table_prefix  = 'wp_';
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
#!/bin/bash
echo "Cleaning up old Wordpress files"
cd /var/www/html/wordpress
find . -type f ! -name 'wp-config.php' ! -name 'wp-content/uploads' -exec rm -f {} \;

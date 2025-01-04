#!/bin/bash
echo "Cleaning up old Wordpress files"
cd /var/www/html/wordpress/wp-content
find . -type f ! -name 'uploads' -exec rm -f {} \;

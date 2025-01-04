#!/bin/bash
echo "Cleaning up old Wordpress files"
find "/var/www/html/wordpress/wp-content" -mindepth 1 ! -name "uploads" -exec rm -rf {} \;

#!/bin/bash
echo "Cleaning up old Wordpress files"
find . -type f ! -name 'wp-config.php' ! -name 'wp-content/uploads' -exec rm -f {} \;

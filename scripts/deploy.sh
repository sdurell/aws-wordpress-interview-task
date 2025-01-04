#!/bin/bash
echo "Deploying Wordpress"
unzip -o /var/temp/wordpress.zip -d /var/www/html/wordpress
chown -R apache:apache /var/www/html/wordpress
#!/bin/bash

# Path to wordpress install
WP_INSTALL_DIR="/var/www/html/wordpress"

# Path to version.php file
VERSION_FILE="$WP_INSTALL_DIR/wp-includes/version.php"

# Find current version
if [ -f "$VERSION_FILE" ]; then
    CURRENT_VERSION=$(grep -oP "\$wp_version\s*=\s*'\K[^']+" "$VERSION_FILE")
    echo "Current Wordpress Version: $CURRENT_VERSION"
else
    echo "version.php not found at $VERSION_FILE"
    exit 1
fi

# Find latest version of wordpress
LATEST_VERSION=$(curl -s https://api.wordpress.org/core/version-check/1.7/ | jq -r '.offers[0].current')

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "Updating Wordpress from $CURRENT_VERSION to $LATEST_VERSION"

    # Backup current install
    echo "Backing up current install"
    tar -czf "/tmp/wordpress_backup_$(date +%F_%T).tar.gz" $WP_INSTALL_DIR

    # Download and unzip latest Wordpress
    echo "Downloading latest Wordpress"
    curl -o /tmp/latest.zip https://wordpress.org/latest.zip
    unzip -q /tmp/latest.zip -d /tmp

    # Copy files to wordpress dir
    echo "Updating files"
    rsync -av --exclude="wp-config.php" /tmp/wordpress/ $WP_INSTALL_DIR/

    # Cleanup
    echo "Cleaning up temp files"
    rm -rf /tmp/latest.zip /tmp/wordpress

    echo "Wordpress updated to version $LATEST_VERSION"
else
    echo "Wordpress is already up to date (version $CURRENT_VERSION)."
fi
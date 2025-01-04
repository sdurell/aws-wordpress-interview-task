#!/bin/bash

# Check for available updates and filter out metadata expiration message
UPDATES=$(dnf check-update --disablerepo="*" --enablerepo="amazonlinux" | grep -v 'Last metadata expiration check' | grep -E '^[a-zA-Z0-9]')

if [ -z "$UPDATES" ]; then
    echo "System is up to date."
else
    echo "Updates are available. Applying updates..."
    sudo dnf update -y --disablerepo="*" --enablerepo="amazonlinux"
    echo "System update complete."
fi

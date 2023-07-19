#!/bin/sh

echo "Rebuilding system..."
./rebuild-system.sh
echo "Copying config..."
./copy_config.sh
echo "Applying home-manager..."
./apply_users.sh
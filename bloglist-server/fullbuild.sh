#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

echo "Navigating to bloglist-client"
cd ./bloglist-client

echo "Installing npm dependencies for bloglist-client"
npm install

echo "Building bloglist-client"
npm run build

echo "Creating dist directory in bloglist-server if it doesn't exist"
mkdir -p ../bloglist-server/dist

echo "Copying dist folder to bloglist-server"
cp -r dist/* ../bloglist-server/dist

echo "Navigating to bloglist-server"
cd ../bloglist-server

echo "Building bloglist-server"
npm run build

echo "Full build process completed successfully"

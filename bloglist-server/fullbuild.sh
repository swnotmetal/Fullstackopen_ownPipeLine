#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

echo "Installing npm dependencies for the root project"
npm install

echo "Navigating to bloglist-client"
cd ./bloglist-client

echo "Installing npm dependencies for bloglist-client"
npm install

echo "Building bloglist-client"
npm run build

echo "Copying dist folder to bloglist-server"
cp -r dist ../bloglist-server

echo "Navigating to bloglist-server"
cd ../bloglist-server

echo "Installing npm dependencies for bloglist-server"
npm install

echo "Building bloglist-server"
npm run start

echo "Full build process completed successfully"

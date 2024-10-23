#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

# Install backend dependencies
echo "Installing backend dependencies..."
npm install

# Navigate to frontend directory and build
echo "Building frontend..."
cd ./bloglist-client # or whatever your frontend directory is named
npm install
npm run build

# Copy build files to backend
echo "Moving build files..."
cp -r dist ../dist

# Return to backend directory
cd ..

# Don't start the server here - let Render handle that
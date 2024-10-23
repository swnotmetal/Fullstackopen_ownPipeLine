#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

# Install backend dependencies
echo "Installing backend dependencies..."
npm install

# Navigate to frontend directory and build
echo "Building frontend..."
cd ./bloglist-client  # Changed from bloglist-client to match your actual directory name
npm install
npm run build  # This will use the local vite installation

# Copy build files to backend
echo "Moving build files..."
cp -r dist ../dist

# Return to backend directory
cd ..
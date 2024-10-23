#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

# Install backend dependencies
echo "Installing backend dependencies..."
npm install

# Navigate to frontend directory and build
echo "Building frontend..."
cd ./bloglist-client
npm install
export PATH="$PATH:./node_modules/.bin"  # Add this line to ensure local binaries are available
npm run build

# Copy build files to backend
echo "Moving build files..."
cp -r dist ../dist

# Return to backend directory
cd ..
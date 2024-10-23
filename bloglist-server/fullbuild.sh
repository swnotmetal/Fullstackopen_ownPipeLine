#!/bin/bash

echo "Starting the full build process"

# Exit on error
set -e

# Install backend dependencies
echo "Installing backend dependencies..."
npm install

# Navigate to frontend directory and build
echo "Building frontend..."
cd ./bloglist-client # or bloglist-client, use the correct name
npm install
npm run build

# Copy or move the build directory to the backend
echo "Moving build files..."
cp -r dist ../public  # Assuming Vite builds to 'dist'

# Return to backend directory
cd ..

# Start the server
echo "Starting server..."
npm start
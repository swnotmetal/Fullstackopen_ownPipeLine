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

if [ ! -f ./node_modules/.bin/vite ]; then
  echo "Vite is not installed. Exiting."
  exit 1
fi
export PATH="$PATH:./node_modules/.bin"  # Ensure local binaries are available
npm run build



# Copy build files to backend
echo "Moving build files..."
cp -r dist ../dist

# Return to backend directory
cd ..

# Start the backend server
echo "Starting backend server..."
npm run start
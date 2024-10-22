#!/bin/bash

echo "Starting the full build process"

# Install backend dependencies
npm install

# Build the frontend
cd ./bloglist-client && npm install && npm run build

# Go back to the backend directory
cd ..

# Start the backend server
npm run start
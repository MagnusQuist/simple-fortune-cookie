#!/bin/bash

# Build Go Backend
echo "Building Go Backend..."
cd backend
go build
if [ $? -eq 0 ]; then
    echo "Go Backend built successfully."
else
    echo "Go Backend build failed."
    exit 1
fi
cd ..

# Build Frontend
echo "Building Frontend..."
cd frontend
go build
if [ $? -eq 0 ]; then
    echo "Frontend built successfully."
else
    echo "Frontend build failed."
    exit 1
fi
cd ..

echo "Build process completed."

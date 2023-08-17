#!/bin/bash

BRANCH_NAME=${1##*/}

case "$BRANCH_NAME" in
  "develop")
    # Deployment for development environment
    cd frontend
    go build
    ./frontend &
    cd ..

    cd backend
    go build
    ./backend &
    cd ..
    ;;

  "staging")
    # Deployment for development environment
    cd frontend
    go build
    ./frontend &
    cd ..

    cd backend
    go build
    ./backend &
    cd ..
    ;;

  "main"|"master") # Adapt based on your main branch name
    # Deployment for development environment
    cd frontend
    go build
    ./frontend &
    cd ..

    cd backend
    go build
    ./backend &
    cd ..
    ;;

  *)
    echo "Unknown branch. No deployment executed."
    ;;
esac

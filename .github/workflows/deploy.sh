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
    # Deployment for staging environment
    cd frontend
    go build
    ./frontend-staging &
    cd ..

    cd backend
    go build
    ./backend-staging &
    cd ..
    ;;

  "main"|"master") # Adapt based on your main branch name
    # Deployment for production environment
    cd frontend
    go build
    ./frontend-prod &
    cd ..

    cd backend
    go build
    ./backend-prod &
    cd ..
    ;;

  *)
    echo "Unknown branch. No deployment executed."
    ;;
esac

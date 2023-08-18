#!/bin/bash

BRANCH_NAME=${1##*/}
FRONTEND_IMAGE="simple-fortune-cookie-frontend"
BACKEND_IMAGE="simple-fortune-cookie-backend"
ENVIRONMENT=""

case "$BRANCH_NAME" in
  "develop")
    ENVIRONMENT="development"
    ;;

  "staging")
    ENVIRONMENT="staging"
    ;;

  "main"|"master") # Adapt based on your main branch name
    ENVIRONMENT="production"
    ;;

  *)
    echo "Unknown branch. No deployment executed."
    exit 1
    ;;
esac

if [ -n "$ENVIRONMENT" ]; then
    # Pull the latest Docker image
    echo "Pulling the latest Docker image for $ENVIRONMENT..."
    docker pull ghcr.io/${docker_username,,}/${FRONTEND_IMAGE}:${GITHUB_SHA}
    docker pull ghcr.io/${docker_username,,}/${BACKEND_IMAGE}:${GITHUB_SHA}

    # Run the Docker container
    echo "Running Docker container for $ENVIRONMENT..."
    docker run -d -p 80:80 \
      --name ${FRONTEND_IMAGE}_${ENVIRONMENT} \
      --label environment=${ENVIRONMENT} \
      ghcr.io/${docker_username,,}/${FRONTEND_IMAGE}:${GITHUB_SHA}
    
    docker run -d -p 8081:8081 \
      --name ${BACKEND_IMAGE}_${ENVIRONMENT} \
      --label environment=${ENVIRONMENT} \
      ghcr.io/${docker_username,,}/${BACKEND_IMAGE}:${GITHUB_SHA}

    echo "Docker container started for $ENVIRONMENT."
fi

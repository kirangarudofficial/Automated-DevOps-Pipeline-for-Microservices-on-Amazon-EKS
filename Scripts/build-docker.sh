#!/bin/bash
set -e

DOCKER_REPO="my-docker-repo/my-app"  # Replace with your Docker repository
TAG=${1:-latest}

echo "Building Docker image..."
docker build -t $DOCKER_REPO:$TAG .

#!/bin/bash
set -e

DOCKER_REPO="my-docker-repo/my-app"  # Replace with your Docker repository
TAG=${1:-latest}

echo "Scanning Docker image for vulnerabilities..."
trivy image $DOCKER_REPO:$TAG

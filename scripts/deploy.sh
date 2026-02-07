#!/usr/bin/env bash
set -euo pipefail

APP_NAME="${APP_NAME:-cicd-secured-app}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
DOCKER_USER="${DOCKER_USER:?DOCKER_USER is required}"

IMAGE="${DOCKER_USER}/${APP_NAME}:${IMAGE_TAG}"

echo "Deploying image: ${IMAGE}"
docker pull "${IMAGE}"

if docker ps -a --format '{{.Names}}' | grep -q "^${APP_NAME}$"; then
  docker rm -f "${APP_NAME}"
fi

docker run -d \
  --name "${APP_NAME}" \
  --restart unless-stopped \
  -p 80:5000 \
  "${IMAGE}"

echo "Deployment complete"

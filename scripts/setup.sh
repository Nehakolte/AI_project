#!/usr/bin/env bash
set -euo pipefail
command -v docker >/dev/null || { echo 'Install Docker Desktop/Engine first.'; exit 1; }
docker compose version
echo 'Prerequisites look good. Start the app with: docker compose -f docker/docker-compose.yml up --build -d'

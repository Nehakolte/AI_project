#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
docker compose -f docker/docker-compose.yml up --build -d
echo 'Waiting for app health...'
for i in $(seq 1 30); do
  if curl -fsS http://localhost:5000/api/health; then echo; exit 0; fi
  sleep 2
done
docker compose -f docker/docker-compose.yml logs --tail=100
exit 1

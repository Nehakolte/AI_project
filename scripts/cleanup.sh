#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "$ROOT/docker/docker-compose.yml" down --remove-orphans
# Deliberately retain named volumes; use `docker compose ... down -v` only if you intend to delete local Grafana data.

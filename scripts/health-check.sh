#!/usr/bin/env bash
set -euo pipefail
URL="${1:-http://localhost:5000/api/health}"
curl --fail --show-error --silent "$URL"
echo

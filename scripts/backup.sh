#!/usr/bin/env bash
set -euo pipefail
set -a; . ./.env; set +a
mkdir -p backups
docker compose exec -T db pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" \
  > "backups/$(date +%F_%H%M).sql"

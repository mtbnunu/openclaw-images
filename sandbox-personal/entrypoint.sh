#!/usr/bin/env bash
set -euo pipefail

gog auth credentials "${CLIENTSECRET_LOCATION}"
gog auth add "${GOG_ACCOUNT}" --services user --remote --step 1

exec "$@"

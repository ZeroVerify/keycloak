#!/bin/bash
set -euo pipefail

: "${KC_REALM_RSA_PRIVATE_KEY:?Railway variable KC_REALM_RSA_PRIVATE_KEY is required}"
: "${KC_REALM_RSA_CERT:?Railway variable KC_REALM_RSA_CERT is required}"

IMPORT_DIR=/opt/keycloak/data/import
TPL="${IMPORT_DIR}/zeroverify-realm.json.tpl"
OUT="${IMPORT_DIR}/zeroverify-realm.json"

sed \
  -e "s|__REALM_RSA_PRIVATE_KEY__|${KC_REALM_RSA_PRIVATE_KEY}|g" \
  -e "s|__REALM_RSA_CERT__|${KC_REALM_RSA_CERT}|g" \
  "${TPL}" > "${OUT}"

echo "Realm JSON written from template."
exec /opt/keycloak/bin/kc.sh start --import-realm --http-port="${PORT:-8080}"

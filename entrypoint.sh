#!/bin/bash
set -euo pipefail

: "${KC_REALM_RSA_PRIVATE_KEY:?Railway variable KC_REALM_RSA_PRIVATE_KEY is required}"
: "${KC_REALM_RSA_CERT:?Railway variable KC_REALM_RSA_CERT is required}"
: "${MOCK_IDP_RSA_PRIVATE_KEY:?Railway variable MOCK_IDP_RSA_PRIVATE_KEY is required}"
: "${MOCK_IDP_CERT:?Railway variable MOCK_IDP_CERT is required}"

IMPORT_DIR=/opt/keycloak/data/import

sed \
  -e "s|__REALM_RSA_PRIVATE_KEY__|${KC_REALM_RSA_PRIVATE_KEY}|g" \
  -e "s|__REALM_RSA_CERT__|${KC_REALM_RSA_CERT}|g" \
  -e "s|__MOCK_IDP_CERT__|${MOCK_IDP_CERT}|g" \
  "${IMPORT_DIR}/zeroverify-realm.json.tpl" > "${IMPORT_DIR}/zeroverify-realm.json"

sed \
  -e "s|__MOCK_IDP_RSA_PRIVATE_KEY__|${MOCK_IDP_RSA_PRIVATE_KEY}|g" \
  -e "s|__MOCK_IDP_CERT__|${MOCK_IDP_CERT}|g" \
  "${IMPORT_DIR}/mock-idp-realm.json.tpl" > "${IMPORT_DIR}/mock-idp-realm.json"

echo "Realm JSONs written from templates."
exec /opt/keycloak/bin/kc.sh start --import-realm --http-port="${PORT:-8080}"

FROM quay.io/keycloak/keycloak:24.0.5

COPY realm/zeroverify-realm.json.tpl /opt/keycloak/data/import/zeroverify-realm.json.tpl
COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh
USER keycloak

ENTRYPOINT ["/entrypoint.sh"]

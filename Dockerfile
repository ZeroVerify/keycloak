FROM quay.io/keycloak/keycloak:24.0.5

USER root
RUN mkdir -p /opt/keycloak/data/import && \
    chown -R keycloak:keycloak /opt/keycloak/data/import

COPY --chown=keycloak:keycloak realm/zeroverify-realm.json.tpl /opt/keycloak/data/import/zeroverify-realm.json.tpl
COPY --chown=keycloak:keycloak realm/mock-idp-realm.json.tpl /opt/keycloak/data/import/mock-idp-realm.json.tpl
COPY --chown=keycloak:keycloak entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER keycloak

ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx512m -XX:MaxMetaspaceSize=192m"

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]

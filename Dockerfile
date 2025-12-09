FROM quay.io/keycloak/keycloak:26.4.7

# Copiar tema customizado
COPY themes/promobank /opt/keycloak/themes/promobank

# Garantir permissões corretas
USER root
RUN chown -R 1000:1000 /opt/keycloak/themes/promobank
USER 1000

# Build otimizado do Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Configurações de ambiente
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

# Entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
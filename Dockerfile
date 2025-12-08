FROM quay.io/keycloak/keycloak:latest

# Customizações aqui
# COPY themes/ /opt/keycloak/themes/
# COPY providers/ /opt/keycloak/providers/

# Build otimizado para produção
RUN /opt/keycloak/bin/kc.sh build

# Configurações
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
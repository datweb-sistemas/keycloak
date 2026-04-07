FROM quay.io/keycloak/keycloak:26.4.7

# Copiar tema customizado
COPY themes/promobank /opt/keycloak/themes/promobank

# Garantir permissões corretas
USER root
RUN chown -R 1000:1000 /opt/keycloak/themes/promobank
USER 1000

# Configurações de build (devem ser definidas antes do kc.sh build
# para que sejam persistidas na imagem otimizada)
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_DB=postgres

# Build otimizado do Keycloak com as opções de build acima persistidas.
# A imagem resultante pode ser iniciada com --optimized, pulando o augmentation
# e reduzindo o tempo de startup de ~55s para ~10s.
RUN /opt/keycloak/bin/kc.sh build \
    --health-enabled=true \
    --metrics-enabled=true \
    --db=postgres

# Entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]

FROM datadog/agent:latest

# Habilitar APM y Logs
ENV DD_LOGS_ENABLED=true
ENV DD_APM_ENABLED=true
ENV DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_APM_NON_LOCAL_TRAFFIC=true
ENV DD_BIND_HOST=0.0.0.0
ENV DD_APM_RECEIVER_PORT=8126

# Establecer hostname explícito para evitar el crash
ENV DD_HOSTNAME=api-gateway

# NOTA: API_KEY y SITE se pasan en runtime, no se hardcodean
# Ejemplo: docker run -e DD_API_KEY=xxx -e DD_SITE=datadoghq.com ...

# Copiar configuración custom (opcional)
COPY datadog.yaml /etc/datadog-agent/datadog.yaml
COPY syslog.yaml /etc/datadog-agent/conf.d/syslog.d/

# Exponer puertos
EXPOSE 8125/udp
EXPOSE 8126
EXPOSE 514/udp
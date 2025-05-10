FROM datadog/agent:7

# Set environment variables
ENV DD_LOGS_ENABLED=true
ENV DD_APM_ENABLED=true
ENV DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_APM_NON_LOCAL_TRAFFIC=true
ENV DD_BIND_HOST=::1

# Environment Variables for Railway
ENV DD_API_KEY=${DD_API_KEY}
ENV DD_HOSTNAME=${DD_HOSTNAME}
ENV DD_SITE=${DD_SITE}

# Copy configuration files
COPY datadog.yaml /etc/datadog-agent/datadog.yaml

# Copy syslog configuration file
COPY syslog.yaml /etc/datadog-agent/conf.d/syslog.d/

# DogStatsD port, APM port, and the syslog port
EXPOSE 8125/udp
EXPOSE 8126
EXPOSE 514/udp

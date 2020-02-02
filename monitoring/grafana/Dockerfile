FROM grafana/grafana:6.5.3
COPY provisioning/datasources/prometheus.yaml /etc/grafana/provisioning/datasources/
COPY provisioning/dashboards/dashboards.yaml /etc/grafana/provisioning/dashboards/
COPY dashboards/* /etc/grafana/provisioning/dashboards/

FROM prom/prometheus
ARG prometheus_yml=prometheus.yml
RUN echo "Build Prometheus with $prometheus_yml"
COPY $prometheus_yml  /etc/prometheus/prometheus.yml
COPY prometheus.rules.yml  /etc/prometheus/prometheus.rules.yml
COPY prometheus.alerts.yml /etc/prometheus/prometheus.alerts.yml
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
#ENTRYPOINT [“bash”, “-c”, “chown nobody:nobody /etc/prometheus”]

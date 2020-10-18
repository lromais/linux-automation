#ADD METRICS KIBANA / ELASTICSEARCH

curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.7.0-amd64.deb && dpkg -i metricbeat-6.7.0-amd64.deb



output.elasticsearch:
  hosts: ["<es_url>"]

setup.kibana:
  host: "<kibana_url>"

  metricbeat modules enable system && metricbeat setup && systemctl enable metricbeat && systemctl start metricbeat && systemctl status metricbeat

  metricbeat setup
  systemctl enable metricbeat
  systemctl start metricbeat


journalctl -f | grep metricbeat

host: "10.158.0.33:5601"


["10.158.0.29:9200", "10.158.0.31:9200", "10.158.0.32:9200"]
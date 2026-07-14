CREATE TABLE network_devices (
  network_device_id INTEGER NOT NULL,
  device_id INTEGER,
  device_type VARCHAR(32),
  ip_address VARCHAR(32),
  firmware_version VARCHAR(32),
  status VARCHAR(32),
  last_heartbeat TIMESTAMP,
  service_level_agreement_id INTEGER,
  performance_metric_id INTEGER,
  PRIMARY KEY (network_device_id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (performance_metric_id) REFERENCES performance_metrics (id)
);

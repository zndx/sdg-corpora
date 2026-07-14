CREATE TABLE performance_metrics (
  id INTEGER NOT NULL,
  metric_id VARCHAR(44),
  metric_type VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  sample_time TIMESTAMP,
  source_device_id INTEGER,
  network_device_id INTEGER,
  service_level_agreement_id INTEGER,
  resource_management_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (network_device_id) REFERENCES network_devices (network_device_id),
  FOREIGN KEY (service_level_agreement_id) REFERENCES service_level_agreements (service_level_agreement_id),
  FOREIGN KEY (resource_management_system_id) REFERENCES resource_management_systems (resource_management_system_id)
);

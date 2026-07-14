CREATE TABLE cyber_threats (
  id INTEGER NOT NULL,
  threat_identifier VARCHAR(32),
  threat_type VARCHAR(32),
  target_operating_system VARCHAR(32),
  target_device_model VARCHAR(32),
  discovery_date TIMESTAMP,
  severity_level VARCHAR(32),
  is_exploited BOOLEAN,
  mitigation_status VARCHAR(32),
  medical_device_model_number VARCHAR(32),
  network_monitoring_solution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number),
  FOREIGN KEY (network_monitoring_solution_id) REFERENCES network_monitoring_solutions (id)
);

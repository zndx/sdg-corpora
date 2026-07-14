CREATE TABLE servers (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  model VARCHAR(32),
  partition_type VARCHAR(32),
  ipar_count INTEGER,
  status VARCHAR(32),
  last_health_check_date DATE,
  office_id INTEGER,
  software_version_id INTEGER,
  system_metric_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (office_id) REFERENCES offices (office_id),
  FOREIGN KEY (software_version_id) REFERENCES software_versions (software_version_id),
  FOREIGN KEY (system_metric_id) REFERENCES system_metrics (id)
);

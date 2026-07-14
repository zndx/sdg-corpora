CREATE TABLE network_monitoring_solutions (
  id INTEGER NOT NULL,
  solution_identifier VARCHAR(32),
  solution_name VARCHAR(32),
  is_real_time BOOLEAN,
  monitors_device_inventory BOOLEAN,
  detects_vulnerabilities BOOLEAN,
  last_scan_date TIMESTAMP,
  alert_threshold DECIMAL,
  cyber_threat_id INTEGER,
  clinical_site_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cyber_threat_id) REFERENCES cyber_threats (id),
  FOREIGN KEY (clinical_site_id) REFERENCES clinical_sites (clinical_site_id)
);

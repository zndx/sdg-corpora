CREATE TABLE arbour_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  monitoring_schedule VARCHAR(32),
  alert_proactive BOOLEAN,
  filtering_automatic BOOLEAN,
  last_analysis_date TIMESTAMP,
  status VARCHAR(32),
  network_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (network_id) REFERENCES networks (id)
);

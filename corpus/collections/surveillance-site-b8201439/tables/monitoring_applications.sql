CREATE TABLE monitoring_applications (
  monitoring_application_id INTEGER NOT NULL,
  app_id VARCHAR(44),
  app_name VARCHAR(32),
  version VARCHAR(32),
  interface_type VARCHAR(32),
  is_customized BOOLEAN,
  last_updated TIMESTAMP,
  control_centre_id INTEGER,
  PRIMARY KEY (monitoring_application_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);

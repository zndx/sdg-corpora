CREATE TABLE service_domains (
  service_domain_id INTEGER NOT NULL,
  domain_name VARCHAR(32),
  target_population VARCHAR(32),
  service_type VARCHAR(32),
  is_holistic BOOLEAN,
  inspection_report_id INTEGER,
  PRIMARY KEY (service_domain_id),
  FOREIGN KEY (inspection_report_id) REFERENCES inspection_reports (inspection_report_id)
);

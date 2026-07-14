CREATE TABLE inspection_reports (
  inspection_report_id INTEGER NOT NULL,
  report_id VARCHAR(32),
  publication_date DATE,
  reference_code VARCHAR(40),
  publisher VARCHAR(32),
  status VARCHAR(32),
  inspection_body_id INTEGER,
  service_domain_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (inspection_report_id),
  FOREIGN KEY (inspection_body_id) REFERENCES inspection_bodies (inspection_body_id),
  FOREIGN KEY (service_domain_id) REFERENCES service_domains (service_domain_id)
);

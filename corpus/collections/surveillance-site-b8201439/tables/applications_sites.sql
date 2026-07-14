CREATE TABLE applications_sites (
  monitoring_application_id INTEGER NOT NULL,
  surveillance_site_id INTEGER NOT NULL,
  PRIMARY KEY (monitoring_application_id, surveillance_site_id),
  FOREIGN KEY (monitoring_application_id) REFERENCES monitoring_applications (monitoring_application_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);

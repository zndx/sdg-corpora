CREATE TABLE applications_servers (
  monitoring_application_id INTEGER NOT NULL,
  processing_server_id INTEGER NOT NULL,
  PRIMARY KEY (monitoring_application_id, processing_server_id),
  FOREIGN KEY (monitoring_application_id) REFERENCES monitoring_applications (monitoring_application_id),
  FOREIGN KEY (processing_server_id) REFERENCES processing_servers (id)
);

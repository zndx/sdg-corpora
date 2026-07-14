CREATE TABLE servers_applications (
  processing_server_id INTEGER NOT NULL,
  monitoring_application_id INTEGER NOT NULL,
  PRIMARY KEY (processing_server_id, monitoring_application_id),
  FOREIGN KEY (processing_server_id) REFERENCES processing_servers (id),
  FOREIGN KEY (monitoring_application_id) REFERENCES monitoring_applications (monitoring_application_id)
);

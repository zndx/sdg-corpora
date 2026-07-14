CREATE TABLE network_information_centers (
  id INTEGER NOT NULL,
  center_name VARCHAR(32),
  operating_institution VARCHAR(32),
  sponsoring_agency VARCHAR(40),
  service_port INTEGER,
  service_protocol VARCHAR(32),
  service_host VARCHAR(32),
  service_status VARCHAR(32),
  directory_service_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (directory_service_id) REFERENCES directory_services (id)
);

CREATE TABLE software_versions (
  software_version_id INTEGER NOT NULL,
  software_id VARCHAR(32),
  application_name VARCHAR(32),
  version_number VARCHAR(32),
  release_date DATE,
  is_obsolete BOOLEAN,
  maintenance_status VARCHAR(32),
  office_id INTEGER,
  server_id INTEGER,
  PRIMARY KEY (software_version_id),
  FOREIGN KEY (office_id) REFERENCES offices (office_id),
  FOREIGN KEY (server_id) REFERENCES servers (id)
);

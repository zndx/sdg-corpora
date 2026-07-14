CREATE TABLE offices (
  office_id INTEGER NOT NULL,
  city VARCHAR(32),
  region VARCHAR(32),
  country VARCHAR(32),
  is_active BOOLEAN,
  established_date DATE,
  server_id INTEGER,
  software_version_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (office_id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (software_version_id) REFERENCES software_versions (software_version_id)
);

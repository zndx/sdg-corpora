CREATE TABLE servers (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  server_name VARCHAR(32),
  operating_system VARCHAR(32),
  is_breached BOOLEAN,
  location VARCHAR(32),
  data_file_id INTEGER,
  encryption_key_id INTEGER,
  automated_script_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_file_id) REFERENCES data_files (data_file_id),
  FOREIGN KEY (encryption_key_id) REFERENCES encryption_keys (id),
  FOREIGN KEY (automated_script_id) REFERENCES automated_scripts (id)
);

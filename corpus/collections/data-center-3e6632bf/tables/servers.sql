CREATE TABLE servers (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  os_type VARCHAR(32),
  racs_client_installed VARCHAR(32),
  access_level VARCHAR(32),
  last_log_push TIMESTAMP,
  status VARCHAR(32),
  r_a_c_s_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (r_a_c_s_id) REFERENCES r_a_c_ses (id)
);

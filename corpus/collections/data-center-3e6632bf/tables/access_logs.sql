CREATE TABLE access_logs (
  id INTEGER NOT NULL,
  log_id VARCHAR(44),
  timestamp TIMESTAMP,
  user_id VARCHAR(44),
  server_id VARCHAR(40),
  operation_type VARCHAR(32),
  status VARCHAR(32),
  generated_by_server_id INTEGER,
  r_a_c_s_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (generated_by_server_id) REFERENCES servers (id),
  FOREIGN KEY (r_a_c_s_id) REFERENCES r_a_c_ses (id)
);

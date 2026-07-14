CREATE TABLE authentication_servers (
  id INTEGER NOT NULL,
  server_id VARCHAR(40),
  server_type VARCHAR(32),
  server_address VARCHAR(32),
  is_primary BOOLEAN,
  mobile_worker_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mobile_worker_id) REFERENCES mobile_workers (mobile_worker_id)
);

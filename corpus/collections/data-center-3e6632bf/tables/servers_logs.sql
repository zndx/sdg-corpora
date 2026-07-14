CREATE TABLE servers_logs (
  server_id INTEGER NOT NULL,
  access_log_id INTEGER NOT NULL,
  PRIMARY KEY (server_id, access_log_id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (access_log_id) REFERENCES access_logs (id)
);

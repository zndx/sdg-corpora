CREATE TABLE centers_servers (
  data_center_id INTEGER NOT NULL,
  server_id INTEGER NOT NULL,
  PRIMARY KEY (data_center_id, server_id),
  FOREIGN KEY (data_center_id) REFERENCES data_centers (id),
  FOREIGN KEY (server_id) REFERENCES servers (id)
);

CREATE TABLE ses_servers (
  r_a_c_s_id INTEGER NOT NULL,
  server_id INTEGER NOT NULL,
  PRIMARY KEY (r_a_c_s_id, server_id),
  FOREIGN KEY (r_a_c_s_id) REFERENCES r_a_c_ses (id),
  FOREIGN KEY (server_id) REFERENCES servers (id)
);

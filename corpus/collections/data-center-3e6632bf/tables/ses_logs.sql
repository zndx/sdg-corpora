CREATE TABLE ses_logs (
  r_a_c_s_id INTEGER NOT NULL,
  access_log_id INTEGER NOT NULL,
  PRIMARY KEY (r_a_c_s_id, access_log_id),
  FOREIGN KEY (r_a_c_s_id) REFERENCES r_a_c_ses (id),
  FOREIGN KEY (access_log_id) REFERENCES access_logs (id)
);

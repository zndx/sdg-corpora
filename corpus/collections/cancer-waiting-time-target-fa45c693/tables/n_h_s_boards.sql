CREATE TABLE n_h_s_boards (
  id INTEGER NOT NULL,
  board_name VARCHAR(32),
  is_island_board BOOLEAN,
  region VARCHAR(32),
  reporting_status VARCHAR(32),
  cancer_waiting_time_target_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cancer_waiting_time_target_id) REFERENCES cancer_waiting_time_targets (id)
);

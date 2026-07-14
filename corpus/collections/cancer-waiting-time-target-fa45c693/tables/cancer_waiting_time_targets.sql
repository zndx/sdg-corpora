CREATE TABLE cancer_waiting_time_targets (
  id INTEGER NOT NULL,
  target_duration INTEGER,
  triggering_clinical_event VARCHAR(32),
  tolerance_percentage DECIMAL,
  implementation_date DATE,
  status VARCHAR(32),
  n_h_s_board_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (n_h_s_board_id) REFERENCES n_h_s_boards (id)
);

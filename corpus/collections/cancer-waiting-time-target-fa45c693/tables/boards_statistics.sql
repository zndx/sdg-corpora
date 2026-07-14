CREATE TABLE boards_statistics (
  n_h_s_board_id INTEGER NOT NULL,
  waiting_time_statistic_id INTEGER NOT NULL,
  PRIMARY KEY (n_h_s_board_id, waiting_time_statistic_id),
  FOREIGN KEY (n_h_s_board_id) REFERENCES n_h_s_boards (id),
  FOREIGN KEY (waiting_time_statistic_id) REFERENCES waiting_time_statistics (waiting_time_statistic_id)
);

CREATE TABLE campus_hearing_boards (
  campus_hearing_board_id INTEGER NOT NULL,
  board_id VARCHAR(35),
  board_name VARCHAR(32),
  established_date DATE,
  PRIMARY KEY (campus_hearing_board_id)
);

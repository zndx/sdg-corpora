CREATE TABLE boards_schools (
  board_id VARCHAR(35) NOT NULL,
  school_id INTEGER NOT NULL,
  PRIMARY KEY (board_id, school_id),
  FOREIGN KEY (board_id) REFERENCES school_boards (board_id),
  FOREIGN KEY (school_id) REFERENCES schools (id)
);

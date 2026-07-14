CREATE TABLE boards_hearings (
  campus_hearing_board_id INTEGER NOT NULL,
  hearing_id INTEGER NOT NULL,
  PRIMARY KEY (campus_hearing_board_id, hearing_id),
  FOREIGN KEY (campus_hearing_board_id) REFERENCES campus_hearing_boards (campus_hearing_board_id),
  FOREIGN KEY (hearing_id) REFERENCES hearings (id)
);

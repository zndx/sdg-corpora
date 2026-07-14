CREATE TABLE hearings (
  id INTEGER NOT NULL,
  hearing_id VARCHAR(32),
  scheduled_date TIMESTAMP,
  status VARCHAR(32),
  outcome VARCHAR(32),
  interim_suspension_id INTEGER,
  campus_hearing_board_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (interim_suspension_id) REFERENCES interim_suspensions (id),
  FOREIGN KEY (campus_hearing_board_id) REFERENCES campus_hearing_boards (campus_hearing_board_id)
);

CREATE TABLE board_of_equalizations (
  board_of_equalization_id INTEGER NOT NULL,
  board_id VARCHAR(35),
  jurisdiction VARCHAR(32),
  meeting_date DATE,
  status VARCHAR(32),
  appeal_waiver_id INTEGER,
  PRIMARY KEY (board_of_equalization_id),
  FOREIGN KEY (appeal_waiver_id) REFERENCES appeal_waivers (appeal_waiver_id)
);

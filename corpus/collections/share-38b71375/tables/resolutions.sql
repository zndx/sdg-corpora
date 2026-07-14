CREATE TABLE resolutions (
  id INTEGER NOT NULL,
  resolution_id VARCHAR(32),
  pass_date TIMESTAMP,
  resolution_type VARCHAR(32),
  amount DECIMAL,
  currency VARCHAR(32),
  is_published BOOLEAN,
  annual_general_meeting_id INTEGER,
  shareholder_id INTEGER,
  board_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (annual_general_meeting_id) REFERENCES annual_general_meetings (id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (shareholder_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (id)
);

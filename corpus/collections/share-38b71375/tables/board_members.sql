CREATE TABLE board_members (
  id INTEGER NOT NULL,
  member_id INTEGER,
  full_name VARCHAR(36),
  appointment_date DATE,
  term_end_date DATE,
  is_chairman BOOLEAN,
  fee_amount DECIMAL,
  payment_method VARCHAR(32),
  annual_general_meeting_id INTEGER,
  resolution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (annual_general_meeting_id) REFERENCES annual_general_meetings (id),
  FOREIGN KEY (resolution_id) REFERENCES resolutions (id)
);

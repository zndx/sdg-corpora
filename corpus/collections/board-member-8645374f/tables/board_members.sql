CREATE TABLE board_members (
  board_member_id INTEGER NOT NULL,
  member_id INTEGER,
  role_type VARCHAR(32),
  appointment_date DATE,
  termination_date DATE,
  is_current_member BOOLEAN,
  board_id VARCHAR(35),
  person_id INTEGER,
  position_id VARCHAR(44),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (board_member_id),
  FOREIGN KEY (board_id) REFERENCES governance_boards (board_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (position_id) REFERENCES leadership_positions (position_id)
);

CREATE TABLE policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_name VARCHAR(32),
  adoption_date TIMESTAMP,
  version_number INTEGER,
  is_current BOOLEAN,
  municipal_board_id INTEGER,
  selectboard_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id),
  FOREIGN KEY (selectboard_member_id) REFERENCES selectboard_members (id)
);

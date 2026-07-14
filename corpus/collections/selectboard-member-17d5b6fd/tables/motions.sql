CREATE TABLE motions (
  motion_id VARCHAR(35) NOT NULL,
  motion_text VARCHAR(32),
  vote_result VARCHAR(32),
  meeting_date TIMESTAMP,
  is_adopted BOOLEAN,
  selectboard_member_id INTEGER,
  seconded_by_selectboard_member_id INTEGER,
  policy_id INTEGER,
  license_id VARCHAR(35),
  PRIMARY KEY (motion_id),
  FOREIGN KEY (selectboard_member_id) REFERENCES selectboard_members (id),
  FOREIGN KEY (seconded_by_selectboard_member_id) REFERENCES selectboard_members (id),
  FOREIGN KEY (policy_id) REFERENCES policies (id),
  FOREIGN KEY (license_id) REFERENCES licenses (license_id)
);

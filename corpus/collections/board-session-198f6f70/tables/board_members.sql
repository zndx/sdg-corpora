CREATE TABLE board_members (
  board_member_id INTEGER NOT NULL,
  member_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  is_present BOOLEAN,
  voting_record VARCHAR(32),
  board_session_id INTEGER,
  board_motion_id INTEGER,
  PRIMARY KEY (board_member_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id),
  FOREIGN KEY (board_motion_id) REFERENCES board_motions (board_motion_id)
);

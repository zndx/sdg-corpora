CREATE TABLE board_motions (
  board_motion_id INTEGER NOT NULL,
  motion_id VARCHAR(35),
  motion_text VARCHAR(32),
  proposed_by VARCHAR(32),
  seconded_by VARCHAR(32),
  outcome VARCHAR(32),
  vote_count INTEGER,
  board_session_id INTEGER,
  board_member_id INTEGER,
  seconded_by_member_board_member_id INTEGER,
  votes_on_board_member_id INTEGER,
  PRIMARY KEY (board_motion_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (board_member_id),
  FOREIGN KEY (seconded_by_member_board_member_id) REFERENCES board_members (board_member_id),
  FOREIGN KEY (votes_on_board_member_id) REFERENCES board_members (board_member_id)
);

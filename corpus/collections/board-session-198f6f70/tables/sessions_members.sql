CREATE TABLE sessions_members (
  board_session_id INTEGER NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (board_session_id, board_member_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (board_member_id)
);

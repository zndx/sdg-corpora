CREATE TABLE sessions_staffs (
  board_session_id INTEGER NOT NULL,
  board_staff_id INTEGER NOT NULL,
  PRIMARY KEY (board_session_id, board_staff_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id),
  FOREIGN KEY (board_staff_id) REFERENCES board_staffs (board_staff_id)
);

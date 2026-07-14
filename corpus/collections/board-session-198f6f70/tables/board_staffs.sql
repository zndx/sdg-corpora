CREATE TABLE board_staffs (
  board_staff_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  job_title VARCHAR(35),
  is_present BOOLEAN,
  board_session_id INTEGER,
  zoning_case_id INTEGER,
  PRIMARY KEY (board_staff_id),
  FOREIGN KEY (board_session_id) REFERENCES board_sessions (board_session_id),
  FOREIGN KEY (zoning_case_id) REFERENCES zoning_cases (id)
);

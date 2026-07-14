CREATE TABLE board_sessions (
  board_session_id INTEGER NOT NULL,
  session_date DATE,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  session_type VARCHAR(32),
  panel_designation VARCHAR(32),
  location VARCHAR(32),
  chairperson_name VARCHAR(32),
  is_precedent_setting BOOLEAN,
  zoning_case_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (board_session_id),
  FOREIGN KEY (zoning_case_id) REFERENCES zoning_cases (id)
);

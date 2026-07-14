CREATE TABLE conduct_violations (
  id INTEGER NOT NULL,
  violation_id VARCHAR(32),
  description VARCHAR(32),
  date_of_incident TIMESTAMP,
  location VARCHAR(32),
  severity_level INTEGER,
  status VARCHAR(32),
  student_id INTEGER,
  student_conduct_board_id INTEGER,
  student_conduct_administrator_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (student_conduct_board_id) REFERENCES student_conduct_boards (id),
  FOREIGN KEY (student_conduct_administrator_id) REFERENCES student_conduct_administrators (student_conduct_administrator_id)
);

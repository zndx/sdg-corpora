CREATE TABLE student_conduct_boards (
  id INTEGER NOT NULL,
  board_id VARCHAR(35),
  composition VARCHAR(32),
  authorization_date DATE,
  status VARCHAR(32),
  conduct_violation_id INTEGER,
  official_id VARCHAR(42),
  PRIMARY KEY (id),
  FOREIGN KEY (conduct_violation_id) REFERENCES conduct_violations (id),
  FOREIGN KEY (official_id) REFERENCES university_officials (official_id)
);

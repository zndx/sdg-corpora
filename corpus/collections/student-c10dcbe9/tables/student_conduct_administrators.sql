CREATE TABLE student_conduct_administrators (
  student_conduct_administrator_id INTEGER NOT NULL,
  administrator_id VARCHAR(44),
  authorization_date DATE,
  case_authorization BOOLEAN,
  status VARCHAR(32),
  conduct_violation_id INTEGER,
  official_id VARCHAR(42),
  PRIMARY KEY (student_conduct_administrator_id),
  FOREIGN KEY (conduct_violation_id) REFERENCES conduct_violations (id),
  FOREIGN KEY (official_id) REFERENCES university_officials (official_id)
);

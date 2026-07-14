CREATE TABLE university_premiseses (
  university_premises_id INTEGER NOT NULL,
  premises_id VARCHAR(32),
  name VARCHAR(32),
  type VARCHAR(32),
  location VARCHAR(32),
  conduct_violation_id INTEGER,
  PRIMARY KEY (university_premises_id),
  FOREIGN KEY (conduct_violation_id) REFERENCES conduct_violations (id)
);

CREATE TABLE english_proficiency_tests (
  id INTEGER NOT NULL,
  test_id INTEGER,
  test_name VARCHAR(32),
  min_score INTEGER,
  test_format VARCHAR(32),
  admission_requirement_id INTEGER,
  test_score_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (admission_requirement_id) REFERENCES admission_requirements (id),
  FOREIGN KEY (test_score_id) REFERENCES test_scores (id)
);

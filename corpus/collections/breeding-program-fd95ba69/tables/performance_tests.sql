CREATE TABLE performance_tests (
  test_id INTEGER NOT NULL,
  test_date TIMESTAMP,
  jumping_score DECIMAL,
  breeding_value DECIMAL,
  test_type VARCHAR(32),
  horse_id INTEGER,
  evaluator_id INTEGER,
  PRIMARY KEY (test_id),
  FOREIGN KEY (horse_id) REFERENCES horses (id),
  FOREIGN KEY (evaluator_id) REFERENCES evaluators (id)
);

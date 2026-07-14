CREATE TABLE evaluators (
  id INTEGER NOT NULL,
  evaluator_id VARCHAR(44),
  evaluator_name VARCHAR(32),
  organization VARCHAR(39),
  role VARCHAR(32),
  test_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (test_id) REFERENCES performance_tests (test_id)
);

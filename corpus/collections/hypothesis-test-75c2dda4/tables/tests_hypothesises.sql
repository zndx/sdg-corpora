CREATE TABLE tests_hypothesises (
  hypothesis_test_id INTEGER NOT NULL,
  statistical_hypothesis_id INTEGER NOT NULL,
  PRIMARY KEY (hypothesis_test_id, statistical_hypothesis_id),
  FOREIGN KEY (hypothesis_test_id) REFERENCES hypothesis_tests (id),
  FOREIGN KEY (statistical_hypothesis_id) REFERENCES statistical_hypothesises (statistical_hypothesis_id)
);

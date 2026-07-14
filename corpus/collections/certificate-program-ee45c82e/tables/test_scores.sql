CREATE TABLE test_scores (
  id INTEGER NOT NULL,
  score_id VARCHAR(44),
  score_value INTEGER,
  test_date DATE,
  valid_until DATE,
  english_proficiency_test_id INTEGER,
  applicant_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (english_proficiency_test_id) REFERENCES english_proficiency_tests (id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (applicant_id)
);

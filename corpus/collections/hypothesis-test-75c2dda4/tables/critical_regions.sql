CREATE TABLE critical_regions (
  id INTEGER NOT NULL,
  region_type VARCHAR(32),
  lower_bound INTEGER,
  upper_bound INTEGER,
  critical_value INTEGER,
  hypothesis_test_id INTEGER,
  test_statistic_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hypothesis_test_id) REFERENCES hypothesis_tests (id),
  FOREIGN KEY (test_statistic_id) REFERENCES test_statistics (id)
);

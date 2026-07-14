CREATE TABLE mental_health_issues (
  mental_health_issue_id INTEGER NOT NULL,
  issue_code VARCHAR(44),
  issue_name VARCHAR(32),
  severity_level VARCHAR(32),
  is_treatable BOOLEAN,
  prevalence_in_teens DECIMAL,
  barrier_to_treatment VARCHAR(32),
  youth_demographic_id INTEGER,
  PRIMARY KEY (mental_health_issue_id),
  FOREIGN KEY (youth_demographic_id) REFERENCES youth_demographics (youth_demographic_id)
);

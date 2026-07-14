CREATE TABLE youth_demographics (
  youth_demographic_id INTEGER NOT NULL,
  demographic_identifier VARCHAR(32),
  age_range_start INTEGER,
  age_range_end INTEGER,
  role VARCHAR(32),
  institution_type VARCHAR(32),
  total_reached INTEGER,
  mental_health_education_program_id INTEGER,
  mental_health_issue_id INTEGER,
  PRIMARY KEY (youth_demographic_id),
  FOREIGN KEY (mental_health_education_program_id) REFERENCES mental_health_education_programs (mental_health_education_program_id),
  FOREIGN KEY (mental_health_issue_id) REFERENCES mental_health_issues (mental_health_issue_id)
);

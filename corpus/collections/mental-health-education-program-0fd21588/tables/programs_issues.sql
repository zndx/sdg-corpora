CREATE TABLE programs_issues (
  mental_health_education_program_id INTEGER NOT NULL,
  mental_health_issue_id INTEGER NOT NULL,
  PRIMARY KEY (mental_health_education_program_id, mental_health_issue_id),
  FOREIGN KEY (mental_health_education_program_id) REFERENCES mental_health_education_programs (mental_health_education_program_id),
  FOREIGN KEY (mental_health_issue_id) REFERENCES mental_health_issues (mental_health_issue_id)
);

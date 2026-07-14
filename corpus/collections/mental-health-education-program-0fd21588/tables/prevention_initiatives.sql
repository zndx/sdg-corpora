CREATE TABLE prevention_initiatives (
  id INTEGER NOT NULL,
  initiative_identifier VARCHAR(32),
  initiative_name VARCHAR(32),
  launch_date DATE,
  target_behavior VARCHAR(32),
  is_best_practice BOOLEAN,
  qualifies_for_training BOOLEAN,
  mental_health_education_program_id INTEGER,
  mental_health_issue_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (mental_health_education_program_id) REFERENCES mental_health_education_programs (mental_health_education_program_id),
  FOREIGN KEY (mental_health_issue_id) REFERENCES mental_health_issues (mental_health_issue_id)
);

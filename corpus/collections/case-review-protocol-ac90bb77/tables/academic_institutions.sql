CREATE TABLE academic_institutions (
  academic_institution_id INTEGER NOT NULL,
  institution_identifier VARCHAR(32),
  institution_name VARCHAR(32),
  location VARCHAR(32),
  department_name VARCHAR(32),
  college_name VARCHAR(32),
  expert_reviewer_id INTEGER,
  PRIMARY KEY (academic_institution_id),
  FOREIGN KEY (expert_reviewer_id) REFERENCES expert_reviewers (id)
);

CREATE TABLE expert_reviewers (
  id INTEGER NOT NULL,
  reviewer_identifier VARCHAR(32),
  reviewer_name VARCHAR(32),
  academic_title VARCHAR(32),
  institution VARCHAR(32),
  years_experience INTEGER,
  specialization VARCHAR(32),
  review_date TIMESTAMP,
  case_review_protocol_id INTEGER,
  academic_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (case_review_protocol_id) REFERENCES case_review_protocols (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (academic_institution_id)
);

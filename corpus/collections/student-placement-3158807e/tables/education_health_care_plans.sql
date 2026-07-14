CREATE TABLE education_health_care_plans (
  id INTEGER NOT NULL,
  ehcp_id VARCHAR(44),
  issue_date DATE,
  review_date DATE,
  status VARCHAR(32),
  funding_agreed BOOLEAN,
  student_id VARCHAR(32),
  local_education_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (local_education_authority_id) REFERENCES local_education_authorities (local_education_authority_id)
);

CREATE TABLE education_health_care_plans (
  id INTEGER NOT NULL,
  ehcp_id VARCHAR(44),
  issuing_l_e_a VARCHAR(32),
  issue_date TIMESTAMP,
  review_date TIMESTAMP,
  funding_status VARCHAR(32),
  legal_status VARCHAR(32),
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

CREATE TABLE assessments_users (
  needs_assessment_id INTEGER NOT NULL,
  service_user_id INTEGER NOT NULL,
  PRIMARY KEY (needs_assessment_id, service_user_id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id)
);

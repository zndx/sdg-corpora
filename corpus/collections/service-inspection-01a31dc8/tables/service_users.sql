CREATE TABLE service_users (
  id INTEGER NOT NULL,
  user_id VARCHAR(44),
  user_type VARCHAR(32),
  has_disability BOOLEAN,
  disability_type VARCHAR(32),
  parenting_status VARCHAR(32),
  needs_acknowledged BOOLEAN,
  service_user_id INTEGER,
  needs_assessment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_user_id) REFERENCES service_users (id),
  FOREIGN KEY (needs_assessment_id) REFERENCES needs_assessments (id)
);

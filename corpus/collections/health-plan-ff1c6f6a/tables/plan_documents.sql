CREATE TABLE plan_documents (
  id INTEGER NOT NULL,
  document_identifier VARCHAR(32),
  document_type VARCHAR(32),
  version_number VARCHAR(32),
  issue_date DATE,
  distribution_status VARCHAR(32),
  contains_grandfather_status BOOLEAN,
  requires_amendment BOOLEAN,
  health_plan_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id)
);

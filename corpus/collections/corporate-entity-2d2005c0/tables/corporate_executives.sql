CREATE TABLE corporate_executives (
  corporate_executive_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  job_title VARCHAR(32),
  reporting_line VARCHAR(32),
  appointment_status VARCHAR(32),
  primary_domain VARCHAR(32),
  reports_to_corporate_executive_id INTEGER,
  corporate_entity_id INTEGER,
  holds_role_at_corporate_entity_id INTEGER,
  PRIMARY KEY (corporate_executive_id),
  FOREIGN KEY (reports_to_corporate_executive_id) REFERENCES corporate_executives (corporate_executive_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (id),
  FOREIGN KEY (holds_role_at_corporate_entity_id) REFERENCES corporate_entities (id)
);

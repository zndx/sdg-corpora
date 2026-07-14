CREATE TABLE legal_frameworks (
  id INTEGER NOT NULL,
  framework_identifier VARCHAR(32),
  jurisdiction VARCHAR(32),
  enactment_date DATE,
  issuing_body VARCHAR(32),
  framework_type VARCHAR(32),
  status VARCHAR(32),
  safeguarding_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (safeguarding_policy_id) REFERENCES safeguarding_policies (safeguarding_policy_id)
);

CREATE TABLE preventive_policies (
  policy_id VARCHAR(35) NOT NULL,
  policy_name VARCHAR(32),
  policy_type VARCHAR(32),
  implementation_status VARCHAR(32),
  target_demographic VARCHAR(32),
  effective_date DATE,
  enforcing_body VARCHAR(32),
  jurisdiction_id INTEGER,
  PRIMARY KEY (policy_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);

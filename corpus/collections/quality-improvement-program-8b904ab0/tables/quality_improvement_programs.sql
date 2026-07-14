CREATE TABLE quality_improvement_programs (
  id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  methodology VARCHAR(32),
  organization_org_id VARCHAR(32),
  policy_instrument_policy_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (organization_org_id) REFERENCES organizations (org_id),
  FOREIGN KEY (policy_instrument_policy_id) REFERENCES policy_instruments (policy_id)
);

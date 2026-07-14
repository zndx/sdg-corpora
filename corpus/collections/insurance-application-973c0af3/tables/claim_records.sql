CREATE TABLE claim_records (
  id INTEGER NOT NULL,
  claim_id VARCHAR(40),
  claim_year INTEGER,
  premium_paid DECIMAL,
  total_incurred_claims DECIMAL,
  claim_description VARCHAR(32),
  exceeds_threshold BOOLEAN,
  threshold_amount DECIMAL,
  organization_id INTEGER,
  coverage_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (coverage_policy_id) REFERENCES coverage_policies (id)
);

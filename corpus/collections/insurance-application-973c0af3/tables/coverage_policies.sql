CREATE TABLE coverage_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  coverage_type VARCHAR(32),
  coverage_limit DECIMAL,
  deductible_amount VARCHAR(32),
  is_excess_coverage BOOLEAN,
  claim_excess_threshold DECIMAL,
  event_id INTEGER,
  organization_id INTEGER,
  participant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);

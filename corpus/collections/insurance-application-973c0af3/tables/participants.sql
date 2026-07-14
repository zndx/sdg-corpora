CREATE TABLE participants (
  participant_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  is_minor BOOLEAN,
  waiver_signed BOOLEAN,
  assumption_of_risk_signed BOOLEAN,
  event_id INTEGER,
  coverage_policy_id INTEGER,
  PRIMARY KEY (participant_id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (coverage_policy_id) REFERENCES coverage_policies (id)
);

CREATE TABLE safeguarding_policies (
  safeguarding_policy_id INTEGER NOT NULL,
  policy_identifier VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  jurisdiction VARCHAR(32),
  compliance_status VARCHAR(32),
  last_review_date DATE,
  PRIMARY KEY (safeguarding_policy_id)
);

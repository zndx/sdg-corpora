CREATE TABLE policies_frameworks (
  safeguarding_policy_id INTEGER NOT NULL,
  legal_framework_id INTEGER NOT NULL,
  PRIMARY KEY (safeguarding_policy_id, legal_framework_id),
  FOREIGN KEY (safeguarding_policy_id) REFERENCES safeguarding_policies (safeguarding_policy_id),
  FOREIGN KEY (legal_framework_id) REFERENCES legal_frameworks (id)
);

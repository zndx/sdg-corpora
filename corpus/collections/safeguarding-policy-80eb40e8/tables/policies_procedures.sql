CREATE TABLE policies_procedures (
  safeguarding_policy_id INTEGER NOT NULL,
  safeguarding_procedure_id INTEGER NOT NULL,
  PRIMARY KEY (safeguarding_policy_id, safeguarding_procedure_id),
  FOREIGN KEY (safeguarding_policy_id) REFERENCES safeguarding_policies (safeguarding_policy_id),
  FOREIGN KEY (safeguarding_procedure_id) REFERENCES safeguarding_procedures (safeguarding_procedure_id)
);

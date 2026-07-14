CREATE TABLE governance_policies (
  id INTEGER NOT NULL,
  policy_i_d VARCHAR(32),
  policy_title VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  compliance_status VARCHAR(32),
  unit_i_d VARCHAR(32),
  governance_domain_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (unit_i_d) REFERENCES business_units (unit_i_d),
  FOREIGN KEY (governance_domain_id) REFERENCES governance_domains (governance_domain_id)
);

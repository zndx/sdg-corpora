CREATE TABLE government_agencies (
  id INTEGER NOT NULL,
  agency_name VARCHAR(37),
  jurisdiction VARCHAR(32),
  established_date DATE,
  agency_type VARCHAR(32),
  legal_authority VARCHAR(32),
  bailout_program_id INTEGER,
  financial_institution_id INTEGER,
  policy_decision_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (bailout_program_id) REFERENCES bailout_programs (bailout_program_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id),
  FOREIGN KEY (policy_decision_id) REFERENCES policy_decisions (id)
);

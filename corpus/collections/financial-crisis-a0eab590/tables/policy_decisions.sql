CREATE TABLE policy_decisions (
  id INTEGER NOT NULL,
  decision_title VARCHAR(32),
  effective_date DATE,
  decision_type VARCHAR(32),
  issuing_authority VARCHAR(32),
  legal_basis VARCHAR(32),
  economic_condition_id INTEGER,
  government_agency_id INTEGER,
  financial_crisis_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (economic_condition_id) REFERENCES economic_conditions (id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (id),
  FOREIGN KEY (financial_crisis_id) REFERENCES financial_crisises (id)
);

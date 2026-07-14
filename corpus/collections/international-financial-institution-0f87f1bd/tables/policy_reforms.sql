CREATE TABLE policy_reforms (
  policy_reform_id INTEGER NOT NULL,
  reform_id VARCHAR(44),
  reform_title VARCHAR(32),
  proposed_year INTEGER,
  target_mechanism VARCHAR(32),
  reform_type VARCHAR(32),
  implementation_status VARCHAR(32),
  international_financial_institution_id INTEGER,
  accountability_mechanism_id INTEGER,
  PRIMARY KEY (policy_reform_id),
  FOREIGN KEY (international_financial_institution_id) REFERENCES international_financial_institutions (id),
  FOREIGN KEY (accountability_mechanism_id) REFERENCES accountability_mechanisms (id)
);

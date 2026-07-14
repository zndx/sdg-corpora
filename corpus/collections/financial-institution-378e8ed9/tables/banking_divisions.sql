CREATE TABLE banking_divisions (
  id INTEGER NOT NULL,
  division_code VARCHAR(44),
  division_name VARCHAR(32),
  oversight_level VARCHAR(32),
  compliance_officer_id VARCHAR(44),
  financial_institution_id INTEGER,
  client_id VARCHAR(32),
  deficiency_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (client_id) REFERENCES high_risk_clients (client_id),
  FOREIGN KEY (deficiency_id) REFERENCES compliance_deficiencies (deficiency_id)
);

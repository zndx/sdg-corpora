CREATE TABLE institutional_lenders (
  institutional_lender_id INTEGER NOT NULL,
  lender_identifier VARCHAR(32),
  lender_name VARCHAR(32),
  lender_type VARCHAR(32),
  total_capital_deployed DECIMAL,
  risk_tolerance VARCHAR(32),
  jurisdiction VARCHAR(32),
  financial_development_corporation_id INTEGER,
  capital_access_program_id INTEGER,
  PRIMARY KEY (institutional_lender_id),
  FOREIGN KEY (financial_development_corporation_id) REFERENCES financial_development_corporations (financial_development_corporation_id),
  FOREIGN KEY (capital_access_program_id) REFERENCES capital_access_programs (capital_access_program_id)
);

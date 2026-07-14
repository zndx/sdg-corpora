CREATE TABLE economic_development_banks (
  economic_development_bank_id INTEGER NOT NULL,
  bank_identifier VARCHAR(32),
  bank_name VARCHAR(32),
  founding_year INTEGER,
  governing_office VARCHAR(32),
  total_financed_amount VARCHAR(32),
  bond_issuance_authority BOOLEAN,
  jurisdiction VARCHAR(32),
  financial_development_corporation_id INTEGER,
  infrastructure_project_id INTEGER,
  small_business_id INTEGER,
  PRIMARY KEY (economic_development_bank_id),
  FOREIGN KEY (financial_development_corporation_id) REFERENCES financial_development_corporations (financial_development_corporation_id),
  FOREIGN KEY (infrastructure_project_id) REFERENCES infrastructure_projects (id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id)
);

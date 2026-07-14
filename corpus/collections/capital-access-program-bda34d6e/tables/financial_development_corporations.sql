CREATE TABLE financial_development_corporations (
  financial_development_corporation_id INTEGER NOT NULL,
  fdc_identifier VARCHAR(32),
  fdc_name VARCHAR(32),
  establishment_date TIMESTAMP,
  public_dollars_leveraged DECIMAL,
  total_guarantee_issuance DECIMAL,
  deployment_status VARCHAR(32),
  jurisdiction VARCHAR(32),
  capital_access_program_id INTEGER,
  institutional_lender_id INTEGER,
  underserved_community_id INTEGER,
  PRIMARY KEY (financial_development_corporation_id),
  FOREIGN KEY (capital_access_program_id) REFERENCES capital_access_programs (capital_access_program_id),
  FOREIGN KEY (institutional_lender_id) REFERENCES institutional_lenders (institutional_lender_id),
  FOREIGN KEY (underserved_community_id) REFERENCES underserved_communities (underserved_community_id)
);

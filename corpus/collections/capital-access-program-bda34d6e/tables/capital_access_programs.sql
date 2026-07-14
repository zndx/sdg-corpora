CREATE TABLE capital_access_programs (
  capital_access_program_id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  established_date TIMESTAMP,
  total_financed_amount VARCHAR(32),
  max_guarantee_amount VARCHAR(32),
  program_status VARCHAR(32),
  target_jurisdiction VARCHAR(32),
  economic_development_bank_id INTEGER,
  financial_development_corporation_id INTEGER,
  small_business_id INTEGER,
  underserved_community_id INTEGER,
  PRIMARY KEY (capital_access_program_id),
  FOREIGN KEY (economic_development_bank_id) REFERENCES economic_development_banks (economic_development_bank_id),
  FOREIGN KEY (financial_development_corporation_id) REFERENCES financial_development_corporations (financial_development_corporation_id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id),
  FOREIGN KEY (underserved_community_id) REFERENCES underserved_communities (underserved_community_id)
);

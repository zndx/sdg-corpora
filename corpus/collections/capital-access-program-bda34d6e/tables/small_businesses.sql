CREATE TABLE small_businesses (
  id INTEGER NOT NULL,
  business_identifier VARCHAR(32),
  business_name VARCHAR(32),
  industry_sector VARCHAR(32),
  employee_count INTEGER,
  job_creation_commitment INTEGER,
  employee_retention_commitment VARCHAR(32),
  tax_base_impact DECIMAL,
  capital_access_program_id INTEGER,
  financial_development_corporation_id INTEGER,
  underserved_community_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (capital_access_program_id) REFERENCES capital_access_programs (capital_access_program_id),
  FOREIGN KEY (financial_development_corporation_id) REFERENCES financial_development_corporations (financial_development_corporation_id),
  FOREIGN KEY (underserved_community_id) REFERENCES underserved_communities (underserved_community_id)
);

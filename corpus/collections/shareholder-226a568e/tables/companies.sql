CREATE TABLE companies (
  company_id VARCHAR(32) NOT NULL,
  legal_name VARCHAR(32),
  registration_number VARCHAR(32),
  listing_status VARCHAR(32),
  fiscal_year INTEGER,
  governance_code VARCHAR(44),
  director_id INTEGER,
  PRIMARY KEY (company_id),
  FOREIGN KEY (director_id) REFERENCES investor_relations_directors (director_id)
);

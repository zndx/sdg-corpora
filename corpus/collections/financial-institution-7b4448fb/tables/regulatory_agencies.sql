CREATE TABLE regulatory_agencies (
  agency_id VARCHAR(39) NOT NULL,
  agency_name VARCHAR(37),
  jurisdiction VARCHAR(32),
  is_international BOOLEAN,
  founded_year INTEGER,
  enforcement_level VARCHAR(32),
  financial_institution_id INTEGER,
  PRIMARY KEY (agency_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id)
);

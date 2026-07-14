CREATE TABLE development_projects (
  id INTEGER NOT NULL,
  project_id VARCHAR(44),
  project_name VARCHAR(32),
  project_type VARCHAR(32),
  location_country VARCHAR(32),
  funding_institution VARCHAR(32),
  start_date DATE,
  end_date DATE,
  total_budget DECIMAL,
  international_financial_institution_id INTEGER,
  accountability_mechanism_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (international_financial_institution_id) REFERENCES international_financial_institutions (id),
  FOREIGN KEY (accountability_mechanism_id) REFERENCES accountability_mechanisms (id)
);

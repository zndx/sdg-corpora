CREATE TABLE healthcare_expenditures (
  expenditure_id VARCHAR(44) NOT NULL,
  currency_code VARCHAR(44),
  amount_per_person DECIMAL,
  total_amount VARCHAR(32),
  fiscal_year INTEGER,
  coverage_percentage DECIMAL,
  allocation_region VARCHAR(32),
  jurisdiction_id INTEGER,
  PRIMARY KEY (expenditure_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);

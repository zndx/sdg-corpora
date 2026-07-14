CREATE TABLE prod_asset_divestments (
  divestment_id VARCHAR(32) NOT NULL,
  total_value DECIMAL,
  currency VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  company_id INTEGER,
  transferred_to_company_id INTEGER,
  PRIMARY KEY (divestment_id),
  FOREIGN KEY (company_id) REFERENCES prod_companies (company_id),
  FOREIGN KEY (transferred_to_company_id) REFERENCES prod_companies (company_id)
);

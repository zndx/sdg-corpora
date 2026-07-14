CREATE TABLE product_disclosure_statements (
  id INTEGER NOT NULL,
  pds_id VARCHAR(44),
  issue_date DATE,
  valid_until_date DATE,
  total_fees VARCHAR(32),
  significant_risks VARCHAR(32),
  financial_product_id INTEGER,
  financial_licence_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_product_id) REFERENCES financial_products (id),
  FOREIGN KEY (financial_licence_id) REFERENCES financial_licences (id)
);

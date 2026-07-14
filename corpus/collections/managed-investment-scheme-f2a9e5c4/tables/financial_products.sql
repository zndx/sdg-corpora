CREATE TABLE financial_products (
  product_id VARCHAR(32) NOT NULL,
  product_type VARCHAR(32),
  issue_price DECIMAL,
  management_fee DECIMAL,
  risk_rating VARCHAR(32),
  managed_investment_scheme_id INTEGER,
  product_disclosure_statement_id INTEGER,
  PRIMARY KEY (product_id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (id),
  FOREIGN KEY (product_disclosure_statement_id) REFERENCES product_disclosure_statements (id)
);

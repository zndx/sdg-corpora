CREATE TABLE financial_products (
  id INTEGER NOT NULL,
  product_type VARCHAR(32),
  product_code VARCHAR(32),
  issue_price DECIMAL,
  minimum_investment DECIMAL,
  risk_rating VARCHAR(32),
  managed_investment_scheme_id INTEGER,
  product_disclosure_statement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (managed_investment_scheme_id),
  FOREIGN KEY (product_disclosure_statement_id) REFERENCES product_disclosure_statements (id)
);

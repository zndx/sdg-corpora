CREATE TABLE schemes_products (
  managed_investment_scheme_id INTEGER NOT NULL,
  financial_product_id INTEGER NOT NULL,
  PRIMARY KEY (managed_investment_scheme_id, financial_product_id),
  FOREIGN KEY (managed_investment_scheme_id) REFERENCES managed_investment_schemes (managed_investment_scheme_id),
  FOREIGN KEY (financial_product_id) REFERENCES financial_products (id)
);

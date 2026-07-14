CREATE TABLE statements_products (
  product_disclosure_statement_id INTEGER NOT NULL,
  product_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (product_disclosure_statement_id, product_id),
  FOREIGN KEY (product_disclosure_statement_id) REFERENCES product_disclosure_statements (id),
  FOREIGN KEY (product_id) REFERENCES financial_products (product_id)
);

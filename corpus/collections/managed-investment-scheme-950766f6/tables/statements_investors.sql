CREATE TABLE statements_investors (
  product_disclosure_statement_id INTEGER NOT NULL,
  investor_id INTEGER NOT NULL,
  PRIMARY KEY (product_disclosure_statement_id, investor_id),
  FOREIGN KEY (product_disclosure_statement_id) REFERENCES product_disclosure_statements (id),
  FOREIGN KEY (investor_id) REFERENCES investors (investor_id)
);

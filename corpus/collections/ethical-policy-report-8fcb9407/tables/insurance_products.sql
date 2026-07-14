CREATE TABLE insurance_products (
  insurance_product_id INTEGER NOT NULL,
  product_id VARCHAR(32),
  product_name VARCHAR(32),
  product_type VARCHAR(32),
  underwriter VARCHAR(32),
  coverage_scope VARCHAR(32),
  financial_institution_id INTEGER,
  PRIMARY KEY (insurance_product_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id)
);

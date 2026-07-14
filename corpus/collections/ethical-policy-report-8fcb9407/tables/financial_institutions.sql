CREATE TABLE financial_institutions (
  financial_institution_id INTEGER NOT NULL,
  institution_id INTEGER,
  institution_name VARCHAR(32),
  headquarters_location VARCHAR(32),
  customer_count INTEGER,
  ethical_policy_adopted BOOLEAN,
  insurance_product_id INTEGER,
  entity_id VARCHAR(44),
  PRIMARY KEY (financial_institution_id),
  FOREIGN KEY (insurance_product_id) REFERENCES insurance_products (insurance_product_id),
  FOREIGN KEY (entity_id) REFERENCES corporate_entities (entity_id)
);

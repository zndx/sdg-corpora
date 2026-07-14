CREATE TABLE consumers (
  id INTEGER NOT NULL,
  consumer_id INTEGER,
  full_name VARCHAR(36),
  residence_state VARCHAR(32),
  lifestyle_type VARCHAR(32),
  disposable_product_id INTEGER,
  state_code INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (disposable_product_id) REFERENCES disposable_products (id),
  FOREIGN KEY (state_code) REFERENCES states (state_code)
);

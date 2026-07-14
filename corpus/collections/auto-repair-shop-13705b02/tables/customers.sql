CREATE TABLE customers (
  id INTEGER NOT NULL,
  customer_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  contact_number VARCHAR(32),
  satisfaction_score DECIMAL,
  is_raving_fan BOOLEAN,
  auto_repair_shop_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (auto_repair_shop_id) REFERENCES auto_repair_shops (id)
);

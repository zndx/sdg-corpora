CREATE TABLE auto_repair_shops (
  auto_repair_shop_id INTEGER NOT NULL,
  shop_id VARCHAR(44),
  shop_name VARCHAR(32),
  established_date DATE,
  shop_type VARCHAR(32),
  daily_production_target DECIMAL,
  customer_satisfaction_score DECIMAL,
  is_profitable BOOLEAN,
  customer_id INTEGER,
  PRIMARY KEY (auto_repair_shop_id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

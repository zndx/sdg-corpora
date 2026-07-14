CREATE TABLE shops_customers (
  auto_repair_shop_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  PRIMARY KEY (auto_repair_shop_id, customer_id),
  FOREIGN KEY (auto_repair_shop_id) REFERENCES auto_repair_shops (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

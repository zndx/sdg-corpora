CREATE TABLE stalls_products (
  festival_stall_id INTEGER NOT NULL,
  product_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (festival_stall_id, product_id),
  FOREIGN KEY (festival_stall_id) REFERENCES festival_stalls (festival_stall_id),
  FOREIGN KEY (product_id) REFERENCES agricultural_products (product_id)
);

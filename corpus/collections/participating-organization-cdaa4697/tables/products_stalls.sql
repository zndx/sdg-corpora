CREATE TABLE products_stalls (
  product_id VARCHAR(32) NOT NULL,
  festival_stall_id INTEGER NOT NULL,
  PRIMARY KEY (product_id, festival_stall_id),
  FOREIGN KEY (product_id) REFERENCES agricultural_products (product_id),
  FOREIGN KEY (festival_stall_id) REFERENCES festival_stalls (festival_stall_id)
);

CREATE TABLE manufacturers_products (
  manufacturer_id INTEGER NOT NULL,
  approved_product_id INTEGER NOT NULL,
  PRIMARY KEY (manufacturer_id, approved_product_id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id),
  FOREIGN KEY (approved_product_id) REFERENCES approved_products (id)
);

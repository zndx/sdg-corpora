CREATE TABLE specifications_variants (
  product_specification_id INTEGER NOT NULL,
  product_variant_id INTEGER NOT NULL,
  PRIMARY KEY (product_specification_id, product_variant_id),
  FOREIGN KEY (product_specification_id) REFERENCES product_specifications (product_specification_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (id)
);

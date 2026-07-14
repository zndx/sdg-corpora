CREATE TABLE variants_specs (
  product_variant_id INTEGER NOT NULL,
  dimensional_spec_id INTEGER NOT NULL,
  PRIMARY KEY (product_variant_id, dimensional_spec_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (id),
  FOREIGN KEY (dimensional_spec_id) REFERENCES dimensional_specs (id)
);

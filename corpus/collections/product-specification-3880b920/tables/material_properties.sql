CREATE TABLE material_properties (
  id INTEGER NOT NULL,
  property_type VARCHAR(32),
  measured_value DECIMAL,
  unit_of_measure VARCHAR(32),
  condition_location VARCHAR(32),
  moisture_content DECIMAL,
  product_specification_id INTEGER,
  product_variant_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (product_specification_id) REFERENCES product_specifications (product_specification_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (id)
);

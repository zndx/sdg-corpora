CREATE TABLE variants_properties (
  product_variant_id INTEGER NOT NULL,
  material_property_id INTEGER NOT NULL,
  PRIMARY KEY (product_variant_id, material_property_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (id),
  FOREIGN KEY (material_property_id) REFERENCES material_properties (id)
);

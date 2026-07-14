CREATE TABLE specifications_properties (
  product_specification_id INTEGER NOT NULL,
  material_property_id INTEGER NOT NULL,
  PRIMARY KEY (product_specification_id, material_property_id),
  FOREIGN KEY (product_specification_id) REFERENCES product_specifications (product_specification_id),
  FOREIGN KEY (material_property_id) REFERENCES material_properties (id)
);

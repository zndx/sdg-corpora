CREATE TABLE specifications_models (
  material_specification_id INTEGER NOT NULL,
  product_model_id INTEGER NOT NULL,
  PRIMARY KEY (material_specification_id, product_model_id),
  FOREIGN KEY (material_specification_id) REFERENCES material_specifications (id),
  FOREIGN KEY (product_model_id) REFERENCES product_models (product_model_id)
);

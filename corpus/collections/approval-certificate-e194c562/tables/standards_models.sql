CREATE TABLE standards_models (
  dimensional_standard_id INTEGER NOT NULL,
  product_model_id INTEGER NOT NULL,
  PRIMARY KEY (dimensional_standard_id, product_model_id),
  FOREIGN KEY (dimensional_standard_id) REFERENCES dimensional_standards (dimensional_standard_id),
  FOREIGN KEY (product_model_id) REFERENCES product_models (product_model_id)
);

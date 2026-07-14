CREATE TABLE manufacturers_models (
  manufacturer_id INTEGER NOT NULL,
  product_model_id INTEGER NOT NULL,
  PRIMARY KEY (manufacturer_id, product_model_id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id),
  FOREIGN KEY (product_model_id) REFERENCES product_models (product_model_id)
);

CREATE TABLE product_variants (
  id INTEGER NOT NULL,
  variant_identifier VARCHAR(32),
  face_length INTEGER,
  face_width INTEGER,
  unit VARCHAR(32),
  has_handholds BOOLEAN,
  product_specification_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (product_specification_id) REFERENCES product_specifications (product_specification_id)
);

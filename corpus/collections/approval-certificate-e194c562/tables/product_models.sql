CREATE TABLE product_models (
  product_model_id INTEGER NOT NULL,
  model_number VARCHAR(32),
  product_description VARCHAR(32),
  nominal_pipe_size VARCHAR(32),
  rated_working_pressure_psi DECIMAL,
  rated_working_pressure_kpa DECIMAL,
  remarks VARCHAR(32),
  approval_certificate_id INTEGER,
  manufacturer_id INTEGER,
  material_specification_id INTEGER,
  dimensional_standard_id INTEGER,
  PRIMARY KEY (product_model_id),
  FOREIGN KEY (approval_certificate_id) REFERENCES approval_certificates (id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id),
  FOREIGN KEY (material_specification_id) REFERENCES material_specifications (id),
  FOREIGN KEY (dimensional_standard_id) REFERENCES dimensional_standards (dimensional_standard_id)
);

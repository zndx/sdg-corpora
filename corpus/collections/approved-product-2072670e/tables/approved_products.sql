CREATE TABLE approved_products (
  id INTEGER NOT NULL,
  product_identifier VARCHAR(32),
  product_name VARCHAR(32),
  nominal_size_range VARCHAR(32),
  service_condition VARCHAR(32),
  material_type VARCHAR(32),
  approval_status VARCHAR(32),
  approval_standard_id INTEGER,
  approving_authority_id INTEGER,
  manufacturer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (approval_standard_id) REFERENCES approval_standards (approval_standard_id),
  FOREIGN KEY (approving_authority_id) REFERENCES approving_authorities (approving_authority_id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);

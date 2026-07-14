CREATE TABLE product_specifications (
  product_specification_id INTEGER NOT NULL,
  product_identifier VARCHAR(32),
  brand_name VARCHAR(33),
  document_type VARCHAR(32),
  design_sulfate_class VARCHAR(32),
  joint_type VARCHAR(32),
  availability_status VARCHAR(32),
  PRIMARY KEY (product_specification_id)
);

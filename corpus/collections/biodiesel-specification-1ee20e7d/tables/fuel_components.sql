CREATE TABLE fuel_components (
  component_id VARCHAR(32) NOT NULL,
  component_type VARCHAR(32),
  volume DECIMAL,
  batch_id VARCHAR(44),
  biodiesel_blend_id INTEGER,
  biodiesel_specification_id INTEGER,
  PRIMARY KEY (component_id),
  FOREIGN KEY (biodiesel_blend_id) REFERENCES biodiesel_blends (biodiesel_blend_id),
  FOREIGN KEY (biodiesel_specification_id) REFERENCES biodiesel_specifications (biodiesel_specification_id)
);

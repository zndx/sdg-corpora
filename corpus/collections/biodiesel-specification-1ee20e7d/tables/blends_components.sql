CREATE TABLE blends_components (
  biodiesel_blend_id INTEGER NOT NULL,
  component_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (biodiesel_blend_id, component_id),
  FOREIGN KEY (biodiesel_blend_id) REFERENCES biodiesel_blends (biodiesel_blend_id),
  FOREIGN KEY (component_id) REFERENCES fuel_components (component_id)
);

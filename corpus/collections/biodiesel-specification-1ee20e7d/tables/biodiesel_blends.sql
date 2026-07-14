CREATE TABLE biodiesel_blends (
  biodiesel_blend_id INTEGER NOT NULL,
  blend_id VARCHAR(44),
  biodiesel_percentage DECIMAL,
  petroleum_diesel_percentage DECIMAL,
  blend_date TIMESTAMP,
  status VARCHAR(32),
  PRIMARY KEY (biodiesel_blend_id)
);

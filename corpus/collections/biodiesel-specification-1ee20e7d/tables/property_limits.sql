CREATE TABLE property_limits (
  id INTEGER NOT NULL,
  limit_value DECIMAL,
  limit_type VARCHAR(32),
  grade VARCHAR(32),
  biodiesel_property_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (biodiesel_property_id) REFERENCES biodiesel_properties (id)
);

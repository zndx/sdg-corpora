CREATE TABLE properties_limits (
  biodiesel_property_id INTEGER NOT NULL,
  property_limit_id INTEGER NOT NULL,
  PRIMARY KEY (biodiesel_property_id, property_limit_id),
  FOREIGN KEY (biodiesel_property_id) REFERENCES biodiesel_properties (id),
  FOREIGN KEY (property_limit_id) REFERENCES property_limits (id)
);

CREATE TABLE specifications_properties (
  biodiesel_specification_id INTEGER NOT NULL,
  biodiesel_property_id INTEGER NOT NULL,
  PRIMARY KEY (biodiesel_specification_id, biodiesel_property_id),
  FOREIGN KEY (biodiesel_specification_id) REFERENCES biodiesel_specifications (biodiesel_specification_id),
  FOREIGN KEY (biodiesel_property_id) REFERENCES biodiesel_properties (id)
);

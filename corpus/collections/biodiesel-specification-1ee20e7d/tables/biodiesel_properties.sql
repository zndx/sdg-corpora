CREATE TABLE biodiesel_properties (
  id INTEGER NOT NULL,
  property_name VARCHAR(32),
  astm_method_number VARCHAR(32),
  unit_of_measure VARCHAR(32),
  is_critical BOOLEAN,
  biodiesel_specification_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (biodiesel_specification_id) REFERENCES biodiesel_specifications (biodiesel_specification_id)
);

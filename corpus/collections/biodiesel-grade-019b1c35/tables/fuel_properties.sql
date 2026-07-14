CREATE TABLE fuel_properties (
  fuel_property_id INTEGER NOT NULL,
  property_name VARCHAR(32),
  specification_limit DECIMAL,
  unit_of_measure VARCHAR(32),
  is_critical BOOLEAN,
  test_condition VARCHAR(32),
  biodiesel_grade_id INTEGER,
  fuel_sample_id INTEGER,
  PRIMARY KEY (fuel_property_id),
  FOREIGN KEY (biodiesel_grade_id) REFERENCES biodiesel_grades (id),
  FOREIGN KEY (fuel_sample_id) REFERENCES fuel_samples (id)
);

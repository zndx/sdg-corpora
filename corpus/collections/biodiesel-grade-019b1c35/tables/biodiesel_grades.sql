CREATE TABLE biodiesel_grades (
  id INTEGER NOT NULL,
  grade_code VARCHAR(32),
  sulfur_limit DECIMAL,
  flash_point_min DECIMAL,
  cetane_min INTEGER,
  cloud_point_max DECIMAL,
  acid_number_max DECIMAL,
  free_glycerin_max DECIMAL,
  total_glycerin_max DECIMAL,
  a_s_t_m_test_method_id INTEGER,
  fuel_property_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (a_s_t_m_test_method_id) REFERENCES a_s_t_m_test_methods (id),
  FOREIGN KEY (fuel_property_id) REFERENCES fuel_properties (fuel_property_id)
);

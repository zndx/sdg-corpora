CREATE TABLE a_s_t_m_test_methods (
  id INTEGER NOT NULL,
  astm_number VARCHAR(32),
  method_description VARCHAR(32),
  applicable_grade VARCHAR(32),
  is_b_q9000_critical BOOLEAN,
  fuel_property_id INTEGER,
  fuel_sample_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (fuel_property_id) REFERENCES fuel_properties (fuel_property_id),
  FOREIGN KEY (fuel_sample_id) REFERENCES fuel_samples (id)
);

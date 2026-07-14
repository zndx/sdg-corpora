CREATE TABLE fuel_samples (
  id INTEGER NOT NULL,
  sample_id INTEGER,
  collection_date TIMESTAMP,
  source_batch_id VARCHAR(40),
  storage_temperature DECIMAL,
  sample_volume DECIMAL,
  sample_status VARCHAR(32),
  fuel_property_id INTEGER,
  production_batch_id INTEGER,
  a_s_t_m_test_method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (fuel_property_id) REFERENCES fuel_properties (fuel_property_id),
  FOREIGN KEY (production_batch_id) REFERENCES production_batches (production_batch_id),
  FOREIGN KEY (a_s_t_m_test_method_id) REFERENCES a_s_t_m_test_methods (id)
);

CREATE TABLE hous_n_h_a_ses (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  funding_source VARCHAR(32),
  operating_hours VARCHAR(32),
  is_free BOOLEAN,
  established_year INTEGER,
  module_id VARCHAR(33),
  PRIMARY KEY (id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id)
);

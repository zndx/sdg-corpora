CREATE TABLE hous_housing_specialists (
  id INTEGER NOT NULL,
  specialist_id VARCHAR(32),
  full_name VARCHAR(36),
  specialization VARCHAR(32),
  employment_status VARCHAR(32),
  certification_level VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  module_id VARCHAR(33),
  n_h_a_s_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id),
  FOREIGN KEY (n_h_a_s_id) REFERENCES hous_n_h_a_ses (id)
);

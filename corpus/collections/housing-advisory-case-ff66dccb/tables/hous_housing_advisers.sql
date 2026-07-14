CREATE TABLE hous_housing_advisers (
  id INTEGER NOT NULL,
  adviser_id VARCHAR(32),
  full_name VARCHAR(36),
  employer_type VARCHAR(32),
  years_experience INTEGER,
  last_training_date DATE,
  contact_email VARCHAR(32),
  module_id VARCHAR(33),
  housing_advisory_case_id INTEGER,
  n_h_a_s_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id),
  FOREIGN KEY (housing_advisory_case_id) REFERENCES hous_housing_advisory_cases (id),
  FOREIGN KEY (n_h_a_s_id) REFERENCES hous_n_h_a_ses (id)
);

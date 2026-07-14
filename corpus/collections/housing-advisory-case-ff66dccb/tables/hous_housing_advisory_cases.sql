CREATE TABLE hous_housing_advisory_cases (
  id INTEGER NOT NULL,
  case_id VARCHAR(32),
  case_type VARCHAR(32),
  status VARCHAR(32),
  priority_level VARCHAR(32),
  referral_source VARCHAR(32),
  date_opened TIMESTAMP,
  date_closed TIMESTAMP,
  housing_specialist_id INTEGER,
  housing_client_id INTEGER,
  module_id VARCHAR(33),
  PRIMARY KEY (id),
  FOREIGN KEY (housing_specialist_id) REFERENCES hous_housing_specialists (id),
  FOREIGN KEY (housing_client_id) REFERENCES hous_housing_clients (housing_client_id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id)
);

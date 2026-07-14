CREATE TABLE hous_housing_clients (
  housing_client_id INTEGER NOT NULL,
  client_id VARCHAR(32),
  household_size INTEGER,
  current_housing_status VARCHAR(32),
  primary_need VARCHAR(32),
  date_of_referral TIMESTAMP,
  has_dependents BOOLEAN,
  housing_advisory_case_id INTEGER,
  PRIMARY KEY (housing_client_id),
  FOREIGN KEY (housing_advisory_case_id) REFERENCES hous_housing_advisory_cases (id)
);

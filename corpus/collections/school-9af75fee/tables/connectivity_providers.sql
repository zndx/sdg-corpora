CREATE TABLE connectivity_providers (
  id INTEGER NOT NULL,
  provider_id VARCHAR(35),
  name VARCHAR(32),
  service_type VARCHAR(32),
  max_bandwidth DECIMAL,
  data_allowance DECIMAL,
  contract_start_date TIMESTAMP,
  contract_end_date TIMESTAMP,
  school_id INTEGER,
  country_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (country_id) REFERENCES countries (id)
);

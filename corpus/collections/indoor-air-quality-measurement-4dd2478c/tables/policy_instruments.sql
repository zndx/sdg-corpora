CREATE TABLE policy_instruments (
  id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  instrument_name VARCHAR(32),
  instrument_type VARCHAR(32),
  issuing_authority VARCHAR(32),
  effective_date DATE,
  enforcement_level VARCHAR(32),
  indoor_pollutant_id INTEGER,
  indoor_environment_id INTEGER,
  department_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (indoor_pollutant_id) REFERENCES indoor_pollutants (id),
  FOREIGN KEY (indoor_environment_id) REFERENCES indoor_environments (indoor_environment_id),
  FOREIGN KEY (department_id) REFERENCES government_departments (department_id)
);

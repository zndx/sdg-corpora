CREATE TABLE government_departments (
  department_id VARCHAR(32) NOT NULL,
  department_name VARCHAR(32),
  department_code VARCHAR(32),
  responsibility_area VARCHAR(32),
  ministerial_lead VARCHAR(32),
  established_date DATE,
  policy_instrument_id INTEGER,
  coordinates_with_department_id VARCHAR(32),
  PRIMARY KEY (department_id),
  FOREIGN KEY (policy_instrument_id) REFERENCES policy_instruments (id),
  FOREIGN KEY (coordinates_with_department_id) REFERENCES government_departments (department_id)
);

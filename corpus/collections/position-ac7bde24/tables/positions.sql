CREATE TABLE positions (
  id INTEGER NOT NULL,
  position_id VARCHAR(44),
  title VARCHAR(32),
  classification VARCHAR(32),
  salary_range DECIMAL,
  approval_date TIMESTAMP,
  status VARCHAR(32),
  employee_id INTEGER,
  supervises_position_id INTEGER,
  receives_direction_from_position_id INTEGER,
  department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (supervises_position_id) REFERENCES positions (id),
  FOREIGN KEY (receives_direction_from_position_id) REFERENCES positions (id),
  FOREIGN KEY (department_id) REFERENCES departments (id)
);

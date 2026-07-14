CREATE TABLE departments_positions (
  department_id INTEGER NOT NULL,
  position_id INTEGER NOT NULL,
  PRIMARY KEY (department_id, position_id),
  FOREIGN KEY (department_id) REFERENCES departments (id),
  FOREIGN KEY (position_id) REFERENCES positions (id)
);

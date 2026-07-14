CREATE TABLE institutions_departments (
  institution_id INTEGER NOT NULL,
  department_id INTEGER NOT NULL,
  PRIMARY KEY (institution_id, department_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id),
  FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

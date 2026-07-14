CREATE TABLE departments_programmes (
  department_id VARCHAR(32) NOT NULL,
  academic_programme_id INTEGER NOT NULL,
  PRIMARY KEY (department_id, academic_programme_id),
  FOREIGN KEY (department_id) REFERENCES academic_departments (department_id),
  FOREIGN KEY (academic_programme_id) REFERENCES academic_programmes (id)
);

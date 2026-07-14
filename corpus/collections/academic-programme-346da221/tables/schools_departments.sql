CREATE TABLE schools_departments (
  academic_school_id INTEGER NOT NULL,
  department_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (academic_school_id, department_id),
  FOREIGN KEY (academic_school_id) REFERENCES academic_schools (academic_school_id),
  FOREIGN KEY (department_id) REFERENCES academic_departments (department_id)
);

CREATE TABLE academic_appointments (
  id INTEGER NOT NULL,
  appointment_id VARCHAR(35),
  start_date DATE,
  end_date DATE,
  title VARCHAR(32),
  department VARCHAR(32),
  institution_name VARCHAR(32),
  academic_institution_id INTEGER,
  person_id INTEGER,
  academic_department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (academic_department_id) REFERENCES academic_departments (id)
);

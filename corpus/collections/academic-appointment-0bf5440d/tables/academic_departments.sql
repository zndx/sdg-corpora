CREATE TABLE academic_departments (
  id INTEGER NOT NULL,
  department_id VARCHAR(32),
  name VARCHAR(32),
  parent_institution_id VARCHAR(44),
  established_date DATE,
  academic_institution_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);

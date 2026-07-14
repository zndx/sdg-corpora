CREATE TABLE academic_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  name VARCHAR(32),
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  location_country VARCHAR(32),
  founding_year INTEGER,
  academic_department_id INTEGER,
  academic_award_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_department_id) REFERENCES academic_departments (id),
  FOREIGN KEY (academic_award_id) REFERENCES academic_awards (id)
);

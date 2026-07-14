CREATE TABLE academic_institutions (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  city VARCHAR(32),
  country VARCHAR(32),
  postal_code VARCHAR(35),
  website VARCHAR(56),
  academic_conference_region_code VARCHAR(40),
  academic_department_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (academic_department_id) REFERENCES academic_departments (academic_department_id)
);

CREATE TABLE departments (
  department_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  code VARCHAR(34),
  parent_institution VARCHAR(32),
  established_date DATE,
  series_id INTEGER,
  institution_id INTEGER,
  PRIMARY KEY (department_id),
  FOREIGN KEY (series_id) REFERENCES serieses (series_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id)
);

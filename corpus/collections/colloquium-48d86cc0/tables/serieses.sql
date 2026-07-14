CREATE TABLE serieses (
  series_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  academic_term VARCHAR(32),
  organizing_department VARCHAR(32),
  frequency VARCHAR(32),
  department_id INTEGER,
  PRIMARY KEY (series_id),
  FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

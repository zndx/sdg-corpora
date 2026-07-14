CREATE TABLE academic_programmes (
  id INTEGER NOT NULL,
  programme_id VARCHAR(44),
  programme_name VARCHAR(32),
  degree_level VARCHAR(32),
  department_id VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  credit_hours INTEGER,
  duration_years INTEGER,
  offered_by_department_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (offered_by_department_id) REFERENCES academic_departments (department_id)
);

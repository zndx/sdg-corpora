CREATE TABLE university_support_systems (
  university_support_system_id INTEGER NOT NULL,
  system_id INTEGER,
  system_name VARCHAR(32),
  system_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  budget DECIMAL,
  accessibility_score DECIMAL,
  department_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (university_support_system_id),
  FOREIGN KEY (department_id) REFERENCES university_departments (department_id)
);

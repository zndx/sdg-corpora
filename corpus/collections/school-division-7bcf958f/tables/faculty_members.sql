CREATE TABLE faculty_members (
  id INTEGER NOT NULL,
  faculty_id VARCHAR(44),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  department VARCHAR(32),
  years_of_experience INTEGER,
  is_tenured BOOLEAN,
  hire_date DATE,
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);

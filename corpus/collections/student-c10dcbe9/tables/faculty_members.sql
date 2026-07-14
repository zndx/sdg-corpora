CREATE TABLE faculty_members (
  id INTEGER NOT NULL,
  faculty_id VARCHAR(44),
  full_name VARCHAR(36),
  department VARCHAR(32),
  employment_status VARCHAR(32),
  hire_date DATE,
  PRIMARY KEY (id)
);

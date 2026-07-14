CREATE TABLE university_departments (
  department_id VARCHAR(32) NOT NULL,
  department_name VARCHAR(58),
  department_code VARCHAR(32),
  head_of_department VARCHAR(32),
  location VARCHAR(33),
  established_date DATE,
  operational_status VARCHAR(32),
  budget_allocation VARCHAR(32),
  mentor_id INTEGER,
  PRIMARY KEY (department_id),
  FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id)
);

CREATE TABLE research_projects (
  project_id VARCHAR(44) NOT NULL,
  project_title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  funding_amount DECIMAL,
  funding_source VARCHAR(32),
  department_id VARCHAR(32),
  school_id INTEGER,
  university_id VARCHAR(40),
  part_of_department_department_id VARCHAR(32),
  PRIMARY KEY (project_id),
  FOREIGN KEY (part_of_department_department_id) REFERENCES academic_departments (department_id)
);

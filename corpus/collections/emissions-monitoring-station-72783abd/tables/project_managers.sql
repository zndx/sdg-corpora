CREATE TABLE project_managers (
  manager_id VARCHAR(44) NOT NULL,
  full_name VARCHAR(36),
  office_location VARCHAR(32),
  certifications VARCHAR(32),
  years_of_experience INTEGER,
  regional_office_id INTEGER,
  emissions_test_program_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (manager_id),
  FOREIGN KEY (regional_office_id) REFERENCES regional_offices (id),
  FOREIGN KEY (emissions_test_program_id) REFERENCES emissions_test_programs (id)
);

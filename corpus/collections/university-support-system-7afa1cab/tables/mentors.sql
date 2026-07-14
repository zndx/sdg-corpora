CREATE TABLE mentors (
  mentor_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  expertise_area VARCHAR(32),
  years_of_experience INTEGER,
  affiliation VARCHAR(32),
  rating DECIMAL,
  availability_status VARCHAR(32),
  contact_info VARCHAR(32),
  department_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (mentor_id),
  FOREIGN KEY (department_id) REFERENCES university_departments (department_id)
);

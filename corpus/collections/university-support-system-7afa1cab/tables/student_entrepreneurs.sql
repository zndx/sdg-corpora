CREATE TABLE student_entrepreneurs (
  student_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  major VARCHAR(32),
  enrollment_status VARCHAR(32),
  demographic_group VARCHAR(32),
  contact_email VARCHAR(32),
  satisfaction_score DECIMAL,
  department_id VARCHAR(32),
  mentor_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (department_id) REFERENCES university_departments (department_id),
  FOREIGN KEY (mentor_id) REFERENCES mentors (mentor_id)
);

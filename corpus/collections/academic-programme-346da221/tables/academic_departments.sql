CREATE TABLE academic_departments (
  department_id VARCHAR(32) NOT NULL,
  department_name VARCHAR(32),
  school_id INTEGER,
  establishment_date TIMESTAMP,
  status VARCHAR(32),
  head_of_department_id VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  academic_school_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (department_id),
  FOREIGN KEY (academic_school_id) REFERENCES academic_schools (academic_school_id)
);

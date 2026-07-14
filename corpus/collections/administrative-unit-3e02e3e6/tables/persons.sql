CREATE TABLE persons (
  person_id VARCHAR(32) NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  email_address VARCHAR(32),
  employment_status VARCHAR(32),
  hire_date DATE,
  role_id VARCHAR(44),
  reports_to_person_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (person_id),
  FOREIGN KEY (role_id) REFERENCES administrative_roles (role_id),
  FOREIGN KEY (reports_to_person_id) REFERENCES persons (person_id)
);

CREATE TABLE students (
  student_id INTEGER NOT NULL,
  enrollment_status VARCHAR(32),
  date_of_birth DATE,
  guardian_contact_id VARCHAR(32),
  counselor_id INTEGER,
  harm_type_id INTEGER,
  role_code VARCHAR(32),
  PRIMARY KEY (student_id),
  FOREIGN KEY (harm_type_id) REFERENCES harm_types (id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code)
);

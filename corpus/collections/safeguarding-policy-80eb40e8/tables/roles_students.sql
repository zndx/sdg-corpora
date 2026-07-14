CREATE TABLE roles_students (
  role_code VARCHAR(32) NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (role_code, student_id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

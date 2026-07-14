CREATE TABLE student_assistants (
  student_assistant_id INTEGER NOT NULL,
  student_id VARCHAR(32),
  full_name VARCHAR(36),
  major VARCHAR(32),
  graduation_year INTEGER,
  employment_status VARCHAR(32),
  library_id INTEGER,
  role_code VARCHAR(32),
  library_staff_member_id INTEGER,
  PRIMARY KEY (student_assistant_id),
  FOREIGN KEY (library_id) REFERENCES libraries (id),
  FOREIGN KEY (role_code) REFERENCES library_roles (role_code),
  FOREIGN KEY (library_staff_member_id) REFERENCES library_staff_members (id)
);

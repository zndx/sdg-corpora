CREATE TABLE library_staff_members (
  id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  current_role VARCHAR(32),
  employment_status VARCHAR(32),
  library_id INTEGER,
  role_code VARCHAR(32),
  library_staff_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (library_id) REFERENCES libraries (id),
  FOREIGN KEY (role_code) REFERENCES library_roles (role_code),
  FOREIGN KEY (library_staff_member_id) REFERENCES library_staff_members (id)
);

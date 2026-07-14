CREATE TABLE library_departments (
  dept_code VARCHAR(32) NOT NULL,
  dept_name VARCHAR(32),
  location VARCHAR(32),
  role_code VARCHAR(32),
  library_id INTEGER,
  PRIMARY KEY (dept_code),
  FOREIGN KEY (role_code) REFERENCES library_roles (role_code),
  FOREIGN KEY (library_id) REFERENCES libraries (id)
);

CREATE TABLE library_roles (
  role_code VARCHAR(32) NOT NULL,
  role_title VARCHAR(32),
  department VARCHAR(32),
  responsibility_level INTEGER,
  library_staff_member_id INTEGER,
  library_department_dept_code VARCHAR(32),
  PRIMARY KEY (role_code),
  FOREIGN KEY (library_staff_member_id) REFERENCES library_staff_members (id),
  FOREIGN KEY (library_department_dept_code) REFERENCES library_departments (dept_code)
);

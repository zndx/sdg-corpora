CREATE TABLE libraries (
  id INTEGER NOT NULL,
  library_id VARCHAR(35),
  library_name VARCHAR(32),
  institution VARCHAR(32),
  established_date DATE,
  library_staff_member_id INTEGER,
  library_department_dept_code VARCHAR(32),
  library_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (library_staff_member_id) REFERENCES library_staff_members (id),
  FOREIGN KEY (library_department_dept_code) REFERENCES library_departments (dept_code),
  FOREIGN KEY (library_event_id) REFERENCES library_events (id)
);

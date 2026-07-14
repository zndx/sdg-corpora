CREATE TABLE departments_members (
  department_id VARCHAR(32) NOT NULL,
  faculty_member_id INTEGER NOT NULL,
  PRIMARY KEY (department_id, faculty_member_id),
  FOREIGN KEY (department_id) REFERENCES academic_departments (department_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id)
);

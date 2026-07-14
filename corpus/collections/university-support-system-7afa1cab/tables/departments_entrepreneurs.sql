CREATE TABLE departments_entrepreneurs (
  department_id VARCHAR(32) NOT NULL,
  student_entrepreneur_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (department_id, student_entrepreneur_student_id),
  FOREIGN KEY (department_id) REFERENCES university_departments (department_id),
  FOREIGN KEY (student_entrepreneur_student_id) REFERENCES student_entrepreneurs (student_id)
);

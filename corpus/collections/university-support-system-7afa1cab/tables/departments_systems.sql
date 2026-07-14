CREATE TABLE departments_systems (
  department_id VARCHAR(32) NOT NULL,
  university_support_system_id INTEGER NOT NULL,
  PRIMARY KEY (department_id, university_support_system_id),
  FOREIGN KEY (department_id) REFERENCES university_departments (department_id),
  FOREIGN KEY (university_support_system_id) REFERENCES university_support_systems (university_support_system_id)
);

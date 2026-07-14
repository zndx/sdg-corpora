CREATE TABLE teachers (
  teacher_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  employee_id VARCHAR(32),
  department VARCHAR(32),
  signature_status BOOLEAN,
  course_id INTEGER,
  PRIMARY KEY (teacher_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

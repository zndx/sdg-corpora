CREATE TABLE students (
  student_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  enrollment_date DATE,
  academic_level VARCHAR(32),
  course_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);

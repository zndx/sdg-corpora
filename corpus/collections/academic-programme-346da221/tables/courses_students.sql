CREATE TABLE courses_students (
  course_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, student_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);

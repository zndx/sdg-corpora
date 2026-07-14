CREATE TABLE courses_enrollments (
  course_id INTEGER NOT NULL,
  student_enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, student_enrollment_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id)
);

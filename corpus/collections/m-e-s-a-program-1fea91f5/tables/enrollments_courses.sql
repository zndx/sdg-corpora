CREATE TABLE enrollments_courses (
  student_enrollment_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (student_enrollment_id, course_id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

CREATE TABLE degrees_enrollments (
  math_based_degree_id INTEGER NOT NULL,
  student_enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (math_based_degree_id, student_enrollment_id),
  FOREIGN KEY (math_based_degree_id) REFERENCES math_based_degrees (id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id)
);

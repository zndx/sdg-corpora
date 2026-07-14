CREATE TABLE universities_enrollments (
  four_year_university_id INTEGER NOT NULL,
  student_enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (four_year_university_id, student_enrollment_id),
  FOREIGN KEY (four_year_university_id) REFERENCES four_year_universities (four_year_university_id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id)
);

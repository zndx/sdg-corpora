CREATE TABLE courses_standards (
  course_id INTEGER NOT NULL,
  assessment_standard_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, assessment_standard_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (assessment_standard_id) REFERENCES assessment_standards (id)
);

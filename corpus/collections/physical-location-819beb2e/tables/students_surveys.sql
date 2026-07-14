CREATE TABLE students_surveys (
  student_id INTEGER NOT NULL,
  student_survey_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, student_survey_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (student_survey_id) REFERENCES student_surveys (id)
);

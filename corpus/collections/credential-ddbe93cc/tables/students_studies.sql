CREATE TABLE students_studies (
  student_id INTEGER NOT NULL,
  program_of_study_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, program_of_study_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (program_of_study_id) REFERENCES program_of_studies (id)
);

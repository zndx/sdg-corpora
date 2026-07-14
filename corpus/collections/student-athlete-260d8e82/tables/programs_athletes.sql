CREATE TABLE programs_athletes (
  degree_program_id INTEGER NOT NULL,
  student_athlete_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (degree_program_id, student_athlete_student_id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (degree_program_id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

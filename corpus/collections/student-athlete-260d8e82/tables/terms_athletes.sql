CREATE TABLE terms_athletes (
  term_id VARCHAR(32) NOT NULL,
  student_athlete_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (term_id, student_athlete_student_id),
  FOREIGN KEY (term_id) REFERENCES academic_terms (term_id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

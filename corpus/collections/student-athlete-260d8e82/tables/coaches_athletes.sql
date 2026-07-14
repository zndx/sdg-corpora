CREATE TABLE coaches_athletes (
  head_coach_id INTEGER NOT NULL,
  student_athlete_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (head_coach_id, student_athlete_student_id),
  FOREIGN KEY (head_coach_id) REFERENCES head_coaches (id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

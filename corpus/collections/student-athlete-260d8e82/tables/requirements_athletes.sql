CREATE TABLE requirements_athletes (
  credit_hour_requirement_id INTEGER NOT NULL,
  student_athlete_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (credit_hour_requirement_id, student_athlete_student_id),
  FOREIGN KEY (credit_hour_requirement_id) REFERENCES credit_hour_requirements (credit_hour_requirement_id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

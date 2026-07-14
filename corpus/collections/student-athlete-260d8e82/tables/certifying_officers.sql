CREATE TABLE certifying_officers (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  office VARCHAR(32),
  contact_email VARCHAR(32),
  head_coach_id INTEGER,
  student_athlete_student_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (head_coach_id) REFERENCES head_coaches (id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

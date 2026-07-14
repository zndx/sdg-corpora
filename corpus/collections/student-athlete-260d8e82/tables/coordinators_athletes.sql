CREATE TABLE coordinators_athletes (
  compliance_coordinator_id INTEGER NOT NULL,
  student_athlete_student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (compliance_coordinator_id, student_athlete_student_id),
  FOREIGN KEY (compliance_coordinator_id) REFERENCES compliance_coordinators (id),
  FOREIGN KEY (student_athlete_student_id) REFERENCES student_athletes (student_id)
);

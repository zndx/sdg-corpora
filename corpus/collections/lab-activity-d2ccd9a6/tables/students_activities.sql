CREATE TABLE students_activities (
  student_id INTEGER NOT NULL,
  lab_activity_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, lab_activity_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (lab_activity_id) REFERENCES lab_activities (lab_activity_id)
);

CREATE TABLE activities_students (
  lab_activity_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (lab_activity_id, student_id),
  FOREIGN KEY (lab_activity_id) REFERENCES lab_activities (lab_activity_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

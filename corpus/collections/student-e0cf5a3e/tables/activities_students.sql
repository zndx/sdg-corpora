CREATE TABLE activities_students (
  student_activity_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (student_activity_id, student_id),
  FOREIGN KEY (student_activity_id) REFERENCES student_activities (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

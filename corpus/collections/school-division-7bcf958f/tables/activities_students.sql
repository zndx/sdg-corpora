CREATE TABLE activities_students (
  extracurricular_activity_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (extracurricular_activity_id, student_id),
  FOREIGN KEY (extracurricular_activity_id) REFERENCES extracurricular_activities (extracurricular_activity_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);

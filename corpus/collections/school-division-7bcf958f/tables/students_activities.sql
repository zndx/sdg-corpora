CREATE TABLE students_activities (
  student_id INTEGER NOT NULL,
  extracurricular_activity_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, extracurricular_activity_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (extracurricular_activity_id) REFERENCES extracurricular_activities (extracurricular_activity_id)
);

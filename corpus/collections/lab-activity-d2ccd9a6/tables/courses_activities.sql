CREATE TABLE courses_activities (
  course_id INTEGER NOT NULL,
  lab_activity_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, lab_activity_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (lab_activity_id) REFERENCES lab_activities (lab_activity_id)
);

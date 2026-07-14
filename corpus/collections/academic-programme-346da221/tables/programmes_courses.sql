CREATE TABLE programmes_courses (
  academic_programme_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (academic_programme_id, course_id),
  FOREIGN KEY (academic_programme_id) REFERENCES academic_programmes (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

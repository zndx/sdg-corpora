CREATE TABLE courses_programmes (
  course_id INTEGER NOT NULL,
  academic_programme_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, academic_programme_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (academic_programme_id) REFERENCES academic_programmes (id)
);

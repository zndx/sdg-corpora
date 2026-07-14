CREATE TABLE subfields_courses (
  subfield_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (subfield_id, course_id),
  FOREIGN KEY (subfield_id) REFERENCES subfields (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);

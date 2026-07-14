CREATE TABLE programs_courses (
  degree_program_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (degree_program_id, course_id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

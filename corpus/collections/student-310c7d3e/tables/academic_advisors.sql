CREATE TABLE academic_advisors (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);

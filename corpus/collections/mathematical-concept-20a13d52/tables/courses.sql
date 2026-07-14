CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_title VARCHAR(32),
  course_level VARCHAR(32),
  credit_hours INTEGER,
  semester_offered VARCHAR(32),
  textbook_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (id)
);

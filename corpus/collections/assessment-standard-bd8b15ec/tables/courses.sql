CREATE TABLE courses (
  course_id INTEGER NOT NULL,
  course_code VARCHAR(32),
  year_level INTEGER,
  subject_area VARCHAR(32),
  total_credits INTEGER,
  endorsable_status BOOLEAN,
  teacher_name VARCHAR(32),
  description VARCHAR(32),
  teacher_id INTEGER,
  PRIMARY KEY (course_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

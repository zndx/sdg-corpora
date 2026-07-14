CREATE TABLE courses (
  course_id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_title VARCHAR(32),
  department VARCHAR(32),
  is_math_based BOOLEAN,
  prerequisite VARCHAR(32),
  credits INTEGER,
  PRIMARY KEY (course_id)
);

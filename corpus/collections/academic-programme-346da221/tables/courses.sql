CREATE TABLE courses (
  course_id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_name VARCHAR(32),
  credit_hours INTEGER,
  semester VARCHAR(32),
  year INTEGER,
  status VARCHAR(32),
  prerequisite_course_id VARCHAR(32),
  department_id VARCHAR(32),
  school_id INTEGER,
  university_id VARCHAR(40),
  PRIMARY KEY (course_id)
);

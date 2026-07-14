CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  grade_level INTEGER,
  school_name VARCHAR(32),
  is_eligible_for_prodigy BOOLEAN,
  PRIMARY KEY (id)
);

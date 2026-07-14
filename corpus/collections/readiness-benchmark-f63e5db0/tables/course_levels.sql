CREATE TABLE course_levels (
  course_level_id INTEGER NOT NULL,
  course_code VARCHAR(32),
  institution_code VARCHAR(32),
  course_title VARCHAR(32),
  credit_hours INTEGER,
  is_developmental BOOLEAN,
  is_credit_bearing BOOLEAN,
  department VARCHAR(32),
  semester_offered VARCHAR(32),
  PRIMARY KEY (course_level_id)
);

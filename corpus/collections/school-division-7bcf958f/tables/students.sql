CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  grade_level INTEGER,
  enrollment_status VARCHAR(32),
  gpa DECIMAL,
  is_honors_student BOOLEAN,
  school_division_id INTEGER,
  diploma_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (school_division_id) REFERENCES school_divisions (school_division_id),
  FOREIGN KEY (diploma_id) REFERENCES diplomas (id)
);

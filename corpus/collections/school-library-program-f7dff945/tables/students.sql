CREATE TABLE students (
  student_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  grade_level INTEGER,
  enrollment_date DATE,
  literacy_proficiency VARCHAR(32),
  attendance_rate DECIMAL,
  special_needs_flag BOOLEAN,
  PRIMARY KEY (student_id)
);

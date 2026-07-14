CREATE TABLE students (
  student_id VARCHAR(32) NOT NULL,
  date_of_birth DATE,
  grade_level INTEGER,
  age INTEGER,
  current_address VARCHAR(32),
  date_entered9th_grade DATE,
  is_eligible BOOLEAN,
  residence_id INTEGER,
  school_id INTEGER,
  athletic_history_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (residence_id) REFERENCES residences (residence_id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (athletic_history_id) REFERENCES athletic_histories (athletic_history_id)
);

CREATE TABLE athletic_histories (
  athletic_history_id INTEGER NOT NULL,
  season VARCHAR(32),
  year INTEGER,
  sport VARCHAR(32),
  level VARCHAR(32),
  practices_completed INTEGER,
  is_eligible BOOLEAN,
  student_id VARCHAR(32),
  school_id INTEGER,
  PRIMARY KEY (athletic_history_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (school_id) REFERENCES schools (id)
);

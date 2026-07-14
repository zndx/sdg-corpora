CREATE TABLE academic_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  grade_level VARCHAR(32),
  term VARCHAR(32),
  conduct_score DECIMAL,
  academic_score DECIMAL,
  total_weighted_score DECIMAL,
  student_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);

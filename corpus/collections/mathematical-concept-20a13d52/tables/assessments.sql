CREATE TABLE assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_type VARCHAR(32),
  date_given DATE,
  max_score DECIMAL,
  passing_score DECIMAL,
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

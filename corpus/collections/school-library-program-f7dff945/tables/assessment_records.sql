CREATE TABLE assessment_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  assessment_date DATE,
  raw_score DECIMAL,
  normalized_score DECIMAL,
  feedback_notes VARCHAR(32),
  review_status VARCHAR(32),
  data_integrity_check BOOLEAN,
  metric_id VARCHAR(44),
  student_id VARCHAR(32),
  school_library_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (metric_id) REFERENCES assessment_metrics (metric_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (school_library_program_id) REFERENCES school_library_programs (id)
);

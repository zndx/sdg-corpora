CREATE TABLE assessment_metrics (
  metric_id VARCHAR(44) NOT NULL,
  metric_name VARCHAR(32),
  measurement_type VARCHAR(32),
  administered_date DATE,
  score_threshold DECIMAL,
  result_status VARCHAR(32),
  rater_id VARCHAR(44),
  information_literacy_standard_id INTEGER,
  teacher_librarian_id INTEGER,
  assessment_record_id INTEGER,
  PRIMARY KEY (metric_id),
  FOREIGN KEY (information_literacy_standard_id) REFERENCES information_literacy_standards (id),
  FOREIGN KEY (teacher_librarian_id) REFERENCES teacher_librarians (teacher_librarian_id),
  FOREIGN KEY (assessment_record_id) REFERENCES assessment_records (id)
);

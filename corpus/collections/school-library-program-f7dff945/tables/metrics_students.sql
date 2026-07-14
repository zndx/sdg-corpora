CREATE TABLE metrics_students (
  metric_id VARCHAR(44) NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (metric_id, student_id),
  FOREIGN KEY (metric_id) REFERENCES assessment_metrics (metric_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);

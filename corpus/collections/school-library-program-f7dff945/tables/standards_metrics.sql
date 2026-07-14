CREATE TABLE standards_metrics (
  information_literacy_standard_id INTEGER NOT NULL,
  metric_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (information_literacy_standard_id, metric_id),
  FOREIGN KEY (information_literacy_standard_id) REFERENCES information_literacy_standards (id),
  FOREIGN KEY (metric_id) REFERENCES assessment_metrics (metric_id)
);

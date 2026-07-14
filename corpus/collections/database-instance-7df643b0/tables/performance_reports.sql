CREATE TABLE performance_reports (
  performance_report_id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_type VARCHAR(32),
  generated_date TIMESTAMP,
  duration_hours DECIMAL,
  top_wait_event VARCHAR(32),
  instance_id VARCHAR(32),
  d_b_a_id INTEGER,
  PRIMARY KEY (performance_report_id),
  FOREIGN KEY (instance_id) REFERENCES database_instances (instance_id),
  FOREIGN KEY (d_b_a_id) REFERENCES d_b_as (d_b_a_id)
);

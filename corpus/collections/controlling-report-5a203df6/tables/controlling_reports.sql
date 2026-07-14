CREATE TABLE controlling_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_name VARCHAR(32),
  report_type VARCHAR(32),
  creation_date TIMESTAMP,
  status VARCHAR(32),
  layout_format VARCHAR(32),
  process_id VARCHAR(44),
  business_segment_id INTEGER,
  user_id VARCHAR(44),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (process_id) REFERENCES business_processes (process_id),
  FOREIGN KEY (business_segment_id) REFERENCES business_segments (id),
  FOREIGN KEY (user_id) REFERENCES controlling_users (user_id)
);

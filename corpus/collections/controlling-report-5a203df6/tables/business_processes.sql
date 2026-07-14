CREATE TABLE business_processes (
  process_id VARCHAR(44) NOT NULL,
  process_name VARCHAR(32),
  process_category VARCHAR(32),
  is_automated BOOLEAN,
  execution_frequency VARCHAR(32),
  controlling_report_id INTEGER,
  business_segment_id INTEGER,
  user_id VARCHAR(44),
  PRIMARY KEY (process_id),
  FOREIGN KEY (controlling_report_id) REFERENCES controlling_reports (id),
  FOREIGN KEY (business_segment_id) REFERENCES business_segments (id),
  FOREIGN KEY (user_id) REFERENCES controlling_users (user_id)
);

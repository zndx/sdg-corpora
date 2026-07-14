CREATE TABLE project_reports (
  project_report_id INTEGER NOT NULL,
  report_identifier VARCHAR(32),
  title VARCHAR(32),
  publication_date TIMESTAMP,
  status VARCHAR(32),
  word_count INTEGER,
  contains_insights BOOLEAN,
  world_caf_event_id INTEGER,
  security_project_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (project_report_id),
  FOREIGN KEY (world_caf_event_id) REFERENCES world_caf_events (id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id)
);

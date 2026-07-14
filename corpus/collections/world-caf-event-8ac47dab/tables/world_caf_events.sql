CREATE TABLE world_caf_events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  event_date TIMESTAMP,
  location VARCHAR(32),
  status VARCHAR(32),
  duration_minutes INTEGER,
  participant_count INTEGER,
  moderator_count INTEGER,
  break_count INTEGER,
  security_project_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (security_project_id) REFERENCES security_projects (id)
);

CREATE TABLE networking_sessions (
  id INTEGER NOT NULL,
  session_id VARCHAR(44),
  session_name VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  location VARCHAR(32),
  is_mandatory BOOLEAN,
  major_event_id INTEGER,
  sponsoring_organization_org_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (major_event_id) REFERENCES major_events (id),
  FOREIGN KEY (sponsoring_organization_org_id) REFERENCES sponsoring_organizations (org_id)
);

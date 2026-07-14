CREATE TABLE geographic_regions (
  id INTEGER NOT NULL,
  region_identifier VARCHAR(32),
  region_name VARCHAR(32),
  region_type VARCHAR(32),
  hurricane_vulnerability BOOLEAN,
  webinar_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id)
);

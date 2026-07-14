CREATE TABLE monitoring_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_timestamp TIMESTAMP,
  event_type VARCHAR(32),
  severity VARCHAR(32),
  description VARCHAR(32),
  resolved BOOLEAN,
  resolution_time TIMESTAMP,
  surveillance_site_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);

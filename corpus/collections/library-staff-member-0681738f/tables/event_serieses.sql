CREATE TABLE event_serieses (
  id INTEGER NOT NULL,
  series_id VARCHAR(32),
  series_name VARCHAR(32),
  frequency VARCHAR(32),
  library_event_id INTEGER,
  library_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (library_event_id) REFERENCES library_events (id),
  FOREIGN KEY (library_id) REFERENCES libraries (id)
);

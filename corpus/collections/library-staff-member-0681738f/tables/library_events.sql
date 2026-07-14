CREATE TABLE library_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  event_time VARCHAR(32),
  location VARCHAR(32),
  series_name VARCHAR(32),
  library_id INTEGER,
  external_speaker_id INTEGER,
  event_series_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (library_id) REFERENCES libraries (id),
  FOREIGN KEY (external_speaker_id) REFERENCES external_speakers (external_speaker_id),
  FOREIGN KEY (event_series_id) REFERENCES event_serieses (id)
);

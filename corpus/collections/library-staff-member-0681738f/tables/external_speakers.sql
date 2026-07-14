CREATE TABLE external_speakers (
  external_speaker_id INTEGER NOT NULL,
  speaker_id INTEGER,
  full_name VARCHAR(36),
  affiliation VARCHAR(32),
  expertise VARCHAR(32),
  library_event_id INTEGER,
  PRIMARY KEY (external_speaker_id),
  FOREIGN KEY (library_event_id) REFERENCES library_events (id)
);

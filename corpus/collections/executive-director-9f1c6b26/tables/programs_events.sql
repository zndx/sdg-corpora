CREATE TABLE programs_events (
  program_id INTEGER NOT NULL,
  event_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (program_id, event_id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id),
  FOREIGN KEY (event_id) REFERENCES events (event_id)
);

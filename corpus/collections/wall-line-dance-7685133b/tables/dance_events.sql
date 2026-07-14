CREATE TABLE dance_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_date DATE,
  location VARCHAR(32),
  competition_level VARCHAR(32),
  participant_count INTEGER,
  wall_line_dance_id INTEGER,
  venue_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (wall_line_dance_id) REFERENCES wall_line_dances (id),
  FOREIGN KEY (venue_id) REFERENCES venues (venue_id)
);

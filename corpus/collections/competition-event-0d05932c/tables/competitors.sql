CREATE TABLE competitors (
  competitor_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  apprentice_level VARCHAR(32),
  registration_status VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  competition_event_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (competitor_id),
  FOREIGN KEY (competition_event_id) REFERENCES competition_events (competition_event_id)
);

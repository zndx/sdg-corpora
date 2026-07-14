CREATE TABLE competition_events (
  competition_event_id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_title VARCHAR(32),
  event_year INTEGER,
  event_status VARCHAR(32),
  registration_deadline TIMESTAMP,
  total_score_weight DECIMAL,
  PRIMARY KEY (competition_event_id)
);

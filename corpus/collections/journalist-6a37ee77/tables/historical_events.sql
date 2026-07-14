CREATE TABLE historical_events (
  id INTEGER NOT NULL,
  event_name VARCHAR(32),
  event_date DATE,
  location VARCHAR(32),
  event_category VARCHAR(32),
  is_verified BOOLEAN,
  broadcast_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (broadcast_program_id) REFERENCES broadcast_programs (broadcast_program_id)
);

CREATE TABLE captains (
  captain_id INTEGER NOT NULL,
  license_number VARCHAR(32),
  years_experience INTEGER,
  current_status VARCHAR(32),
  sailboat_id INTEGER,
  sailing_event_id INTEGER,
  PRIMARY KEY (captain_id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id),
  FOREIGN KEY (sailing_event_id) REFERENCES sailing_events (id)
);

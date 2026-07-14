CREATE TABLE sailing_events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_date TIMESTAMP,
  event_type VARCHAR(32),
  status VARCHAR(32),
  max_capacity INTEGER,
  actual_participants INTEGER,
  captain_id INTEGER,
  sailboat_id INTEGER,
  dock_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (captain_id) REFERENCES captains (captain_id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id),
  FOREIGN KEY (dock_id) REFERENCES docks (id)
);

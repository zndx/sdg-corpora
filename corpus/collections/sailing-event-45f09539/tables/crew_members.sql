CREATE TABLE crew_members (
  id INTEGER NOT NULL,
  crew_id VARCHAR(35),
  pfd_required BOOLEAN,
  pfd_worn BOOLEAN,
  role VARCHAR(32),
  sailing_event_id INTEGER,
  sailboat_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sailing_event_id) REFERENCES sailing_events (id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id)
);

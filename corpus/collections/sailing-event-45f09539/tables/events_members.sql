CREATE TABLE events_members (
  sailing_event_id INTEGER NOT NULL,
  crew_member_id INTEGER NOT NULL,
  PRIMARY KEY (sailing_event_id, crew_member_id),
  FOREIGN KEY (sailing_event_id) REFERENCES sailing_events (id),
  FOREIGN KEY (crew_member_id) REFERENCES crew_members (id)
);

CREATE TABLE broadcast_programs (
  broadcast_program_id INTEGER NOT NULL,
  program_title VARCHAR(32),
  broadcast_date TIMESTAMP,
  network VARCHAR(32),
  duration_minutes INTEGER,
  is_documentary BOOLEAN,
  director_name VARCHAR(32),
  premiere_venue VARCHAR(32),
  news_organization_id INTEGER,
  journalist_id INTEGER,
  historical_event_id INTEGER,
  PRIMARY KEY (broadcast_program_id),
  FOREIGN KEY (news_organization_id) REFERENCES news_organizations (id),
  FOREIGN KEY (journalist_id) REFERENCES journalists (journalist_id),
  FOREIGN KEY (historical_event_id) REFERENCES historical_events (id)
);

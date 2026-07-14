CREATE TABLE journalists (
  journalist_id INTEGER NOT NULL,
  callsign VARCHAR(32),
  birth_date DATE,
  death_date DATE,
  birth_place VARCHAR(32),
  education_institution VARCHAR(32),
  primary_employer VARCHAR(33),
  is_retired BOOLEAN,
  news_organization_id INTEGER,
  historical_event_id INTEGER,
  PRIMARY KEY (journalist_id),
  FOREIGN KEY (news_organization_id) REFERENCES news_organizations (id),
  FOREIGN KEY (historical_event_id) REFERENCES historical_events (id)
);

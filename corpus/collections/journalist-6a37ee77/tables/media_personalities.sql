CREATE TABLE media_personalities (
  media_personality_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  callsign VARCHAR(32),
  recognition_title VARCHAR(32),
  years_active INTEGER,
  is_retired BOOLEAN,
  news_organization_id INTEGER,
  historical_event_id INTEGER,
  PRIMARY KEY (media_personality_id),
  FOREIGN KEY (news_organization_id) REFERENCES news_organizations (id),
  FOREIGN KEY (historical_event_id) REFERENCES historical_events (id)
);

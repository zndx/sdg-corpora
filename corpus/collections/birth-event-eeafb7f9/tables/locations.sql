CREATE TABLE locations (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  description VARCHAR(32),
  birth_event_id INTEGER,
  human_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (birth_event_id) REFERENCES birth_events (birth_event_id),
  FOREIGN KEY (human_id) REFERENCES humans (id)
);

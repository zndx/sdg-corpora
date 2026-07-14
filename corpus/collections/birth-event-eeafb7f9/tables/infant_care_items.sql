CREATE TABLE infant_care_items (
  id INTEGER NOT NULL,
  item_type VARCHAR(32),
  material VARCHAR(32),
  condition VARCHAR(32),
  birth_event_id INTEGER,
  location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (birth_event_id) REFERENCES birth_events (birth_event_id),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE locations (
  id INTEGER NOT NULL,
  location_id INTEGER,
  name VARCHAR(32),
  type VARCHAR(32),
  has_slide BOOLEAN,
  water_temperature DECIMAL,
  is_indoor BOOLEAN,
  event_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES social_interaction_events (event_id)
);

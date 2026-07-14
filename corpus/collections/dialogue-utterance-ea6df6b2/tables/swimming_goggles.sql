CREATE TABLE swimming_goggles (
  goggle_id VARCHAR(44) NOT NULL,
  brand VARCHAR(40),
  price DECIMAL,
  comfort_level VARCHAR(32),
  causes_eye_irritation BOOLEAN,
  purchase_date DATE,
  character_id VARCHAR(44),
  event_id VARCHAR(44),
  location_id INTEGER,
  PRIMARY KEY (goggle_id),
  FOREIGN KEY (character_id) REFERENCES characters (character_id),
  FOREIGN KEY (event_id) REFERENCES social_interaction_events (event_id),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);

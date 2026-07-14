CREATE TABLE events_characters (
  event_id VARCHAR(44) NOT NULL,
  character_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (event_id, character_id),
  FOREIGN KEY (event_id) REFERENCES social_interaction_events (event_id),
  FOREIGN KEY (character_id) REFERENCES characters (character_id)
);

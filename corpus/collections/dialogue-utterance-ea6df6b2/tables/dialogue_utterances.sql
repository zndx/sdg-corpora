CREATE TABLE dialogue_utterances (
  id INTEGER NOT NULL,
  utterance_id VARCHAR(44),
  quoted_text VARCHAR(32),
  speaker_name VARCHAR(32),
  timestamp TIMESTAMP,
  is_internal_thought BOOLEAN,
  vocalization_mode VARCHAR(32),
  character_id VARCHAR(44),
  event_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (character_id) REFERENCES characters (character_id),
  FOREIGN KEY (event_id) REFERENCES social_interaction_events (event_id)
);

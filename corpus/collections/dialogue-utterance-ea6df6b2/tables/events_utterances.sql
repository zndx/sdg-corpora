CREATE TABLE events_utterances (
  event_id VARCHAR(44) NOT NULL,
  dialogue_utterance_id INTEGER NOT NULL,
  PRIMARY KEY (event_id, dialogue_utterance_id),
  FOREIGN KEY (event_id) REFERENCES social_interaction_events (event_id),
  FOREIGN KEY (dialogue_utterance_id) REFERENCES dialogue_utterances (id)
);

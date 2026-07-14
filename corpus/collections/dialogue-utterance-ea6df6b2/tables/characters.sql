CREATE TABLE characters (
  character_id VARCHAR(44) NOT NULL,
  full_name VARCHAR(36),
  age_group VARCHAR(32),
  gender VARCHAR(32),
  has_goggles BOOLEAN,
  swimming_ability VARCHAR(32),
  dialogue_utterance_id INTEGER,
  interacts_with_character_id VARCHAR(44),
  goggle_id VARCHAR(44),
  PRIMARY KEY (character_id),
  FOREIGN KEY (dialogue_utterance_id) REFERENCES dialogue_utterances (id),
  FOREIGN KEY (interacts_with_character_id) REFERENCES characters (character_id),
  FOREIGN KEY (goggle_id) REFERENCES swimming_goggles (goggle_id)
);

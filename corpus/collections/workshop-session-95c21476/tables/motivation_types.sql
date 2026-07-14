CREATE TABLE motivation_types (
  id INTEGER NOT NULL,
  motivation_id VARCHAR(44),
  motivation_category VARCHAR(32),
  intensity DECIMAL,
  trigger_source VARCHAR(32),
  is_sustainable BOOLEAN,
  participant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);

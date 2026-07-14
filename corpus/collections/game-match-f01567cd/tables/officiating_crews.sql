CREATE TABLE officiating_crews (
  id INTEGER NOT NULL,
  crew_id VARCHAR(35),
  mechanics_manual_version VARCHAR(32),
  officials_count INTEGER,
  supervision_status VARCHAR(32),
  match_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (match_id) REFERENCES game_matches (match_id)
);

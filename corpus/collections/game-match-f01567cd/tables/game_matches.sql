CREATE TABLE game_matches (
  match_id INTEGER NOT NULL,
  start_date TIMESTAMP,
  status VARCHAR(32),
  home_team_id VARCHAR(32),
  away_team_id VARCHAR(32),
  venue_id VARCHAR(40),
  officials_count INTEGER,
  playing_field_id INTEGER,
  officiating_crew_id INTEGER,
  PRIMARY KEY (match_id),
  FOREIGN KEY (playing_field_id) REFERENCES playing_fields (id),
  FOREIGN KEY (officiating_crew_id) REFERENCES officiating_crews (id)
);

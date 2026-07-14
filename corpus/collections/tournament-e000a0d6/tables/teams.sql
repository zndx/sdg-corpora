CREATE TABLE teams (
  team_id VARCHAR(32) NOT NULL,
  team_name VARCHAR(32),
  country VARCHAR(32),
  captain_id INTEGER,
  has_captain_captain_id INTEGER,
  tournament_id INTEGER,
  PRIMARY KEY (team_id),
  FOREIGN KEY (has_captain_captain_id) REFERENCES team_captains (captain_id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
);

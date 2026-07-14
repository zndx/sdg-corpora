CREATE TABLE players (
  player_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  email_address VARCHAR(32),
  country_code VARCHAR(44),
  is_team_captain BOOLEAN,
  vacation_periods VARCHAR(32),
  total_time_used DECIMAL,
  accumulated_time DECIMAL,
  team_id VARCHAR(32),
  tournament_director_td_id INTEGER,
  team_captain_id INTEGER,
  PRIMARY KEY (player_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (team_captain_id) REFERENCES team_captains (id)
);

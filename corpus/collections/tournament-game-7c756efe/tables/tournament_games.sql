CREATE TABLE tournament_games (
  id INTEGER NOT NULL,
  game_id INTEGER,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  time_control VARCHAR(32),
  status VARCHAR(32),
  notation_agreement VARCHAR(32),
  transmission_mode VARCHAR(32),
  is_team_event BOOLEAN,
  tournament_director_td_id INTEGER,
  team_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (team_id) REFERENCES teams (team_id)
);

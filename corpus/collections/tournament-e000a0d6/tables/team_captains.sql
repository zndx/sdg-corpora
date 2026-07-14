CREATE TABLE team_captains (
  captain_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email VARCHAR(32),
  team_id VARCHAR(32),
  leads_team_team_id VARCHAR(32),
  tournament_director_td_id INTEGER,
  PRIMARY KEY (captain_id),
  FOREIGN KEY (leads_team_team_id) REFERENCES teams (team_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id)
);

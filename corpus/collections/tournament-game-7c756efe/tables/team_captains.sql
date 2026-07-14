CREATE TABLE team_captains (
  id INTEGER NOT NULL,
  captain_id INTEGER,
  full_name VARCHAR(36),
  email_address VARCHAR(32),
  team_id VARCHAR(32),
  notification_preference VARCHAR(32),
  represents_team_team_id VARCHAR(32),
  tournament_director_td_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (represents_team_team_id) REFERENCES teams (team_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id)
);

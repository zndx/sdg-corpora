CREATE TABLE directors_captains (
  tournament_director_td_id INTEGER NOT NULL,
  team_captain_id INTEGER NOT NULL,
  PRIMARY KEY (tournament_director_td_id, team_captain_id),
  FOREIGN KEY (tournament_director_td_id) REFERENCES tournament_directors (td_id),
  FOREIGN KEY (team_captain_id) REFERENCES team_captains (id)
);

CREATE TABLE shoo_team_resultsShooter (
  team_result_id INTEGER NOT NULL,
  shooter_id INTEGER NOT NULL,
  PRIMARY KEY (team_result_id, shooter_id),
  FOREIGN KEY (team_result_id) REFERENCES shoo_team_results (team_result_id),
  FOREIGN KEY (shooter_id) REFERENCES shoo_shooters (id)
);

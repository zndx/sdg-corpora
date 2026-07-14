CREATE TABLE teams_shooters (
  national_team_id INTEGER NOT NULL,
  shooter_id INTEGER NOT NULL,
  PRIMARY KEY (national_team_id, shooter_id),
  FOREIGN KEY (national_team_id) REFERENCES national_teams (id),
  FOREIGN KEY (shooter_id) REFERENCES shooters (id)
);

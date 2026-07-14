CREATE TABLE shooters (
  id INTEGER NOT NULL,
  shooter_id VARCHAR(35),
  full_name VARCHAR(36),
  nationality VARCHAR(32),
  is_olympic_champion BOOLEAN,
  national_team_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (national_team_id) REFERENCES national_teams (id)
);

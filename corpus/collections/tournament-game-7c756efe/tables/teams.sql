CREATE TABLE teams (
  team_id VARCHAR(32) NOT NULL,
  team_name VARCHAR(32),
  country_code VARCHAR(44),
  captain_id INTEGER,
  registration_date DATE,
  status VARCHAR(32),
  team_captain_id INTEGER,
  PRIMARY KEY (team_id),
  FOREIGN KEY (team_captain_id) REFERENCES team_captains (id)
);

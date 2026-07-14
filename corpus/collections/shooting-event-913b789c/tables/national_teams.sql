CREATE TABLE national_teams (
  id INTEGER NOT NULL,
  team_code VARCHAR(44),
  country_name VARCHAR(32),
  total_score INTEGER,
  team_rank INTEGER,
  team_medal VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);

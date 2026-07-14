CREATE TABLE shoo_team_results (
  team_result_id INTEGER NOT NULL,
  total_score INTEGER,
  rank INTEGER,
  medal VARCHAR(32),
  team_name VARCHAR(32),
  discipline_id INTEGER,
  event_id VARCHAR(35),
  PRIMARY KEY (team_result_id),
  FOREIGN KEY (discipline_id) REFERENCES shoo_disciplines (id),
  FOREIGN KEY (event_id) REFERENCES shoo_shooting_events (event_id)
);

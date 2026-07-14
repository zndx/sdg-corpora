CREATE TABLE tournaments (
  id INTEGER NOT NULL,
  tournament_id INTEGER,
  start_date DATE,
  end_date DATE,
  format VARCHAR(32),
  status VARCHAR(32),
  time_control VARCHAR(32),
  td_id INTEGER,
  captain_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (captain_id) REFERENCES team_captains (captain_id)
);

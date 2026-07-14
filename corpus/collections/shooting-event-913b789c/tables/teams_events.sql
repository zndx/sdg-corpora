CREATE TABLE teams_events (
  national_team_id INTEGER NOT NULL,
  shooting_event_id INTEGER NOT NULL,
  PRIMARY KEY (national_team_id, shooting_event_id),
  FOREIGN KEY (national_team_id) REFERENCES national_teams (id),
  FOREIGN KEY (shooting_event_id) REFERENCES shooting_events (id)
);

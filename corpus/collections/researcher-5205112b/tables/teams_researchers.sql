CREATE TABLE teams_researchers (
  research_team_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (research_team_id, researcher_id),
  FOREIGN KEY (research_team_id) REFERENCES research_teams (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id)
);

CREATE TABLE research_teams (
  id INTEGER NOT NULL,
  team_id VARCHAR(32),
  team_name VARCHAR(32),
  formation_region VARCHAR(32),
  is_formed_for_incubator BOOLEAN,
  research_idea_id INTEGER,
  event_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (research_idea_id) REFERENCES research_ideas (id),
  FOREIGN KEY (event_id) REFERENCES events (event_id)
);

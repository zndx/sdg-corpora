CREATE TABLE researchers (
  id INTEGER NOT NULL,
  researcher_id INTEGER,
  full_name VARCHAR(32),
  phd_award_date DATE,
  current_affiliation VARCHAR(32),
  email_address VARCHAR(32),
  is_selected_for_funding BOOLEAN,
  event_id VARCHAR(35),
  research_team_id INTEGER,
  research_idea_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (research_team_id) REFERENCES research_teams (id),
  FOREIGN KEY (research_idea_id) REFERENCES research_ideas (id)
);

CREATE TABLE research_ideas (
  id INTEGER NOT NULL,
  idea_id VARCHAR(44),
  idea_title VARCHAR(32),
  risk_level VARCHAR(32),
  is_selected_for_incubator BOOLEAN,
  is_selected_for_funding BOOLEAN,
  research_team_id INTEGER,
  research_theme_id INTEGER,
  challenge_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (research_team_id) REFERENCES research_teams (id),
  FOREIGN KEY (research_theme_id) REFERENCES research_themes (id),
  FOREIGN KEY (challenge_id) REFERENCES societal_challenges (challenge_id)
);

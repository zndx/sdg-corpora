CREATE TABLE research_themes (
  id INTEGER NOT NULL,
  theme_id VARCHAR(44),
  theme_name VARCHAR(32),
  is_disruptive BOOLEAN,
  is_interdisciplinary BOOLEAN,
  event_id VARCHAR(35),
  research_idea_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (research_idea_id) REFERENCES research_ideas (id)
);

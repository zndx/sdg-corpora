CREATE TABLE societal_challenges (
  challenge_id VARCHAR(44) NOT NULL,
  challenge_name VARCHAR(32),
  is_policy_relevant BOOLEAN,
  research_idea_id INTEGER,
  PRIMARY KEY (challenge_id),
  FOREIGN KEY (research_idea_id) REFERENCES research_ideas (id)
);

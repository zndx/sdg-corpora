CREATE TABLE project_proposals (
  id INTEGER NOT NULL,
  proposal_id VARCHAR(32),
  title VARCHAR(32),
  thematic_area VARCHAR(42),
  funding_program VARCHAR(32),
  status VARCHAR(32),
  submission_date DATE,
  event_id INTEGER,
  societal_challenge_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES events (id),
  FOREIGN KEY (societal_challenge_id) REFERENCES societal_challenges (societal_challenge_id)
);

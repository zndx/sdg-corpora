CREATE TABLE societal_challenges (
  societal_challenge_id INTEGER NOT NULL,
  challenge_id VARCHAR(44),
  challenge_name VARCHAR(48),
  project_proposal_id INTEGER,
  PRIMARY KEY (societal_challenge_id),
  FOREIGN KEY (project_proposal_id) REFERENCES project_proposals (id)
);

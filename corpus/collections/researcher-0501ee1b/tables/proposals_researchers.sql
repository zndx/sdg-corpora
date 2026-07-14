CREATE TABLE proposals_researchers (
  project_proposal_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (project_proposal_id, researcher_id),
  FOREIGN KEY (project_proposal_id) REFERENCES project_proposals (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id)
);

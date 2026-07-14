CREATE TABLE researchers (
  id INTEGER NOT NULL,
  researcher_id INTEGER,
  full_name VARCHAR(36),
  phd_award_date DATE,
  institution VARCHAR(32),
  discipline VARCHAR(32),
  is_selected BOOLEAN,
  project_proposal_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (project_proposal_id) REFERENCES project_proposals (id)
);

CREATE TABLE publications (
  id INTEGER NOT NULL,
  publication_identifier VARCHAR(32),
  title VARCHAR(32),
  publication_date DATE,
  publication_type VARCHAR(32),
  language VARCHAR(32),
  peer_reviewed BOOLEAN,
  journal_id INTEGER,
  research_project_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (journal_id) REFERENCES journals (id),
  FOREIGN KEY (research_project_id) REFERENCES research_projects (id)
);

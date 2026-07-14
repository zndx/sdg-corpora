CREATE TABLE journals_publications (
  journal_id INTEGER NOT NULL,
  publication_id INTEGER NOT NULL,
  PRIMARY KEY (journal_id, publication_id),
  FOREIGN KEY (journal_id) REFERENCES journals (id),
  FOREIGN KEY (publication_id) REFERENCES publications (id)
);

CREATE TABLE researchers_publications (
  researcher_id INTEGER NOT NULL,
  publication_id INTEGER NOT NULL,
  PRIMARY KEY (researcher_id, publication_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id),
  FOREIGN KEY (publication_id) REFERENCES publications (id)
);

CREATE TABLE publications_researchers (
  publication_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (publication_id, researcher_id),
  FOREIGN KEY (publication_id) REFERENCES publications (id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id)
);

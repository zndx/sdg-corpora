CREATE TABLE researchers_researchers (
  researcher_id INTEGER NOT NULL,
  collaborates_with_researcher_id INTEGER NOT NULL,
  PRIMARY KEY (researcher_id, collaborates_with_researcher_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (id),
  FOREIGN KEY (collaborates_with_researcher_id) REFERENCES researchers (id)
);

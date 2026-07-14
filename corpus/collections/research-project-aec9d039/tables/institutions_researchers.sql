CREATE TABLE institutions_researchers (
  institution_id INTEGER NOT NULL,
  researcher_id INTEGER NOT NULL,
  PRIMARY KEY (institution_id, researcher_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id),
  FOREIGN KEY (researcher_id) REFERENCES researchers (researcher_id)
);

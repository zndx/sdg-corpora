CREATE TABLE textbooks_concepts (
  textbook_id INTEGER NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (textbook_id, mathematical_concept_id),
  FOREIGN KEY (textbook_id) REFERENCES textbooks (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

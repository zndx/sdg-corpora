CREATE TABLE examples_concepts (
  computational_example_id INTEGER NOT NULL,
  concept_id INTEGER NOT NULL,
  PRIMARY KEY (computational_example_id, concept_id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id),
  FOREIGN KEY (concept_id) REFERENCES mathematical_concepts (concept_id)
);

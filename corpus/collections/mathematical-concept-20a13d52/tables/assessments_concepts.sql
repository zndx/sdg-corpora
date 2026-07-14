CREATE TABLE assessments_concepts (
  assessment_id INTEGER NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (assessment_id, mathematical_concept_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

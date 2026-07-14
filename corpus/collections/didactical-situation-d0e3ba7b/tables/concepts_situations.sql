CREATE TABLE concepts_situations (
  mathematical_concept_id INTEGER NOT NULL,
  situation_id VARCHAR(35) NOT NULL,
  PRIMARY KEY (mathematical_concept_id, situation_id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id)
);

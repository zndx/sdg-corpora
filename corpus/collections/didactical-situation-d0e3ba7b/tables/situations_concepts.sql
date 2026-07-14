CREATE TABLE situations_concepts (
  situation_id VARCHAR(35) NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (situation_id, mathematical_concept_id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

CREATE TABLE mathematical_concepts (
  id INTEGER NOT NULL,
  concept_id INTEGER,
  name VARCHAR(32),
  domain VARCHAR(32),
  complexity_level INTEGER,
  prerequisite_concept_id VARCHAR(32),
  is_abstract BOOLEAN,
  mathematical_concept_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

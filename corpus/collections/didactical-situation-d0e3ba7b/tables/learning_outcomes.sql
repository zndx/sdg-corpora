CREATE TABLE learning_outcomes (
  id INTEGER NOT NULL,
  outcome_id VARCHAR(32),
  assessment_score DECIMAL,
  mastery_level VARCHAR(32),
  date_assessed DATE,
  is_achieved BOOLEAN,
  situation_id VARCHAR(35),
  mathematical_concept_id INTEGER,
  actor_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id),
  FOREIGN KEY (actor_id) REFERENCES educational_actors (actor_id)
);

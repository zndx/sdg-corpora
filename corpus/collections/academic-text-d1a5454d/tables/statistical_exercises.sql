CREATE TABLE statistical_exercises (
  id INTEGER NOT NULL,
  exercise_id VARCHAR(44),
  exercise_type VARCHAR(32),
  difficulty_level INTEGER,
  is_updated BOOLEAN,
  concept_covered VARCHAR(32),
  digital_platform_id INTEGER,
  statistical_concept_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (statistical_concept_id) REFERENCES statistical_concepts (statistical_concept_id)
);

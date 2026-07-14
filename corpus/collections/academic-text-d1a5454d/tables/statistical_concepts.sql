CREATE TABLE statistical_concepts (
  statistical_concept_id INTEGER NOT NULL,
  concept_id INTEGER,
  concept_name VARCHAR(32),
  category VARCHAR(32),
  is_core BOOLEAN,
  statistical_exercise_id INTEGER,
  PRIMARY KEY (statistical_concept_id),
  FOREIGN KEY (statistical_exercise_id) REFERENCES statistical_exercises (id)
);

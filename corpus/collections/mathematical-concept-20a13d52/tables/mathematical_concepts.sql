CREATE TABLE mathematical_concepts (
  id INTEGER NOT NULL,
  concept_id INTEGER,
  concept_name VARCHAR(32),
  concept_type VARCHAR(32),
  difficulty_level INTEGER,
  prerequisite_concept_id VARCHAR(32),
  mathematical_concept_id INTEGER,
  course_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);

CREATE TABLE mathematical_concepts (
  concept_id INTEGER NOT NULL,
  name VARCHAR(32),
  category VARCHAR(32),
  complexity_level INTEGER,
  prerequisite_concepts VARCHAR(32),
  computational_example_id INTEGER,
  lecture_session_id INTEGER,
  PRIMARY KEY (concept_id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id),
  FOREIGN KEY (lecture_session_id) REFERENCES lecture_sessions (id)
);

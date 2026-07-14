CREATE TABLE problem_solving_processes (
  problem_solving_process_id INTEGER NOT NULL,
  process_id VARCHAR(44),
  step_number INTEGER,
  step_description VARCHAR(32),
  is_mandatory BOOLEAN,
  course_id INTEGER,
  mathematical_concept_id INTEGER,
  PRIMARY KEY (problem_solving_process_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

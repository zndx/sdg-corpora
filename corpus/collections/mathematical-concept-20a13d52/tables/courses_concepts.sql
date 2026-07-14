CREATE TABLE courses_concepts (
  course_id INTEGER NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, mathematical_concept_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

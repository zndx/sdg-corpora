CREATE TABLE students_concepts (
  student_id INTEGER NOT NULL,
  mathematical_concept_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, mathematical_concept_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (mathematical_concept_id) REFERENCES mathematical_concepts (id)
);

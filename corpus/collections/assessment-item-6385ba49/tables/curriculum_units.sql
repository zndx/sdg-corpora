CREATE TABLE curriculum_units (
  id INTEGER NOT NULL,
  unit_id VARCHAR(44),
  title VARCHAR(32),
  unit_number INTEGER,
  duration_hours DECIMAL,
  learning_outcomes VARCHAR(32),
  subject_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);

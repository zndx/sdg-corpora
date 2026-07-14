CREATE TABLE subjects_units (
  subject_id INTEGER NOT NULL,
  curriculum_unit_id INTEGER NOT NULL,
  PRIMARY KEY (subject_id, curriculum_unit_id),
  FOREIGN KEY (subject_id) REFERENCES subjects (subject_id),
  FOREIGN KEY (curriculum_unit_id) REFERENCES curriculum_units (id)
);

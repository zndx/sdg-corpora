CREATE TABLE concepts (
  id INTEGER NOT NULL,
  concept_id INTEGER,
  name VARCHAR(32),
  category VARCHAR(32),
  difficulty_level VARCHAR(32),
  description VARCHAR(32),
  curriculum_unit_id INTEGER,
  assessment_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (curriculum_unit_id) REFERENCES curriculum_units (id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id)
);

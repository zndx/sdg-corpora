CREATE TABLE units_concepts (
  curriculum_unit_id INTEGER NOT NULL,
  concept_id INTEGER NOT NULL,
  PRIMARY KEY (curriculum_unit_id, concept_id),
  FOREIGN KEY (curriculum_unit_id) REFERENCES curriculum_units (id),
  FOREIGN KEY (concept_id) REFERENCES concepts (id)
);

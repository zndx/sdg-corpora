CREATE TABLE concepts (
  concept_id INTEGER NOT NULL,
  concept_name VARCHAR(32),
  domain_category VARCHAR(32),
  definition_text VARCHAR(32),
  complexity_level VARCHAR(32),
  assessment_item_id INTEGER,
  source_material_id INTEGER,
  PRIMARY KEY (concept_id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id),
  FOREIGN KEY (source_material_id) REFERENCES source_materials (id)
);

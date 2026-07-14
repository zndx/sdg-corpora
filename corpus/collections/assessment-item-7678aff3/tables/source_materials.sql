CREATE TABLE source_materials (
  id INTEGER NOT NULL,
  title VARCHAR(32),
  publisher VARCHAR(32),
  unit_number VARCHAR(32),
  chapter_number VARCHAR(32),
  page_reference INTEGER,
  material_type VARCHAR(32),
  assessment_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id)
);

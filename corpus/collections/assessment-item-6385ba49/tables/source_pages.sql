CREATE TABLE source_pages (
  page_id VARCHAR(32) NOT NULL,
  page_number INTEGER,
  unit_number INTEGER,
  chapter_number INTEGER,
  content_snippet VARCHAR(32),
  source_material_id INTEGER,
  concept_id INTEGER,
  PRIMARY KEY (page_id),
  FOREIGN KEY (source_material_id) REFERENCES source_materials (id),
  FOREIGN KEY (concept_id) REFERENCES concepts (id)
);

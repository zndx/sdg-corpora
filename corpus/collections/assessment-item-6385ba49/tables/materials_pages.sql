CREATE TABLE materials_pages (
  source_material_id INTEGER NOT NULL,
  page_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (source_material_id, page_id),
  FOREIGN KEY (source_material_id) REFERENCES source_materials (id),
  FOREIGN KEY (page_id) REFERENCES source_pages (page_id)
);

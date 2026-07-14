CREATE TABLE source_materials (
  id INTEGER NOT NULL,
  material_id VARCHAR(44),
  title VARCHAR(32),
  publisher VARCHAR(32),
  edition VARCHAR(32),
  isbn VARCHAR(32),
  publication_year INTEGER,
  format VARCHAR(32),
  PRIMARY KEY (id)
);

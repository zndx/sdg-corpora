CREATE TABLE connective_tissues (
  id INTEGER NOT NULL,
  tissue_id VARCHAR(32),
  tissue_type VARCHAR(32),
  is_degenerated BOOLEAN,
  has_collagen_sheets BOOLEAN,
  ganglion_cyst_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ganglion_cyst_id) REFERENCES ganglion_cysts (id)
);

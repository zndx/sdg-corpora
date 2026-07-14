CREATE TABLE pathological_analysises (
  id INTEGER NOT NULL,
  analysis_id VARCHAR(32),
  analysis_date TIMESTAMP,
  staining_method VARCHAR(32),
  has_collagen_sheets BOOLEAN,
  has_fibroblasts BOOLEAN,
  has_mesenchymal_cells BOOLEAN,
  has_necrosis BOOLEAN,
  has_inflammatory_changes BOOLEAN,
  pathological_specimen_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (pathological_specimen_id) REFERENCES pathological_specimens (id)
);

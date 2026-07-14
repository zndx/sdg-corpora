CREATE TABLE pathological_specimens (
  id INTEGER NOT NULL,
  specimen_id VARCHAR(44),
  collection_date TIMESTAMP,
  is_multilobulated BOOLEAN,
  has_mucinous_fluid BOOLEAN,
  has_synovial_epithelium BOOLEAN,
  has_fibro_connective_tissue BOOLEAN,
  ganglion_cyst_id INTEGER,
  pathological_analysis_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ganglion_cyst_id) REFERENCES ganglion_cysts (id),
  FOREIGN KEY (pathological_analysis_id) REFERENCES pathological_analysises (id)
);

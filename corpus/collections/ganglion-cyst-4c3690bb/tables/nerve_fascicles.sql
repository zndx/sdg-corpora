CREATE TABLE nerve_fascicles (
  nerve_fascicle_id INTEGER NOT NULL,
  nerve_id VARCHAR(32),
  nerve_name VARCHAR(32),
  is_compressed BOOLEAN,
  has_paresthesia BOOLEAN,
  has_weakness BOOLEAN,
  has_atrophy BOOLEAN,
  ganglion_cyst_id INTEGER,
  PRIMARY KEY (nerve_fascicle_id),
  FOREIGN KEY (ganglion_cyst_id) REFERENCES ganglion_cysts (id)
);

CREATE TABLE anatomical_regions (
  id INTEGER NOT NULL,
  region_id VARCHAR(44),
  region_name VARCHAR(32),
  is_subchondral BOOLEAN,
  is_near_joint BOOLEAN,
  is_near_tendon_sheath BOOLEAN,
  ganglion_cyst_id INTEGER,
  nerve_fascicle_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ganglion_cyst_id) REFERENCES ganglion_cysts (id),
  FOREIGN KEY (nerve_fascicle_id) REFERENCES nerve_fascicles (nerve_fascicle_id)
);

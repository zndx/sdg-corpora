CREATE TABLE ganglion_cysts (
  id INTEGER NOT NULL,
  cyst_id VARCHAR(44),
  diameter_cm DECIMAL,
  is_multilocular BOOLEAN,
  cyst_location VARCHAR(32),
  cyst_type VARCHAR(32),
  contains_mucinous_fluid BOOLEAN,
  has_synovial_lining BOOLEAN,
  anatomical_region_id INTEGER,
  connective_tissue_id INTEGER,
  nerve_fascicle_id INTEGER,
  imaging_study_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (anatomical_region_id) REFERENCES anatomical_regions (id),
  FOREIGN KEY (connective_tissue_id) REFERENCES connective_tissues (id),
  FOREIGN KEY (nerve_fascicle_id) REFERENCES nerve_fascicles (nerve_fascicle_id),
  FOREIGN KEY (imaging_study_id) REFERENCES imaging_studies (id)
);

CREATE TABLE crop_specieses (
  id INTEGER NOT NULL,
  scientific_name VARCHAR(32),
  crop_type VARCHAR(32),
  growth_region VARCHAR(32),
  is_host_for_striga BOOLEAN,
  is_host_for_rhamphicarpa BOOLEAN,
  parasitic_weed_species_id INTEGER,
  field_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (parasitic_weed_species_id) REFERENCES parasitic_weed_specieses (id),
  FOREIGN KEY (field_id) REFERENCES agricultural_fields (field_id)
);

CREATE TABLE agricultural_fields (
  field_id VARCHAR(44) NOT NULL,
  landscape_position VARCHAR(32),
  soil_drainage VARCHAR(32),
  soil_moisture_level VARCHAR(32),
  primary_crop VARCHAR(32),
  affected_households INTEGER,
  crop_species_id INTEGER,
  parasitic_weed_species_id INTEGER,
  geographic_region_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (field_id),
  FOREIGN KEY (crop_species_id) REFERENCES crop_specieses (id),
  FOREIGN KEY (parasitic_weed_species_id) REFERENCES parasitic_weed_specieses (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id)
);

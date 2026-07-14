CREATE TABLE specieses_specieses (
  parasitic_weed_species_id INTEGER NOT NULL,
  crop_species_id INTEGER NOT NULL,
  PRIMARY KEY (parasitic_weed_species_id, crop_species_id),
  FOREIGN KEY (parasitic_weed_species_id) REFERENCES parasitic_weed_specieses (id),
  FOREIGN KEY (crop_species_id) REFERENCES crop_specieses (id)
);

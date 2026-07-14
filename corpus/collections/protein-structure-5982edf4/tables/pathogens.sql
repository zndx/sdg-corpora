CREATE TABLE pathogens (
  pathogen_id INTEGER NOT NULL,
  scientific_name VARCHAR(32),
  common_name VARCHAR(32),
  host_plant VARCHAR(32),
  disease_name VARCHAR(32),
  geographic_distribution VARCHAR(32),
  crop_plant_id INTEGER,
  protein_id INTEGER,
  PRIMARY KEY (pathogen_id),
  FOREIGN KEY (crop_plant_id) REFERENCES crop_plants (id),
  FOREIGN KEY (protein_id) REFERENCES proteins (protein_id)
);

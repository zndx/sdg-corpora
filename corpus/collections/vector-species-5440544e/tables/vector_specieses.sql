CREATE TABLE vector_specieses (
  id INTEGER NOT NULL,
  species_code VARCHAR(32),
  common_name VARCHAR(32),
  is_primary_vector BOOLEAN,
  breeding_preference VARCHAR(32),
  is_urban_adapted BOOLEAN,
  pathogen_id INTEGER,
  surveillance_site_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);

CREATE TABLE pathogens (
  id INTEGER NOT NULL,
  pathogen_code VARCHAR(35),
  disease_name VARCHAR(32),
  severity_level VARCHAR(32),
  is_endemic BOOLEAN,
  circulating_strain VARCHAR(32),
  vector_species_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vector_species_id) REFERENCES vector_specieses (id)
);

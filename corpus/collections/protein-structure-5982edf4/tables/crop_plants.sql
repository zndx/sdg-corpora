CREATE TABLE crop_plants (
  id INTEGER NOT NULL,
  plant_id VARCHAR(37),
  species_name VARCHAR(32),
  variety VARCHAR(32),
  growth_stage VARCHAR(32),
  stress_tolerance_level DECIMAL,
  yield_metric DECIMAL,
  pathogen_id INTEGER,
  small_molecule_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (pathogen_id),
  FOREIGN KEY (small_molecule_id) REFERENCES small_molecules (id)
);

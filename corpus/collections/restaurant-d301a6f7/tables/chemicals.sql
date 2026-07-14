CREATE TABLE chemicals (
  id INTEGER NOT NULL,
  chemical_id INTEGER,
  name VARCHAR(32),
  location_in_wine VARCHAR(32),
  biological_effect VARCHAR(33),
  tested_on_organism VARCHAR(32),
  wine_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (wine_id) REFERENCES wines (wine_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);

CREATE TABLE historical_regions (
  id INTEGER NOT NULL,
  region_name VARCHAR(32),
  geographical_bounds VARCHAR(32),
  dominant_culture VARCHAR(32),
  slavic_influence_level VARCHAR(32),
  historical_period VARCHAR(32),
  epigraphic_inscription_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (epigraphic_inscription_id) REFERENCES epigraphic_inscriptions (epigraphic_inscription_id)
);
